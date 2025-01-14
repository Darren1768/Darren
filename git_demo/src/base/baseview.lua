-- --------------------------------------------------------------------
-- @description:
--      所有窗体的基类，必须要继承与他
--
-- --------------------------------------------------------------------
BaseView = BaseView or BaseClass(CommonUI)

WinType = {
    Tips = 1,
    Mini = 2,--下层不隐藏
    Big = 3,--下层隐藏
    Full = 4,--一级ui
    Full_SHOW_BOTTOM = 5,--一级ui,mainui底部icon组不隐藏
}

--一级面板下面的按钮颜色
CommonButton_Color = {
    [1] = cc.c4b(0xF7,0xDD,0xC8,0xff), --默认
    [2] = cc.c4b(0xfe,0xf1,0xea,0xff), --点击
}

ButtonType = ButtonType or 
{
    red = 0,         
    yellow = 1,  
    red_big = 2,   
    yellow_big = 3, 
    red_mid = 4,    
    yellow_mid = 5,       
}

--保存不是tips的其他 win
BaseView.winMap = {}
--保存tips的map 
BaseView.winTipsMap = {}

local ANIMATION_UI_START		= "ui_start"	                -- ui文件进场动作
local ANIMATION_UI_END			= "ui_end"		                -- ui退场动作
local UI_START_FRAME			= "start_frame"	                -- 进场后的帧事件
local UI_END_FRAME				= "end_frame"			        -- 退场结束帧事件

function BaseView:__init()
    self.view_tag				= ViewMgrTag.WIN_TAG        	-- 父级层次
    self.layout_name			= nil                       	-- csb文件路径,如果有值,则表示是csb文件,不用判断createWnd
    self.is_use_csb				= true							-- 是否是使用csb创建窗体
    self.anim_vo_list			= {}					    	-- 保存csb文件上的动画
    self.is_exist_ui_end		= false			            	-- 是否存在退场动作，
    self.load_callback			= nil                       	-- 显示完成之后
    self.root				= nil                       	    -- UI lua节点
    self.root_wnd				= nil                       	-- 根节点
    self.parent_wnd				= nil                       	-- 界面存放的父节点
    self.is_csb_action          = nil                           -- 是否使用csb那边的动画

    self.is_before_battle 		= false							-- 是否是在战斗之前就打开的，因为可能在战斗中会打开其他窗体这个时候的处理

    self.background_path		= nil							-- 背景资源路径

    self.show_close_btn			= true  							-- 是否显示关闭按钮
    self.show_background		= true  							-- 是否显示背景
 
    self.show_bird              = false                              -- 是否显示鸟

    self.click_dark_backgroud			= true 							-- 是否点击背景

    --状态
    self.is_load_finish			= false
    self.is_loading				= false
    self.is_opening				= false
    self.is_visible				= false

    self.title_str				= nil                        	-- 标题
    self.title_sprite           = nil                           -- res 

    self.tab_info_list			= {}                        	-- 如果这个有列表,则表示这个面板是标签页{label="aaaa", index=1, status=true} 
    self.tab_max				= 4                         	-- 当前面板
    self.is_mini_view              = false                      -- 是否使用common_window_tab,毕竟隐藏tab
    --回调
    self.open_callback			= nil
    self.close_callback			= nil
    self.action_callback		= nil
    self.win_type				= WinType.Full              	-- 其他窗口打开模式为3

    -- 新增资源管理F
    self.res_list				= {}                        	-- 该窗体关联的资源，{{path="", type=ResourcesType}, ...} 结构
    self.is_start_to_load		= false
    self.open_params			= nil

    self.base_view_event_list 	= {}							-- 统一事件列表,方便移除

    -- 是否显示mainui顶部功能图标
    self.is_show_func_icon = 0
end

--==============================--
--desc:打开窗体的唯一入口，这里负责资源加载引用，
--@args:
--@return 
--==============================--
function BaseView:open(...)
    if not tolua.isnull(self.root_wnd) then
        self:setCommonUIZOrder(self.root_wnd)
        if self:getVisible() == false then
            self:setVisible(true)
            -- self:needHideMainScene()
        end
    else
        if self.is_start_to_load == false then
            self.is_start_to_load = true
            self.open_params = {...}
            
            if not self.tab_info_list or next(self.tab_info_list) == nil then
                if self.layout_name == nil and self.is_use_csb == true then
                    if  self.background_path == nil then
                        self.background_path = PathTool.getSingleImgForDownLoad("bigbg","hl_guild", false)
                    end
                    table.insert(self.res_list, {path = self.background_path, type = ResourcesType.single})	
                end
            end

            if next(self.res_list) == nil then
                self:loadResListCompleted()
            else
                if self.resources_load == nil then
                    self.resources_load = ResourcesLoad.New(true) 
                end

                self.resources_load:addAllList(self.res_list, function()
                        self:loadResListCompleted()
                    end)
            end
        end
    end
end

--==============================--
--desc:加载资源完成
--@return 
--==============================--
function BaseView:loadResListCompleted()
    -- 构建窗体
    self:constructBaseView()

    --进场动效
    self:playEnterAnimatian()

    -- 缓存窗体数据
    self:openCacheView()

    -- ios打开窗体上报
    if MAKELIFEBETTER == true and ios_log_report then
        ios_log_report(self.layout_name)
    end
end

--==============================--
--desc:资源全部加载完成之后，这边开始构建窗体
--@return 
--==============================--
function BaseView:constructBaseView()
    self.is_opening = true
    self.is_visible = true
    if self:__getRootWnd() then	--不空，明已加面板了
        if self.open_callback then
            self:open_callback()
        end
        if not self:__getRootWnd():getParent() then
            self:attachParent()
        end
        self:setRootWndVisible(true)
        self:setCommonUIZOrder(self.root_wnd)
    else
        self:openOnlyReal()
    end
end

function BaseView:openOnlyReal()
    if self.is_loading then return end
    self.is_loading = true
    self:loadFiles()
end

function BaseView:loadFiles()
    if self.layout_name then
        self:initLayoutFile(self.layout_name)
    else
        if self["createRootWnd"] then
            self:createRootWnd()
        else
            if self.tab_info_list and next(self.tab_info_list) ~= nil then		-- 做了调整，如果是带标签页的必然是全屏的
                self:initLayoutFile("common/common_window_tab", true)
            elseif self.is_mini_view then		-- 做了调整，如果是带标签页的必然是全屏的
                self:initLayoutFile("common/common_window_tab", true)
            else
                self:initLayoutFile("common/common_window", true)
            end
        end
    end
    if not self:__getRootWnd() then return end
    --进场，离场注册
    self:registerNodeScriptHandler()

    --加入父节点
    self:attachParent()

    self:__getRootWnd():setVisible(self.is_visible)
    self:__getRootWnd():setAnchorPoint(cc.p(0.5, 0.5))
    self:__getRootWnd():setPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
    self.is_load_finish = true
    --有的话可以设置，置顶
    self:setCommonUIZOrder(self.root_wnd)

    --加载的回调，如果是选择，不可见的关闭，那么只会调用一次
    if self.load_callback then
        self:load_callback()
    end

    --这个回调基本每次调用open都会调用
    if self.is_opening then
        if self.open_callback then
            safeCallFunc(function() self:open_callback() end)
        end
        -- 设置中文文本内容
        setTextContentList(self.root_wnd, self.text_name_list)
        -- 是否有注册监听事件
        if self.register_event then
            self:register_event()
        end
        -- 如果有打开事件，那么就打开处理
        if self.openRootWnd then
            if self.open_params ~= nil and next(self.open_params) ~= nil then
                self:openRootWnd(unpack(self.open_params))
            else
                self:openRootWnd()
            end
            --专门为在初始化后.插更的方法 .目的减少初始化层面修改 导致插更的体积大小 
            if self.insertFunc then
                self:insertFunc()
            end
            self.is_start_to_load = false
        end
    end
    self.is_loading = false
end

--自适应 适配 只会针对 layout_ 格式 下的子节点进行适配，不是该格式下的不做适配
function BaseView:resetUiLayout(root_wnd)
    if not root_wnd then return end

    local children = root_wnd:getChildren()

    for i,v in ipairs(children) do
        local name = v:getName()

        if not self[name] then self[name] = v end

        local nodeTypeName = string.sub(name,1,6)
        if nodeTypeName == "layout" then autoUILayout(v) end

        self:traversingNode(v)
    end
end

function BaseView:traversingNode(node)
    local children = node:getChildren()
    for i, v in ipairs(children) do
        local name = v:getName()

        local nodeTypeName = string.sub(name,1,6)
        if nodeTypeName == "layout" then autoUILayout(v) end

        if not self[name] then self[name] = v end

        self:traversingNode(v)
    end
end

--==============================--
--desc:关闭面板
--@source:是自身关闭还是外界关闭
--@return 
--==============================--
function BaseView:close(source)
    if self.is_closeing then return end
    self.is_closeing = true
    if source ~= nil and type(source) == "boolean" then
        self.close_by_other = source
    end

    -- 移除当前的窗体,并且缓存窗体校验
    self:closeCacheView()
    if self.is_exist_ui_end then
        self:playExitAnimation()
    else
        self:closeInternal()
    end
end

function BaseView:closeInternal()
    if self.root_wnd and(not tolua.isnull(self.root_wnd)) then
        self.root_wnd:stopAllActions()
        self:setRootWndVisible(false)
    end
    self:__close()
    EventManager:getInstance():Fire(EventId.CLOSE_BASE_VIEW, self)
end

function BaseView:__close()
    if self.is_opening and self.close_callback then
        self:close_callback()
    end

    --根据模式来选择关闭的调用
    self:closeDestroy()

    self.is_opening = false
    self.is_closeing = false
end

function BaseView:openCacheView()
    if self.win_type ~= WinType.Tips then
        if #BaseView.winMap >= 12 then
            local topWin = table.remove(BaseView.winMap, 1)
            if topWin ~= nil then
                topWin:close()
                if topWin.next_win ~= nil then
                    topWin.next_win.top_win = nil
                end
            end
        end
        table.insert(BaseView.winMap, self)
        if #BaseView.winMap > 1 then
            local lastWin = BaseView.winMap[#BaseView.winMap - 1]
            if lastWin ~= nil then
                if lastWin.win_type == WinType.Mini and self.win_type ~= WinType.Mini then
                    lastWin = table.remove(BaseView.winMap, #BaseView.winMap - 1)
                    if lastWin ~= nil then
                        if lastWin.top_win then
                            lastWin.top_win.next_win = self
                        end
                        if lastWin.close then
                            lastWin:close()
                        end
                    end
                end
            end

            if #BaseView.winMap > 0 then
                lastWin = BaseView.winMap[#BaseView.winMap - 1]
                -- 如果面板原本就是隐藏的,就不需要做链接了,这种情况只有战斗中才会出现了
                if lastWin and not tolua.isnull(lastWin.root_wnd) and lastWin.win_type ~= WinType.Tips and lastWin:getVisible() == true then
                    self.top_win = lastWin
                    self.top_win.next_win = self
                    if self.win_type ~= WinType.Mini and self.win_type >= lastWin.win_type then
                        self.top_win:setVisible(false)
                    end
                end
            end
        end
        self:needHideMainScene()
    else
        table.insert(BaseView.winTipsMap, self)
    end
end

function BaseView:needHideMainScene()
    if self.win_type == WinType.Full  or self.win_type == WinType.Full_SHOW_BOTTOM then

        delayOnce(function()
                if self.is_visible == true then
                    if BattleController:getInstance():isInFight() == true then
                        BattleController:getInstance():handleBattleSceneStatus(false)
                    end

                    if self.win_type == WinType.Full_SHOW_BOTTOM then
                        MainSceneController:getInstance():handleSceneStatus(false,true)
                    else
                        MainSceneController:getInstance():handleSceneStatus(false)
                    end

                    if self.is_show_func_icon == 1 then
                        self:setVisible(true)
                    end
                end
            end, 1 / display.DEFAULT_FPS)
    elseif self.win_type == WinType.Big then
        MainuiController:getInstance():setIsShowMainUIBottom(false)
    end
end

function BaseView:closeCacheView()
    if self.win_type ~= WinType.Tips then
        for i, v in ipairs(BaseView.winMap) do
            if v == self then
                table.remove(BaseView.winMap, i)
                if self.top_win and not tolua.isnull(self.top_win.root_wnd) then
                    if self.next_win ~= nil and (self.next_win.win_type == WinType.Full or self.next_win.win_type ==  Full_SHOW_BOTTOM )then
                    else
                        if not self.close_by_other then
                            if not self.top_win.is_before_battle then -- 战队战斗之前进入的窗体做处理
                                self.top_win:setVisible(true)
                            else
                                self.top_win.enter_battle_status = true
                            end
                        end
                        self.top_win.next_win = nil
                    end
                end
                if self.next_win and self.top_win then
                    self.top_win.next_win = self.next_win
                    self.next_win.top_win = self.top_win
                end
                break		
            end
        end
        local length = #BaseView.winMap
        if length == 0 or (not self:isFullWinExist()) then
            if not BattleController:getInstance():isInFight() and not MainuiController:getInstance():checkIsInDramaUIFight() then
                MainSceneController:getInstance():handleSceneStatus(true)
            elseif BattleController:getInstance():getCtrlBattleScene() and length == 0 then
                BattleController:getInstance():handleBattleSceneStatus(true)
            end
        elseif length > 0 then
            local show_view = BaseView.winMap[length]
            if show_view and show_view.win_type == WinType.Full_SHOW_BOTTOM then
                MainSceneController:getInstance():handleSceneStatus(false,true)
            end
        end
    else
        for i, v in ipairs(BaseView.winTipsMap) do
            if v == self then
                table.remove(BaseView.winTipsMap, i)
                break
            end
        end
    end
end

function BaseView:isFullWinExist()
    for _, win in ipairs(BaseView.winMap) do
        if (win.win_type == WinType.Full or win.win_type == WinType.Full_SHOW_BOTTOM) and win.is_before_battle == false then
            return true
        end
    end
    return false
end

function BaseView:isBigWinExist()
    for _, win in ipairs(BaseView.winMap) do
        if win.win_type == WinType.Big then
            return true
        end
    end
    return false
end

function BaseView:closeDestroy()
    self:release()
end

function BaseView:__delete()
    self:release()
end

--need to be override
--用来调用删除面板内的内容，但是没法释放纹理内存
function BaseView:deleteMe()
end

--need to be override
--释放纹理内存
function BaseView:releaseMem()
end

--统一这个地方来设置，方面修改
function BaseView:setRootWndVisible(bool)
    self:setVisible(bool)
end

--事件注册，当根节点离开父节点的时候触发，保障根节点不会变成“野指针”
function BaseView:registerNodeScriptHandler()
    local function onNodeEvent(event)
        if "enter" == event then  --进场
            if self["onEnter"] then
                self:onEnter()
            end
        elseif "exit" == event then --离场
            if self["onExit"] then
                self:onExit()
            end
        end
    end
    self:__getRootWnd():registerScriptHandler(onNodeEvent)
end

--节点销毁
function BaseView:release()
    self:deleteMe()
    self.is_visible = false
    self.is_load_finish = false
    self.is_loading = false

    if self.root_wnd and(not tolua.isnull(self.root_wnd)) then
        self.root_wnd:stopAllActions()
        self.root_wnd:removeAllChildren()
        self.root_wnd:removeFromParent()
    end

    for _, vo in pairs(self.anim_vo_list) do
        local rootWnd = vo[1]
        local uiAction = vo[2]
        if rootWnd then 
            rootWnd:release() 
        end
        if uiAction then
            uiAction:clearFrameEventCallFunc()
            uiAction:release()
        end
    end
    self.anim_vo_list = {}

    -- 移除该面板相关的资源计数，等到自动删除
    if self.resources_load ~= nil then
        self.resources_load:DeleteMe()
        self.resources_load = nil
    end

    -- 移除掉统一箭筒的事件
    self:removeGlobalEvent()

    self:releaseMem()
    self.root_wnd = nil
end

--设置父节点
function BaseView:__setParent(parent)
    self.parent_wnd = parent
end

--获取父节点
function BaseView:__getRootParent()
    if not self.parent_wnd then
        self.parent_wnd = ViewManager:getInstance():getLayerByTag(self.view_tag)
    end
    return self.parent_wnd
end

-- 获取根窗口
function BaseView:__getRootWnd()
    return self.root_wnd
end

function BaseView:isOpen()
    if not self:isLayout() then
        return false
    end
    return self.is_visible
end

-- 是否被加载了
function BaseView:isLayout()
    return self.is_load_finish
end

function BaseView:setVisible(bool)
    self.is_visible = bool
    if self.root_wnd == nil or tolua.isnull(self.root_wnd) then return end
    self.root_wnd:setVisible(bool)
end

function BaseView:getVisible()
    return self.is_visible
end

function BaseView:openAction(action_ui)
    if action_ui then
        if self.action_callback then self.action_callback() end
    end
end

function BaseView:addChild(diplayerObj)
    self.root_wnd:addChild(diplayerObj)
end

function BaseView:removeChild(diplayerObj)
    self.root_wnd:removeChild(diplayerObj)
end

function BaseView:removeAllChildren()
    self.root_wnd:removeAllChildren()
end

function BaseView:setPosition(pos)
    self.root_wnd:setPosition(pos)
end

function BaseView:getPosition()
    self.root_wnd:getPosition()
end

--[[
@desc: 根据csb构建窗体
author:{author}
time:2018-05-03 10:06:42
--@csbPath:csb路径
--@use_default: 是否是通用的资源
return
]]
function BaseView:initLayoutFile(csbPath, use_default)
    self:preLoadLayoutFile()
    self:loadLayoutFile(csbPath, use_default)
    self:loadComplete()

    if self.RESOURCE_BINDING then
        self:createResourceBinding(self.RESOURCE_BINDING)
    end
    
end
local function seekWidgetByName(nodeTable, key)
    if #nodeTable == 0 then
        return nil
    end
    local child = nil
    local subNodeTable = {}
    for _, v in ipairs(nodeTable) do
        child = v:getChildByName(key)
        if (child) then
            return child
        end
    end
    for _, v in ipairs(nodeTable) do
        local subNodes = v:getChildren()
        if #subNodes ~= 0 then
            for _, v1 in ipairs(subNodes) do
                table.insert(subNodeTable, v1)
            end
        end
    end
    return seekWidgetByName(subNodeTable, key)
end
function BaseView:createResourceBinding(binding)
    print("BaseView:createResourceBinding")
    assert(self.root_wnd, "BaseView:createResourceBinding() - root_wnd should not be null")
    for nodeName, nodeBinding in pairs(binding) do
        local node = seekWidgetByName(self.root_wnd:getChildren(),nodeName)
        if nodeBinding.varname then
            self[nodeBinding.varname] = node
        end 
        if nodeBinding.onClick and node.addClickEventListener then
            node:addClickEventListener(handler(self, self[nodeBinding.onClick]))
        end
        for _, event in ipairs(nodeBinding.events or {}) do
            if event.event == "touch" then
                node:onTouch(handler(self, self[event.method]))
            end
        end
    end
end
function BaseView:onClicked(node, endCallback, beganCallback, cancelCallback)
    node:addTouchEventListener(function(sender, state)
            local event = {}
            event.target = sender

            if state == ccui.TouchEventType.began then
                event.name = "began"
                node:setScale(1.1)
                if beganCallback then beganCallback(event) end
            elseif state == ccui.TouchEventType.moved then
                event.name = "moved"
            elseif state == ccui.TouchEventType.ended then
                self:playCommonButtonSound()
                event.name = "ended"
                node:setScale(1)
                endCallback(event)
            else
                event.name = "cancelled"
                node:setScale(1)
                if cancelCallback then cancelCallback(event) end
            end
        end)
end

--递归获取子节点 key在ui文件里必须是唯一的
function BaseView:getChildByName(key)
    return self.root[key]
end

function BaseView:attachParent()
    self:__getRootParent():addChild(self:__getRootWnd())
end

function BaseView:preLoadLayoutFile()
end

function BaseView:loadLayoutFile(csbPath, use_default)
    local isCommonWindow=(csbPath=="common/common_window_tab")
    csbPath = PathTool.getTargetCSB(csbPath)
    local result = nil
    if USE_RES_LUA == true then
        self.root = createCSBResult(csbPath)
        self.root_wnd = self.root['root']
    else
        self.root_wnd = createCSBNote(csbPath)
    end
    if isCommonWindow then
        self.root_wnd:getChildByName('main_container'):getChildByName('main_panel'):getChildByName("bird"):setVisible(self.show_bird)
    end

    -- -- =================================添加一个针对layout_节点做适配===目前放在创建csb方法中了================------------------
    -- self:resetUiLayout(self.root_wnd)
    -- -- =================================添加一个针对layout_节点做适配===================------------------

    self.root_wnd:retain()
    -- 这里是使用默认的base_view csb
    if use_default == true then
        self:getObjFromCSB()
    end

    if self.is_csb_action then
        local ui_action = nil

        if USE_RES_LUA == true then
            ui_action = self.root['animation']
        else
            ui_action = cc.CSLoader:createTimeline(csbPath)
        end

        ui_action:retain()

        self.is_exist_ui_end = ui_action:IsAnimationInfoExists(ANIMATION_UI_END)
        table.insert(self.anim_vo_list, {self.root_wnd, ui_action})

        local function onFrameEvent(frame)
            if nil == frame then return end
            local str = frame:getEvent()
            if str == UI_START_FRAME then
                self:onEnterAnim()
            elseif str == UI_END_FRAME then
                self:onExitAnim()
                self:setVisible(false)
                delayOnce(function()
                        self:closeInternal()
                    end, 1 / display.DEFAULT_FPS)
            end
        end
        ui_action:setFrameEventCallFunc(onFrameEvent)
        if not tolua.isnull(self.root_wnd) then
            self.root_wnd:runAction(ui_action)
        end
    end
end
--@ 通用入场动作  
--@ action_type 动作类型 默认 1 表示 左进   2 表示缩小放大
function BaseView:playEnterAnimatianByObj(obj, action_type)
    if not tolua.isnull(obj) then
        if action_type == 2 then
            ActionHelp.itemScaleAction(obj)
        else
            ActionHelp.itemUpAction(obj)
        end
    end
end

--==============================--
--desc:使用默认的csb创建窗体的时候
--@return 
--==============================--
function BaseView:getObjFromCSB()
    if self.root_wnd == nil then return end
    self.background = self.root_wnd:getChildByName("background")
    self.dark_background = self.root_wnd:getChildByName("dark_background")
    -- self.background:ignoreContentAdaptWithSize(true)
    self.background:setScale(display.getMaxScale(self.root_wnd))
    if self.dark_background then
        self.dark_background:setScale(display.getMaxScale(self.root_wnd))
    end
    -- 背景一定要是image，不是之前的黑幕了
    if self.background_path ~= nil then
        self.background:loadTexture(self.background_path, LOADTEXT_TYPE)
        self.background:setVisible(true)
    else
        self.background:setVisible(false)
    end

    if self.show_background == false then 
        self.background:setVisible(false)
    end 
    

    local image_panel = self.root_wnd:getChildByName("image_panel")
    if image_panel ~= nil then
        image_panel:setPositionY(display.getBottom(self.root_wnd))
    end
    self.main_container = self.root_wnd:getChildByName("main_container")
    if image_panel ~= nil then
        self.main_container:setPositionY(image_panel:getPositionY() + 85)
    end
    -- 通用进场动效
    ActionHelp.itemUpAction(self.main_container, 400, 0, 0.2)

    self.main_panel = self.main_container:getChildByName("main_panel")

    -- 这个节点就是各个面板自己需要显示的内容的父节点了
    self.container = self.main_panel:getChildByName("container")
    -- 这个节点图片标题

    self.title_label = self.main_panel:getChildByName("win_title")
    self.win_spirte = self.main_panel:getChildByName("win_spirte")
    if self.win_spirte then 
        self.win_spirte:setVisible(false)
    end

    self.title_bg = self.main_panel:getChildByName("title_bg")

    self.Sprite_1 = self.main_panel:getChildByName("Sprite_1")
    if self.Sprite_1 ~= nil then 
        self.Sprite_1:setVisible(false)
    end 

    self:changeTitleName(self.title_str)
    local bottom_y = display.getBottom(self.background)

    self.close_btn = self.main_panel:getChildByName("close_btn")
    self.close_btn:setVisible(self.show_close_btn)
    local close_btn_y = self.close_btn:getPositionY()    
    self.close_btn:setPositionY(bottom_y+close_btn_y)


    if self.close_btn then
        self.close_btn:addTouchEventListener(function(sender, event_type)
                customClickAction(sender,event_type)
                if event_type == ccui.TouchEventType.ended then
                    playQuitSound()
                    if self.beforeClose then
                        self:beforeClose()
                    end
                    self:close()
                end
            end)
    end

    if  self.dark_background then
        self.dark_background:setTouchEnabled( self.click_dark_backgroud)
        self.dark_background:addTouchEventListener(function(sender, event_type)
            customClickAction(sender,event_type)
            if event_type == ccui.TouchEventType.ended then
                playQuitSound()
                if self.beforeClose then
                    self:beforeClose()
                end
                self:close()
            end
         end)
    end

   
    self:initAllTabs()
end

function BaseView:initAllTabs()

    -- 这里就是标签页面板了,因为面板问题,这类的面板最多现在只放5个标签页,规则现在只判断这么多
    local tab_panel =self.main_panel:getChildByName("tab_container")
    if self.is_mini_view then
        tab_panel:setVisible(false)
    elseif self.tab_info_list and next(self.tab_info_list) ~= nil  then
        tab_panel:setVisible(true)
        if self.Sprite_1 ~= nil then 
            self.Sprite_1:setVisible(true)
        end 
      
        if self.tab_btn_list == nil then
            self.tab_btn_list = {}
        end
        local tab, tab_btn, tab_tips, info
        for i = 1, self.tab_max do
            tab = tab_panel:getChildByName("tab_btn_" .. i)
            if tab ~= nil then
                tab_btn = tab
                tab_btn:setName("tab_btn_" .. i)
                tab_tips = tab:getChildByName("tab_tips")
                tab_red_num = tab:getChildByName("red_num")  --要显示出红点跟次数
                select_bg = tab:getChildByName("select_bg")
                unselect_bg = tab:getChildByName("unselect_bg")
                if tab_btn ~= nil then
                    tab_btn.tips = tab_tips
                    tab_btn.red_num = tab_red_num
                    tab_btn.select_bg = select_bg
                    tab_btn.unselect_bg = unselect_bg
                    info = self.tab_info_list[i]                --有序table,直接取下标去创建
                    if info ~= nil then
                        tab_btn.notice = info.notice or ""
                        tab_btn.label = tab:getChildByName("title")
                        tab_btn.label_un = tab:getChildByName("title_1")
                        tab_btn.label:setString(info.label)

                        tab_btn.index = info.index
                        tab_btn.label:setTextColor(cc.c3b(168,150,121))
                        tab_btn.select_bg:setVisible(false)
                        tab_btn.unselect_bg:setVisible(true)

                        if tab_btn.label_un then
                            tab_btn.label_un:setString(info.label)
                            tab_btn.label:setVisible(false)
                            tab_btn.label_un:setVisible(true)
                        end

                        tab_btn.tips:setVisible(false)
                        if tab_btn.red_num then
                            tab_btn.red_num:setVisible(false)
                        end
                        -- tab_btn:setTouchEnabled(info.status)
                        tab_btn.can_touch = info.status
                        -- 如果不可点击,就灰掉吧
                        if info.status == false then
                            setChildUnEnabled(true, tab_btn, Config.ColorData.data_color4[1])
                        end
                        -- 添加注册监听事件
                        tab_btn:addTouchEventListener(function(sender, event_type)
                                if event_type == ccui.TouchEventType.ended then
                                    playTabButtonSound()
                                    if sender.can_touch == false then
                                        message(sender.notice)
                                    else
                                        self:setSelecteTab(sender.index,nil ,cc.c3b(168,150,121),cc.c3b(239,212,174))
                                    end
                                end
                            end)
                        self.tab_btn_list[info.index] = tab_btn
                    else
                        tab_btn:setVisible(false)
                    end
                end
            end
        end

        tab_panel:setPositionX(302 + (240- #self.tab_info_list * 60))
    end

end

--==============================--
--desc:设置标签页上面的红点
--@status:
--@index:
--@return 
--==============================--
function BaseView:setTabTips(status, index)
    if not tolua.isnull(self.root_wnd) and self.tab_btn_list then
        local tab_btn = self.tab_btn_list[index]
        if tab_btn and tab_btn.tips then
            tab_btn.tips:setVisible(status)
        end
    end
end

--==============================--
--desc:设置标签页上的红点，要显示出数字出来
--@status:
--@index:
--@return 
--==============================--
function BaseView:setTabTipsII(num, index)
    local status = true 
    if num <=0 then 
        status = false
    end
    local tab_btn = self.tab_btn_list[index]
    if tab_btn and tab_btn.tips and tab_btn.red_num then
        tab_btn.tips:setVisible(status)
        tab_btn.red_num:setVisible(status)
        if num >=0  then 
            tab_btn.red_num:setString(num)
        end
    end

end

--换标签的时候改变标题名字
function BaseView:changeTitleName(name)
    if not self.title_label then return end
    if name ~= nil then
        self.title_label:setString(name)
        if self.title_bg then
            self.title_bg:setVisible(true)
        end
        self.title_label:setVisible(true)
        if self.win_spirte then 
            self.win_spirte:setVisible(false)
        end
        else
        if self.title_bg then
            self.title_bg:setVisible(false)
        end
        self.title_label:setVisible(false)
    end

    if self.title_sprite then 
        if self.win_spirte then 
            self.win_spirte:setVisible(true )
        end
            self.title_label:setVisible(false)
        loadSpriteTexture(self.win_spirte, self.title_sprite, LOADTEXT_TYPE_PLIST)
    end


end



function BaseView:setTabBtnTouchStatus(status, index)
    local tab_btn = self.tab_btn_list[index]
    if tab_btn then
        setChildUnEnabled(not status, tab_btn, Config.ColorData.data_color4[1])			
        tab_btn.can_touch = status
    end
end




function BaseView:setColorByQuality(quality)
    local quality_color = {
       [0]=cc.c3b(165,170,192), --灰
       [1]=cc.c3b(95,179,79), --绿色
       [2]=cc.c3b(69,141,207), --蓝色
       [3]=cc.c3b(149,93,188), --紫色
       [4]=cc.c3b(227,181,87), --橙色
       [5]=cc.c3b(214,69,59),  --红色
    }
    return quality_color[quality]
  
end

--==============================--
--desc:切换标签页做的一些事情
--@index:
--@is_init:
--@return                                         self:setSelecteTab(sender.index,nil ,cc.c3b(168,150,121),cc.c3b(239,212,174))
--==============================--
function BaseView:setSelecteTab(index, is_init,oldColor,newColor)	
    if self.cur_selected and self.cur_selected.index == index then return end	
    if self.cur_selected ~= nil then
        if self.cur_selected.label then
            self.cur_selected.label:setTextColor(cc.c3b(168,150,121))

        end
        self.cur_selected.select_bg:setVisible(false)
        self.cur_selected.unselect_bg:setVisible(true)
        if self.cur_selected.label_un then
            self.cur_selected.label:setVisible(false)
            self.cur_selected.label_un:setVisible(true)
        end
        if oldColor then 
            self.cur_selected.label:setTextColor(oldColor)
        end 
    end

    self.cur_selected = self.tab_btn_list[index]
    if self.cur_selected ~= nil then
        if self.cur_selected.label then
            self.cur_selected.label:setTextColor(cc.c3b(239,212,174))

        end
        if newColor then 
            self.cur_selected.label:setTextColor(newColor)
        end 
        self.cur_selected.select_bg:setVisible(true)
        self.cur_selected.unselect_bg:setVisible(false)
        if self.cur_selected.label_un then
            self.cur_selected.label:setVisible(true)
            self.cur_selected.label_un:setVisible(false)
        end
    end
    if self.selectedTabCallBack and self.cur_selected ~= nil then
        self:selectedTabCallBack(self.cur_selected.index)
    end
end

function BaseView:loadComplete()
end

function BaseView:playEnterAnimatian()
    if self.is_csb_action then
        for _, vo in pairs(self.anim_vo_list) do
            local rootWnd = vo[1]
            local uiAction = vo[2]
            if rootWnd and uiAction then
                if uiAction:IsAnimationInfoExists(ANIMATION_UI_START) then
                    uiAction:play(ANIMATION_UI_START, false)
                end
            end
        end
    end
end

--播放退场动作
function BaseView:playExitAnimation()
    if self.is_csb_action then
        for _, vo in pairs(self.anim_vo_list) do
            local rootWnd = vo[1]
            local uiAction = vo[2]
            if rootWnd and uiAction then
                if uiAction:IsAnimationInfoExists(ANIMATION_UI_END) then
                    uiAction:play(ANIMATION_UI_END, false)
                end
            end
        end
    end
end

--进场动画播完，可重写
function BaseView:onEnterAnim()
end

--退场动画播完，可重写
function BaseView:onExitAnim()
end

--[[
@desc: 通用声音配置
author:{author}
time:2018-05-03 10:18:03
return
]]
function BaseView:playMainButtonSound()
    if GlobalAudio then
        GlobalAudio:getInstance():playEffect(GlobalAudio.AUDIO_TYPE.COMMON, "c_002")
    end
end

--==============================--
--desc:剧情或者引导需要判断当前是否有窗体打开或者是否有全屏窗体打开
--@return 
--==============================--
function BaseView.checkWinExist()
    for _, win in ipairs(BaseView.winMap) do
        if win.win_type == WinType.Full or win.win_type == WinType.Full_SHOW_BOTTOM then
            return true
        end
    end
    return false
end

--==============================--
--desc:外部关闭所有的窗体
--@return 
--==============================--
function BaseView.closeAllView()
    local win_list = {}
    if BaseView.winMap ~= nil and next(BaseView.winMap) ~= nil then
        for i, v in ipairs(BaseView.winMap) do
            table.insert(win_list, v)
        end
    end

    if win_list ~= nil and next(win_list) ~= nil then
        for i, v in ipairs(win_list) do
            if v.close then
                v:close(true)
            end
        end
    end
    BaseView.winMap = {}
end
--desc:外部关闭所有tips的窗口
function BaseView.closeAllTipsview()
    local win_list = {}
    if BaseView.winTipsMap ~= nil and next(BaseView.winTipsMap) ~= nil then
        for i, v in ipairs(BaseView.winTipsMap) do
            table.insert(win_list, v)
        end
    end

    if win_list ~= nil and next(win_list) ~= nil then
        for i, v in ipairs(win_list) do
            if v.close then
                v:close(true)
            end
        end
    end
    BaseView.winTipsMap = {}
end
--打印 当前窗口信息..
function BaseView.printWinLog()
    print("当前窗口数量: "..#BaseView.winMap)
    for i,v in ipairs(BaseView.winMap) do
        if v.layout_name then
            print(string.format("第%s个窗口名字: %s", i, v.layout_name))
        end
        if v.check_class_name then
            print(string.format("第%s个窗口名字: %s", i, v.check_class_name))
        end
    end

    print("当前tips窗口数量: "..#BaseView.winTipsMap)
    for i,v in ipairs(BaseView.winTipsMap) do
        if v.layout_name then
            print(string.format("第%s个tips窗口名字: %s", i, v.layout_name))
        end
    end
end

--关闭所有的view 和 tips的窗口
function BaseView.closeViewAndTips()
    BaseView.closeAllView()
    BaseView.closeAllTipsview()
end

--==============================--
--desc:关闭一些会挡住引导或者剧情的面板
--@return 
--==============================--
function BaseView.closeSomeWin()
    CommonAlert.closeAllWin()
    CommonAlertYellow.closeAllWin()
    TipsManager:getInstance():hideTips()
    TipsManager:getInstance():showBackPackCompTips(false) 
    ChatController:getInstance():closeChatUseAction()
    ArenaController:getInstance():openArenaChampionTop3Window()
    BattleController:getInstance():closeBattleResultWindow()
    HeroController:getInstance():openEquipTips(false)
    BattleDramaController:getInstance():openDramHookRewardView(false)
    LevupgradeController:getInstance():openMainWindow(false) 
    ActionController:getInstance():openFirstChargeView(false) 
    ActionController:getInstance():openActionMainPanel(false) 
    VipController:getInstance():openVipMainWindow(false) 
    WelfareController:getInstance():openMainWindow(false) 
    HallowsController:getInstance():openHallowsTips(false)
    FriendController:getInstance():openFriendFindWindow(false)
    FriendController:getInstance():openFriendWindow(false)
    OnlineGiftController:getInstance():openOnlineGiftView(false)
    FriendController:getInstance():openFriendCheckPanel(false)
    Endless_trailController:getInstance():openEndlessBuffView(false, nil, true)
    PartnersummonController:getInstance():openSummonGainWindow(false)
    PartnersummonController:getInstance():openSummonGainShowWindow(false)
    -- ActionController:getInstance():openActionLimitGiftMainWindow(false) --如果触发剧情了 需要关闭礼包的 暂时忽略 
end 

--==============================--
--desc:basevie统一注册事件,这里需要注意自己Fire的时候,参数如果是多个,那么非最后一个的都需要默认值,要不然unpack会跟自己想要的对不上.
--@event_type:
--@callback:
--@return 
--==============================--
function BaseView:addGlobalEvent(event_type, callback)


    EventManager:getInstance():Bind(event_type,self,callback)
end

function BaseView:removeGlobalEvent()

    EventManager:getInstance():UnBind(self)
end
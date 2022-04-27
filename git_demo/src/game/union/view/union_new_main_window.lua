--**********************
--联盟新主界面（联盟酒馆）
--xhj
--**********************
UnionNewMainWindow = UnionNewMainWindow or BaseClass(BaseView)
local rank_limit_lev = 30

local controller = UnionController:getInstance()
local model = UnionController:getInstance():getModel()
local map_center = 360  --地图移动的中心点
local string_format = string.format
local table_insert = table.insert

function UnionNewMainWindow:__init()
    self.is_full_screen = true
    self.layout_name = "union/union_new_main_window"
    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("guild", "guild"), type = ResourcesType.plist},
        {path = PathTool.getPlistImgForDownLoad("union", "union"), type = ResourcesType.plist},

        {path = PathTool.getSingleImgForDownLoad("bigbg/union","union_bg",false), type = ResourcesType.single },
    }
    self.icon_list = {} --图标
    self.effect_list = {} --特效
    self.npc_list = {} --特效
    self.is_shrink = true --信息面板是否显示
    self.is_in_shrink = false --信息面板收缩状态
    self.touch_pos = {
        [109] = {745,170}--猫点击位置
    }
    self.role_vo = RoleController:getInstance():getRoleVo()
end

function UnionNewMainWindow:open_callback()
    self.main_container = self.root_wnd:getChildByName("main_container")
    self.union_bg = self.root_wnd:getChildByName("bg")
    self.top_bg = self.root_wnd:getChildByName("top_bg")
    self.bottom_bg = self.root_wnd:getChildByName("bottom_bg")

    self.close_btn = self.root_wnd:getChildByName("close_btn")

    self.map_layer = self.main_container:getChildByName("map_layer")
    self.union_panel = self.main_container:getChildByName("guild_panel")
    self.mask_panel = self.union_panel:getChildByName("mask_panel")
    self.info_panel = self.mask_panel:getChildByName("info_panel")
    self.info_panel:setVisible(false)
    self.sign_btn = self.info_panel:getChildByName("sign_btn")							-- 联盟宣言的设置按钮
    self.union_sign_value = self.info_panel:getChildByName("guild_sign_value")			-- 联盟宣言内容
    self.union_sign_value:setTextAreaSize(cc.size(250, 130))

    self.change_name_btn = self.union_panel:getChildByName("change_name_btn")				-- 联盟改名
    self.rank_btn = self.info_panel:getChildByName("rank_btn")							-- 联盟排名
    self.rank_btn:getChildByName("label"):setString(TI18N("联盟排名"))

    self.info_panel:getChildByName("guild_leader_title"):setString(TI18N("联盟长："))

    self.arrow_img = self.union_panel:getChildByName("arrow_img")
    self.union_name_value = self.union_panel:getChildByName("guild_name_value")
    self.union_leader_value = self.info_panel:getChildByName("guild_leader_value")
    self.union_lev_value = self.info_panel:getChildByName("guild_lev_value")

    self.check_member_btn = self.info_panel:getChildByName("check_member_btn")					-- 查看成员
    self.check_member_btn.tips = self.check_member_btn:getChildByName("tips") 			-- 查看成员红点
    self.check_member_btn:getChildByName("label"):setString(TI18N("联盟管理"))

  

    self.progress = self.info_panel:getChildByName("progress")
    self.progress:setScale9Enabled(true)
    self.progress_num = self.info_panel:getChildByName("progress_num")
    self:adaptationScreen()

    local bottom_y = display.getBottom(self.main_container)
    local close_btn_y = self.close_btn:getPositionY()
    self.close_btn:setPositionY(bottom_y+close_btn_y)
end

--设置适配屏幕
function UnionNewMainWindow:adaptationScreen()
    --对应主窗口.四面对应xy位置 ..相对位置是self.main_container左下角(0,0)
    local top_y = display.getTop(self.container)
    local bottom_y = display.getBottom(self.container)

    self.top_bg:setPositionY(top_y)
    self.bottom_bg:setPositionY(bottom_y)

end

function UnionNewMainWindow:register_event()

    registerButtonEventListener(self.close_btn, function()
            controller:openUnionMainWindow(false)
        end, true, 2)


    registerButtonEventListener(self.sign_btn, function()
            controller:openUnionChangeSignWindow(true)
        end,true, 1)

    registerButtonEventListener(self.change_name_btn, function()
            controller:openUnionChangeNameWindow(true)
        end,true, 1)

    registerButtonEventListener(self.rank_btn, function()
            RankController:getInstance():openRankView(true, RankConstant.RankType.union_union)
        end,true, 1)

    registerButtonEventListener(self.check_member_btn, function()
            controller:openUnionMemberWindow(true)
        end,true, 1)

    

    registerButtonEventListener(self.union_panel, function()
            self:shrinkInfoContainer()
        end,false, 1)


    if self.role_vo ~= nil then
        if self.role_assets_event == nil then
            self.role_assets_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value) 
                    if key == "position" then
                        self:updateJurisdiction()
                    end
                end)
        end
    end

    EventManager:getInstance():Bind(UnionEvent.UpdateUnionRedStatus,self, function(type, status)
                self:updateSomeRedStatus(type, status)
            end)
    
end

function UnionNewMainWindow:registerEvent()
    local function onTouchBegin(touch, event)
        self.touch_point = nil
        doStopAllActions(self.union_bg)
        return true
    end
    local function onTouchMoved(touch, event)
        self.touch_point = touch:getDelta()
        local pos_x = self:setBorder(self.touch_point.x)
        self.union_bg:setPositionX(pos_x)
    end
    local function onTouchEnded(touch, event)
        if self.touch_point then
            local pos_x = self.touch_point.x + 15
            if self.touch_point.x < 0 then
                pos_x = self.touch_point.x - 15
            end
            local x = self:setBorder(pos_x)
            self.union_bg:stopAllActions()
            local root_move_to = cc.MoveTo:create(1, cc.p(x, 640))
            local call_fun = cc.CallFunc:create(function()
                end)
            local ease_out = cc.EaseSineOut:create(root_move_to)
            self.union_bg:runAction(cc.Sequence:create(ease_out, call_fun))
        end
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onTouchBegin,cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED)
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED)
    self.map_layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self.map_layer)

end

--置灰操作
function UnionNewMainWindow:setGray( bool )
    if self.rank_btn:isVisible() == true then
        setChildUnEnabled(bool, self.rank_btn)
        -- self.rank_btn:setTouchEnabled(not bool)
        if bool == true then
            self.rank_btn:getChildByName("label"):disableEffect(cc.LabelEffect.OUTLINE)
        else
            self.rank_btn:getChildByName("label"):enableOutline(cc.c4b(0x50,0x2E,0x1B,0xff), 1)
        end
    end
end

function UnionNewMainWindow:setBorder(x)
    local pos_x = self.union_bg:getPositionX() + x
    if pos_x >= self.move_pos then
        pos_x = self.move_pos
    end
    if pos_x <= map_center - (self.move_pos-map_center) then
        pos_x = map_center - (self.move_pos-map_center)
    end
    return pos_x
end

--==============================--
--desc:收缩联盟信息面板
--@return 
--==============================--
function UnionNewMainWindow:shrinkInfoContainer()
    if not self.info_panel then
        return
    end
    if self.is_in_shrink == true then return end
    self.is_in_shrink = true

    self.is_shrink = not self.is_shrink

    self.info_panel:setVisible(true)

    local len = 587.5
    local move_by_1 = nil
    local fade_1 = nil
    local scaleY = 1
    if self.is_shrink == true then
        move_by_1 = cc.MoveTo:create(0.6, cc.p(0, len))
        fade_1 = cc.FadeOut:create(0.6)
    else
        move_by_1 = cc.MoveTo:create(0.6, cc.p(0, 100))
        fade_1 = cc.FadeIn:create(0.1)
        scaleY = -1
    end
    self.arrow_img:setScaleY(scaleY)

    local call_fun_1 = cc.CallFunc:create(function()
            self.is_in_shrink = false
            if self.is_shrink == true then
                self.info_panel:setVisible(false)
            end
        end)
    local ease_out = cc.EaseBackOut:create(move_by_1)

    self.info_panel:runAction(cc.Sequence:create(cc.Spawn:create(ease_out, fade_1), call_fun_1)) 
end

--创建层次场景
function UnionNewMainWindow:createLayer()
    -- 创建7个地图层,其中1是最靠前的层
    for i=1,2 do
        self["map_layer"..i] = ccui.Layout:create()
        self["map_layer"..i]:setAnchorPoint(cc.p(0, 0))
        self["map_layer"..i]:setContentSize(self.union_bg:getContentSize())
        if self.union_bg and self["map_layer"..i] then
            self.union_bg:addChild(self["map_layer"..i]) 	
        end
    end
end

function UnionNewMainWindow:openRootWnd()
    self:setGray(not RankController:getInstance():checkRankIsShow())
    self.union_bg:ignoreContentAdaptWithSize(true)
    self.union_bg:loadTexture(PathTool.getSingleImgForDownLoad("bigbg/union","union_bg",false), LOADTEXT_TYPE)
    self.move_pos = self.union_bg:getContentSize().width*display.getMaxScale() * 0.5
    self.union_bg:setScale(display.getMaxScale())
    self.move_pos = self.move_pos or 540


    self:createLayer()
    self:registerEvent()
    -- self:createIcon()
    self:createEffect()
    self:createNpc()

    if self.my_union_info == nil then
        self.my_union_info = model:getMyUnionInfo()
        if self.my_union_info ~= nil then
            if self.update_my_union_info_event == nil then
                self.update_my_union_info_event = self.my_union_info:Bind(UnionEvent.UpdateMyInfoEvent, function(key, value)
                        if key == "sign" then
                            self:updateUnionSignInfo()
                        elseif key == "members_num" then

                        elseif key == "lev" or key == "exp" then
                            self:updateUnionBaseInfo()
                        elseif key == "name" then
                            self:updateUnionNameInfo()
                        elseif key == "leader_name" then
                            self:updateUnionLeaderInfo()
                        end
                    end)
            end
        end

        -- 监听开服天数变化
        EventManager:getInstance():Bind(RoleEvent.OPEN_SRV_DAY,self, function() 
                    self:checkUnionWarStatus()
                end)
        

        self:updateUnionNameInfo()
        self:updateUnionSignInfo()
        self:updateUnionBaseInfo()
        self:updateUnionLeaderInfo()
        self:updateSomeRedStatus()
    end

    self:updateJurisdiction()
    local status = SysEnv:getInstance():getBool(SysEnv.keys.union_first_open, true)
    if status == true then
        self:shrinkInfoContainer()
        SysEnv:getInstance():set(SysEnv.keys.union_first_open, false)
    end



    --测试音效 --"lwc"
    -- GlobalAudio:getInstance():playMusic(GlobalAudio.AUDIO_TYPE.SCENE, "s_007", true) --
end

--创建图标按钮
function UnionNewMainWindow:createIcon()
    local tempArr = {}
    for i,v in ipairs(Config.UnionData.data_guild_scene_icon) do
        if v.res_type == 1 then --icon类型
            table_insert(tempArr, v)
        end
    end

    for i,v in ipairs(tempArr) do
        if self.map_layer2 then
            if self.icon_list[v.type] == nil then
                self.icon_list[v.type] = ccui.Layout:create()
                self.icon_list[v.type]:setContentSize(cc.size(83,80))
                self.icon_list[v.type]:setTouchEnabled(true)
                self.icon_list[v.type]:setAnchorPoint(0.5,0.5)

                self.icon_list[v.type]:setPosition(v.pos[1][1],v.pos[1][2])
                if self.icon_list[v.type] then
                    self.map_layer2:addChild(self.icon_list[v.type])	
                end

                createImage(self.icon_list[v.type], PathTool.getResFrame("guild", string.format("guild_icon_%s", v.icon)),83/2,80/2,cc.p(0.5, 0.5),
                    true
                )
                local bg = createImage(self.icon_list[v.type], PathTool.getResFrame("guild", "guild_1028"),83/2,23,cc.p(0.5, 0.5),true,nil,true)
                bg:setContentSize(cc.size(74,22))

                createLabel(18, cc.c4b(0xff,0xf8,0xca,0xff), cc.c4b(0x32,0x1c,0x0e,0xff), 83/2, 23, v.name, self.icon_list[v.type], 1, cc.p(0.5, 0.5))

                if v.type == UnionConst.icon_type.union_icon_type_6 then --联盟战
                    self.icon_list[v.type].is_unlock = false
                elseif v.type == UnionConst.icon_type.union_icon_type_4 then --联盟副本
                    self.icon_list[v.type].is_unlock = false
                end
                registerButtonEventListener(self.icon_list[v.type], function(data)
                        self:onCheckIcon(data)		    		
                    end,true,1,v)
            end
        end
    end
end


--创建特效
function UnionNewMainWindow:createEffect()
    local tempArr = {}
    for i,v in pairs(Config.UnionData.data_guild_scene_icon) do
        if v.res_type == 2 then --2特效类型
            table_insert(tempArr, v)
        end
    end

    for i,v in ipairs(tempArr) do
        if self.map_layer1 then
            if self.effect_list[i] == nil then
                delayRun(self.root_wnd, i*2 / display.DEFAULT_FPS,function ()
                        if self.effect_list[i] == nil then
                            self.effect_list[i] = createEffectSpine(v.icon,cc.p(v.pos[1][1],v.pos[1][2]),cc.p(0.5, 0.5),true,PlayerAction.action_1,nil,cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)
                            if self.effect_list[i] and self.map_layer1 and not tolua.isnull(self.map_layer1) then
                                self.map_layer1:addChild(self.effect_list[i])	
                                if self.touch_pos and self.touch_pos[v.type] then
                                    local node = ccui.Layout:create()
                                    node:setContentSize(cc.size(83, 83))
                                    node:setPosition(self.touch_pos[v.type][1],self.touch_pos[v.type][2])
                                    node:setTouchEnabled(true)
                                    self.map_layer1:addChild(node)

                                    self.effect_list[i].is_idle_ing = false
                                    local function animationCompleteFunc(event) 
                                        if event.animation == PlayerAction.action_2 then
                                            if self.effect_list[i] and not tolua.isnull(self.effect_list[i]) then
                                                self.effect_list[i]:setAnimation(0, PlayerAction.action_1, true)
                                                self.effect_list[i].is_idle_ing = false
                                            end
                                        end
                                    end
                                    self.effect_list[i]:registerSpineEventHandler(animationCompleteFunc, sp.EventType.ANIMATION_COMPLETE) 

                                    node:addTouchEventListener(function(sender, event_type)
                                            if self.effect_list[i] == nil or tolua.isnull(self.effect_list[i]) or self.effect_list[i].is_idle_ing == true then return end
                                            self.effect_list[i].is_idle_ing = true
                                            self.effect_list[i]:setAnimation(0, PlayerAction.action_2, false)
                                        end)
                                end
                            end
                        end
                    end)
            end
        end
    end
end

--创建NPC
function UnionNewMainWindow:createNpc()
    local tempArr = {}
    for i,v in pairs(Config.UnionData.data_guild_scene_icon) do
        if v.res_type == 3 then -- 3npc类型
            table_insert(tempArr, v)
        end
    end

    for i,v in ipairs(tempArr) do
        if self.map_layer1 then
            if self.npc_list[i] == nil then
                delayRun(self.map_layer1, i*2 / display.DEFAULT_FPS,function ()
                        if self.npc_list[i] == nil then
                            self.npc_list[i] = createEffectSpine(v.icon,cc.p(v.pos[1][1],v.pos[1][2]),cc.p(0.5, 0.5),true,PlayerAction.action,nil,cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A4444)	
                            if self.npc_list[i] and self.map_layer1 and not tolua.isnull(self.map_layer1) then
                                self.map_layer1:addChild(self.npc_list[i])	
                            end
                        end
                    end)
            end
        end
    end
end



--==============================--
--desc:一些权限控制
--time:2018-06-05 04:41:34
--@return 
--==============================--
function UnionNewMainWindow:updateJurisdiction()
    if self.role_vo == nil then return end
    if self.role_vo.position == UnionConst.post_type.member then
        self.sign_btn:setVisible(false)
        self.change_name_btn:setVisible(false) 
    else
        self.sign_btn:setVisible(true)
        self.change_name_btn:setVisible(true)
    end
end

--==============================--
--desc:更新宣言
--time:2018-05-31 08:33:30
--@return 
--==============================--
function UnionNewMainWindow:updateUnionSignInfo()
    if self.my_union_info == nil then return end
    self.union_sign_value:setString(self.my_union_info.sign)
end

--==============================--
--desc:更新基础信息，等级，经验，成员数量，都是和等级相关的，所以在这里统一处理
--time:2018-05-31 08:33:42
--@return 
--==============================--
function UnionNewMainWindow:updateUnionBaseInfo()
    if self.my_union_info == nil then return end 
    self.union_lev_value:setString(string_format(TI18N("Lv.%s"), self.my_union_info.lev))
    local config = Config.UnionData.data_guild_lev[self.my_union_info.lev]
    if config ~= nil then
        if config.exp == 0 then
            self.progress_num:setString(TI18N("已满级"))
            self.progress:setPercent(100)
        else
            self.progress_num:setString(string_format("%s/%s", self.my_union_info.exp, config.exp))
            self.progress:setPercent(math.floor(self.my_union_info.exp/config.exp*100))
        end
    end

    -- 一些按钮权限开启的东西,只有未解锁才做判断
    self:checkUnionDunLockStatus()
    self:checkUnionWarStatus()
end

--==============================--
--desc:更新联盟名称
--time:2018-06-09 02:29:24
--@return 
--==============================--
function UnionNewMainWindow:updateUnionNameInfo()
    if self.my_union_info == nil then return end 
    self.union_name_value:setString(self.my_union_info.name) 
end

--==============================--
--desc:监测联盟副本开启状态
--time:2018-06-09 12:01:09
--@return 
--==============================--
function UnionNewMainWindow:checkUnionDunLockStatus()
   
end

-- 联盟战开启状态
function UnionNewMainWindow:checkUnionWarStatus(  )
  
end

--==============================--
--desc:更新联盟帮主
--time:2018-05-31 08:34:05
--@return 
--==============================--
function UnionNewMainWindow:updateUnionLeaderInfo()
    if self.my_union_info == nil then return end 
    self.union_leader_value:setString(self.my_union_info.leader_name) 
end


function UnionNewMainWindow:onCheckIcon(data )
    if not data then
        return
    end
    if data.type == UnionConst.icon_type.union_icon_type_1 then --秘境
        MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.UnionSecretArea)
    elseif data.type == UnionConst.icon_type.union_icon_type_2 then --技能
        UnionskillController:getInstance():openUnionSkillMainWindow(true)
    elseif data.type == UnionConst.icon_type.union_icon_type_3 then --宝库
        UnionmarketplaceController:getInstance():openUnionmarketplaceMainWindow(true)
    elseif data.type == UnionConst.icon_type.union_icon_type_4 then --副本
        if self.icon_list[UnionConst.icon_type.union_icon_type_4].is_unlock == false then
            local config = Config.UnionDunData.data_const.union_lev
            if config then
                message(config.desc)
                return
            end
        end 

        MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.UnionDun)
    elseif data.type == UnionConst.icon_type.union_icon_type_5 then --商店
        MallController:getInstance():openMallPanel(true, MallConst.MallType.UnionShop)
    elseif data.type == UnionConst.icon_type.union_icon_type_6 then --联盟站
        if self.icon_list[UnionConst.icon_type.union_icon_type_6].is_unlock == false then
            local config_lv = Config.UnionWarData.data_const.limit_lev -- 联盟等级显示
            local config_day = Config.UnionWarData.data_const.limit_open_time -- 开服天数限制
            if config_lv and config_day then
                local is_unlock =(self.my_union_info and self.my_union_info.lev >= config_lv.val)
                local tips_str = ""
                if is_unlock == true then
                    tips_str = config_day.desc
                else
                    tips_str = config_lv.desc
                end
                message(tips_str)
                return
            end
        end

        MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.UnionWar)
        -- 清除掉联盟战开启的红点
    elseif data.type == UnionConst.icon_type.union_icon_type_7 then --活跃
        if self.role_vo ~= nil then
            local lev = Config.UnionQuestData.data_guild_action_data.open_glev.val
            if self.role_vo.union_lev >= lev then
                controller:openUnionActionGoalWindow(true)
            else
                local str = string_format(TI18N("联盟达到%d级后开启"),lev)
                message(str)
            end
        end
    elseif data.type == UnionConst.icon_type.union_icon_type_8 then --捐献
        controller:openUnionDonateWindow(true)
    elseif data.type == UnionConst.icon_type.union_icon_type_9 then --红包
        RedbagController:getInstance():openMainView(true)
    elseif data.type ==10 then --红包
      
    end
end


--==============================--
--desc:更新红点状态,如果type未指定，则全部更新
--time:2018-06-07 10:29:53
--@type:
--@return 
--==============================--
function UnionNewMainWindow:updateSomeRedStatus(type, status)
  
end

function UnionNewMainWindow:close_callback()
    doStopAllActions(self.union_bg) 
    doStopAllActions(self.map_layer1)
    doStopAllActions(self.info_panel) 
    doStopAllActions(self.root_wnd)

    for i,v in pairs(self.effect_list) do
        if v then
            v:clearTracks()
            v:removeFromParent()
            v = nil
        end
    end
    self.effect_list = {}

    for i,v in pairs(self.npc_list) do
        if v then
            v:clearTracks()
            v:removeFromParent()
            v = nil
        end
    end
    self.npc_list = {}


    if self.my_union_info ~= nil then
        if self.update_my_union_info_event ~= nil then
            self.my_union_info:UnBind(self.update_my_union_info_event)
            self.update_my_union_info_event = nil
        end
        self.my_union_info = nil
    end
    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
        self.role_vo = nil
    end
    EventManager:getInstance():UnBind(self)
    controller:openUnionMainWindow(false)
end
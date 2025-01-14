--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-12 15:49:05
]]
ChatWindowLayer = ChatWindowLayer or BaseClass(BaseView)

local table_insert = table.insert
local ref_controller = RefController:getInstance()
local chat_controller = ChatController:getInstance()
local chat_model = ChatController:getInstance():getModel()

function ChatWindowLayer:__init(ctrl)
    self.view_tag     = ViewMgrTag.TOP_TAG
    self.control_mode = false
    self.time = 0
    self.is_top = false
    self.requestList = {} -- 好友请求列表
    self.tab_btn_list = {} --标签页按钮列表
    self.cur_selected = nil
    self.role_vo = RoleController:getInstance():getRoleVo()
    self.item_desc_list = {} 
    self.item_code_list = {}
    self.filt_is_show = false
    self.vip_is_show = (self.role_vo.is_show_vip == 1)
    self.cur_tab_idx = 0

    
    self.layout_name = "mainui/chat_window_layer"

end

function ChatWindowLayer:updateTabBar()
    self.stack_tag =
    {
        [1] = ChatConst.Channel.World,    
        [2] = ChatConst.Channel.Cross,
        [3] =  ChatConst.Channel.Notice,
        [4] = ChatConst.Channel.Gang,
        [5] = ChatConst.Channel.MyTeam,
        [6] = ChatConst.Channel.Friend,
        [7] = ChatConst.Channel.Province,
    }
    self.stack_pos =
    {
        [ChatConst.Channel.World]   = 1,
        [ChatConst.Channel.Cross]  = 2,
        [ChatConst.Channel.Notice] = 3,
        [ChatConst.Channel.Gang] = 4,
        [ChatConst.Channel.MyTeam] = 5,
        [ChatConst.Channel.Friend] = 6,
        [ChatConst.Channel.Province] = 7,
    }
end

--主容器
function ChatWindowLayer:createRootWnd()
    self.mask = self.root_wnd:getChildByName('background')
    self.mask:setTouchEnabled(true)
    self.mask:setContentSize(cc.size(SCREEN_WIDTH,SCREEN_HEIGHT))
    self.mask:setScale(display.getMaxScale())

    local height = display.height
    self.design_height = 1280                         --美术设计的高度
    self.design_width = 720
    self.rate = display.height * self.design_width/display.width / self.design_height
    self.real_height = height                         --游戏缩放后实际的高度
    self.offset_height = self.real_height-height      --缩放后增加的高度

    self.free_height = MainuiController:getInstance():getMainUi():getFreeSize()
    self.size = cc.size(SCREEN_WIDTH,self.free_height)
end

function ChatWindowLayer:initView()
    self.bg1 = self.root_wnd:getChildByName('main_container'):getChildByName('scroll_container')

    local size = self.bg1:getContentSize()
    self.bg1:setContentSize(cc.size(size.width,size.height*self.rate))
    local pos_y = self.bg1:getPositionY()

    local main_container = self.root_wnd:getChildByName('main_container')
    size = main_container:getContentSize()
    main_container:setContentSize(cc.size(size.width,size.height*self.rate))
    self.bg1:setPositionY(size.height*self.rate/2 - size.height/2  + pos_y)

    local left_container = self.root_wnd:getChildByName('left_container')
    size = left_container:getContentSize()
    left_container:setContentSize(cc.size(size.width,size.height*self.rate))

    self.tab_container =left_container:getChildByName('panel_tab')
    pos_y = self.tab_container:getPositionY()
    self.tab_container:setPositionY(pos_y*self.rate)

    local size = self.tab_container:getContentSize()
    self.tabScrollView = createScrollView(size.width,size.height,0,0,self.tab_container)

    --关闭按钮
    self.close_btn = left_container:getChildByName('close_btn')
    --频道背景
    local buttomBg = main_container:getChildByName('input')
    self.container_size = cc.size(display.width-16,display.height- buttomBg:getContentSize().height-36)
    --提示文字
    self.notice_label = main_container:getChildByName('Text_tip')
    --发送按钮
    self.btn_send = buttomBg:getChildByName('Button_Send')
    resetStudioButton(self.btn_send,ButtonType.red,TI18N("发送"))
    
    self:createTabBtnList()

    --输入组件
    self.chat_input = ChatInputNode.New()
    self.chat_input:ctor("chatWindow",nil,buttomBg)

    self.chat_input:setInputFunc(function()
            self:onEditBoxTouch()
        end)
    self.chat_input:setVoiceFunc(function(sender, event)
            self:beginRecord(sender, event)
        end)
end

function ChatWindowLayer:showAtNotice( status,data )
    if self.at_notice == nil then 

        self.at_notice = createImage(self.bg1, PathTool.getResFrame("mainui","mainui_chat_at_bg"), self.bg1:getContentSize().width-262, 130, cc.p(0.5,0.5), true, 0, true)
        self.at_notice:setCapInsets(cc.rect(41, 27, 2, 2))
        self.at_notice:setContentSize(cc.size(250, 52))
        self.at_notice:setAnchorPoint(0,0)

        self.at_notice:setTouchEnabled(true)
        self.at_notice:setLocalZOrder(99)
        self.at_label = createRichLabel(24, 1, cc.p(0,0.5), cc.p(25,self.at_notice:getContentSize().height/2), 0, 0, 150)
        self.at_label:setString(TI18N("有人提到了我"))
        self.at_notice:addChild(self.at_label)

        local line = createScale9Sprite(PathTool.getResFrame("mainui","hl_chat_32"), self.at_label:getPositionX()+self.at_label:getContentSize().width+22, self.at_notice:getContentSize().height/2, LOADTEXT_TYPE_PLIST, self.at_notice)

        self.at_close = CustomButton.New(self.at_notice, PathTool.getResFrame("mainui", "hl_chat_38"), PathTool.getResFrame("mainui", "hl_chat_38"),nil,LOADTEXT_TYPE_PLIST)
        self.at_close:setAnchorPoint(0,0.5)

        self.at_close:setPosition(self.at_notice:getContentSize().width-self.at_close:getContentSize().width-5,self.at_notice:getContentSize().height/2-2)
    end

    local function close_callback(  )
        self.at_notice:setVisible(false)
        chat_model:setAtData({})
        if data and next(data)~=nil then 
            chat_controller:sender12768( data.rid,data.srv_id,data.channel,data.msg )

        end 
    end

    handleTouchEnded(self.at_close,function (  )
            close_callback()
        end)

    if data and next(data)~=nil then 
        local id = chat_controller:getId(self.channel,data.srv_id,data.rid,data.name,data.msg)
        if self.channelList then
            local scroll = self.channelList[self.channel]
            if scroll and scroll.stack_item then
                local item = scroll.stack_item[id]
                if item then
                    self.at_notice:setVisible(status)
                else
                    self.at_notice:setVisible(false)
                end
            else
                self.at_notice:setVisible(false)
            end
        end
    else
        self.at_notice:setVisible(false)
    end

    self.at_notice:addTouchEventListener(function ( sender,event_type )
            if event_type == ccui.TouchEventType.ended then
                if data and next(data)~=nil then 
                    local id = chat_controller:getId(self.channel,data.srv_id,data.rid,data.name,data.msg)
                    local scroll = self.channelList[self.channel]
                    if scroll and scroll.stack_item then
                        local item = scroll.stack_item[id]
                        if item then
                            local precent = math.floor(((self.channelList[self.channel].realHeight-item:getPositionY()+item:getContentSize().height)/(self.channelList[self.channel].realHeight))*100)
                            scroll:jumpToPercentVertical(precent)
                            close_callback()
                        end
                    end               
                end
            end
        end)
end

--创建标签按钮
function ChatWindowLayer:createTabBtnList()
    self.tabArray = {
        {title = TI18N("系统"), index = 3, status = true},
        {title = TI18N("世界"), index = 1, status = true},
        {title = TI18N("私聊"), index = 6, status = true},
        {title = TI18N("跨服"), notice = TI18N("等级不足50级"), index = 2, status = true},
        {title = TI18N("公会"), notice = TI18N("您暂时没有加入公会"), index = 4, status = true},
        {title = TI18N("队伍"), notice = TI18N("您暂时没有加入队伍"), index = 5, status = true},
        {title = TI18N("同省"), notice = TI18N("等级不足35级"), index = 7, status = true},
    }

    self.tab_btn_list = {}
    table.sort(self.tabArray,function(a,b)
        return a.index<b.index
    end)
    local panel_size = self.tab_container:getContentSize()
    local height = 0
    local origin_y = panel_size.height-20
    for i,v in ipairs(self.tabArray)do
        v.is_open = self:checkBtnIsOpen(v.index)
        local sum = chat_controller:getChannelMsgSum(v.index)
        local tabItem = ChatTabNode.new()
        tabItem:setCallback(handler(self,self.setSelecteTab))
        tabItem:setData(v)
        tabItem:enableShowSelect(v.index == 1)
        tabItem:setDotNum(sum)

        table_insert(self.tab_btn_list,tabItem)
        self.tabScrollView:addChild(tabItem)
        tabItem:setPosition(10,origin_y)
        origin_y = origin_y - 180
        height = height + 180
    end
    self.tabScrollView:setInnerContainerSize(cc.size(panel_size.width,height))
    -- self:setSelecteTab(1)
end

function ChatWindowLayer:setSelecteTab(index)
    
    if self.cur_tab_idx == index or not self.stack_tag or not self.chat_input then return end
    local is_open = self:checkBtnIsOpen(index)
    -- print("==============setSelecteTab====",index,tostring(is_open))
    if not is_open then return end

    self.cur_tab_idx = index
    
    for k,v in ipairs(self.tab_btn_list) do
        v:enableShowSelect(false)
    end

    local tab_btn = self.tab_btn_list[index]
    
    if tab_btn then
        self:_onClickTabBtn(tab_btn,is_open)
    end
end

function ChatWindowLayer:_onClickTabBtn( tab_btn,is_open)
    if tab_btn then
        
        local sum = chat_controller:getChannelMsgSum(self.cur_tab_idx)
        self.cur_selected = tab_btn
        self.cur_selected:enableShowSelect(is_open)
        self.cur_selected:setDotNum(sum)
        self:openTagBtn(self.cur_tab_idx)
        -- print("==============is_open====",tostring(is_open))
        if self.cur_tab_idx == ChatConst.Channel.World then
            PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.At_notice)
        end
    end
end

-- 切换标签按钮
function ChatWindowLayer:openTagBtn(index)

    self.channel = self.stack_tag[index]
    chat_controller:setLastChannel(self.channel)
    self.chat_input:setChatChannel(self.channel)

    --队伍、宗门、综合、事件频道
    self:setCoseListDisable()
    self:showCoseList(self.channel)

    self.chat_input.root:setVisible(true)



    if self.channel == ChatConst.Channel.Event or self.channel == ChatConst.Channel.Notice then
        self.chat_input.root:setVisible(false)
        self.notice_label:setVisible(true)
    elseif self.channel == ChatConst.Channel.Province then
        local province_config = Config.MiscData.data_const["province_level"]
        if not province_config or self.role_vo.lev < province_config.val then
            self.chat_input.root:setVisible(false)
            self.notice_label:setVisible(false)
        else
            self.chat_input.root:setVisible(true)
            self.notice_label:setVisible(false)
        end
    else
        self.notice_label:setVisible(false)
    end

    -- 同省、跨服、世界、公会可以@人
    if self.channel == ChatConst.Channel.Province or self.channel == ChatConst.Channel.Cross or self.channel == ChatConst.Channel.World or self.channel == ChatConst.Channel.Gang then 
        local data = chat_model:getAtData()
        if data and next(data)~=nil then 
            self:showAtNotice(true,data)
        end
        self.chat_input.edit_box:setPlaceHolder(TI18N("请输入,长按头像可快捷@人"))
    else
        self.chat_input.edit_box:setPlaceHolder(TI18N("请输入信息"))
    end

    -- 切到同省频道则清一下输入框数据（同省频道屏蔽了道具等信息发送）
    if self.channel == ChatConst.Channel.Province then
        self:cleatInputText()
    end

    self:checkFindInput()
    --加入宗门提示
    self:analyseGang()
end


-- --==============================--
-- --desc:初始化聊天的条目
-- --@return 
-- --==============================--
-- function ChatWindowLayer:initChannelRedNum()
--     for i,tab_btn in ipairs(self.tab_btn_list) do
--         if i ~= 5 then
--             local channel = self.stack_tag[i]
--             self:setTabTipsII(channel) 
--         end
--     end
-- end

-- --==============================--
-- --desc:标签页红点,统一处理
-- --@channel:
-- --@return 
-- --==============================--
-- function ChatWindowLayer:setTabTipsII(channel)
--     if channel == nil then return end
--     local index = self.stack_pos[channel]
--     if index == nil then return end
--     local tab_btn = self.tab_btn_list[index]

--     if tab_btn then
--         local sum = chat_controller:getChannelMsgSum(channel)
--         self:setRedStatus(sum>0, sum,tab_btn)
--     end
-- end

-- function ChatWindowLayer:setRedStatus( status, num ,tab)
--     if tab == nil then return end
--     if status then
--         tab.tipNode:setVisible(true)
--         if num and num > 0 then
--             tab.tipNum:setVisible(true)
--             if num > 99 then
--                 tab.tipNum:setString("99")
--             else
--                 tab.tipNum:setString(num)
--             end
--         else
--             tab.tipNum:setVisible(false)
--         end
--     else
--         tab.tipNode:setVisible(false)
--         tab.tipNum:setVisible(false)
--     end
-- end

-- 打开关/闭界面伸缩处理
function ChatWindowLayer:playMoveAct(is_open)
    if self.moving then return end
    self.moving = true
end

-- 打开频道
function ChatWindowLayer:openChannel(channel,srv_id,rid)
    local index = self.stack_pos[channel]
    self.channel = channel
    self.select_srv_id = srv_id
    self.select_rid = rid

    -- self:setTabBtnTouchStatus(index)
    self:setSelecteTab(index)

end

-- 打开频道(只是频道切换)
function ChatWindowLayer:moveToChannel(channel)
    local index = self.stack_pos[channel]
    self.channel = channel

    -- self:setTabBtnTouchStatus(index)
    self:setSelecteTab(index)
end

-- --更新tabitem数据 页签数据
-- function ChatWindowLayer:updateChatTabData()
--     for i,v in ipairs(self.tabArray)do
--         v.is_open = self:checkBtnIsOpen(v.index)
--         local tabNode = self.tabArray[i]
--         tabNode:setData(v)
--     end
-- end
-- 初始化操作
function ChatWindowLayer:initCtrl()
    --收起按钮
    self.close_btn:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playQuitSound()
                chat_controller:closeChatUseAction()
            end
        end)

    --发送按钮
    handleTouchEnded(self.btn_send, function()
            self:onEditBoxTouch()
        end)
end

-- 录音
function ChatWindowLayer:beginRecord(sender, event)
    local channel = self.channel
    if channel == ChatConst.Channel.Multi or channel == ChatConst.Channel.Event then
        channel = ChatConst.Channel.World
    end
    ChatHelp.RecordTouched(sender, event, channel)
end


-- 查找框UI调整
function ChatWindowLayer:checkFindInput()
    if --[[not self.find_scroll and not self.commend_ui and not self.apply_scroll or]] self.channel==ChatConst.Channel.Event or self.channel==ChatConst.Channel.Notice then
        self.btn_send:setVisible(false)
        if self.find_input then
            self.f_edit_box:setPosition(70,0)
        end
    elseif self.channel == ChatConst.Channel.Province then
        local province_config = Config.MiscData.data_const["province_level"]
        if not province_config or self.role_vo.lev < province_config.val then
            self.btn_send:setVisible(false)
        else
            self.btn_send:setVisible(true)
        end
    else
        self.btn_send:setVisible(true)
        if  self.channel==ChatConst.Channel.Mail then
            self.btn_send:setTitleText(TI18N("返回"))

        else
            self.btn_send:setTitleText(TI18N("发送"))
        end
        if self.find_input then
            self.f_edit_box:setPosition(18,0)
        end
    end
end



-- 宗门频道显示处理
function ChatWindowLayer:analyseGang()
    if self.channel==ChatConst.Channel.Gang and not RoleController:getInstance():getRoleVo():isHasGuild() then
        chat_controller:clearChatLog(self.channel)
        local scroll = self:getCostList(ChatConst.Channel.Gang)
        if scroll then
            scroll:reset()
        end
        self:showJoinGang(true)
    else
        self:showJoinGang(false)
    end
end

-- 添加宗门提示
function ChatWindowLayer:showJoinGang(bool)
    if bool then
        if self.help_text == nil then
            self.help_text =createRichLabel(24, Config.ColorData.data_color4[66], cc.p(0.5,0.5), cc.p(0,0), nil, nil, 300)
            local str = TI18N("您暂时没有加入公会")
            self.help_text:setString(str)
            self.help_text:setAnchorPoint(0.5,0.5)
            self.help_text:setPosition(self.bg1:getContentSize().width/2, self.bg1:getContentSize().height/2-90)
            self.bg1:addChild(self.help_text)

            if self.no_img == nil then 
                local res = PathTool.getEmptyMark()
                self.no_img = createImage(self.bg1, res, self.bg1:getContentSize().width/2, self.bg1:getContentSize().height/2-2, cc.p(0.5,0.5), false, 1, false)
                self.no_img:setScale(1.2)
            end
        end
    else
        doRemoveFromParent(self.help_text)
        self.help_text = nil
        if self.no_img then
            doRemoveFromParent(self.no_img)
            self.no_img = nil
        end
    end
end

-- 事件处理
function ChatWindowLayer:registerNotifier(bool)
    if bool then
        --更新聊天
        self:addGlobalEvent(EventId.CHAT_UDMSG_WORLD, function(channel, is_self)
                self:updateCoseList(channel, is_self)
            end)


        --更新系统频道聊天
        self:addGlobalEvent(EventId.CHAT_UDMSG_ASSETS, function()
                self:updateCoseList(ChatConst.Channel.Notice)
            end)


        --清除输入文本
        self:addGlobalEvent(EventId.CHAT_CLEAR_INPUT, function(is_private)
                self:cleatInputText()
            end)


        --删除输入文字
        self:addGlobalEvent(EventId.CHAT_BACKSPACE, function(from_name)
                if from_name == "chatPanel" then
                    self:handleBackSpace()
                end
            end)


        --添加表情
        self:addGlobalEvent(EventId.CHAT_SELECT_FACE, function(face_id, from_name)
                if from_name == "chatWindow" then
                    self:onEditTextAddFace(face_id)
                end
            end)

        --添加物品
        self:addGlobalEvent(EventId.CHAT_SELECT_ITEM, function(data, from_name)
                if from_name == "chatWindow" then
                    self:onEditTextAddItem(data)
                end
            end)


        --更新翻译内容
        self:addGlobalEvent(ChatConst.Voice_Translate_Panel, function()
                self:adjustPosAfterTranslate()
            end)


        --点击发送按钮
        self:addGlobalEvent(EventId.CHAT_QUICK_SEND, function(from_name)
                if --[[not chat_controller:isPrivateOpen() and]] from_name == "chatPanel" then
                    self:onEditBoxTouch()
                end
            end)






        self:addGlobalEvent(EventId.CHAT_NEWMSG_FLAG, function(channel)
                self:setTabTipsII(channel)
            end)


        --创建完成聊天列表 更新下信息
        self:addGlobalEvent(ChatEvent.EndCallBack,function (  )
                if self.channel == ChatConst.Channel.Gang or self.channel == ChatConst.Channel.World then 
                    local data = chat_model:getAtData()
                    if data and next(data)~=nil then 
                        self:showAtNotice(true,data)
                    end
                    --self.chat_input.edit_box:setPlaceHolder(TI18N("请输入信息,长按头像可快捷@人"))
                else
                    --self.chat_input.edit_box:setPlaceHolder(TI18N("请输入信息"))
                end
            end)


        self:addGlobalEvent(SceneEvent.ENTER_FIGHT,function ()
                self:playMoveAct()
            end)

        --有公会的时候更改下状态
        if self.role_vo and self.role_update_lev_event == nil then
            self.role_update_lev_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE,function(key,value)
                    if key == "gsrv_id" or key == "gid" then
                        if self.role_vo:isHasGuild() then
                            self:setSelecteTab(2)
                        end
                    end
                end)
        end
    else
        if self.role_vo and self.role_update_lev_event then
            self.role_vo:UnBind(self.role_update_lev_event)
            self.role_update_lev_event = nil
        end
    end
end


-- 文本框操作
function ChatWindowLayer:onEditBoxTouch()

    local text, srv_id = self.chat_input:getInputText()
    srv_id = srv_id or ""
    --if self.channel == ChatConst.Channel.Friend then return end
    if self.channel == ChatConst.Channel.Event then
        message(TI18N("事件频道不能发言"))
        return
    end
    if self.chat_input:isNothing() then
        message(TI18N("请输入聊天信息"))
        return
    end

    local data = WordCensor:getInstance():relapceFaceIconTag(text)
    if data[1] > 5 then
        message(TI18N("发言中不能超过5个表情"))
        return
    end
    local tar_channel
    text = WordCensor:getInstance():relpaceChatTag(text)
    -- 展示物品替换
    if self.item_desc_list and next(self.item_desc_list) then
        for k,v in pairs(self.item_desc_list) do
            text = string.gsub(text, k, v, 1)
        end
    end

    if self.channel == ChatConst.Channel.World then     --世界聊天
        tar_channel = 1
        text = self:repleaceAtPeopleText(text, srv_id)
    elseif self.channel == ChatConst.Channel.Cross then --跨服聊天
        tar_channel = 1024
        text = self:repleaceAtPeopleText(text, srv_id)
    elseif self.channel == ChatConst.Channel.Province then -- 同省聊天
        tar_channel = 2048
        text = self:repleaceAtPeopleText(text, srv_id)
    elseif self.channel == ChatConst.Channel.Scene then --场景聊天
        tar_channel = 2
    elseif self.channel == ChatConst.Channel.MyTeam then --队伍聊天
        tar_channel = 4096
    elseif self.channel == ChatConst.Channel.Gang  then --帮派聊天
        if RoleController:getInstance():getRoleVo():isHasGuild() then
            tar_channel = 4
            text = self:repleaceAtPeopleText(text, srv_id)
        else
            message(TI18N("加入公会即可在此频道发言"))
        end
    elseif self.channel == ChatConst.Channel.Friend then --私聊频道
        tar_channel = nil
        local user_data = self.channelList[self.channel]:getUserData()
        if user_data and next(user_data)~=nil then
            chat_controller:sender12720(user_data.srv_id, user_data.rid, 0, text)
            self:cleatInputText()
        else
            message(TI18N("当前没人可以聊天~"))
        end

    end
    print("===========聊天发送===self.channel,tar_channel====",self.channel,tar_channel)
    if tar_channel then
        if GameNet:getInstance():getTime() - self.time > 1 then
            self.time =  GameNet:getInstance():getTime()
            local is_success = chat_controller:sendChatMsg(tar_channel, 0, text)
            if is_success then
                self:cleatInputText()
            end
        end
    end
end

function ChatWindowLayer:repleaceAtPeopleText( text, srv_id )
    local num1 = string.find(text,"@")
    local num2 = string.find(text," ")
    local len = string.len(text)
    if num1 and num2 then
        local at = string.sub(text,num1,num2)
        local rep = string.format("<div href=atpeople srvid=%s>%s</div>",srv_id,at)
        text = string.gsub(text,at,rep)
    end
    return text
end

function ChatWindowLayer:cleatInputText()
    self.chat_input:setInputText("")
    self.item_desc_list = {}
    self.item_code_list = {} 
end 

-- 删除输入的信息
function ChatWindowLayer:handleBackSpace()
    local text = self.chat_input:getInputText()
    if text ~= "" then
        local str_list, length = StringUtil.splitStr(text)
        local words = ""
        for i=1, #str_list-1 do
            words = words.. tostring(str_list[i].char)
        end
        self.chat_input:setInputText(words)
    end
end

-- 输入框添加表情
function ChatWindowLayer:onEditTextAddFace(face_id)
    local text = self.chat_input:getInputText()
    if text == self.default_msg then
        text = ""
    end

    self.chat_input:setInputText(text..face_id)
end

-- 输入框添加表情
function ChatWindowLayer:onEditTextAddItem(data)
    if data == nil then return end

    local text = self.chat_input:getInputText()
    if text == self.default_msg then
        text = ""
    end

    -- 如果没有文字内容，则清一下数据
    if text == "" then
        self.item_desc_list = {} 
        self.item_code_list = {}
    end

    local base_id = data.base_id
    local share_id = data.share_id
    local count = data.count
    local role_vo =  RoleController:getInstance():getRoleVo()
    local item_config = Config.ItemData.data_get_data(base_id)
    local code = data.code

    if item_config then
        local key = string.format("{%s,%s}", share_id, item_config.name)
        local desc = ref_controller:buildItemMsg(base_id, role_vo.srv_id, share_id, count)

        if self.item_code_list[code] then
            local cur_object = self.item_code_list[code]
            local cur_key = cur_object.key
            local cur_desc = cur_object.desc

            -- 获取原有的
            text = string.gsub(text, cur_key, key, 1)
        else
            text = text..key
        end
        self.item_code_list[code] = {key=key, desc=desc}

        self.item_desc_list[key] = desc
        self.chat_input:setInputText(text)
    end
end 

-- 获取输入文本内容
function ChatWindowLayer:getEditText()
    return self.chat_input:getInputText()
end

function ChatWindowLayer:initHandle()
    --默认信息
    self.default_msg = TI18N("请输入信息...")
    self.find_msg    = TI18N("点击查找好友")
    self:registerNotifier(true)
    self:createRootWnd()
    self:updateTabBar()
    self:initView()
    self:initCtrl()

end

-- 打开界面
function ChatWindowLayer:open_callback()
    self:initHandle()
    self.root_wnd:setVisible(true)
    self:setCommonUIZOrder(self.root_wnd)
    -- self:initChannelRedNum()
    chat_controller:openChatUITimer(false)    
    MainuiController:getInstance():setMainUIChatBubbleStatus(false)
end
--清理
function ChatWindowLayer:close_callback()
    SysEnv:getInstance():save()
    ChatMgr:getInstance():showReportUI(false)
    RefController:getInstance():closeView()
    self.root_wnd:setVisible(false)
    self.select_index = nil
    self:registerNotifier(false)
    self:setCoseListDisable()
    if self.mail_ui then
        self.mail_ui = nil
    end
    if self.friend_ui then
        self.friend_ui = nil
    end
    self.tab_btn_list = nil
    chat_controller.chat_ui = nil
    MainuiController:getInstance():setMainUIChatBubbleStatus(true)
end

-- 清掉聊天列表数据
function ChatWindowLayer:clearChatList(  )
    if not self.channelList then self.channelList = {} end
    for channel,scroll in pairs(self.channelList) do
        if channel ~= ChatConst.Channel.Friend then
            scroll:reset()
        end
    end
end

-- 打开状态
function ChatWindowLayer:isOpen()
    return self.is_open
end

-- 创建聊天列表
function ChatWindowLayer:showCoseList(channel)
    if not self.channelList then self.channelList = {} end
    if self:isChatChannel(channel) then
        for i,v in pairs(self.channelList) do
            if i ~= ChatConst.Channel.Friend then
                if v then
                    v:showNewMessage(false)
                    v:setVisible(false)
                end
            else
                if v then
                    v:setVisibleStatus(false)
                end
            end
        end
        local scroll = self.channelList[channel]
        local size = self.container_size
        local pos = cc.p(12,5)
        local bg1size = self.bg1:getContentSize()
        if not scroll then
            if channel ~= ChatConst.Channel.Friend then
                local size = cc.size(bg1size.width - 24,bg1size.height - 10)
                scroll = NewCoseList.new(size,self.bg1)
                scroll:setPosition(pos)
                self.bg1:addChild(scroll,22)
            else
                chat_controller:openPrivatePanel(true,nil,self.bg1)
                scroll = chat_controller:getChatPanel()
            end
            self.channelList[channel] = scroll
        else
            if channel ~= ChatConst.Channel.Friend then
                scroll:SetEnabled(true)
            end
        end
        if channel ~= ChatConst.Channel.Friend then
            if chat_controller.stack_list == nil then return end
            delayRun(self.bg1, 1/display.DEFAULT_FPS, function()
                    if self.channelList and self.channel and self.channelList[self.channel] and self.channelList[self.channel]["createMsg"] then
                        self.channelList[self.channel]:createMsg(chat_controller.stack_list[self.channel], self.channel)
                    end
                end) 
        else
            self.channelList[self.channel]:setVisibleStatus(true)
            self.channelList[self.channel]:updateData(self.select_srv_id,self.select_rid)
        end
    end
end

-- 更新当前频道数据
function ChatWindowLayer:updateCoseList(channel, is_self)
    if not self.channelList then return end
    if self:isChatChannel(self.channel) and self.channel == channel then
        local scroll = self.channelList[self.channel]
        if self.channel ~= ChatConst.Channel.Friend then
            if scroll and scroll:isSame(self.channel) then
                scroll:SetEnabled(true)
                scroll:initData(chat_controller.stack_list[self.channel])
                scroll:updateMsg(is_self)
            end
        else
            local scroll1 = scroll:getCostList()
            if scroll1 and scroll1:isSame(self.channel) then
                scroll1:SetEnabled(true)
                scroll1:initData(chat_controller.stack_list[self.channel])
                scroll1:updateMsg()
            end

        end
    end
end

-- 翻译内容更新
function ChatWindowLayer:adjustPosAfterTranslate()
    if self.channelList then
        for k, v in pairs(self.channelList) do
            if k~=ChatConst.Channel.Friend then
                v:adjustItemPos()
            else
                local vo = self:getCostList(k)
                if vo and vo["adjustItemPos"] then
                    vo:adjustItemPos()
                end
            end
        end
    end
end

-- 隐藏所有的聊天内容
function ChatWindowLayer:setCoseListDisable()
    if self.channelList then
        for k, v in pairs(self.channelList) do
            if k~=  ChatConst.Channel.Friend then      
                v:SetEnabled(false)
            else
                v:setVisibleStatus(false)
            end
        end
    end
end

-- 获取某一个频道滚动组件
function ChatWindowLayer:getCostList(channel)
    if self.channelList then
        if channel ~= ChatConst.Channel.Friend then
            return self.channelList[channel]
        else
            return self.channelList[channel]
        end
    end
end

-- 清掉所有数据
function ChatWindowLayer:clearAllChatMsg(  )
    if self.channelList then
        for k, v in pairs(self.channelList) do
            if k~=  ChatConst.Channel.Friend then      
                v:reset()
            end
        end
    end
end

-- 判断是否是聊天频道#
function ChatWindowLayer:isChatChannel(channel)
    if channel==ChatConst.Channel.Gang
    or channel==ChatConst.Channel.World
    or channel == ChatConst.Channel.Notice
    or channel == ChatConst.Channel.Friend
    or channel == ChatConst.Channel.Province
    or channel == ChatConst.Channel.Cross 
    or channel == ChatConst.Channel.MyTeam then
        -- or channel == ChatConst.Channel.Scene 
        -- or channel == ChatConst.Channel.Team then
        return true
    end
    return false
end

-- 判断是否要显示下拉筛选按钮
function ChatWindowLayer:isShowFiltBtn( channel )
    if FILTER_CHARGE then return false end -- 屏蔽充值相关
    if channel==ChatConst.Channel.World
    or channel == ChatConst.Channel.Gang
    or channel == ChatConst.Channel.Cross then
        return true
    end
    return false
end


--判断是否开启按钮
function ChatWindowLayer:checkBtnIsOpen( index )
    if index == 4 and RoleController:getInstance():getRoleVo():isHasGuild()==false then
        return false
    elseif index == 2 then
        local cross_config = Config.MiscData.data_const["cross_level"]
        return self.role_vo.lev >= cross_config.val
    elseif index == 7 then
        local province_config = Config.MiscData.data_const["province_level"]
        return self.role_vo.lev >= province_config.val
    end
    return true
end

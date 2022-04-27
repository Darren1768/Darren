--伙伴状态设置界面
--
local chat_controller = ChatController:getInstance()
local ref_controller = RefController:getInstance()

ChatMainuiPanel = class("ChatMainuiPanel", function()
        return ccui.Widget:create()
    end)

function ChatMainuiPanel:ctor(ctrl,parent)

    self.time = 0
    -- showHead
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("mainui/chat_mainui_panel"))
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.main_panel = self.root_wnd:getChildByName("main_panel")

    self.container = self.main_panel:getChildByName("container")
    local buttomBg = self.main_panel:getChildByName('input')
    self.btn_send = buttomBg:getChildByName('Button_Send')
    self.btn_chat = buttomBg:getChildByName('Button_Chat')

   

    local size = self.container:getContentSize()
    self.cose_list = NewCoseList.new(size,self.container)
    self.container:addChild(self.cose_list,22)
    self.cose_list:setPosition(cc.p(0,0))
    
    if ctrl.stack_list then
        self.cose_list:createMsg(ctrl.stack_list[ChatConst.Channel.World],ChatConst.Channel.World)
    end
    self.cose_list:showMonkey(false)

    self.channel = ChatConst.Channel.World
    --输入组件
    self.chat_input = ChatInputNode.New()
    self.chat_input:ctor("chatMainuiPanel","输入聊天信息.....",buttomBg)

     -- 前面提示
    --  self.btn_keyboard = buttomBg:getChildByName('Button_Chat')
    --  self.btn_keyboard:setLocalZOrder(999)
    --  self.btn_keyboard:setPosition(cc.p(-100,50))
    self.hl_chat_sprite = buttomBg:getChildByName('hl_chat_sprite')

    self.chat_input:setInputFunc(function()
            self:onEditBoxTouch()
        end)
    self.chat_input:setVoiceFunc(function(sender, event)
            self:beginRecord(sender, event)
        end)
    --发送按钮
    handleTouchEnded(self.btn_send, function()
            self:onEditBoxTouch()
        end)

    handleTouchEnded(self.btn_chat, function()
            ChatController:getInstance():openChatPanel()
        end)

    self:register_event()
end

function ChatMainuiPanel:register_event()
    EventManager:getInstance():Bind(EventId.CHAT_UDMSG_WORLD,self, function()
            local ctrl = ChatController:getInstance()
            if self.cose_list then

                self.cose_list:initData(ctrl.stack_list[ChatConst.Channel.World])
                self.cose_list:updateMsg(true,true)
                self.cose_list:showMonkey(false)
            end
        end)

    --添加表情
    EventManager:getInstance():Bind(EventId.CHAT_SELECT_FACE,self, function(face_id, from_name)
            if from_name == "chatMainuiPanel" then
                self:onEditTextAddFace(face_id)
            end
        end)

    --添加物品
    EventManager:getInstance():Bind(EventId.CHAT_SELECT_ITEM,self, function(data, from_name)
            if from_name == "chatMainuiPanel" then
                self:onEditTextAddItem(data)
            end
        end)
end

function ChatMainuiPanel:onEditBoxTouch()
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

function ChatMainuiPanel:repleaceAtPeopleText( text, srv_id )
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

function ChatMainuiPanel:cleatInputText()
    self.chat_input:setInputText("")
    self.item_desc_list = {}
    self.item_code_list = {} 
end 

-- 录音
function ChatMainuiPanel:beginRecord(sender, event)
    local channel = self.channel
    if channel == ChatConst.Channel.Multi or channel == ChatConst.Channel.Event then
        channel = ChatConst.Channel.World
    end
    ChatHelp.RecordTouched(sender, event, channel)
end

-- 输入框添加表情
function ChatMainuiPanel:onEditTextAddFace(face_id)
    local text = self.chat_input:getInputText()
    if text == self.default_msg then
        text = ""
    end

    self.chat_input:setInputText(text..face_id)
end

-- 输入框添加表情
function ChatMainuiPanel:onEditTextAddItem(data)
    if data == nil then return end

    print(data)
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

-- 移除数据
function ChatMainuiPanel:close_callback()

end

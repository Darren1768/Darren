--聊天输入/语音切换组件


ChatInputNode = ChatInputNode or BaseClass(BaseView)

function ChatInputNode:ctor(from, default_msg,node)
    self.from_name = from or "chatPanel"
    self.ctrl = ChatController:getInstance()
    self.default_msg = default_msg or TI18N("请输入，长按玩家头像可快捷@人")
    self.input_model = true -- 当前输入方式 1为键盘，2为语音
    self.root = node
    self:initView()
    self:initCtrl()
end

function ChatInputNode:initView()

    if self.from_name == "chatPanel" then
        local height = 62 -- 整体高度
        local editSize = cc.size(287,height)
        local voiceBtnSize = cc.size(287,height)

        self.model_btn = CustomButton.New(self.root,PathTool.getResFrame("mainui", "mainui_chat_sound_icon"),nil,nil,LOADTEXT_TYPE_PLIST)
        self.model_btn:setAnchorPoint(0.5,0.5)
        self.model_btn:setPosition(cc.p(-256,0))
        self.model_btn:setVisible(IS_SHOW_VOICE)

        self.edit_box = createEditBox(self.root, PathTool.getResFrame("mainui", "hl_mainui_chat_28"),editSize, nil, 22, cc.c3b(79, 51, 57), 20, self.default_msg, nil, nil, LOADTEXT_TYPE_PLIST, nil, nil--[[, cc.KEYBOARD_RETURNTYPE_SEND]])
        self.edit_box:setAnchorPoint(cc.p(0,0))
        self.edit_box:setPlaceholderFontColor(ChatConst.MianInputColor)
        self.edit_box:setFontColor(Config.ColorData.data_color4[66])
        self.edit_box:setPosition(-220,-27)
        self.edit_box:setMaxLength(40)

        self.voice_btn = CustomButton.New(self.root,PathTool.getResFrame("mainui", "mainui_chat_btn_1"),nil,nil,LOADTEXT_TYPE_PLIST)
        self.voice_btn:setAnchorPoint(0.5,0.5)
        self.voice_btn:setPosition(cc.p(-230+voiceBtnSize.width/2,voiceBtnSize.height/2-32))
        self.voice_btn:setSize(voiceBtnSize)
        local voiceStr = string.format("<div fontcolor=#4F3339 >%s</div>", TI18N("长按输入语音"))
        self.voice_btn:setRichText(voiceStr,24)
        self.voice_btn:setVisible(false)
        self.link_btn = CustomButton.New(self.root,PathTool.getResFrame("mainui", "mainui_chat_face_icon"),nil,nil,LOADTEXT_TYPE_PLIST)
        self.link_btn:setAnchorPoint(0.5,0.5)
        self.link_btn:setPosition(cc.p(self.edit_box:getPositionX()+editSize.width+34,self.model_btn:getPositionY()))
    elseif self.from_name == "chatWindow" or self.from_name == "chatMainuiPanel" or self.from_name == ChatConst.ChatInputType.eArenateam then
        self.model_btn = self.root:getChildByName('Button_talk')
        self.keyboard_btn = self.root:getChildByName('Button_keyboard')
        self.model_btn:setVisible(IS_SHOW_VOICE)
        self.keyboard_btn:setVisible(false)

        local editSize = cc.size(292,48)

        if self.from_name == "chatMainuiPanel" then
            editSize = cc.size(222,28)
            self.edit_box = createEditBox(self.root, PathTool.getResFrame("mainui", "hl_mainui_chat_28") ,editSize, cc.c3b(239, 212, 174), 20, cc.c3b(49, 41, 39), 16, self.default_msg, nil, nil, LOADTEXT_TYPE_PLIST, nil, nil--[[, cc.KEYBOARD_RETURNTYPE_SEND]])
            self.edit_box:setPlaceholderFontColor(cc.c3b(239, 212, 174))
            self.edit_box:setFontColor(cc.c3b(239, 212, 174))
            self.edit_box:setPosition(20,0)
            self.edit_box:setOpacity(1)
        else
            self.edit_box = createEditBox(self.root, PathTool.getResFrame("mainui", "hl_chat_3"),editSize,cc.c3b(79, 51, 57), 24, cc.c3b(79, 51, 57),  16, self.default_msg, nil, nil, LOADTEXT_TYPE_PLIST, nil, nil--[[, cc.KEYBOARD_RETURNTYPE_SEND]])
            self.edit_box:setPosition(-80,0)
        end
        self.edit_box:setAnchorPoint(cc.p(0.5,0.5))
        self.edit_box:setMaxLength(40)

        self.voice_btn = self.root:getChildByName('Button_talkinput')
        self.voice_btn:setVisible(false)

        self.link_btn = self.root:getChildByName('Button_emoj')
    end


end

-- 切换输入方式
function ChatInputNode:changeInputModel(  )
    if IS_IOS_PLATFORM == true then
        -- message("语音暂不可用!")
        return
    end
    self.input_model = not self.input_model
    if self.from_name == "chatPanel" then
        if self.input_model  then
            local res = PathTool.getResFrame("mainui", "mainui_chat_keybord_icon")
            self.model_btn:loadTextures(PathTool.getResFrame("mainui", "mainui_chat_keybord_icon"), "", "", LOADTEXT_TYPE_PLIST)
        else
            self.model_btn:loadTextures(PathTool.getResFrame("mainui", "mainui_chat_sound_icon"), "", "", LOADTEXT_TYPE_PLIST)
        end
    else
        self.model_btn:setVisible(self.input_model)
        self.keyboard_btn:setVisible(not self.input_model)
    end

    self.link_btn:setVisible(self.input_model)
    self.edit_box:setVisible(self.input_model)
    self.voice_btn:setVisible(not self.input_model)
end

function ChatInputNode:initCtrl()
    self.voice_btn:addTouchEventListener(function(sender, event)
            if IS_IOS_PLATFORM == true then
                -- message("语音暂不可用!")
            else
                if self.voice_func then
                    self.voice_func(sender, event)
                end
            end
        end)

    self.model_btn:addTouchEventListener(function(sender, event)
            if event == ccui.TouchEventType.ended then
                self:changeInputModel()
            end
        end)
    if self.keyboard_btn then
        self.keyboard_btn:addTouchEventListener(function(sender, event)
                if event == ccui.TouchEventType.ended then
                    self:changeInputModel()
                end
            end)
    end

    self.link_btn:addTouchEventListener(function( sender,eventType )
            if eventType == ccui.TouchEventType.ended then
                local world_pos = self.root:convertToWorldSpace(cc.p(0, 0))
                local setting = {}
                setting.world_pos = world_pos
                setting.offset_y = 48
                if self.from_name == "chatMainuiPanel" then
                    world_pos.x = world_pos.x + 200
                end
                RefController:getInstance():openView(self.from_name, setting, self.chat_channel)
            end    
        end)
end

function ChatInputNode:showVoice(bool)
    self.model_btn:setVisible(not bool)
    self.edit_box:setVisible(not bool)
    self.link_btn:setVisible(not bool)
end

-- 设置文本回调
function ChatInputNode:setInputFunc(func)
    self.input_func = func
end

-- 点击语音回调
function ChatInputNode:setVoiceFunc(func)
    self.voice_func = func
end

-- 文本框内容
function ChatInputNode:getInputText()
    return self.edit_box:getText(), self.extend
end

function ChatInputNode:setInputText(str, extend)
    self.extend = extend
    if self.edit_box then
        if not str then
            str=""
        end
        -- self.edit_box._text_ = str
        self.edit_box:setText(str)
    end
end

-- 文本框内容是否为空
function ChatInputNode:isNothing()
    local text = self.edit_box:getText()
    if text == "" or text == self.default_msg then
        return true
    end
end

--设置当前聊天频道
function ChatInputNode:setChatChannel( channel )
    self.chat_channel = channel
end
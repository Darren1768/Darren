-- --------------------------------------------------------------------
-- @description:
--      公会宣言修改
--
-- --------------------------------------------------------------------
UnionChangeSignWindow = UnionChangeSignWindow or BaseClass(BaseView)

local controller = UnionController:getInstance()
local model = UnionController:getInstance():getModel()
local string_format = string.format

function UnionChangeSignWindow:__init()
	self.view_tag = ViewMgrTag.DIALOGUE_TAG
	
	self.win_type = WinType.Mini
	self.set_index = 1
	self.condition_index = 1
	self.layout_name = "union/union_change_sign_window"

    self.limit_sad_count=32

end 

function UnionChangeSignWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale()) 

    local container = self.root_wnd:getChildByName("container")
    self:playEnterAnimatianByObj(container, 2)
    self.close_btn = container:getChildByName("close_btn")
    self.confirm_btn = container:getChildByName("confirm_btn")

    local notice = container:getChildByName("notice")
    notice:setString(TI18N("联盟公告：")) 
 

    local confirm_label = self.confirm_btn:getChildByName("label")
    confirm_label:setString(TI18N("确定")) 


    self.label_content = createRichLabel(22, cc.c3b(129,104,65), cc.p(0,1), cc.p(80, 230), 6, nil, 480,DEFAULT_FONT)
    self.label_content:setString( TI18N("请输入联盟公告内容"))
    container:addChild(self.label_content)

    local res = PathTool.getResFrame("common", "common_99998")
    self.edit_title  = createEditBox(container, res, cc.size(496, 130), nil, 22, Config.ColorData.data_color4[151], 22, TI18N(""), nil, nil, LOADTEXT_TYPE_PLIST)
    self.edit_title:setAnchorPoint(cc.p(0, 1))
    self.edit_title:setPlaceholderFontColor(cc.c3b(129,104,65))
    self.edit_title:setFontColor(cc.c3b(129,104,65))
    self.edit_title:setPosition(cc.p(64, 236))
    self.edit_title:setMaxLength(32) 


    local editBoxTextEventHandle = function(event, pSender)
        local edit = tolua.cast(pSender,"ccui.EditBox")
        if event == "began" then
            self.label_content:setString("")
        end
        
        if event == "changed" then
            local str = self.edit_title:getText()
            -- pSender:setText("")
           
            -- self:setLabelContent(str)
        end
        
        if event == "return" then
            local str = pSender:getText()
            pSender:setText("")
            local tmpStr = string.gsub(str, " ", "")
            if tmpStr == "" then
                self.label_content:setString(normalStr)
            else
                self:setLabelContent(str)

                -- self.label_content:setString(str)
            end
        end
    end
    self.edit_title:registerScriptEditBoxHandler(editBoxTextEventHandle)
end

function UnionChangeSignWindow:register_event()
	self.close_btn:addTouchEventListener(function(sender, event_type)
		if event_type == ccui.TouchEventType.ended then
			playQuitSound()
			controller:openUnionChangeSignWindow(false)
		end
	end)
	self.confirm_btn:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            if isQingmingShield and isQingmingShield() then
                return
            end

			playCommonButtonSound()
            local target_name =self.label_content:getString()
            if target_name == "" then
                message(TI18N("公告不能为空！"))
            else
                controller:requestChangeUnionSign(target_name)
            end
		end
	end)
end 

function UnionChangeSignWindow:openRootWnd()
end

function UnionChangeSignWindow:setLabelContent(str)
    if not str then return end
    if StringUtil.SubStringGetTotalIndex(str) > self.limit_sad_count then
        str = StringUtil.SubStringUTF8(str, 1, self.limit_sad_count)
    end
    self.content_str = str
    self.label_content:setString(str)
end

function UnionChangeSignWindow:close_callback()
    controller:openUnionChangeSignWindow(false) 
end
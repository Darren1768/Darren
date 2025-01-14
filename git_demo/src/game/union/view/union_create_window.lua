-- --------------------------------------------------------------------
-- @description:
--      联盟宣言修改
--
-- --------------------------------------------------------------------
UnionCreateWindow = UnionCreateWindow or BaseClass(BaseView)

local controller = UnionController:getInstance() 
local model = UnionController:getInstance():getModel()
local string_format = string.format

function UnionCreateWindow:__init()
	self.view_tag = ViewMgrTag.DIALOGUE_TAG
	
	self.win_type = WinType.Mini
	self.set_index = 1
	self.condition_index = 1
	self.layout_name = "union/union_create_window"
    self.limit_title_count=12
    self.limit_sad_count=48
    self.content_str=""
    self.content_title_str =""
end 

function UnionCreateWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale()) 

    local container = self.root_wnd:getChildByName("container")
    self:playEnterAnimatianByObj(container, 2)
    -- self.close_btn = container:getChildByName("close_btn")
    self.confirm_btn = container:getChildByName("confirm_btn")
    local container = self.root_wnd:getChildByName("container")


    local res = PathTool.getResFrame("common", "common_99998")
    self.title_label_content = createRichLabel(22, cc.c4b(129, 104,65,0xff), cc.p(0,1), cc.p(164, 274), 12, nil, 360,DEFAULT_FONT)
    self.title_label_content:setString( TI18N("请输入联盟名字(2~6个字)"))
    container:addChild(self.title_label_content)

    self.edit_title = createEditBox(container, res, cc.size(490, 44), nil, 22,cc.c3b(255,255,255), 22, "", nil, nil, LOADTEXT_TYPE_PLIST)
    self.edit_title:setAnchorPoint(cc.p(0, 0.5))
    self.edit_title:setPlaceholderFontColor(cc.c3b(129, 104,65,1))
    self.edit_title:setFontColor(cc.c3b(129, 104,65,1))
    self.edit_title:setPosition(cc.p(164, 264))
    self.edit_title:setMaxLength(6)
    self.close_btn  =  container:getChildByName("close")

    local editBoxTextEventHandleTitle = function(event, pSender)
        local edit = tolua.cast(pSender,"ccui.EditBox")
        if event == "began" then
            self.title_label_content:setString("")
        end
        
        if event == "changed" then
            -- local str = self.edit_title:getText()
            -- pSender:setOpacity(0.01)
            -- self:setLabelTitleContent(str)
              -- pSender:setText("")
        end
        
        if event == "return" then
            local str = pSender:getText()
            pSender:setText("")
            local tmpStr = string.gsub(str, " ", "")
            if tmpStr == "" then
                self.title_label_content:setString(normalStr)
            else
                self:setLabelTitleContent(str)
                -- self.title_label_content:setString(str)
            end
        end
    end
    self.edit_title:registerScriptEditBoxHandler(editBoxTextEventHandleTitle)


    self.label_content = createRichLabel(22, cc.c4b(129, 104,65,0xff), cc.p(0,1), cc.p(164, 220), 6, nil, 360,DEFAULT_FONT)
    self.label_content:setString( TI18N("请输入联盟宣言内容"))
    container:addChild(self.label_content)

    self.declaration_value = createEditBox(container, res, cc.size(490, 112), nil, 22,cc.c3b(255,255,255), 22,"", nil, nil, LOADTEXT_TYPE_PLIST)
    self.declaration_value:setAnchorPoint(cc.p(0, 1))
    self.declaration_value:setPlaceholderFontColor(cc.c3b(129, 104,65))
    self.declaration_value:setFontColor(cc.c3b(129, 104,65))
    self.declaration_value:setPosition(cc.p(164, 220))
    self.declaration_value:setMaxLength(100) 

 
    local editBoxTextEventHandle = function(event, pSender)
        local edit = tolua.cast(pSender,"ccui.EditBox")
        if event == "began" then
            self.label_content:setString("")
        end
        
        if event == "changed" then
            local str = self.declaration_value:getText()
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
    self.declaration_value:registerScriptEditBoxHandler(editBoxTextEventHandle)

    if Config.UnionData.data_sign_length > 0 then
        local index = math.random( 1, Config.UnionData.data_sign_length )
        local config = Config.UnionData.data_sign[index]
        if config ~= nil then
            self.label_content:setString(config.sign)
        end
    end

    local desc_vip = container:getChildByName("desc_vip")

    self.create_btn = container:getChildByName("create_btn")
    local size = self.create_btn:getContentSize()
    local role_vo = RoleController:getInstance():getRoleVo()

    local lev = Config.UnionData.data_const.maintain_vip_condition

    local config = Config.UnionData.data_const.create_gold
    local gold_num = 100
    if config ~= nil then
        gold_num = config.val
    end
    local item_config = Config.ItemData.data_get_data(Config.ItemData.data_assets_label2id.gold) 
    local item_icon = 2
    if item_config ~= nil then
        item_icon = item_config.icon
    end
    self.create_btn_label = createRichLabel(26, cc.c3b(255,238,202), cc.p(0.5, 0.5), cc.p(size.width * 0.5, size.height * 0.5+5), nil, nil, size.width,TITLE_FONT)
    self.create_btn:addChild(self.create_btn_label)
    
    local str = string.format(TI18N("需达VIP%d才可创建联盟"),lev.val)
    desc_vip:setString(str)
    if role_vo.vip_lev < lev.val then
        self.create_btn:setTouchEnabled(false)
        self.create_btn_label:setString(string.format("<img src=%s visible=true scale=0.3 />%s %s", PathTool.getItemRes(item_icon), gold_num, TI18N("创建联盟")))
        setChildUnEnabled(true, self.create_btn)
    else
        self.create_btn_label:setString(string.format("<img src=%s visible=true scale=0.3 /><div outline=0,#764519>%s %s</div>", PathTool.getItemRes(item_icon), gold_num, TI18N("创建联盟")))
    end



end


function UnionCreateWindow:setLabelContent(str)
    if not str then return end
    if StringUtil.SubStringGetTotalIndex(str) > self.limit_sad_count then
        str = StringUtil.SubStringUTF8(str, 1, self.limit_sad_count)
    end
    self.content_str = str
    self.label_content:setString(str)
end

function UnionCreateWindow:setLabelTitleContent(str)
    if not str then return end
    if StringUtil.SubStringGetTotalIndex(str) > self.limit_title_count then
        str = StringUtil.SubStringUTF8(str, 1, self.limit_title_count)
    end
    self.content_title_str = str
    self.title_label_content:setString(str)
end
function UnionCreateWindow:register_event()
    self.create_btn:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            local union_name =  self.title_label_content:getString()
            
            if union_name == "" then
                message(TI18N("联盟名称不能为空"))
            elseif StringUtil.getStrLen(union_name) > 12 then
                message(TI18N("联盟名字不得超过6个文字"))
            else
                self.set_index =0
                local sign = self.label_content:getString()
                controller:requestCreateUnion(union_name, sign, self.set_index, 1, 0) 

            end
        end
    end) 
    
	registerButtonEventListener(self.background, function()
        controller:openUnionCreatWindow(false)
    end, true, 2)
    registerButtonEventListener(self.close_btn, function()
        controller:openUnionCreatWindow(false)
    end, true, 2)
end 

function UnionCreateWindow:openRootWnd()
end

function UnionCreateWindow:close_callback()
    controller:openUnionCreatWindow(false) 
end
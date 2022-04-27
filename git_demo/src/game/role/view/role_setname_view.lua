-- --------------------------------------------------------------------
-- @description:
--      角色取名界面
-- --------------------------------------------------------------------
RoleSetNameView = RoleSetNameView or BaseClass(BaseView) 

function RoleSetNameView:__init( ctrl )
    self.ctrl = ctrl
    
    self.win_type = WinType.Tips
    self.view_tag = ViewMgrTag.DIALOGUE_TAG  
    self.layout_name = "roleinfo/role_setname_view"

    self.sex_select = 1 --当前选择的性别 1:boy 2:girl
    self.name_random = true -- 当前名字是否是随机的
    self.bind_role = true
    self.is_bind_code = nil
    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("face","face"), type = ResourcesType.plist },
    }
end

function RoleSetNameView:open_callback(  )
    self.main_panel = self.root_wnd:getChildByName("main_panel")
    -- self:playEnterAnimatianByObj(self.main_panel , 1)
    self.backpanel = self.root_wnd:getChildByName("backpanel")
    self.backpanel:setOpacity(128)
    self.backpanel:setScale(display.getMaxScale())

    local panelSize = self.main_panel:getContentSize()
    
    self.boy_btn = self.main_panel:getChildByName("boy_btn")
    self.boy_btn:setVisible(false)
  
    self.girl_btn = self.main_panel:getChildByName("girl_btn")
    self.girl_btn:setVisible(false)

    self.boy_title = self.main_panel:getChildByName("boy_title")
    self.girl_title = self.main_panel:getChildByName("girl_title")
    self.boy_selct = self.boy_btn:getChildByName("Sprite_8")  
    self.girl_selct = self.girl_btn:getChildByName("Sprite_7")  

    -- 提交按钮
    self.submit_btn = self.main_panel:getChildByName("btn_submit")
    self.submit_btn:setVisible(false)
    local submit_btn_label = self.submit_btn:getChildByName("label")
    -- submit_btn_label:setString(TI18N("提交"))

    -- 随即按钮
    self.random_btn = self.main_panel:getChildByName("btn_random")
    self.random_btn:setVisible(false)
    self.random_btn:setLocalZOrder(11)

    --邀请码
    -- local str = TI18N("请输入推荐码 (可不填)")
    -- self.invite_code_edit = createEditBox(self.main_panel, PathTool.getResFrame("common", "hl_chat_3"), cc.size(280, 50), cc.c4b(0x95,0x95,0x95,0xff), 26, cc.c4b(0x95,0x95,0x95,0xff), 26, str, nil, 12, LOADTEXT_TYPE_PLIST)
    -- self.invite_code_edit:setPosition(437,377)
    -- self.invite_code_edit:setVisible(false)
    -- self.invite_code_edit:setInputMode(cc.EDITBOX_INPUT_MODE_NUMERIC)

    -- local function onEditInviteCodeEvent(event)
    --     if event.name == "began" then
    --         self.invite_code_edit:setPlaceHolder("")
    --         self.invite_code_edit:setText("")
    --     end
    -- end
    -- self.invite_code_edit:onEditHandler(onEditInviteCodeEvent)

    self.title_label_content = createRichLabel(22, cc.c4b(236, 209,172,0xff), cc.p(0,1), cc.p(230, 770), 6, nil, 360,TITLE_FONT)
    self.title_label_content:setString( TI18N("请输入名字"))
    self.main_panel:addChild(self.title_label_content)
    self.title_label_content:setZOrder(2)
  
    -- 名字输入框
    self.input_edit = createEditBox(self.main_panel, PathTool.getResFrame("common", "hl_common_2204"), cc.size(219, 41), Config.ColorData.data_color3[175], 24, Config.ColorData.data_color3[151], 24, placeholder, nil, 6, LOADTEXT_TYPE_PLIST)
    self.input_edit:setVisible(false)
    self.input_edit:setRotation(90)
    self.input_edit:setPosition(cc.p(240,683))
    local randomName = RoleController:getInstance():getRandomName(self.sex_select)
    -- self.input_edit:setText(StringUtil.branchStr(randomName))
    self.title_label_content:setString(StringUtil.branchStr(randomName))
    self.input_edit:setZOrder(1)

    self.name_random = true
    local function onEditChangeEvent(event)
        -- if event.name == "began" then
        --     self.temp_name = self.input_edit:getText()
        --     self.input_edit:setText("")
        -- elseif event.name == "ended" then
        --     if self.input_edit:getText() ~= self.temp_name then
        --         self.name_random = false
        --     end
        -- end
        if event.name== "began" then
            self.title_label_content:setString("")
        end
        
        if event == "changed" then
            -- local str = self.edit_title:getText()
            -- pSender:setOpacity(0.01)
            -- self:setLabelTitleContent(str)
              -- pSender:setText("")
        end
        
        if event.name== "return" then
            local str = self.input_edit:getText()
            self.input_edit:setText("")
            local tmpStr = string.gsub(str, " ", "")
            if tmpStr == "" then
                self.title_label_content:setString(StringUtil.branchStr(tmpStr))
            else
                self:setLabelTitleContent(str)
                -- self.title_label_content:setString(str)
            end
        end
    end
    self.input_edit:onEditHandler(onEditChangeEvent)

    local effect_id = 237
    local code_visible = true
    local boy = {374.5, 454}
    local gird = {499.5,454}
    local subit = {353, 296.5}
    local edit = {346.5,521}
    local random = {517, 522}
    if ACCOUNT_HAS_ROLE then
        effect_id = 234
        code_visible = false
        boy = {288, 393}
        gird = {448.5,393}
        subit = {353, 307}
        edit = {347,491}
        random = {519, 493}
    end
    -- 性别选择按钮
    -- self.boy_btn:setPosition(cc.p(boy[1], boy[2]))
    -- self.girl_btn:setPosition(cc.p(gird[1], gird[2]))
    -- self.submit_btn:setPosition(cc.p(subit[1],subit[2]))
    -- self.input_edit:setPosition(edit[1],edit[2])
    -- self.random_btn:setPosition(cc.p(random[1],random[2]))
    delayRun(self.input_edit, 0.1, function ()
        self.input_edit:setVisible(true)
        self.submit_btn:setVisible(true)
        self.boy_btn:setVisible(true)
        self.girl_btn:setVisible(true)
        self.random_btn:setVisible(true)
        -- self.invite_code_edit:setVisible(code_visible)
    end)
    self:refreshSexBoxStatus()


    self.guo_list = {}
    self.guo_select_index = 1
    -- 国家选择
    for i =1,2 do 
       local obj ={}
       local btn = self.main_panel:getChildByName("guo_"..i)
       obj.btn = btn 
       obj.normal = btn:getChildByName("normal")
       obj.select = btn:getChildByName("select")
       obj.guo_name = btn:getChildByName("guo_name")
       obj.select:setVisible(false)
       if i  == self.guo_select_index then 
          obj.normal:setVisible(false)
          obj.select:setVisible(true)
       end 
       obj.index =i 
       self.guo_list[i]=obj 
    end



    --播放卷轴动画
    -- local function playEndCallBack()
    -- 	if not tolua.isnull(self.bgSpine) then
    -- 		self.bgSpine:setAnimation(0, PlayerAction.action_2, true)
    --         self.input_edit:setVisible(true)
    --         self.submit_btn:setVisible(true)
    --         self.boy_btn:setVisible(true)
    --         self.girl_btn:setVisible(true)
    --         self.random_btn:setVisible(true)
    --         self.invite_code_edit:setVisible(code_visible)
    -- 	end
    -- end
    -- self.bgSpine = createEffectSpine(PathTool.getEffectRes(effect_id), cc.p(0, 0), cc.p(0.5, 0), false, PlayerAction.action_1,playEndCallBack)
    -- self.main_panel:addChild(self.bgSpine, -1)
end

function RoleSetNameView:register_event(  )
    self.main_panel:addTouchEventListener(function ( sender,event_type )
        if event_type == ccui.TouchEventType.ended then
            RoleController:getInstance():openRoleSetNameView(false)
        end
    end)
    self.boy_btn:addTouchEventListener(function ( sender,event_type )
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            self.sex_select = 1
            self:refreshSexBoxStatus()
            -- 切换性别时，如果当前名字为玩家自己取的，则不再随机
            if self.name_random == true then
                local randomName = RoleController:getInstance():getRandomName(self.sex_select)
                -- self.input_edit:setText(StringUtil.branchStr(randomName))
                self.title_label_content:setString(StringUtil.branchStr(randomName))

                self.name_random = true
            end
        end
    end)

    self.girl_btn:addTouchEventListener(function ( sender,event_type )
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            self.sex_select = 2
            self:refreshSexBoxStatus()
            -- 切换性别时，如果当前名字为玩家自己取的，则不再随机
            if self.name_random == true then
                local randomName = RoleController:getInstance():getRandomName(self.sex_select)
                -- self.input_edit:setText(StringUtil.branchStr(randomName))
                self.title_label_content:setString(StringUtil.branchStr(randomName))
                self.name_random = true
            end
        end
    end)


    self:addGlobalEvent(InviteCodeEvent.BindCode_Invite_Event, function(data)
        self.bind_role = true
        if data.code == 1 then
            self.is_bind_code = true
            if self.title_label_content:getString()~="" then
                local text = string.gsub(self.title_label_content:getString(), "\n", "")
                local sex = 1 -- 男
                if self.sex_select == 2 then
                    sex = 0 -- 女
                end
                self.ctrl:changeRoleName(text,sex)
            elseif self.title_label_content:getString()=="" then
                message(TI18N("请输入姓名~"))
            end
        end
    end)

    registerButtonEventListener(self.submit_btn, function()
        if self.bind_role == false then
            message(TI18N("正在绑定推荐码中~~~"))
            return
        end

        if self.title_label_content:getString()~="" then
            local text = string.gsub(self.title_label_content:getString(), "\n", "")
            local sex = 1 -- 男
            if self.sex_select == 2 then
                sex = 0 -- 女
            end
            self.ctrl:changeRoleName(text,sex)
        elseif self.title_label_content:getString()=="" then
            message(TI18N("请输入姓名~"))
        end
        -- if self.invite_code_edit:getText() ~= "" and not self.is_bind_code then
            -- self.bind_role = false
            -- local text = self.invite_code_edit:getText()
            -- text = string.match(text, "%d+")

            -- if self.send_code_ticket == nil then
            --     self.send_code_ticket = GlobalTimeTicket:getInstance():add(function()
            --         self.bind_role = true
            --         if self.send_code_ticket ~= nil then
            --             GlobalTimeTicket:getInstance():remove(self.send_code_ticket)
            --             self.send_code_ticket = nil
            --         end
            --     end,1)
            -- end
            -- InviteCodeController:getInstance():sender19801(tonumber(text))
        -- else
        --     if self.input_edit:getText()~="" then
        --         local text = string.gsub(self.input_edit:getText(), "\n", "")
        --         local sex = 1 -- 男
        --         if self.sex_select == 2 then
        --             sex = 0 -- 女
        --         end
        --         self.ctrl:changeRoleName(text,sex)
        --     elseif self.input_edit:getText()=="" then
        --         message(TI18N("请输入姓名~"))
        --     end
        -- end
    end,true, 1)

    self.random_btn:addTouchEventListener(function ( sender,event_type )
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            local randomName = RoleController:getInstance():getRandomName(self.sex_select)
            -- self.input_edit:setText(randomName)
            self.title_label_content:setString(StringUtil.branchStr(randomName))

            self.name_random = true
        end
    end)

    for i =1,2 do 
        local obj =self.guo_list[i]
        obj.btn:addTouchEventListener(function ( sender,event_type )
            if event_type == ccui.TouchEventType.ended then
                self.guo_select_index = obj.index
               if obj.index == 1 then
                
                self.guo_list[1].select:setVisible(true)
                self.guo_list[1].normal:setVisible(false)
                self.guo_list[2].normal:setVisible(true)
                self.guo_list[2].select:setVisible(false)
               else 
                self.guo_list[2].select:setVisible(true)
                self.guo_list[2].normal:setVisible(false)
                self.guo_list[1].normal:setVisible(true)
                self.guo_list[1].select:setVisible(false)
               end 
            end
        end)
     end
end

function RoleSetNameView:setLabelTitleContent(str)
    if not str then return end
    self.content_title_str = str
    self.title_label_content:setString(StringUtil.branchStr(str))

end
-- 刷新当前性别框选中状态
function RoleSetNameView:refreshSexBoxStatus(  )
    

    if self.sex_select == 1 then 
        self.boy_title:setTextColor(cc.c3b(98,53,43))
        self.girl_title:setTextColor(cc.c3b(129,104,65))
        self.boy_selct:setVisible(true)
        self.girl_selct:setVisible(false)
    else
        self.boy_title:setTextColor(cc.c3b(129,104,65))
        self.girl_title:setTextColor(cc.c3b(98,53,43))
        self.boy_selct:setVisible(false)
        self.girl_selct:setVisible(true )
    end
	-- self.boy_btn:setSelected(self.sex_select == 1)
	-- self.girl_btn:setSelected(self.sex_select == 2)
end

function RoleSetNameView:close_callback(  )
    if self.bgSpine then
        self.bgSpine:clearTracks()
        self.bgSpine:removeFromParent()
        self.bgSpine = nil
    end
    if self.send_code_ticket ~= nil then
        GlobalTimeTicket:getInstance():remove(self.send_code_ticket)
        self.send_code_ticket = nil
    end
    self.input_edit:stopAllActions()
    -- self.invite_code_edit:stopAllActions()
end
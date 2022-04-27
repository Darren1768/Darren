-- --------------------------------------------------------------------
-- @description:
--      任命或者免职以及踢人面板
--
-- --------------------------------------------------------------------
UnionOperationPostWindow = UnionOperationPostWindow or BaseClass(BaseView)

local controller = UnionController:getInstance()
local model = UnionController:getInstance():getModel()
local string_format = string.format

function UnionOperationPostWindow:__init()
	self.view_tag = ViewMgrTag.DIALOGUE_TAG
	
	self.win_type = WinType.Mini
	self.set_index = 1
	self.condition_index = 1
	self.layout_name = "union/union_operation_post_window"
end 

function UnionOperationPostWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale()) 
    
    local container = self.root_wnd:getChildByName("container")
    
    self:playEnterAnimatianByObj(container, 2)
    container:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("管理设置"))
    self.notice =  createRichLabel(22, cc.c4b(129,104,45,0xff), cc.p(0.5, 0.5), cc.p(312, 254), 5, nil,600)
    container:addChild(self.notice)
        self.close_btn = container:getChildByName("close_btn")

    self.setleader_btn = container:getChildByName("setleader_btn")              -- 转让联盟长
    self.setleader_btn:getChildByName("label"):setString(TI18N("转让联盟长"))

    self.setmember_btn = container:getChildByName("setmember_btn")              -- 设置副联盟长或者罢免
    self.setmember_btn_label = self.setmember_btn:getChildByName("label")       

    self.center_y = self.setmember_btn:getPositionY()

    self.kickout_btn = container:getChildByName("kickout_btn")                  -- 踢人
    self.kickout_btn:getChildByName("label"):setString(TI18N("移除出联盟")) 
end

function UnionOperationPostWindow:register_event()
    self.close_btn:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playQuitSound()
            controller:openUnionOperationPostWindow(false)
        end
    end)
    registerButtonEventListener(self.background, function()
        controller:openUnionOperationPostWindow(false)
    end ,false, 2)

    registerButtonEventListener(self.setleader_btn,function()
        if self.data ~= nil then
            local str = string.format(TI18N("转让后您的身份将变为普通成员，是否确认将联盟长职位转让[%s]？"),self.data.name)
            local function call_back()
              

                controller:requestOperationPost(self.data.rid, self.data.srv_id, UnionConst.post_type.leader) 
            end
            CommonAlert.show(str, TI18N("确定"), call_back, TI18N("取消"), nil, CommonAlert.type.rich,nil,{timer=5, timer_for=true, off_y = 10},26)
        end
    end,true)


    self.setmember_btn:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            if sender.index ~= nil and self.data ~= nil then
                controller:requestOperationPost(self.data.rid, self.data.srv_id, sender.index)
            end
        end
    end) 
    self.kickout_btn:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            if self.data ~= nil then
                controller:requestKickoutMember(self.data.rid, self.data.srv_id, self.data.name)
            end
        end
    end)  
end

--==============================--
--desc:
--@list: 列表中 对应的1：转让联盟长 2：任命副联盟长 3：罢免副联盟长 4：踢出联盟
--@return 
--==============================--
function UnionOperationPostWindow:openRootWnd(data)
    
    if data ~= nil then
        self.data = data
        self.notice:setString(string.format(TI18N("你将对成员<div fontcolor=47832d>%s</div>进行:"), data.name))
        if data.role_post == UnionConst.post_type.leader then
            if data.post == UnionConst.post_type.assistant then     -- 自己是帮主，目标是帮帮主
                self.setmember_btn_label:setString(TI18N("罢免副联盟长")) 
                self.setmember_btn.index = UnionConst.post_type.member
            else
                self.setmember_btn.index = UnionConst.post_type.assistant
                self.setmember_btn_label:setString(TI18N("任命副联盟长")) 
            end
        elseif data.role_post == UnionConst.post_type.assistant then    -- 自己是帮帮主
            if data.post == UnionConst.post_type.member then            -- 目标是成员，只有踢出
                self.kickout_btn:setPositionY(self.center_y)
                self.setleader_btn:setVisible(false)
                self.setmember_btn:setVisible(false) 
            else
                self.kickout_btn:setVisible(false)
                self.setleader_btn:setVisible(false)
                self.setmember_btn:setVisible(false) 
            end 
        end
    end
end

function UnionOperationPostWindow:close_callback()
    CommonAlert.closeAllWin()
    controller:openUnionOperationPostWindow(false)
end
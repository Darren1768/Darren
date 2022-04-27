-- --------------------------------------------------------------------
-- 竖版好友列表子项
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
FriendListItem2 = class("FriendListItem2", function()
	return ccui.Widget:create()
end)

function FriendListItem2:ctor(index,open_type)
	self.width = 558
    self.height = 108
	self.ctrl = FriendController:getInstance()
	self:setCascadeOpacityEnabled(true)
    self:setContentSize(cc.size(self.width,self.height))
    self:setAnchorPoint(cc.p(0.5, 0))
    self.index = index or 1
    self.item_list = {}
    self.is_del = false
    self.open_type = open_type or FriendConst.Type.MyFriend
	self:configUI()
end

function FriendListItem2:clickHandler( ... )
	if self.call_fun then
   		self:call_fun(self.vo)
   	end
end
function FriendListItem2:setTouchFunc( value )
	self.call_fun =  value
end

function FriendListItem2:addCallBack( value )
	self.call_fun =  value
end

--[[
@功能:创建视图
@参数:
@返回值:
]]
function FriendListItem2:configUI( ... )
    local csbPath = PathTool.getTargetCSB("friend/friend_item_2")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)
    self.root_wnd:setAnchorPoint(cc.p(0.5,0.5))
    self.root_wnd:setPosition(cc.p(self.width/2,self.height/2))

    self.main_panel = self.root_wnd:getChildByName("main_panel")
    --头像
    self.play_head = PlayerHead.new(PlayerHead.type.circle)
    self.main_panel:addChild(self.play_head)
    self.play_head:setPosition(cc.p(62,56))
    self.play_head:setScale(0.85)
    --名字
    -- self.role_name = createLabel(26,cc.c4b(98,53,44,0xff),nil,160,70,"",self.main_panel,0, cc.p(0,0))
    self.role_name = self.main_panel:getChildByName("role_name")

    self.bg = self.main_panel:getChildByName("bg")
    --战力
    self.role_power = CommonNum.new(101, self.main_panel, nil, -1, cc.p(0, 0.5))
    self.role_power:setPosition(144,46)
    --在线
    -- self.is_online = createLabel(20,cc.c4b(0x70,0x61,0x4A,0xff),nil,330,45,"",self.main_panel,0, cc.p(0,0))
    self.is_online = self.main_panel:getChildByName("is_online")
    self.is_online:setPosition(360,36)

    self.chat_btn =  self.main_panel:getChildByName("chat_btn")
    self.chat_btn:setVisible(false)

    self.cancel_btn =  self.main_panel:getChildByName("cancel_btn")
    self.cancel_btn:setVisible(false)
end

function FriendListItem2:setExtendData(open_type) 
    self.open_type = open_type
end

--[[
@功能:设置数据
@参数:
@返回值:
]]
function FriendListItem2:setData(data)
    if data == nil then return end
    self:unBindEvent()
    self.vo = data
    if data and data._index and  data._index%2 ==1 then 
        self.bg:setVisible(true )
     else
         self.bg:setVisible(false )

    end 
    -- if open_type then 
    --     self.open_type = open_type 
    -- end
    self:updateMessage()
    self.play_head:setHeadRes(data.face_id, false, LOADTEXT_TYPE, data.face_file, data.face_update_time)

    self.play_head:setHeadData(data)
    if data.lev then
        self.play_head:setLev(data.lev)
    end
    self.play_head:addCallBack(function( )
        if self.open_type == FriendConst.Type.BlackList then
            ChatController:getInstance():openChatReportWindow(true, self.vo, 2)
        else
            self.ctrl:openFriendCheckPanel(true,self.vo)
        end
    end)
    if data.name then
        local name = data.name or ""
        if data.srv_id then 
            name = transformNameByServ(name, data.srv_id)
        end
        self.role_name:setString(name)
    end

    if data.power then
        local power = data.power or 0
        self.role_power:setNum(power)
    end

    self:updateOnlineTime()
    self:addVoBindEvent()
    --self:updateMyFriend()
end

--更新在线时间
function FriendListItem2:updateOnlineTime()
    if not self.vo then return end
    if not self.is_online then return end
    local str 
    if self.vo.is_online and self.vo.is_online == 0 then 
        -- str = TI18N("离线")
        local time 
        if self.vo.login_out_time == 0 then
            time = TimeTool.day2s() * 4
        else
            local srv_time = GameNet:getInstance():getTime()
            time = srv_time - self.vo.login_out_time    
        end
        str = TimeTool.GetTimeFormatFriendShowTime(time)
    else
        str = TI18N("在线")
    end
    self.is_online:setString(str)
end

function FriendListItem2:addVoBindEvent()
    -- 直接用数据去监听这样避免了刷新的频繁
    if type(self.vo) == "table" and self.vo and self.vo ~= nil and self.vo.Bind then
        if self.item_update_event == nil then
            self.item_update_event = self.vo:Bind(FriendVo.UPDATE_FRIEND_ATTR_LOGIN_OUT_TIME, function(vo)
                self:updateOnlineTime()
            end)
        end
    end
end


function FriendListItem2:unBindEvent()
    if self.vo then
        if self.item_update_event ~= nil then
            self.vo:UnBind(self.item_update_event)
            self.item_update_event = nil
        end
        self.vo = nil
    end
end

--根据类型创建显隐相关控件
function FriendListItem2:updateMessage()
    self:hideAllPanel()
    if self.open_type == FriendConst.Type.MyFriend then 
        self:updateMyFriend()
    elseif self.open_type == FriendConst.Type.Award then 
        self:updateAwardPanel()
    elseif self.open_type == FriendConst.Type.ApplyList then 
        self:updateApplyPanel()
    elseif self.open_type == FriendConst.Type.BlackList then  
        self:updateBlackPanel()
    elseif self.open_type == FriendConst.Type.AddFriend then 
        self:updateRecommendPanel()
    end
end
function FriendListItem2:hideAllPanel()
    if self.my_friend then 
        self.my_friend:setVisible(false)
    end
    if self.award_panel then 
        self.award_panel:setVisible(false)
    end
    if self.apply_panel then 
        self.apply_panel:setVisible(false)
    end
    if self.black_panel then 
        self.black_panel:setVisible(false)
    end
    if self.del_friend_btn then 
        self.del_friend_btn:setVisible(false)
    end

    if self.recommend_panel then 
        self.recommend_panel:setVisible(false)
    end
end
--更新好友列表的控件
function FriendListItem2:updateMyFriend()
    self.is_del = self.ctrl:getFriendWndDelStatus()
    if not self.my_friend then 
        self.my_friend = ccui.Widget:create()
        self.my_friend:setContentSize(cc.size(self.width,self.height))
        self.my_friend:setAnchorPoint(cc.p(0.5,0.5))
        self.my_friend:setPosition(cc.p(self.width/2-8,self.height/2+17))
        self.main_panel:addChild(self.my_friend)
        --赠送按钮
        local res = PathTool.getResFrame("common","hl_common_69")
        self.send_btn = createButton(self.my_friend, "", 425, 55,nil, res)
        
        self.send_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                if not self.vo then return end
                self.ctrl:sender_13316(0, self.vo.rid, self.vo.srv_id)
            end
        end)
        
        local res2 = PathTool.getResFrame("common","hl_common_68")
        createSprite(res2,25, 25,self.send_btn,cc.p(0.5,0.5), LOADTEXT_TYPE_PLIST,0,true)
        
        --私聊按钮

        local str = TI18N("私聊")
        -- self.chat_btn1 = createTypeButton(self.my_friend, str, 525, 55, ButtonType.red)
        self.chat_btn:setVisible(true)
        self.chat_btn:setPosition(cc.p(480,55))
        self.chat_btn.label = self.chat_btn:getTitleRenderer()
        self.chat_btn.label:setString(str)
        self.chat_btn.label:setPositionY(55/2+1)
        self.chat_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                ChatController:getInstance():openChatPanel(ChatConst.Channel.Friend,"friend",self.vo)
                --MainuiController:getInstance():openMianChatChannel(ChatConst.Channel.Friend,self.vo)
                FriendController:getInstance():openFriendWindow(false)
            end
        end)
    end

    if self.is_del == false then
        self.my_friend:setVisible(true)
    else
        self:setDelStatus(true)
    end

    if not self.vo then return end

    if self.vo.is_present and self.vo.is_present == 1 then 
        self.send_btn:setGrayAndUnClick(true)
    else
        self.send_btn:setGrayAndUnClick(false)
    end
end

--更新赠送的控件
function FriendListItem2:updateAwardPanel()
    if not self.award_panel then 
        self.award_panel = ccui.Widget:create()
        self.award_panel:setContentSize(cc.size(self.width,self.height))
        self.award_panel:setAnchorPoint(cc.p(0.5,0.5))
        self.award_panel:setPosition(cc.p(self.width/2,self.height/2))
        self.main_panel:addChild(self.award_panel)

        --友情点标志
        local res = PathTool.getResFrame("common","hl_common_68")
        self.friend_icon = createButton(self.award_panel, "", 432, 57, nil, res, 24, Config.ColorData.data_color4[1])
        self.friend_icon:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                if not self.vo then return end
                self.ctrl:sender_13316(1, self.vo.rid, self.vo.srv_id)
            end
        end)

        --赠送友情点按钮

        local str = TI18N("回礼")
        self.return_btn = createTypeButton(self.award_panel, str, 525, 57, ButtonType.red)
        self.return_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                if not self.vo then return end
                self.ctrl:sender_13316(0, self.vo.rid, self.vo.srv_id)
            end
        end)
    end
    self.return_btn:setGrayAndUnClick(false)
    
    self.friend_icon:setGrayAndUnClick(false)
    self.award_panel:setVisible(true)
   
    if not self.vo then return end
    if self.vo.is_present and self.vo.is_present == 1 then 
        self.return_btn:setGrayAndUnClick(true)
        
    end
    if self.vo.is_draw and self.vo.is_draw == 0 then 
        self.friend_icon:setGrayAndUnClick(true)
    end
end
--更新申请列表的控件
function FriendListItem2:updateApplyPanel()
    if not self.apply_panel then 
        self.apply_panel = ccui.Widget:create()
        self.apply_panel:setContentSize(cc.size(self.width,self.height))
        self.main_panel:addChild(self.apply_panel)
        self.apply_panel:setAnchorPoint(cc.p(0.5,0.5))
        self.apply_panel:setPosition(cc.p(self.width/2,self.height/2))
       
        self.is_online:setVisible(false)
        --拒绝按钮

       
        self.cancel_btn:setVisible(true)
        self.cancel_btn:setPosition(cc.p(335,55))
        local str = TI18N("拒绝")
        -- self.cancel_btn = createTypeButton(self.apply_panel, str, 335, 55, ButtonType.yellow_mid)
        self.cancel_btn.label = self.cancel_btn:getTitleRenderer()
        self.cancel_btn.label:setString(str)
        self.cancel_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                if not self.vo then return end
                self.ctrl:accept(self.vo.srv_id,self.vo.rid,0)
            end
        end)
        self.cancel_btn.label:setPositionY(55/2+1)

        --接受按钮

        local str = TI18N("接受")
        -- self.ok_btn = createTypeButton(self.apply_panel, str, 480, 55, ButtonType.red_mid)
        self.chat_btn:setVisible(true)
        self.chat_btn:setPosition(cc.p(480,55))
        self.chat_btn.label = self.chat_btn:getTitleRenderer()
        self.chat_btn.label:setString(str)
        self.chat_btn.label:setPositionY(55/2+1)
        self.chat_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                if not self.vo then return end
                self.ctrl:accept(self.vo.srv_id,self.vo.rid,1)
            end
        end)
    end
    self.apply_panel:setVisible(true)

end

--更新黑名单的控件
function FriendListItem2:updateBlackPanel()
    if not self.black_panel then 
        self.black_panel = ccui.Widget:create()
        self.black_panel:setContentSize(cc.size(self.width,self.height))
        self.black_panel:setAnchorPoint(cc.p(0.5,0.5))
        self.black_panel:setPosition(cc.p(self.width/2,self.height/2))
        self.main_panel:addChild(self.black_panel)


        --赠送友情点按钮

        local str = TI18N("移除")
        -- self.del_btn = createTypeButton(self.black_panel, str, 480, 55, ButtonType.red_mid)
        self.cancel_btn:setVisible(false)
        self.chat_btn:setVisible(true)
        self.chat_btn:setPosition(cc.p(480,55))
        self.chat_btn.label = self.chat_btn:getTitleRenderer()
        self.chat_btn.label:setString(str)
        self.chat_btn.label:setPositionY(55/2+1)
        self.chat_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                if not self.vo then return end
                self.ctrl:deleteBlackList(self.vo.rid, self.vo.srv_id)
            end
        end)
    end
    self.black_panel:setVisible(true)

end



--更新推荐好友的控件
function FriendListItem2:updateRecommendPanel()
    if not self.recommend_panel then 
        self.recommend_panel = ccui.Widget:create()
        self.recommend_panel:setContentSize(cc.size(self.width,self.height))
        self.recommend_panel:setAnchorPoint(cc.p(0.5,0.5))
        self.recommend_panel:setPosition(cc.p(self.width/2,self.height/2))
        self.main_panel:addChild(self.recommend_panel)


        --赠送友情点按钮

        local str = TI18N("加为好友")

        self.cancel_btn:setVisible(false)
        self.chat_btn:setVisible(true)
        self.chat_btn:setPosition(cc.p(480,55))
        self.chat_btn.label = self.chat_btn:getTitleRenderer()
        self.chat_btn.label:setString(str)
        self.chat_btn.label:setPositionY(55/2+1)

        -- self.chat_btn = createTypeButton(self.recommend_panel, str, 480, 55, ButtonType.red_mid)
        self.chat_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                if not self.vo then return end
                self.ctrl:addOther(self.vo.srv_id,self.vo.rid)
                self.chat_btn.label:setString(TI18N("等待同意"))
                -- self.chat_btn:setGrayAndUnClick(true)
                setChildUnEnabled(true,self.chat_btn)

                
            end
        end)
    end
    setChildUnEnabled(false,self.chat_btn)
    -- self.chat_btn:setGrayAndUnClick(false)
    self.chat_btn.label:setString(TI18N("加为好友"))
    
    self.recommend_panel:setVisible(true)
end
function FriendListItem2:isHaveData()
	if self.vo then
		return true
	end
	return false
end
function FriendListItem2:setDelStatus(bool)
    if bool and bool == true then 
        self:hideAllPanel()
    end
    self.is_del = bool
    if not self.del_friend_btn and bool == false then return end 
    if not self.del_friend_btn then 

        local str = TI18N("删除好友")
        -- self.del_friend_btn = createTypeButton(self.main_panel, str, 480, 55, ButtonType.yellow_mid)


        self.chat_btn:setVisible(false)
        self.cancel_btn:setVisible(true)
        self.cancel_btn:setPosition(cc.p(480,55))
        self.cancel_btn.label = self.cancel_btn:getTitleRenderer()
        self.cancel_btn.label:setString(str)
        self.cancel_btn.label:setPositionY(55/2+1)

    
        self.cancel_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                if not self.vo then return end
                self.ctrl:delOther( self.vo.srv_id, self.vo.rid )
            end
        end)
    end
    -- self.del_friend_btn:setVisible(bool)
    self.cancel_btn:setVisible(bool)

    if bool == false then
        self:updateMyFriend()
    end
end

function FriendListItem2:suspendAllActions()
end

function FriendListItem2:getData( )
	return self.vo
end

function FriendListItem2:DeleteMe()
    self:unBindEvent()
	self:removeAllChildren()
	self:removeFromParent()
end

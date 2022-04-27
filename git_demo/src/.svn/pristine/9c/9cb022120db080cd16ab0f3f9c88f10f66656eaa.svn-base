--[[
    记录 item
]]
ArenaLoopMyLogItem1 = class("ArenaLoopMyLogItem1",function() return ccui.Layout:create() end)

local string_format = string.format

function ArenaLoopMyLogItem1:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/new_arena_loop_my_log_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.main_container = self.root_wnd:getChildByName("main_container")
    self.main_container:setSwallowTouches(false)

    
    local right_role = self.main_container:getChildByName("right_role")
    self.right_head = PlayerHead.new(PlayerHead.type.circle)
    self.right_head:setPosition(60, 60)
    right_role:addChild(self.right_head)
    
    self.right_name = self.main_container:getChildByName("right_name")

    self.fight_type = self.main_container:getChildByName("fight_type")
    self.check_fight_btn = self.main_container:getChildByName("check_fight_btn") -- 该竞猜已经出结果的时候的观战按钮

    self.lbl_score = self.main_container:getChildByName("lbl_score") --积分
    self.role_power = self.main_container:getChildByName("Image_1"):getChildByName("role_power") --战斗力

    self.time = self.main_container:getChildByName("time")

    self:registerEvent()
end


function ArenaLoopMyLogItem1:registerEvent()
    self.right_head:addCallBack(function()
		if self.data ~= nil then
            if self.data.srv_id ~= "" then
			    FriendController:getInstance():openFriendCheckPanel(true, {srv_id = self.data.srv_id, rid = self.data.rid})
            else
                
            end
		end
	end, false)
	
    registerButtonEventListener(self.check_fight_btn,function(d,sender, event_type)
        customClickAction(sender, event_type)
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			if self.data and self.data.replay_id ~= 0 then
				BattleController:getInstance():csRecordBattle(self.data.replay_id)
			end
		end
    end)
end

function ArenaLoopMyLogItem1:setData(data)
	if data then
		self.data = data
		self.right_head:setHeadRes(self.data.face, false, LOADTEXT_TYPE, self.data.face_file, self.data.face_update_time)
		self.right_name:setString(self.data.name)
        if self.data.lev == 0 then
            self.right_head:setLev("0")
        else
            self.right_head:setLev(self.data.lev)
        end

        self.role_power:setString(self.data.power or 0)

        if self.data.type == 1 then     -- 进攻
            if self.data.ret == 1 then
                self.fight_type:setString(TI18N("进攻成功"))
            else
                self.fight_type:setString(TI18N("进攻失败"))
            end
        else
            if self.data.ret == 1 then
                self.fight_type:setString(TI18N("防守成功"))
            else
                self.fight_type:setString(TI18N("防守失败"))
            end
        end
        self.time:setString(TimeTool.getYMDHMS(data.time))

        -- local config =  Config.ArenaData.data_const.score_iocn
        local des_score = (data.score ~= 0 and data.ret ~= 1) and "-"..data.score or "+"..data.score
        self.lbl_score:setString(TI18N("积分 "..des_score))
	end
end


function ArenaLoopMyLogItem1:DeleteMe()
	if self.right_head then
		self.right_head:DeleteMe()
		self.right_head = nil
	end
	self:removeAllChildren()
	self:removeFromParent()
end 
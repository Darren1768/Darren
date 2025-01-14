-- --------------------------------------------------------------------
-- @description:
--      公会主窗体
-- 2018.10.23  将公会商店与活跃对换，变量名没有更换
-- --------------------------------------------------------------------
UnionMainWindow = UnionMainWindow or BaseClass(BaseView)

local controller = UnionController:getInstance()
local model = UnionController:getInstance():getModel()
local string_format = string.format

local gb_model = UnionbossController:getInstance():getModel()
--local vy_model = UnionvoyageController:getInstance():getModel()
local skill_model = UnionskillController:getInstance():getModel()
local redbag_model = RedbagController:getInstance():getModel()
local gw_model = UnionwarController:getInstance():getModel()

function UnionMainWindow:__init()
	self.ctrl = UnionController:getInstance()
	self.model = self.ctrl:getModel()
    self.layout_name = "union/union_main_window"
	self.win_type = WinType.Full
	self.role_vo = RoleController:getInstance():getRoleVo()
	self.res_list = {
		{path = PathTool.getPlistImgForDownLoad("union", "union"), type = ResourcesType.plist},
        { path = PathTool.getSingleImgForDownLoad("bigbg","bigbg_2",true), type = ResourcesType.single },
	}
end

function UnionMainWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    if self.background ~= nil then
        self.background:loadTexture(PathTool.getSingleImgForDownLoad("bigbg","bigbg_2",true), LOADTEXT_TYPE)
        self.background:setScale(display.getMaxScale())
    end

    local main_container = self.root_wnd:getChildByName("main_container")
    local main_panel = main_container:getChildByName("main_panel")
    main_panel:getChildByName("win_title"):setString(TI18N("公会"))

	self.main_view = main_panel:getChildByName("container")
	self.sign_btn = self.main_view:getChildByName("sign_btn")							-- 公会宣言的设置按钮
	self.union_sign_value = self.main_view:getChildByName("union_sign_value")			-- 公会宣言内容
	self.union_sign_value:setTextAreaSize(cc.size(250, 120))

	self.change_name_btn = self.main_view:getChildByName("change_name_btn")				-- 公会改名

	self.action_goal_btn = self.main_view:getChildByName("action_goal_btn")				-- 公会活跃
	self.redpacket_btn = self.main_view:getChildByName("redpacket_btn")					-- 公会贡红包按钮
	self.redpacket_btn.tips = self.redpacket_btn:getChildByName("tips")					-- 捐献红点
	self.donate_btn = self.main_view:getChildByName("donate_btn")						-- 公会贡献度按钮
	self.donate_btn.tips = self.donate_btn:getChildByName("tips")						-- 捐献红点
	self.rank_btn = self.main_view:getChildByName("skill_btn")							-- 公会排名

	--
	self.shop_container = self.main_view:getChildByName("shop_container")				-- 改为公会秘境
	self.shop_container.notice = self.main_view:getChildByName("union_shop_notice")		-- 开启条件说明
	self.shop_container.tips = self.shop_container:getChildByName("tips") 				-- 红点状态
	self.shop_container.tips:setVisible(false)
	self.shop_container.is_unlock = true												-- 解锁状态

	self.war_container = self.main_view:getChildByName("war_container")					-- 公会战标签
	self.war_container.notice = self.main_view:getChildByName("union_war_notice")		-- 开启条件说明
	self.war_container.tips = self.war_container:getChildByName("tips") 				-- 红点状态
	self.war_container.is_unlock = false												-- 解锁状态
	self.war_container.notice:setVisible(false)
	self.war_container.notice:setString(TI18N("敬请期待"))

	self.dungeon_container = self.main_view:getChildByName("dungeon_container")			-- 公会副本标签
	self.dungeon_container.notice = self.main_view:getChildByName("union_dun_notice")	-- 开启条件说明
	self.dungeon_container.tips = self.dungeon_container:getChildByName("tips") 		-- 红点状态
	self.dungeon_container.is_unlock = false											-- 解锁状态

	self.skill_container = self.main_view:getChildByName("voyage_container")			-- 远航商人标签
	self.skill_container.notice = self.main_view:getChildByName("union_voyage_notice")	-- 开启条件说明
	self.skill_container.tips = self.skill_container:getChildByName("tips") 			-- 红点状态
	self.skill_container.is_unlock = false												-- 解锁状态

	self.check_member_btn = self.main_view:getChildByName("rank_btn")					-- 查看成员
	self.notice_btn = self.main_view:getChildByName("notice_btn")						-- 公会日志按钮
	self.mail_btn = self.main_view:getChildByName("mail_btn") 				            -- 公会邮件按钮
	self.joinset_btn = self.main_view:getChildByName("joinset_btn") 					-- 入帮设置按钮

	self.joinset_btn.tips = self.joinset_btn:getChildByName("tips") 					-- 活跃红点
	self.notice_btn.tips = self.notice_btn:getChildByName("tips") 						-- 公告红点
	self.check_member_btn.tips = self.check_member_btn:getChildByName("tips") 			-- 查看成员红点

	self.main_view:getChildByName("union_name_title"):setString(TI18N("名称："))
	self.main_view:getChildByName("union_leader_title"):setString(TI18N("会长："))
	self.main_view:getChildByName("union_lev_title"):setString(TI18N("等级："))
	self.main_view:getChildByName("union_exp_title"):setString(TI18N("经验："))
	self.main_view:getChildByName("union_member_title"):setString(TI18N("成员："))

	self.union_name_value = self.main_view:getChildByName("union_name_value")
	self.union_leader_value = self.main_view:getChildByName("union_leader_value")
	self.union_lev_value = self.main_view:getChildByName("union_lev_value")
	self.union_exp_value = self.main_view:getChildByName("union_exp_value")
	self.union_member_value = self.main_view:getChildByName("union_member_value")

	self.action_goal_btn:getChildByName("label"):setString(TI18N("公会商店"))
	self.action_goal_btn.tips = self.action_goal_btn:getChildByName("tips") -- 红点状态
	self.action_goal_btn.tips:setVisible(false)

	self.redpacket_btn:getChildByName("label"):setString(TI18N("公会红包")) 
	self.donate_btn:getChildByName("label"):setString(TI18N("公会捐献"))
	self.rank_btn:getChildByName("label"):setString(TI18N("公会排名"))
	self.main_view:getChildByName("union_sign_title"):setString(TI18N("公会宣言"))
	
	--上面四个按钮
	self.notice_btn:getChildByName("label"):setString(TI18N("公会日志"))
	self.mail_btn:getChildByName("label"):setString(TI18N("公会宝库"))
	self.check_member_btn:getChildByName("label"):setString(TI18N("公会管理"))
	self.joinset_btn:getChildByName("label"):setString(TI18N("公会活跃"))

end

function UnionMainWindow:register_event()
	self.sign_btn:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type)
		if event_type == ccui.TouchEventType.ended then 
			playCommonButtonSound()
			controller:openUnionChangeSignWindow(true)
		end
	end)
	self.change_name_btn:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type)
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			controller:openUnionChangeNameWindow(true)
		end
	end) 
	self.action_goal_btn:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type)
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			MallController:getInstance():openMallPanel(true, MallConst.MallType.UnionShop)
		end
	end)
	self.redpacket_btn:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			RedbagController:getInstance():openMainView(true)
		end
	end) 
	self.donate_btn:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			controller:openUnionDonateWindow(true)
		end
	end) 
	self.rank_btn:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			RankController:getInstance():openRankView(true, RankConstant.RankType.union)
		end
	end)
	--公会秘境
	self.shop_container:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.UnionSecretArea)
		end
	end) 
	self.war_container:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.UnionWar)
			-- 清除掉联盟战开启的红点
			gw_model:updateUnionWarRedStatus(UnionConst.red_index.unionwar_start, false)
		end
	end) 
	self.dungeon_container:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.UnionDun)
		end
	end) 
	self.skill_container:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			UnionskillController:getInstance():openUnionSkillMainWindow(true)
		end
	end)
	--公会管理
	self.check_member_btn:addTouchEventListener(function(sender, event_type)--
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			controller:openUnionMemberWindow(true)
		end
	end) 
	--公会日记
	self.notice_btn:addTouchEventListener(function(sender, event_type)
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			controller:openUnionNoticeWindow(true)
		end
	end) 
	--公会宝库
	self.mail_btn:addTouchEventListener(function(sender, event_type)--
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			UnionmarketplaceController:getInstance():openUnionmarketplaceMainWindow(true)
		end
	end) 
	--公会活跃
	self.joinset_btn:addTouchEventListener(function(sender, event_type)--
		customClickAction(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
			playCommonButtonSound()
			if self.role_vo ~= nil then
				local lev = Config.UnionQuestData.data_union_action_data.open_glev.val
				if self.role_vo.union_lev >= lev then
					controller:openUnionActionGoalWindow(true)
				else
					local str = string_format(TI18N("联盟达到%d级后开启"),lev)
					message(str)
				end
			end
		end
	end) 
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

function UnionMainWindow:openRootWnd()
	if self.my_union_info == nil then
		self.my_union_info = model:getMyUnionInfo()
		if self.my_union_info ~= nil then
			if self.update_my_union_info_event == nil then
				self.update_my_union_info_event = self.my_union_info:Bind(UnionEvent.UpdateMyInfoEvent, function(key, value)
					if key == "sign" then
						self:updateUnionSignInfo()
					elseif key == "members_num" then
						self:updateUnionMemberInfo()
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
		self:updateUnionMemberInfo()
		self:updateSomeRedStatus()
	end

	self:updateJurisdiction() 
end


--==============================--
--desc:一些权限控制
--@return 
--==============================--
function UnionMainWindow:updateJurisdiction()
	if self.role_vo == nil then return end
	if self.role_vo.position == UnionConst.post_type.member then
		self.sign_btn:setVisible(false)
		self.change_name_btn:setVisible(false) 
	else
		self.sign_btn:setVisible(true)
		self.change_name_btn:setVisible(true)
		self.joinset_btn:setTouchEnabled(true)
		setChildUnEnabled(false, self.joinset_btn) 
		self.notice_btn:setTouchEnabled(true)
		setChildUnEnabled(false, self.notice_btn) 
		self.mail_btn:setTouchEnabled(true)
		setChildUnEnabled(false, self.mail_btn)
	end
end

--==============================--
--desc:更新宣言
--@return 
--==============================--
function UnionMainWindow:updateUnionSignInfo()
	if self.my_union_info == nil then return end
	self.union_sign_value:setString(self.my_union_info.sign)
end

--==============================--
--desc:更新基础信息，等级，经验，成员数量，都是和等级相关的，所以在这里统一处理
--@return 
--==============================--
function UnionMainWindow:updateUnionBaseInfo()
	if self.my_union_info == nil then return end 
	self.union_lev_value:setString(string_format(TI18N("%s级"), self.my_union_info.lev))
	local config = Config.UnionData.data_union_lev[self.my_union_info.lev]
	if config ~= nil then
		if config.exp == 0 then
			self.union_exp_value:setString(TI18N("已满级"))
		else
			self.union_exp_value:setString(string_format("%s/%s", self.my_union_info.exp, config.exp))
		end
	end
	self.union_member_value:setString(string_format("%s/%s", self.my_union_info.members_num, self.my_union_info.members_max)) 

	-- 一些按钮权限开启的东西,只有未解锁才做判断
	self:checkUnionDunLockStatus()
	self:checkUnionWarStatus()
end

--==============================--
--desc:更新公会名称
--@return 
--==============================--
function UnionMainWindow:updateUnionNameInfo()
	if self.my_union_info == nil then return end 
	self.union_name_value:setString(self.my_union_info.name) 
end

--==============================--
--desc:监测公会副本开启状态
--@return 
--==============================--
function UnionMainWindow:checkUnionDunLockStatus()
	local is_unlock = false
	if self.dungeon_container.is_unlock == false then
		local config = Config.UnionDunData.data_const.union_lev
		if config then
			is_unlock =(self.my_union_info and self.my_union_info.lev >= config.val)
			self.dungeon_container.is_unlock = is_unlock			-- 等级解锁
			self.dungeon_container.notice:setVisible(not is_unlock)
			self.dungeon_container:setTouchEnabled(is_unlock)
			if is_unlock == false then
				setChildUnEnabled(true, self.dungeon_container)
				self.dungeon_container.notice:setString(config.desc)
			else
				setChildUnEnabled(false, self.dungeon_container)
			end
		end
	end 
end

-- 公会战开启状态
function UnionMainWindow:checkUnionWarStatus(  )
	local is_unlock = false
	if self.war_container.is_unlock == false then
		local config_lv = Config.UnionWarData.data_const.limit_lev -- 公会等级显示
		local config_day = Config.UnionWarData.data_const.limit_open_time -- 开服天数限制
		if config_lv and config_day then
			is_unlock =(self.my_union_info and self.my_union_info.lev >= config_lv.val)
			local tips_str = ""
			if is_unlock == true then
				local open_srv_day = RoleController:getInstance():getModel():getOpenSrvDay()
				is_unlock = (open_srv_day > config_day.val)
				tips_str = config_day.desc
			else
				tips_str = config_lv.desc
			end
			--[[if true then -- 暂时屏蔽
				is_unlock = false
				tips_str = TI18N("敬请期待!")
			end--]]

			self.war_container.is_unlock = is_unlock			-- 等级解锁
			self.war_container.notice:setVisible(not is_unlock)
			self.war_container:setTouchEnabled(is_unlock)
			if is_unlock == false then
				setChildUnEnabled(true, self.war_container)
				self.war_container.notice:setString(tips_str)
			else
				setChildUnEnabled(false, self.war_container)
			end
		end
	end
end

--==============================--
--desc:更新公会帮主
--@return 
--==============================--
function UnionMainWindow:updateUnionLeaderInfo()
	if self.my_union_info == nil then return end 
	self.union_leader_value:setString(self.my_union_info.leader_name) 
end

--==============================--
--desc:更新成员数量
--@return 
--==============================--
function UnionMainWindow:updateUnionMemberInfo()
	if self.my_union_info == nil then return end 
	self.union_member_value:setString(string_format("%s/%s", self.my_union_info.members_num, self.my_union_info.members_max))
end

--==============================--
--desc:更新红点状态,如果type未指定，则全部更新
--@type:
--@return 
--==============================--
function UnionMainWindow:updateSomeRedStatus(type, status)
	local red_status = false
	if type == UnionConst.red_index.notice then
		self.notice_btn.tips:setVisible(status)
	elseif type == UnionConst.red_index.apply then
		self.check_member_btn.tips:setVisible(status)
	elseif type == UnionConst.red_index.boss_times then
		red_status = gb_model:checkUnionDunRedStatus()
		self.dungeon_container.tips:setVisible(red_status)
	elseif type == UnionConst.red_index.donate or type == UnionConst.red_index.donate_activity then
		red_status = model:getDonateRedStatus() 
		self.donate_btn.tips:setVisible(red_status)
	elseif type == UnionConst.red_index.skill_2 or type == UnionConst.red_index.skill_3 or 
		type == UnionConst.red_index.skill_4 or type == UnionConst.red_index.skill_5 or
		type == UnionConst.red_index.pvp_skill_2 or type == UnionConst.red_index.pvp_skill_3 or 
		type == UnionConst.red_index.pvp_skill_4 or type == UnionConst.red_index.pvp_skill_5  then
		red_status = skill_model:getRedTotalStatus()
		self.skill_container.tips:setVisible(red_status)
	elseif type == UnionConst.red_index.red_bag then 
		self.redpacket_btn.tips:setVisible(status)
	elseif type == UnionConst.red_index.union_secret_area then --公会秘境 
		self.shop_container.tips:setVisible(status)
	elseif type == UnionConst.red_index.goal_action then
		if self.joinset_btn.tips then
			self.joinset_btn.tips:setVisible(status)
		end
	elseif type == UnionConst.red_index.unionwar_start or type == UnionConst.red_index.unionwar_match or type == UnionConst.red_index.unionwar_count then
		red_status = gw_model:checkUnionUnionWarRedStatus()
		if self.war_container.is_unlock == false then
			red_status = false
		end
		self.war_container.tips:setVisible(red_status)
	else
		red_status = model:getRedStatus(UnionConst.red_index.apply)
		self.check_member_btn.tips:setVisible(red_status)

		red_status = model:getDonateRedStatus()
		self.donate_btn.tips:setVisible(red_status) 

		red_status = gb_model:checkUnionDunRedStatus()
		self.dungeon_container.tips:setVisible(red_status)

		red_status = gw_model:checkUnionUnionWarRedStatus()
		if self.war_container.is_unlock == false then
			red_status = false
		end
		self.war_container.tips:setVisible(red_status)

		red_status = skill_model:getRedTotalStatus()
		self.skill_container.tips:setVisible(red_status)

		red_status = redbag_model:getAllRedBagStatus()
		self.redpacket_btn.tips:setVisible(red_status)

		--活跃红点
		red_status = model:getGoalRedStatus()
		if self.joinset_btn.tips then 
			self.joinset_btn.tips:setVisible(red_status)
		end
	
	end
end

function UnionMainWindow:close_callback()
	self.ctrl:openUnionMainWindow(false)
	if self.my_union_info ~= nil then
		if self.update_my_union_info_event ~= nil then
			self.my_union_info:UnBind(self.update_my_union_info_event)
			self.update_my_union_info_event = nil
		end
		self.my_union_info = nil
	end
    EventManager:getInstance():UnBind(self)
	if self.role_vo ~= nil then
		if self.role_assets_event ~= nil then
			self.role_vo:UnBind(self.role_assets_event)
			self.role_assets_event = nil
		end
		self.role_vo = nil
	end
end 
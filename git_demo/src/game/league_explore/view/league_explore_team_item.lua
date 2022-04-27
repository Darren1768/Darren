---------------------------------
-- @description: 区场景建筑
---------------------------------
local _leagueexplore_ctrl = LeagueExploreController:getInstance()
local _string_format = string.format

LeagueExploreTeamItem = LeagueExploreTeamItem or BaseClass()

function LeagueExploreTeamItem:__init(data, league_type,camp )
	self.data = data or {}
	self.league_type = league_type  -- 2是布阵  3/4 战斗
	self.camp = camp  -- 阵营 根据阵营显示 1 我方 红  2 敌方
	self.can_click = true
	self.red_data = {} -- 红点数据
	self:createRootwnd()
end

function LeagueExploreTeamItem:createRootwnd()
	self.root = ccui.Widget:create()
	self.root:setAnchorPoint(0, 0)
	self.root:setCascadeOpacityEnabled(true)

	local head_size = cc.size(128,128)

	local _res = PathTool.getResFrame("exploration", "hl_exploration_0001") 
    local _size = cc.size(149, 41)
	local _scale = 1
	local _head_position = head_size
	local _last_bg_res =  PathTool.getResFrame("exploration", "hl_exploration_0022") 
	local _last_bg_scale = 1
	local _last_bg_position = cc.p(0,0)
	local _add_res =  PathTool.getResFrame("exploration", "hl_exploration_0023") 
	local _add_scale = 1
	local _add_position = cc.p(0,0)
	local _video_res = PathTool.getResFrame("exploration", "hl_exploration_0020") 
	local _video_position = cc.p(0,0)
	local _video_scale = 1

	local _battle_scale = 1 
	local _battle_position= cc.p(0,0)

	local _empty_position= cc.p(0,0)
	local _empty_scale= 1

	if self.camp ==1 then 
		_last_bg_res =  PathTool.getResFrame("exploration", "hl_exploration_0021") 
		if self.data.type  == 1 then 
			_res = PathTool.getResFrame("exploration", "hl_exploration_0001") 
			_size = cc.size(87, 107)
			_scale = 0.5
			_head_position= cc.p(head_size.width/2 -20 ,head_size.width/2 - 20 )
			_add_scale = 1
			_add_position =cc.p(87/2-33/2*_add_scale,26)
			_video_position =cc.p(15,16)
			_video_scale = 1

			_battle_scale=1
			_battle_position = cc.p(-15,-40)
			_last_bg_scale=0.85
			_last_bg_position= cc.p(87/2-60/2 *_last_bg_scale,19)

			_empty_position = cc.p(head_size.width/2-24,head_size.width/2-20)

		elseif self.data.type==2 then 
			_res = PathTool.getResFrame("exploration", "hl_exploration_0002") 
			_size = cc.size(72, 75)
			_scale = 0.42
			_add_scale = 0.8
			_head_position= cc.p(head_size.width/2 -30 ,head_size.width/2 - 30)
			_add_position =cc.p(72/2-33/2 *_add_scale,22)
			_video_position =cc.p(14,12)
			_video_scale = 0.8

			_battle_scale=0.8
			_battle_position = cc.p(-15,-36)
			_last_bg_scale=0.7
			_last_bg_position= cc.p(72/2-60/2 *_last_bg_scale,15)

			_empty_position = cc.p(head_size.width/2-30,head_size.width/2-30)

		elseif self.data.type==3 then 
			_res = PathTool.getResFrame("exploration", "hl_exploration_0003") 
			_size = cc.size(64, 75)
			_scale = 0.33
			_add_scale = 0.7
			_head_position= cc.p(head_size.width/2 -32 ,head_size.width/2 - 36 )
			_add_position =cc.p(64/2-33/2 *0.7,17)
			_video_position =cc.p(11,10)
			_video_scale = 0.7

			_battle_scale=0.7
			_battle_position = cc.p(-12,-30)
			_last_bg_scale=0.6
			_last_bg_position= cc.p(64/2-60/2 *0.6,13)

			_empty_position = cc.p(head_size.width/2-33,head_size.width/2-35)

		elseif self.data.type==4 then 
			_res = PathTool.getResFrame("exploration", "hl_exploration_0004") 
			_size = cc.size(44, 47)
			_scale = 0.33
			_add_scale =0.7
			_head_position= cc.p(head_size.width/2 -42 ,head_size.width/2 - 38 )
			_add_position =cc.p(44/2-33/2 *_add_scale,14)
			_video_position =cc.p(3,6)
			_video_scale =0.7
			_battle_scale=0.7
			_battle_position = cc.p(-20,-30)
			_last_bg_scale=0.6
			_last_bg_position= cc.p(44/2-60/2 *_last_bg_scale,10)

			_empty_position = cc.p(head_size.width/2-44,head_size.width/2-37)

		end 
	else 
		_last_bg_res =  PathTool.getResFrame("exploration", "hl_exploration_0022") 

		if self.data.type  == 1 then 
			_res = PathTool.getResFrame("exploration", "hl_exploration_0005") 
			_size = cc.size(87, 107)
			_scale = 0.5
			_head_position= cc.p(head_size.width/2 -20 ,head_size.width/2 - 20 )
			_video_scale = 1
			_video_position =cc.p(15,16)
			_battle_scale=1
			_battle_position = cc.p(-15,-40)
			_last_bg_scale=0.85
			_last_bg_position= cc.p(87/2-60/2 *_last_bg_scale,19)

			_empty_position = cc.p(head_size.width/2-24,head_size.width/2-20)

		elseif self.data.type==2 then 
			_res = PathTool.getResFrame("exploration", "hl_exploration_0006") 
			_size = cc.size(72, 75)
			_scale = 0.42
			_video_scale = 0.8
			_head_position= cc.p(head_size.width/2 -30 ,head_size.width/2 - 30)
			_video_position =cc.p(14,12)
			_battle_scale=0.8
			_battle_position = cc.p(-15,-36)
			_last_bg_scale=0.7
			_last_bg_position= cc.p(72/2-60/2 *_last_bg_scale,15)

			_empty_position = cc.p(head_size.width/2-30,head_size.width/2-30)

		elseif self.data.type==3 then 
			_res = PathTool.getResFrame("exploration", "hl_exploration_0007") 
			_size = cc.size(64, 75)
			_scale = 0.33
			_video_scale = 0.7
			_head_position= cc.p(head_size.width/2 -32 ,head_size.width/2 - 36 )
			_video_position =cc.p(11,10)
			_battle_scale=0.7
			_battle_position = cc.p(-12,-30)
			_last_bg_scale=0.6
			_last_bg_position= cc.p(64/2-60/2 *0.6,13)

			_empty_position = cc.p(head_size.width/2-33,head_size.width/2-35)

		elseif self.data.type==4 then 
			_res = PathTool.getResFrame("exploration", "hl_exploration_0008") 
			_size = cc.size(44, 47)
			_scale = 0.33
			_video_scale =0.7
			_head_position= cc.p(head_size.width/2 -42 ,head_size.width/2 - 38 )
			_video_position =cc.p(3,6)
			_battle_scale=0.7
			_battle_position = cc.p(-20,-30)
			_last_bg_scale=0.6
			_last_bg_position= cc.p(44/2-60/2 *_last_bg_scale,10)

			_empty_position = cc.p(head_size.width/2-44,head_size.width/2-37)

		end 

	end
	self.size= _size
	self.root:setContentSize(_size)
     
	self:buildLayout(head_size)
	self.clipNode:setScale(_scale)
	self.head_panel:setPosition(_head_position)
	self.head_icon:setVisible(false)



	--最下层背景

	self.build_last_bg = createSprite(_last_bg_res,offset_x,offset_y, self.root, cc.p(0, 0),LOADTEXT_TYPE_PLIST)
	self.build_last_bg:setScale(_last_bg_scale)
	self.build_last_bg:setPosition(_last_bg_position)

	-- 背景
	local offset_x = self.data.name_x or 0
	local offset_y = self.data.name_y or 0
	self.build_bg = createImage(self.root,_res, offset_x, offset_y, cc.p(0, 0), true, 9, true)
	self.build_bg:setContentSize(_size)

	registerButtonEventListener(self.root, function(param,sender)
		self.touch_began = sender:getTouchBeganPosition()
        self:onClickBuild(self.touch_began)
    end, true)

	if self.league_type==2 then 
		-- 加号
		self.add_node = createSprite(_add_res, _add_position.x ,_add_position.y, self.root, cc.p(0, 0),LOADTEXT_TYPE_PLIST)
		self.add_node:setScale(_add_scale)
		self.add_node:setVisible(true)
	else
        self.show_video = false -- 是否显示录像
		self.is_battle = false -- 是否在战斗
		-- 视频
		self.video_node = createSprite(_video_res, _video_position.x ,_video_position.y, self.root, cc.p(0, 0),LOADTEXT_TYPE_PLIST,10)
		self.video_node:setScale(_video_scale)
		self.video_node:setVisible(false)
		-- -- 交战中
		self.battle_node = createSprite(PathTool.getResFrame("common2", "hl_common_0041") , _battle_position.x ,_battle_position.y, self.root, cc.p(0, 0),LOADTEXT_TYPE_PLIST,11)
		self.battle_node:setScale(_video_scale)
		self.battle_node:setVisible(false)

		-- 开打的对应位置显示空字 没有开打的不显示
		self.battle_empty = createLabel(20, cc.c3b(239,212,174), nil,_empty_position.x, _empty_position.y, "缺", self.root, nil, cc.p(0.5, 0.5))
		self.battle_empty:setZOrder(12) 
		self.battle_empty:setVisible(true)
	end 
	-- setChildUnEnabled(true,self.root)
end


function LeagueExploreTeamItem:onClickBuild(touch_began)
	print("-----------------------onClickBuild---------------",self.league_explore)
	-- _leagueexplore_ctrl:openVideoSelectPanel("" ,touch_began)
 
	if 	self.league_type  == 2 then 
		-- 布阵
		_leagueexplore_ctrl:getModel():setCurrentTeamPos(self._pos)
		_leagueexplore_ctrl:openTeamSelectPanel("" ,touch_began)
	else
	
		if self.show_video then 
           _leagueexplore_ctrl:getModel():setVideoPoint(touch_began)
            -- 观看录像
			local _data = {}
			_data.rid =self.base_data.rid
			_data.srv_id = self.base_data.srv_id
			_data.id = _leagueexplore_ctrl:getModel():getResourceID()
			_leagueexplore_ctrl:sender29311(_data)
		else
			if self.is_battle then 
                message("正在战斗中..")
			end 
		end         
	end 

end

function LeagueExploreTeamItem:setHeadImg(head_icon)
--    if head_icon == nil then 
-- 	  self.head_panel:setVisible(false)
-- 	  return
--    end 
    if head_icon ~= nil  then
        self.record_head_id = head_icon
        local res = PathTool.getHeadIcon(head_icon)
        self.head_icon:loadTexture(res, LOADTEXT_TYPE)
		self.head_icon:setVisible(true)
		if not head_icon then 
			self.head_icon:setOpacity(0)
		else
			self.head_icon:setOpacity(255)
		end

	else
		self.head_icon:setVisible(false)
    end
end

function LeagueExploreTeamItem:setParentWnd(parent)
	if tolua.isnull(parent) then return end
	self.parent_wnd = parent
	if self.data ~= nil then
		self.root:setPosition(self.data.x, self.data.y)
		self.parent_wnd:addChild(self.root, 1)
	end
end


--step 战斗中阶段 和别的阶段不一样
function LeagueExploreTeamItem:setBaseData(data,step)
	print("------------------------setBaseData----------------------",data )
	if not data then 
		if	self.league_type  ~= 2 then 
		   self:isCanClick(false)
		end
		self:setHeadImg(nil)
		return
	end 
	self.base_data = data 
	self:isCanClick(true)
	self:setHeadImg(data.face)
	if 	self.battle_empty then 
		self.battle_empty:setVisible(false)
	end 

      --  第三阶段战斗中  有人的全部显示交战中 
	  --  第四阶段 活着的都有录像，死了的没有
	if 	self.league_type  ~= 2 then 
		self.step = step 
        -- 战斗 3/4 
		if data.status == 2 then 
            -- 死亡
			setChildUnEnabled(true,self.root)
			self.battle_node:setVisible(false)
			self.is_battle= false
            -- 死亡不显示视频
			self.video_node:setVisible(false)

		else
			-- 活着 
			setChildUnEnabled(false,self.root)
			-- step ==1 不显示 2 显示1 的 
			local _num = step*1000 -- 当前的
			local _next_num = (step +1)*1000
            if _num > data.pos  and step ~=0 then 
		       -- 显示录像 已打过
			   self.battle_node:setVisible(false)
			elseif data.pos > _num  and data.pos < _next_num  and step ~=0 then 
              -- 显示交战中
				self.battle_node:setVisible(true)
				self.is_battle= true
			end 
			if step ==4 then 
				self.battle_node:setVisible(false)
				self.is_battle= false
			end

					-- 根据积分去判断是否有视频回放 正在交战中的也不显示
			if data.score and data.score>0 and self.is_battle==false then 
				self.video_node:setVisible(true)
				self.show_video = true
			else 
				self.video_node:setVisible(false)
			end
		end 

	
	end 

end

function LeagueExploreTeamItem:isCanClick(status)
	--  self.can_click = status 
	 self.root:setTouchEnabled(status)
end


function LeagueExploreTeamItem:getData()
	return self.data
end

function LeagueExploreTeamItem:getRoot()
	return self.root
end


function LeagueExploreTeamItem:showBattleSprite()

	
end




-- 裁剪 切割
function LeagueExploreTeamItem:buildLayout(size,scale)
	local scale = 1 or scale
    self.vSize =size
	self.mask_res = mask_res or PathTool.getResFrame("common", "hl_common_108") -- 圆
	self.head_panel = ccui.Widget:create()
	self.head_panel:setAnchorPoint(cc.p(0.5,0.5))
	self.head_panel:setContentSize(self.vSize)
	self.head_panel:setPosition(self.vSize.width/2, self.vSize.height/2)
	self.head_panel:setCascadeOpacityEnabled(true)
	self.root:addChild(self.head_panel,1)
	-- self:setContentSize(self.vSize)
	-- self:setCascadeOpacityEnabled(true)
   -- 40504
	if self.mask_res ~= nil then
		self.mask = createSprite(self.mask_res, self.vSize.width/2, self.vSize.height/2, nil, cc.p(0.5, 0.5))
		self.clipNode = cc.ClippingNode:create(self.mask)
		self.clipNode:setAnchorPoint(cc.p(0.5,0.5))
		self.clipNode:setContentSize(self.vSize)
		self.clipNode:setCascadeOpacityEnabled(true)
		self.clipNode:setPosition(self.vSize.width/2,self.vSize.height/2 )
		self.clipNode:setAlphaThreshold(0)
		self.head_panel:addChild(self.clipNode,1)

		self.head_icon = ccui.ImageView:create()
		self.head_icon:setCascadeOpacityEnabled(true)
		self.head_icon:setAnchorPoint(0.5,0.5)
		self.head_icon:setPosition(self.vSize.width/2,self.vSize.height/2)
		self.clipNode:addChild(self.head_icon,1)
        self.clipNode:setScale(scale)
	else
		self.head_icon = ccui.ImageView:create()
		self.head_icon:setCascadeOpacityEnabled(true)
		self.head_icon:setAnchorPoint(0.5,0.5)
        self.head_icon:setPosition(self.vSize.width/2,self.vSize.height/2)
		self.head_panel:addChild(self.head_icon)
	end
end


function LeagueExploreTeamItem:__delete()
    if self.build_load then
        self.build_load:DeleteMe()
        self.build_load = nil
	end
	if self.effect then
		self.effect:setVisible(false)
		self.effect:clearTracks()
		self.effect:runAction(cc.RemoveSelf:create(true))
	end
	if self.root:getParent() then
		self.root:removeAllChildren()
		self.root:removeFromParent()
	end
end
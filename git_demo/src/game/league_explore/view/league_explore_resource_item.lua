---------------------------------
-- @description: 区场景建筑
---------------------------------
local _leagueexplore_ctrl = LeagueExploreController:getInstance()
local model = LeagueExploreController:getInstance():getModel()

local _string_format = string.format

LeagueExploreResourceItem = LeagueExploreResourceItem or BaseClass()

function LeagueExploreResourceItem:__init(data, area_type)
	self.data = data or {}
	self.area_type = 1
	self.can_click = false
	self.is_build = true
	self.red_data = {} -- 红点数据
	self:createRootwnd()
end

function LeagueExploreResourceItem:createRootwnd()
    self.size = cc.size(149, 41)
	self.root = ccui.Widget:create()
	self.root:setAnchorPoint(0.5, 0.5)
	self.root:setContentSize(self.size)
    
	local offset_x = self.data.name_x or 0
	local offset_y = self.data.name_y or 0
	self.name_bg = createImage(self.root, PathTool.getResFrame("common", "hl_common_1023"), offset_x, offset_y, cc.p(0.5, 0.5), true, 9, true)
	self.name_bg:setContentSize(cc.size(149, 41))
	self.name_bg:setTouchEnabled(true)
	-- registerButtonEventListener(self.name_bg, handler(self, self.onClickBuild), true)

	self.name_txt = createLabel(20, cc.c4b(98,53,43,255), cc.c4b(65,29,4,255), 149*0.5, 41*0.5, self.data.name or "", self.name_bg, 0, cc.p(0.5, 0.5))
	self.name_txt:setLocalZOrder(9)


	---报名
	self.baoming_bg = createImage(self.root, PathTool.getResFrame("common", "hl_common_31"), offset_x, offset_y-40, cc.p(0.5, 0.5), true, 9, true)
	self.baoming_bg:setContentSize(cc.size(90, 32))
	self.baoming_bg:setTouchEnabled(true)
    local baoming_label = createLabel(20, cc.c4b(98,53,43,255), cc.c4b(65,29,4,255), 90*0.5, 32*0.5, "已报名", self.baoming_bg, 0, cc.p(0.5, 0.5))
	baoming_label:setLocalZOrder(9)


	self.battle_node = createSprite(PathTool.getResFrame("guild", "guild_1030") ,-80,-30, self.root, cc.p(0, 0),LOADTEXT_TYPE_PLIST,10)
	self.battle_node:setScale(0.4)
	self.battle_node:setVisible(false)
    -- loadSpriteTexture(sprite, res, type)
	-- self:createBuild()
end

function LeagueExploreResourceItem:createBuild()
	if self.build_icon then return end

	local function loadBuildIconBack(  )
		local icon_size = self.build_icon:getContentSize()
		self.touch_layer = ccui.Layout:create()
		self.touch_layer:setAnchorPoint(cc.p(0.5, 0.5))
		self.touch_layer:setPosition(self.size.width*0.5, self.size.height*0.5)
		self.touch_layer:setTouchEnabled(true)
		self.touch_layer:setSwallowTouches(false)
		self.touch_layer:setContentSize(cc.size(icon_size.width*6/5, icon_size.height*6/5))
		-- 引导需要
		if self.data then
			self.touch_layer:setName("guide_build_" .. self.data.bid)
		end
		self.root:addChild(self.touch_layer)

		self.touch_layer:addTouchEventListener(function(sender, event_type)
			self:onTouchItem(sender, event_type)
		end)
	end

	self.build_icon = createImage(self.root, nil, self.size.width * 0.5, self.size.height * 0.5, cc.p(0.5, 0.5), false)
	self.build_icon:setVisible(false)
	self.build_icon:setOpacity(125)
	self.build_icon:setScale(2)
	self.build_icon:ignoreContentAdaptWithSize(true)
	-- local icon_path = _string_format("resource/area_scene/build/build_%s.png", self.data.res)
	-- self.build_load = loadImageTextureFromCDN(self.build_icon, icon_path, ResourcesType.single, self.build_load, nil, loadBuildIconBack)
end

function LeagueExploreResourceItem:onTouchItem( sender, event_type )
	if event_type == ccui.TouchEventType.began then
		self.touch_began = sender:getTouchBeganPosition()
		self.build_icon:setVisible(true)
	elseif event_type == ccui.TouchEventType.moved then

	elseif event_type == ccui.TouchEventType.canceled then
		self.build_icon:setVisible(false)
	elseif event_type == ccui.TouchEventType.ended then
		self.build_icon:setVisible(false)
		local touch_end = sender:getTouchEndPosition()
		if self.touch_began and touch_end and (math.abs(touch_end.x - self.touch_began.x) > 20 or math.abs(touch_end.y - self.touch_began.y) > 20) then 
			--移动大于20了..表示本点击无效
			return
		end
		playCommonButtonSound()
		self:onClickBuild()
	end
end


function LeagueExploreResourceItem:onClickBuild()
	local role_vo = RoleController:getInstance():getRoleVo()
	if self.data.bid == Area_sceneConst.Shop_Type.skin then
		local limit_cfg = Config.ChargeMallData.data_const["skin_mall_lev"]
		if limit_cfg and limit_cfg.val > role_vo.lev then
			message(limit_cfg.desc)
			return
		end
	end
	_leagueexplore_ctrl:onClickLeagueExploreBuildById(self.area_type, self.data.bid)
end

function LeagueExploreResourceItem:setParentWnd(parent)
	if tolua.isnull(parent) then return end
	self.parent_wnd = parent
	if self.data ~= nil then
		self.root:setPosition(self.data.x +self.size.width, self.data.y)
		self.parent_wnd:addChild(self.root, 1)
	end
end

function LeagueExploreResourceItem:setRedStatus( red_data )
	for _,v in pairs(red_data) do
		local is_have = false
		for _,n in pairs(self.red_data) do
			if n.bid == v.bid then
				n.status = v.status
				is_have = true
				break
			end
		end
		if not is_have then
			table.insert( self.red_data, v )
		end
	end
	local red_state = false
	for k,v in pairs(self.red_data) do
		if v.status == true then
			red_state = true
			break
		end
	end
	addRedPointToNodeByStatus(self.name_bg, red_state, 4, 7)
end


function LeagueExploreResourceItem:setBaseData(data,config )

	self._base_data  = data 
	self.config = config

	self.name_txt:setString(self.config.resource_name)
	
	if self._base_data.is_open==1 then 
		setChildUnEnabled(false,self.name_bg)
		-- self.name_txt:setColor(cc.c3b(255,0,0))
	else  
		setChildUnEnabled(true,self.name_bg)
	end 


	if self._base_data.is_apply == 1 then 
		if model:getStepStatus() ==1  then 
	    	self.baoming_bg:setVisible(true)
		 else
			self.baoming_bg:setVisible(false)
		 end 
    else
		self.baoming_bg:setVisible(false)
	end 
   
	if self._base_data.league_id ~= 0 then 
		self.battle_node:setVisible(true)
	else
		self.battle_node:setVisible(false)

	end 
end

function LeagueExploreResourceItem:getData()
	return self.data
end

function LeagueExploreResourceItem:getRoot()
	return self.root
end

function LeagueExploreResourceItem:__delete()
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
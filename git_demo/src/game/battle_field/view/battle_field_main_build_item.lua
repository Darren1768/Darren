---------------------------------
-- @description: 区场景建筑
---------------------------------
local _leagueexplore_ctrl = LeagueExploreController:getInstance()
local _string_format = string.format

BattleFieldMainBuildItem = BattleFieldMainBuildItem or BaseClass()

function BattleFieldMainBuildItem:__init(data, area_type)
	self.data = data or {}
	self.area_type = 1
	self.can_click = false
	self.is_build = true
	self.red_data = {} -- 红点数据
	self:createRootwnd()
end

function BattleFieldMainBuildItem:createRootwnd()
    self.size = cc.size(0, 0)
	self.root = ccui.Widget:create()
	self.root:setAnchorPoint(0.5, 0.5)
	self.root:setContentSize(self.size)
    
		local offset_x = self.data.name_x or 0
		local offset_y = self.data.name_y or 0
		self.name_bg = createImage(self.root, PathTool.getResFrame("common", "hl_common_2203"), offset_x, offset_y, cc.p(0, 0), true, 9, true)
		-- self.name_bg:setContentSize(cc.size(130, 283))
		-- self.name_bg:setScale(0.8)
		self.name_bg:setTouchEnabled(true)
		registerButtonEventListener(self.name_bg, handler(self, self.onClickBuild), true)

		self.name_txt = createLabel(22, cc.c4b(255,238,202,255), cc.c4b(65,29,4,255), self.name_bg:getContentSize().width*0.5 +4,self.name_bg:getContentSize().height*0.5 , self.data.name or "", self.name_bg, 0, cc.p(0.5, 0.5),TITLE_FONT)
		self.name_txt:setLocalZOrder(9)
	

        -- loadSpriteTexture(sprite, res, type)
		-- self:createBuild()
	
end

function BattleFieldMainBuildItem:createBuild()
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
	-- self.build_icon:setScale(2)
	self.build_icon:ignoreContentAdaptWithSize(true)
	-- local icon_path = _string_format("resource/area_scene/build/build_%s.png", self.data.res)
	-- self.build_load = loadImageTextureFromCDN(self.build_icon, icon_path, ResourcesType.single, self.build_load, nil, loadBuildIconBack)
end

function BattleFieldMainBuildItem:onTouchItem( sender, event_type )
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


function BattleFieldMainBuildItem:onClickBuild()
	local role_vo = RoleController:getInstance():getRoleVo()
	if self.data.bid == 6 then
		UnionController:getInstance():checkOpenUnionWindow()
    elseif self.data.bid == 3 then 
		BattleBorderWarController:getInstance():openHomeScene(true)
		-- BattleNationalWarController:getInstance():openNationalOneScene(true)
		-- BattleNationalWarController:getInstance():openNationalTwoScene(true)
	elseif self.data.bid == 1 then --国战记录 
		-- BattleBorderWarController:getInstance():openHomeScene(true)
		-- BattleNationalWarController:getInstance():openNationalOneScene(true)
		BattleNationalWarController:getInstance():openNationalOneShowInfoWindow(true)

		-- BattleNationalWarController:getInstance():openNationalTwoShowInfoWindow(true)


		
	end

	


end

function BattleFieldMainBuildItem:setParentWnd(parent)
	if tolua.isnull(parent) then return end
	self.parent_wnd = parent
	if self.data ~= nil then
		self.root:setPosition(self.data.x, self.data.y)
		self.parent_wnd:addChild(self.root, 1)
	end
end

function BattleFieldMainBuildItem:setRedStatus( red_data )
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


function BattleFieldMainBuildItem:setBaseData(data)

end

function BattleFieldMainBuildItem:getData()
	return self.data
end

function BattleFieldMainBuildItem:getRoot()
	return self.root
end

function BattleFieldMainBuildItem:__delete()
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
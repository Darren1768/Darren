---------------------------------
-- @description: 区场景建筑
---------------------------------
local _leagueexplore_ctrl = LeagueExploreController:getInstance()
local _string_format = string.format

BattleBorderWarMainBuildItem = BattleBorderWarMainBuildItem or BaseClass()

function BattleBorderWarMainBuildItem:__init(data, area_type)
	self.data = data or {}
	self.area_type = 1
	self.can_click = false
	self.is_build = true
	self.red_data = {} -- 红点数据
	self:createRootwnd()
end

function BattleBorderWarMainBuildItem:createRootwnd()
    self.size = cc.size(50, 50)
	self.root = ccui.Widget:create()
	self.root:setAnchorPoint(0.5, 0.5)
	self.root:setContentSize(self.size)
    
	local offset_x = self.data.name_x or 0
	local offset_y = self.data.name_y or 0
	self.name_bg = createImage(self.root, PathTool.getResFrame("common", "common_1049"), offset_x, offset_y, cc.p(0.5, 0.5), true, 9, true)
	self.name_bg:setContentSize(cc.size(149, 41))
	self.name_bg:setTouchEnabled(true)
	registerButtonEventListener(self.name_bg, handler(self, self.onClickBuild), true)

	self.name_txt = createLabel(20, cc.c4b(251,234,202,255), cc.c4b(65,29,4,255), 149*0.5, 41*0.5, self.data.name or "", self.name_bg, 2, cc.p(0.5, 0.5))
	self.name_txt:setLocalZOrder(9)
	
end



function BattleBorderWarMainBuildItem:onClickBuild()
	local role_vo = RoleController:getInstance():getRoleVo()



end

function BattleBorderWarMainBuildItem:setParentWnd(parent)
	if tolua.isnull(parent) then return end
	self.parent_wnd = parent
	if self.data ~= nil then
		self.root:setPosition(self.data.x, self.data.y)
		self.parent_wnd:addChild(self.root, 1)
	end
end




function BattleBorderWarMainBuildItem:setBaseData(data)

end

function BattleBorderWarMainBuildItem:getData()
	return self.data
end

function BattleBorderWarMainBuildItem:getRoot()
	return self.root
end

function BattleBorderWarMainBuildItem:__delete()
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
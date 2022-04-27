-- --------------------------------------------------------------------
-- @description:
--      通用的战斗伤害,加血和承受数据展示界面
--
-- --------------------------------------------------------------------

BattleNationalWarTwoShowInfoWindow = BattleNationalWarTwoShowInfoWindow or BaseClass(BaseView)

local controller = BattleNationalWarController:getInstance()
local table_insert = table.insert 
local role_vo = RoleController:getInstance():getRoleVo()
local unit_func = Config.UnitData.data_unit
local partner_base = Config.PartnerData.data_partner_base

function BattleNationalWarTwoShowInfoWindow:__init(view_type)
	self.view_tag = ViewMgrTag.DIALOGUE_TAG
	
	self.win_type = WinType.Big
	self.layout_name = "battle_national_war/battle_national_war_two_showinfo"
	self.total_data = {}
	self.res_list = {
		-- { path = PathTool.getPlistImgForDownLoad("vedio","vedio"), type = ResourcesType.plist },
	}

	self.view_type = view_type 
end 

function BattleNationalWarTwoShowInfoWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale())

    local main_container = self.root_wnd:getChildByName("container")
    self:playEnterAnimatianByObj(main_container, 1)
	


	-- self.Sprite_1=  main_container:getChildByName("Sprite_1")
	-- self.Sprite_1:setVisible(false)
	self.item = main_container:getChildByName("item")
	self.item:setVisible(false)


	self.list_view = main_container:getChildByName("list_view")


	self.top_y =849.45
	self.bottom_y = 430.41
	self.top_bg_y = 844.43
	self.bottom_bg_y = 422.41

end

function BattleNationalWarTwoShowInfoWindow:register_event()
	self.background:addTouchEventListener(function(sender, event_type)
		if event_type == ccui.TouchEventType.ended then
			playQuitSound()
			self:onCloseBtn()
		end
	end)
	



end

function BattleNationalWarTwoShowInfoWindow:onCloseBtn()
	
	controller:openNationalTwoShowInfoWindow(false)
end



--setting 
--setting.fight_type 战斗类型 默认nil 
function BattleNationalWarTwoShowInfoWindow:openRootWnd(data, setting)

	local setting = setting or {}

	self:setData(data)
	
end

function BattleNationalWarTwoShowInfoWindow:setData(data)
	
	
	self:setTopInfo()
end


function BattleNationalWarTwoShowInfoWindow:setTopInfo()
	local data = {}
	for i=1,10  do
		table.insert(data,{})
	end
	if self.top_scroll_view == nil then
		local size = self.list_view:getContentSize()
		local setting = {
			item_class = BattleNationalWarTwoShowInfoItem,
			start_x = 10,
			space_x = 0,
			start_y = 8,
			space_y = 0,
			item_width = 546,
			item_height = 80,
			row = 1,
			col = 1,
		}
		self.top_scroll_view = CommonScrollViewLayout.new(self.list_view, nil, ScrollViewDir.vertical, nil, size, setting)
	end
	self.top_scroll_view:setVisible(true)
	self.top_scroll_view:setData(data, nil, nil, { node = self.item }) 
end


function BattleNationalWarTwoShowInfoWindow:close_callback()
	if self.top_scroll_view then
		self.top_scroll_view:DeleteMe()
	end
	self.top_scroll_view = nil

    controller:openNationalTwoShowInfoWindow(false)
end




-- --------------------------------------------------------------------
-- @description:
--      冠军赛当前排行榜的分列
--
-- --------------------------------------------------------------------
BattleNationalWarTwoShowInfoItem = class("BattleNationalWarTwoShowInfoItem", function()
	return ccui.Layout:create()
end)

function BattleNationalWarTwoShowInfoItem:ctor()
end

--==============================--
--desc:设置扩展参数  {node = self.item, count = self.interaction_count} 
--@data:
--@return 
--==============================--
function BattleNationalWarTwoShowInfoItem:setExtendData(data)


	local node = data.node	
	if not tolua.isnull(node) and self.root_wnd == nil then
		self.is_completed = true
		local size = node:getContentSize()
		self:setAnchorPoint(cc.p(0.5, 0.5))
		self:setContentSize(size)
		
		self.root_wnd = node:clone()
		self.root_wnd:setVisible(true)
		self.root_wnd:setAnchorPoint(0.5, 0.5)
		self.root_wnd:setPosition(size.width * 0.5, size.height * 0.5)
		self:addChild(self.root_wnd)
		self.image_bg = self.root_wnd:getChildByName("image_bg")

		-- self.result_sprite = self.root_wnd:getChildByName("result_sprite")
		-- self.result_sprite:setPositionX(145) --

	
	end
end

function BattleNationalWarTwoShowInfoItem:_onClickHeroCallBack(  )

end

function BattleNationalWarTwoShowInfoItem:setData(data)
	if data  then
		self.data = data
		
		if self.data._index%2 == 1 then 
			self.image_bg:setVisible(true)
		else
			self.image_bg:setVisible(false)
		end

		-- self.result_sprite:setPositionX(145) --
		-- self.result_sprite:setPositionX(325) --
		-- self.result_sprite:setPositionX(503) --
	
	end
end

function BattleNationalWarTwoShowInfoItem:DeleteMe()

	self:removeAllChildren()
	self:removeFromParent()
end 
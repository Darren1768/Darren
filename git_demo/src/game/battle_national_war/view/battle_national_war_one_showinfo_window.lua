-- --------------------------------------------------------------------
-- @description:
--      通用的战斗伤害,加血和承受数据展示界面
--
-- --------------------------------------------------------------------

BattleNationalWarOneShowInfoWindow = BattleNationalWarOneShowInfoWindow or BaseClass(BaseView)

local controller = BattleNationalWarController:getInstance()
local table_insert = table.insert 
local role_vo = RoleController:getInstance():getRoleVo()
local unit_func = Config.UnitData.data_unit
local partner_base = Config.PartnerData.data_partner_base

function BattleNationalWarOneShowInfoWindow:__init(view_type)
	self.view_tag = ViewMgrTag.DIALOGUE_TAG
	
	self.win_type = WinType.Big
	self.layout_name = "battle_national_war/battle_national_war_one_showinfo"
	self.total_data = {}
	self.res_list = {
		-- { path = PathTool.getPlistImgForDownLoad("vedio","vedio"), type = ResourcesType.plist },
	}

	self.view_type = view_type 
end 

function BattleNationalWarOneShowInfoWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale())

    local main_container = self.root_wnd:getChildByName("container")
    self:playEnterAnimatianByObj(main_container, 1)
	


	-- self.Sprite_1=  main_container:getChildByName("Sprite_1")
	-- self.Sprite_1:setVisible(false)
	self.item = main_container:getChildByName("item")
	self.item:setVisible(false)


	self.list_view = main_container:getChildByName("list_view")

	-- self.top_name = main_panel:getChildByName("top_name")
	-- self.bottom_name = main_panel:getChildByName("bottom_name")

	-- self.success_img = main_panel:getChildByName("success_img")
	-- self.fail_img = main_panel:getChildByName("fail_img")

	-- self.success_bg = main_panel:getChildByName("success_bg")
	-- self.fail_bg = main_panel:getChildByName("fail_bg")
	self.top_y =849.45
	self.bottom_y = 430.41
	self.top_bg_y = 844.43
	self.bottom_bg_y = 422.41

end

function BattleNationalWarOneShowInfoWindow:register_event()
	self.background:addTouchEventListener(function(sender, event_type)
		if event_type == ccui.TouchEventType.ended then
			playQuitSound()
			self:onCloseBtn()
		end
	end)
	



end

function BattleNationalWarOneShowInfoWindow:onCloseBtn()
	
	controller:openNationalOneShowInfoWindow(false)
end



--setting 
--setting.fight_type 战斗类型 默认nil 
function BattleNationalWarOneShowInfoWindow:openRootWnd(data, setting)
	local setting = setting or {}

	self:setData(data)
	
end

function BattleNationalWarOneShowInfoWindow:setData(data)
	

	self:setTopInfo()
end


function BattleNationalWarOneShowInfoWindow:setTopInfo()
	local data = {}
	for i=1,10  do
		table.insert(data,{})
	end
	if self.top_scroll_view == nil then
		local size = self.list_view:getContentSize()
		local setting = {
			item_class = BattleNationalWarOneShowInfoItem,
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
	-- self.top_scroll_view:setTouchEnabled(false)
	self.top_scroll_view:setVisible(true)
	self.top_scroll_view:setData(data, nil, nil, { node = self.item }) 
end


function BattleNationalWarOneShowInfoWindow:close_callback()
	if self.top_scroll_view then
		self.top_scroll_view:DeleteMe()
	end
	self.top_scroll_view = nil

    controller:openNationalOneShowInfoWindow(false)
end




-- --------------------------------------------------------------------
-- @description:
--      冠军赛当前排行榜的分列
--
-- --------------------------------------------------------------------
BattleNationalWarOneShowInfoItem = class("BattleNationalWarOneShowInfoItem", function()
	return ccui.Layout:create()
end)

function BattleNationalWarOneShowInfoItem:ctor()
end

--==============================--
--desc:设置扩展参数  {node = self.item, count = self.interaction_count} 
--@data:
--@return 
--==============================--
function BattleNationalWarOneShowInfoItem:setExtendData(data)


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

		self.result_sprite1 = self.root_wnd:getChildByName("result_sprite1")
		self.result_sprite1:setPositionX(220) --

	end
end

function BattleNationalWarOneShowInfoItem:_onClickHeroCallBack(  )

end

function BattleNationalWarOneShowInfoItem:setData(data)
	if data  then
		self.data = data

		if self.data._index%2 == 1 then 
			self.image_bg:setVisible(true)
		else
			self.image_bg:setVisible(false)
		end

	
		-- self.result_sprite1:setPositionX(220) --
		-- self.result_sprite1:setPositionX(314) --

	end
end

function BattleNationalWarOneShowInfoItem:DeleteMe()

	self:removeAllChildren()
	self:removeFromParent()
end 
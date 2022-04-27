--------------------------------------------
-- @description    : 
		-- 阵营详细
---------------------------------
BattleCampInfoView = BattleCampInfoView or BaseClass(BaseView)

local controller = BattleController:getInstance()
local _table_insert = table.insert
local _string_format = string.format

function BattleCampInfoView:__init()
    
	self.win_type = WinType.Tips   
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
	self.layout_name = "battle/battle_camp_info_view"
	self.res_list = {
		{path = PathTool.getPlistImgForDownLoad("battlecamp", "battlecamp"), type = ResourcesType.plist},
	}
end

function BattleCampInfoView:open_callback(  )
	self.background = self.root_wnd:getChildByName("background")
	if self.background then
		self.background:setScale(display.getMaxScale())
	end

	local main_container = self.root_wnd:getChildByName("main_container")
	self.main_container = main_container
	self:playEnterAnimatianByObj(main_container, 2)
	self.main_size = main_container:getContentSize()

	local title_label_1 = main_container:getChildByName("title_label_1")
	title_label_1:setString(TI18N("种族克制"))
	local title_label_2 = main_container:getChildByName("title_label_2")
	title_label_2:setString(TI18N("种族克制效果:"))
	local attr_label_1 = main_container:getChildByName("attr_label_1")
	attr_label_1:setString(TI18N("伤害+25%"))
	local attr_label_2 = main_container:getChildByName("attr_label_2")
	attr_label_2:setString(TI18N("命中+20%"))
end

--创建cell 
--@width 是setting.item_width
--@height 是setting.item_height
function BattleCampInfoView:createNewCell(width, height)
    local cell = BattleCampItem.new(width, height)
    -- cell:addCallBack(function() self:onCellTouched(cell) end)
    return cell
end
--获取数据数量
function BattleCampInfoView:numberOfCells()
    return #self.show_list
end

--更新cell(拖动的时候.刷新数据时候会执行次方法)
--cell :createNewCell的返回的对象
--inde :数据的索引
function BattleCampInfoView:updateCellByIndex(cell, index)
    cell.index = index
    local data = self.show_list[index]
    cell:setData(data, index)
end

function BattleCampInfoView:openRootWnd(  )

end

function BattleCampInfoView:register_event(  )
	registerButtonEventListener(self.background, handler(self, self._onClickBtnClose), false, 2)

	-- 战斗结束时关闭界面
	self:addGlobalEvent(SceneEvent.EXIT_FIGHT, function (  )
		controller:openBattleCampInfoView(false)
	end)
end

function BattleCampInfoView:_onClickBtnClose(  )
	controller:openBattleCampInfoView(false)
end

function BattleCampInfoView:close_callback(  )
	if self.camp_scrollview then
		self.camp_scrollview:DeleteMe()
		self.camp_scrollview = nil
	end
	controller:openBattleCampInfoView(false)
end

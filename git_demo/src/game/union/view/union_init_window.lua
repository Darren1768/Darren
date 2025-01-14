-- --------------------------------------------------------------------
-- @description:
--      联盟的初始窗体，包含了创建联盟，联盟列表以及联盟查找标签页
--
-- --------------------------------------------------------------------
UnionInitWindow = UnionInitWindow or BaseClass(BaseView)

function UnionInitWindow:__init()
	self.ctrl = UnionController:getInstance()
	self.model = self.ctrl:getModel()
	self.win_type = WinType.Mini
	self.res_list = {
		{path = PathTool.getPlistImgForDownLoad("union", "union"), type = ResourcesType.plist},
	}
	self.tab_info_list = {
		{
			label = TI18N("联盟\n列表"),
			notice = TI18N(""),
			index = UnionConst.init_type.list,
			status = true
		}, 
		-- {
		-- 	label = TI18N("创建联盟"),
		-- 	notice = TI18N(""),
		-- 	index = UnionConst.init_type.create,
		-- 	status = true
		-- },
        {
            label = TI18N("查找\n联盟"),
            notice = TI18N(""),
            index = UnionConst.init_type.serach,
            status = true
        } 
	}
	-- self.show_close_btn = false
	self.panel_list = {}
	self.cur_panel = nil
end 

function UnionInitWindow:open_callback()
end

function UnionInitWindow:register_event()

end

function UnionInitWindow:openRootWnd(index)
	index = index or UnionConst.init_type.list
	self:setSelecteTab(index, true) 
end

function UnionInitWindow:selectedTabCallBack(index)
	if index == UnionConst.init_type.create then
		self:changeTitleName(TI18N("创建联盟"))
	elseif index == UnionConst.init_type.list then
		self:changeTitleName(TI18N("联盟列表"))
	elseif index == UnionConst.init_type.serach then
		self:changeTitleName(TI18N("查找联盟")) 
	end
	self:changePanel(index)
end

function UnionInitWindow:changePanel(index)
	if self.cur_panel ~= nil then
		self.cur_panel:addToParent(false)
		self.cur_panel = nil
	end
	local cur_panel = self.panel_list[index]
	if cur_panel == nil then
		if index == UnionConst.init_type.create then
			cur_panel = UnionCreatePanel.new()
		elseif index == UnionConst.init_type.list then
			cur_panel = UnionListPanel.new()
		elseif index == UnionConst.init_type.serach then
			cur_panel = UnionSearchPanel.new()
		end
		self.panel_list[index] = cur_panel

		if cur_panel ~= nil then
			self.container:addChild(cur_panel)
		end
	end

	if cur_panel ~= nil then
		cur_panel:addToParent(true) 
		self.cur_panel = cur_panel
		self.cur_index = index
	end
end

function UnionInitWindow:close_callback()
    self.ctrl:openUnionInitWindow(false)
	for k,panel in pairs(self.panel_list) do
		panel:DeleteMe()
	end
	self.panel_list = nil
end
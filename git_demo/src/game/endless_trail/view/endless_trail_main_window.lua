--------------------------------------------
-- @description    : 
		-- 无尽试炼
---------------------------------
EndlessTrailMainWindow = EndlessTrailMainWindow or BaseClass(BaseView)

local controller = Endless_trailController:getInstance()
local model = controller:getModel()

function EndlessTrailMainWindow:__init()
	self.win_type = WinType.Full
	
	self.res_list = {
		{path = PathTool.getPlistImgForDownLoad("endless", "endless"), type = ResourcesType.plist},
		{path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_40",false), type = ResourcesType.single },
		{path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_29",false), type = ResourcesType.single },
		{path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_30",false), type = ResourcesType.single },

	}
	self.layout_name = "endlesstrail/endlesstrail_main_window"
	self.panel_list = {}
	self.tab_list = {}
	self.cur_tab_index = Endless_trailEvent.Tab_Index.endless
end

function EndlessTrailMainWindow:open_callback(  )
	self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale())
	self.background:loadTexture(PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_40",false), LOADTEXT_TYPE)
    local main_container = self.root_wnd:getChildByName("main_container")
    self:playEnterAnimatianByObj(main_container, 1)

	self.close_btn = main_container:getChildByName("close_btn")
    

    self.tab_container = main_container:getChildByName("tab_container")
	self.tab_container:setVisible(false)
    local tab_name_list = {
        [1] = TI18N("全体模式"),
        [2] = TI18N("单人模式")
    }
    for i=1,2 do
        local tab_btn = self.tab_container:getChildByName("tab_btn_"..i)
        if tab_btn then
            local object = {}
            object.unselect_bg = tab_btn:getChildByName('unselect_bg')
            object.unselect_bg:setVisible(true)
            object.select_bg = tab_btn:getChildByName('select_bg')
            object.select_bg:setVisible(false)
            object.lable = tab_btn:getChildByName("title")
			object.tab_btn = tab_btn
			object.tips = tab_btn:getChildByName("tips")
            object.index = i
			object.tab_btn:setScale(0.9)

            self.tab_list[i] = object
        end
    end

	self.container = main_container:getChildByName("container")
	-- self.top_panel = main_container:getChildByName("top_panel")
	-- self.rank_bg_1 = self.top_panel:getChildByName("Image_8")
	-- self.rank_bg_2 = self.top_panel:getChildByName("Image_9")
	
	-- self.bottom_panel = main_container:getChildByName("bottom_panel")
	-- 适配
	local top_off = display.getTop(main_container)
	-- self.top_panel:setPositionY(top_off - 152)
	local bottom_off = display.getBottom(main_container)
	self.close_btn:setPositionY(bottom_off + 135)
	-- self.bottom_panel:setPositionY(bottom_off + 114)
	self.tab_container:setPositionY(bottom_off + 78)

end

function EndlessTrailMainWindow:register_event(  )
	registerButtonEventListener(self.close_btn, handler(self, self._onClickCloseBtn), nil, 2)

     EventManager:getInstance():Bind(Endless_trailEvent.UPDATA_BASE_DATA,self,function()
			self:updateTabShowStatus()
			self:updateTabBtnRedStatus()
        end)

	for k, object in pairs(self.tab_list) do
		if object.tab_btn then
			object.tab_btn:addTouchEventListener(function(sender, event_type)
				if event_type == ccui.TouchEventType.ended then
					playTabButtonSound()
					self:changeSelectedTab(object.index)
				end
			end)
		end
    end

end

function EndlessTrailMainWindow:updateBackGround(index)
	local res = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_40",false)
	if index == 2 then
		res= PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_29",false)
	end
	self.background:loadTexture(res, LOADTEXT_TYPE)

end

function EndlessTrailMainWindow:updateTabShowStatus(  )
	if controller:checkNewEndLessIsShow() == false then
		self.tab_container:setVisible(false)
	else
		self.tab_container:setVisible(true)
	end
end


-- tab按钮红点
function EndlessTrailMainWindow:updateTabBtnRedStatus(  )
    for _,object in ipairs(self.tab_list) do
        local red_status = false
		if object.index == Endless_trailEvent.Tab_Index.endless and self.cur_tab_index ~= object.index then -- 老版
			if model:getIsGetAllReward() or 
			model:getFirstGet(Endless_trailEvent.endless_type.old) or
			model:getIsSendPartner() then
                red_status = true
            end
		elseif object.index == Endless_trailEvent.Tab_Index.singlemode and self.cur_tab_index ~= object.index and controller:checkNewEndLessIsOpen() == true then -- 新版
			local data = model:getEndlessData()
			if data then
				 -- model:getIsSendPartner() or 
				 print("--------------1---------------------",model:getFirstGet(data.select_type))
				 print("----------------2-------------------",model:getIsGetAllRewardNew())

				-- if model:getFirstGet(data.select_type) or
				-- model:getIsGetAllRewardNew() then
				-- 	red_status = true
				-- end

				red_status = false
			end
		end
		
        if object.tips then
            object.tips:setVisible(red_status)
        end
    end
end

-- 切换标签页
function EndlessTrailMainWindow:changeSelectedTab( index )
	if self.tab_object ~= nil and self.tab_object.index == index then return end
    
    if self.tab_object then
        self.tab_object.select_bg:setVisible(false)
		self.tab_object.unselect_bg:setVisible(true)
		self.tab_object.tab_btn:setScale(0.9)
        self.tab_object = nil
    end
    self.tab_object = self.tab_list[index]
    if self.tab_object then
		self.tab_object.tab_btn:setScale(1)
        self.tab_object.select_bg:setVisible(true)
		self.tab_object.unselect_bg:setVisible(false)

    end
	self.cur_tab_index = index
	if self.select_panel then
		self.select_panel:addToParent(false)
		self.select_panel = nil
	end
	self.select_panel = self.panel_list[index]
	if self.select_panel == nil then
		if index == Endless_trailEvent.Tab_Index.endless then
			self.select_panel = EndlessTrailPanel.new()
		elseif index == Endless_trailEvent.Tab_Index.singlemode then
			self.select_panel = EndlessTrailCampPanel.new()
		end
		if self.select_panel then
			self.container:addChild(self.select_panel)
			self.panel_list[index] = self.select_panel
		end
	end
	if self.select_panel then
		self.select_panel:addToParent(true)
	end

	self:updateTabBtnRedStatus()
	self:updateBackGround(index)

end


function EndlessTrailMainWindow:openRootWnd( )
	local index = Endless_trailEvent.Tab_Index.singlemode
	local data = model:getEndlessData()

	self:changeSelectedTab(index)
	controller:send23900()
end

-----------------@ 按钮点击事件
-- 关闭
function EndlessTrailMainWindow:_onClickCloseBtn(  )
	controller:openEndlessMainWindow(false)
end


function EndlessTrailMainWindow:close_callback(  )
    EventManager:getInstance():UnBind(self)
	
	for k, panel in pairs(self.panel_list) do
        panel:DeleteMe()
    end
    self.panel_list = nil

    controller:openEndlessMainWindow(false)
end
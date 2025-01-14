-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      掉落信息总览面板
-- --------------------------------------------------------------------
BattlDramaDropWindow = BattlDramaDropWindow or BaseClass(BaseView)
local elfin_controller = ElfinController:getInstance()
local controller = BattleDramaController:getInstance()

function BattlDramaDropWindow:__init()
    self.win_type = WinType.Big
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.layout_name = "battledrama/battle_drama_drop_windows"
    self.panel_list = {}
    self.tab_list = {}
    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("battledrop", "battledrop"), type = ResourcesType.plist},
    }
    self.tab_array = {
        {label = TI18N("Boss掉落"),index = 1},
        {label = TI18N('挂机掉落'),index = 2},
    }
    self.cur_tab = nil
    self.cur_index = nil
end
function BattlDramaDropWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale())

    self.main_container = self.root_wnd:getChildByName("root")

    self:playEnterAnimatianByObj(self.main_container, 2)
    self.close_btn = self.main_container:getChildByName("close_btn")
    self.back_container = self.main_container:getChildByName("back_container")

    self.world_btn = self.main_container:getChildByName("world_btn")
    self.world_btn:setVisible(false)

    -- self.tableContainer = self.main_container:getChildByName('tab_container')
    -- local tab_btn = nil
    -- local type, label = nil, nil
    -- for i = 1, #self.tab_array do
    --     tab_btn = self.tableContainer:getChildByName(string.format('tab_btn_%s', i))
    --     tab_btn.select_bg = tab_btn:getChildByName('select_bg')
    --     tab_btn.select_bg:setVisible(false)
    --     tab_btn.unselect_bg = tab_btn:getChildByName('unselect_bg')
    --     tab_btn.label = tab_btn:getChildByName('title')
    --     tab_btn:setBright(false)
    --     tab_btn.label:setTextColor(cc.c4b(0xcf, 0xb5, 0x93, 0xff))
    --     type = self.tab_array[i].index
    --     label = self.tab_array[i].label
    --     tab_btn.type = type
    --     tab_btn.label:setString(label)
    --     self.tab_list[type] = tab_btn
    -- end
    elfin_controller:send26555(1)




    self:updateSwapNum()
end

function BattlDramaDropWindow:register_event()
    if self.background then
        self.background:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                controller:openDramDropWindows(false) 
            end
        end)
    end
    if self.world_btn then
        self.world_btn:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                WorldmapController:getInstance():openWorldMapMainWindow(true)
            end
        end)
    end
    if self.close_btn then
        self.close_btn:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                controller:openDramDropWindows(false) 
            end
        end)
    end
    -- if self.add_btn then
    --     self.add_btn:addTouchEventListener(function (sender,event_type)
    --         if event_type == ccui.TouchEventType.ended then
    --             playCommonButtonSound()
    --             local config = Config.ItemData.data_get_data(Config.DungeonData.data_drama_const['swap_item'].val)
    --             if config then
    --                 BackpackController:getInstance():openTipsSource(true, config)
    --             end
    --         end
    --     end)
    -- end
    if self.tab_list then
        for k, tab_btn in pairs(self.tab_list) do
            tab_btn:addTouchEventListener(function(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    playTabButtonSound()
                    if tab_btn.type ~= nil then
                        self:changeTabView(tab_btn.type)
                    end
                end
            end)
        end
    end
    EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Boss_Update_Data,self, function()
            local num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const["swap_item"].val)
            -- self.num_label:setString(num)
            self:updateSwapNum()
        end)
    
    EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Quick_Battle_Data,self, function()
            self:updateSwapNum()
        end)
    
    -- 我方精灵
    -- EventManager:getInstance():Bind(ElfinEvent.Elfin_Plan_From_Info_Event,self,function ( data )
    --     self:initEflinInfoList(data)
    -- end)
    
    EventManager:getInstance():Bind(OrganizeEvent.Update_MyTeam_Data_List,self, function(data) 
        self:initEflinInfoList(data)
    end)
end

function BattlDramaDropWindow:initEflinInfoList(data)
    if not data then return end
    -- local teamList=data.team_list
    -- if teamList[1] and teamList[1].sprites then
    --    self.spritesData=teamList[1].sprites
    --    self.panel_list[1]:updateSprites(self.spritesData)
    -- end
    if self.panel_list[1] then 
        self.panel_list[1]:updateSprites(data)

    end 
end
function BattlDramaDropWindow:updateSwapNum()
    -- local drama_data = BattleDramaController:getInstance():getModel():getDramaData()
    -- if drama_data then
    --     local str = string.format('<div fontColor=#764519>今天剩余扫荡次数: </div><div fontColor=#289b14>%s</div>', Config.DungeonData.data_drama_const["swap_time"].val- drama_data.auto_num)
    --     self.swap_desc_label:setString(str)
    -- end
end
function BattlDramaDropWindow:openRootWnd(max_dun_id,index)
    self.max_dun_id = max_dun_id
    index = index or 1
    self:changeTabView(index)

    -- 获取队伍数据
    OrganizeController:getInstance():sender29606()
end

function BattlDramaDropWindow:changeTabView(index)
    if self.cur_index and self.cur_index == index then
        return
    end
    if self.cur_tab ~= nil then
        if self.cur_tab.label then
            self.cur_tab.label:setTextColor(cc.c4b(0xcf, 0xb5, 0x93, 0xff))
        end
        self.cur_tab.select_bg:setVisible(false)
    end
    self.cur_tab = self.tab_list[index]
    if self.cur_tab ~= nil then
        if self.cur_tab.label then
            self.cur_tab.label:setTextColor(cc.c4b(0xff, 0xed, 0xd6, 0xff))
        end
        self.cur_tab.select_bg:setVisible(true)
    end
  
    if self.cur_panel ~= nil then
		self.cur_panel:setVisibleStatus(false)
		self.cur_panel = nil
	end
	local cur_panel = self.panel_list[index]
	if cur_panel == nil then
        cur_panel = BattlDramaDropTipsWindow.new(self.max_dun_id)
        -- if index == BattleShowRewardConst.Boss then
        --     cur_panel = BattleDramaDropBossTipsWindow.new(self.max_dun_id)
        -- elseif index == BattleShowRewardConst.Hook then
        --     cur_panel = BattlDramaDropTipsWindow.new(self.max_dun_id)
        -- end
		self.panel_list[index] = cur_panel
		if cur_panel ~= nil then
			self.main_container:addChild(cur_panel)
		end
	end

	if cur_panel ~= nil then
		cur_panel:setVisibleStatus(true) 
		self.cur_panel = cur_panel
		self.cur_index = index
    end
end

function BattlDramaDropWindow:close_callback()
    if self.item_list and next(self.item_list or {}) ~= nil then
        for i,v in ipairs(self.item_list) do
            if v then
                v:DeleteMe()
                v = nil
            end
        end
    end
    EventManager:getInstance():UnBind(self)
    if self.panel_list and next(self.panel_list or {}) ~= nil then
        for i, panel in pairs(self.panel_list) do
            if panel then
                panel:DeleteMe()
            end
        end
    end
    self.panel_list = {}
    self.item_list = {}
    controller:openDramDropWindows(false)
end
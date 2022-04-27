-- --------------------------------------------------------------------
-- 竖版排行榜主界面
-- 
-- @description:
--      通用排行榜
-- --------------------------------------------------------------------
RankMainWindow = RankMainWindow or BaseClass(BaseView)
local table_sort = table.sort
local controller = RankController:getInstance()

function RankMainWindow:__init()
    self.ctrl = RankController:getInstance()

    self.win_type = WinType.Full      
    self.title_str = TI18N("排行榜")
    self.cur_type = 0
    self.res_list = {
    }
    --[[
    self.tab_info_list = {
        [RankConstant.MainTabType.LocalRank] = {label = TI18N("本服排行"), index = RankConstant.MainTabType.LocalRank, status = true},
        [RankConstant.MainTabType.CrossRank] = {label = TI18N("跨服排行"), index = RankConstant.MainTabType.CrossRank, status = true}
    }
    ]]
    self.view_list = {}
    self.tab_list = {}
    self.is_init = true
    self.select_type = RankConstant.MainTabType.LocalRank
    self.is_cluster = false

    self.rank_first_list = {}           -- 排行配置表
    self.showtips = {}
end

function RankMainWindow:open_callback()
    local root = createCSBNote(PathTool.getTargetCSB("rank/rank_main"))
    root:setPosition(cc.p(0, -15))
    self.container:addChild(root)
    self.main_panel = root:getChildByName("main_panel")
    self.rank_panel = self.main_panel:getChildByName("rank_panel")
    self:playEnterAnimatianByObj(self.main_panel , 1)



end

-- 刷新世界等级
function RankMainWindow:updateWorldLevel(  )
    local world_lev = RoleController:getInstance():getModel():getWorldLev()
    self.world_lv_txt:setString(string.format(TI18N("%d级"), world_lev))
end

-- 世界等级tips
function RankMainWindow:showWorldLevelTips( status )
    if status == true then
        if not self.world_lv_layout then
            self.world_lv_layout = ccui.Layout:create()
            self.world_lv_layout:setTouchEnabled(true)
            self.world_lv_layout:setSwallowTouches(false)
            self.world_lv_layout:setContentSize(cc.size(SCREEN_WIDTH, SCREEN_HEIGHT))
            self.world_lv_layout:setLocalZOrder(999)
            self.world_lv_layout:setAnchorPoint(cc.p(0.5, 0.5))
            self.world_lv_layout:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)
            self:addChild(self.world_lv_layout)
            registerButtonEventListener(self.world_lv_layout, function (  )
                    self:showWorldLevelTips(false)
                end)
        end
        self.world_lv_layout:setVisible(true)
    elseif self.world_lv_layout then
        self.world_lv_layout:setVisible(false)
    end
end

function RankMainWindow:register_event()
    -- for i,tab in pairs(self.tab_list) do
    --     tab.btn:addTouchEventListener(function(sender, event_type) 
    --         if event_type == ccui.TouchEventType.ended then
    --             playCommonButtonSound()
    --             self:changeTabIndex(tab.index)
    --         end
    --     end)
    -- end

    -- registerButtonEventListener(self.world_lv_btn, function (  )
    --     self:showWorldLevelTips(true)
    -- end)

    if not self.get_first_event then 
        self.get_first_event =  EventManager:getInstance():Bind(RankEvent.RankEvent_Get_First_data,self,function(data)
                if not data then return end
                local index = RankConstant.MainTabType.LocalRank
                if data.is_cluster == 1 then
                    index = RankConstant.MainTabType.CrossRank
                end
                if self.select_type ~= index then return end
                self.rank_first_list[index] = data.rank_list
                self:updateRankList()
            end)
    end

    -- -- 世界等级
    -- self:addGlobalEvent(RoleEvent.WORLD_LEV, function (  )
    --     self:updateWorldLevel()
    -- end)
end

function RankMainWindow:openRootWnd(index)
    self.select_type = index or RankConstant.MainTabType.LocalRank
    self:changeTabIndex(RankConstant.MainTabType.LocalRank)
    --self:checkTabUnlockInfo()
    -- 切换标签页
    --self:setSelecteTab(self.select_type)
end

function RankMainWindow:checkTabUnlockInfo()
    local config = Config.CityData.data_base[CenterSceneBuild.crossshow]
    self.tab_info_list[RankConstant.MainTabType.CrossRank].status = true
    if config then
        for i,v in ipairs(config.activate) do
            if v[1] == "world_lev" then
                local world_lev = RoleController:getInstance():getModel():getWorldLev() or 0
                if world_lev < v[2] then
                    self.tab_info_list[RankConstant.MainTabType.CrossRank].status = false 
                    self:setTabBtnTouchStatus(false, RankConstant.MainTabType.CrossRank)
                    self.tab_btn_list[RankConstant.MainTabType.CrossRank].notice = string.format(TI18N("世界等级%s级解锁"), v[2])
                end
            end
        end
    else
        self.tab_info_list[RankConstant.MainTabType.CrossRank].status = false    
        self:setTabBtnTouchStatus(false, RankConstant.MainTabType.CrossRank)
    end
end

function RankMainWindow:selectedTabCallBack(index)
    self:changeTabIndex(index)
end

function RankMainWindow:changeTabIndex(index)
    if index == RankConstant.MainTabType.CrossRank and not self.tab_info_list[index].status then
        if self.showtips[index] then
            message(self.showtips[index])
        end
        return 
    end
    self.select_type = index
    local first_data = self.rank_first_list[index]
    if first_data ~= nil then
        self:updateRankList()
    else
        self.is_cluster = (self.select_type == RankConstant.MainTabType.CrossRank)
        controller:send_12902(self.is_cluster)
    end
end

function RankMainWindow:updateRankList()
    if self.select_type == nil then return end
    local first_data = self.rank_first_list[self.select_type]
    if first_data == nil then return end
    if not self.list_view then
        local scroll_view_size = self.rank_panel:getContentSize()
        scroll_view_size.height = scroll_view_size.height - 20
        local setting = {
            item_class = RankMainItem,      -- 单元类
            start_x = 11.5,                  -- 第一个单元的X起点
            space_x = 0,                    -- x方向的间隔
            start_y = 560,                    -- 第一个单元的Y起点
            space_y = 0,                   -- y方向的间隔
            item_width = 597,               -- 单元的尺寸width
            item_height = 213,              -- 单元的尺寸height
            row = 1,                        -- 行数，作用于水平滚动类型
            col = 1                         -- 列数，作用于垂直滚动类型
        }
        self.list_view = CommonScrollViewLayout.new(self.rank_panel, cc.p(0, 10) , ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting)
    end

    local list = {}
    if self.select_type == RankConstant.MainTabType.LocalRank then
        local sort_list = {}
        sort_list[2] = 2
        sort_list[3] = 3
        sort_list[4] = 5
        sort_list[5] = 4
        sort_list[6] = 1
        for i,v in pairs(first_data) do
            local sort = sort_list[v.type]
            table.insert(list, {sort = sort, rank_type=v.type, rank_vo = v })
        end
        table_sort(list, function(a, b)  return a.sort < b.sort end)
    else
        for i,v in pairs(first_data) do
            table.insert(list, {rank_type=v.type, rank_vo = v })
        end
        table_sort(list, function(a, b)  return a.rank_type < b.rank_type end)
    end

    local is_cluster = (self.select_type == RankConstant.MainTabType.CrossRank)
    local function callback(item,vo)
        if vo and next(vo)~=nil then
            local index = item:getRankIndex() or 1
            self.ctrl:openRankView(true,index,is_cluster)
        end
    end
    self.list_view:setData(list, callback, nil, is_cluster)

    if not self.race_node then 
        local scroll = self.list_view.scroll_view
        local csbPath = PathTool.getTargetCSB("rank/rank_main_race")
        local race_node = createCSBNote(csbPath)
        scroll:addChild(race_node)
        race_node:setAnchorPoint(cc.p(0,1))    
        race_node:getChildByName('main_container'):setSwallowTouches(false)
        local innerSize = scroll:getInnerContainerSize()

        race_node:setPosition(cc.p(0,innerSize.height))
        --scroll:setInnerContainerSize(cc.size(innerSize.width,innerSize.height - 640))
        self.race_node = race_node
        self:update_race_rank()
    end

end

--这里没数据，need fix by spp
function RankMainWindow:update_race_rank()
    local main_container = self.race_node:getChildByName('main_container')
    local rank_tab_list = {}--面板
    local name_list = {}--名字
    local power_list = {}--战力
    local button_list = {}--按钮
    
    self.touch_began = {}
    for i=1,5 do
        rank_tab_list[i] = main_container:getChildByName('rank'..i)
        name_list[i] = main_container:getChildByName('no1name'..i)
         local bg_power  = main_container:getChildByName('rank_num_bg_1'..i)
        button_list[i] = main_container:getChildByName('button'..i)

        local  _power_num = CommonNum.new(220,bg_power, 0, - 2, cc.p(0.5, 0.5))
        _power_num:setPosition(103, 28)
        power_list[i] = _power_num

        local player_head = PlayerHead.new(PlayerHead.type.circle)
        local size = rank_tab_list[i]:getContentSize()
        player_head:setPosition(size.width/2 +10, size.height/2 + 30)
        player_head:setHeadRes(1, false, LOADTEXT_TYPE)--self.data.face_file, self.data.face_update_time)
        rank_tab_list[i]:addChild(player_head)
        if i>2 then
            player_head:setScale(0.8)
            player_head:setPosition(size.width/2 +10, size.height/2 + 20)
        end

        name_list[i]:setString('name'..i)
        power_list[i]:setNum('12333'..i)

        button_list[i]:setSwallowTouches(false)
        registerButtonEventListener(button_list[i], function (  )
                self.ctrl:openRankView(true,1,false)
            end, true, 2)

        button_list[i]:addTouchEventListener(function(sender, event_type) 
                -- customClickAction(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    local touch_end = sender:getTouchEndPosition()
                    local is_click = true
                    if self.touch_began[i] ~= nil then
                        is_click =
                        math.abs(touch_end.x - self.touch_began[i].x) <= 20 and
                        math.abs(touch_end.y - self.touch_began[i].y) <= 20
                    end
                    if is_click == true then
                        playCommonButtonSound()
                        --[[
                        if not self.data or next(self.data) ==nil then 
                            message(TI18N("暂无排名数据"))
                            return
                        end
                        ]]
                        self.ctrl:openRankView(true,1,false)
                    end
                elseif event_type == ccui.TouchEventType.began then
                    self.touch_began[i] = sender:getTouchBeganPosition()
                end
            end)
    end


end

function RankMainWindow:close_callback()
    self.ctrl:openMainView(false)
    EventManager:getInstance():UnBind(self)
    if self.list_view then 
        self.list_view:DeleteMe()
    end
    self.list_view = nil
end

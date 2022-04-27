-- --------------------------------------------------------------------
-- 竖版星命塔主界面
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
SpiritWindow = SpiritWindow or BaseClass(BaseView)

function SpiritWindow:__init()
    self.ctrl = SpiritController:getInstance()

    self.layout_name = "spirit/spirit_window"
    self.cur_type = 0
    self.win_type = WinType.Full  
    self.res_list = {
        --{ path = PathTool.getPlistImgForDownLoad("startower","startower"), type = ResourcesType.plist },
        { path = PathTool.getPlistImgForDownLoad("spirit","spirit"), type = ResourcesType.plist },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_17", false), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_18", false), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_19", false), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_guild"), type = ResourcesType.single },
    }
    self.tab_list = {}
    self.select_type = 1 --伙伴类型选择,默认全部为1
    self.view_list = {}
    self.is_change = false
    self.top3_item_list = {}
    self.level_num = 5
end


function SpiritWindow:open_callback()
    self.mainContainer = self.root_wnd:getChildByName("main_container")

    --对应主窗口.四面对应xy位置 ..相对位置是self.main_container左下角(0,0)
    local top_y = display.getTop(self.mainContainer)
    local bottom_y = display.getBottom(self.mainContainer)

    -- --主菜单 顶部底部的高度
    local top_height = MainuiController:getInstance():getMainUi():getTopViewHeight()
    local bottom_height = MainuiController:getInstance():getMainUi():getBottomHeight()

    self.mainContainer_size = self.mainContainer:getContentSize()
    self.background = self.root_wnd:getChildByName("background")
    if self.background ~= nil then
        self.background:setScale(display.getMaxScale())
        --self.background:setPositionY(top_y)
    end
    self.container = self.mainContainer:getChildByName("container")
    self.top_panel = self.mainContainer:getChildByName("top_panel")

    self.btnRule = self.top_panel:getChildByName("btnRule")

    self.black_bg = self.mainContainer:getChildByName("black_bg")
    self.close_btn = self.black_bg:getChildByName("close_btn")

    -- self.cost_panel =  self.black_bg:getChildByName("cost_panel")
    -- self.add_btn = self.cost_panel:getChildByName("add_btn")
    -- self.less_label =  createRichLabel(24,Config.ColorData.data_color4[1],cc.p(0,1),cc.p(0,65),nil,nil,500)
    -- self.cost_panel:addChild(self.less_label)

    local buy_panel = self.black_bg:getChildByName("buy_panel")
    buy_panel:getChildByName("key"):setString(TI18N("剩余挑战次数："))
    self.buy_count = buy_panel:getChildByName("label")
    self.buy_btn = buy_panel:getChildByName("add_btn")

    self.buy_tips = buy_panel:getChildByName("label_left")

    self.award_btn = self.black_bg:getChildByName("award_btn")
    local label = self.award_btn:getChildByName("label")
    label:setString(TI18N("通关奖励"))

    self.rank_container = self.mainContainer:getChildByName("rank_container")
    self.rank_top3_btn = self.rank_container:getChildByName("rank_btn")

    self.container_top = self.mainContainer:getChildByName("container_top")
    self:updateTopList()
    -- 滚动高度

    self:updateTowerList()

    self:initAwardItem()
end

function SpiritWindow:initAwardItem()
    local lev_id = self.ctrl:getModel():getNowLevelId()
    local allReward = Config.StarTowerData.data_get_floor_award[lev_id]

    if allReward then
        local scroll_view_size = self.award_btn:getContentSize()
        local setting = {
            item_class = BackPackItem,      -- 单元类
            start_x = 0,                  -- 第一个单元的X起点
            space_x = 0,                    -- x方向的间隔
            start_y = 5,                    -- 第一个单元的Y起点
            space_y = 0,                   -- y方向的间隔
            item_width = BackPackItem.Width*0.80,               -- 单元的尺寸width
            item_height = BackPackItem.Height*0.80,              -- 单元的尺寸height
            row = 1,                        -- 行数，作用于水平滚动类型
            col = 0,                         -- 列数，作用于垂直滚动类型
            scale = 0.80                     -- 缩放
        }
        local item_scrollview = CommonScrollViewLayout.new(self.award_btn, cc.p(0,30) , ScrollViewDir.horizontal, ScrollViewStartPos.top, cc.size(scroll_view_size.width,scroll_view_size.height -20), setting)
        item_scrollview:setSwallowTouches(false)
        item_scrollview.scroll_view:setTouchEnabled(false)

        local item = BackPackItem.new(true,true,nil,0.8)
        item_scrollview.scroll_view:addChild(item)
        item:setPosition(cc.p(75,36))
        local config = Config.ItemData.data_get_data(allReward.award[1][1])
        item:setData(config)
        item:setNum(allReward.award[1][2])
        item:setSwallowTouches(false)
    end
end

function SpiritWindow:setRankShow()
    if RankController:getInstance():checkRankIsShow() then
        self.rank_container:setVisible(true)
        self.ctrl:requestSpiritRank()
    else
        self.rank_container:setVisible(false)
        self.rank_top3_btn:setVisible(false)
    end
end

function SpiritWindow:register_event()
    registerButtonEventListener(self.close_btn, function()
            self.ctrl:openMainView(false)
        end,true, 2)

    registerButtonEventListener(self.award_btn, function()
            self.ctrl:openAwardWindow(true)
        end,true, 1)

    registerButtonEventListener(self.rank_top3_btn, function()
            RankController:getInstance():openRankView(true,RankConstant.RankType.tower)
        end,true, 1)
    registerButtonEventListener(self.btnRule, function(param,sender, event_type)
            local config = Config.StarTowerData.data_tower_const.rule_desc
            TipsManager:getInstance():showCommonTips(config.desc, sender:getTouchBeganPosition())
        end,true, 1)

    registerButtonEventListener(self.buy_btn, function()
            local function fun()
                self.ctrl:sender11321()
            end
            local have_buycount = self.ctrl:getModel():getBuyCount() or 0
            local role_vo = RoleController:getInstance():getRoleVo()
            local config = Config.StarTowerData.data_tower_vip[role_vo.vip_lev]

            if config and config.buy_count then 
                if have_buycount >= config.buy_count then 
                    message(TI18N("本日购买次数已达上限"))
                else
                    local buy_config = Config.StarTowerData.data_tower_buy[have_buycount+1]
                    if buy_config and buy_config.expend and buy_config.expend[1] and buy_config.expend[1][1] then 
                        local item_id = buy_config.expend[1][1]
                        local num = buy_config.expend[1][2] or 0
                        local item_config = Config.ItemData.data_get_data(item_id)
                        if item_config and item_config.icon then
                            local res = PathTool.getItemRes(item_config.icon)
                            local str = string.format( TI18N("是否花费<img src='%s' scale=0.25 />%s购买一次挑战次数？"),res, num)
                            CommonAlert.show(str,TI18N("确定"),fun,TI18N("取消"),nil,CommonAlert.type.rich,nil,nil,24)
                        end
                    end
                end
            end
        end,true, 1)

    self:addGlobalEvent(SpiritEvent.Update_All_Data,function()
            self:updateTowerList(true)
            self:updateCount()
            self:updataRewardRedPoint()
            self:refreshList()

        end)

    self:addGlobalEvent(SpiritEvent.Update_Top3_rank,function(list)
            self:updateTop3Info(list)
        end)

    self:addGlobalEvent(SpiritEvent.Update_First_Reward_Msg,function()
            self:updataRewardRedPoint()
        end)

    self:addGlobalEvent(SpiritEvent.Fight_Success_Event,function()
            self:refreshList()
        end)

    self:addGlobalEvent(SpiritEvent.Count_Change_Event,function()
            self:updateCount()
        --[[
            local index = self.ctrl:getModel():getNowTowerId() or 0

            local list = self.list_view:getActiveCellList()
            for i,v in ipairs(list) do
                if v.index == index then
                    if v:getData() then
                        v:sweepCount(v:getData())
                    end
                    break
                end
            end
        ]]
        end)

    -- 引导中不给滑动列表
    self:addGlobalEvent(GuideEvent.Update_Guide_Status_Event, function ( in_guide )
        --[[
            if in_guide then
                self.list_view:setClickEnabled(false)
            else
                self.list_view:setClickEnabled(true)
            end
        ]]
        end)
end

--奖励红点
function SpiritWindow:updataRewardRedPoint()
    local data = self.ctrl:getModel():getRewardData()
    local status = false
    for i,v in pairs(data) do
        if v.status == 1 then
            status = true
            break
        end
    end
    addRedPointToNodeByStatus(self.award_btn, status)
    MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.spirit, {bid = 1, status = status})
    GhostdomController:getInstance():setBuildRedStatus(GhostdomConst.Build_Type.spirit, {bid = 1, status = status})
end

function SpiritWindow:updateCount()
    local count = self.ctrl:getModel():getTowerLessCount() or 0
    local all_count = Config.StarTowerData.data_tower_const["free_times"].val or 0
    local str = string.format("%s/%s",count,all_count)
    self.buy_count:setString(str)

    local have_buycount = self.ctrl:getModel():getBuyCount() or 0
    local role_vo = RoleController:getInstance():getRoleVo()
    local config = Config.StarTowerData.data_tower_vip[role_vo.vip_lev]
    if config and config.buy_count then 
        local count = config.buy_count - have_buycount
        if count < 0 then
            count = 0
        end
        local str = string.format(TI18N("(剩余购买次数：")..count..')')
        self.buy_tips:setString(str)
    end
end

function SpiritWindow:openRootWnd()
    -- 请求排行榜数据,前3
    -- self.ctrl:requestSpiritRank()
    self:setRankShow()
    if self.ctrl:getModel():isInitSpiritData() then
        self:refreshList()
        self:updateCount()
        self:updataRewardRedPoint()
    else
        --请求塔数据
        self.ctrl:sender11320()
    end
end

--[[
@desc: 设置标签页面板数据内容
]]
function SpiritWindow:setPanelData()
end

function SpiritWindow:updateTopList()
    local setting = {
        item_class = CommonTabBtn,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 12,                    -- x方向的间隔
        start_y = 0,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = 160,               -- 单元的尺寸width
        item_height = 42,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 1,                         -- 列数，作用于垂直滚动类型
        need_dynamic = true
    }
    self.top_scrollview = CommonScrollViewLayout.new(self.container_top, cc.p(0, -12) , ScrollViewDir.horizontal, ScrollViewStartPos.top, self.container_top:getContentSize(), setting)


    self.max_count = Config.StarTowerData.data_tower_base_length
    self.tab_array = {}

    for i = 1,math.ceil(self.max_count/self.level_num) do
        local str =  StringUtil.numToChinese(i)

        self.tab_array[i] = {title = TI18N("第")..str..TI18N("层"), index = i,isNotClick=false}
    end



    local lev_id = self.ctrl:getModel():getNowLevelId()
     local ceng =  self.ctrl:getModel():getNowCeng()
    for k,v in pairs(self.tab_array) do 
         if k > ceng then 
            v.isNotClick= true 
         else
            v.isNotClick= false 
         end 
    end 

    self.top_scrollview:setData(self.tab_array, handler(self, self._onClickTabBtn), nil, {default_index = ceng, tab_size = cc.size(160, 42),title_offset = cc.p(0,0)})
    self.top_scrollview:setClickEnabled(true)
    self.top_scrollview:scrollToPercentHorizontal(math.floor(ceng*self.level_num/self.max_count)*100,0)
end

function SpiritWindow:refreshList()
    local lev_id = self.ctrl:getModel():getNowLevelId()
    local ceng =  self.ctrl:getModel():getNowCeng()
    for k,v in pairs(self.tab_array) do 
        if k > ceng then 
           v.isNotClick= true 
        else
            v.isNotClick= false 
        end 
   end 

    self.top_scrollview:setData(self.tab_array, handler(self, self._onClickTabBtn), nil, {default_index = ceng, tab_size = cc.size(160, 42),title_offset = cc.p(0,0)})
    self.top_scrollview:scrollToPercentHorizontal(math.floor(ceng*self.level_num/self.max_count)*100,0)
    self:updateSpiritScroll(ceng)
end


function SpiritWindow:_onClickTabBtn(tab_btn)
    if self.cur_tab_btn and self.cur_tab_btn.index == tab_btn.index then return end

    if self.cur_tab_btn then
        self.cur_tab_btn:setBtnSelectStatus(false)
    end

    if tab_btn then
        self.cur_tab_btn = tab_btn
        self.cur_tab_btn:setBtnSelectStatus(true)
        self:updateSpiritScroll(tab_btn.index)
    end
end

function SpiritWindow:updateSpiritScroll(level)

    local lev_id = self.ctrl:getModel():getNowTowerId()
    local step = 0
    self.cur_spirit_list = {}
    if level < 1 then
        level = 1
    end
    for i = 1,self.level_num do
        self.cur_spirit_list[i] = {level = (level-1)*self.level_num+i}
        if lev_id == (level-1)*self.level_num+i then
            step = i
        end
    end
    self.all_spirit_scrollview:setData(self.cur_spirit_list, nil, nil)

    self.all_spirit_scrollview:scrollToPercentHorizontal(step/self.level_num*100,0)
end

function SpiritWindow:updateTowerList(is_reload)
    local setting = {
        item_class = SpiritItem,      -- 单元类
        start_x = -10,                  -- 第一个单元的X起点
        space_x = -20,                    -- x方向的间隔
        start_y = -2,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = 306,               -- 单元的尺寸width
        item_height = 654,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 1,                         -- 列数，作用于垂直滚动类型
        need_dynamic = false
    }
    self.all_spirit_scrollview = CommonScrollViewLayout.new(self.container, cc.p(0, 0) , ScrollViewDir.horizontal, ScrollViewStartPos.top, self.container:getContentSize(), setting)


    if is_reload and not self.is_init_list then
        self.is_init_list = true 
        local lev_id = self.ctrl:getModel():getNowTowerId()
        self.all_spirit_scrollview:reloadData(lev_id)
        --self:updateSpiritScroll()
        
    end
end

function SpiritWindow:updateTop3Info(rank_list)
    if rank_list == nil or next(rank_list) == nil then return end
    for i, v in ipairs(rank_list) do
        if not self.top3_item_list[v.rank] then
            local item = self:createSingleRankItem(v.rank)
            self.rank_container:addChild(item)
            self.top3_item_list[v.rank] = item
        end
        local item = self.top3_item_list[v.rank]
        if item then
            item:setPosition(50,103 - (v.rank-1) * item:getContentSize().height)
            item.label:setString(v.name)

            item.value:setString(self.ctrl:getStrByLevel(v.tower))
        end
    end
end

function SpiritWindow:createSingleRankItem(i)
    local container = ccui.Layout:create()
    container:setAnchorPoint(cc.p(0,1))
    container:setContentSize(cc.size(180,30))
    local sp = createSprite(PathTool.getResFrame("spirit","hl_spirit_"..(8-i)),30,30/2,container)
    container.sp = sp
    local label = createLabel(20,cc.c3b(98,53,43),nil,74,15,"",container,0,cc.p(0,0.5))
    local value = createLabel(20,cc.c3b(98,53,43),nil ,200,15,"",container,0,cc.p(0,0.5))
    container.label = label
    container.value = value
    return  container
end

function SpiritWindow:close_callback()
    self.ctrl:openMainView(false)


    if self.all_spirit_scrollview then
        self.all_spirit_scrollview:DeleteMe()
        self.all_spirit_scrollview = nil
    end

    self.select_item = nil
    if self.lock_icon then 
        self.lock_icon:DeleteMe()
        self.lock_icon = nil
    end
end

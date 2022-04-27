-- --------------------------------------------------------------------
-- 竖版星命塔奖励总览
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
SpiritAwardWindow = SpiritAwardWindow or BaseClass(BaseView)

local table_insert =table.insert
local table_sort = table.sort
local string_format = string.format
local controller = SpiritController:getInstance()
local reward_data = Config.StarTowerData.data_get_floor_award

function SpiritAwardWindow:__init(set_id,pos)
    
    self.ctrl = SpiritController:getInstance()
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.title_str = TI18N("奖励")
    self.layout_name = "spirit/spirit_award_window"
    self.cloth_data = data or {}
    self.res_list = {

    }
    self.win_type = WinType.Big
    
end

function SpiritAwardWindow:open_callback()
    
    self.background = self.root_wnd:getChildByName("background_panel")
    self.background:setScale(display.getMaxScale())

    self.main_panel = self.root_wnd:getChildByName("main_panel")    
    self:playEnterAnimatianByObj(self.main_panel, 1)

    self.title = self.main_panel:getChildByName("title_label")
    self.title:setString(TI18N("奖励"))

    self.main_container = self.main_panel:getChildByName("main_container")

    self.close_btn = self.main_panel:getChildByName("close_btn")
    self:updateAwardList()
    
end

function SpiritAwardWindow:register_event()
    
    self:addGlobalEvent(SpiritEvent.Update_Reward_Event,function()
            self:updateAwardList()
        end)

    self.close_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                playQuitSound()
                self:close()
            end
        end)

end

function SpiritAwardWindow:openRootWnd()

end

function SpiritAwardWindow:updateAwardList()

    if not self.list_view then
        local scroll_view_size = self.main_container:getContentSize()
        local setting = {
            item_class = SpiritAwardItem,      -- 单元类
            start_x = 0,                  -- 第一个单元的X起点
            space_x = 0,                    -- x方向的间隔
            start_y = 0,                    -- 第一个单元的Y起点
            space_y = 0,                   -- y方向的间隔
            item_width = 480,               -- 单元的尺寸width
            item_height = 140,              -- 单元的尺寸height
            row = 1,                        -- 行数，作用于水平滚动类型
            col = 1,                         -- 列数，作用于垂直滚动类型
            need_dynamic = true,
        }
        self.list_view = CommonScrollViewLayout.new(self.main_container, cc.p(0, 0) , ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting)
    end

    local dic_reward = self.ctrl:getModel():getRewardData()
    local list = {}
    for k,v in pairs(dic_reward) do
        if reward_data[v.id] then --过滤
            table_insert(list, v)
        end
    end
    list = self.ctrl:getModel():sortFunc(list)
    self.list_view:setData(list)
    
end

function SpiritAwardWindow:close_callback()

    if self.list_view then 
        self.list_view:DeleteMe()
        self.list_view = nil
    end
    self.ctrl:openAwardWindow(false)

end

-- --------------------------------------------------------------------
-- 竖版奖励子项
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
SpiritAwardItem = class("SpiritAwardItem", function()
        return ccui.Widget:create()
    end)

function SpiritAwardItem:ctor()
    
    self.reward_list = {}
    self:config()
    self:layoutUI()
    self:registerEvents()
    
end
function SpiritAwardItem:config()
    
    self.size = cc.size(480,140)
    self:setContentSize(self.size)
    
end
function SpiritAwardItem:layoutUI()
    
    local csbPath = PathTool.getTargetCSB("spirit/spirit_award_item")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    self.main_panel = self.root_wnd:getChildByName("main_panel")

    self.btn_get = self.main_panel:getChildByName("btn_get")
    self.btn_get:setVisible(false)
    local btn_get_label = self.btn_get:getChildByName("Text_4")
    btn_get_label:setString(TI18N("领取"))
    btn_get_label:enableOutline(Config.ColorData.data_color4[264], 2)

    self.good_cons = self.main_panel:getChildByName("good_cons")
    self.text_floor = self.main_panel:getChildByName("text_floor")

    local scroll_view_size = self.good_cons:getContentSize()
    local setting = {
        item_class = BackPackItem,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 0,                    -- x方向的间隔
        start_y = 10,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = BackPackItem.Width*0.85,               -- 单元的尺寸width
        item_height = BackPackItem.Height*0.85,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 0,                         -- 列数，作用于垂直滚动类型
        scale = 0.85,
    }
    self.item_scrollview = CommonScrollViewLayout.new(self.good_cons, cc.p(0,0) , ScrollViewDir.horizontal, ScrollViewStartPos.top, scroll_view_size, setting)
    self.item_scrollview:setSwallowTouches(false)
    
end

function SpiritAwardItem:setData(data)
    
    if not data then return end
    local item_data = data --controller:getModel():getRewardData(data._index)
    self.tower_data = item_data

    self.btn_get:setVisible(item_data.status == 1)
    self.text_floor:setVisible(item_data.status ~= 1)

    if not reward_data[item_data.id] then return end
    local curPer  = controller:getModel():getNowTowerId() - reward_data[item_data.id].tower +5
    if curPer <0 then 
        curPer =0
    end
    local str = string_format(TI18N("通过第%d层(%d/%d)"),reward_data[item_data.id].tower/5,curPer,5)
    self.text_floor:setString(str)
    if item_data.status == 2 then
        self.text_floor:setString(str..("(已获取)"))
    end

    local list = {}
    for i,v in pairs(reward_data[item_data.id].award) do
        local tab = {}
        tab.id = v[1]
        tab.quantity = v[2]
        table_insert(list,tab)
    end
    self.item_scrollview:setData(list)
    self.item_scrollview:addEndCallBack(function ()
            local list = self.item_scrollview:getItemList()
            for k,v in pairs(list) do
                v:setDefaultTip()
            end
        end)
        
end

function SpiritAwardItem:registerEvents()
    
    registerButtonEventListener(self.btn_get, function()
            controller:sender11328(self.tower_data.id)
    end,true, 1)
    
end

function SpiritAwardItem:DeleteMe()
    
    if self.item_scrollview then
        self.item_scrollview:DeleteMe()
        self.item_scrollview = nil
    end 
    
    if self.reward_list and next(self.reward_list or {}) ~= nil then
        for i, v in ipairs(self.reward_list) do
            if v.DeleteMe then
                v:DeleteMe()
            end
        end
    end
    
end





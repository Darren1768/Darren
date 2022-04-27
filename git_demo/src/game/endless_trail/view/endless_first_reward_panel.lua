-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      无尽试炼总奖励面板
-- --------------------------------------------------------------------
EndlessFirstRewardPanel = class("EndlessFirstRewardPanel", function()
    return ccui.Layout:create()
end)

local table_sort = table.sort

local controller = Endless_trailController:getInstance()
local model = Endless_trailController:getInstance():getModel()
local max_count = 10
function EndlessFirstRewardPanel:ctor(type)
    self.endless_type = type or 1
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_awards_panel"))

    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    local container = self.root_wnd:getChildByName("container")
    local rank_title = container:getChildByName("rank_title")
    rank_title:setString(TI18N("首通"))
    rank_title:setPositionX(130)
    local award_title = container:getChildByName("award_title")
    award_title:setString(TI18N("奖励"))
    award_title:setPositionX(450)

    local scroll_container = container:getChildByName("scroll_container")
    local size = scroll_container:getContentSize()
    local setting = {
        item_class = EndlessFirstAwardsItem,
        start_x =3,
        space_x = 0,
        start_y = 0,
        space_y = 0,
        item_width = 604,
        item_height = 124,
        row = 0,
        col = 1,
        need_dynamic = true
    }
    self.scroll_view = CommonScrollViewLayout.new(scroll_container, nil, nil, nil, size, setting)
    self:registerEvent()
end

function EndlessFirstRewardPanel:registerEvent()
    EventManager:getInstance():Bind(Endless_trailEvent.UPDATA_BASE_DATA,self,
    function()
        self:updateItemData()
    end)

    EventManager:getInstance():Bind(Endless_trailEvent.UPDATA_FIRST_DATA,self,
    function()
            self:updateItemData()
    end)
 
end

function EndlessFirstRewardPanel:setNodeVisible(status)
	self:setVisible(status)
end 

function EndlessFirstRewardPanel:addToParent()
    self.touch_type = Endless_trailEvent.endless_type.old
    if self.endless_type == 1 then
        -- 单人模式
        self.touch_type = Endless_trailEvent.endless_type.singlemode
        -- controller:send23903(self.touch_type)
    elseif self.endless_type == 2 then
        self.touch_type = Endless_trailEvent.endless_type.old
        -- controller:send23903(self.touch_type)
    end

    self:updateItemData()
end


-- 设置列表内容
function EndlessFirstRewardPanel:updateItemData()
    local list_data = {}
    local config = Config.EndlessData
    if config then
        local first_data = model:getFirstData(self.touch_type)  
        if config.data_first_data and config.data_first_data[self.touch_type] and first_data then
            local temp_count = 1
            for k, v in ipairs(config.data_first_data[self.touch_type]) do
                if v.id >= first_data.id then
                    local cur_is_receive = false
                    if first_data.rewarded then
                        for k1, v1 in pairs(first_data.rewarded) do
                            if v1.id == v.id then
                                cur_is_receive = true
                            end
                        end
                    end
                    local temp_data = {
                        select_index = self.cur_selected,
                        id = v.id,
                        items = deepCopy(v.items),
                        limit_id = v.limit_id,
                        can_receive = first_data.max_id >= v.limit_id and first_data.status == 1,
                        is_receive = cur_is_receive,
                        type = self.touch_type,
                        max_id = first_data.max_id
                    }

                    table.insert(list_data, temp_data)
                    temp_count = temp_count + 1
                    if temp_count > max_count then
                        break
                    end
                end
            end
        end
    
    end
  
    if #list_data >0 then 
        self.scroll_view:setData(list_data)
    end 
end



function EndlessFirstRewardPanel:updatePanelInfo(is_event)
end

function EndlessFirstRewardPanel:DeleteMe()
    if self.scroll_view then
        self.scroll_view:DeleteMe()
        self.scroll_view = nil
    end
end


EndlessFirstAwardsItem = class("EndlessFirstAwardsItem",function()
    return ccui.Layout:create()
end)

function EndlessFirstAwardsItem:ctor()
    self.item_list = {}

    self.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_awards_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.rank_img = self.root_wnd:getChildByName("rank_img")
    self.rank_img:setVisible(false)
    self.rank_label = self.root_wnd:getChildByName("rank_label")
    self.item_container = self.root_wnd:getChildByName("item_container")
    self.total_width = self.item_container:getContentSize().width -80
    self.rank_label:setVisible(false)
    self.bg_image =   self.root_wnd:getChildByName("background")
    self.label_1 = self.root_wnd:getChildByName("label_1")
    self.label_2 = self.root_wnd:getChildByName("label_2")
    self.label_1:setVisible(true)
    self.label_2:setVisible(true)
    self.label_1:setPositionX(80)
    self.label_2:setPositionX(80)
    self:registerEvent()
end

function EndlessFirstAwardsItem:registerEvent()
end

function EndlessFirstAwardsItem:setData(data)
    if not data then 
        return
    end 
    self.data= data 
    if data._index %2 == 0 then 
        self.bg_image:setVisible(false)
    else 
        self.bg_image:setVisible(true)
    end 

    local line = math.modf(  self.data.limit_id / 5 )  -- 取整数
    local mod = math.fmod(  self.data.limit_id, 5 )    -- 取余数

    local _str =   (line+1) .. "玄" 

    local title_text = "第"..(line+1) .. "玄"
    self.label_1:setString(title_text)
    self.label_2:setString(_str.."可领取")

    -- 奖励数据
    local item_config = nil
    local index = 1
    local item = nil
    local scale = 0.8
    local off = 30
    local _x, _y = 0, 55
    local sum = #data.items
    for i=sum,1,-1 do
        local v = data.items[i]
        item_config = Config.ItemData.data_get_data(v[1])
        if item_config then
            if self.item_list[index] == nil then
                item = BackPackItem.new(false, true, false, scale, false, true) 
                _x = self.total_width - ( (index-1)*(BackPackItem.Width*scale+off) + BackPackItem.Width*0.5*scale )
                item:setPosition(_x, _y)
                self.item_container:addChild(item)
                self.item_list[index] = item
            end
            item = self.item_list[index]
            item:setBaseData(v[1],v[2])
            index = index + 1
        end
    end

end

function EndlessFirstAwardsItem:DeleteMe()
    for i,v in ipairs(self.item_list) do
        v:DeleteMe()
    end
    self.item_list = nil
    self:removeAllChildren()
    self:removeFromParent()
end

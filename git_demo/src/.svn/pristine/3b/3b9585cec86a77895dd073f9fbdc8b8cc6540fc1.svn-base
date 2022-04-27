-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      掉落信息查看面板
-- --------------------------------------------------------------------
BattlDramaDropTipsWindow = class("BattlDramaDropTipsWindow", function()
    return ccui.Widget:create()
end)

local controller = BattleDramaController:getInstance() 
local model = BattleDramaController:getInstance():getModel()

function BattlDramaDropTipsWindow:ctor(max_dun_id)
    self.max_dun_id = max_dun_id or model:getDramaData().max_dun_id
    self.item_list = {}
    self:open_callback()
end
function BattlDramaDropTipsWindow:open_callback()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("battledrama/battle_drama_drop_view"))
	self.root_wnd:setPosition(58,280)
    self:addChild(self.root_wnd)
    self:setCascadeOpacityEnabled(true)
    self:setAnchorPoint(0,0)

    self.main_container = self.root_wnd:getChildByName("root")
    self.item_scroolview = self.main_container:getChildByName("item_scrollview")
    self.item_scroolview:setScrollBarEnabled(false)

    self.empty_bg = self.main_container:getChildByName('empty_bg')
    self.empty_bg:setVisible(true)
    loadSpriteTexture(self.empty_bg, PathTool.getSingleImgForDownLoad('bigbg', 'bigbg_3'), LOADTEXT_TYPE)

    self.desc_label = self.empty_bg:getChildByName('desc_label')
    self.desc_label:setPositionX(self.empty_bg:getContentSize().width / 2)
    self.desc_label:setString(TI18N('暂无记录'))

    if self.max_dun_id and Config.DungeonData.data_drama_dungeon_info(self.max_dun_id) then
        local data = Config.DungeonData.data_drama_dungeon_info(self.max_dun_id)
        if data then
       
            self:updateItemSprites()
            self:updateItemHook(data)
            self:updateItemReward(data.hook_show_items)
        end
    end

end

function BattlDramaDropTipsWindow:register_event()
    if self.background then
        self.background:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
            end
        end)
    end
end
function BattlDramaDropTipsWindow:createItem(pos)
  local item = BattleDramaDropItem.new()
  item:setPosition(pos)
    self.main_container:addChild(item)
    return item
end
function BattlDramaDropTipsWindow:updateSprites(data)
    if  self.spritesItem then
        self.spritesItem:updateSprites(data)
    end
  
end
function BattlDramaDropTipsWindow:updateItemSprites()
  
    self.spritesItem = self:createItem(cc.p(50,467)) 
    self.spritesItem:setData(false,nill,nil,1)
end


function BattlDramaDropTipsWindow:updateItemHook(data)
    local str=model:calcHookItemsReachTxt(data)
    self.hookItem = self:createItem(cc.p(50,200)) 
    self.hookItem:setData(false,nill,str)
end

function BattlDramaDropTipsWindow:updateItemReward(data)
    if not data then return end
    self.empty_bg:setVisible(false)
    self.cur_item = self:createItem(cc.p(50,74))
    self.cur_item:setData(true,data)
end

function BattlDramaDropTipsWindow:setVisibleStatus(bool)
    bool = bool or false
    self:setVisible(bool)
end

function BattlDramaDropTipsWindow:DeleteMe()
    if self.cur_item then
        self.cur_item:DeleteMe()
        self.cur_item = nil
    end
    if self.item_list and next(self.item_list or {}) ~= nil then
        for i,v in ipairs(self.item_list) do
            if v then
                v:DeleteMe()
                v = nil
            end
        end
    end
    self.item_list = {}
end
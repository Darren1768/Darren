-- --------------------------------------------------------------------
-- @description:
--      日常主界面的成就标签页
--
-- --------------------------------------------------------------------

BattleNationalWarShowTeam = class("BattleNationalWarShowTeam",function()
    return ccui.Layout:create()
end)

function BattleNationalWarShowTeam:ctor(ctrl)
    self.ctrl = ctrl
    -- self.model = self.ctrl:getModel()
    self.size = cc.size(574, 670)

    self:configUI()
    self:registerEvent()


   
end

function BattleNationalWarShowTeam:configUI( )
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("battle_national_war/battle_border_war_show_team"))
    self:addChild(self.root_wnd)
    self.contaniner = self.root_wnd:getChildByName("contaniner")
    self.bg = self.root_wnd:getChildByName("bg")


    local scrollview_contaniner = self.contaniner:getChildByName("scrollview_container")
    local scor_size = scrollview_contaniner:getContentSize()

    local setting = {
        item_class = BattleNationalWarShowTeamItem,
        start_x = 0,
        space_x = 0,
        start_y = 0,
        space_y = 4,
        item_width = 520,
        item_height = 121,
        row = 1,
        col = 1,
        need_dynamic = true
    }
    self.item_scrollview = CommonScrollViewLayout.new(scrollview_contaniner,cc.p(2, 0),ScrollViewDir.vertical,ScrollViewStartPos.top,scor_size,setting)
end 

function BattleNationalWarShowTeam:registerEvent()
end

function BattleNationalWarShowTeam:addToParent(status)
    self:handleDynamicEvent(status)
    self:setVisible(true)
    if status == true then
        self:updateFeatList(true)
    end
end

function BattleNationalWarShowTeam:handleDynamicEvent(status)
    if not status then
    EventManager:getInstance():UnBind(self)
    else
     EventManager:getInstance():Bind(TaskEvent.UpdateFeatList,self, function()
                self:updateFeatList()
            end)
    end
end

function BattleNationalWarShowTeam:updateFeatList()
    -- local list = self.model:getFeatList()

    local list  = {}
    for i=1 ,10 do 

        list[i]= {}
    end 
    self.item_scrollview:setData(list)
end

function BattleNationalWarShowTeam:DeleteMe()
    self:handleDynamicEvent(false)
    if self.item_scrollview then
        self.item_scrollview:DeleteMe()
        self.item_scrollview = nil
    end
end

-- --------------------------------------------------------------------
-- @description:
--      成就使用的单元
--
-- --------------------------------------------------------------------
BattleNationalWarShowTeamItem = class("BattleNationalWarShowTeamItem", function()
    return ccui.Layout:create()
end)

function BattleNationalWarShowTeamItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("battle_national_war/battle_border_war_show_team_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)


    self.container = self.root_wnd:getChildByName("container")
 
    self.item_list = {}

    self:registerEvent()
end

function BattleNationalWarShowTeamItem:registerEvent()
    -- self.goto_btn:addTouchEventListener(function(sender, event_type)
    --     customClickAction(sender, event_type)
    --     if event_type == ccui.TouchEventType.ended then
            
    --     end
    -- end)
	
end

function BattleNationalWarShowTeamItem:setData(data)
    if self.data ~= nil then
        if self.update_self_event ~= nil then
            self.data:UnBind(self.update_self_event)
            self.update_self_event = nil
        end
        self.data = nil
    end
    self.data = data
   
end



function BattleNationalWarShowTeamItem:DeleteMe()
    for i,v in ipairs(self.item_list) do
        v:DeleteMe()
    end
    self.item_list = nil
    if self.data ~= nil then
        if self.update_self_event ~= nil then
            self.data:UnBind(self.update_self_event)
            self.update_self_event = nil
        end
        self.data = nil
    end
    self:removeAllChildren()
    self:removeFromParent()
end
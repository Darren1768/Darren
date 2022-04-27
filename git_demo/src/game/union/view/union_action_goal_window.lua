-- --------------------------------------------------------------------
-- @description:
--      公会活跃
-- --------------------------------------------------------------------
UnionActionGoalWindow = UnionActionGoalWindow or BaseClass(BaseView)

local controller = UnionController:getInstance()
-- local model = UnionController:getInstance():getModel()
local string_format = string.format
local tesk_data = Config.UnionQuestData.data_task_data
local tesk_length = Config.UnionQuestData.data_lev_data_length
local lev_data = Config.UnionQuestData.data_lev_data
local table_insert = table.insert

function UnionActionGoalWindow:__init()
    self.win_type = WinType.Big
    
    self.layout_name = "union/union_action_goal"
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.item_scrollview = nil
    self.reward_list = {}
    self.receve_list = {}
    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("union", "union"), type = ResourcesType.plist},
        {path = PathTool.getPlistImgForDownLoad("unionactive", "unionactive"), type = ResourcesType.plist},
    } 

    self.my_union_info = UnionController:getInstance():getModel():getMyUnionInfo()
end 

function UnionActionGoalWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale())

    local container = self.root_wnd:getChildByName("main_container")

    self:playEnterAnimatianByObj(container, 1)
    local main_panel = container:getChildByName("main_panel")
    self.close_btn = main_panel:getChildByName("close_btn")
    main_panel:getChildByName("win_title"):setString(TI18N("公会活跃"))
    main_panel:getChildByName("Text_48_3"):setString(TI18N("升级奖励"))
    self.textLv = main_panel:getChildByName("textLv")

    self.progress = main_panel:getChildByName("progress")
    self.progress:setScale9Enabled(true)
    self.progress_num = main_panel:getChildByName("progress_num")
    
    self.goods = main_panel:getChildByName("goods")
    self.goods:setScrollBarEnabled(false)
    
    local image_4 = main_panel:getChildByName("Image_4")
    self.cur_active = image_4:getChildByName("cur_active")
    if self.my_union_info then
        self.cur_active:setString(self.my_union_info.vitality)
    else
        self.cur_active:setString(0)
    end
    local union_active = main_panel:getChildByName("Image_3_0")
    local union_active_label = union_active:getChildByName("Text_5")
    union_active_label:setString(TI18N("(公会成员每获得一点活跃值便增加一点公会活跃)"))

    self.rewardLayer = main_panel:getChildByName("rewardLayer")
    self.rewardLayer:getChildByName("Text_54"):setString(TI18N("奖励预览"))
    self.btn_reward = main_panel:getChildByName("btn_reward")
    self.btn_reward:getChildByName("Text_54_0"):setString(TI18N("升级并领取"))
    self.btn_reward_redpoint = self.btn_reward:getChildByName("redpoint")
    self.btn_reward_redpoint:setVisible(false)
    self.textAllGetReward = main_panel:getChildByName("textAllGetReward")
    self.textAllGetReward:setVisible(false)

    self.skill_full = {}
    for i=1,3 do
        self.skill_full[i] = main_panel:getChildByName("skill_full_"..i)
        self.skill_full[i]:setVisible(false)
    end

    self.goods_list = main_panel:getChildByName("goods_list")
    local bgSize = self.goods_list:getContentSize()
    local scroll_view_size = cc.size(bgSize.width, bgSize.height)
    local setting = {
        item_class = UnionActionGoalItem,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 0,                    -- x方向的间隔
        start_y = 0,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = 599,               -- 单元的尺寸width
        item_height = 74,              -- 单元的尺寸height
        row = 0,                        -- 行数，作用于水平滚动类型
        col = 1,                         -- 列数，作用于垂直滚动类型
    }
    self.item_scrollview = CommonScrollViewLayout.new(self.goods_list, cc.p(0,5), ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting)
    self.item_scrollview:setSwallowTouches(false)

    self.desc_label = createRichLabel(22, cc.c4b(0x68,0x45,0x2A,0xff), cc.p(1, 0.5), cc.p(635,40),nil,nil,1000)
    main_panel:addChild(self.desc_label)
        
    local pos_y = {639,600,561}
    self.current_att = {}
    for i=1,3 do
        self.current_att[i] = createRichLabel(22, cc.c4b(0x68,0x45,0x2A,0xff), cc.p(0, 0.5), cc.p(235,pos_y[i]),nil,nil,200)
        main_panel:addChild(self.current_att[i])
    end

    self.arrow_list = {}
    for i = 1, 3 do
        local arrow_sp = main_panel:getChildByName("arrow_" .. i)
        arrow_sp:setVisible(false)
        self.arrow_list[i] = arrow_sp
    end

    self.next_att = {}
    for i=1,3 do
        self.next_att[i] = createRichLabel(22, cc.c4b(0x24,0x90,0x03,0xff), cc.p(0, 0.5), cc.p(540,pos_y[i]),nil,nil,200)
        main_panel:addChild(self.next_att[i])
    end

    -- 公会活跃等级图标
    self.active_icon_btn = main_panel:getChildByName("active_icon_btn")
    self.active_icon_sp = self.active_icon_btn:getChildByName("icon_sp")
end

function UnionActionGoalWindow:reverseTable(tab)
    local tmp = {}
    for i = 1, #tab do
        local key = #tab
        tmp[i] = table.remove(tab)
    end
    return tmp
end

function UnionActionGoalWindow:register_event()
     EventManager:getInstance():Bind(UnionEvent.UpdataUnionGoalBasicData,self,function ( data )
            if data.exp >= lev_data[data.lev].exp then
                self.btn_reward_redpoint:setVisible(true)
            else
                self.btn_reward_redpoint:setVisible(false)
            end
            self.textLv:setString("Lv."..data.lev)
            
            local str = string_format(TI18N("今日已获活跃：<div fontcolor=#249003>%d</div> 本周已获活跃：<div fontcolor=#249003>%d</div>"),data.day_exp,data.week_exp)
            self.desc_label:setString(str)

            local num = data.lev + 1
            if num >= tesk_length then --满级的时候
                self.progress_num:setString(TI18N("已满级"))
                self.progress:setPercent(100)

                self.textAllGetReward:setVisible(true)
                self.textAllGetReward:setString(TI18N("所有奖励已领完"))
                self.textAllGetReward:setTextColor(cc.c4b(0x68,0x45,0x2A,0xff))
                self.btn_reward:setVisible(false)
                self:upGradeReward(lev_data[data.lev].items)
                self:upGradeAttr(lev_data[data.lev].attr)
                for i=1,3 do
                    self.skill_full[i]:setVisible(true)
                    self.next_att[i]:setVisible(false)
                end
            else
                local strLev = string_format("%d/%d",data.exp,lev_data[data.lev].exp)
                self.progress_num:setString(strLev)
                self.progress:setPercent(math.floor(data.exp / lev_data[data.lev].exp * 100))
                if data.exp >= lev_data[data.lev].exp then
                    self.btn_reward:setVisible(true)
                    self.textAllGetReward:setVisible(false)
                else
                    self.btn_reward:setVisible(false)
                    self.textAllGetReward:setVisible(true)
                    local str = string_format(TI18N("活跃等级%d级可领"),num)
                    self.textAllGetReward:setTextColor(Config.ColorData.data_color4[183])
                    self.textAllGetReward:setString(str)
                end
                self:upGradeAttr(lev_data[data.lev].attr,lev_data[num].attr)
                self:upGradeReward(lev_data[num].items)
            end
        end)

     EventManager:getInstance():Bind(UnionEvent.UpdataUnionGoalTaskData,self,function ( data )
            self.receve_list = {}
            local data_sort = {}
            data.list = self:reverseTable(data.list)       
            for i,v in ipairs(data.list) do
                for k,m in pairs(tesk_data) do
                    if v.id == m.id then
                        table_insert(data_sort, m)
                    end
                end
            end
            self.receve_list = data.list
            if self.item_scrollview then
                self.item_scrollview:setData(data_sort,nil,nil,data.list)
            end
        end)

  

    -- 更新公会活跃光环
    self:addGlobalEvent(UnionEvent.UpdateActiveIconEvent, function ( icon_id )
        self:updateActiveIconById(icon_id)
    end)
    
    if self.background then
        self.background:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playQuitSound()
                controller:openUnionActionGoalWindow(false)
            end
        end)
    end
    self.close_btn:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playQuitSound()
            controller:openUnionActionGoalWindow(false) 
        end
    end)

    if self.rewardLayer then
        self.rewardLayer:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                controller:openUnionRewardWindow(true)
            end
        end)
    end
    
    if self.btn_reward then
        self.btn_reward:addTouchEventListener(function(sender, event_type)
            customClickAction(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                controller:send16904()
            end
        end)
    end

    --公会信息
    if self.my_union_info ~= nil then
        if self.my_union_info ~= nil and self.update_union_event == nil then
            self.update_union_event = self.my_union_info:Bind(UnionEvent.UpdateMyInfoEvent, function(key, value) 
                if key == "vitality" then
                    --活跃度更新
                    if self.cur_active then
                        self.cur_active:setString(value)
                    end
                end
            end)
        end
    end

    -- 选择公会活跃等级图标
    registerButtonEventListener(self.active_icon_btn, function (  )
        controller:openUnionActiveIconWindow(true)
    end, true)
end

function UnionActionGoalWindow:openRootWnd()
    controller:send16900()
    controller:send16901()

    -- 公会活跃等级图标
    local res_id = SysEnv:getInstance():loadUnionActiveIconId()
    self:updateActiveIconById(res_id)
end
--升级奖励
function UnionActionGoalWindow:upGradeReward(items)
    local total_width = BackPackItem.Width * #items * 0.75 + #items * 10
    local max_width = math.max(self.goods:getContentSize().width, total_width)
    self.goods:setInnerContainerSize(cc.size(max_width, self.goods:getContentSize().height))

    for i,v in pairs(self.reward_list) do
        v:setVisible(false)
    end
    for i=1, #items do
        if not self.reward_list[i] then
            local item = BackPackItem.new(true,true,nil,0.75)
            item:setAnchorPoint(0, 0.5)
            self.goods:addChild(item)
            self.reward_list[i] = item
        end
        item = self.reward_list[i]
        if item then
            item:setVisible(true)
            item:setPosition((i - 1)*(BackPackItem.Width*0.75+10), 45)
            item:setBaseData(items[i][1], items[i][2])
            item:setDefaultTip()
        end
    end
end
--属性
function UnionActionGoalWindow:upGradeAttr(currentAtt,nextAtt)
    if currentAtt then
        for i,v in pairs(currentAtt) do
            local attr_icon = PathTool.getAttrIconByStr(v[1])
            local name = Config.AttrData.data_key_to_name[v[1]] or ""
            local msg = string.format(TI18N("<img src=%s visible=true scale=1 /> %s： %d"),PathTool.getResFrame("common", attr_icon),name,v[2])
            self.current_att[i]:setString(msg)
            self.arrow_list[i]:setVisible(true)
        end
    end
    if nextAtt then
        for i,v in pairs(nextAtt) do
            self.next_att[i]:setString(v[2])
        end
    end
end

-- 活跃等级图标
function UnionActionGoalWindow:updateActiveIconById( res_id )
    if not res_id or not self.active_icon_sp then return end
    local icon_path = PathTool.getResFrame("unionactive", "unionactive_icon_" .. res_id)
    loadSpriteTexture(self.active_icon_sp, icon_path, LOADTEXT_TYPE_PLIST)
end

function UnionActionGoalWindow:close_callback()
    if self.my_union_info ~= nil then
        if self.update_union_event ~= nil then
            self.my_union_info:UnBind(self.update_union_event)
            self.update_union_event = nil
        end
        self.my_union_info = nil
    end

    if self.item_scrollview then
        self.item_scrollview:DeleteMe()
        self.item_scrollview = nil
    end

    EventManager:getInstance():UnBind(self)
    controller:openUnionActionGoalWindow(false)
end

--子项
UnionActionGoalItem = class("UnionActionGoalItem", function()
    return ccui.Widget:create()
end)

function UnionActionGoalItem:ctor()
    self:configUI()
    self:register_event()
end

function UnionActionGoalItem:configUI( )
    self.size = cc.size(599,74)
    self:setTouchEnabled(true)
    self:setContentSize(self.size)

    local csbPath = PathTool.getTargetCSB("union/union_action_goal_item")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    self.container = self.root_wnd:getChildByName("container")
    --日常
    self.title_1 = self.container:getChildByName("title_1")
    self.title_1:getChildByName("Text_5_0"):setString(TI18N("日常"))
    self.title_1:setVisible(false)
    --周常
    self.title_2 = self.container:getChildByName("title_2")
    self.title_2:getChildByName("Text_5"):setString(TI18N("周常"))
    self.title_2:setVisible(false)
    self.btn_goto = self.container:getChildByName("btn_goto")
    self.sprite_has = self.container:getChildByName("sprite_has")
    self.sprite_has:setVisible(false)
    self.btn_commit = self.container:getChildByName("btn_commit")
    self.btn_commit:setVisible(false)
    
    self.item_desc = {}
    for i=1,3 do
        self.item_desc[i] = self.container:getChildByName("desc_"..i)
    end

end
function UnionActionGoalItem:register_event()
    if self.btn_goto then
        self.btn_goto:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                if self.data.show_jump then
                    BackpackController:getInstance():gotoItemSources(self.data.show_jump, {})
                else
                    message(TI18N("该活动未开启"))
                end
            end
        end)
    end

    if self.btn_commit then
        self.btn_commit:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                UnionController:getInstance():send16903(self.data.id)
            end
        end)
    end
end

function UnionActionGoalItem:setExtendData(tab)
    self.task_data = tab
end

function UnionActionGoalItem:setData( data )
    self.data = data
    if data.desc then
        self.item_desc[1]:setString(data.desc)
    end
    self.title_1:setVisible(data.type == 1)
    self.title_2:setVisible(data.type == 2)
    if data.exp then
        self.item_desc[3]:setString(data.exp)
    end
    self:changeItemStatus(self.data._index)
end
function UnionActionGoalItem:changeItemStatus(index)
    self.btn_goto:setVisible(self.task_data[index].finish == 0)
    self.btn_commit:setVisible(self.task_data[index].finish == 1)
    self.sprite_has:setVisible(self.task_data[index].finish == 2)

    local str = string_format("(%d/%d)",self.task_data[index].value, self.task_data[index].target_val)
    self.item_desc[2]:setString(str)
end

function UnionActionGoalItem:DeleteMe()
    self:removeAllChildren()
end 
-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      无尽试炼好友援助主界面
-- --------------------------------------------------------------------
LeagueExploreReceiveWindow = LeagueExploreReceiveWindow or BaseClass(BaseView)

local controller = LeagueExploreController:getInstance()
local model = LeagueExploreController:getInstance():getModel()
local string_format = string.format

function LeagueExploreReceiveWindow:__init()
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Big

    self.layout_name = "league_explore/league_explore_receive_window"
    self.selected_tab = nil -- 当前选中的标签
    self.tab_list = {}
    self.panel_list = {}
end

function LeagueExploreReceiveWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    if self.background ~= nil then
        self.background:setScale(display.getMaxScale())
    end

    self.main_container = self.root_wnd:getChildByName("main_container")
    local main_panel= self.main_container:getChildByName("main_panel")
    self.close_btn= main_panel:getChildByName("close_btn")

    self.name_label = main_panel:getChildByName("name_label")
    -- self.time_label = main_panel:getChildByName("time_label")
    -- self.land_label = main_panel:getChildByName("land_label")
    -- self.product_label = main_panel:getChildByName("product_label")

    self.confir_btn = main_panel:getChildByName("confir_btn")
    

    self.role = RoleController:getInstance():getRoleVo()
    self.name_label:setString("联盟名称："..self.role.lname)
    if self.role.lname == "" then 
        self.name_label:setString("")
    end 

    self.scroll_container = main_panel:getChildByName("scroll_container")
    local size = self.scroll_container:getContentSize()
    local setting = {
        item_class = LeagueExploreReceiveItem,
        start_x = 11,
        space_x = 0,
        start_y = 0,
        space_y = 5,
        item_width = 634,
        item_height = 300,
        row = 0,
        col = 1,
        need_dynamic = true
    }
    self.scroll_view = CommonScrollViewLayout.new(self.scroll_container, cc.p(0, 10), nil, nil, cc.size(size.width, size.height), setting)
    self.scroll_view:setSwallowTouches(false)
end 

function LeagueExploreReceiveWindow:register_event()
   
    if self.background then
        self.background:addTouchEventListener(
            function(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    playQuitSound()
                    controller:openReceiveExploreWindow(false) 
                end
            end
        )
    end
    if self.close_btn then
        self.close_btn:addTouchEventListener(
            function(sender, event_type)
                customClickAction(sender,event_type)
                if event_type == ccui.TouchEventType.ended then
                    playQuitSound()
                    controller:openReceiveExploreWindow(false) 

                end
            end
        )
    end

    registerButtonEventListener(self.confir_btn, function ()
        controller:sender29316()
    end, true,2)


     EventManager:getInstance():Bind(LeagueExploreEvent.Updata_Resource_Receive_Data,self,function(data)
          self.base_data = data
          self:setData(data)
     end)
end


function LeagueExploreReceiveWindow:openRootWnd(type)
    self:setData()
    -- local _id = model:getResourceID()
    -- controller:sender29313(_id)
    controller:sender29315()
end


function LeagueExploreReceiveWindow:setData(data)

    setChildUnEnabled(true,  self.confir_btn)
    self.confir_btn:setTouchEnabled(false)
    if not data then 
        commonShowEmptyIcon(self.main_container, true, {text = TI18N("暂无可领取奖励")})
        return
    else
        commonShowEmptyIcon(self.main_container, false, {})
    end        

    local _data ={}
    local data =data 

    if data and data.info  then 
        for k, v in pairs(data.info ) do
            local _config =  Config.LeagueExploreData.data_resource_data[v.id]
            v.config =_config
            v.resource_data = model:getResourceDataByID(v.id)
            if v.day_status == 0 or  v.week_status==0  then 
                setChildUnEnabled(false,  self.confir_btn)
                self.confir_btn:setTouchEnabled(true)
            end 
            table.insert(_data,v) 
        end
    end
    self.scroll_view:setData(_data)
 
    -- local _day_cofig =Config.ItemData.data_get_data(_config.day_award[1][1])
    -- local _week_cofig =Config.ItemData.data_get_data(_config.week_award[1][1])
    -- local _str_produce = "日产".._day_cofig.name.."*".._config.day_award[1][2].."、周产".._week_cofig.name.."*".._config.week_award[1][2]
   

    -- local _str =string_format("领地：%s[%s]",LeagueExploreConst.land_type[_config.para_pos],LeagueExploreConst.Cross_Type[_config.is_cross] )  
    -- self.land_label:setString(_str)
    
    -- if _current_resource.occupy_time <1 then 
    --     self.time_label:setString("占领时间：".."暂未占领")
    -- else
    --     self.time_label:setString("占领时间："..TimeTool.getYMD2(_current_resource.occupy_time))  --occupy_time
    -- end 
    -- self.product_label:setString("产出：".._str_produce)

end

-- 判断是否有可领取的 self.base_data

function LeagueExploreReceiveWindow:close_callback()
    controller:openReceiveExploreWindow(false)
    EventManager:getInstance():UnBind(self)
end


-- --------------------------------------------------------------------
-- @description:
--      循环赛排行榜单元
--
-- --------------------------------------------------------------------
LeagueExploreReceiveItem = class("LeagueExploreReceiveItem",function()
    return ccui.Layout:create()
end)

function LeagueExploreReceiveItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("league_explore/league_explore_receive_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)
    self.container = self.root_wnd:getChildByName("container")

    self.got_time_label = self.container:getChildByName("got_time_label")
    self.land_label = self.container:getChildByName("land_label")
    self.product_label = self.container:getChildByName("product_label")

    
    self.week_time_label = self.container:getChildByName("week_time_label")
    self.week_title_label = self.container:getChildByName("week_title_label")

        
    self.day_time_label = self.container:getChildByName("day_time_label")
    self.day_title_label = self.container:getChildByName("day_title_label")
    
    self.reward_contanier_week = createScrollView(600, 100,18, 108, self.container, ScrollViewDir.horizontal)     
    self.reward_contanier_week:setScrollBarEnabled(false)

    
    self.reward_contanier_day = createScrollView(600, 100,18, 0, self.container, ScrollViewDir.horizontal)     
    self.reward_contanier_day:setScrollBarEnabled(false)
    self:registerEvent()
end

function LeagueExploreReceiveItem:registerEvent()
 
end

function LeagueExploreReceiveItem:addCallBack(call_back)
    self.call_back = call_back
end

function LeagueExploreReceiveItem:setData(data)
    if data._index%2 ==1 then 

    end 
     self.data = data 

    if  self.data.resource_data.occupy_time <1 then 
        self.got_time_label:setString("占领时间：".."暂未占领")
    else
        self.got_time_label:setString("占领时间："..TimeTool.getYMD2(self.data.resource_data.occupy_time))  --occupy_time
    end 

    local _str =string_format("领地：%s[%s]",LeagueExploreConst.land_type[ self.data.config.para_pos],LeagueExploreConst.Cross_Type[self.data.config.is_cross] )  
    self.land_label:setString(_str)

    local _day_cofig =Config.ItemData.data_get_data(self.data.config.day_award[1][1])
    local _week_cofig =Config.ItemData.data_get_data(self.data.config.week_award[1][1])
    local _str_produce = "日产".._day_cofig.name.."*"..self.data.config.day_award[1][2].."、周产".._week_cofig.name.."*"..self.data.config.week_award[1][2]
    self.product_label:setString("产出：".._str_produce)


    local cur_time = GameNet:getInstance():getTime()

    if self.data.day_status ==0 then 
         -- 未领取
         self.day_time_label:setString("00:00:00")
   
         self.day_time_label:setVisible(true)
         self.day_title_label:setPositionX(273)

    end 
    if self.data.day_status ==1 then 
          -- 已领取
          self.day_time_label:setVisible(false)
          self.day_title_label:setPositionX(self.container:getContentSize().width/2)
    end 
    if self.data.day_status ==2 then 
          -- 不可领取
          self.day_time_label:setVisible(true)
          self.day_title_label:setPositionX(273)

         local less_time_day = 0
         less_time_day = self.data.day_timestamp - cur_time
         if less_time_day < 0 then 
            self.day_time_label:setString("00:00:00")
         else
            self:setCountDownTime(self.day_time_label,less_time_day)
         end
    end 

  if self.data.week_status ==0 then 
        -- 未领取
        self.week_time_label:setString("00:00:00")
        self.week_time_label:setVisible(true)
        self.week_title_label:setPositionX(273)

   end 
   if self.data.week_status ==1 then 
         -- 已领取
         self.week_time_label:setVisible(false)
         self.week_title_label:setPositionX(self.container:getContentSize().width/2)

   end 
   if self.data.week_status ==2 then 
         -- 不可领取
         self.week_title_label:setPositionX(273)
         self.week_time_label:setVisible(true)
        local less_time_week = 0
        less_time_week = self.data.week_timestamp - cur_time
        if less_time_week < 0 then 
           self.week_time_label:setString("00:00:00")
        else
           self:setCountDownTime(self.week_time_label,less_time_week)
        end
   end 

    self:setAwardData(self.data.config.week_award,data.week_status,1)
    self:setAwardData(self.data.config.day_award,data.day_status,2)

end



function LeagueExploreReceiveItem:setAwardData( config,status,type )
	local award_config = config
	if award_config then
        if not  self.item_list  then 
            local data_list = award_config
            local setting = {}
            setting.scale = 0.6
            setting.max_count = 3
            setting.is_center = true
            if status == 0 then 
                setting.lock = false 
                setting.is_get_status = false  
            end 
            if status == 1 then 
                setting.lock = false 
                setting.is_get_status = true
            end 
            if status == 2 then 
                setting.lock = true 
                setting.is_get_status = false 
                setting.lock_pos=cc.p(59.5,59.5)
            end 
            if type == 1 then  -- 周
                self.item_list_week = commonShowSingleRowItemList(self.reward_contanier_week, self.item_list_week, data_list, setting)
            else
                self.item_list_day = commonShowSingleRowItemList(self.reward_contanier_day, self.item_list_day, data_list, setting)
            end 

        end
		
	end
end
--******** 设置倒计时
function LeagueExploreReceiveItem:setCountDownTime(node,less_time,is_over)
    if tolua.isnull(node) then return end
    doStopAllActions(node)
    if less_time > 0 then
        self:setTimeFormatString(node,less_time,is_over)
        node:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function()
            less_time = less_time - 1
            if less_time < 0 then
                doStopAllActions(node)
                if is_over then
                    node:setString(TI18N("活动已结束"))
                    node:setTextColor(color_text[1])
                else
                    node:setString("00:00:00")
                    node:setTextColor(color_text[2])
                end
            else
                self:setTimeFormatString(node,less_time,is_over)
            end
        end))))
    else
        self:setTimeFormatString(node,less_time,is_over)
    end
end
function LeagueExploreReceiveItem:setTimeFormatString(node,time,is_over)
    if time > 0 then
        node:setString(TimeTool.GetTimeForFunction(time))
    else
        doStopAllActions(node)
        if is_over then
            node:setString(TI18N("活动已结束"))
            node:setTextColor(color_text[1])
        else
            node:setString("00:00:00")
            node:setTextColor(color_text[2])
        end
    end
end
--*************************

function LeagueExploreReceiveItem:DeleteMe()
   
    self:removeAllChildren()
    self:removeFromParent()
end



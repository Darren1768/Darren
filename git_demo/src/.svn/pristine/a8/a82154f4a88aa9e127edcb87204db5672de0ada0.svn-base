-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      无尽试炼好友援助主界面
-- --------------------------------------------------------------------
LeagueExploreManagerWindow = LeagueExploreManagerWindow or BaseClass(BaseView)

local controller = LeagueExploreController:getInstance()
local model = LeagueExploreController:getInstance():getModel()
local string_format = string.format

function LeagueExploreManagerWindow:__init()
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Big

    
    self.layout_name = "league_explore/league_explore_manager_window"
    self.selected_tab = nil -- 当前选中的标签
    self.tab_list = {}
    self.panel_list = {}
end

function LeagueExploreManagerWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    if self.background ~= nil then
        self.background:setScale(display.getMaxScale())
    end

    self.root_csb = self.root_wnd:getChildByName("main_container")
    local main_panel= self.root_csb:getChildByName("main_panel")
    self.close_btn= main_panel:getChildByName("close_btn")

    self.confir_btn = main_panel:getChildByName("confir_btn")
    self.confir_btn.label = self.confir_btn:getTitleRenderer()
    self.confir_btn.label:setString("关闭")
    local win_title = main_panel:getChildByName("win_title")
    win_title:setString("探索资源")

    self.role= RoleController:getInstance():getRoleVo()

    self.name_label = main_panel:getChildByName("name_label")
    self.name_label:setString("联盟名称："..self.role.lname)
    if self.role.lname == "" then 
       self.name_label:setString("")
    end 
    self.scroll_container = main_panel:getChildByName("scroll_container")
    local size = self.scroll_container:getContentSize()
    local setting = {
        item_class = LeagueExploreManagerItem,
        start_x = 0 ,
        space_x = 0,
        start_y = 0,
        space_y = 4,
        item_width = 662,
        item_height = 140,
        row = 0,
        col = 1,
        need_dynamic = true
    }
    self.scroll_view = CommonScrollViewLayout.new(self.scroll_container, cc.p(0, 10), nil, nil, cc.size(size.width, size.height), setting)


  
end 

function LeagueExploreManagerWindow:register_event()
   
    if self.background then
        self.background:addTouchEventListener(
            function(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    playQuitSound()
                    controller:openLeagueExploreManagerWindow(false) 
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
                    controller:openLeagueExploreManagerWindow(false) 

                end
            end
        )
    end
    if self.confir_btn then
        self.confir_btn:addTouchEventListener(
            function(sender, event_type)
                customClickAction(sender,event_type)
                if event_type == ccui.TouchEventType.ended then
                    playQuitSound()
                    controller:openLeagueExploreManagerWindow(false) 
                end
            end
        )
    end
    -- 放弃资源点
    EventManager:getInstance():Bind(LeagueExploreEvent.Update_GiveUp_Success_Data,self,function()
        print("----------------give up manager -------------")
        self:setData()
    end)
end


function LeagueExploreManagerWindow:openRootWnd(type)
    self:setData()
end

function LeagueExploreManagerWindow:setData(data)
    local data ={}
    
    local _data  = model:getBaseData()

    for k,v in ipairs( _data.resources) do
        if v.league_id ~= 0 and v.league_id==self.role.lid then --我方占领的
            local vo = {}
            vo = deepCopy(v)
            vo.config =  Config.LeagueExploreData.data_resource_data[v.id]
            
            table.insert(data ,vo)
        end 
    end
    self.show_list=data
    if #self.show_list == 0   then
        commonShowEmptyIcon(self.scroll_view, true, {text = TI18N("本联盟没有任何领地\n占领，快去报名争夺吧，\n每日都有机会。")})
        self.confir_btn.label:setString("确定")
        self.scroll_view:setData(nil)
        return 
    end
       self.scroll_view:setData(data)
end



function LeagueExploreManagerWindow:close_callback()
    controller:openLeagueExploreManagerWindow(false)
    EventManager:getInstance():UnBind(self)
end

-- --------------------------------------------------------------------
-- @description:
--      循环赛排行榜单元
--
-- --------------------------------------------------------------------
LeagueExploreManagerItem = class("LeagueExploreManagerItem",function()
    return ccui.Layout:create()
end)

function LeagueExploreManagerItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("league_explore/league_explore_manager_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.bg_image = self.root_wnd:getChildByName("bg_image")
    self.container = self.root_wnd:getChildByName("container")
    self.time_label = self.container:getChildByName("time_label")
    self.produce_label = self.container:getChildByName("produce_label")
    self.land_label = self.container:getChildByName("land_label")
    self.btn_item = self.container:getChildByName("btn_item")

    self.land_name = self.container:getChildByName("land_name")

    self.select_sprite = self.container:getChildByName("select_sprite")

    self.had_land_label = self.container:getChildByName("had_land_label")

    -- self.btn_item:setVisible(false)
    self.select_sprite:setVisible(false)
    self.had_land_label:setVisible(false)
    self:registerEvent()
end

function LeagueExploreManagerItem:registerEvent()
    if self.btn_item then
        self.container:setTouchEnabled(true)
        self.btn_item:addTouchEventListener(
            function(sender, event_type)
                customClickAction(sender,event_type)
                if event_type == ccui.TouchEventType.ended then
                    playQuitSound()
                    self:set_leader()
                end
            end
        )
    end

  
end

function LeagueExploreManagerItem:set_leader()

		local str = string.format( TI18N("是否放弃该占领地，放弃后则不可获得该资源领取，日结算结算到今日，周结算结算到本周。"))
		CommonAlertYellow.show( str, TI18N("是"), function()
            controller:sender29302( self.data.id)
    	end, TI18N("否"))
	
end
function LeagueExploreManagerItem:addCallBack(call_back)
    self.call_back = call_back
end

function LeagueExploreManagerItem:setData(data)
    if data._index%2 == 0 then 
        self.bg_image:setVisible(false)
    else 
        self.bg_image:setVisible(true)
    end 

    self.data = data
    local _day_cofig =Config.ItemData.data_get_data(self.data.config.day_award[1][1])
    local _week_cofig =Config.ItemData.data_get_data(self.data.config.week_award[1][1])
    local _str_produce = "日产".._day_cofig.name.."*"..self.data.config.day_award[1][2].."、周产".._week_cofig.name.."*"..self.data.config.week_award[1][2]
    self.produce_label:setString("产出：".._str_produce)

    self.time_label:setString("已占领时间：".. TimeTool.getYMD2(self.data.occupy_time))
    -- self.goto_report_label:setString(string_format("<div href=xxx>%s</div>", TI18N("点击查看")))

    local _str =string_format("领地：%s[%s]",LeagueExploreConst.land_type[self.data.config.para_pos],LeagueExploreConst.Cross_Type[self.data.config.is_cross] )  
    self.land_label:setString(_str)

     local role_vo = RoleController:getInstance():getRoleVo()
     if  role_vo.league_position == UnionConst.post_type.leader or   role_vo.league_position == UnionConst.post_type.assistant then 
         self.btn_item:setVisible(true)
     end


     self.land_name:setString("资源名称："..self.data.config.resource_name)
end

function LeagueExploreManagerItem:DeleteMe()
   
    self:removeAllChildren()
    self:removeFromParent()
end



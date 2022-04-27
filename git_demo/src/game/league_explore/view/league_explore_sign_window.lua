-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      无尽试炼好友援助主界面
-- --------------------------------------------------------------------
LeagueExploreSignWindow = LeagueExploreSignWindow or BaseClass(BaseView)

local controller = LeagueExploreController:getInstance()
local model = LeagueExploreController:getInstance():getModel()
local string_format = string.format

function LeagueExploreSignWindow:__init()
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Big

    
    self.layout_name = "league_explore/league_explore_manager_window"
    self.selected_tab = nil -- 当前选中的标签
    self.tab_list = {}
    self.panel_list = {}
end

function LeagueExploreSignWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    if self.background ~= nil then
        self.background:setScale(display.getMaxScale())
    end

    self.root_csb = self.root_wnd:getChildByName("main_container")
    local main_panel= self.root_csb:getChildByName("main_panel")
    self.close_btn= main_panel:getChildByName("close_btn")

    self.confir_btn = main_panel:getChildByName("confir_btn")
    self.confir_btn.label = self.confir_btn:getTitleRenderer()
    self.confir_btn.label:setString("确定报名")

    self.name_label = main_panel:getChildByName("name_label")

    local win_title = main_panel:getChildByName("win_title")
    win_title:setString("报 名")
    self.scroll_container = main_panel:getChildByName("scroll_container")
    self.scroll_container:setContentSize(cc.size(664,275))

    self.show_label = createLabel(22,cc.c3b(98,53,43), nil,60,120,"是否报名该领地争夺战?", main_panel, nil, cc.p(0,0.5))
    self.show_label:setVisible(false)
    self.role= RoleController:getInstance():getRoleVo()

end 

function LeagueExploreSignWindow:register_event()
   
    if self.background then
        self.background:addTouchEventListener(
            function(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    playQuitSound()
                    controller:openLeagueExploreSignWindow(false) 
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
                    controller:openLeagueExploreSignWindow(false) 

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
                    if self.select_data then 
                        controller:sender29301(self.select_data.id)
                    else
                        message("请先选择一个资源点")
                    end 

                end
            end
        )
    end

    
     -- 报名成功
     self:addGlobalEvent(LeagueExploreEvent.Update_Apply_Success_Data, function (  )
        model:updateApplyDataByID(self.select_data.id)
        controller:openLeagueExploreSignWindow(false) 
        EventManager:getInstance():Fire(LeagueExploreEvent.Update_Main_Base_Data)
    end)

end


function LeagueExploreSignWindow:openRootWnd(type)

    self:setData()
end

function LeagueExploreSignWindow:setData()
    local data ={}
    self.name_label:setString("联盟名称："..self.role.lname)
    
    local _data  = model:getBaseData()
    for k,v in ipairs( _data.resources) do
        if v.is_open==1  then 

            if v.league_id ~= 0 then 
                -- 将自己占领的 排除
                if  self.role.lid ~= v.league_id then 
                    local vo = {}
                    vo = deepCopy(v)
                    vo.config =  Config.LeagueExploreData.data_resource_data[v.id]
                    
                    table.insert(data ,vo)
                end 
            else
                local vo = {}
                vo = deepCopy(v)
                vo.config =  Config.LeagueExploreData.data_resource_data[v.id]
                
                table.insert(data ,vo)
            end 
          
        end 
        if v.is_apply == 1 then 
            setChildUnEnabled(true,self.confir_btn)
            self.confir_btn:setTouchEnabled(false) 
        end 
    end
    self.show_list=data
   

     if not self.scroll_view then 
       local size = self.scroll_container:getContentSize()
       local setting = {
           start_x = 0,
           space_x = 0,
           start_y = 0,
           space_y = 4,
           item_width = 662,
           item_height = 120,
           row = 0,
           col = 1,
           need_dynamic = true
       }
       self.scroll_view = CommonScrollViewSingleLayout.new(self.scroll_container, cc.p(0, 10), ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(size.width, size.height), setting, cc.p(0, 0))
       self.scroll_view:registerScriptHandlerSingle(handler(self, self.createNewCell), ScrollViewFuncType.CreateNewCell) --创建cell
       self.scroll_view:registerScriptHandlerSingle(handler(self, self.numberOfCells), ScrollViewFuncType.NumberOfCells) --获取数量
       self.scroll_view:registerScriptHandlerSingle(handler(self, self.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex) --更新cell
       self.scroll_view:registerScriptHandlerSingle(handler(self, self.onCellTouched), ScrollViewFuncType.OnCellTouched) --更新cell
    end
    self.scroll_view:setSwallowTouches(false)
   
    -- 开放的都已经占领了
     if #self.show_list == 0   then
        commonShowEmptyIcon(self.scroll_view, true, {text = TI18N("没有可供报名的领地")})
        setChildUnEnabled(true,self.confir_btn)
        self.confir_btn:setTouchEnabled(false) 
        return 
     end
     self.scroll_view:reloadData()
end

--创建cell
--@width 是setting.item_width
--@height 是setting.item_height
function LeagueExploreSignWindow:createNewCell(width, height)
     local cell = LeagueExploreSignItem.new()
     cell:setCascadeOpacityEnabled(true)
     cell:addCallBack(function() self:onCellTouched(cell) end)
    return cell
end

--获取数据数量
function LeagueExploreSignWindow:numberOfCells()
    if not self.show_list then
        return 0
    end
    return #self.show_list
end

--更新cell(拖动的时候.刷新数据时候会执行次方法)
--cell :createNewCell的返回的对象
--index :数据的索引
function LeagueExploreSignWindow:updateCellByIndex(cell, index)
    cell.index = index
    local cell_data = self.show_list[index]
    if not cell_data then
        return
    end
    cell:setData(cell_data)

    if model:isSign() then 
        cell.canSelect= false
    end 

     if cell_data.is_apply == 1 then 
        self.select_cell =cell 
        self.select_type_id = cell_data.id 
     end 

end

-- --点击cell .需要在 createNewCell 设置点击事件
function LeagueExploreSignWindow:onCellTouched(cell, index)
    if not cell.index then
        return
    end
    if cell.canSelect == false then 
        message("已报名")
        return
    end 
    local cell_data = self.show_list[cell.index]
    if not cell_data then
        return
    end


    if self.select_cell then
        self.select_cell:setSelected(false)
    end
    self.show_label:setVisible(true)

    self.select_cell=cell 
    if self.select_type_id and self.select_type_id == cell_data.id  then
        --取消选中
        self.select_type_id = nil
        self.select_cell=nil 
        self.select_data= nil 
        self.show_label:setVisible(false)
        cell:setSelected(false)
    else
        self.select_type_id = cell_data.id 
        if self.select_cell  then
            self.select_cell:setSelected(true)
        end
        self.select_data= cell_data 
    end
end

function LeagueExploreSignWindow:close_callback()
    controller:openLeagueExploreSignWindow(false)
end


-- --------------------------------------------------------------------
-- @description:
--      循环赛排行榜单元
--
-- --------------------------------------------------------------------
LeagueExploreSignItem = class("LeagueExploreSignItem",function()
    return ccui.Layout:create()
end)

function LeagueExploreSignItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("league_explore/league_explore_sign_item"))
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
    self.btn_title = self.btn_item:getChildByName("title")
    self.btn_item:setVisible(false)

    self.select_sprite = self.container:getChildByName("select_sprite")
    self.had_land_label = self.container:getChildByName("had_land_label")
  
    self.select_sprite:setVisible(true)
    self.had_land_label:setVisible(false)

    self:registerEvents()

end

function LeagueExploreSignItem:registerEvents()
    registerButtonEventListener(self.select_sprite, function ( )
		if self.callback then
			self.callback(self, self.data)
		end
	end, true, false, nil, nil, 0, true)
    -- self.controller:setSwallowTouches(true)
    -- registerButtonEventListener(self.container, function ( )
	-- 	if self.callback then
	-- 		self.callback(self, self.data)
	-- 	end
	-- end, true, false, nil, nil, 0, true)
end

function LeagueExploreSignItem:setData(data)
    self.data = data 
    if self.index%2 == 0 then 
        self.bg_image:setVisible(false)
    else 
        self.bg_image:setVisible(true)
    end 
    printLuaTable(data)

    local _str =string_format("争夺领地：%s[%s]",self.data.config.resource_name,LeagueExploreConst.Cross_Type[self.data.config.is_cross] )  
    self.time_label:setString(_str)

    -- self.time_label:setString("争夺领地：".. self.data.config.resource_name)
 
    local _name = self.data.league_name 
    if _name=="" then 
        _name=  LeagueExploreConst.land_type[self.data.config.para_pos].."界"
    end 

    self.land_label:setString("防守方：".._name)


    local _day_cofig =Config.ItemData.data_get_data(self.data.config.day_award[1][1])
    local _week_cofig =Config.ItemData.data_get_data(self.data.config.week_award[1][1])
    local _str_produce = "日产".._day_cofig.name.."*"..self.data.config.day_award[1][2].."、周产".._week_cofig.name.."*"..self.data.config.week_award[1][2]
    self.produce_label:setString("产出：".._str_produce)

    local _res = PathTool.getResFrame("common2","hl_common_0006")
    if self.data.is_apply == 1 then 
        _res = PathTool.getResFrame("common2","hl_common_0005")
    end 
    self.select_sprite:loadTexture(_res, LOADTEXT_TYPE_PLIST)
end


function LeagueExploreSignItem:addCallBack( callback )
	self.callback=callback
end
function LeagueExploreSignItem:setSelected(status)

    local _res = PathTool.getResFrame("common2","hl_common_0006")
    if status == true then 
        _res = PathTool.getResFrame("common2","hl_common_0005")
    end 

     self.select_sprite:loadTexture(_res, LOADTEXT_TYPE_PLIST)

end

function LeagueExploreSignItem:DeleteMe()
   
    self:removeAllChildren()
    self:removeFromParent()
end



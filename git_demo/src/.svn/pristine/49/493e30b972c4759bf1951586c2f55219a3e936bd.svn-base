-- --------------------------------------------------------------------
-- @description:
--      历练ui
-- <br/> 2019年5月29日
--
-- --------------------------------------------------------------------

OrganizeGetTeamPanel = class("OrganizeGetTeamPanel",function()
    return ccui.Layout:create()
end)

local controller = OrganizeController:getInstance()
local model = controller:getModel()

local string_format = string.format
local table_insert = table.insert
local table_sort = table.sort

function OrganizeGetTeamPanel:ctor()

    self.exp_type_list = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4
    }
    self.combox_list = {
        [1] = {combox_type = 1, desc = TI18N("战力")},
        [2] = {combox_type = 2, desc = TI18N("进度")}
    }

    self.tab_list = {}
    self.select_sort =1

    self:configUI()
    self:registerEvent()
end

function OrganizeGetTeamPanel:configUI( )
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("organizeteam/organizeteam_getteam_panel"))
    self:addChild(self.root_wnd)
    self:setPosition(cc.p(-10,-62))

    self.container = self.root_wnd:getChildByName("container")
    self.scrollvie_container = self.container:getChildByName("scrollvie_container")
    -- self.role_vo = RoleController:getInstance():getRoleVo()
    
    self.tab_scrollview = self.container:getChildByName("tab_scrollview")
    self.tab_scrollview:setScrollBarEnabled(false)

    self.select_btn = self.tab_scrollview:getChildByName("select_btn")
    self.select_sprite =  self.select_btn:getChildByName("Sprite_1")
    self.select_btn:setPosition(440,10)

    for i=1 ,4 do 
        local tab_btn={}
        local _tab = self.tab_scrollview:getChildByName("tab_btn_"..i)
        _tab:setPosition(cc.p( 80 + 170 * (i-1) ,58))
        tab_btn.btn = _tab
        self.tab_list[i]=tab_btn 
        tab_btn.label = _tab:getChildByName("label")
        tab_btn.normal_img = _tab:getChildByName("normal_img")
        tab_btn.select_img = _tab:getChildByName("select_img")
        tab_btn.label:setTextColor(cc.c3b(168,150,121))
        tab_btn.index=i 
        if i==4 then 
            _tab:setVisible(false)
        end
    end

    self.refresh = self.container:getChildByName("refresh")

  
end

function OrganizeGetTeamPanel:registerEvent()
    for index, tab_btn in ipairs(self.tab_list) do
        registerButtonEventListener(tab_btn.btn, function() self:changeTabType(tab_btn.index ) end ,false, 1) 
    end

    self.refresh:addTouchEventListener(function(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            self:requestList(self.select_tab_index)
        end
    end)

   
    self.select_btn:addTouchEventListener(function(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            self.is_open_select = true 
            -- if  self.is_open_select
            local _x, _y = self.select_btn:getPosition() 
            controller:openOrganizeTeamSelectPanel("",cc.p(_x,_y),nil ,nil ,  self.select_sort,"get")
        end
    end)
    --- 刷新数据
    EventManager:getInstance():Bind(OrganizeEvent.Update_GetTeam_Data_List,self,function(data)
        self.data_list  = model:getgetListData() 
        if data.tab == 2 then 
            self.select_sort = data.sort or 1 
            self:updateTab()
         end
        self:updateList(true)
    end)

    EventManager:getInstance():Bind(OrganizeEvent.Update_Get_Team_Success,self,function(data)
        -- self.data_list  = model:getgetListData() 
        -- self:updateList(true)

        local _id = model:getgetListDataIndex(data)
        self.list_view:resetItemByIndex(_id)
    end)
end

-- @_type 参考 RoleConst.Tab_type 定义
--@check_repeat_click 是否检查重复点击
function OrganizeGetTeamPanel:changeTabType(index)
  
    if self.select_tab_index and self.select_tab_index == index then return end
    self.select_tab_index=index

    if self.select_tab_btn then 
        self.select_tab_btn.label:setTextColor(cc.c3b(168,150,121))
        self.select_tab_btn.normal_img:setVisible(true ) 
        self.select_tab_btn.select_img:setVisible(false) 

    end 
    self.select_tab_btn = self.tab_list[index]
    self.select_tab_btn.label:setTextColor(cc.c3b(250,232,150))
    self.select_tab_btn.normal_img:setVisible(false ) 
    self.select_tab_btn.select_img:setVisible(true) 

     self:requestList(index)
    
   
end
function OrganizeGetTeamPanel:updateTab()
    if  self.select_sort ==0 or self.select_sort ==1 then
        self.tab_list[3].label:setString("战力")
    else
        self.tab_list[3].label:setString("进度")
    end 

end 


--创建历练列表 
-- @ is_keep_pos --是否保存当前位置刷新
function OrganizeGetTeamPanel:updateList(is_keep_pos)
    if not self.select_tab_index then return end
    if not self.list_view then
        local scroll_view_size = cc.size(560,788)
        local setting = {
            -- item_class = HeroExhibitionItem,      -- 单元类
            start_x = 2,                  -- 第一个单元的X起点
            space_x = 0,                    -- x方向的间隔
            start_y = 0,                    -- 第一个单元的Y起点
            space_y = 4,                   -- y方向的间隔
            item_width = 556,               -- 单元的尺寸width
            item_height = 233,              -- 单元的尺寸height
            delay = 1,
            -- row = 1,                        -- 行数，作用于水平滚动类型
            col = 1,                         -- 列数，作用于垂直滚动类型
            need_dynamic = true
        }
        local size = self.scrollvie_container:getContentSize()
        self.list_view = CommonScrollViewSingleLayout.new(self.scrollvie_container, cc.p(size.width * 0.5, size.height * 0.5) , ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting, cc.p(0.5,0.5))

        self.list_view:registerScriptHandlerSingle(handler(self,self.createNewCell), ScrollViewFuncType.CreateNewCell) --创建cell
        self.list_view:registerScriptHandlerSingle(handler(self,self.numberOfCells), ScrollViewFuncType.NumberOfCells) --获取数量
        self.list_view:registerScriptHandlerSingle(handler(self,self.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex) --更新cell
        -- self.list_view:registerScriptHandlerSingle(handler(self,self.onCellTouched), ScrollViewFuncType.OnCellTouched) --更新cell
    end


    -- local sort_func = SortTools.tableCommonSorter({{"sort", false}, {"id", false}})
    -- table_sort(self.show_list, sort_func)
    -- self.list_view:reloadData(nil, nil, is_keep_pos)
    
    self.show_list= self.data_list 
    self.list_view:reloadData()


    if #self.show_list == 0 then
        commonShowEmptyIcon(self.scrollvie_container, true)
    else
        commonShowEmptyIcon(self.scrollvie_container, false)
    end
end

--创建cell 
--@width 是setting.item_width
--@height 是setting.item_height
function OrganizeGetTeamPanel:createNewCell(width, height)
    local cell = OrganizeTeamGetTeamItem.new(width, height)
    -- cell:addCallBack(function() self:onCellTouched(cell) end)
    return cell
end
--获取数据数量
function OrganizeGetTeamPanel:numberOfCells()
    return #self.show_list
end

--更新cell(拖动的时候.刷新数据时候会执行次方法)
--cell :createNewCell的返回的对象
--inde :数据的索引
function OrganizeGetTeamPanel:updateCellByIndex(cell, index)
    cell.index = index
    local data = self.show_list[index]
    if data then
        cell:setData(data)
    end
end

-- --点击cell .需要在 createNewCell 设置点击事件
-- function OrganizeGetTeamPanel:onCellTouched(cell)
--     local index = cell.index
--     local data = self.show_list[index]
--     if data then
--     end
-- end

function OrganizeGetTeamPanel:addToParent(status,index)
  
    self:setVisible(status)
    local index = index or 1 
    self.show_list={}
    self:changeTabType(index, true)

   
end


function OrganizeGetTeamPanel:requestList(index,name)

    local protocal = {}
    -- Guild_Team = 1,  -- 公会
    -- Friend_Team = 2,  -- 好友
    -- ShaiX_Team  = 3, --筛选
    -- Near_Team  = 4, --附近
    if OrganizeConst.Btn_Index.Guild_Team == index then
        protocal.tab = index-1
    elseif OrganizeConst.Btn_Index.Friend_Team == index then 
        protocal.tab = index-1
    elseif OrganizeConst.Btn_Index.ShaiX_Team == index then 
        protocal.tab = index-1
    elseif OrganizeConst.Btn_Index.Near_Team == index then 
        protocal.tab = index-1
    end 
    protocal.page = 1
    protocal.sort = 0 

    if index == 3 then 
        protocal.sort = 1
    end 
    protocal.flag = 0 
    protocal.name = name or ""
    controller:sender29610(protocal)

end 



function OrganizeGetTeamPanel:DeleteMe()
    if self.list_view then
        self.list_view:DeleteMe()
        self.list_view = nil
    end

    EventManager:getInstance():UnBind(self)
end

-- 子项
OrganizeTeamGetTeamItem = class("OrganizeTeamGetTeamItem", function()
    return ccui.Widget:create()
end)

function OrganizeTeamGetTeamItem:ctor(width, height)
    self:configUI(width, height)
    self:register_event()
end

function OrganizeTeamGetTeamItem:configUI(width, height)
    self.size = cc.size(width,height)
    self:setTouchEnabled(true)
    self:setContentSize(self.size)

    local csbPath = PathTool.getTargetCSB("organizeteam/organizeteam_getteam_item")
    self.root_wnd = createCSBNote(csbPath)
    self.root_wnd:setAnchorPoint(cc.p(0.5, 0.5))
    self.root_wnd:setPosition(width * 0.5, height * 0.5)
    self:addChild(self.root_wnd)
    self.root_wnd:setContentSize(width,height)
    -- self.bg = self.root_wnd:getChildByName("bg") 
    -- self.bg:setContentSize(width,height)

    local main_container = self.root_wnd:getChildByName("container")
    self.main_container = main_container

  
    self.role_name =main_container:getChildByName("role_name")

    self.guild_name = main_container:getChildByName("guild_name")
    self.grage_name = main_container:getChildByName("grage_name")
    self.day_label = main_container:getChildByName("day_label")

    self.power_label= CommonNum.new(101, main_container, 99999, -1, cc.p(0, 0.5))
    self.power_label:setPosition(175, 150)

    self.stage_label = main_container:getChildByName("stage_label")
    --招募按钮
    self.apply_btn = main_container:getChildByName("Button_2")

    -- 时间
    self.Image_1 = main_container:getChildByName("Image_1")
    self.time =  self.Image_1:getChildByName("time")

    local head_node = main_container:getChildByName("head_node")
    self.my_head = PlayerHead.new(PlayerHead.type.circle)
    -- self.my_head:setHeadLayerScale(0.8)
    self.my_head:setPosition(0, 0)
    head_node:addChild(self.my_head)

end

function OrganizeTeamGetTeamItem:register_event( )
    registerButtonEventListener(self.apply_btn, function(param, sender, event_type) self:onClickComfirmBtn(sender) end,true, 1)
end

--领取
function OrganizeTeamGetTeamItem:onClickComfirmBtn()
     if not self.data then return end
     controller:sender29611(self.data.rid,self.data.srv_id)
end


function OrganizeTeamGetTeamItem:addCallBack(callback)
    self.callback = callback
end

function OrganizeTeamGetTeamItem:setData(data)
    if not data then 
        return
    end 
    self.data = data

    self.my_head:setHeadRes(data.face, false, LOADTEXT_TYPE, data.face_file, data.face_update_time)
    self.my_head:setLev(data.lev)
    self.my_head:setVIP(data.vip_lev)

    self.power_label:setNum(data.power)

    self.role_name:setString(data.name)
    self.guild_name:setString("公会："..data.guild_name)
    self.grage_name:setString("段位："..data.arena_elite_lev)

    if data.online ==1 then 
        self.time:setString("在线")
    else
        self.time:setString("离线")
    end 

   
    local _dun_id = data.max_dun_id
    if _dun_id== 0 then 
        _dun_id =10010 
    end 
    local _stage  =  Config.DungeonData.data_drama_dungeon_info(_dun_id)
    if _stage then 

       self.stage_label:setString(_stage.name)
    end 
    -- max_dun_id

    if data.is_invite ==1 then 
        self.apply_btn:setTouchEnabled(false)
        setChildUnEnabled(true, self.apply_btn)

    else 
        self.apply_btn:setTouchEnabled(true)
        setChildUnEnabled(false, self.apply_btn)

    end 

end


function OrganizeTeamGetTeamItem:DeleteMe()
    self:removeAllChildren()
    self:removeFromParent()
end



-- --------------------------------------------------------------------
-- @description:
--      英雄(伙伴)背包 策划 陈星宇
--
-- --------------------------------------------------------------------
HeroBagWindow = HeroBagWindow or BaseClass(BaseView)

local controller = HeroController:getInstance()
local model = controller:getModel()
local string_format = string.format
local table_sort = table.sort
local table_insert = table.insert

function HeroBagWindow:__init()

    self.win_type = WinType.Full_SHOW_BOTTOM
    self.layout_name = "hero/hero_bag_window"
    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("herobag","herobag"), type = ResourcesType.plist },
        { path = PathTool.getPlistImgForDownLoad("hero","hero"), type = ResourcesType.plist },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_34", false), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_35", false), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg/hero","hero_bag_bg", true), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg/hero","hero_bag_bg_1", false), type = ResourcesType.single },
    }

    --背包列表 结构
    --图鉴列表
    self.hero_bag_list = {}
    --拥有英雄列表
    self.dic_pokedex_info = {}
    --阵营
    self.select_camp = 0

    --是否要重置 切换页签用
    self.is_must_reset = true

    --按钮位置列表
    self.btn_pos_list = {}


    --创建的分叉红点节点列表
    self.redLine = {}
    self.redLine2 = {}
end

function HeroBagWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    --self.background:loadTexture(PathTool.getSingleImgForDownLoad("bigbg/hero", "hero_bag_bg", true), LOADTEXT_TYPE)
    self.background:setScale(display.getMaxScale())

    self.mainContainer = self.root_wnd:getChildByName("main_container")
    self:playEnterAnimatianByObj(self.mainContainer , 1)  

    self.container = self.mainContainer:getChildByName("container")
    self.box_1 = self.mainContainer:getChildByName("box_1")
    --self.box_1:loadTexture(PathTool.getSingleImgForDownLoad("bigbg/hero", "hero_bag_bg_1", false), LOADTEXT_TYPE)

    self.lay_scrollview = self.container:getChildByName("lay_scrollview")

    self.lingxiu_btn = self.mainContainer:getChildByName("lingxiu_btn")
    self.zhuanji_btn = self.mainContainer:getChildByName("zhuanji_btn")
    self.pinglun_btn = self.mainContainer:getChildByName("pinglun_btn")
    local name_box = self.mainContainer:getChildByName("name_box")
    self.name = name_box:getChildByName("name")
    self.quality = name_box:getChildByName("quality")
    self.name_box = name_box
    self.name_box:setVisible(false)
    self.lock_btn = name_box:getChildByName("lock")

    local camp_node = self.container:getChildByName("camp_node")
    self.camp_node = camp_node
    self.camp_btn_list = {}
    self.camp_redpoint_list = {}
    self.camp_btn_list[0] = camp_node:getChildByName("camp_btn0")

    self.camp_btn_list[1] = camp_node:getChildByName("camp_btn1")
    self.camp_btn_list[2]  = camp_node:getChildByName("camp_btn2")
    self.camp_btn_list[3]  = camp_node:getChildByName("camp_btn3")
    self.camp_btn_list[4] = camp_node:getChildByName("camp_btn4")
    self.camp_btn_list[5]  = camp_node:getChildByName("camp_btn5")

    self.img_select = camp_node:getChildByName("img_select")
    local x, y = self.camp_btn_list[0]:getPosition()
    self.img_select:setPosition(x , y )

    self.camp_btn_size = self.camp_btn_list[1]:getContentSize()

    self.item_buy_panel = self.container:getChildByName("item_buy_panel")
    --英雄数量
    self.hero_label = self.item_buy_panel:getChildByName("label")
    self.add_btn = self.item_buy_panel:getChildByName("add_btn")

    self.library_btn = self.container:getChildByName("library_btn")
    local library_btn_label = self.library_btn:getChildByName("label")
    if library_btn_label then
        library_btn_label:setString(TI18N("图书馆"))
    end

    self.spine_node = self.mainContainer:getChildByName("spine")
    self.hero_draw_icon = self.mainContainer:getChildByName("hero_draw_icon")
    
    MainuiController:getInstance():setIsShowMainUIBottom(true)
end

--self.box_1:loadTexture(PathTool.getSingleImgForDownLoad("bigbg/hero", "hero_bag_bg_1", false), LOADTEXT_TYPE)

function HeroBagWindow:update_box()
    if self.box_1:getContentSize().height < 400 then
        self.box_1:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_35", false), LOADTEXT_TYPE)
        self.box_1:setContentSize(cc.size(720,575))
        self.list_view:refreshSize(cc.size(680,474))
    else
        self.box_1:loadTexture(PathTool.getResFrame("hero", "hl_hero_18"), LOADTEXT_TYPE_PLIST)
        self.box_1:setContentSize(cc.size(720,277))
        self.list_view:refreshSize(cc.size(680,179))
    end
    self.is_must_reset = true
    self:updateHeroList(self.select_camp)
end

function HeroBagWindow:register_event()

    registerButtonEventListener(self.lock_btn, handler(self, self.onClickLockBtn))
    registerButtonEventListener(self.background, handler(self, self.update_box))

    registerButtonEventListener(self.lingxiu_btn, handler(self, self.onClickInfoBtn) ,true, 2)
    registerButtonEventListener(self.zhuanji_btn, handler(self, self.onClickStoryBtn) ,true, 2)
    registerButtonEventListener(self.pinglun_btn, handler(self, self.onClickCommentBtn) ,true, 2)

    --阵营按钮
 
    for select_camp, v in pairs(self.camp_btn_list) do
        registerButtonEventListener(v, function() self:_onClickBtnShowByIndex(select_camp) end ,true, 2)
    end

    registerButtonEventListener(self.add_btn, handler(self, self.onClickAddBtn) ,true, 2)

    registerButtonEventListener(self.library_btn, handler(self, self.onClickLibraryBtn) ,true, 2)

    --英雄信息更新
    self:addGlobalEvent(HeroEvent.Hero_Data_Update, function(hero_vo)
        self:selectHero(1, hero_vo)
    end)
    self:addGlobalEvent(HeroEvent.All_Hero_Detail_Info_Event, function(hero_vo)
            --检测一下红点
            --装备信息回来了..检查多一次吧
            HeroCalculate.checkAllHeroRedPoint()
        end)

    --更新英雄上限事件
    self:addGlobalEvent(HeroEvent.Buy_Hero_Max_Count_Event, function() self:updateHeroMaxInfo() end)

  
    --新增英雄
    self:addGlobalEvent(HeroEvent.Hero_Data_Add, function()
            self.hero_bag_list = model:getAllHeroArray()
            self.is_must_reset = true
            self:updateHeroList(self.select_camp)
            self.is_must_reset = false
            self:updateHeroMaxInfo()
        end)

    --删除英雄
    self:addGlobalEvent(HeroEvent.Del_Hero_Event, function()
            self.hero_bag_list = model:getAllHeroArray()
            self.is_must_reset = true
            self:updateHeroList(self.select_camp)
            self.is_must_reset = false
            self:updateHeroMaxInfo()
        end)

    --英雄红点更新
    self:addGlobalEvent(HeroEvent.All_Hero_RedPoint_Event, function(status_data)
            self:updateHeroBagRedpoint(status_data)
            --需要刷新一下全部英雄

        end)

    --所有英雄基本信息事件
    self:addGlobalEvent(HeroEvent.All_Hero_Base_Info_Event, function(status_data)
            self.hero_bag_list = model:getAllHeroArray()
            self.is_must_reset = true
            self:updateHeroList(self.select_camp)
            self.is_must_reset = false
            self:updateHeroMaxInfo()
        end)



    --道具增加
    self:addGlobalEvent(BackpackEvent.ADD_GOODS, function(bag_code,temp_add)
            if not self.list_view then return end
            if bag_code ~= BackPackConst.Bag_Code.EQUIPS then 
                for i,item in pairs(temp_add) do
                    if item.base_id == model.upgrade_star_cost_id or item.base_id == model.upgrade_star_cost_id_2 then
                        self.list_view:resetCurrentItems()
                    end
                end
            end
        end)
    --物品道具删除 判断红点
    self:addGlobalEvent(BackpackEvent.DELETE_GOODS, function(bag_code,temp_add)
            if not self.list_view then return end
            if bag_code ~= BackPackConst.Bag_Code.EQUIPS then 
                for i,item in pairs(temp_add) do
                    if item.base_id == model.upgrade_star_cost_id or item.base_id == model.upgrade_star_cost_id_2 then
                        self.list_view:resetCurrentItems()
                    end
                end
            end
        end)
    --物品道具删除 判断红点
    self:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM, function(bag_code,temp_add)
            if not self.list_view then return end
            if bag_code ~= BackPackConst.Bag_Code.EQUIPS then 
                for i,item in pairs(temp_add) do
                    if item.base_id == model.upgrade_star_cost_id or item.base_id == model.upgrade_star_cost_id_2 then
                        self.list_view:resetCurrentItems()
                    end
                end
            end
        end)

    --引导前给需要特殊处理界面抛事件
    self:addGlobalEvent(GuideEvent.Update_Guide_Open_Event, function()
            if  self.select_camp == 0 and self.list_view then
                self.list_view:resetCurrentItems()
            end
        end)

    -- 角色等级变化
    if not self.role_assets_event then
        if self.role_vo == nil then
            self.role_vo = RoleController:getInstance():getRoleVo()
        end
        if self.role_vo then
            self.role_assets_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value)
                    if key == "lev" then
                        self:setLibraryBtnStatus()
                    end
                end)
        end
    end

    --英雄解锁事件
    self:addGlobalEvent(HeroEvent.Hero_Lock_Event, function()
            if not self.select_hero_vo then return end
            self:setLock()
        end)
end

function HeroBagWindow:setLock()
    local res 
    if self.select_hero_vo.dic_locks[HeroConst.LockType.eHeroLock] and 
    self.select_hero_vo.dic_locks[HeroConst.LockType.eHeroLock] == 1 then
        res = PathTool.getResFrame("common","hl_common_504")
    else
        res = PathTool.getResFrame("common","hl_common_504_1")
    end
    if self.lock_record_res == nil or self.lock_record_res ~= res then
        self.lock_record_res = res
        self.lock_btn:loadTexture(res, LOADTEXT_TYPE_PLIST)
    end
end

--锁定
function HeroBagWindow:onClickLockBtn()
    if not self.select_hero_vo then return end

    local is_lock = self.select_hero_vo.dic_locks[HeroConst.LockType.eHeroLock] or 0
    if is_lock == 1 then
        is_lock = 0
    else
        is_lock = 1
    end
    controller:sender11015(self.select_hero_vo.partner_id, is_lock)
end

--灵修
function HeroBagWindow:onClickInfoBtn()
    if not self.select_hero_vo then return end
    HeroController:getInstance():openHeroMainInfoWindow(true, self.select_hero_vo, self.show_list)
    MainuiController:getInstance():setIsShowMainUIBottom(false) -- 隐藏底部UI
end

--查看传记
function HeroBagWindow:onClickStoryBtn()
    if not self.select_hero_vo then return end
    local bid = self.select_hero_vo.bid
    local partner_config = Config.PartnerData.data_partner_base[bid]
    local library_config = Config.PartnerData.data_partner_library(bid)
    if not partner_config or not library_config then return end
    if library_config.story == nil or library_config.story == "" then
        message(TI18N("该英雄暂无传记"))
        return 
    end
    local name = string_format("%s %s",library_config.title, partner_config.name)
    local content = library_config.story
    controller:openHeroLibraryStoryPanel(true, name, content)


end

--评论
function HeroBagWindow:onClickCommentBtn()
    if not self.select_hero_vo then return end
    PokedexController:getInstance():openCommentWindow(true, self.select_hero_vo)
end


function HeroBagWindow:setLibraryBtnStatus(lev)
    local role_vo = RoleController:getInstance():getRoleVo()
    if not role_vo then return end
    local level_cfg = Config.PartnerData.data_partner_const.library_level
    if level_cfg then
        if level_cfg.val > role_vo.lev then
            setChildUnEnabled(true, self.library_btn)
        else
            setChildUnEnabled(false, self.library_btn)    
        end
    else
        setChildUnEnabled(false, self.library_btn)
    end
end

function HeroBagWindow:_onClickBtnClose()
    controller:openHeroBagWindow(false)
end

-- 打开布阵界面
function HeroBagWindow:_onClickBtnEmbattle()
    -- message("此不通,可在推图挑战BOSS进行布阵")
    controller:openFormMainWindow(true)
end
--显示根据类型 0表示全部
function HeroBagWindow:_onClickBtnShowByIndex(index)
  
    if self.img_select and self.camp_btn_list[index] then
        local x, y = self.camp_btn_list[index]:getPosition()
        self.img_select:setPosition(x , y )
    end
    local camp= index 
    if index ==2 then 
        camp=3 
    end 
    if index ==3 then 
        camp=2
    end 
    if index ==5 then 
        camp=4 
    end 
    if index ==4 then 
        camp=5
    end 

    self:updateHeroList(camp)
end

--加英雄数量
function HeroBagWindow:onClickAddBtn()
    local buy_num = model:getHeroBuyNum()
    local config = Config.PartnerData.data_partner_buy[buy_num + 1]
    if config then 
        local item_id = config.expend[1][1] or 3
        local count = config.expend[1][2] or 100
        local iconsrc = PathTool.getItemRes(Config.ItemData.data_get_data(item_id).icon)
        local str = string_format(TI18N("是否花费<img src='%s' scale=0.3 />%s扩充%s个英雄位置数量上限？"), iconsrc, count, config.add_num)
        local call_back = function()
            controller:sender11009()
        end
        CommonAlert.show(str, TI18N("确定"), call_back, TI18N("取消"), nil, CommonAlert.type.rich)
    else
        message(TI18N("购买次数已达上限"))
    end
end

function HeroBagWindow:onClickLibraryBtn()
    local role_vo = RoleController:getInstance():getRoleVo()
    if not role_vo then return end
    local level_cfg = Config.PartnerData.data_partner_const.library_level
    if level_cfg and level_cfg.val > role_vo.lev then
        message(level_cfg.desc)
        return
    end
    HeroController:getInstance():openHeroLibraryMainWindow(true)
end



-- @index  1 表示英雄  2 表示 图鉴  3表示圣物
function HeroBagWindow:changeTabIndex(index)





    if self.library_btn then
        self.library_btn:setVisible(false)
    end

    self.lay_scrollview:setVisible(true)
    self:setCampBtnPos(1)
    self.select_camp = 0
    self.item_buy_panel:setVisible(true)
    self:updateHeroMaxInfo()
    self.library_btn:setVisible(true)


    self.camp_node:setVisible(index ~= HeroConst.BagTab.eElfin)


    self.is_must_reset = true
    self:_onClickBtnShowByIndex(self.select_camp)
    self.is_must_reset = false
end

function HeroBagWindow:_onChangeSelectCamp( index )
    if self.img_select and self.camp_btn_list[index] then
        local x, y = self.camp_btn_list[index]:getPosition()
        self.img_select:setPosition(x , y )
    end
end

--更新tab红点
function HeroBagWindow:updateHeroBagRedpoint(status_data)
    if self.redpoint_status == nil then
        self.redpoint_status = {}
    end
    for i,data in ipairs(status_data) do
        self.redpoint_status[data.bid] = data.status
    end
    local is_redpoint = false
    for k, status in pairs(self.redpoint_status) do
        if status == true then
            is_redpoint = true 
            break
        end
    end

    --刷新一下当前红点
    if self.list_view then
        self.list_view:resetCurrentItems()
    end
end

function HeroBagWindow:setRedPointcamp(camp, is_visible)
    if is_visible then
        if self.camp_redpoint_list[camp] == nil then
            local camp_btn = self.camp_btn_list[camp]
            local x, y = camp_btn:getPosition()
            red_res = PathTool.getResFrame("mainui","mainui_1009")
            self.camp_redpoint_list[camp] = createSprite(red_res,0,0,self.camp_node,cc.p(1,1),LOADTEXT_TYPE_PLIST)
            self.camp_redpoint_list[camp]:setPosition(x + self.camp_btn_size.width*0.5, y+self.camp_btn_size.height*0.5)
        end
        self.camp_redpoint_list[camp]:setVisible(is_visible)
    else
        if self.camp_redpoint_list[camp] then
            self.camp_redpoint_list[camp]:setVisible(false)
        end
    end
end


function HeroBagWindow:openRootWnd(index, sub_type)
    local index = HeroConst.BagTab.eBagHero
    self.sub_type = sub_type
    if index == HeroConst.BagTab.eHalidom then -- 圣物需要判断是否已经开启，没开启则默认选中英雄分页
        local open_cfg = Config.HalidomData.data_const["halidom_open_lev"]
        local role_vo = RoleController:getInstance():getRoleVo()
        if not open_cfg or not role_vo or open_cfg.val > role_vo.lev then
            index = HeroConst.BagTab.eBagHero
        end
    elseif index == HeroConst.BagTab.eElfin then
        if not ElfinController:getInstance():getModel():checkElfinIsOpen(true) then
            index = HeroConst.BagTab.eBagHero
        end
    end
    --已拥有信息信息
    self.dic_had_hero_info = HeroController:getInstance():getModel():getHadHeroInfo()
    self:initHeroBagList()
    self:changeTabIndex(index)

    --检测一下红点
    HeroCalculate.checkAllHeroRedPoint()

    self:setLibraryBtnStatus()
end

--初始化背包伙伴列表 
function HeroBagWindow:initHeroBagList()
    --英雄列表
    self.hero_bag_list = model:getAllHeroArray()
    --图书馆列表
    self.dic_pokedex_info = model:getHeroPokedexList()
end

function HeroBagWindow:updateHeroMaxInfo()
    if self.hero_label then
        local max, count = model:getHeroMaxCount()
        self.hero_label:setString(string_format("%s/%s", count, max))
    end
end

--设置种族按钮位置 根据按钮数量来设定位置
--@ btn_Type 按钮类型 1 有全部按钮类型  2 无全部按钮类型
function HeroBagWindow:setCampBtnPos(btn_Type)
    if self.btn_pos_list[btn_Type] == nil then
        self.btn_pos_list[btn_Type] = {}

        local offset = 20
        local width = 58 -- 按钮大小
        local count = 5
        if btn_Type == 1  then
            count = 6
        end

        local x = - (width * count + offset *(count -1)) * 0.5 + width * 0.5
        for i=1,count do
            self.btn_pos_list[btn_Type][i] = x + (i-1) * (width + offset)
        end
    end
    if btn_Type == 1  then
        self.camp_btn_list[0]:setVisible(true)
        for i=0, 5 do
            local x = self.btn_pos_list[btn_Type][i+1] or 0
            self.camp_btn_list[i]:setPositionX(x)
        end
    else
        self.camp_btn_list[0]:setVisible(false)
        for i=1, 5 do
            local x = self.btn_pos_list[btn_Type][i] or 0
            self.camp_btn_list[i]:setPositionX(x)
        end
    end
end

--创建容器里面卡牌头上的分叉红线
function HeroBagWindow:createRedLine()
    local length = #self.redLine
    if length>0 then
        for i=1,length do
            self.redLine[i]:setVisible(false)
        end
    end
    for i=1,#self.show_list do
        local node = self.redLine[i]
        if not node then
            -- 分叉红线
            local res_2 = PathTool.getResFrame("hero","hl_hero_19_1")
            local line_sprite = createSprite(res_2,0,0,self.list_view.container,cc.p(0,1),LOADTEXT_TYPE_PLIST,99)
            self.redLine[i] = line_sprite
            line_sprite:setVisible(true)
        else
            node:setVisible(true)
        end  
    end
    -- 长的红线
    self:createLine2()
end

-- 长的红线
function HeroBagWindow:createLine2()
    for i,v in pairs(self.redLine2)do
        v:setVisible(false)
    end

    local disHeight = 190
    local x,y = 3,self.list_view.container:getContentSize().height + disHeight
  
    for i=1,#self.show_list do
        
        if i%6 == 1 then
            local node = self.redLine2[i]
            y = y-disHeight
            if not node then
                local res = PathTool.getResFrame("hero","hl_hero_19")
                local line2_spite = createSprite(res,0,0,self.list_view.container,cc.p(0,1),LOADTEXT_TYPE_PLIST,100)
                self.redLine2[i] = line2_spite
                line2_spite:setVisible(true)
                line2_spite:setPosition(cc.p(x,y))
            else
                node:setVisible(true)
                node:setPosition(cc.p(x,y))
            end    
        end
    end
end
--创建英雄列表 
-- @select_camp 选中阵营
function HeroBagWindow:updateHeroList(select_camp)
    local select_camp = select_camp or 1
    if not self.is_must_reset and select_camp == self.select_camp then 
        return
    end
    

    if not self.list_view then

        local scroll_view_size = cc.size(680,474)
        local setting = {
            -- item_class = HeroExhibitionItem,      -- 单元类
            start_x = 8,                  -- 第一个单元的X起点
            space_x = 6,                    -- x方向的间隔
            start_y = 30,                    -- 第一个单元的Y起点
            space_y = 60,                   -- y方向的间隔
            item_width = 105,               -- 单元的尺寸width
            item_height = 130,              -- 单元的尺寸height
            delay = 1,
            -- row = 1,                        -- 行数，作用于水平滚动类型
            col = 6,                         -- 列数，作用于垂直滚动类型
            need_dynamic = true,
            delta_y_list = {7,0,-3,-3,0,7}
        }
        local size = self.lay_scrollview:getContentSize()
        self.list_view = CommonScrollViewSingleLayout.new(self.lay_scrollview, cc.p(-2, 0) , ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting, cc.p(0,0))

        self.list_view:registerScriptHandlerSingle(handler(self,self.createNewCell), ScrollViewFuncType.CreateNewCell) --创建cell
        self.list_view:registerScriptHandlerSingle(handler(self,self.numberOfCells), ScrollViewFuncType.NumberOfCells) --获取数量
        self.list_view:registerScriptHandlerSingle(handler(self,self.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex) --更新cell
        -- self.list_view:registerScriptHandlerSingle(handler(self,self.onCellTouched), ScrollViewFuncType.OnCellTouched) --更新cell
        
        self.list_view:refreshSize(cc.size(680,179))
    end

    self.select_camp = select_camp
    local size = 0

    --英雄列表 (默认)
    local hero_array = self.hero_bag_list or Array.New()
    local form_list = {}
    local list = {}
    for j=1,hero_array:GetSize() do
        local hero_vo = hero_array:Get(j-1)
        if select_camp == 0 or (select_camp == hero_vo.camp_type) then
            if hero_vo.isFormDrama and hero_vo:isFormDrama() then
                table_insert(form_list, hero_vo)
            else
                table_insert(list, hero_vo)
            end
            -- vo:PushBack(hero_vo)
        end
    end
    size = #list + #form_list
    if size > 0 then
        -- vo:UpperSortByParams("star", "power", "lev", "sort_order")
        -- local sort_func1 = SortTools.tableCommonSorter({{"star", true}, {"power", true}, {"lev", true}, {"sort_order", true}})
        local sort_func = SortTools.tableCommonSorter({{"star", true}, {"power", true}, {"lev", true}, {"sort_order", true}})
        table_sort(form_list, sort_func)
        table_sort(list, sort_func)
        local count = #form_list
        for i=count, 1, -1 do
            table_insert(list, 1, form_list[i])
        end
        self.show_list = list
    else
        self.show_list = {}
    end

    self.list_view:reloadData()

    self:createRedLine()
    if size == 0 then
        commonShowEmptyIcon(self.lay_scrollview, true, {text = TI18N("一个英雄都没有哦，\n快去召唤吧"),scale=0.7})
    else
        commonShowEmptyIcon(self.lay_scrollview, false)
    end

    if self.select_hero_vo == nil then
        self:selectHero(1,list[1])
    end
    
end

function HeroBagWindow:selectHero(item, hero_vo)
    if not hero_vo  then return end
    if not item then return end
    if self.select_hero_vo == hero_vo then return end
    --local show_model_type = HeroConst.BagTab.eBagHero
    self.select_hero_vo = hero_vo
    --打开英雄信息ui
    --HeroController:getInstance():openHeroMainInfoWindow(true, hero_vo, self.show_list, {show_model_type = show_model_type})
    --self:updateSpine(hero_vo,true)
    self:updateHeroInfo()
    self.name_box:setVisible(true)
    self.name:setString(StringUtil.branchStr(self.select_hero_vo.name) )
    self:setLock()
    --self.quality
    local res = PathTool.geHeroS(self.select_hero_vo.quality)
    self.quality:loadTexture(res, LOADTEXT_TYPE_PLIST)
    self:updateHeroBg()
end

function HeroBagWindow:updateHeroBg()
    
    local _star_bg_res = PathTool.getSingleImgForDownLoad("campbg", self.select_hero_vo.camp_type, false) --_hero_cfg.
    self.background:loadTexture(_star_bg_res, LOADTEXT_TYPE)
    print("-----------_star_bg_res---updateHeroBgupdateHeroBg-------",_star_bg_res)

end 

function HeroBagWindow:updateHeroInfo()
    local bid = self.select_hero_vo.bid
    self.library_config = Config.PartnerData.data_partner_library(bid)
    self.partner_config = Config.PartnerData.data_partner_base[bid]
    if not self.partner_config or not self.library_config then return end

    local draw_res_id = self.partner_config.draw_res
    local bg_res = PathTool.getSingleImgForDownLoad("herodraw/herodrawres",draw_res_id, false)
    if self.hero_draw_icon then
        self.item_load = loadSpriteTextureFromCDN(self.hero_draw_icon, bg_res, ResourcesType.single, self.item_load) 
    end

    if self.library_config.scale == 0 then
        self.hero_draw_icon:setScale(1)
    else
        self.hero_draw_icon:setScale(self.library_config.scale/100)
    end
    if self.library_config.draw_offset and next(self.library_config.draw_offset) ~= nil then
        local x, y = 360,640
        local offset_x = self.library_config.draw_offset[1][1] or 0
        local offset_y = self.library_config.draw_offset[1][2] or 0
        self.hero_draw_icon:setPosition(x + offset_x,  y + offset_y) 
    end  
end


--更新模型,也是初始化模型
--@is_refresh  是否需要检测
function HeroBagWindow:updateSpine(hero_vo, is_refresh)
    if self.record_spine_bid and self.record_spine_bid == hero_vo.bid and 
    self.record_spine_star and self.record_spine_star == hero_vo.star and
    self.record_spine_skin and self.record_spine_skin == hero_vo.use_skin then
        if is_refresh then
            if self.spine then
                local action1 = cc.FadeOut:create(0.2)
                local action2 = cc.FadeIn:create(0.2)
                self.spine:runAction(cc.Sequence:create(action1,action2))
            end    
        end
        return
    end
    self.record_spine_bid = hero_vo.bid
    self.record_spine_star = hero_vo.star
    self.record_spine_skin = hero_vo.use_skin




    local fun = function()    
        if not self.spine then
            self.spine = BaseRole.new(BaseRole.type.partner, hero_vo, nil, {scale = 1, skin_id = hero_vo.use_skin})
            self.spine:setAnimation(0,PlayerAction.show,true) 
            self.spine:setCascade(true)
            self.spine:setPosition(cc.p(0,0))
            self.spine:setAnchorPoint(cc.p(0.5,0.5)) 
            -- self.spine:setScale(1)
            self.spine_node:addChild(self.spine) 

            if self.select_hero_vo.use_skin ~= 0 then
                --策划要求..填null的话皮肤也不显示阴影 
                local skin_config = Config.PartnerSkinData.data_skin_info[self.select_hero_vo.use_skin]
                if skin_config and skin_config.hero_camp_res == "null" then
                    self.spine:showShadowUI(false)
                end
            end

            self.spine:setCascade(true)
            self.spine:setOpacity(0)
            local action = cc.FadeIn:create(0.2)
            self.spine:runAction(action)
        end
    end
    if self.spine then
        self.can_click_btn = false
        self.spine:setCascade(true)
        local action = cc.FadeOut:create(0.2)
        self.spine:runAction(cc.Sequence:create(action, cc.CallFunc:create(function()
                        doStopAllActions(self.spine)
                        self.spine:removeFromParent()
                        self.spine = nil
                        self.can_click_btn = true
                        fun()
                    end)))
    else
        fun()
    end
end


--创建cell 
--@width 是setting.item_width
--@height 是setting.item_height
function HeroBagWindow:createNewCell(width, height)
    local cell = HeroExhibitionItem.new(1, true)
    cell:addCallBack(function() self:onCellTouched(cell) end)
    return cell
end
--获取数据数量
function HeroBagWindow:numberOfCells()
    if self.show_list then
        return #self.show_list
    else
        return 0
    end
end

--更新cell(拖动的时候.刷新数据时候会执行次方法)
--cell :createNewCell的返回的对象
--inde :数据的索引
function HeroBagWindow:updateCellByIndex(cell, index)
    cell.index = index
    local hero_vo = self.show_list[index]
    if hero_vo then

        --英雄页签
        cell:setHeadUnEnabled(false)
        if cell.partner_type then
            setChildUnEnabled(false, cell.partner_type)
        end
        if HeroCalculate.isCheckHeroRedPointByHeroVo(hero_vo) then
            local is_redpoint = HeroCalculate.checkSingleHeroRedPoint(hero_vo)
            cell:showRedPoint(is_redpoint, 10, 5)
        else
            cell:showRedPoint(false)
        end
        cell.from_type = HeroConst.ExhibitionItemType.eHeroBag

        if hero_vo:isFormDrama() then
            cell:showFightImg(true)
        else
            cell:showFightImg(false)
        end


        cell:setData(hero_vo,true)

        cell:setLocalZOrder( 999-index ) 

        local x,y = cell:getPosition()
        self.redLine[index]:setPosition(cc.p(x-11,y + 80))

        
        -- --  -- 线
        -- local res_2 = PathTool.getResFrame("hero","hl_hero_19_1")
        -- local line_sprite = createSprite(res_2,0,0,self.list_view.container,cc.p(0,1),LOADTEXT_TYPE_PLIST,99)
        -- line_sprite:setName("line"..index)
        -- cell.lineNode2 = line_sprite
        

        -- local node = self.redLine2[index]
        -- if node then
        --     node:setPosition(cc.p(x-56,y + 90))
        -- end

        -- if index%6 == 1 then

        --     if cell.lineNode == nil then
        --         local res = PathTool.getResFrame("hero","hl_hero_19")
        --         cell.lineNode = createSprite(res,0,0,self.list_view.container,cc.p(0,1),LOADTEXT_TYPE_PLIST,100)
        --         cell.lineNode:setPosition(cc.p(x-56,y + 90))
        --     else
        --         cell.lineNode:setPosition(cc.p(x-56,y + 90))
        --     end
        -- else
        --     if cell.lineNode ~= nil then
        --         cell:removeChild(cell.lineNode)
        --         cell.lineNode = nil
        --         cell:setLocalZOrder(0)
        --     end
        -- end
    end

end

--点击cell .需要在 createNewCell 设置点击事件
function HeroBagWindow:onCellTouched(cell)
    local index = cell.index
    local hero_vo = self.show_list[index]
    if hero_vo then
        self:selectHero(cell, hero_vo)
    end
end


function HeroBagWindow:close_callback()
    if self.list_view then
        self.list_view:DeleteMe()
        self.list_view = nil
    end
    if self.role_assets_event and self.role_vo then
        self.role_vo:UnBind(self.role_assets_event)
        self.role_assets_event = nil
    end
    controller:openHeroBagWindow(false)
end
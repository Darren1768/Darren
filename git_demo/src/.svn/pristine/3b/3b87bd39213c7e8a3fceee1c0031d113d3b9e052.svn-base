-- --------------------------------------------------------------------
-- @description:
--      竖版伙伴装备信息面板
-- <br/> 2018年11月20日
-- --------------------------------------------------------------------
HeroMainTabEquipPanel =
    class(
    "HeroMainTabEquipPanel",
    function()
        return ccui.Widget:create()
    end
)

local string_format = string.format
local controller = HeroController:getInstance()
local model = controller:getModel()
local table_insert = table.insert
local role_vo = RoleController:getInstance():getRoleVo()

function HeroMainTabEquipPanel:ctor()
    self:config()
    self:layoutUI()
    self:registerEvents()
end
function HeroMainTabEquipPanel:config()
    --装备item 列表upo
    self.equip_item_list = {}

    self.equip_type_list = HeroConst.EquipPosList

    self.equip_icon_name_list = {
        [BackPackConst.item_type.WEAPON] = "hero_info_7", --武器icon
        [BackPackConst.item_type.SHOE] = "hero_info_10", --鞋子icon
        [BackPackConst.item_type.CLOTHES] = "hero_info_9", --衣服icon
        [BackPackConst.item_type.HAT] = "hero_info_8", --裤子icon
        [5] = "hero_info_11", --武器icon--神器
        [6] = "hero_info_11" --武器icon
    }

    --神器解锁条件
    self.artifact_lock_list = model.artifact_lock_list

    --没有穿戴的情况下不开启强化和觉醒
    self.is_wear = false
end

function HeroMainTabEquipPanel:layoutUI()
    local csbPath = PathTool.getTargetCSB("hero/hero_main_tab_equip_panel")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    --读取文件的大小
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)
    self.tab_panel = self.root_wnd:getChildByName("tab_panel")

    self.suit_panel = self.tab_panel:getChildByName("suit_panel")
    self.suit_panel:setVisible(false)
    -- self.suit_tLable = self.suit_panel:getChildByName("title_lable")
    -- self.suit_sLable1 = self.suit_panel:getChildByName("skill_lable1")
    -- self.suit_suitLable = self.suit_panel:getChildByName("suit_lable")
    -- self.suit_sLable2 = self.suit_panel:getChildByName("skill_lable2")
    -- self.suit_sLable2_0 = self.suit_panel:getChildByName("skill_lable2_0")
    self.suit_desLble = createRichLabel(22, cc.c3b(74, 35, 28), cc.p(0, 1), cc.p(160, 132), 0, 0, 500)
    self.suit_desLble2 = createRichLabel(22, cc.c3b(74, 35, 28), cc.p(0, 1), cc.p(160, 94), 0, 0, 500)
    self.suit_panel:addChild(self.suit_desLble)
    self.suit_panel:addChild(self.suit_desLble2)
    -- self.suit_skillItem = self:createSkillItem(360, 270, self.suit_panel)

    -- 下面套装
    self.suit_scrollview = self.suit_panel:getChildByName("suit_scrollview")
    self.suit_all_container = self.suit_scrollview:getChildByName("all_container")

    self.strong_panel = self.root_wnd:getChildByName("strong_panel")
   
    self.strong_cost_icon1 =createImage(self.strong_panel, nil, 165, 290, cc.p(0.5,0.5), false)
    self.strong_cost_icon5 =createImage(self.strong_panel, nil, 475, 290, cc.p(0.5,0.5), false)
    self.strong_cost_txt1 = createRichLabel(22, cc.c3b(74, 35, 28), cc.p(0.5, 0.5), cc.p(205, 288))
    self.strong_panel:addChild(self.strong_cost_txt1)
    self.strong_cost_txt5 = createRichLabel(22, cc.c3b(74, 35, 28), cc.p(0.5, 0.5), cc.p(516, 288))
    self.strong_panel:addChild(self.strong_cost_txt5)
    self.strong_cost_txt = {}
    self.strong_cost_txt[1] = self.strong_cost_txt1
    self.strong_cost_icons = {}
    self.strong_cost_icons[1] = self.strong_cost_icon1

    self.strong_cost_txt_5 = {}
    self.strong_cost_txt_5[1] = self.strong_cost_txt5
    self.strong_cost_icons_5 = {}
    self.strong_cost_icons_5[1] = self.strong_cost_icon5

    self.strong_Item = self:createPackItem(360, 856, self.strong_panel, self.equip_icon_name_list[1])
    self.strong_lable = self.strong_panel:getChildByName("need_name")
    self.strong_btn1 = self.strong_panel:getChildByName("awake_btn_1")
    self.strong_btn5 = self.strong_panel:getChildByName("awake_btn_5")
    self.strong_Tip = self.strong_panel:getChildByName("tips_label")
    self.strong_Tip_1 = self.strong_panel:getChildByName("tips_label_1")

    self.awake_panel = self.root_wnd:getChildByName("awake_panel")

    self.awake_matNLable2 = createRichLabel(22, cc.c3b(98, 53, 43), cc.p(0.5, 0.5), cc.p(520, 240))
    self.awake_panel:addChild(self.awake_matNLable2)
    self.awake_cost_icons={}
    self.awake_cost_icons[1] = self:createPackItem(360, 310, self.awake_panel, self.equip_icon_name_list[1])
    self.awake_cost_icons[2] =  createImage(self.awake_panel, nil, 482, 240, cc.p(0.5,0.5), false)

    self.awake_matNLable1 = createRichLabel(18, cc.c3b(98, 53, 43), cc.p(0.5, 0.5), cc.p(360, 274))
    self.awake_panel:addChild(self.awake_matNLable1)
    self.awake_matNLable1:setZOrder(1)
    self.awake_cLables = {}
    self.awake_cLables[1] = self.awake_matNLable1
    self.awake_cLables[2] = self.awake_matNLable2

    self.awake__ItemL = self:createPackItem(228, 888, self.awake_panel, self.equip_icon_name_list[1])
    self.awake__lableL = self.awake_panel:getChildByName("left_name")
    self.awake__ItemR = self:createPackItem(506, 888, self.awake_panel, self.equip_icon_name_list[1])
    self.awake__lableR = self.awake_panel:getChildByName("right_name")

    self.awake_btn = self.awake_panel:getChildByName("awake_btn")
    self.awake_Tip = self.awake_panel:getChildByName("tips_label")

    self.saCommon_panel = self.root_wnd:getChildByName("strongAwake_commonPanel")
    self.saLeft_btn = self.root_wnd:getChildByName("leftBtn")
    self.saLeft_btn:setVisible(false)

    self.saRight_btn = self.root_wnd:getChildByName("rightBtn")
    self.saRight_btn:setVisible(false)

    self.strongATtt_tex={}
    self.saLeftRight = self.saCommon_panel:getChildByName("leftRight")
    self.saLv_full_lable =self.root_wnd:getChildByName("full_lvLable")
 
    -- self.lv_lable = self.saCommon_panel:getChildByName("lv_label")
    -- self.sa_scrollviewTitle = createScrollView(500, 70, 200, 250, self.saCommon_panel, ccui.ScrollViewDir.vertical)
    -- self.saLv_lable =createRichLabel(22, cc.c4b(0x4a, 0x23, 0x1c, 0xff), cc.p(0, 0.5), cc.p(0,120), 0, 0, 500)
    -- self.sa_scrollviewTitle:addChild(self.saLv_lable )

    self.sa_leftPane1 = self.saLeftRight:getChildByName("left_back")
    self.sa_leftName = self.sa_leftPane1:getChildByName("name")
    self.strong_txt1 = createRichLabel(22, cc.c4b(0x4a, 0x23, 0x1c, 0xff), cc.p(0, 0.5), cc.p(50,50), 0, 0, 200)
    self.sa_leftPane1:addChild(self.strong_txt1 )
    self.strongATtt_tex[1]=self.strong_txt1 
    self.skill_scrollviewL = createScrollView(226, 78, 0, 10, self.sa_leftPane1, ccui.ScrollViewDir.vertical)
    self.left_ScrollLble = createRichLabel(22, cc.c4b(0x4a, 0x23, 0x1c, 0xff), cc.p(0, 0.5), cc.p(50, 124), 0, 0, 200)
    self.skill_scrollviewL:addChild(self.left_ScrollLble)

    self.sa_rightPanel = self.saLeftRight:getChildByName("right_back")
    self.sa_rightName = self.sa_rightPanel:getChildByName("name")
    self.strong_txt2 = createRichLabel(22, cc.c4b(0x4a, 0x23, 0x1c, 0xff), cc.p(0, 0.5), cc.p(50,50), 0, 0, 200)
    self.sa_rightPanel:addChild(self.strong_txt2 )
    self.strongATtt_tex[2]=self.strong_txt2
    self.skill_scrollviewR = createScrollView(226, 78, 0, 10, self.sa_rightPanel, ccui.ScrollViewDir.vertical)
    self.right_ScrollLble = createRichLabel(22, cc.c4b(0x4a, 0x23, 0x1c, 0xff), cc.p(0, 0.5), cc.p(50, 124), 0, 0, 200)
    self.skill_scrollviewR:addChild(self.right_ScrollLble)
    self.background = self.root_wnd:getChildByName("background")
    self.power_click = self.tab_panel:getChildByName("power_click")
    self.fight_label = CommonNum.new(101, self.power_click, 99999, -2, cc.p(0.5, 0.5))
    self.fight_label:setPosition(self.power_click:getContentSize().width / 2, self.power_click:getContentSize().height / 2 + 10)

    self.equip_node_list = {}
    for i = 1, 4 do
        local equip_type = self.equip_type_list[i] or i
        self.equip_node_list[i] = self.tab_panel:getChildByName("equip_node" .. i)

        local item = self:createPackItem(0, 0, self.equip_node_list[i], self.equip_icon_name_list[equip_type],i)
        -- 引导需要
        item:setName("guidesign_equip_item_" .. i)
        if i >= 5 then
        -- item:setBackgroundOpacity(0)
        end
        self.equip_item_list[equip_type] = item
    end
    self.key_up_btn = self.tab_panel:getChildByName("key_up_btn")
    -- self.key_up_btn:getChildByName("label"):setString(TI18N("一键穿戴"))
    self.key_up_btn:setVisible(false)
    self.discharge_btn = self.tab_panel:getChildByName("discharge_btn")
    -- self.discharge_btn:getChildByName("label"):setString(TI18N("一键卸下"))
    self.discharge_btn:setVisible(false)

    self.tab_list = {}
    local tab_btn_obj = self.root_wnd:getChildByName("tab_btn")
    for i = 1, 3 do
        local tab_btn = {}
        local item = tab_btn_obj:getChildByName("tab_btn_" .. i)
        tab_btn.btn = item
        tab_btn.index = i
        tab_btn.select_bg = item:getChildByName("select_img")
        tab_btn.select_bg:setVisible(false)

        tab_btn.red_point = item:getChildByName("red_point")
        tab_btn.red_point:setVisible(false)

        self.tab_list[i] = tab_btn
    end
    local data = Config.PartnerEqmData.data_partner_const_fun("max_lev")
    self.max_enchant_level = data.val
    self.select_eqmIndex = 1
    self:changeTabType(1)
end

function HeroMainTabEquipPanel:updatePower()


    local power = 0 
    if self.cur_tab_index == 1 then 
        power = model:getHeroAllEquipPower(self.hero_vo)

    else
        power = model:getHeroEquipPower(self.hero_vo,self.select_eqmIndex)
    end 
    print("-------------power----------",power,self.hero_vo.power)
    self.fight_label:setNum(self.hero_vo.power)
end

-- @_type 参考 HeroConst.MainInfoTab 定义
function HeroMainTabEquipPanel:changeTabType(index)
    if self.cur_tab_index == index then
        return
    end
    self.select_eqmIndex=self:getAwakeStrongEqmIndex()

    if (index > 1 and  self.select_eqmIndex==0) or ( index >1 and  not self:checkCanNext() )  then
        if index==2 then 
            TipsManager:getInstance():showCommonTips("佩戴绝品装备才可以强化", cc.p(self.size.width * 0.5, self.size.height * 0.5), 25, 0.5, 300, true)
        end 
        if index==3 then 
            TipsManager:getInstance():showCommonTips("佩戴绝品装备才可以觉醒", cc.p(self.size.width * 0.5, self.size.height * 0.5), 25, 0.5, 300, true)
        end 
        return
    end

    

    if self.cur_tab ~= nil then
        self.cur_tab.select_bg:setVisible(false)
    end
    self.cur_tab_index = index

    self.cur_tab = self.tab_list[self.cur_tab_index]

    if self.cur_tab ~= nil then
        self.cur_tab.select_bg:setVisible(true)
    end

    self.tab_panel:setVisible(false)
    self.strong_panel:setVisible(false)
    self.awake_panel:setVisible(false)
    self.saCommon_panel:setVisible(true)
    commonShowEmptyIcon(self.saLv_full_lable, false, {})
 
    self.saRight_btn:setVisible(true)
    self.saLeft_btn:setVisible(true)
    local bg_res
    if self.cur_tab_index == 1 then
        self.tab_panel:setVisible(true)
        self.saCommon_panel:setVisible(false)
        bg_res = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_44", false)
        self.saRight_btn:setVisible(false)
        self.saLeft_btn:setVisible(false)

    elseif self.cur_tab_index == 2 then
        self.strong_panel:setVisible(true)
        bg_res = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_43", false)
        self:updateEnchant(self.hero_vo)
        -- self.sa_scrollviewTitle:setVisible(false)
        self.skill_scrollviewL:setVisible(false)
        self.skill_scrollviewR:setVisible(false)
    elseif self.cur_tab_index == 3 then
        -- self.sa_scrollviewTitle:setVisible(true)
        self.skill_scrollviewL:setVisible(true)
        self.skill_scrollviewR:setVisible(true)
        self.awake_panel:setVisible(true)
        bg_res = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_42", false)
        self:updateAwake(self.hero_vo)
    end
    self.item_load = loadImageTextureFromCDN(self.background, bg_res, ResourcesType.single, self.item_load)
    --处理红点
    --self:updatePageRedPoint()
end

--事件
function HeroMainTabEquipPanel:registerEvents()
    for index, tab_btn in ipairs(self.tab_list) do
        registerButtonEventListener(
            tab_btn.btn,
            function()
                self:changeTabType(index)
            end,
            false,
            1
        )
    end

    registerButtonEventListener(
        self.key_up_btn,
        function()
            self:onClickKeyUpBtn()
        end,
        true
    )
    registerButtonEventListener(
        self.discharge_btn,
        function()
            self:onClickDischargeBtn()
        end,
        true
    )
    registerButtonEventListener(
        self.saLeft_btn,
        function()
            self:onClickCommonLeftBtn()
        end,
        true
    )
    registerButtonEventListener(
        self.saRight_btn,
        function()
            self:onClickCommonRightBtn()
        end,
        true
    )
    registerButtonEventListener(
        self.strong_btn1,
        function()
            self:_onClickBtnStrong1()
        end,
        true
    )
    registerButtonEventListener(
        self.strong_btn5,
        function()
            self:_onClickBtnStrong5()
        end,
        true
    )
    registerButtonEventListener(
        self.awake_btn,
        function()
            self:_onClickBtnAwake()
        end,
        true
    )
    --英雄信息更新
    EventManager:getInstance():Bind(
        HeroEvent.Equip_Update_Event,
        self,
        function()
            if not self.hero_vo then
                return
            end
            self:updateInfo(self.hero_vo)
          
            self:updateOneKeyBtnStatus()
            if self.cur_tab_index==1 then
                self:updateEquipSuit(self.hero_vo)
                return
            end
            if self.cur_tab_index==2 then
                self:updateEnchant(self.hero_vo)
                return
            end
            self:updateAwake(self.hero_vo)
        end
    )
    --红点更新事件..英雄信息更新和 背包的信息更新 才能判断红点
    EventManager:getInstance():Bind(
        HeroEvent.Equip_RedPoint_Event,
        self,
        function()
            if not self.hero_vo then
                return
            end
            self:updateRedPoint()
            self:updateOneKeyBtnStatus()
        end
    )

    --神器信息
    EventManager:getInstance():Bind(
        HeroEvent.Artifact_Update_Event,
        self,
        function(vo)
            if not self.hero_vo then
                return
            end
            self:updatePower()
        end
    )

    --神装更新
    EventManager:getInstance():Bind(
        HeroEvent.Holy_Equipment_Update_Event,
        self,
        function()
            self:updatePower()
        end
    )

    EventManager:getInstance():Bind(
        HeroEvent.Hero_Detail_Data_Update,
        self,
        function(hero_vo)
            if not hero_vo then
                return
            end
            if hero_vo.partner_id == self.hero_vo.partner_id then
                self:setData(self.hero_vo)
            end
        end
    )
end

-- 更新一键穿戴/卸下按钮显示
function HeroMainTabEquipPanel:updateOneKeyBtnStatus()
    if self.hero_vo and self.hero_vo.eqm_list then
        -- 装备有红点时，或者没穿戴任何装备时，显示一键穿戴，否则显示一键卸下
        if self.is_btn_redpoint or tableLen(self.hero_vo.eqm_list) <= 0 then
            self.key_up_btn:setVisible(true)
            self.discharge_btn:setVisible(false)
        else
            self.key_up_btn:setVisible(false)
            self.discharge_btn:setVisible(true)
        end
    else
        self.key_up_btn:setVisible(false)
        self.discharge_btn:setVisible(false)
    end
end

--一键穿戴
function HeroMainTabEquipPanel:onClickKeyUpBtn()
    if not self.hero_vo then
        return
    end
    controller:sender11010(self.hero_vo.partner_id, 0)
end

-- 一键卸下
function HeroMainTabEquipPanel:onClickDischargeBtn()
    if not self.hero_vo then
        return
    end
    controller:sender11011(self.hero_vo.partner_id, 0)
end
function HeroMainTabEquipPanel:onClickCommonLeftBtn()
    if not self.hero_vo then
        return
    end
   local has=  self:updateAwakeStrongLeftRightBtn(-1)
   self:updateEnchantAwakeCommon()
   if has then
    if self.cur_tab_index==2 then
        self:updateEnchant(self.hero_vo)
       return
       end
       self:updateAwake(self.hero_vo) 
   end
    -- self.saRight_btn:setVisible(true)
    -- self.select_eqmIndex = self.select_eqmIndex - 1
    -- if self.select_eqmIndex < 2 then
    --     self.saLeft_btn:setVisible(false)
    -- end
    -- if self.cur_tab_index==2 then
    --       self:updateEnchant(self.hero_vo)
    --     return
        
    -- end
    -- self:updateAwake(self.hero_vo)
end
function HeroMainTabEquipPanel:onClickCommonRightBtn()
    if not self.hero_vo then
        return
    end

    local has=self:updateAwakeStrongLeftRightBtn(1)
    self:updateEnchantAwakeCommon()
    if has then
     if self.cur_tab_index==2 then
         self:updateEnchant(self.hero_vo)
        return
        end
        self:updateAwake(self.hero_vo) 
    end
--     self.select_eqmIndex = self.select_eqmIndex + 1
--     self.saLeft_btn:setVisible(true)
--     self.saLeft_btn:setScaleX(-1)
--     if self.select_eqmIndex >3 then
--         self.saRight_btn:setVisible(false)
--     end
--     if self.cur_tab_index==2 then
--         self:updateEnchant(self.hero_vo)
--       return
      
--   end
--     self:updateAwake(self.hero_vo)
end
--@ index 索引  如果是装备可以是装备类型 equip_type
function HeroMainTabEquipPanel:selectEquipByIndex(index)
    if not self.hero_vo then
        return
    end
    if index == 5 or index == 6 then
        --5 ,6 是神器的位置
        local pos = index - 4
        local equip_vo = self.hero_vo.artifact_list[pos]
    
        --策划要求 原本 6星解锁 改成 7星解锁 .原本6星的已有数据的保留
        if equip_vo == nil then
            local artifact_lock = self.artifact_lock_list[pos]
            if artifact_lock then
                if artifact_lock[1] == "lev" then
                    if self.hero_vo.lev < artifact_lock[2] then
                        message(string_format(TI18N("英雄%s级解锁"), artifact_lock[2]))
                        return
                    end
                elseif artifact_lock[1] == "star" then
                    if self.hero_vo.star < artifact_lock[2] then
                        message(string_format(TI18N("英雄%s星解锁"), artifact_lock[2]))
                        return
                    end
                end
            end
        end

        -- local equip_vo = self.hero_vo.artifact_list[pos]
        --默认都是主神器
        if equip_vo and next(equip_vo) ~= nil then
            controller:openArtifactTipsWindow(true, equip_vo, PartnerConst.ArtifactTips.partner, self.hero_vo.partner_id, pos, self.lock_list[pos])
        else
            controller:openArtifactListWindow(true, pos, self.hero_vo.partner_id)
        end
    else
        local equip_type = index
        local equip_list = model:getHeroEquipList(self.hero_vo.partner_id)
        local equip_vo = equip_list[equip_type]
        if equip_vo ~= nil then      
            controller:openEquipTips(true, equip_vo, PartnerConst.EqmTips.partner, self.hero_vo)
        else

            controller:openEquipPanel(true, equip_type, self.hero_vo.partner_id)
        end
    end
end

function HeroMainTabEquipPanel:setData(hero_vo)
    if not hero_vo then
        return
    end
    self.hero_vo = hero_vo
    self:updateInfo(hero_vo)
    self:updateRedPoint()
    self:updateOneKeyBtnStatus()

    self:changeTabType(1)
end

function HeroMainTabEquipPanel:updateRedPoint()
    --按钮的红点
    local is_btn_redpoint = false
    --装备红点
    for i, equip_type in ipairs(self.equip_type_list) do
        local is_redpoint = self:updateEachEquipRedPoint(equip_type)
        if not is_btn_redpoint then
            is_btn_redpoint = is_redpoint
        end
    end

    if is_btn_redpoint then
        -- if self.power_click then
        --     self.power_click:setVisible(false)
        -- end
        -- self.key_up_btn:setVisible(true)
        addRedPointToNodeByStatus(self.key_up_btn, is_btn_redpoint, 5, 5)
    else
        -- if self.power_click then
        --     self.power_click:setVisible(true)
        -- end
        -- self.key_up_btn:setVisible(false)
        addRedPointToNodeByStatus(self.key_up_btn, is_btn_redpoint, 5, 5)
    end
    self.is_btn_redpoint = is_btn_redpoint
end

--更新圣器的红点
function HeroMainTabEquipPanel:updateArtifactRedPoint()
    --符文(神器) 红点
    if self.lock_list then
        for i, v in ipairs(self.artifact_lock_list) do
            if not self.lock_list[i] then
                local equip_vo = self.hero_vo.artifact_list[i]
                print("---------------is_redpoint------------1----",i)
                local is_redpoint = HeroCalculate.checkSingleArtifactRedPoint(equip_vo)
                local item = self.equip_item_list[i + 4]
                -- item:showRedPoint(is_redpoint)
                addRedPointToNodeByStatus(self.img_box[i], is_redpoint, -1, -10)
                if self.img_box[i].red_point then
                    self.img_box[i].red_point:setScale(0.8 * 100 / 95)
                end
            else
                addRedPointToNodeByStatus(self.img_box[i], false)
            end
        end
    end
end

--更新每一个装备红点
function HeroMainTabEquipPanel:updateEachEquipRedPoint(equip_type)
    local equip_list = model:getHeroEquipList(self.hero_vo.partner_id)
    local item = self.equip_item_list[equip_type]
    local is_redpoint = HeroCalculate.checkSingleHeroEachPosEquipRedPoint(equip_type, equip_list[equip_type])
    item:showRedPoint(is_redpoint)
    return is_redpoint
end

function HeroMainTabEquipPanel:updateInfo(hero_vo)
    if not hero_vo then
        return
    end
    --装备信息
   local equip_list = model:getHeroEquipList(hero_vo.partner_id)
   --  printLuaTable(equip_list)
    for i, _type in ipairs(self.equip_type_list) do
        local equip_vo = equip_list[_type]
        local item = self.equip_item_list[_type]
        -- printLuaTable(equip_vo)
        if equip_vo then
            item:setData(equip_vo)
            -- if item.empty_icon then
            --     item.empty_icon:setVisible(false)
            -- end
            item.equip_vo = equip_vo
        else
            item:setData()
            -- if item.empty_icon then
            --     item.empty_icon:setVisible(false)
            -- end
            item.equip_vo = nil
            item:setBackgroundRes(PathTool.getResFrame("common", "hl_common_273"))
        end
        -- item:setBackgroundRes(PathTool.getResFrame("hero", "hero_info_32"))
    end
    self:updatePower()
    model:updateEqm_set_List(hero_vo)
  
    if self.cur_tab_index == 1 then
        self:updateEquipSuit(hero_vo)
    elseif self.cur_tab_index == 2 then
        self:updateEnchant(self.hero_vo)
    elseif self.cur_tab_index == 3 then
        self:updateAwake(self.hero_vo)
    end
end

-- 更新套装属性
function HeroMainTabEquipPanel:createSkillItem(x, y, parent)
    local item = SkillItem.new(true, false, true, 0.8, true,nil,true)
    parent:addChild(item)
    item:setPosition(x, y)
    return item
end

function HeroMainTabEquipPanel:createPackItem(x, y, parent, res,index)
    local item = BackPackItem.new(false, true, nil, 0.8, false)

    parent:addChild(item, 1)
    item:setPosition(cc.p(x, y))
    if index then
        item:addCallBack(
            function()
                self:selectEquipByIndex(index)
            end
        ) 
    else
        item:setDefaultTip()
    end
    -- if self.cur_tab_index ==2 or self.cur_tab_index ==3 then 
    --    item:setDefaultTip()
    -- end 
    -- local res = PathTool.getResFrame("common", "hl_common_273")
    -- local empty_icon = createImage(item:getRoot(), res, 65, 70, cc.p(0.5, 0.5), true, 10, false)
    -- item.empty_icon = empty_icon
    return item
end
function HeroMainTabEquipPanel:getAwakeStrongEqmIndex()
    local eqm_list=model:getEqm_set_List()
    if self.select_eqmIndex==0 then
        self.select_eqmIndex=1
    end
    if eqm_list[self.select_eqmIndex]==0 then
        for i=1,4 do
            local index=(self.select_eqmIndex+i)%4
            if index==0 then
                index=4
            end
            if eqm_list[index]==1 then
                return index
            
            end
        
        end
     return 0
end

    return self.select_eqmIndex

   
end
function HeroMainTabEquipPanel:updateAwakeStrongLeftRightBtn(change)
    local eqm_list=model:getEqm_set_List()

 
    local count=4-self.select_eqmIndex
     if change<0 then
          count=self.select_eqmIndex-1
     end
     local has=true
     if count<1 then
        has=false
     end

     if count>=1 then

       local index=self:checkCommonLeftRight(count,change)
       if index==0 then
           has=false
       else
        self.select_eqmIndex=index
       end
  
    end
 
     return  has
 
   end
function HeroMainTabEquipPanel:updateEquipSuit(hero_vo)
    local suitList = model:getEquipSuit(hero_vo)
    self.saLv_full_lable:setString("")
    if suitList and #suitList > 0 then
        commonShowEmptyIcon(self.saLv_full_lable, false, {})
        self.suit_panel:setVisible(true)

       self.suit_all_container:removeAllChildren()
       self.equip_suit_item = {}
       local index = 1
       local y =0 
        for i,v in ipairs(suitList) do 

            local suit_configs = Config.PartnerEqmData.data_eqm_suit[v[1]]
            
            
    	    table.sort(suit_configs,function(a,b) return a.num  < b.num end)

            for k = 1, #suit_configs do

                if not self.equip_suit_item[index] then 
                    if index ==1 then 
                        y =0 
                    end 
                    y , self.equip_suit_item[index]  =  self:createEquipSuitItem(y,self.suit_all_container,suit_configs[k],suitList[i][2])
                end 


                index = index +1 
            end


        end 

        local all_height = 360
        if y < -360 then 
            all_height = -y
        end
        self.suit_scrollview:setInnerContainerSize(cc.size(620,all_height))
        self.suit_all_container:setPositionY(all_height)
     
        return 
    end
    self.is_wear = false
    self.suit_panel:setVisible(false)

    commonShowEmptyIcon(self.saLv_full_lable, true, {font_size = 20,pos=cc.p(0,-40),scale = 1, text = TI18N("激活装备套装可以\n提升大幅度战力")})

end

function HeroMainTabEquipPanel:createEquipSuitItem(pos_y,parent,data,count)
    if not parent then return end
    local item = {}
    local attr_color = "676666"
    local val_color = "676666"
    --是否激活
    local is_active =false
    if count >= data.num then
        is_active =true 
        attr_color  = "62352b"
        val_color = "6d9854"
    end 

    --套装名
    pos_y = pos_y-10 
    local name = createLabel(22,cc.c4b(98,53,43,0xff),nil,310, pos_y,"",parent,0,cc.p(0.5,1),TITLE_FONT)
    name:setContentSize(cc.size(200,24))
    name:setString(data.name)
    if not is_active then 
        name:setTextColor(cc.c3b(103,102,102))
    end 
    pos_y = pos_y-name:getContentSize().height -10
    -- 条件
    local condition_lable = createLabel(22,cc.c4b(109,152,84,0xff),nil,310, pos_y,"",parent,0,cc.p(0.5,1))
    condition_lable:setContentSize(cc.size(200,24))
    condition_lable:setString(string_format("拥有%s件%s装备可激活",data.num,data.abb_name))
    if not is_active then 
        condition_lable:setTextColor(cc.c3b(103,102,102))
    end 
    pos_y = pos_y-condition_lable:getContentSize().height -36


    --属性
    local type_str = type(data.attr)
    if type_str == "table" then
         local  index  =1 
        for m ,val in pairs(data.attr) do 

            local attr_key = val[1]
            local attr_val = val[2]

            local attr_label = createRichLabel(20,cc.c4b(189,180,199,0xff),cc.p(0,1),cc.p(105, pos_y),4,nil,300)
            parent:addChild(attr_label)

            local _yy =math.floor((index-1)/2 ) 
            local _xx = (index-1) %2 
   
            local _x = 105 + _xx* 210 
            local _y= -24 * _yy + pos_y 
        
            attr_label:setPosition(cc.p(_x,_y))
            local attr_name = Config.AttrData.data_key_to_name[attr_key]
            local is_per = PartnerCalculate.isShowPerByStr(attr_key)
            if is_per == true then
                attr_val = (attr_val*0.1).."%"
            end
            local attr_str = string_format("<div fontcolor=#%s>%s：</div><div fontcolor=#%s>%s</div>", attr_color, attr_name, val_color, attr_val)
            attr_label:setString(attr_str)
            index = index + 1

            pos_y = _y - attr_label:getContentSize().height 
        end 
    end 

    local skill_config = Config.SkillData.data_get_skill(data.skill_id)
    if not skill_config then 
        return 
    end 
    pos_y = pos_y -36
    -- 技能 名字
    local skill_name = createLabel(22,cc.c4b(189,81,16,0xff),nil,105, pos_y,"",parent,0,cc.p(0,1))
    skill_name:setContentSize(cc.size(200,24))
    skill_name:setString("["..skill_config.name.."]")
    if not is_active then 
        skill_name:setTextColor(cc.c3b(103,102,102))
    end 
    pos_y = pos_y-skill_name:getContentSize().height 
    -- 技能 描述
    local skill_desc = createRichLabel(20,cc.c4b(98,53,43,0xff),cc.p(0,1),cc.p(105, pos_y-10),4,nil,500)
    skill_desc:setString(skill_config.des)
    parent:addChild(skill_desc)
    print("---------skill_config.des---------",skill_config.des)

    if not is_active then 
        skill_desc:setString(string_format("<div fontcolor=#676666>%s</div>",skill_config.des))
    end 

    local skill = SkillItem.new(true,true,true,0.9,nil,nil,true,true)
    parent:addChild(skill)
    skill:showLockIcon(false)
    skill:setData(skill_config)

    if not is_active then 
        setChildUnEnabled(true, skill)
    end 

    local desc_height =  skill_desc:getContentSize().height
    if desc_height <60 then 
        desc_height = 60
    end 
    skill:setPosition(50,-(desc_height+skill_name:getContentSize().height)/2 + skill_name:getPositionY())

    pos_y = skill_desc:getPositionY() - skill_desc:getContentSize().height -20
    print("----------createEquipSuitItem----pos_y------pos_y 2----",pos_y)
    return   pos_y,item 
end 


function HeroMainTabEquipPanel:getAttr(k, v,count,str,index)
    local addStr=nil
    local attr_name = Config.AttrData.data_key_to_name[k]
        if attr_name then
        --<div fontcolor=#4BFFE8 outline=2,#422A1B>%s</div>  
        local richFont=" %d "
        if index==2 then
            addStr=string_format("%s       <div fontcolor=#45A536>%d</div>  ",attr_name,v)
        else
            addStr=string_format("%s       %d  ",attr_name,v)
        end
            if count > 0 then
                str = str .. "\n"
            end
            count = count + 1 
            str = str .. addStr
        end
        local obj={}
        obj[1]=str
        obj[2]=count
        return obj
end
function HeroMainTabEquipPanel:setAttrList(awakeConfig, lv, parent, lable,index)
    local attList = {}
    lable:setVisible(true)
    local count = 0
    local config = awakeConfig
    if awakeConfig.add then
        config = awakeConfig.add
    end
    local str = ""
    for k, v in pairs(config) do
        local obj;
        if self.cur_tab_index==2 then
            obj=self:getAttr(config[1],config[2],count,str,index)
            if lv==0 then
             local obj1=self:getAttr(config[1],0,0,"",1)
             self.strongATtt_tex[1]:setVisible(true)
             self.strongATtt_tex[1]:setString(obj1[1])
            end
        else
            obj=self:getAttr(k,v,count,str,index)
            
        end
        count=obj[2]
        str=obj[1]
        if self.cur_tab_index==2 then
           break
        end
      
    end
    lable:setString(str)
    local item_height = 28

    local height = count * item_height
    if self.cur_tab_index==2 then
     
  
    else
        lable.y=height
        parent:setInnerContainerSize(cc.size(226, height))
        parent:setTouchEnabled(true)
        parent:jumpToTop()
    end

 
end

-- 是否可以强化或者觉醒 只有绝品可以
function HeroMainTabEquipPanel:checkCanNext()

    if self.equip_item_list then 
        for i,item  in pairs(self.equip_item_list) do 
            if item and item.data then
                if item.data.config.eqm_jie ==1 then 
                    return true
                end 
            end 
        end 
    end 
    return false

end

function HeroMainTabEquipPanel:getAwakeStrongNextData()
    local nextData = nil
    local item = self.equip_item_list[self.select_eqmIndex]
    if item and item.data then
        item.data.awake = item.data.awake or 0
        self.awake__ItemL:setData(item.data)
        self.awake__ItemL:setStarCount(true,item.data.awake)
        self.eqm_id=item.data.id
        -- printLuaTable(item.data)
        item.data.enchant = item.data.enchant or 0
        self.strong_Item:setData(item.data)
        nextData = deepCopy(item.data)
        local eqmName = item.data.config.name
        if eqmName then
            -- if nextData then
            --     self.awake__lableR:setString("觉醒等级"  .. (item.data.awake+1))
            -- end
            -- if item.data.awake then
            --     self.awake__lableL:setString("觉醒等级"  .. item.data.awake)
            -- end
            if item.data.enchant then
                -- self.strong_lable:setString("强化等级".. item.data.enchant)
            end
        end
       if item.data.config.eqm_jie ==0 then 
           nextData = nil
       end 
    end
    return nextData
end


function HeroMainTabEquipPanel:updateAwake(hero_vo)


    self.strongATtt_tex[1]:setVisible(false)
    self.strongATtt_tex[2]:setVisible(false)

    local notFull=false
    local nextData = self:getAwakeStrongNextData()
    if nextData then
        local curKey = getNorKey(nextData.base_id, nextData.awake)
        local nextKey = getNorKey(nextData.base_id, nextData.awake + 1)
        local curConfig = Config.PartnerEqmData.data_get_eqm_awake_info[curKey]
        local nextConfig = Config.PartnerEqmData.data_get_eqm_awake_info[nextKey]

        local awakeConfigNext = self:setEnchantAwakeAttr(nextData.base_id, nextData.awake, curConfig, nextConfig)
        if awakeConfigNext then
            nextData.awake = nextData.awake + 1
            self.awake__ItemR:setData(nextData)
            self.awake__ItemR:setStarCount(true,nextData.awake)
            notFull=true
            local csume = awakeConfigNext[1].consum

         
            controller:setExpend(csume, self.awake_cLables,self.awake_cost_icons)

            self.awake_cLables[2]:setPositionX(358)
            self.awake_cLables[2]:setPositionX(self.awake_cLables[2]:getPositionX()+20 )
            self.awake_cost_icons[2]:setPositionX(self.awake_cLables[2]:getPositionX()-self.awake_cLables[2]:getContentSize().width/2-20)

        end


    
       
    end
    self.awake_cost_icons[1]:setVisible(notFull)
    self.awake_cost_icons[2]:setVisible(notFull)
    self.awake_cLables[1]:setVisible(notFull)
    self.awake_cLables[2]:setVisible(notFull)
    self.saCommon_panel:setVisible(notFull)

    if notFull then
        self.saLv_full_lable:setString("")  
        commonShowEmptyIcon(self.saLv_full_lable, false, {})
        self.awake__lableR:setString("觉醒等级"  .. (nextData.awake))
        self.awake__lableL:setString("觉醒等级"  .. nextData.awake-1)
    else
        self.saLv_full_lable:setString("")  
        commonShowEmptyIcon(self.saLv_full_lable, true, {font_size = 22,pos=cc.p(0,-40),scale = 1, text = TI18N("觉醒已满")})

        self.awake__lableL:setString("觉醒等级"  .. (nextData.awake-1).."（已满）")
    end
   
    self.awake_Tip:setVisible(notFull)
    self.awake_btn:setVisible(notFull)
    self.awake__lableR:setVisible(notFull)
    self.awake__ItemR:setVisible(notFull)
end


function HeroMainTabEquipPanel:checkCommonLeftRight(cnt,change)
    local eqm_list=model:getEqm_set_List()
    for i=1,cnt do
        local index=self.select_eqmIndex+i*change
  
        if eqm_list[index]==1 then
              return index
        
        end
        
        
    end
    return 0
end
function HeroMainTabEquipPanel:updateEnchantAwakeCommon()
      local eqm_list=model:getEqm_set_List()
        local leftCnt=self.select_eqmIndex-1
        local rightCnt=4-self.select_eqmIndex

 
        if leftCnt==0 then
            self.saLeft_btn:setVisible(false)
        else
            local index=self:checkCommonLeftRight(leftCnt,-1)
            local has=true
            if index==0 then
                has=false
            end
            self.saLeft_btn:setVisible(has)
        end
        if rightCnt==0 then
            self.saRight_btn:setVisible(false)
        else
            local index=self:checkCommonLeftRight(rightCnt,1)
            local has=true
            if index==0 then
                has=false
            end
            self.saRight_btn:setVisible(has)
        end

    
end
function HeroMainTabEquipPanel:setEnchantAwakeAttr(base_id, lv, awakeConfigCur, awakeConfigNext)
    local count=0
    if awakeConfigNext  then
        self.sa_leftName:setString(string_format(lv .. "级属性"))
        self.sa_rightName:setString(string_format((lv + 1) .. "级属性"))
        local config1
        if awakeConfigCur then
            config1 = awakeConfigCur
      
            if config1["add"] then
                config1=config1["add"]
            end
            if config1[1] then
                config1 = config1[1]
            end
            if self.cur_tab_index == 2 then
                self:setAttrList(config1, lv, self.skill_scrollviewL, self.strongATtt_tex[1],1)
            else
                self:setAttrList(config1, lv, self.skill_scrollviewL, self.left_ScrollLble,1)
            end
 
        end
        local config
        if awakeConfigNext then
            config = awakeConfigNext
            if config["add"] then
                config=config["add"]
            end
            if config[1] then
                config = config[1]
            end
            if self.cur_tab_index == 2 then
                self:setAttrList(config, lv, self.skill_scrollviewR, self.strongATtt_tex[2],2)
            else
            self:setAttrList(config, lv + 1, self.skill_scrollviewR, self.right_ScrollLble,2)
            end
        end
        local str=""

        -- if self.cur_tab_index == 2 then
        --     str = string_format("等级:%d / %d ", lv, self.max_enchant_level)
        -- end
   
     
        --  self.awake_cLables[1]:setString(string_format("<div fontcolor=289b14>%d</div>/%d",needNum,total_num))

            if config1 then
                for k, v in pairs(config1) do
                    local attr_name1 = Config.AttrData.data_key_to_name[k]
                    if attr_name1 then

                        local newStr = attr_name1 .. "      " .. v
                        str = str .. newStr
                        local newStr1 =string_format("          %s       <div fontcolor=#45A536>%d</div>  ",attr_name1,config[k])
                        str = str .."   ".. newStr1.."\n"
                        count=count+1
                    end
                end

            else
                for k, v in pairs(config) do
                    local attr_name1 = Config.AttrData.data_key_to_name[k]
                    if attr_name1 then

                        local newStr = attr_name1 .. "      " .. 0
                        str = str .. newStr
                        local newStr1 =string_format("          %s       <div fontcolor=#45A536>%d</div>  ",attr_name1,config[k])
                   

                        str = str .."      ".. newStr1.."\n"
                        count=count+1
                    end
                end
            end
            if self.cur_tab_index == 2 then
                -- self.lv_lable:setString(str)
            else
                --   self.saLv_lable:setString(str) 
                  -- self.lv_lable:setString("") 
            end

    end
    -- self.sa_scrollviewTitle:setInnerContainerSize(cc.size(500,count*28))
    -- self.sa_scrollviewTitle:jumpToTop()
    return awakeConfigNext
end
function HeroMainTabEquipPanel:updateEnchant(hero_vo)
    self:updateEnchantAwakeCommon()
    local notFull=false
    local nextData = self:getAwakeStrongNextData()
    if nextData then
        local curKey = getNorKey(nextData.base_id, nextData.enchant)
        local nextKey = getNorKey(nextData.base_id, nextData.enchant + 1)
        local curConfig = Config.PartnerEqmData.data_partner_eqm(curKey)
        local nextConfig = Config.PartnerEqmData.data_partner_eqm(nextKey)
        local awakeConfigNext = self:setEnchantAwakeAttr(nextData.base_id, nextData.enchant, curConfig, nextConfig)
        nextData.enchant = nextData.enchant + 1
        if awakeConfigNext then
            notFull=true
            local csume = awakeConfigNext.expend
            controller:setExpend(csume, self.strong_cost_txt,self.strong_cost_icons)
            self.strong_cost_txt[1]:setPositionX(205)
            self.strong_cost_txt[1]:setPositionX(self.strong_cost_txt[1]:getPositionX()+20 )
            self.strong_cost_icons[1]:setPositionX(self.strong_cost_txt[1]:getPositionX()-self.strong_cost_txt[1]:getContentSize().width/2-20)
            self.strong_lable:setString("强化等级".. nextData.enchant)
        else
            self.strong_lable:setString("强化等级".. (nextData.enchant-1) .."（已满）")
        end

        -- 强化5次只需要显示材料需要 
        local nextKey_5 = getNorKey(nextData.base_id, nextData.enchant + 5)
        local nextConfig_5 = Config.PartnerEqmData.data_partner_eqm(nextKey_5)
        if nextConfig_5 then
            controller:setExpend(nextConfig_5.expend, self.strong_cost_txt_5,self.strong_cost_icons_5)
            self.strong_cost_txt_5[1]:setPositionX(516)
            self.strong_cost_txt_5[1]:setPositionX(self.strong_cost_txt_5[1]:getPositionX()+20 )
            self.strong_cost_icons_5[1]:setPositionX(self.strong_cost_txt_5[1]:getPositionX()-self.strong_cost_txt_5[1]:getContentSize().width/2-20)
        end
    end
    self.strong_cost_txt[1]:setVisible(notFull)
    self.strong_cost_icons[1]:setVisible(notFull)
    self.strong_cost_txt_5[1]:setVisible(notFull)
    self.strong_cost_icons_5[1]:setVisible(notFull)
    self.saCommon_panel:setVisible(notFull)

    if notFull then
        self.saLv_full_lable:setString("")  
        commonShowEmptyIcon(self.saLv_full_lable, false, {})
    else
        -- self.saLv_full_lable:setString("")  
        commonShowEmptyIcon(self.saLv_full_lable, true, {font_size = 22,pos=cc.p(0,-40),scale = 1, text = TI18N("强化已满")})
    end
    self.strong_Tip:setVisible(notFull)
    self.strong_Tip_1:setVisible(notFull)
    self.strong_btn1:setVisible(notFull)
    self.strong_btn5:setVisible(notFull)
end

function HeroMainTabEquipPanel:_onClickBtnAwake()
    if not self.hero_vo then return end
    controller:sender11049(self.hero_vo.partner_id, self.eqm_id)
end
function HeroMainTabEquipPanel:_onClickBtnStrong1()
    if not self.hero_vo then return end
    controller:sender11013(self.hero_vo.partner_id, self.eqm_id)
end
function HeroMainTabEquipPanel:_onClickBtnStrong5()
    if not self.hero_vo then return end
    controller:sender11014(self.hero_vo.partner_id, self.eqm_id,5)
end
function HeroMainTabEquipPanel:setVisibleStatus(bool)
    self:setVisible(bool)
end

--移除
function HeroMainTabEquipPanel:DeleteMe()
    EventManager:getInstance():UnBind(self)
end

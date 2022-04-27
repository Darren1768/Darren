-- --------------------------------------------------------------------
-- @description:
--      英雄信息tips
-- --------------------------------------------------------------------
HeroTipsPanel = HeroTipsPanel or BaseClass(BaseView)

local controller = HeroController:getInstance()
local model = controller:getModel()
local string_format = string.format
local table_insert = table.insert
local table_sort = table.sort

function HeroTipsPanel:__init()
    
    self.title_str= ""
    self.layout_name = "hero/hero_tips_panel"
    self.win_type = WinType.Mini
    self.view_tag = ViewMgrTag.DIALOGUE_TAG 

    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("hero", "hero"), type = ResourcesType.plist},
        { path = PathTool.getPlistImgForDownLoad("tips","tips"), type = ResourcesType.plist},
    }

    self.attr_list = {[1]="atk",[2]="hp",[3]="def",[4]="speed"}
    self.break_icon_list = {}
    self.break_icon_bg_list = {}

    --技能 
    self.skill_width = 88
    self.skill_item_list = {}

    self.equip_type_list = HeroConst.EquipPosList

    self.equip_icon_name_list = {
        [BackPackConst.item_type.WEAPON] = "hero_info_7",  --武器icon
        [BackPackConst.item_type.SHOE] = "hero_info_10",  --鞋子icon
        [BackPackConst.item_type.CLOTHES] = "hero_info_9",  --衣服icon 
        [BackPackConst.item_type.HAT] = "hero_info_8",  --裤子icon
        [5] = "hero_info_11", --武器icon--神器
        [6] = "hero_info_11", --武器icon
    }   

    self.holy_equip_type_list = HeroConst.HolyequipmentPosList
    self.holy_equip_icon_name_list = {
        [BackPackConst.item_type.GOD_EARRING] = "hero_info_25",  --耳环
        [BackPackConst.item_type.GOD_RING] = "hero_info_27",  --戒指
        [BackPackConst.item_type.GOD_NECKLACE] = "hero_info_26",  --项链
        [BackPackConst.item_type.GOD_BANGLE] = "hero_info_28",  --手镯
    }
end

function HeroTipsPanel:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    if self.background ~= nil then
        self.background:setScale(display.getMaxScale())
        -- self.background:setSwallowTouches(false)
    end
    self.main_panel = self.root_wnd:getChildByName("main_panel")

    self.box_bg = self.main_panel:getChildByName("box_bg")  
    self.box_bg_1 = self.main_panel:getChildByName("box_bg_1")  
    if self.box_bg_1 then
        self.box_bg_1:setVisible(false)
    end
   
    self.top_panel = self.main_panel:getChildByName("top_panel")  

    self.hero_node = self.top_panel:getChildByName("hero_node")
    self.hero_item = HeroExhibitionItem.new(1, false)
    self.hero_node:addChild(self.hero_item)
    self.hero_node:setPosition(70,320)
    self.hero_name = self.top_panel:getChildByName("hero_name")
    self.hero_career = self.top_panel:getChildByName("hero_career")

    self.advanced_node = self.top_panel:getChildByName("advanced_node")
    
    --战力    
    self.power_click = self.top_panel:getChildByName("power_click")
    self.fight_label = CommonNum.new(101, self.power_click, 99999, - 2, cc.p(0.5, 0.5))
    self.fight_label:setPosition(70, 30) 

    --按钮
    self.comment_btn = self.top_panel:getChildByName("comment_btn")
    self.look_btn = self.top_panel:getChildByName("look_btn")

    --属性信息
    local attr_panel = self.top_panel:getChildByName("attr_panel")
    self.attr_icon_list = {}
    self.attr_icon_list[1] = attr_panel:getChildByName("attr_name1")
    self.attr_icon_list[2] = attr_panel:getChildByName("attr_name2")
    self.attr_icon_list[3] = attr_panel:getChildByName("attr_name3")
    self.attr_icon_list[4] = attr_panel:getChildByName("attr_name4")

    self.attr_label_list = {}
    self.attr_label_list[1] = attr_panel:getChildByName("attr_label1")
    self.attr_label_list[2] = attr_panel:getChildByName("attr_label2")
    self.attr_label_list[3] = attr_panel:getChildByName("attr_label3")
    self.attr_label_list[4] = attr_panel:getChildByName("attr_label4")

    -- self.top_panel:getChildByName("advancedKey"):setString(TI18N("灵升:"))


    self.skill_container = self.top_panel:getChildByName("scroll_view")
    self.skill_container:setScrollBarEnabled(false)
    self.skill_container:setTouchEnabled(false)
    self.skill_container_size = self.skill_container:getContentSize()

    self.skill_key = self.top_panel:getChildByName("skill_key")
    self.skill_key:setString(TI18N("武灵技"))
    self.box_bg = self.main_panel:getChildByName("box_bg")

    self.equip_panel = self.main_panel:getChildByName("equip_panel")

    -- self.equip_node_list = {}
    -- for i=1,6 do
    --     self.equip_node_list[i] = self.equip_panel:getChildByName("equip_node"..i)
    -- end

    -- self.holy_equip_node_list = {}
    -- for i=1,4 do
    --     self.holy_equip_node_list[i] = self.equip_panel:getChildByName("holy_equip_node_"..i) 
    -- end

    self.btn_goto = self.main_panel:getChildByName("btn_goto")
    if self.btn_goto then
        self.btn_goto:getChildByName("label"):setString(TI18N("更换英雄"))
    end
end

function HeroTipsPanel:register_event()
    registerButtonEventListener(self.background, handler(self, self.onClickCloseBtn) ,false, 1)
    registerButtonEventListener(self.comment_btn, function() self:onClickCommentBtn()  end ,true, 2, nil , 0.8)
    registerButtonEventListener(self.look_btn, function() self:onClickLookBtn() end ,true, 2, nil, 0.8)
    registerButtonEventListener(self.btn_goto, function() self:onClickGotoBtn() end ,true, 2)

    self:addGlobalEvent(HeroEvent.Del_Hero_Event, function(list)
        if self.hero_vo then
            for i,v in ipairs(list) do
                if self.hero_vo.partner_id == v.partner_id then
                    self:onClickCloseBtn()
                end
            end
        end
    end)

    self:addGlobalEvent(HeroEvent.Hero_Get_Talent_Event, function()
        if self.hero_vo then
            self:updateTalent(self.hero_vo)
        end
    end)
end

--评论
function HeroTipsPanel:onClickCommentBtn()
    if not self.hero_vo then return end
    PokedexController:getInstance():openCommentWindow(true, self.hero_vo)
end

--关闭
function HeroTipsPanel:onClickCloseBtn()
    controller:openHeroTipsPanel(false)
end

function HeroTipsPanel:onClickLookBtn()
    if not self.hero_vo then return end 
    controller:openHeroTipsAttrPanel(true, self.hero_vo)
end

--前往更换英雄
function HeroTipsPanel:onClickGotoBtn()
    if not self.hero_vo then return end 
    RoleController:getInstance():openRoleHeroShowFormPanel(true)
    self:onClickCloseBtn()
end

-- @setting.is_hide_equip 是否隐藏装备 
-- @setting.is_show_form_btn 是否显示更换英雄按钮(目前只有一个地方传这个按钮..如果有多.需改成支持多个的方式 )
-- 如果显示更换英雄按钮..必须is_hide_equip = false
function HeroTipsPanel:openRootWnd(hero_vo, setting)
    if not hero_vo then return end
 
    self.hero_vo = hero_vo
    local config = Config.PartnerData.data_partner_base[hero_vo.bid]
    if not config then return end

    local setting = setting or {}
    local is_hide_equip = setting.is_hide_equip or false
    local is_show_form_btn = setting.is_show_form_btn or false
    --背景框
    if hero_vo.star and hero_vo.star >= 13 then
        -- if self.box_bg_1 then
        --     self.box_bg_1:setVisible(true)
        -- end
       
        -- self.box_bg:setVisible(false)
    end

    --头像
    self.hero_item:setData(hero_vo)

    --名字
    self.hero_name:setString(config.name)
    local color = self:setColorByQuality(config.quality)
    self.hero_name:setTextColor(color)

    self.hero_career:setString(" ["..tostring(HeroConst.CareerName[hero_vo.type]).."]")
    self.hero_career:setPositionX(self.hero_name:getPositionX()+ self.hero_name:getContentSize().width)
    
    --战斗力
    local power = hero_vo.power or 0
    self.fight_label:setNum(power)

    --进阶
    self:updateAdvanceInfo(hero_vo)

    --属性icon
    for i,attr_str in ipairs(self.attr_list) do
        if self.attr_icon_list[i] then
            -- local res_id = PathTool.getAttrIconByStr(attr_str)
            -- local res = PathTool.getResFrame("common",res_id)
            -- loadSpriteTexture(self.attr_icon_list[i], res, LOADTEXT_TYPE_PLIST)   
        end

        if self.attr_label_list[i] then
            local value = hero_vo[attr_str] or 0
            self.attr_label_list[i]:setString(value)
        end
    end

    local key = getNorKey(config.type, config.break_id, hero_vo.break_lev)
    local break_config = Config.PartnerData.data_partner_brach[key]
    self:initSkill(hero_vo, break_config)

    -- --隐藏装备
    -- if is_hide_equip then
    --     self.equip_panel:setVisible(false)
    --     local size = self.box_bg:getContentSize()
    --     self.box_bg:setContentSize(cc.size(size.width, 370))
    --     self.main_panel:setPositionY(670)
    -- else
    --     self:updateEquip(hero_vo)

    --     --天赋
    --     local skill_key = self.equip_panel:getChildByName("skill_key")
    --     skill_key:setString(TI18N("天赋"))
        
    --     self:updateTalent(hero_vo)

    --     --神装
    --     local holy_key = self.equip_panel:getChildByName("holy_key")
    --     holy_key:setString(TI18N("神装"))

    --     self:updateHolyEquip(hero_vo)
    --     if is_show_form_btn then
    --         self.btn_goto:setVisible(true)
    --         local size = self.box_bg:getContentSize()
    --         self.box_bg:setContentSize(cc.size(size.width, 872))
    --     end
    -- end
    if is_show_form_btn then
        self.btn_goto:setVisible(true)
        local size = self.box_bg:getContentSize()
        self.box_bg:setContentSize(cc.size(size.width, 772))
    else
        self.btn_goto:setVisible(false)
        local size = self.box_bg:getContentSize()
        self.box_bg:setContentSize(cc.size(size.width, 700))
        self.main_panel:setPositionY(650)
    end

    self:updateEquip(hero_vo)

    --天赋-- 套装技
    local skill_key = self.equip_panel:getChildByName("skill_key")
    skill_key:setString(TI18N("套装技"))
    
    self:updateTalent(hero_vo)

    -- 灵魄
    self:updateLingpo(hero_vo)

    -- 灵身
    self:updateLingshen(hero_vo)

    --神装
    -- local holy_key = self.equip_panel:getChildByName("holy_key")
    -- holy_key:setString(TI18N("神装"))

    self:updateHolyEquip(hero_vo)
    if is_show_form_btn then
        self.btn_goto:setVisible(true)
      
    end

end

--更新进阶显示
function HeroTipsPanel:updateAdvanceInfo(hero_vo)
    local max_count = model:getHeroMaxBreakCountByInitStar(hero_vo.star)
    local star_width = 20+3
    local break_count = hero_vo.break_lev or 0
    if model:isResonateCystalHero(hero_vo) then
        break_count = hero_vo.resonate_break_lev or 0
    end

    local x = -26
    for i,v in ipairs(self.break_icon_list) do
        v:setVisible(false)
    end
    for i=1,max_count do
        if i <= break_count then
            if not self.break_icon_list[i] then
                local res = PathTool.getResFrame("common2","hl_common_0161")
                local star = createSprite(res, x + (i-1)*star_width, 0, self.advanced_node, cc.p(0,0.5), LOADTEXT_TYPE_PLIST, 1)
                -- star:setScale(0.6)
                self.break_icon_list[i] = star
            else
                self.break_icon_list[i]:setVisible(true)
            end
            
            if self.break_icon_bg_list[i] then
                self.break_icon_bg_list[i]:setVisible(false)
            end
        else
            if self.break_icon_list[i] then
                self.break_icon_list[i]:setVisible(false)
            end
            if not self.break_icon_bg_list[i] then
                local res = PathTool.getResFrame("common2","hl_common_0160")
                local star = createSprite(res, x + (i-1)*star_width, 0, self.advanced_node, cc.p(0,0.5), LOADTEXT_TYPE_PLIST, 0)
                -- star:setScale(0.6)
                self.break_icon_bg_list[i] = star
            else
                self.break_icon_bg_list[i]:setVisible(true)
            end
        end
    end
end

function HeroTipsPanel:initSkill(hero_vo, break_config)
    if not break_config then return end
    local key = getNorKey(hero_vo.bid, hero_vo.star)
    local star_config = Config.PartnerData.data_partner_star(key)
    if star_config == nil then return end

    local skill_list = {}
    for i,v in ipairs(star_config.skills) do
        -- 不是普通攻击 1表示普通攻击
        if v[1] ~= 1 then
            table_insert(skill_list, v)
        end
    end
    --技能item的宽度
    local item_width = self.skill_width 
    local total_width = item_width * #skill_list
    local max_width = math.max(self.skill_container_size.width, total_width)
    self.skill_container:setInnerContainerSize(cc.size(max_width, self.skill_container_size.height))
    self.skill_container:setPositionY(120)
    for i,v in ipairs(self.skill_item_list) do
        v:setVisible(false)
    end
    
    local x = 3
    -- if total_width > self.skill_container_size.width then
    --     --技能的总宽度大于 显示的宽度 就从左往右显示
    --     x = 0
    -- else
    --     --否则从中从中间显示
    --     x = (self.skill_container_size.width - total_width) * 0.5
    -- end

    for i,skill in ipairs(skill_list) do
        local config = Config.SkillData.data_get_skill(skill[2])
        if config then
            --是否锁住
            local is_lock = false
            if skill[1] > break_config.skill_num then
                is_lock = true
            end
            if self.skill_item_list[i] == nil then
                self.skill_item_list[i] = {}
                self.skill_item_list[i] = SkillItem.new(true,true,true,0.75, false,nil ,true)
                self.skill_container:addChild(self.skill_item_list[i])
            end
            self.skill_item_list[i]:setData(config)
            self.skill_item_list[i]:showUnEnabled(is_lock)
            self.skill_item_list[i]:setVisible(true)
            self.skill_item_list[i]:setPosition( x + item_width * (i - 1) + item_width * 0.5, self.skill_width/2)
        else 
            print(string_format("技能表id: %s 没发现", tostring(skill.skill_bid)))
        end
    end
end

function HeroTipsPanel:updateEquip(hero_vo)
    self.equip_item_list = {}
    --装备
    local equip_vo_list = {}
    if hero_vo.eqms ~= nil then
        --说明是网络返回的
        for i,v in ipairs(hero_vo.eqms) do
            equip_vo_list[v.type] = GoodsVo.New(v.base_id)
        end
    elseif hero_vo.eqm_list ~= nil then
        --说明是本地的 hero_vo
        for k,v in pairs(hero_vo.eqm_list) do
            equip_vo_list[k] = v
        end
    end

    --神器
    if hero_vo.artifacts ~= nil then
        --说明是网络返回的
        for i,artifact_data in ipairs(hero_vo.artifacts) do
            --因为有可能是神装 artifact_data.artifact_pos == 123 ~ 126 而神器的位置是1, 2
            if artifact_data.artifact_pos < 100 then
                local pos = artifact_data.artifact_pos + 4
                equip_vo_list[pos] = GoodsVo.New(artifact_data.base_id)
                if equip_vo_list[pos]["initAttrData"] then
                    equip_vo_list[pos]:initAttrData(artifact_data)
                end
            end
        end
    elseif hero_vo.artifact_list ~= nil then
        --说明是本地的 hero_vo
        for k,v in pairs(hero_vo.artifact_list) do
            equip_vo_list[k+4] = v
        end
    end

    for k,item in pairs(self.equip_item_list) do
        item:setData()
        if item.empty_icon then 
            item.empty_icon:setVisible(true)
        end
        item.equip_vo = nil
    end

    -- for i,equip_node in ipairs(self.equip_node_list) do
    -- local equip_type = self.equip_type_list[i] or i
    --     local equip_vo = equip_vo_list[equip_type]
    --     if self.equip_item_list[equip_type] == nil then
    --         local item = BackPackItem.new(false,true,nil,1,false, true)
    --         equip_node:addChild(item,1)
    --         item:setPosition(cc.p(0,0))
    --         item:setScale(0.7)
    --         item:addBtnCallBack(function() 
    --             self:selectEquipVo(item:getData(), i) 
    --         end)
    --         local res= PathTool.getResFrame("hero",self.equip_icon_name_list[equip_type])
    --         local empty_icon = createImage(item:getRoot(), res,60,60, cc.p(0.5,0.5), true, 10, false)
    --         item.empty_icon = empty_icon
    --         self.equip_item_list[equip_type] = item    
    --     end

    --     if equip_vo then
    --         self.equip_item_list[equip_type]:setData(equip_vo)
    --         self.equip_item_list[equip_type].equip_vo = equip_vo
    --         if self.equip_item_list[equip_type].empty_icon then
    --             self.equip_item_list[equip_type].empty_icon:setVisible(false)
    --         end
    --     end
    -- end
end

--@ index 索引  如果是装备可以是装备类型 equip_type
function HeroTipsPanel:selectEquipVo(equip_vo, index)
    if not self.hero_vo then return end
    if not equip_vo then return end
    if index == 5 or index == 6 then
        --5 ,6 是神器的位置
        local pos = index - 4
        controller:openArtifactTipsWindow(true, equip_vo, PartnerConst.ArtifactTips.normal, self.hero_vo.partner_id, pos)
    else
        controller:openEquipTips(true, equip_vo, PartnerConst.EqmTips.normal, self.hero_vo) 
    end
end

-- 原天赋-现在套装技
function HeroTipsPanel:updateTalent(hero_vo)
    local skill_tips = self.equip_panel:getChildByName("skill_tips")
    local skill_node = self.equip_panel:getChildByName("skill_node")

    -- self.suit_skillItem = self:createSkillItem(0, 0, skill_node)

    if not skill_tips then return end
    if not skill_node then return end
    local role_vo = RoleController:getInstance():getRoleVo()
    if not role_vo then return end
    
    local suitList = model:getEquipSuit(hero_vo)
    if suitList and #suitList > 0 then
        local suit_configs = Config.PartnerEqmData.data_eqm_suit[suitList[1]]

        for i = 1, #suit_configs do
            if suit_configs[i].num == suitList[2] then
                local config = suit_configs[i]
                local skill_config = Config.SkillData.data_get_skill(config.skill_id)
                self.suit_skillItem:setData(skill_config)
                return
            end
        end
    end
 
 
   
    -- local skill_tips = self.equip_panel:getChildByName("skill_tips")
    -- local skill_node = self.equip_panel:getChildByName("skill_node")
    -- if not skill_tips then return end
    -- if not skill_node then return end
    -- if self.talent_skill_item_list then return end
    -- local role_vo = RoleController:getInstance():getRoleVo()
    -- if not role_vo then return end

    -- local skill_list = {}
    -- if role_vo and hero_vo.rid and hero_vo.srv_id and role_vo.rid == hero_vo.rid and role_vo.srv_id ==  hero_vo.srv_id then
    --     --是自己的英雄
    --     if model:isOpenTanlentByHerovo(hero_vo) and hero_vo.ishaveTalentData and not hero_vo:ishaveTalentData() then
    --         controller:sender11099({{partner_id = hero_vo.partner_id}})
    --         return
    --     end
    -- end

    -- if hero_vo.talent_skill_list then
    --     --本地的
    --     for k,v in pairs(hero_vo.talent_skill_list) do
    --         local data = {}
    --         data.pos = k
    --         data.skill_id = v
    --         table_insert(skill_list, data)
    --     end
    -- elseif hero_vo.dower_skill then
    --     --网络的
    --     skill_list = hero_vo.dower_skill
    -- end
    -- table_sort(skill_list, function(a, b) return a.pos < b.pos end)
    -- if #skill_list > 0 then
    --     skill_tips:setVisible(false)
    --     local item_width = 104
    --     -- local x = -(item_width * #skill_list * 0.5) + item_width * 0.5 --居中的
    --     local x = 0 --左对齐的
    --     self.talent_skill_item_list = {}
    --     for i,v in ipairs(skill_list) do
    --         local config = Config.SkillData.data_get_skill(v.skill_id)
    --         if config then
    --             self.talent_skill_item_list[i] = SkillItem.new(true,true,true,0.7,nil,false)
    --             self.talent_skill_item_list[i]:setPosition((x + (i - 1)*item_width), 0)
    --             self.talent_skill_item_list[i]:setData(config)
    --             skill_node:addChild(self.talent_skill_item_list[i])
    --         end
    --     end
    -- else
    --     skill_tips:setVisible(true)

    -- end
end

-- 更新套装属性
function HeroTipsPanel:createSkillItem(x, y, parent)
    local item = SkillItem.new(true, false, true, 0.75, false,nil,true)
    parent:addChild(item)
    item:setPosition(x, y)
    return item
end

-- 灵魄技
function HeroTipsPanel:updateLingpo(hero_vo)
    print("---------skillID-----------------",hero_vo.star_step )
    print("---------skillID----break_lev-------------",hero_vo.break_lev )

    if hero_vo.artifact_list then
        for i = 1, 5 do
            local item = self.equip_item_list[i]
            local equip_vo = hero_vo.artifact_list[i]
            if equip_vo then
                if not equip_vo.config then
                    equip_vo.config=Config.ItemData.data_get_data(equip_vo.base_id)
                end
                self:setBaseLingpoAttrInfo(equip_vo, equip_vo.config)
            end
        end
    end
end 
function HeroTipsPanel:setBaseLingpoAttrInfo(data, item_config)
    if not data or not data.attr or not item_config then
        return
    end
    local artifact_config = Config.PartnerArtifactData.data_artifact_data[item_config.id]

    local lingpo_node_1 = self.equip_panel:getChildByName("lingpo"):getChildByName("lingpo_node_1")
    local lingpo_node_2 = self.equip_panel:getChildByName("lingpo"):getChildByName("lingpo_node_2")
    self.lingpo_item_1 = self:createSkillItem(0, 0, lingpo_node_1)
    self.lingpo_item_2 = self:createSkillItem(0, 0, lingpo_node_2)
    local skillList = artifact_config.skill_list
    for i = 1, #skillList do
        local skillID = skillList[i]
        local skill_config = Config.SkillData.data_get_skill(skillID)
        if skill_config then
            if i==1 then 
                self.lingpo_item_1:setData(skill_config)
            end 
            if i==2 then 
                self.lingpo_item_2:setData(skill_config)
            end 

        end
    end
  
  
end

-- 灵身技
function HeroTipsPanel:updateLingshen(hero_vo)

    local lingshen_node_1 = self.equip_panel:getChildByName("lingshen"):getChildByName("lingshen_node_1")
    -- self.lingshen_item_1 = self:createSkillItem(0, 0, lingshen_node_1)

    self.spriteId = controller:getHero_spiritbody_id(hero_vo)
    print("---------self.spriteId-----------------------",self.spriteId )
    local configs = Config.SpiritbodyData.data_spiritbody_risingstar_skill[self.spriteId]
    if configs and #configs>0 then 
        local _id = configs[hero_vo.break_lev][1]
        local skill_config = Config.SkillData.data_get_skill(_id)
        self.lingshen_item_1:setData(skill_config)
    end
end 



function HeroTipsPanel:setBaseLingshenAttrInfo(data, item_config)
    if not data or not data.attr or not item_config then
        return
    end
    local artifact_config = Config.PartnerArtifactData.data_artifact_data[item_config.id]

  
    local skillList = artifact_config.skill_list
    for i = 1, #skillList do
        local skillID = skillList[i]
        local skill_config = Config.SkillData.data_get_skill(skillID)
        if skill_config then
            if i==1 then 
                self.lingpo_item_1:setData(skill_config)
            end 
            if i==2 then 
                self.lingpo_item_2:setData(skill_config)
            end 

        end
    end
  
  
end


--神装
function HeroTipsPanel:updateHolyEquip(hero_vo)
    self.holy_equip_item_list = {}
    --装备
    local equip_vo_list = {}
    if hero_vo.holy_eqm ~= nil then
        --说明是网络返回的
        for i,v in ipairs(hero_vo.holy_eqm) do
            local item_config = Config.ItemData.data_get_data(v.base_id)
            if item_config then
                v.type = item_config.type
                equip_vo_list[v.type] = GoodsVo.New(v.base_id)
                if equip_vo_list[v.type]["initAttrData"] then
                    equip_vo_list[v.type]:initAttrData(v)
                end
                equip_vo_list[v.type]:setEnchantScore(0)
            end
        end
    elseif hero_vo.holy_eqm_list ~= nil then
        --说明是本地的 hero_vo
        for k,v in pairs(hero_vo.holy_eqm_list) do
            equip_vo_list[k] = v
        end
    end

    for k,item in pairs(self.holy_equip_item_list) do
        item:setData()
        if item.empty_icon then 
            item.empty_icon:setVisible(true)
        end
        item.equip_vo = nil
    end

    -- for i,equip_node in ipairs(self.holy_equip_node_list) do
    --     local equip_type = self.holy_equip_type_list[i] or i
    --     local equip_vo = equip_vo_list[equip_type]
    --     if self.holy_equip_item_list[equip_type] == nil then
    --         local item = BackPackItem.new(false,true,nil,1,false, true)
    --         equip_node:addChild(item,1)
    --         item:setPosition(cc.p(0,0))
    --         item:setScale(0.7)
    --         item:addBtnCallBack(function() 
    --             self:selectEquipVo(item:getData(), i) 
    --         end)
    --         local res= PathTool.getResFrame("hero",self.holy_equip_icon_name_list[equip_type])
    --         local empty_icon = createImage(item:getRoot(), res,60,60, cc.p(0.5,0.5), true, 10, false)
    --         item.empty_icon = empty_icon
    --         self.holy_equip_item_list[equip_type] = item    
    --     end

    --     if equip_vo then
    --         self.holy_equip_item_list[equip_type]:setData(equip_vo)
    --         self.holy_equip_item_list[equip_type].equip_vo = equip_vo
    --         if self.holy_equip_item_list[equip_type].empty_icon then
    --             self.holy_equip_item_list[equip_type].empty_icon:setVisible(false)
    --         end
    --     end
    -- end

    if self.holy_tips_label == nil then 
        self.holy_tips_label = createRichLabel(20, cc.c4b(0xe0,0xbf,0x98,0xff), cc.p(0.5, 0.5), cc.p(298.12, -284), nil, nil, 720)
        self.equip_panel:addChild(self.holy_tips_label)
    end
    
    local list = model:getHolyEquipSuitDes(equip_vo_list)
    if next(list) ~= nil then
        -- table_sort(list, function(a, b) return a.id < b.id end)
        local str = TI18N("已激活: ")
        for k,v in ipairs(list) do
            local suit_str = string_format("<img src='%s' scale=0.8 /> %s ", v.icon_res, v.name)
            str = str..suit_str
        end
        self.holy_tips_label:setString(str)
    else
        self.holy_tips_label:setString(TI18N("暂无组合套装"))
    end
    self.holy_tips_label:setVisible(false)
end


function HeroTipsPanel:close_callback()
    if self.hero_item then 
        self.hero_item:DeleteMe()
        self.hero_item = nil
    end
     if self.fight_label then
        self.fight_label:DeleteMe()
        self.fight_label = nil
    end

    if self.equip_item_list then
        for k,v in pairs(self.equip_item_list) do
            v:DeleteMe()
        end
    end   
    self.equip_item_list = nil
    if self.skill_item_list then
        for k,v in pairs(self.skill_item_list) do
            v:DeleteMe()
        end
    end
    self.skill_item_list = nil
    controller:openHeroTipsPanel(false)
end

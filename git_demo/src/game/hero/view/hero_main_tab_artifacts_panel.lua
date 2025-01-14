-- --------------------------------------------------------------------
-- @description:
--      竖版伙伴装备信息面板
-- <br/> 2018年11月20日
-- --------------------------------------------------------------------
HeroMainTabArtifactsPanel =
    class(
    "HeroMainTabArtifactsPanel",
    function()
        return ccui.Widget:create()
    end
)

local string_format = string.format
local controller = HeroController:getInstance()
local model = controller:getModel()
local table_insert = table.insert
local role_vo = RoleController:getInstance():getRoleVo()

function HeroMainTabArtifactsPanel:ctor()
    self:config()
    self:layoutUI()
    self:registerEvents()
end
function HeroMainTabArtifactsPanel:config()
    self.skill_items = {}
    --装备item 列表
    self.equip_item_list = {}
    self.base_list = {}
    self.skill_list = {}
    self.tab_list = {}

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
end

function HeroMainTabArtifactsPanel:layoutUI()
    local csbPath = PathTool.getTargetCSB("hero/hero_main_tab_artifacts_panel")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)
    self.top_panel= self.root_wnd:getChildByName("top_panel")
    self.tab_panel = self.root_wnd:getChildByName("tab_panel")
    self.skill_panel = self.root_wnd:getChildByName("skill_panel")

    self.Node_1 = self.root_wnd:getChildByName("Node_1")
    self.Node_1:setVisible(false)

    self.tip = self.root_wnd:getChildByName("tip")
    commonShowEmptyIcon(self.tip , true, {font_size = 22,scale = 0.8, text = TI18N("佩戴灵魄灵格\n可以获得大幅战力")})


    self.art_node_list = {}
    for i = 1, 5 do
        self.art_node_list[i] = self.top_panel:getChildByName("art_node" .. i)

        local item = BackPackItem.new(false, true, nil, 0.8, false)
        -- 引导需要
        --item:setName("guidesign_equip_item_"..i)
        self.art_node_list[i]:addChild(item, 1)
        local size = self.art_node_list[i]:getContentSize()


        if i ==1 then 
            item:setPosition(cc.p(size.width / 2 + 3, size.height / 2 -2))

        elseif i ==2 then 
            item:setPosition(cc.p(size.width / 2 - 4, size.height / 2 -2))

        elseif i ==3 then 
            item:setPosition(cc.p(size.width / 2 + 4, size.height / 2 +3))

        elseif i ==4 then 
            item:setPosition(cc.p(size.width / 2 - 3, size.height / 2 + 3 ))

        else
            item:setPosition(cc.p(size.width / 2, size.height / 2))

        end 

        local backgroud=item:getBackground()
        backgroud:setVisible(false)
        item:addCallBack(
            function()
                self:selectEquipByIndex(i)
            end
        )
        local res = PathTool.getResFrame("hero", self.equip_icon_name_list[equip_type])
        local empty_icon = createImage(item:getRoot(), res, 60, 60, cc.p(0.5, 0.5), true, 10, false)
        item.empty_icon = empty_icon

        self.equip_item_list[i] = item
    end
end

function HeroMainTabArtifactsPanel:updatePower()
    --self.fight_label:setNum(self.hero_vo.power)
end

-- @_type 参考 HeroConst.MainInfoTab 定义
function HeroMainTabArtifactsPanel:changeTabType(index)
    if self.cur_tab_index == index then
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
    self.Node_1:setVisible(false)

    local bg_res
    if self.cur_tab_index == 1 then
        self.tab_panel:setVisible(true)
        bg_res = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_44", false)
    elseif self.cur_tab_index == 2 then
        self.strong_panel:setVisible(true)
        bg_res = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_43", false)
    elseif self.cur_tab_index == 3 then
        self.awake_panel:setVisible(true)
        bg_res = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_42", false)
    end
    self.item_load = loadImageTextureFromCDN(self.background, bg_res, ResourcesType.single, self.item_load)
    --处理红点
    --self:updatePageRedPoint()
end

--事件
function HeroMainTabArtifactsPanel:registerEvents()
   
    EventManager:getInstance():Bind(
        HeroEvent.Hero_Data_Update,
        self,
        function(hero_vo)
            if not hero_vo or not self.hero_vo then
                return
            end
            if hero_vo.partner_id == self.hero_vo.partner_id then
                self:updateArtifactInfo(self.hero_vo)
            end
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
            self:updateArtifactInfo(self.hero_vo)
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

--@ index 索引  如果是装备可以是装备类型 equip_type 1-4 灵格  5 灵魄
function HeroMainTabArtifactsPanel:selectEquipByIndex(index)
    if not self.hero_vo then
        return
    end
    --5 ,6 是神器的位置
    local pos = index
    local equip_vo = self.hero_vo.artifact_list[pos]
    --策划要求 原本 6星解锁 改成 7星解锁 .原本6星的已有数据的保留
    -- if equip_vo == nil then
    --     local artifact_lock = self.artifact_lock_list[pos]
    --     if artifact_lock then
    --         if artifact_lock[1] == 'lev' then
    --             if self.hero_vo.lev < artifact_lock[2] then
    --                 message(string_format( TI18N("英雄%s级解锁"),artifact_lock[2]))
    --                 return
    --             end
    --         elseif artifact_lock[1] == 'star' then
    --             if self.hero_vo.star < artifact_lock[2] then
    --                 message(string_format( TI18N("英雄%s星解锁"),artifact_lock[2]))
    --                 return
    --             end
    --         end
    --     end
    -- end

    -- local equip_vo = self.hero_vo.artifact_list[pos]
    --默认都是主神器
    if equip_vo and next(equip_vo) ~= nil then
        -- 打开合成界面
        controller:openArtifactTipsWindow(true, equip_vo, PartnerConst.ArtifactTips.partner, self.hero_vo.partner_id, pos, false)
    else
        controller:openArtifactListWindow(true, pos, self.hero_vo.partner_id)
    end
end

-- function HeroMainTabArtifactsPanel:updateSkillItems(equip_vo)
--     if self.skill_items then
--         for i, item in pairs(self.skill_items) do
--             item:setVisible(false)
--         end
--     end
--     if not equip_vo then
--         return
--     end
--     for i, value in ipairs(equip_vo.extra) do
--         if value and value.extra_k and (value.extra_k == 1 or value.extra_k == 2 or value.extra_k == 8) then
--             local config = Config.SkillData.data_get_skill(value.extra_v)
--             self:updateSkillItem(i, config, self.tab_panel, cc.p(390 + 128 * (i - 1), 300))
--         end
--     end
-- end

--==============================--
--desc:创建技能显示单例
--@index:
--@parent:
--@return
--==============================--
function HeroMainTabArtifactsPanel:updateSkillItem(index, config, parent, pos)
    self.skill_items = self.skill_items or {}
    local skill = self.skill_items[index]
    if skill == nil then
        skill = SkillItem.new(true, true, true, 0.8,nil,nil,true)
        parent:addChild(skill)
        self.skill_items[index] = skill

        local name = createLabel(24, cc.c4b(108, 68, 58, 0xff), nil, pos.x +60, 145, "", parent, 1, cc.p(0, 0),TITLE_FONT)
        local desc = createRichLabel(18, cc.c4b(98, 83, 67, 0xff), cc.p(0, 1), cc.p( pos.x - 60, 94), 2, nil, 273)
        parent:addChild(desc)
        skill.nameAdd = name
        skill.descAdd = desc
    end
    skill:setVisible(true)
    skill:setPosition(pos)
    skill:setData(config)

    skill.nameAdd:setString(config.name)
    print(config.des)
    -- skill.descAdd:setString(transformTextToShort(config.des, 34))
    skill.descAdd:setString(config.des)
    return item
end


function HeroMainTabArtifactsPanel:setData(hero_vo)
    if not hero_vo then
        return
    end
    self.hero_vo = hero_vo
    self:updateInfo(hero_vo)
    self:updateRedPoint()
end

function HeroMainTabArtifactsPanel:updateRedPoint()
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
function HeroMainTabArtifactsPanel:updateArtifactRedPoint()
    --符文(神器) 红点
    if self.lock_list then
        for i, v in ipairs(self.artifact_lock_list) do
            if not self.lock_list[i] then
                local equip_vo = self.hero_vo.artifact_list[i]
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
function HeroMainTabArtifactsPanel:updateEachEquipRedPoint(equip_type)
    local equip_list = model:getHeroEquipList(self.hero_vo.partner_id)
    local item = self.equip_item_list[equip_type]
    local is_redpoint = HeroCalculate.checkSingleHeroEachPosEquipRedPoint(equip_type, equip_list[equip_type])
    item:showRedPoint(is_redpoint)
    return is_redpoint
end

function HeroMainTabArtifactsPanel:updateInfo(hero_vo)
    if not hero_vo then
        return
    end
    --装备信息
    -- local equip_list = model:getHeroEquipList(hero_vo.partner_id)
    -- for i,_type in ipairs(self.equip_type_list) do
    --     local equip_vo = equip_list[_type]
    --     local item = self.equip_item_list[_type]
    --     if equip_vo then
    --         item:setData(equip_vo)
    --         if item.empty_icon then
    --             item.empty_icon:setVisible(false)
    --         end
    --         item.equip_vo = equip_vo
    --     else
    --         item:setData()
    --         if item.empty_icon then
    --             item.empty_icon:setVisible(true)
    --         end
    --         item.equip_vo = nil
    --         item:setBackgroundRes(PathTool.getResFrame("hero", "hero_info_32"))
    --     end
    --     -- item:setBackgroundRes(PathTool.getResFrame("hero", "hero_info_32"))
    -- end

    self:updateArtifactInfo(hero_vo)
    self:updatePower()
 
end

--
function HeroMainTabArtifactsPanel:updateArtifactInfo(hero_vo)
    if self.base_list then
        for i, item in ipairs(self.base_list) do
            item:setVisible(false)
        end
        self.base_lable_index = 1
    end
    self.att_list={}
      self.skill_panel:setVisible(false)
      self.tab_panel:setVisible(false)
      self.Node_1:setVisible(true)

    if hero_vo.artifact_list then

        self.att_list = {}
        for i = 1, 5 do
            local item = self.equip_item_list[i]
            local equip_vo = hero_vo.artifact_list[i]
            -- if not self.lock_list[i] and equip_vo then
            --策划要求 原本 6星解锁 改成 7星解锁 .原本6星的已有数据的保留
            if equip_vo then
                print("------------updateArtifactInfo------------------")
                printLuaTable(equip_vo)
                
                item:setData({id = equip_vo.base_id})
                if item.empty_icon then
                    item.empty_icon:setVisible(false)
                end
                item.equip_vo = equip_vo
                item:setBackgroundOpacity(255)
               
                if not equip_vo.config then
                    equip_vo.config=Config.ItemData.data_get_data(equip_vo.base_id)
                end
                self:setBaseAttrInfo(equip_vo, equip_vo.config,i)
            else
                item:setData()
                if item.empty_icon then
                    item.empty_icon:setVisible(false)
                end
                item:setBackgroundOpacity(0)
                item.equip_vo = nil
             
            end
        end
    end

    self:setBaseAttrInfo2()

    local flag=self.tab_panel:isVisible()
    self.tip:setVisible(not flag)

    --self:updateArtifactRedPoint()
end



--==============================--
--desc:设置基础属性
--@return
--==============================--
function HeroMainTabArtifactsPanel:setBaseAttrInfo(data, item_config)
    if not data or not data.attr or not item_config then
        return
    end
    local artifact_config = Config.PartnerArtifactData.data_artifact_data[item_config.id]

    local socre_data = Config.PartnerArtifactData.data_artifact_attr_score[item_config.id]


    local index =1
    for i, v in pairs(artifact_config) do
        local attr_name = Config.AttrData.data_key_to_name_fun(i)
        if attr_name then
            if not  self.att_list[i] then 
                self.att_list[i] = 0 
            end 

            for k,m in pairs(self.att_list) do 
                if k == i then 
                    self.att_list[i] = m + v 
                end 
            end 
            index = index + 1
        end
        -- if socre_data then
        --     self.score_val = self.score_val + socre_data[attr_key] or 0
        -- end
    end

    -- local index =1
    -- for i, v in pairs(artifact_config) do
    --     local attr_name = Config.AttrData.data_key_to_name_fun(i)
    --     if attr_name then
    --         local attr_val = v --/ 1000 --v.attr_val/1000
    --         if not self.base_list[index] then
    --             self.base_list[index] = createRichLabel(22, cc.c4b(0xc1, 0xb7, 0xab, 0xff), cc.p(0, 0.5), cc.p(100, 285), nil, nil, 380)
    --             self.tab_panel:addChild(self.base_list[index])
    --         end
    --         local label = self.base_list[index]
    --         local _x = 100 + (index - 1) % 2 * 300
    --         local _y = 275 - math.floor((index - 1) / 2) * 36
    --         label:setPositionX(_x)
    --         label:setPositionY(_y)
    --         label:setVisible(true)

    --         local icon = PathTool.getAttrIconByStr(attr_key)
    --         local is_per = PartnerCalculate.isShowPerByStr(attr_key)
    --         if is_per == true then
    --             attr_val = (attr_val / 10) .. "%"
    --         end
    --         local attr_str = string_format("<img src='%s' scale=1 /> <div fontcolor=#eae8d6>       %s：</div><div fontcolor=#ffed89 outline=2,#451300>%s</div>", PathTool.getResFrame("common", icon), attr_name, attr_val)
    --         label:setString(attr_str)

    --         index = index + 1
    --         self.base_lable_index = self.base_lable_index + 1
    --         self.tab_panel:setVisible(true)
    --     end
    --     -- if socre_data then
    --     --     self.score_val = self.score_val + socre_data[attr_key] or 0
    --     -- end
    -- end
    
    local skillList = artifact_config.skill_list
    for i = 1, #skillList do
        local skillID = skillList[i]
        local skill_config = Config.SkillData.data_get_skill(skillID)
        if skill_config then
            self:updateSkillItem(i, skill_config, self.skill_panel, cc.p(128 + 322 * (i - 1), 155))
            self.skill_panel:setVisible(true)
        end
    end
  
  
end


--==============================--
--desc:设置基础属性
--@return
--==============================--
function HeroMainTabArtifactsPanel:setBaseAttrInfo2()
    if not self.att_list  then
        return
    end
   
    for k,m in pairs(self.att_list) do 
       if not self.base_list[self.base_lable_index] then
            self.base_list[self.base_lable_index] = createRichLabel(22, cc.c4b(234, 232, 214, 0xff), cc.p(0, 0.5), cc.p(100, 285), nil, nil, 380)

            local _num =  CommonNum.new(103, self.base_list[self.base_lable_index], 1, -2, cc.p(1, 0.5))
            _num:setPosition(200,20)
            _num:setName("num")
            self.tab_panel:addChild(self.base_list[self.base_lable_index])
        end
        local label = self.base_list[self.base_lable_index]
        local num = self.base_list[self.base_lable_index]:getChildByName("num")

        local _x = 120 + (self.base_lable_index - 1) % 2 * 270
        local _y = 275 - math.floor((self.base_lable_index - 1) / 2) * 36

        label:setPositionX(_x)
        label:setPositionY(_y)
        label:setVisible(true)
        local is_per = PartnerCalculate.isShowPerByStr(k)
        if is_per == true then
            if m > 0 then 
                m = "+"..(m / 10) .. "%"
            end
        else
            if m > 0 then 
                m = "+"..m
            end
        end
        local attr_name = Config.AttrData.data_key_to_name_fun(k)
        local attr_str = string_format("<div fontcolor=#eae8d6>%s</div>", attr_name)
        
        num:setNum(m)
        label:setString(attr_str)
        self.base_lable_index = self.base_lable_index + 1
        self.tab_panel:setVisible(true)
        self.Node_1:setVisible(false)

    end 
  
end
function HeroMainTabArtifactsPanel:setVisibleStatus(bool)
    self:setVisible(bool)
end

--移除
function HeroMainTabArtifactsPanel:DeleteMe()
    for i, v in pairs(self.skill_items) do
        if v then
            v:DeleteMe()
        end
    end

    EventManager:getInstance():UnBind(self)
end

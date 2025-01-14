-- --------------------------------------------------------------------
-- @description:
--      竖版伙伴升星信息面板
-- <br/> 2018年11月20日
-- --------------------------------------------------------------------
HeroMainTabUpgradeStarPanel =
    class(
    "HeroMainTabUpgradeStarPanel",
    function()
        return ccui.Widget:create()
    end
)

local color_data = {
    [1] = cc.c4b(0x64, 0x32, 0x23, 0xff) --觉醒消耗进阶石
}

local string_format = string.format
local controller = HeroController:getInstance()
local model = controller:getModel()
local table_insert = table.insert
local table_sort = table.sort
local role_vo = RoleController:getInstance():getRoleVo()

function HeroMainTabUpgradeStarPanel:ctor(parent)
    self:config()
    self:layoutUI()
    self:registerEvents()
end
function HeroMainTabUpgradeStarPanel:config()
    --材料列表
    self.hero_item_list = {}
    self.cost_item_list = {} -- 升星额外消耗的材料
end

function HeroMainTabUpgradeStarPanel:layoutUI()
    local csbPath = PathTool.getTargetCSB("hero/hero_main_tab_upgrade_star_panel")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    --读取文件的大小
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.tab_panel = self.root_wnd:getChildByName("tab_panel")
    self.top_panel = self.tab_panel:getChildByName("top_bg")

    self.star_skill_btn = self.tab_panel:getChildByName("star_skill_btn")
    --星星node
    self.left_star_node = self.tab_panel:getChildByName("left_star_node")
    self.right_star_node = self.tab_panel:getChildByName("right_star_node")

    self.star_arrow = self.tab_panel:getChildByName("star_arrow")

    --技能item node
    self.left_skill_node = self.tab_panel:getChildByName("left_skill_item_node")
    self.right_skill_node = self.tab_panel:getChildByName("right_skill_item_node")

    --材料 node
    self.item_node = self.tab_panel:getChildByName("item_node")
    

    self.attr_list = {}
    for i = 1, 6 do
        local param = self.tab_panel:getChildByName("param" .. i)
        local attr = {}
        attr.param = param
        attr.key = param:getChildByName("key")
        attr.key_1 = param:getChildByName("key_1")
        attr.left = param:getChildByName("left")
        attr.right = param:getChildByName("right")
        param:setVisible(false)
        self.attr_list[i] = attr
    end

    self.up_btn = self.tab_panel:getChildByName("up_btn")

    local size = self.up_btn:getContentSize()
    self.up_btn_label = createRichLabel(26, cc.c3b(255,238,202), cc.p(0.5, 0.5), cc.p(size.width * 0.5, size.height * 0.5+3),3,nil,nil,TITLE_FONT)
    self.up_btn:addChild(self.up_btn_label)

    -- local x, y = self.up_btn:getPosition()
    -- self.fuse_btn_label = createRichLabel(22,cc.c3b(36, 144, 3), cc.p(0.5,0.5),cc.p(x, y + 60))
    -- self.fuse_btn_label:setString(string_format("<div href=xxx>%s</div>", TI18N("前往英雄神殿")))
    -- self.tab_panel:addChild(self.fuse_btn_label)

    -- self.fuse_btn_label:addTouchLinkListener(function(type, value, sender, pos)
    --     if self.hero_vo then
    --         HeroController:getInstance():openHeroResetWindow(true, HeroConst.SacrificeType.eHeroFuse, self.hero_vo)

    --     end
    -- end, { "click", "href" })

    --  self.label_tip = self.tab_panel:getChildByName("label_tip")
    --  self.label_tip:setString(TI18N("(100%返还材料英雄升级、进阶消耗的金币、经验和进阶石)"))
end

--事件
function HeroMainTabUpgradeStarPanel:registerEvents()
    registerButtonEventListener(
        self.up_btn,
        function()
            self:_sendUpgradeStar()
        end,
        true,
        2
    )

    registerButtonEventListener(
        self.star_skill_btn,
        function()
            controller:openHeroUpgradeStarSkillEffectPanel(true,self.hero_vo )
        end,
        true,
        2
    )


    --英雄信息更新
    EventManager:getInstance():Bind(
        HeroEvent.Hero_Data_Update,
        self,
        function(hero_vo)
            if not hero_vo or not self.hero_vo then
                return
            end
            if self.hero_vo.partner_id == hero_vo.partner_id then
                self.is_hero_data_update = true
                self:checkUpdateCurrentInfo()
            end
        end
    )

    --删除英雄
    EventManager:getInstance():Bind(
        HeroEvent.Del_Hero_Event,
        self,
        function()
            if not self.hero_vo then
                return
            end
            self.is_del_hero_event = true
            self:checkUpdateCurrentInfo()
        end
    )

    --新增英雄
    EventManager:getInstance():Bind(
        HeroEvent.Hero_Data_Add,
        self,
        function()
            if not self.hero_vo then
                return
            end
            self:checkUpdateCurrentInfo(true)
        end
    )

    --添加英雄选择返回事件
    EventManager:getInstance():Bind(
        HeroEvent.Upgrade_Star_Select_Event,
        self,
        function()
            self:updateHeroItemInfo()
        end
    )

    --物品道具增加 判断红点
    EventManager:getInstance():Bind(
        BackpackEvent.ADD_GOODS,
        self,
        function(bag_code, temp_add)
            if not self.hero_vo then
                return
            end
            if bag_code ~= BackPackConst.Bag_Code.EQUIPS then
                self:checkUpdateCurrentInfo(true)
            end
        end
    )
    --物品道具删除 判断红点
    EventManager:getInstance():Bind(
        BackpackEvent.DELETE_GOODS,
        self,
        function(bag_code, temp_del)
            if not self.hero_vo then
                return
            end
            if bag_code ~= BackPackConst.Bag_Code.EQUIPS then
                self:checkUpdateCurrentInfo(true)
            end
        end
    )

    --物品道具改变 判断红点
    EventManager:getInstance():Bind(
        BackpackEvent.MODIFY_GOODS_NUM,
        self,
        function(bag_code, temp_list)
            if not self.hero_vo then
                return
            end
            if bag_code ~= BackPackConst.Bag_Code.EQUIPS then
                self:checkUpdateCurrentInfo(true)
            end
        end
    )

end

function HeroMainTabUpgradeStarPanel:checkUpdateCurrentInfo(is_not_check)
    if (self.is_hero_data_update and self.is_del_hero_event) or is_not_check then
        self:updateInfo(self.hero_vo)
    end
end

--发升星协议
function HeroMainTabUpgradeStarPanel:_sendUpgradeStar()
    if self.is_max_star then
        -- message(TI18N("该英雄已满星"))
        return
    end
    if self.hero_item_data_list and next(self.hero_item_data_list) ~= nil then
        local partner_id = self.hero_vo.partner_id
        local hero_list = {}
        local random_list = {}
        local dic_item_expend = {}
        for i, item in ipairs(self.hero_item_data_list) do
            local count = 0
            for k, v in pairs(item.dic_select_list) do
                count = count + 1
            end
            if count < item.count then
                message(TI18N("所需材料不足"))
                return
            end
            for k, v in pairs(item.dic_select_list) do
                if v.is_hero_hun then --是否英魂 参考 HeroUpgradeStarSelectPanel:initHeroList(dic_other_selected) 里面的定义
                    if v.good_vo then
                        if dic_item_expend[v.good_vo.base_id] == nil then
                            dic_item_expend[v.good_vo.base_id] = 1
                        else
                            dic_item_expend[v.good_vo.base_id] = dic_item_expend[v.good_vo.base_id] + 1
                        end
                    end
                else
                    local data = {}
                    data.partner_id = k
                    if item.bid == 0 then
                        --随机卡
                        table_insert(random_list, data)
                    else
                        --指定卡
                        table_insert(hero_list, data)
                    end
                end
            end
        end
        model:setUpgradeStarUpdateRecord(false)
        self.is_hero_data_update = false
        self.is_del_hero_event = false

        local item_list = {}
        for item_id, num in pairs(dic_item_expend) do
            local data = {}
            data.item_id = item_id
            data.num = num
            table_insert(item_list, data)
        end
        controller:sender11005(partner_id, hero_list, random_list, item_list)
    end
end

--更新选中英雄信息
function HeroMainTabUpgradeStarPanel:updateHeroItemInfo()
    if not self.hero_item_data_list then
        return
    end
    self.dic_other_selected = {}
    --过滤自己
    if self.hero_vo then
        self.dic_other_selected[self.hero_vo.partner_id] = self.hero_vo
    end
    for i, v in ipairs(self.hero_item_data_list) do
        if v.is_select then
            v.is_select = false
            local count = 0
            for k, vo in pairs(v.dic_select_list) do
                count = count + 1
                self.dic_other_selected[k] = vo
            end
            v.lev = string_format("%s/%s", count, v.count)
            if self.hero_item_list[i] then
                self.hero_item_list[i].num_label:setNum(v.lev)
                if count > 0 then
                    self.hero_item_list[i]:setHeadUnEnabled(false)
                else
                    self.hero_item_list[i]:setHeadUnEnabled(true)
                end
            end
        else
            for k, vo in pairs(v.dic_select_list) do
                self.dic_other_selected[k] = vo
            end
        end
    end
    self:updateCentreHeroItemRedPoint()
end

function HeroMainTabUpgradeStarPanel:setData(hero_vo)
    if not hero_vo then
        return
    end
    self.hero_vo = hero_vo
    self:updateInfo(hero_vo)
end

function HeroMainTabUpgradeStarPanel:updateInfo(hero_vo)
    if not hero_vo then
        return
    end
    --星星 HeroModel:createStar(num, star_con, star_setting, star_width)
    local star = hero_vo.star or 1
    -- self.left_star_setting = model:createStar(star, self.left_star_node, self.left_star_setting)
    -- self.right_star_setting = model:createStar(star + 1, self.right_star_node, self.right_star_setting)
 
    if not self.left_hero_name then 
        self.left_hero_name = createLabel(22,cc.c3b(74,35,28), nil ,0,-5,TI18N(""),self.left_star_node,0, cc.p(0.5,0.5))
        self.right_hero_name = createLabel(22,cc.c3b(74,35,28), nil ,0,-5,TI18N(""),self.right_star_node,0, cc.p(0.5,0.5))
    end 
    local _str = "星"
    local _num =hero_vo.star
  
    self.left_hero_name:setString(string.format("%s %d%s",hero_vo.name,_num,_str))
    local _str1 = "星"
    local _num_1 =hero_vo.star+1

    self.right_hero_name:setString(string.format("%s %d%s",hero_vo.name,_num_1,_str1))

    if self.left_head == nil then
        local cell = HeroExhibitionItem.new(1, true)
        cell:setExtendData({hide_star = false, can_click = false})
        self.left_star_node:addChild(cell)
        cell:setPosition(cc.p(0, 80))
        self.left_head = cell
        cell:setTouchEnabled(false)
    end
    if self.right_head == nil then
        local cell = HeroExhibitionItem.new(1, true)
        cell:setExtendData({hide_star = false, can_click = false})
        self.right_star_node:addChild(cell)
        cell:setPosition(cc.p(0, 80))
        cell:setTouchEnabled(false)

        self.right_head = cell
    end
    self.left_head:setData(hero_vo, true)
     local next_vo =   deepCopy(hero_vo)
     next_vo.star = next_vo.star+1 
    self.right_head:setData(next_vo, true)

    local key = getNorKey(hero_vo.bid, star)
    local star_config = Config.PartnerData.data_partner_star(key)
    local next_key = getNorKey(hero_vo.bid, star + 1)
    local next_star_config = Config.PartnerData.data_partner_star(next_key)

    if next_star_config == nil then
        --说明满星了
        self.star_arrow:setVisible(false)
        self.right_star_node:setVisible(false)
        if self.left_skill_item then
            self.left_skill_item:setVisible(false)
        end
        if self.right_skill_item then
            self.right_skill_item:setVisible(false)
        end
        --隐藏材料显示
        self.item_node:setVisible(false)
    else
        --6星以上逻辑
        if star >= model.hero_info_upgrade_star_param and star < model.hero_info_upgrade_star_param3 then
            self.right_star_node:setVisible(true)
            self.star_arrow:setVisible(true)

            if self.max_skill_item then
                self.max_skill_item:setVisible(false)
            end
        else
            --4 5星的逻辑
        end

        --升星材料
        self.item_node:setVisible(true)
        self:updateItemDataByConfig(next_star_config)
    end

    --更新属性
    self:updateAttrUI(star_config, next_star_config)
    self:updateBall(hero_vo)

    if hero_vo:isResonateHero() then
        --self.fuse_btn_label:setVisible(false)
        self.up_btn:setVisible(false)

        if self.consume_label then
            self.consume_label:setVisible(false)
        end
    else
        self.up_btn:setVisible(true)
        --按钮显示
        if next_star_config == nil then
            self.is_max_star = true
            self.up_btn_label:setString(string.format(TI18N("<div fontcolor=#ffeeca >%s</div>"), TI18N("已满级")))
        else
            self.is_max_star = false
            if star >= model.hero_info_upgrade_star_param then
                --self.fuse_btn_label:setVisible(false)
                --6星以上逻辑
                if next(next_star_config.other_expend) ~= nil then
                    local need_num = 0
                    -- 取出所需进阶石的数量
                    for k, v in pairs(next_star_config.other_expend) do
                        if v[1] == model.upgrade_star_cost_id then
                            need_num = v[2]
                            break
                        end
                    end
                    if need_num > 0 then
                        local item_data = Config.ItemData.data_get_data(model.upgrade_star_cost_id)
                        local count = BackpackController:getInstance():getModel():getItemNumByBid(item_data.id)

                        -- local str = string.format(TI18N("<img src=%s scale=0.35 visible=true /><div fontcolor=#ffed89 >%s%s</div>"), PathTool.getItemRes(item_data.icon), need_num, TI18N("升星"))
                        self.up_btn_label:setString("合灵")
                        if not self.consume_label then
                            self.consume_label = createRichLabel(20, cc.c4b(0x4a, 0x23, 0x1c, 0xff), cc.p(0.5, 0.5), nil, nil, nil, 1000)
                            self.tab_panel:addChild(self.consume_label)
                        end
                        if self.consume_label then
                            self.consume_label:setVisible(true)
                            local x, y = self.up_btn:getPosition()
                            self.consume_label:setPosition(x, y + 45)
                            local str = string.format(TI18N("<img src=%s scale=0.25 visible=true /> %s/%s"), PathTool.getItemRes(item_data.icon),need_num, MoneyTool.GetMoneyString(count) )
                            self.consume_label:setString(str)
                        end
                    else
                        self.up_btn_label:setString(string.format(TI18N("<div fontcolor=#ffeeca >%s</div>"), TI18N("合灵")))
                    end
                else
                    self.up_btn_label:setString(string.format(TI18N("<div fontcolor=#ffeeca >%s</div>"), TI18N("合灵")))
                end
            else
                --self.fuse_btn_label:setVisible(true)
                if self.consume_label then
                    self.consume_label:setVisible(false)
                end

                -- 4 5星的逻辑
                self.up_btn_label:setString(string.format(TI18N("<div fontcolor=#ffeeca >%s</div>"), TI18N("合灵")))
            end
        end
        --
        --按钮的红点
        local is_redpoint = HeroCalculate.checkSingleHeroUpgradeStarRedPoint(hero_vo)
        addRedPointToNodeByStatus(self.up_btn, is_redpoint, 5, 5)
    end
end

--策划说默认拿第一个不同的..
--获取第一个不同的技能 返回左右两个 .满星返回一个
function HeroMainTabUpgradeStarPanel:getFirstSkillID(star_config, next_star_config)
    if next_star_config == nil then
        if star_config then
            for i, v in ipairs(star_config.skills) do
                if v[1] ~= 1 then
                    return v[2]
                end
            end
        end
        return nil
    end
    if star_config and next_star_config then
        local left_skill_id
        --[序号] = 技能id
        local dic_left_skill = {}
        for i, v in ipairs(star_config.skills) do
            dic_left_skill[v[1]] = v[2]
        end
        for i, v in ipairs(next_star_config.skills) do
            if v[1] ~= 1 then
                if dic_left_skill[v[1]] and dic_left_skill[v[1]] ~= v[2] then
                    return dic_left_skill[v[1]], v[2]
                end
            end
        end
    end
    return nil
end
--创建技能item
function HeroMainTabUpgradeStarPanel:createSkillItem(parent, position, skill_id)
    local skill_item = SkillItem.new(true, true, true, 0.8, true,nil,true)
    skill_item:setPosition(position)
    skill_item:setData({skill_id = skill_id})
    parent:addChild(skill_item)
    return skill_item
end

--更新升星物品材料
function HeroMainTabUpgradeStarPanel:updateItemDataByConfig(star_config)
    if not star_config then
        return
    end
    self.hero_item_data_list = {}
    --红点条件list
    local conditions_list = {}
    --记录已选id [partner_id] = hero_vo
    self.dic_other_selected = {}
    --过滤自己
    if self.hero_vo then
        self.dic_other_selected[self.hero_vo.partner_id] = self.hero_vo
    end
    -- local expend = star_config.expend1[1]
    -- if expend then --主卡
    --     --指定的 {10402,4,1} : 10402: 表示bid, 4: 表示星级 1:表示数量
    --     self.hero_item_data_list[index] = self:getHeroData(expend[1], expend[2], expend[3])
    -- end

    --指定的 {10402,4,1} : 10402: 表示bid, 4: 表示星级 1:表示数量
    local index = 1
    for i, expend in ipairs(star_config.expend2) do
        self.hero_item_data_list[index] = self:getHeroData(expend[1], expend[2], expend[3])
        conditions_list[index] = {}
        conditions_list[index][expend[1]] = {}
        conditions_list[index][expend[1]][expend[2]] = expend[3]
        index = index + 1
    end
    --随机的 {1,4,2} : 1 表示阵营  4: 表示星级 2表示数量
    for i, expend in ipairs(star_config.expend3) do
        self.hero_item_data_list[index] = self:getHeroData(nil, expend[2], expend[3], expend[1])
        conditions_list[index] = {}
        conditions_list[index][expend[1]] = {}
        conditions_list[index][expend[1]][expend[2]] = expend[3]
        index = index + 1
    end

    for i, item in ipairs(self.hero_item_list) do
        item:setVisible(false)
    end
    local listLen = #self.hero_item_data_list
    local widthTotal = HeroExhibitionItem.Width * 0.8
    if listLen > 1 then
        widthTotal = HeroExhibitionItem.Width * 0.8 * listLen + (10 * listLen - 1)
    end
    for i, hero_vo in ipairs(self.hero_item_data_list) do
        if self.hero_item_list[i] == nil then
            self.hero_item_list[i] = HeroExhibitionItem.new(0.8, true)
            self.hero_item_list[i]:setPosition(-widthTotal / 2 + HeroExhibitionItem.Width / 2 * 0.8 + (i - 1) * (HeroExhibitionItem.Width * 0.8 + 10), 0)
            self.hero_item_list[i]:addCallBack(
                function()
                    self:_onClickItemData(i)
                end
            )
            self.item_node:addChild(self.hero_item_list[i])
        end
        self.hero_item_list[i]:setVisible(true)
        if hero_vo.bid == 0 then
            --随机卡的头像id
            local default_head_id = model:getRandomHeroHeadByQuality(hero_vo.star)
            self.hero_item_list[i]:setData(hero_vo)
            self.hero_item_list[i]:setDefaultHead(default_head_id)
            -- self.hero_item_list[i]:setHeroName(true, string_format(TI18N("%s星英雄"), hero_vo.star))
        else
            self.hero_item_list[i]:setData(hero_vo)
            -- self.hero_item_list[i]:setHeroName(true, hero_vo.name)
        end

        self.hero_item_list[i]:setHeadUnEnabled(true)
    end

    -- 额外材料
    for k, item in pairs(self.cost_item_list) do
        item:setVisible(false)
    end

    local start_index = #self.hero_item_data_list
    if star_config.other_expend then
        for i, v in ipairs(star_config.other_expend) do
            local bid = v[1]
            local need_num = v[2]
            if bid ~= model.upgrade_star_cost_id then
                local item = self.cost_item_list[i]
                if not item then
                    item = BackPackItem.new(false, true, false, 0.8)
                    self.item_node:addChild(item)
                    self.cost_item_list[i] = item
                end
                item:setPosition((start_index + i - 1) * (BackPackItem.Width * 0.8 + 10), 0)
                local have_num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(bid)
                item:setBaseData(bid)
                item:setNeedNum(need_num, have_num, 1, true, 2)
                if need_num > have_num then
                    item:setDefaultTip(true, true)
                else
                    item:setDefaultTip()
                end
                item:setVisible(true)
            end
        end
    end

    self:initHeroListByMatchInfo(conditions_list)
    self:updateCentreHeroItemRedPoint()
end

--初始化英雄列表匹配信息
function HeroMainTabUpgradeStarPanel:initHeroListByMatchInfo(conditions_list)
    local hero_list = model:getHeroList()

    self.conditions_hero_list = {}
    for k, hero in pairs(hero_list) do
        for i, conditions in ipairs(conditions_list) do
            if self.conditions_hero_list[i] == nil then
                self.conditions_hero_list[i] = {}
            end

            if self.hero_item_data_list[i].bid == 0 then
                --表示随机卡 0表示全部阵营
                if conditions[0] then
                    if conditions[0][hero.star] then
                        table_insert(self.conditions_hero_list[i], hero)
                    end
                else
                    if conditions[hero.camp_type] and conditions[hero.camp_type][hero.star] ~= nil then
                        table_insert(self.conditions_hero_list[i], hero)
                    end
                end
            else
                --指定卡
                if conditions[hero.bid] and conditions[hero.bid][hero.star] then -- 指定卡要剔除自己
                    if self.hero_vo and self.hero_vo.partner_id ~= hero.partner_id then
                        table_insert(self.conditions_hero_list[i], hero)
                    end
                end
            end
        end
    end

    --新加需求.自动填满指定定的位置的英雄
    -- if self.hero_vo and self.hero_vo.red_point[HeroConst.RedPointType.eRPStar] then
    self.dic_other_selected = {}
    if self.hero_vo then
        self.dic_other_selected[self.hero_vo.partner_id] = self.hero_vo
    end
    for i, v in ipairs(self.hero_item_data_list) do
        --策划要求指定才需要填充
        if v.bid ~= 0 then
            if self.conditions_hero_list[i] and #self.conditions_hero_list[i] > 0 then
                local sort_func = SortTools.tableCommonSorter({{"lev", false}, {"id", true}})
                table_sort(self.conditions_hero_list[i], sort_func)
                local count = 0
                for _, hero_vo in ipairs(self.conditions_hero_list[i]) do
                    if self.dic_other_selected[hero_vo.id] == nil and not hero_vo:checkHeroLockTips(true, nil, true) then
                        v.dic_select_list[hero_vo.id] = hero_vo
                        count = count + 1
                        if count >= v.count then
                            break
                        end
                    end
                end
                if count < v.count then
                    --说明不够..就不显示了
                    v.dic_select_list = {}
                else
                    for k, v in pairs(v.dic_select_list) do
                        self.dic_other_selected[k] = v
                    end
                    v.lev = string_format("%s/%s", count, v.count)
                    if self.hero_item_list[i] then
                        self.hero_item_list[i].num_label:setNum(v.lev)
                        if count > 0 then
                            self.hero_item_list[i]:setHeadUnEnabled(false)
                        else
                            self.hero_item_list[i]:setHeadUnEnabled(true)
                        end
                    end
                end
            end
        end
    end
    -- end

    local list = BackpackController:getInstance():getModel():getHeroHunList()
    for k, good_vo in pairs(list) do
        if good_vo.config then
            for i, conditions in ipairs(conditions_list) do
                if self.conditions_hero_list[i] == nil then
                    self.conditions_hero_list[i] = {}
                end
                if self.hero_item_data_list[i].bid == 0 then
                    --表示随机卡 0表示全部阵营
                    local camp_type = good_vo.config.camp_type
                    local star = good_vo.config.eqm_jie
                    if conditions[camp_type] and conditions[camp_type][star] ~= nil then
                        for j = 1, good_vo.quantity do
                            local data = {}
                            data.id = -(j + camp_type * 10)
                            data.partner_id = data.id
                            data.good_vo = good_vo
                            table_insert(self.conditions_hero_list[i], data)
                        end
                    end
                end
            end
        end
    end
end

--计算中间item红点显示
function HeroMainTabUpgradeStarPanel:updateCentreHeroItemRedPoint()
    if not self.conditions_hero_list then
        return
    end
    if not self.dic_other_selected then
        return
    end
    for i, item in ipairs(self.hero_item_list) do
        --模拟的hero_vo数据
        local hero_vo = self.hero_item_data_list[i]
        local conditions_list = self.conditions_hero_list[i] or {}
        if hero_vo then
            local count = 0
            for k, v in pairs(hero_vo.dic_select_list) do
                count = count + 1
            end
            --已经填满了就不显示红点了
            if count < hero_vo.count then
                --随机卡的 --指定卡 逻辑一样的
                local num = hero_vo.count
                for i, each_hero in ipairs(conditions_list) do
                    --自已选的.和 别人没选的 都算数
                    if hero_vo.dic_select_list[each_hero.id] or self.dic_other_selected[each_hero.id] == nil then
                        num = num - 1
                        if num == 0 then
                            break
                        end
                    end
                end
                --说明数量够 显示红点
                local status = (num <= 0)
                item:showRedPoint(status, 8, 8)
            else
                item:showRedPoint(false)
            end
        end
    end
end

--更新球
function HeroMainTabUpgradeStarPanel:updateBall(hero_vo)
    local _light_status = {}
    

    for i = 1, 3 do
        local small_ball_0 = self.top_panel:getChildByName("ball_" .. i)

        local small_ball = self.top_panel:getChildByName("ball_" .. i .. "_0")
        small_ball:setVisible(false)
        local show = false
        local _res = PathTool.getResFrame("hero","hl_hero_1030") -- 2 - 4 
        if hero_vo.star_skill_lev <= 4 then 
            _res = PathTool.getResFrame("hero","hl_hero_1030") -- 2 - 4 
            if i < hero_vo.star_skill_lev then 
                show = true 
            end
            small_ball:setScale(1)
            small_ball:setContentSize(cc.size(56,56))
        elseif hero_vo.star_skill_lev > 4 then 
            _res = PathTool.getResFrame("hero","hl_hero_1042") -- 2 - 4 
            if i < (hero_vo.star_skill_lev -3) then 
                show = true 
            end
            small_ball:setScale(1.2)
            small_ball:setContentSize(cc.size(30,47))

        end 
        small_ball:loadTexture(_res, LOADTEXT_TYPE_PLIST)
        small_ball:setVisible(show)
        small_ball_0:setVisible(not show)

    end
    if hero_vo.star < 5 then
        return
    end

    local partner_config = Config.PartnerData.data_partner_base[hero_vo.bid]

    if partner_config.star_skill then
        local config = Config.SkillData.data_get_skill(partner_config.star_skill + hero_vo.star - 5)
    
        self.ballIcon = SkillItem.new(true, false, true, 2, false,nil,true)
        self.ballIcon:setData(config)
        self.top_panel:addChild(self.ballIcon)
        self.ballIcon:setPosition(349, 315)
        setChildUnEnabled(false,self.ballIcon) 
        if hero_vo.star_skill_lev == 0 then
            setChildUnEnabled(true,self.ballIcon) 
        end
    end
end

--点击材料数据
function HeroMainTabUpgradeStarPanel:_onClickItemData(index)
    if not self.hero_item_data_list[index] then
        return
    end
    if not self.hero_vo then
        return
    end
    --标志点击了那个
    self.hero_item_data_list[index].is_select = true
    --被其他人选择的列表 [id] = hero_vo 模式
    local dic_other_selected = {}
    --把自己也过滤
    dic_other_selected[self.hero_vo.partner_id] = self.hero_vo
    for i, item in ipairs(self.hero_item_data_list) do
        if i ~= index then
            for k, v in pairs(item.dic_select_list) do
                dic_other_selected[k] = v
            end
        end
    end

    local setting = {}
    if self.hero_item_data_list[index].bid == 0 and self.hero_item_data_list[index].star == 5 then
        -- 表示随机卡
        setting.self_mark_bid = self.hero_vo.bid
    end

    controller:openHeroUpgradeStarSelectPanel(true, self.hero_item_data_list[index], dic_other_selected, HeroConst.SelectHeroType.eUpgradeStar, setting)
end

--更新属性ui
function HeroMainTabUpgradeStarPanel:updateAttrUI(star_config, next_star_config)
    -- print("----------------updateAttrUI-----------------")
    -- printLuaTable(next_star_config)
    if next_star_config == nil then
        for i, attr in ipairs(self.attr_list) do
            attr.param:setVisible(false)
        end
    else
        --根据csd那边算出来的
        local y = 302
        local h = 96
        local star = self.hero_vo.star or 0
        local show_count = 2 + #next_star_config.attr
        if show_count <= 0 then
            --条件不满足
            for i, attr in ipairs(self.attr_list) do
                attr.param:setVisible(false)
            end
            return
        elseif show_count > 6 then --容错的
            show_count = 6
        end

        -- 属性列表
        local _attr_left = {}
        _attr_left[1] = "攻击成长"
        _attr_left[2] = "生命成长"

        local curren_index =0 
        local curren_next_index =0 

        for i, attr in ipairs(self.attr_list) do
            attr.param:setVisible(true)
            attr.left:setVisible(false)
            attr.key_1:setVisible(false)
            attr.right:setVisible(false)
            attr.key:setVisible(false)
            if i <= #star_config.attr and i <= #next_star_config.attr  then 
                local data_listL = star_config.attr[i]
                if data_listL then
                    attr.left:setVisible(true)
                    attr.key:setVisible(true)
                    attr.left:setString( "+"..data_listL[2])
                    local nameTxt = self:getAttrSting(data_listL[1])
                    attr.key:setString(nameTxt)
                end
            else
                curren_index = curren_index +1
                if curren_index<=2 then 
                    attr.left:setVisible(true)
                    attr.key:setVisible(true)
                    attr.key:setString(_attr_left[curren_index])
                    if curren_index ==1 then 
                        attr.left:setString( "+"..GetPreciseDecimal(star_config.add_atk/1000,1).."%")
                    else
                        attr.left:setString( "+"..GetPreciseDecimal(star_config.add_hp/1000,1).."%")
                    end 
                end 

            end 
           if i <= #next_star_config.attr  then 
                local data_listR = next_star_config.attr[i]
                if data_listR then
                    attr.right:setVisible(true)
                    attr.key_1:setVisible(true)
                    attr.right:setString( "+"..data_listR[2])
                    local nameTxt = self:getAttrSting(data_listR[1])
                    attr.key_1:setString(nameTxt)
                end
            else
                curren_next_index = curren_next_index +1
                if curren_next_index<=2 then 
                    attr.key_1:setString(_attr_left[curren_next_index] )
                    attr.right:setVisible(true)
                    attr.key_1:setVisible(true)
                    if curren_next_index ==1 then 
                        attr.right:setString( "+"..GetPreciseDecimal(next_star_config.add_atk/1000,1).."%")
                    else
                        attr.right:setString( "+"..GetPreciseDecimal(next_star_config.add_hp/1000,1).."%")
                    end 
                end 
            end 
            -- local data_list =     -- next_star_config.attr_show[i]
            -- if data_list == nil then
            --     local data_listL = star_config.attr[i - #next_star_config.attr_show]
            --     local data_listR = next_star_config.attr[i - #next_star_config.attr_show]

            --     if data_listL then
            --         attr.left:setVisible(true)
            --         attr.key:setVisible(true)
            --         attr.left:setString(data_listL[2])
            --         local nameTxt = self:getAttrSting(data_listL[1])
            --         attr.key:setString(nameTxt)
            --     end
            --     if data_listR then
            --         attr.right:setVisible(true)
            --         attr.key_1:setVisible(true)
            --         attr.right:setString(data_listR[2])
            --         local nameTxt = self:getAttrSting(data_listR[1])
            --         attr.key_1:setString(nameTxt)
            --     end
            --     if data_listR == nil and data_listL == nil then
            --         return
            --     end
            -- end

            -- if data_list then
            --     local p_y = y - ((i - 1) * param_height + param_height * 0.5)
            --     if star >= model.hero_info_upgrade_star_param and star < model.hero_info_upgrade_star_param2 then
            --         --6星以上逻辑  485 -->根据csd那边算出来的
            --         --attr.param:setPosition(485, p_y)
            --     else
            --         -- 4 5, 11星的逻辑  12星的逻辑
            --         --attr.param:setPosition(self.size.width * 0.5, p_y)
            --     end
            --     attr.key:setVisible(true)
            --     attr.key_1:setVisible(true)
            --     if data_list[2] then
            --         attr.left:setVisible(true)
            --         attr.right:setVisible(true)
            --         attr.left:setString(data_list[2])
            --         attr.right:setString(data_list[3])
            --     end
            --     attr.key:setString(data_list[1])
            --     attr.key_1:setString(data_list[1])
            -- end
        end
    end
end

function HeroMainTabUpgradeStarPanel:getAttrSting(str)
    if str == "hp_max" then
        str = "hp"
    end

    local attr_name = Config.AttrData.data_key_to_name[str]
    return attr_name
end

--@ bid 英雄bid 特殊判断 如果 == nil 说明是随机卡
--@ star 星级
--@ count 数量
--@ camp_type 阵营  如果是随机卡.此一定需要有值
function HeroMainTabUpgradeStarPanel:getHeroData(bid, star, count, camp_type)
    --模拟 hero_vo 需要的数据
    local data = {}
    data.star = star or 0
    data.count = count or 0
    data.lev = string_format("%s/%s", 0, count)

    if bid == nil then
        data.bid = 0 --表示随机卡
        data.camp_type = camp_type
    else
        local base_config = Config.PartnerData.data_partner_base[bid]
        if base_config then
            data.bid = bid
            data.camp_type = base_config.camp_type
            data.name = base_config.name
        else
            return nil
        end
    end
    --当前选中的英雄列表 [id] == hero_vo 模式
    data.dic_select_list = {}
    return data
end

function HeroMainTabUpgradeStarPanel:setVisibleStatus(bool)
    self:setVisible(bool)
end

--移除
function HeroMainTabUpgradeStarPanel:DeleteMe()
    if self.left_skill_item then
        self.left_skill_item:DeleteMe()
        self.left_skill_item = nil
    end
    if self.right_skill_item then
        self.right_skill_item:DeleteMe()
        self.right_skill_item = nil
    end
    if self.max_skill_item then
        self.max_skill_item:DeleteMe()
        self.max_skill_item = nil
    end
    if self.hero_item_list then
        for i, v in ipairs(self.hero_item_list) do
            v:DeleteMe()
        end
        self.hero_item_list = nil
    end
    if self.cost_item_list then
        for i, v in ipairs(self.cost_item_list) do
            v:DeleteMe()
        end
        self.cost_item_list = nil
    end
    if self.left_head then
        self.left_head:DeleteMe()
    end
    if self.right_head then
        self.right_head:DeleteMe()
    end
    EventManager:getInstance():UnBind(self)
end

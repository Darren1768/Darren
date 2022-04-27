-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      快速战斗
-- --------------------------------------------------------------------

BattlDramaQuickBattleWindow = BattlDramaQuickBattleWindow or BaseClass(BaseView)

local controller = BattleDramaController:getInstance()
local model = BattleDramaController:getInstance():getModel()
local table_insert = table.insert

function BattlDramaQuickBattleWindow:__init()
    self.layout_name = "battledrama/battle_drama_quick_battle_windows"
    self.win_type = WinType.Big
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.quick_battle_status = 0 --0是免费,1是有道具,2是用钱3是次数用完不能点击
    self.res_list = {
        { path = PathTool.getSingleImgForDownLoad("bigbg","bigbg_50"), type = ResourcesType.single },
        { path = PathTool.getPlistImgForDownLoad("battledrama","battledrama"), type = ResourcesType.plist },

    }
end

function BattlDramaQuickBattleWindow:open_callback()
   
    self.main_container = self.root_wnd:getChildByName("root")
    self.background = self.root_wnd:getChildByName("background")
    self.bg = self.main_container:getChildByName("Image_bg")
    self.info_container = self.main_container:getChildByName("info_container")
    self.background:setScale(display.getMaxScale())

      -- n女孩
      self.gril_sprite = self.main_container:getChildByName("gril_sprite")
      self.gril_sprite:setPosition(cc.p(620,875))

      self.Image_3 = self.main_container:getChildByName("Image_3")

    local type = MainSceneController:getInstance():getMainScene():getCurTimeType()
    print("---------------type--------1111111111-------",type)
    if type == 1 then
        self.bg:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "hl_quickBattleBg2",false), LOADTEXT_TYPE)
        self.bg:setContentSize(cc.size(720,550))
        loadSpriteTexture( self.gril_sprite, PathTool.getResFrame("battledrama", "hl_battledrame_1024"), LOADTEXT_TYPE_PLIST)

        self.Image_3:loadTexture(PathTool.getResFrame("battledrama", "quickK1"),LOADTEXT_TYPE_PLIST)
    
    else
        self.bg:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "hl_quickBattleBg3",false), LOADTEXT_TYPE)
        self.bg:setContentSize(cc.size(720,550))
        self.bg:setPositionY(618)
        loadSpriteTexture( self.gril_sprite, PathTool.getResFrame("battledrama", "hl_battledrama_1026"), LOADTEXT_TYPE_PLIST)

        self.gril_sprite:setPositionX(616)

        self.Image_3:loadTexture(PathTool.getResFrame("battledrama", "quickK2"),LOADTEXT_TYPE_PLIST)

    end
    self:playEnterAnimatianByObj(self.main_container, 2)
    self.close_btn = self.main_container:getChildByName("close_btn")
    self.holid_up = self.main_container:getChildByName("holid_up")
    self.holid_up:getChildByName("Text_1"):setString(TI18N("活动UP!"))
    self.holid_up:setVisible(false)
    self.quick_num_label = createRichLabel(24, 175, cc.p(0.5, 0.5), cc.p(566,426), nil, nil, 1000)
    self.main_container:addChild(self.quick_num_label)
    self.title = self.main_container:getChildByName("title")
    self.title_sprite = self.main_container:getChildByName("title_sprite")
    self.time_type_title = self.main_container:getChildByName("use_title")
    self.quick_btn =self.main_container:getChildByName("source_btn")-- createTypeButton(self.main_container, TI18N(""), self.main_container:getContentSize().width/2,426, ButtonType.yellow)
   -- self.quick_btn:enableOutline(cc.c4b(0x76,0x45,0x19,0xff), 2)

    self.source_btn = self.main_container:getChildByName("source_btn")
  --  self.source_btn:setVisible(false)
    --self.source_btn:getChildByName("label"):setString(TI18N("获取快速作战券"))

    self.main_container:getChildByName("use_title"):setString(TI18N("本关怪物掉落："))
    self.time_value = self.main_container:getChildByName("time_value")
    self.explain_btn = self.main_container:getChildByName("explain_btn")

    self.quick_desc = createRichLabel(24, 175, cc.p(0, 1), cc.p(236,870), 5, nil, 410)
    self.main_container:addChild(self.quick_desc)

  

    -- self.desc:setString(TI18N("使用快速作战券,可直接获得2小时\n的经验和物品收益"))
    self.btn_buy_quick = self.main_container:getChildByName("btn_buy_quick")
    self.btn_buy_quick:getChildByName("Text_2"):setString(TI18N("前往激活"))
    self.btn_buy_quick:setVisible(false)

    self.list_view = self.main_container:getChildByName("list_view")
    if self.item_scrollview == nil then
        local size = self.list_view:getContentSize()
        local setting = {
            item_class = BatttleQuickItem,      -- 单元类
            start_x = 12,                  -- 第一个单元的X起点
            space_x =6,                    -- x方向的间隔
            start_y = 10,                    -- 第一个单元的Y起点
            space_y = 8,                   -- y方向的间隔
            item_width = 112,               -- 单元的尺寸width
            item_height = 112,              -- 单元的尺寸height
            row = 1,                        -- 行数，作用于水平滚动类型
            col = 5,                         -- 列数，作用于垂直滚动类型
        }
        self.item_scrollview = CommonScrollViewLayout.new(self.list_view, cc.p(0, 0) , ScrollViewDir.vertical, ScrollViewStartPos.top, size, setting)
    end
    
    -- -- 引导需要
    -- local button = self.quick_btn:getButton()
    -- button:setName("guidesign_quick_btn")
end
function BattlDramaQuickBattleWindow:createItemList(item_list)
    if item_list == nil or next(item_list) == nil then return end
    -- if self.scroll_view == nil then
    --     local size = self.list_view:getContentSize()
    --     local setting = {
    --         item_class = BattlDramaHookRewardItem,
    --         start_x = 12,
    --         space_x = 6,
    --         start_y = 10,
    --         space_y = 8,
    --         item_width = 112,
    --         item_height = 112,
    --         row = 4,
    --         col = 5,
    --         delay = 6,
    --         need_dynamic = true
    --     }
    --     self.scroll_view = CommonScrollViewLayout.new(self.list_view, cc.p(0, 0) , ScrollViewDir.vertical, ScrollViewStartPos.top, size, setting)
    -- end     
    local list = {}
    local num = 0
    for i,v in ipairs(item_list) do
        -- num = v.num
        -- if quickdata and quickdata.fast_combat_add_time and quickdata.fast_combat_add_time > 0 then
        --     num = num + math.floor(num * quickdata.fast_combat_add_time / hook_max_time)
        -- end
        table_insert( list, {bid = v.bid, num = v.num} )
    end
  --  self.item_scrollview:setData(list)       
    self.item_scrollview:setData(list)
end
function BattlDramaQuickBattleWindow:openRootWnd(data)
    playOtherSound("c_get") 
    self.can_click = false
    delayRun(self.main_container, 0.3, function() 
        self.can_click = true
    end)

    if data then
        self.result_type = data.type   -- 1.是挂机收益 2.是快速作战

        if self.result_type == 1 then
            self.time_type_title:setString(TI18N("挂机收益："))
            -- self.title:setString(TI18N("挂机收益"))
            loadSpriteTexture( self.title_sprite , PathTool.getResFrame("battledrama", "battlaT1"), type)

        elseif self.result_type == 2 then
            self.time_type_title:setString(TI18N("快速作战："))
            -- self.title:setString(TI18N("快速战斗"))
            loadSpriteTexture( self.title_sprite , PathTool.getResFrame("battledrama", "battleT2"), type)

        end
        self:guajiShowItem()

     --   self:handleEffect(true)
        self:createItemList(data.items)
        self:setBaseInfo(data)

        -- 暂时屏蔽vip字样显示
        -- self.vip_notice_label:setString(TI18N("点击空白区域关闭界面"))
        -- if data.vip_buff then
        --     if data.vip_buff == 0 then
        --         self.vip_notice_label:setString(TI18N("vip可获额外收益加成"))
        --     else
        --         if data.honor_buff and data.honor_buff ~= 0 then
        --             self.vip_notice_label:setString(TI18N("获得来自vip、称号的收益加成"))
        --         else
        --             self.vip_notice_label:setString(TI18N("获得来自vip的收益加成"))
        --         end
        --     end
        -- end
    end
end

function BattlDramaQuickBattleWindow:setBaseInfo(data)
    if data == nil then return end

   -- self.level:setString("LV."..data.new_lev)
    self.time_value:setString(TimeTool.GetTimeFormat(data.time))

    -- local old_lev = data.old_lev
    -- local old_exp = data.old_exp
    -- local old_config = Config.RoleData.data_role_attr[old_lev]
    -- local new_lev = data.new_lev
    -- local new_exp = data.new_exp
    -- local new_config = Config.RoleData.data_role_attr[new_lev]
    -- if old_config == nil or new_config == nil then return end

    -- -- 当前经验
    -- self.progress_val:setString(new_exp.."/"..new_config.exp_max)

    -- -- 先记录旧的当前经验
    -- self.old_exp_progress = 100*old_exp/old_config.exp_max
    -- self.progress:setPercent(self.old_exp_progress)
    -- self.progress_bar:setPositionX(self.old_exp_progress*0.01*self.progress_width+5)

    -- self.old_role_lev = old_lev
    -- self.old_role_exp = old_exp
    -- self.new_role_lev = new_lev
    -- self.new_role_exp = new_exp

    -- 跑进度条
 --   self:showProgressEffect()
end

function BattlDramaQuickBattleWindow:updateData()
    local data = model:getDramaData()
    local quickdata = model:getQuickData() or {}
    local hook_max_time = model.hook_max_time or 120
    if quickdata then
        -- local status = RoleController:getInstance():getModel():checkPrivilegeStatus(1)
        -- local tips_str = string.format(TI18N("快速作战可获得<div fontcolor=#249003>%s</div>分钟挂机收益。"), hook_max_time)
        -- tips_str = tips_str .. "\n" .. string.format(TI18N("激活快速作战特权:每天免费<div fontcolor=#249003>3</div>次，额外购买<div fontcolor=#249003>11</div>次"))
        -- if status then
        --     tips_str = tips_str .. string.format(TI18N("<div fontcolor=#249003>(特权已激活)</div>"))
        --     self.btn_buy_quick:setVisible(false)
        -- else
        --     tips_str = tips_str .. string.format(TI18N("<div fontcolor=#c92606>(特权未激活)</div>"))
        --     self.btn_buy_quick:setVisible(true)
        -- end
        -- self.quick_desc:setString(tips_str)
    end

    if data and data.max_dun_id then
        local config = Config.DungeonData.data_drama_dungeon_info(data.max_dun_id)
        if config and config.quick_show_items then
            local list = {}
            local num = 0
            for i,v in ipairs(config.quick_show_items) do
                num = v[2]
                if quickdata and quickdata.fast_combat_add_time and quickdata.fast_combat_add_time > 0 then
                    num = num + math.floor(num * quickdata.fast_combat_add_time / hook_max_time)
                end
                table_insert( list, {bid = v[1], num = num} )
            end
            self.item_scrollview:setData(list)
        end
    end

    -- if Config.DungeonData.data_drama_quick_desc then
    --     local str = ""
    --     for i, v in ipairs(Config.DungeonData.data_drama_quick_desc) do
    --         str = str..v.desc.."\n" --.. string.format("<img src=%s visible=true scale=1 /> ", PathTool.getResFrame("common", "common_1004"))
    --     end
    --     self.desc_label:setString(str)
    -- end
    -- self.quick_data = BattleDramaController:getInstance():getModel():getQuickData()

    -- self:checkQuickBattle()
    -- self:onQuick()

   

end


 -- 挂机
function BattlDramaQuickBattleWindow:guajiShowItem()

        local drama_data = model:getDramaData()
        if drama_data == nil then return end
        local drama_config
        if not self.cur_drama_max_id and drama_data.max_dun_id == 0 then
            drama_config = Config.DungeonData.data_drama_dungeon_info(10010)
        else
            if self.cur_drama_max_id == drama_data.max_dun_id then return end
            drama_config = Config.DungeonData.data_drama_dungeon_info(drama_data.max_dun_id)
        end
        if drama_config == nil then return end
        self.cur_drama_max_id = drama_data.max_dun_id
        -- 挂机收益信息
        self.drama_item_labels = self.drama_item_labels or {}
        for i,v in ipairs(self.drama_item_labels) do
            v:setVisible(false)
        end
        local start_x = 0
        local offset_x = 30
        local label_len = 0
        local _lev_team =OrganizeController:getInstance():getModel():getMyTeamLev() or 1

        for i, v in ipairs(drama_config.per_hook_items) do
            local label = self.drama_item_labels[i]
            if label == nil then
                label = createRichLabel(20, cc.c3b(0xfa,0xe7,0xe8), cc.p(0,0.5), cc.p(_x, 22), nil, nil, 180)
                self.drama_item_labels[i] = label
                self.info_container:addChild(label)
            end
            local config = Config.ItemData.data_get_data(v[1])
            local str = string.format(TI18N("<img src=%s visible=true scale=0.3 /><div fontcolor=#fae7e8>%s/m</div>"), PathTool.getItemRes(config.icon), v[2]*_lev_team)
            label:setString(str)
            label:setVisible(true)
            local _x = start_x + label_len
            label:setPositionX(_x)
            label_len = label_len + label:getContentSize().width + offset_x
        end

        self.info_container:setPositionX(390)
end 


function BattlDramaQuickBattleWindow:register_event()
    -- if self.background then
    --     self.background:addTouchEventListener(function(sender, event_type)
    --         if event_type == ccui.TouchEventType.ended then
    --             playQuitSound()
    --             controller:openDramBattleQuickView(false) 
    --         end
    --     end)
    -- end
    --[[if self.source_btn then
        self.source_btn:addTouchEventListener(function(sender, event_type)
            customClickAction(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                if Config.DungeonData.data_drama_const["quick_swap_item"] and Config.DungeonData.data_drama_const["quick_swap_item"].val then
                    local config = Config.ItemData.data_get_data(Config.DungeonData.data_drama_const["quick_swap_item"].val)
                    BackpackController:getInstance():openTipsSource(true, config)
                end
            end
        end)
    end--]]
    if self.close_btn then
        self.close_btn:addTouchEventListener(function(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playQuitSound()
                controller:openDramBattleQuickView(false) 
            end
        end)
    end

    registerButtonEventListener(self.btn_buy_quick, function()
        VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
        --MallController:getInstance():openChargeShopWindow(true, MallConst.Charge_Shop_Type.Privilege)
    end ,false, 1)

    registerButtonEventListener(self.explain_btn, function(param,sender, event_type)
        local config = Config.DungeonData.data_drama_const.game_rule     
        TipsManager:getInstance():showCommonTips(config.desc, sender:getTouchBeganPosition(),nil,nil,500)
    end ,false, 1)

    -- if self.quick_btn then
    --     self.quick_btn:addTouchEventListener(function(sender, event_type)
    --         customClickAction(sender,event_type)
    --         if event_type == ccui.TouchEventType.ended then
    --            self:onQuick()
    --         end
    --     end)
    -- end

    EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Quick_Battle_Data,self, function(data)
            if data then
                self.quick_data = data
             --   self:updateData()
                -- self:checkQuickBattle()
            end
        end)
        if self.background then
            self.background:addTouchEventListener(function(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    self:closeThisWindow()
                end
            end)
        end
        if self.source_btn then
            self.source_btn:addTouchEventListener(function(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    self:closeThisWindow()
                end
            end)
        end
end


function BattlDramaQuickBattleWindow:closeThisWindow()
    if self.can_click == false then return end
    playCommonButtonSound()
    controller:openDramHookRewardView(false) 

    -- 这里破防物品飘向背包的特效
end
function BattlDramaQuickBattleWindow:onQuick()
    if self.quick_battle_status == 0 or self.quick_battle_status == 1 then
        self:send13004()
    elseif self.quick_battle_status == 3 then
        if not self.privilege_status then -- 未开通特权，则弹出提示
            -- 改成直接跳转
            VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
            --MallController:getInstance():openChargeShopWindow(true, MallConst.Charge_Shop_Type.Privilege)
            controller:openDramBattleQuickView(false)
            --[[local str = TI18N("购买快速作战特权可增加每日快速作战次数（包含2次免费次数），是否前往购买？")
            local function fun()
                VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
                controller:openDramBattleQuickView(false)
            end
            CommonAlert.show(str,TI18N("确认"), fun,TI18N("取消"),nil, CommonAlert.type.rich,nil, nil, nil, true)--]]
        else
            self:send13004()
        end
    else
        self.cost = self.cost or 0
        local str = TI18N("本次快速作战花费")..string.format("<img src=%s visible=true scale=0.3 /><div>x%s</div>", PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), self.cost)
        local function fun()
            self:send13004()
        end
        CommonAlert.show(str,TI18N("确认"), fun,TI18N("取消"),nil, CommonAlert.type.rich,nil, nil, nil, true)
    end

end
--发送协议13004协议
function BattlDramaQuickBattleWindow:send13004()
    local role_vo =  RoleController:getInstance():getRoleVo()
    if not role_vo then return end
    local cur_energy = role_vo.energy
    local max_energy = role_vo.energy_max
    local qingbao_val = 0 -- 2个小时的情报值值
    local vip_add_per = 0 -- vip情报加成
    --vip加成暂时没有的
    -- local vip_config = Config.VipData.data_get_vip_info[role_vo.vip_lev]
    -- if vip_config and vip_config.val then
    --     for i,v in ipairs(vip_config.val) do
    --         if v[1] == "dungeon" then
    --             vip_add_per = v[2] /1000 --表填的是千分比
    --         end
    --     end
    -- end
    --情报时间
    local hook_max_time = model.hook_max_time or 120

    local drama_data = BattleDramaController:getInstance():getModel():getDramaData() or {}
    local config = Config.DungeonData.data_drama_dungeon_info(drama_data.dun_id)
    if config  and config.per_hook_items then
        for i,v in ipairs(config.per_hook_items ) do
            if v[1] == Config.ItemData.data_assets_label2id.energy then
                --情报
                qingbao_val = v[2] * hook_max_time * (1 + vip_add_per)
            end
        end
    end

    if (cur_energy + qingbao_val) > max_energy then
        local function call_back()
            BattleDramaController:getInstance():send13004()
        end

        local str = string.format("注意:当前拥有<div fontcolor=#249003>%s/%s</div>远航情报,快速作战后,远航情报溢出部分将会损失,是否继续？", cur_energy, max_energy)
        CommonAlert.show(str, TI18N("确定"), call_back, TI18N("取消"), nil, CommonAlert.type.rich,nil,
            {timer = 3, timer_for = true, off_y = 0, title = TI18N("提示")},24)
    else
        BattleDramaController:getInstance():send13004()
    end
end

function BattlDramaQuickBattleWindow:checkQuickBattle()
    if self.quick_data then
        self.privilege_status = RoleController:getInstance():getModel():checkPrivilegeStatus(1)

        if self.quick_data.is_holiday == 1 then
            self.holid_up:setVisible(true)
        else
            self.holid_up:setVisible(false)
        end
        -- 普通剩余次数（消耗钻石）
        local combat_num = self.quick_data.fast_combat_max - self.quick_data.fast_combat_num
        -- 特权剩余次数（消耗钻石）
        local privilege_num = Config.PrivilegeData.data_fast_combat_cost_length - self.quick_data.fast_combat_p_num
        local str = string.format("%s<div fontColor=#249003>%s</div>%s",TI18N("今日剩余："),combat_num,TI18N("次"))

        if self.privilege_status then
            str = string.format("%s<div fontColor=#249003>%s+%s</div>%s",TI18N("今日剩余："),combat_num, privilege_num,TI18N("次"))
        end
        
        --快速作战活动的次数增加
        if self.quick_data.is_holiday == 1 or self.privilege_status == true then
            if self.quick_data.is_holiday == 1 and self.privilege_status == true then --活动与特权同时存在
                local holid_num = Config.DungeonData.data_drama_const.hd_fast_combat_buy_time.val - self.quick_data.fast_combat_w_num
                str = string.format("%s<div fontColor=#249003>%s+%s</div>%s",TI18N("今日剩余："),combat_num, holid_num+privilege_num,TI18N("次"))
            elseif self.privilege_status == true then --仅有特权
                str = string.format("%s<div fontColor=#249003>%s+%s</div>%s",TI18N("今日剩余："),combat_num, privilege_num,TI18N("次"))
            else
                local holid_num = Config.DungeonData.data_drama_const.hd_fast_combat_buy_time.val - self.quick_data.fast_combat_w_num
                str = string.format("%s<div fontColor=#249003>%s+%s</div>%s",TI18N("今日剩余："),combat_num, holid_num,TI18N("次"))
            end
        end

        self.cost = 0
        local btn_str = ""
        if self.quick_data.fast_combat_free_num > 0 then --代表是免费的
            btn_str = TI18N("<div fontcolor=#ffffff outline=2,#764519>快速战斗</div>")
            self.quick_battle_status = 0
            str = TI18N("本次免费")
            btn_str = TI18N("快速战斗")
        else --不是免费的了
            if self.privilege_status then -- 特权开启
                self.quick_num_label:setVisible(true)
                -- 先判断普通次数是否用完
                local index = self.quick_data.fast_combat_num + 1
                local cost_config = Config.PrivilegeData.data_fast_combat_cost[self.quick_data.fast_combat_p_num+1]
                if Config.DungeonData.data_drama_quick_cost[index] then -- 普通次数未用完
                    self.quick_battle_status = 2
                    self.cost = Config.DungeonData.data_drama_quick_cost[index].cost
                    btn_str = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#764519>%s 快速战斗</div>"),PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), self.cost)
                elseif cost_config then -- 特权次数未用完
                    self.quick_battle_status = 2
                    self.cost = cost_config.cost
                    btn_str = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#764519>%s 快速战斗</div>"),PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), self.cost)
                else -- 所有次数都用完
                    self.quick_battle_status = 3
                    btn_str = TI18N("<div fontcolor=#ffffff outline=2,#764519>快速战斗</div>")
                end
                btn_str = TI18N("快速战斗")
            else -- 没有特权
                local index = self.quick_data.fast_combat_num + 1
                if Config.DungeonData.data_drama_quick_cost[index] then
                    self.quick_battle_status = 2
                    self.cost = Config.DungeonData.data_drama_quick_cost[index].cost
                    btn_str = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#764519>%s 快速战斗</div>"),PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), self.cost)
                    btn_str = TI18N("快速战斗")
                else -- 次数用完
                    local const = Config.DungeonData.data_drama_const
                    --快速作战活动的次数增加
                    if self.quick_data.is_holiday == 1 and self.quick_data.fast_combat_w_num < const.hd_fast_combat_buy_time.val then 
                        self.quick_battle_status = 2
                        self.cost = const.hd_fast_combat_lose.val[1][2]
                        btn_str = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#764519>%s 快速战斗</div>"),PathTool.getItemRes(const.hd_fast_combat_lose.val[1][1]), self.cost)
                        btn_str = TI18N("快速战斗")
                    else
                        self.quick_battle_status = 3
                        btn_str = TI18N("<div fontcolor=#ffffff outline=2,#764519>获取更多次数</div>")
                        btn_str = TI18N("获取更多次数")
                    end
                end
            end 
        end
        self.quick_num_label:setString(str)
        self.quick_btn:getChildByName("label"):setString(btn_str)
    end
end

-- function BattlDramaQuickBattleWindow:openRootWnd()
--     self:updateData()
-- end

function BattlDramaQuickBattleWindow:close_callback()
    if self.item_scrollview then
        self.item_scrollview:DeleteMe()
        self.item_scrollview = nil
    end

    EventManager:getInstance():UnBind(self)
	EventManager:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
    controller:openDramBattleQuickView(false)
end





-- --------------------------------------------------------------------
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
--
-- --------------------------------------------------------------------
BatttleQuickItem = class("BatttleQuickItem", function()
    return ccui.Layout:create()
end)

function BatttleQuickItem:ctor()
    self:setContentSize(cc.size(BackPackItem.Width, BackPackItem.Height))
    self:setAnchorPoint(cc.p(0.5, 0.5))

    self.item = BackPackItem.new(false, true, false, 1, false, true)
    self.item:setPosition(BackPackItem.Width*0.5, BackPackItem.Height*0.5)
    self:addChild(self.item)

    self:registerEvent()
end

function BatttleQuickItem:registerEvent()

end

function BatttleQuickItem:setData(data)
    self.data = data
    if data then
        self.item:setBaseData(data.bid, data.num)
    end
end

function BatttleQuickItem:suspendAllActions()
end

function BatttleQuickItem:DeleteMe()
    if self.item then
        self.item:DeleteMe()
        self.item = nil
    end
    self:removeAllChildren()
    self:removeFromParent()
end

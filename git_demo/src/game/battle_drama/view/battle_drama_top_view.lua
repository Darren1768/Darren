-- --------------------------------------------------------------------
--
--
-- @description:
--     战斗界面副本层
-- --------------------------------------------------------------------
--BttleTopDramaView = BttleTopDramaView or BaseClass()
BttleTopDramaView = class("BttleTopDramaView", function()
        return ccui.Layout:create()
    end)

local _b_controller = BattleController:getInstance()
local _render_mgr = RenderMgr:getInstance()
local _tolua_isnull = tolua.isnull
local _drama_model = BattleDramaController:getInstance():getModel()
local _controller = BattleDramaController:getInstance() 
local _game_net = GameNet:getInstance()
local _string_format = string.format
local _table_insert = table.insert
local _table_remove = table.remove

local _get_time_items = Config.MiscData.data_get_time_items
local _get_time_length = Config.MiscData.data_get_time_items_length

function BttleTopDramaView:ctor(battle_res_id,battle_type)
    self.battle_res_id = battle_res_id or 10001
    self.battle_type = battle_type or BattleConst.Fight_Type.Darma
    self.map_height = 820 --可滑行的高度
    self.is_init = false
    self.is_move_root_wnd = false
    self.cur_map_pos = nil
    self.is_has_max_item = false
    self.is_change_chapter = false
    self.btn_layout_status = false
    self.btn_count = 0
    self.fly_item_sum = 0
    self:initConfig()
    self:createRootWnd()
    self:loadResources()
    print("-----------------BttleTopDramaView-----------------1-----------")
end

function BttleTopDramaView:initConfig()
    self.root_size = cc.size(SCREEN_WIDTH, display.height - self.map_height)
    self.map_size = cc.size(1800,1500)          --地图的实际尺寸,这个是动态的值,后面可能要创建的时候传入
    self.main_point_list = {} --副本章节节点
    self.model = BattleDramaController:getInstance():getModel()
    self.ctrl = BattleDramaController:getInstance()
    self.cur_chapter_id = nil
    self.role_vo = RoleController:getInstance():getRoleVo()

    self.right_btn_list = {}        -- 右边的图标列表,包含了情报
    self.left_btn_list = {}         -- 左边的图标列表,包含了排行和通关奖励和通关录像、日常
end

function BttleTopDramaView:createRootWnd()
    self.main_size = cc.size(SCREEN_WIDTH, display.height)
    self:setContentSize(self.main_size)
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setPosition(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5)

    self.root = ccui.Layout:create()
    self.root:setAnchorPoint(cc.p(0.5,1))
    self.root:setContentSize(cc.size(self.main_size.width, self.root_size.height))
    self.root:setPosition(self.main_size.width * 0.5, display.height)
    self:addChild(self.root,1)

    self.root_wnd = ccui.Layout:create()
    self.root_wnd:setAnchorPoint(cc.p(0, 0))
    self.root_wnd:setContentSize(self.map_size)
    self.root_wnd:setPosition(cc.p(0, 0))
    self.root:addChild(self.root_wnd)




    self.btn_layout = ccui.Layout:create()
    self.btn_layout:setVisible(false)
    self.btn_layout:setLocalZOrder(999)
    self.btn_layout:setPosition(self.main_size.width * 0.5, display.getBottom(self) + MainuiController:getInstance():getBottomHeight())
    self:addChild(self.btn_layout,1)

    ViewManager:getInstance():addToLayerByTag(self, ViewMgrTag.UI_TAG)



end

function BttleTopDramaView:initMaplayer(  )
    local maxScale = display.getMaxScale()

    self.map_scroll_view = createScrollView(SCREEN_WIDTH*maxScale,SCREEN_HEIGHT*maxScale,0,0,self,ccui.ScrollViewDir.horizontal)
    self.battle_res_id = _b_controller:curBattleResId(BattleConst.Fight_Type.Darma) or 10001
    local res = PathTool.getBattleSceneRes(_string_format("%s/map_bg", self.battle_res_id), false)
    self.map_bg = createSprite(res, 0, 0, self.map_scroll_view, cc.p(0, 0), LOADTEXT_TYPE)
    self.map_bg:setScale(maxScale)
    
    local size = self.map_bg:getContentSize()
    
    self.map_scroll_view:setInnerContainerSize(cc.size(size.width * maxScale,size.height*maxScale))
    self.map_scroll_view:setBounceEnabled(false)
    self.map_scroll_view:scrollToPercentHorizontal(50, 0, true)
    self.default_dun_id =0
    local map_id = self.model:getDramaData().map_id or 10001

    -- print("-====================22222222222222222222222222======================")
    -- printLuaTable(self.model:getDramaData())--Config.DungeonData.data_drama_dungeon_info_table 
    local config = Config.DungeonData.data_drama_dungeon_getmap_fun(map_id)
    print("--------------dun_config-----Config.DungeonData.data_drama_dungeon_info---map_id----",map_id)

    if config and config.checkpoint_id then
        printLuaTable(config)
        self.exp_list ={}
        self.role_list_spine = {}
        self.role_list_btn = {}
        self.current_selctspine = nil 
        for i,id in ipairs(config.checkpoint_id[1]) do
            local dun_config = Config.DungeonData.data_drama_dungeon_info(id)
            print("--------------dun_config-----Config.DungeonData.data_drama_dungeon_info-------",id)
            if dun_config then
                local monster_config = Config.UnitData.data_unit(dun_config.unit_id)
                print("--------------dun_config-----dun_config.unit_id------",dun_config.unit_id)
                if monster_config then 
                    self:createRole(id,monster_config.body_id,config.boss_pos[i],id,config.boss_pos[#config.boss_pos],dun_config.exp_add)
                end
            end
        end

    
    end
end

function BttleTopDramaView:updateMaplayer(  )
    if not self.map_scroll_view then return end 
    self.map_scroll_view:removeAllChildren()
    self.map_scroll_view:removeFromParent()

    self:initMaplayer()
end

function BttleTopDramaView:moveMaplayer(x )
    if not self.map_scroll_view then return end 
    print("---------------moveMaplayer-----------------------------x-------------------",x)
    local maxScale = display.getMaxScale()
    local size = self.map_bg:getContentSize()
    local offset = 0
    offset = (x/ (size.width * maxScale))*100 --- (360/ (size.width * maxScale))*100 
    -- {351,345},{1127,123},{990,356},{1479,263},{1878,192}  2160
    -- print("---------------moveMaplayer-----------------------------size------------------",size.width)
    -- print("---------------moveMaplayer----------------------------offset------------------",offset)
    if x < 540 then 
        offset = 0 
    elseif x > 1620 then 
        offset = 100
    end 
    self.map_scroll_view:scrollToPercentHorizontal(offset,0,true)
end


function BttleTopDramaView:setMaplayerShow( is_show )
    if not self.map_scroll_view then return end 
    self.map_scroll_view:setVisible(is_show)
end


function BttleTopDramaView:createRole(checkpoint_id,body_id,pos,id ,last_pos,exp_add)
    local btn_status = _drama_model:getCurDunInfoByID(checkpoint_id)

    if btn_status ~= nil and btn_status.status == 3  then
        print("------------btn_status.status-----",btn_status.status)
        if self.model:getDramaData().status ~=3 then 
            return
         end
        if self.next_chapter_btn1  then 
            -- self.next_chapter_btn1 = nil 
            return
        end 
        
        self.next_chapter_btn1 = ccui.Layout:create()
        self.next_chapter_btn1:setContentSize(cc.size(190,23))
        self.next_chapter_btn1:setAnchorPoint(0, 0.5)
        self.map_scroll_view:addChild(self.next_chapter_btn1)
        self.next_chapter_btn1:setVisible(false)  -- 前往下一章 下节
        self.next_chapter_btn1:setPosition(cc.p(last_pos[1],last_pos[2]+ 80))
        self.next_chapter_btn1:setSwallowTouches(false )

        self.next_chapter_btn1:setVisible(true)

        self._btn  = createButton(self.next_chapter_btn1,TI18N(""),0,0, nil,  PathTool.getResFrame("battledrama","hl_battledrama_1030"))
      
       
        local _next =  createImage(self._btn.btn , PathTool.getResFrame("battledrama","hl_battledrama_1032"),65,86, cc.p(0.5, 0.5), true, 1, true)
        _next:setSwallowTouches(false)
      
        self._btn:setVisible(true)
        local canClick =true
        self._btn:addTouchEventListener(function(sender, event_type)
                customClickAction(sender, event_type)
            if event_type == ccui.TouchEventType.ended  and canClick then
                canClick =false
                _controller:send13002()

                self.next_chapter_btn1 =nil 
            end 
         end)

  
      
    else
        print("--------------body_id-----2-------",body_id)
        if body_id ~= "" then
            if not  self.current_selctspine then 
                self.current_selctspine = id
    
                self:moveMaplayer(pos[1])
            end 
            local spine_model = createSpineByName(body_id,"stand",nil,nil,nil,nil,true) -- createSpineByName(body_id,"stand")
            self.map_scroll_view:addChild(spine_model)
            if  self.current_selctspine == id then 
                 self:playXunHunAction(spine_model) 
            else
                spine_model:setAnimation(0,"stand", true)
            end 
            spine_model:setScale(0.7)
            spine_model:update(0)
            spine_model:setAnchorPoint(cc.p(0,0))
            spine_model:setPosition(cc.p(pos[1] ,pos[2] ))
    
            local btn_res = PathTool.getResFrame("battledrama", "hl_battledrama_1014")
            self.role_list_spine[id] = spine_model
            
        
            local _size = spine_model:getBoundingBox()
            local battle_btn1 = createButton(spine_model, "", 0, 0, cc.size(_size.width,_size.height), btn_res, 24)
            battle_btn1:setAnchorPoint(cc.p(0.5, 0))
            battle_btn1.layout:setOpacity(0)
            battle_btn1.layout:setSwallowTouches(true)
    
           
            
    
            handleTouchEnded(battle_btn1,function (...)
                local battle_drama_model = BattleDramaController:getInstance():getModel()
                local drama_data = battle_drama_model:getDramaData()
                if battle_drama_model and drama_data then
                    local data = battle_drama_model:getSingleBossData(checkpoint_id)
                    BattleDramaController:getInstance():openDramBossInfoView(true, data)
                end 
    
                if self.current_selctspine == id then 
                    return
                end  
                self.drama_data.dun_id = checkpoint_id
                self.current_selctspine = id 
                for i,v in pairs(self.role_list_spine) do 
                    if self.current_selctspine==i then 
                        -- 播放循环
                        self:playXunHunAction(v)
                        self.role_list_btn[i]:setVisible(false) 
                        self.exp_list[i]:setVisible(false)
                    else
                        v:setAnimation(0,"stand", true)
                        self.role_list_btn[i]:setVisible(true) 
                        self.exp_list[i]:setVisible(true)

                    end 
                end 
           end)  
    
            -- --下面
            local battle_btn = createButton(spine_model, "", 0,-30, nil, btn_res, 24)
            if self.default_dun_id ==0 then
                self.default_dun_id = checkpoint_id
            end
             handleTouchEnded(battle_btn,function (...)
                self.drama_data.dun_id = checkpoint_id
                HeroController:getInstance():openFormGoFightPanel(true,nil,{checkpoint_id = checkpoint_id})
             end) 
             self.role_list_btn[id] =battle_btn

             self.exp_list[id] = CommonNum.new(220, spine_model, 1, -2, cc.p(0, 0.5))
             self.exp_list[id]:setPosition(20,-20)
             self.exp_list[id]:setNum(exp_add)

             battle_btn:setPositionX(-16)
           
            if  self.current_selctspine == id then 
                battle_btn:setVisible(false)
                self.exp_list[id]:setVisible(false)
             end 
            
           
    
        end
    end
  
end


function BttleTopDramaView:playXunHunAction(spine)
    spine:setAnimation(0,"scene1", false)
	local function animationCompleteFunc(event)
        if event.animation == "scene1" then
            spine:setAnimation(0,"scene2", false)
        end 
        if event.animation == "scene2" then
            spine:setAnimation(0,"scene1", false)
        end 
    end
    spine:registerSpineEventHandler(animationCompleteFunc, sp.EventType.ANIMATION_COMPLETE)
   
end

function BttleTopDramaView:loadResources(  )
    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("task", "task"), type = ResourcesType.plist },
        { path = PathTool.getPlistImgForDownLoad("battledrama", "battledrama"), type = ResourcesType.plist },
        { path = PathTool.getSingleImgForDownLoad("bigbg/pattern", "pattern_3"), type = ResourcesType.single },
        { path = PathTool.getPlistImgForDownLoad("num", "hl_battle_num"), type = ResourcesType.plist },
    }

    self.resources_load = ResourcesLoad.New(true)
    if self.resources_load then
        self.resources_load:addAllList(self.res_list, function (  )
                self:loadResListCompleted()
            end)
    end
end

function BttleTopDramaView:loadResListCompleted(  )
    print("-----------------BttleTopDramaView-------------------------------------3-----------")

    if self.battle_type == BattleConst.Fight_Type.Darma then
        if self.top_info_container == nil then
            local top_view_height = MainuiController:getInstance():getMainUi():getTopViewHeight()
            self.top_info_container = ccui.Layout:create()
            self.top_info_container:setContentSize(SCREEN_WIDTH, 255)
            self.top_info_container:setAnchorPoint(cc.p(0, 1))
            self.top_info_container:setPosition(display.getLeft(), display.getTop(self) - top_view_height + 25)
            self:addChild(self.top_info_container,1)
        end
        if self.right_open_widget == nil then
            self.right_open_widget = ccui.Layout:create()
            self.right_open_widget:setContentSize(108, 90)
            self.right_open_widget:setAnchorPoint(cc.p(1, 1))
            self.right_open_widget:setPosition(display.getRight()-20, 120)
            self.top_info_container:addChild(self.right_open_widget,1)
        end

        self:readyCreateFunIcon()           -- 准备创建的一波资源
        self:updateDramaChapterData()       -- 创建剧情节点
        self:createDramaButton()            -- 掉落信息
        --self:updateEncounter()              -- 创建冒险奇遇

        self:initMaplayer()
        self:updateBtnLayerStatus(true)
        self:registerEvent()
        self:checkQuickBattle()
        
    end
end
function BttleTopDramaView:checkQuickBattle()
    self.quick_data = BattleDramaController:getInstance():getModel():getQuickData()

    if self.quick_data then
        self.privilege_status = RoleController:getInstance():getModel():checkPrivilegeStatus(1)

        -- if self.quick_data.is_holiday == 1 then
        --     self.holid_up:setVisible(true)
        -- else
        --     self.holid_up:setVisible(false)
        -- end
        -- 普通剩余次数（消耗钻石）

        local combat_num = self.quick_data.fast_combat_max - self.quick_data.fast_combat_num
        -- 特权剩余次数（消耗钻石）
        local privilege_num = Config.PrivilegeData.data_fast_combat_cost_length - self.quick_data.fast_combat_p_num
        local str = string.format("<div fontColor=#fff9f0 outline=1,#af6d44>%s</div><div fontColor=#6faf49 outline=1,#2b521a>%s</div>",TI18N("今日剩余 "),combat_num)
        self.quick_num_label:setPositionX(655)
        self.quick_Image_3:setPositionX(658)
        if self.privilege_status then
            str = string.format("<div fontColor=#fff9f0 outline=1,#af6d44>%s</div><div fontColor=#47832d outline=1,#2b521a>%s/%s</div>",TI18N("今日剩余 "),combat_num, privilege_num)
            self.quick_num_label:setPositionX(650)
            self.quick_Image_3:setPositionX(650)
        end
        
        --快速作战活动的次数增加
        if self.quick_data.is_holiday == 1 or self.privilege_status == true then
            if self.quick_data.is_holiday == 1 and self.privilege_status == true then --活动与特权同时存在
                local holid_num = Config.DungeonData.data_drama_const.hd_fast_combat_buy_time.val - self.quick_data.fast_combat_w_num
                str = string.format("<div fontColor=#fff9f0 outline=1,#af6d44>%s</div><div fontColor=#47832d outline=1,#2b521a>%s/%s</div>",TI18N("今日剩余 "),combat_num, holid_num+privilege_num)
            elseif self.privilege_status == true then --仅有特权
                str = string.format("<div fontColor=#fff9f0 outline=1,#af6d44>%s</div><div fontColor=#47832d outline=1,#2b521a>%s/%s</div>",TI18N("今日剩余 "),combat_num, privilege_num)
            else
                local holid_num = Config.DungeonData.data_drama_const.hd_fast_combat_buy_time.val - self.quick_data.fast_combat_w_num
                str = string.format("<div fontColor=#fff9f0 outline=1,#af6d44>%s</div><div fontColor=#47832d outline=1,#2b521a>%s/%s</div>",TI18N("今日剩余 "),combat_num, holid_num)
            end
            self.quick_num_label:setPositionX(650)
            self.quick_Image_3:setPositionX(650)
        end

        self.cost = 0
        local btn_str = ""
        if self.quick_data.fast_combat_free_num > 0 then --代表是免费的
            btn_str = TI18N("<div fontColor=#fff9f0 outline=1,#af6d44>快速战斗</div>")
            self.quick_battle_status = 0
            str = string.format("<div fontColor=#fff9f0 outline=1,#af6d44>%s</div>",TI18N("本次免费"))
            self.quick_num_label:setPositionX(660)
            self.quick_Image_3:setPositionX(660)
        else --不是免费的了
           
            if self.privilege_status then -- 特权开启
                self.quick_num_label:setVisible(true)
                -- 先判断普通次数是否用完
                local index = self.quick_data.fast_combat_num + 1
                local cost_config = Config.PrivilegeData.data_fast_combat_cost[self.quick_data.fast_combat_p_num+1]
                if Config.DungeonData.data_drama_quick_cost[index] then -- 普通次数未用完
                    self.quick_battle_status = 2
                    self.cost = Config.DungeonData.data_drama_quick_cost[index].cost
                    btn_str = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=1,#764519>%s 快速战斗</div>"),PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), self.cost)
                elseif cost_config then -- 特权次数未用完
                    self.quick_battle_status = 2
                    self.cost = cost_config.cost
                    btn_str = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=1,#764519>%s 快速战斗</div>"),PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), self.cost)
                else -- 所有次数都用完
                    self.quick_battle_status = 3
                    btn_str = TI18N("<div fontcolor=#ffffff outline=1,#764519>快速战斗</div>")
                end
          
            else -- 没有特权
                local index = self.quick_data.fast_combat_num + 1
                if Config.DungeonData.data_drama_quick_cost[index] then
                    self.quick_battle_status = 2
                    self.cost = Config.DungeonData.data_drama_quick_cost[index].cost
                    btn_str = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#764519>%s 快速战斗</div>"),PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold), self.cost)
        
                else -- 次数用完
                    local const = Config.DungeonData.data_drama_const
                    --快速作战活动的次数增加
                    if self.quick_data.is_holiday == 1 and self.quick_data.fast_combat_w_num < const.hd_fast_combat_buy_time.val then 
                        self.quick_battle_status = 2
                        self.cost = const.hd_fast_combat_lose.val[1][2]
                        btn_str = string.format(TI18N("<img src=%s visible=true scale=0.25 /><div fontcolor=#ffffff outline=2,#764519>%s 快速战斗</div>"),PathTool.getItemRes(const.hd_fast_combat_lose.val[1][1]), self.cost)
                   
                    else
                        self.quick_battle_status = 3
                        btn_str = TI18N("<div fontcolor=#ffffff outline=2,#764519>获取更多次数</div>")
                   
                    end
                end
            end 
        end
        self.quick_num_label:setString(str)
        -- self.quick_btn:getChildByName("label"):setString(btn_str)
    end
end
function BttleTopDramaView:onQuick()
    print("-------------self.quick_battle_status------------------",self.quick_battle_status)
    if self.quick_battle_status == 0 or self.quick_battle_status == 1 then
        self:send13004()
    elseif self.quick_battle_status == 3 then
        -- if not self.privilege_status then -- 未开通特权，则弹出提示
        --     -- 改成直接跳转
        --     VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
        --     --MallController:getInstance():openChargeShopWindow(true, MallConst.Charge_Shop_Type.Privilege)
        --     _controller:openDramBattleQuickView(false)
        --     --[[local str = TI18N("购买快速作战特权可增加每日快速作战次数（包含2次免费次数），是否前往购买？")
        --     local function fun()
        --         VipController:getInstance():openVipMainWindow(true, VIPTABCONST.PRIVILEGE)
        --         controller:openDramBattleQuickView(false)
        --     end
        --     CommonAlert.show(str,TI18N("确认"), fun,TI18N("取消"),nil, CommonAlert.type.rich,nil, nil, nil, true)--]]
        -- else
        --     self:send13004()
        -- end

        self:send13004()
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
function BttleTopDramaView:send13004()
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
    local hook_max_time = _drama_model.hook_max_time or 120

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
-- 显示界面
function BttleTopDramaView:openView(  )
    self:setVisible(true)
    self.is_showing = true
    MainuiController:getInstance():setIsShowMainUIBottom(true)
end

-- 隐藏界面
function BttleTopDramaView:hideView(  )
    self:clearFlyTimer()
    self:clearAllFlyItemList()
    self:setVisible(false)
    self:showWorldLevelTips(false)
    self.is_showing = false
end

--==============================--
--desc:队列创建的,需要显示的东西
--@return 
--==============================--
function BttleTopDramaView:readyCreateFunIcon()
    if _tolua_isnull(self.top_info_container) then return end
    local delay_fun_list = {"updatePassCahpterInfo", "updateTaskInfo", "updateDramaHallows", "updateOnlineGiftInfo", "updateWorldLevelIcon","updateWorldMapInfo"}
    for i,fun_name in ipairs(delay_fun_list) do
        delayRun(self.top_info_container , i*4/60, function()
                if self[fun_name] then
                    self[fun_name](self)
                end
            end)
    end
    if self.time_ticket == nil then
        self.time_ticket = GlobalTimeTicket:getInstance():add(function() 
                self:checkTimeTicket()
            end, 1)
    end
end

function BttleTopDramaView:isCreateOnlineGift()
    local status = false
    local data = OnlineGiftController:getInstance():getOnlineGiftData()
    if data then
        if #data ~= _get_time_length then
            status = true
        end
    end
    return status
end
--在线奖励
function BttleTopDramaView:updateOnlineGiftInfo()
    OnlineGiftController:getInstance():sender10926()
    if _tolua_isnull(self.top_info_container) then return end
    self:onlineCreate()
end
--创建图标
function BttleTopDramaView:onlineCreate()
    if self.online_gift_node == nil and self:isCreateOnlineGift() == true then
        self.online_gift_node = self:createReceiveIcon("在线奖励")
        self.online_gift_node:setPosition(630, -120)
        self.top_info_container:addChild(self.online_gift_node)


        registerButtonEventListener(self.online_gift_node, function()
                OnlineGiftController:getInstance():openOnlineGiftView(true)
            end,true, 1)
    end

    self:updateRightBtnPos(false)
end
--领取信息发生变化的时候
function BttleTopDramaView:receiveChangeData()
    local data = OnlineGiftController:getInstance():getOnlineGiftData()
    local num = 0
    if data then
        for i,v in ipairs(_get_time_items) do
            if data[1] then
                if data[1].time and data[1].time >= v.time then
                    num = i
                end
            end
        end
    end
    num = num + 1
    if num >= _get_time_length then
        num = _get_time_length
    end 

    local online_time = OnlineGiftController:getInstance():getOnlineTime() or 0
    if online_time >= _get_time_items[num].time then
        if self.online_gift_node then
            -- doStopAllActions(self.online_gift_node.label)
            addRedPointToNodeByStatus(self.online_gift_node, true, -5, -2)
        end
    else
        -- self.online_show_item:showItemEffect(false,165,PlayerAction.action,true)
        -- local time = _get_time_items[num].time - online_time
        -- self:setLessTime(time)
        addRedPointToNodeByStatus(self.online_gift_node, false, -5, -2)

    end
  
    -- if not self.online_show_item then
    --     if self.online_gift_node then
    --         self.online_show_item = BackPackItem.new(nil,true,nil,0.55,false)
    --         self.online_gift_node:addChild(self.online_show_item)
    --         self.online_show_item:setPosition(cc.p(39, 50))
    --     end
    -- end
    -- if self.online_show_item then
    --     -- self.online_show_item:setBaseData(_get_time_items[num].items[1][1], _get_time_items[num].items[1][2])
    --     -- self.online_show_item:showItemEffect(true,165,PlayerAction.action,true,1.2)

    --     -- self.online_show_item:addCallBack(function()
    --     --         OnlineGiftController:getInstance():openOnlineGiftView(true)
    --     --     end)

    --     -- if online_time >= _get_time_items[num].time then
    --     --     if self.online_gift_node then
    --     --         doStopAllActions(self.online_gift_node.label)
    --     --         self.online_gift_node.label:setString(TI18N"可领取")
    --     --     end
    --     -- else
    --     --     self.online_show_item:showItemEffect(false,165,PlayerAction.action,true)
    --     --     local time = _get_time_items[num].time - online_time
    --     --     self:setLessTime(time)
    --     -- end
    -- end
end
--避免网络时间延迟导致在线奖励领取完毕还在剧情副本中
function BttleTopDramaView:removeOnlineSprite(data)
    if data and data.list then
        local status = false
        local time = data.time or 0
        if next(data.list) ~= nil then
            --删除图标
            if #data.list >= _get_time_length then
                status = false
            else
                status = true
            end
        else
            status = true
        end
        if status == false then
            self:clearOnlineInfo()
        else
            --创建图标
            self:onlineCreate()
        end
    end
end

--设置倒计时
function BttleTopDramaView:setLessTime(less_time)
    if not less_time then return end
    if tolua.isnull(self.online_gift_node.label) then return end
    doStopAllActions(self.online_gift_node.label)
    if less_time > 0 then
        self:setTimeFormatString(less_time)
        self.online_gift_node.label:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1), cc.CallFunc:create(function()
                            less_time = less_time - 1
                            if less_time < 0 then
                                doStopAllActions(self.online_gift_node.label)
                            else
                                self:setTimeFormatString(less_time)
                            end
                        end))))
    else
        self:setTimeFormatString(less_time)
    end
end
function BttleTopDramaView:setTimeFormatString(time)
    if time and time > 0 then
        self.online_gift_node.label:setString(TimeTool.GetTimeFormat(time))
    else
        self.online_gift_node.label:setString("")
    end
end
--删除
function BttleTopDramaView:removeOnlineGift(data)
    self:receiveChangeData()

    local status = false
    if _get_time_items[_get_time_length].time == data then --等于最后一个，就说明奖励已经全部领取完毕
        status = true
    end
    if status == true then
        if not tolua.isnull(self.online_gift_node) then 
            OnlineGiftController:getInstance():openOnlineGiftView(false) 
            self:clearOnlineInfo()
        end
    end
end

function BttleTopDramaView:clearOnlineInfo()
    if not tolua.isnull(self.online_gift_node) then 
        doStopAllActions(self.online_gift_node.label)
        if self.online_show_item then
            self.online_show_item:DeleteMe()
        end
        self.online_show_item  = nil
        self.online_gift_node:removeFromParent()
        self.online_gift_node = nil

        if self.update_online_get_event then
            EventManager:getInstance():UnBindEvent(self.update_online_get_event)
            self.update_online_get_event = nil
        end
    end
end

--==============================--
--desc:剧情里面需要用到的定时器
--@return 
--==============================--
function BttleTopDramaView:checkTimeTicket()
    -- if self.progress_aaa then
    --     if self.progress_aaa_111 == nil then
    --         self.progress_aaa_111 = 0
    --     end
    --     self.progress_aaa_111 = self.progress_aaa_111 + 1
    --     if self.progress_aaa_111 > 100 then
    --         self.progress_aaa_111 = 100
    --     end
    --     self.progress_aaa:setPercentage(self.progress_aaa_111)
    -- end
end

--==============================--
--desc:更新章节节点数据
--@return 
--==============================--
function BttleTopDramaView:updateDramaChapterData()
    self.drama_data = self.model:getDramaData()
    if not self.drama_data then return end
    if not self.cur_chapter_id then
        self.cur_chapter_id = self.drama_data.chapter_id
    end
    self.is_change_chapter = false
    if self.cur_chapter_id ~= self.drama_data.chapter_id then --如果是不等于则清楚

        self.is_change_chapter = true
        self:updateImage() -- 更新假战斗界面地图

        self.cur_chapter_id = self.drama_data.chapter_id
    end
    --self.model:initDungeonList(self.drama_data.mode, self.drama_data.chapter_id, self.drama_data.map_id)
end

--- 设置章节节点的状态
function BttleTopDramaView:updateStatus(is_update)
    self.drama_data = self.model:getDramaData()
    if self.drama_data then
        local v_data = self.model:getCurDunInfoByMapID(self.drama_data.map_id)
        local config = Config.DungeonData.data_drama_dungeon_info(self.drama_data.dun_id)
        if config then
            if self.main_point_list and self.main_point_list[self.drama_data.dun_id] then
                local item = self.main_point_list[self.drama_data.dun_id]
                local is_big = config.is_big
                item:updateStatus(v_data.status, is_big)
            end
            self:updateMove(is_update)

            if not self.is_move_start then
                -- self:moveTag()
                self.is_move_start = true
            end
        end
    end
end

function BttleTopDramaView:updateMove(is_update)
    if self.drama_data then
        local config = Config.DungeonData.data_drama_dungeon_info(self.drama_data.dun_id)
        if config then
            local temp_pos = config.pos
            local item_pos = cc.p(temp_pos[1], temp_pos[2])
            local next_id = config.next_id
            local world_pos = self.root_wnd:convertToWorldSpace(cc.p(item_pos.x, item_pos.y))
            local node_pos = self.root_wnd:convertToNodeSpace(world_pos)
            local pos_y = item_pos.y / 2
            local offset_y = (self.root_size.height / 2 - pos_y)
            if pos_y >= offset_y then
                pos_y = -item_pos.y / 2
            end
            local distance_final_x = self.map_size.width - item_pos.x --当前距离地图终点距离
            local distance_mid_x = self.root_size.width / 2 - distance_final_x --距离屏幕中心点距离
            local pos_x = item_pos.x
            if pos_x >= self.root_size.width then
                if math.abs(distance_mid_x) >= self.root_size.width / 2 then
                    pos_x = -item_pos.x - distance_mid_x / 2
                else
                    pos_x = -item_pos.x - distance_mid_x
                end
            end
            local return_pos = self:scaleCheckPoint(math.ceil(pos_x), math.ceil(pos_y))
            if not self.is_move_root_wnd then
                if self.model:getRootWndPos() and not is_update and not self.is_change_chapter then
                    self.root_wnd:setPosition(self.model:getRootWndPos())
                else
                    self:rootWndMove(return_pos)
                end
            end
        end
    end
end

function BttleTopDramaView:moveTag(is_start)
end

function BttleTopDramaView:updateEffect(effect_res)
    if self.effect then
        self.effect:runAction(cc.RemoveSelf:create(true))
        self.effect = nil
    end
    if effect_res ~= "" then
        if not _tolua_isnull(self.root) and self.effect == nil then
            self.effect = createEffectSpine(effect_res, cc.p(0, self.root_size.height), cc.p(0, 1), true, PlayerAction.action)
            self.root:addChild(self.effect)
        end
    end
end 



function BttleTopDramaView:getDir()
    local scale = 1
    local item = self.main_point_list[self.drama_data.dun_id]
    if item then
        local max_item = self.main_point_list[self.drama_data.max_dun_id]
        local cur_x = item:getPositionX()
        local max_x = 0
        if max_item then
            max_x = max_item:getPositionX()
        end
        if cur_x > max_x then
            scale = 1
        else
            scale = -1
        end
    end
    return scale
end

--==============================--
--desc:章节变化时,显示收益提示
--@return 
--==============================--
function BttleTopDramaView:updateCurMapNameAction()

    if self.drama_data == nil then return end
    _b_controller:setDramaStatus(true)
    local is_init = false
    local last_dun_id = self.drama_data.last_dun_id or 0
    if self.drama_data.last_dun_id == 0 then
        last_dun_id = self.drama_data.max_dun_id
        is_init = true
    end
    local cur_id = self.drama_data.max_dun_id
    local info_config = Config.DungeonData.data_drama_dungeon_info
    local data = info_config(last_dun_id)
    local cur_data = info_config(cur_id)
    if data == nil or cur_data == nil then return end

    if not self.map_name_container then
        self.map_name_container = ccui.Layout:create()
        self.map_name_container:setContentSize(410, 217)
        self.map_name_container:setAnchorPoint(cc.p(0.5, 0))
        self.map_name_container:setOpacity(255)
        self.map_name_container:setCascadeOpacityEnabled(true)
        self.map_name_container:setPosition(cc.p(self.root_size.width / 2, display.height * 3 / 5))
        if not _tolua_isnull(self.map_name_container) then
            self:addChild(self.map_name_container, 99)
        end

        self.map_left_bg = createScale9Sprite(PathTool.getResFrame("battledrama", "hl_battledrama_1029"), self.map_name_container:getContentSize().width / 2, self.map_name_container:getContentSize().height / 2-10, LOADTEXT_PLIST, self.map_name_container)
        self.map_left_bg:setAnchorPoint(cc.p(0.5, 0.5))
        -- self.map_left_bg:setContentSize(cc.size(self.map_left_bg:getContentSize().width, self.map_name_container:getContentSize().height-20))
        self.map_left_bg:setContentSize(cc.size(self.map_left_bg:getContentSize().width, 161))

        -- self.map_right_bg = createScale9Sprite(PathTool.getResFrame("battledrama", "battledrama_1038"), self.map_name_container:getContentSize().width - 0.5, self.map_name_container:getContentSize().height / 2, LOADTEXT_PLIST, self.map_name_container)
        -- self.map_right_bg:setScaleX(- 1)
        -- self.map_right_bg:setAnchorPoint(cc.p(0, 0.5))
        -- self.map_right_bg:setContentSize(cc.size(self.map_right_bg:getContentSize().width, self.map_name_container:getContentSize().height))
        self.map_name_label = createLabel(26, cc.c3b(250,232,150), nil, self.map_name_container:getContentSize().width / 2, self.map_name_container:getContentSize().height -60, "", self.map_name_container)
        self.map_name_label:setAnchorPoint(cc.p(0.5, 0.5))

        self.before_rich_label = createRichLabel(22,cc.c3b(239,212,174), cc.p(0, 0.5), cc.p(15, 85), -5, nil, 1000)
        self.map_name_container:addChild(self.before_rich_label)
        self.desc_cur_label = createRichLabel(22, cc.c3b(239,212,174), cc.p(0, 0.5), cc.p(172,83),5, nil, 1000)
        self.map_name_container:addChild(self.desc_cur_label)
        self.after_rich_label = createRichLabel(22,cc.c3b(239,212,174), cc.p(0, 0.5), cc.p(238, 83), 12, nil, 1000)
        self.map_name_container:addChild(self.after_rich_label)
        self.desc_cur_label_2 = createRichLabel(22,cc.c3b(239,212,174), cc.p(0, 0.5), cc.p(278, 83), 5, nil, 1000)
        self.map_name_container:addChild(self.desc_cur_label_2)

    end
    if self.map_name_container and not _tolua_isnull(self.map_name_container) then
        -- 创建上一个关卡的产出数值
        local str = ""
        local num_str = ""
        if data and data.per_hook_items then
            local per_hook_items = self.model:calcHookItems(data)
            for i, v in ipairs(per_hook_items) do
                local config = Config.ItemData.data_get_data(v[1])
                str = str .. _string_format(TI18N("<img src=%s visible=false scale=0.30 /><div>%s\n</div>"), PathTool.getItemRes(config.icon), config.name)
                if is_init == true then
                    num_str = num_str .. "\n" ..0 
                else
                    num_str = num_str .. "\n" ..v[2]
                end
            end
        end
     
        self.before_rich_label:setString(str)
        self.desc_cur_label:setString(num_str)
        self.desc_cur_label:setPositionX(self.before_rich_label:getPositionX() + self.before_rich_label:getContentSize().width + 10)

        -- 创建当前关卡的产出数值
        local str = ""
        local num_str = ''
        if cur_data and cur_data.per_hook_items then
            local per_hook_items = self.model:calcHookItems(cur_data)
            for i, v in ipairs(per_hook_items) do
                local config = Config.ItemData.data_get_data(v[1])-- rotate=90 PathTool.getResFrame("common2"
                str = str .. _string_format(TI18N('<img src=%s visible=true  scale=1 /><div>\n</div>'), PathTool.getResFrame("common2", "hl_common_3008"))
                num_str = num_str .. _string_format(TI18N("<div>%s/分钟\n</div>"), v[2])
            end
        end
        self.after_rich_label:setString(str)
        self.desc_cur_label_2:setString(num_str)
        self.after_rich_label:setPositionX(self.desc_cur_label:getPositionX() + self.desc_cur_label:getContentSize().width + 10)
        self.desc_cur_label_2:setPositionX(self.after_rich_label:getPositionX() + self.after_rich_label:getContentSize().width + 10)

        -- 设置名字
        -- local info_config = Config.DungeonData.data_drama_dungeon_info(cur_id)
        if cur_data and self.map_name_label then
            self.map_name_label:setString(cur_data.name)
        end

        -- 动作
        self.map_name_container:runAction(cc.Sequence:create(cc.FadeTo:create(0.8, 255), cc.DelayTime:create(2), cc.FadeOut:create(0.8), cc.CallFunc:create(function()
                        if self.map_name_container and not _tolua_isnull(self.map_name_container) then
                            self.map_name_container:removeAllChildren()
                            self.map_name_container = nil
                            _b_controller:setDramaStatus(false)
                        end
                    end)))
    end
end 

--==============================--
--desc:更具当前剧情id回头设置当前战斗地图 
--@return 
--==============================--
function BttleTopDramaView:updateImage()
    if _b_controller:getCtrlBattleScene() and self.drama_data then
        local _config = Config.DungeonData.data_drama_world_info[self.drama_data.mode]
        if _config and _config[self.drama_data.chapter_id] then
            local map_id =_config[self.drama_data.chapter_id].map_id

            local battle_res_id = _b_controller:curBattleResId(self.battle_type) or 10001
            print("----------battle_res_id-----------333-----",battle_res_id)
            if _b_controller:getCtrlBattleScene() then
                if self.map_resources_load then
                    self.map_resources_load:DeleteMe()
                    self.map_resources_load = nil
                end
                if not self.map_resources_load then
                    self.map_resources_load = ResourcesLoad.New(true)       -- 资源下载
                end
                if not self.res_list then
                    self.res_list = {}
                end
                local m_bg_res = PathTool.getBattleSceneRes(_string_format("%s/b_bg", battle_res_id), false)
                local map_bg_res = PathTool.getBattleSceneRes(_string_format("%s/b_bg", battle_res_id), false)
                table.insert(self.res_list, { path = m_bg_res, type = ResourcesType.single })
                table.insert(self.res_list, { path = map_bg_res, type = ResourcesType.single })
                self.map_resources_load:addAllList(self.res_list, function()
                        if _b_controller:getCtrlBattleScene() then
                            _b_controller:getCtrlBattleScene():updateBg(map_bg_res, m_bg_res)
                        end
                        --self:analysisMap(map_id)
                        self.res_list = {}
                    end)
            end
        end
        self.is_init = true
    end
end

--==============================--
--desc:移动背景图
--@x:
--@y:
--@return 
--==============================--
function BttleTopDramaView:moveMainScene(x,y)
    x = self.root_wnd:getPositionX() + x
    y = self.root_wnd:getPositionY() + y
    local return_pos = self:scaleCheckPoint(x,y)
    self.root_wnd:setPosition(return_pos.x,return_pos.y)
end

--==============================--
--desc:判断位置的边界情况
--@_x:
--@_y:
--@return 
--==============================--
function BttleTopDramaView:scaleCheckPoint( _x, _y)
    local return_pos = cc.p(_x,_y)
    if return_pos.x > 0 then
        return_pos.x = 0
    elseif return_pos.x < (self.root_size.width-self.map_size.width) then
        return_pos.x = (self.root_size.width-self.map_size.width)
    end
    if return_pos.y < (self.root_size.height - self.map_size.height)  then
        return_pos.y = (self.root_size.height - self.map_size.height)
    elseif return_pos.y >= 0  then 
        return_pos.y = 0
    end
    return return_pos
end

--==============================--
--desc:注册监听事件
--@return 
--==============================--
function BttleTopDramaView:registerEvent()
    EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Data,self,function (data)
            if data.chapter_id ~= self.cur_chapter_id  or self.cur_chapter_id==1  then
                if self.root_wnd and not _tolua_isnull(self.root_wnd) then
                    self:updateDramaChapterData()
                    self:updateCurMapInfo(true)
                end
            else
                if self.root_wnd and not _tolua_isnull(self.root_wnd) then
                    --self:updateStatus(true)
                    self:updateCurMapInfo()
                end
            end
            print("----------------------------------123--------------------------------------------")
            self:updateMaplayer()
            self:updateBtnLayerStatus(true)
            self:updateNextBtnStatus(self.drama_data)

            BattleController:getInstance():playDrame()
        end)

    -- 最大关卡数更新，刷新掉落信息
    EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Max_Id,self, function (  )
            self:updateDramaDropInfo()
        end)    


    EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Top_Update_Data,self, function(data)
            if self.root_wnd and not _tolua_isnull(self.root_wnd) then
                self:updateDramaChapterData()
                self:updateCurMapInfo(true)
                self:updateNextBtnStatus(self.drama_data)

                BattleController:getInstance():playDrame()
            end
        end)


    EventManager:getInstance():Bind(BattleEvent.MOVE_DRAMA_EVENT,self, function(combat_type,result)
            if combat_type == BattleConst.Fight_Type.Darma and self.drama_data and MainuiController:getInstance():checkIsInDramaUIFight() then
                self:updateCurMapNameAction()
                self.is_move_start = true
                --self:moveTag(true)
            end
        end)


    EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Drama_Reward_Data,self, function(data)
            self:updatePassCahpterInfo()
        end)


    EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Quick_Battle_Data,self, function(data)
            if data == nil then return end
            if _tolua_isnull(self.quick_battle_btn) then return end
            if data.fast_combat_num ~= 0 or not self.quick_battle_status then
                self.quick_battle_tips:setVisible(false)
            else
                self.quick_battle_tips:setVisible(true)
            end
            self:updateNextBtnStatus(self.model:getDramaData())
            self:updateDramaDropInfo()

            BattleController:getInstance():playDrame()
        end)


    -- 图标添加或者移除的时候需要判断
    EventManager:getInstance():Bind(MainuiEvent.UPDATE_FUNCTION_STATUS,self, function(id, status) 
            if id == MainuiConst.icon.daily then
                self:updateTaskInfo()
            elseif id == MainuiConst.icon.rank then
                -- self:updateRankInfo()
            end
        end)

    if self.role_vo ~= nil then
        if self.role_assets_event == nil then
            self.role_assets_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value)
                    if key == "look_id" then

                    elseif key == "energy" then
                        --self:updateQingbaoInfo()
                    elseif key == "lev" then
                        if self.next_battle_btn and self.next_battle_btn.lev_limit and self.next_battle_btn.lev_limit <= value then
                            self.next_battle_btn.lev_limit = 0
                            -- self.boss_btn_notice:setVisible(false)
                            self.boss_btn_challenge:setVisible(true)
                            -- self.next_chapter_btn1:setVisible(false)
                        end
                        self:updateWorldLevelIcon()
                        -- self:checkEncounterOpenStatus()
                        --self:updateEncounter()
                    end
                end)
        end
    end
    -- 神器任务更新
    EventManager:getInstance():Bind(HallowsEvent.UpdateHallowsTaskEvent,self, function() 
            self:updateDramaHallows()
        end) 

    -- 激活神器
    EventManager:getInstance():Bind(HallowsEvent.HallowsActivityEvent,self, function()
            self:updateDramaHallows()
        end)

    -- 神器红点
    if self.update_hallows_red_status == nil then
        self.update_hallows_red_status = EventManager:getInstance():Bind(HallowsEvent.HallowsRedStatus,self, function ()
                self:updateHallowsRedStatus()
            end)
    end


    EventManager:getInstance():Bind(Battle_dramaEvent.UpdateHookAccumulateTime,self, function(data)
            self:updateResourceCollect()
        end)


    EventManager:getInstance():Bind(OnlineGiftEvent.Updata_Data,self, function(data)
            self:removeOnlineGift(data)
        end)

    --在线等时间到达时
    if self.update_online_get_event == nil then
        EventManager:getInstance():Bind(OnlineGiftEvent.Get_Data,self, function(data)
                self:removeOnlineSprite(data)
                self:receiveChangeData()
            end)
    end
    -- 冒险奇遇红点
    EventManager:getInstance():Bind(EncounterEvent.UPDATA_RED_STATUS,self, function(data)
            -- self:checkEncounterRed()
        end)

end

--==============================--
--desc:移动地图
--@return_pos:
--@is_move:
--@return 
--==============================--
function BttleTopDramaView:rootWndMove(return_pos,is_move)
    local move_to = cc.MoveTo:create(0.4, cc.p(return_pos.x, return_pos.y))
    if self.model:getRootWndPos() and not is_move then
        local distance_x = self.model:getRootWndPos().x - return_pos.x
        local distance_y = self.model:getRootWndPos().y - return_pos.y
        move_to = cc.MoveBy:create(0.4, cc.p(-distance_x, -distance_y))
    end

    doStopAllActions(self.root_wnd)
    local call_fun = cc.CallFunc:create(function()
            self.model:setRootWndPos(cc.p(return_pos.x, return_pos.y))
            self.in_touch_move = false
        end)
    self.root_wnd:runAction(cc.Sequence:create(move_to, call_fun))
end

--==============================--
--desc:解析待创建资源
--@map_id:
--@return 
--==============================--
--[[function BttleTopDramaView:analysisMap(map_id)

end--]]

--==============================--
--desc:创建左上角的图标,活动类的或者通关奖励类的
--@return 
--==============================--
function BttleTopDramaView:createSpecialIcon(res, content, load_type,off_x,off_y)
    off_x = off_x or 33 
    off_y = off_y or 44 
    local container = ccui.Layout:create()
    container:setAnchorPoint(0.5, 0.5)
    container:setTouchEnabled(true)

    load_type = load_type or LOADTEXT_TYPE_PLIST
    local sp = createSprite(res, 38, 38, container, cc.p(0.5, 0.5), load_type) 
    container:setContentSize(sp:getContentSize())
    content = content or ""
    local label = createLabel(22, cc.c4b(0xed,0xda,0xdc,0xff), 2, 38, 2, content, container, 2, cc.p(0.5,0.5))
    label:enableOutline(cc.c3b(101,99,101), 1)
    local tips = createSprite(PathTool.getResFrame("common", "hl_common_3"), off_x, off_y, container, cc.p(0.5, 0.5))
    tips:setVisible(false) 

    container.sp = sp
    container.label = label
    container.tips = tips
    return container
end

--在线奖励创建的底图
function BttleTopDramaView:createReceiveIcon(content)
    local container = ccui.Layout:create()
    container:setAnchorPoint(0.5, 0.5)
    container:setContentSize(76,76)
    container:setTouchEnabled(true)

    -- local bg = createSprite(PathTool.getResFrame("battledrama","hl_battledrama_1017"),38,38,container,cc.p(0.5,0.5),LOADTEXT_TYPE_PLIST)
    -- createSprite(PathTool.getResFrame("battledrama","hl_battledrama_1022"),54,0,bg,cc.p(0.5,0.5),LOADTEXT_TYPE_PLIST)
    -- content = content or ""
    -- local label = createLabel(18, cc.c4b(0x00,0xff,0x00,0xff), 2, 36, -17, content, container, 2, cc.p(0.5,0.5))
    local bg = createSprite(PathTool.getResFrame("common2","hl_common_3046"),38,38,container,cc.p(0.5,0.5),LOADTEXT_TYPE_PLIST)
    local _sprite1 =createSprite(PathTool.getResFrame("task","hl_task_21"),48,46,bg,cc.p(0.5,0.5),LOADTEXT_TYPE_PLIST)
    bg:setScale(0.7)
    _sprite1:setScale(1.8)
    content = content or ""
    local label = createLabel(22, cc.c4b(237,218,220,0xff), nil , 36, 0, content, container, 1, cc.p(0.5,0.5))
    label:enableOutline(cc.c4b(18,18,18,120),1)
    container.bg = bg
    -- container.label = label
    return container
end

--==============================--
--desc:资源状态更新
--@return 
--==============================--
function BttleTopDramaView:updateResourceCollect()
    print(11111111111)
    if _tolua_isnull(self.resources_progress) then return end
    --if _tolua_isnull(self.resources_box) then return end
    print(222222222222)
    local cost_config = Config.DungeonData.data_drama_const.hangup_revenue
    local min_config = Config.DungeonData.data_drama_const.hangup_revenue_small
    local max_config = Config.DungeonData.data_drama_const.hangup_revenue_big
    if cost_config == nil or min_config == nil or max_config == nil then return end

    local hook_info = _drama_model:getHookAccumulateInfo()
    if hook_info == nil then return end
    local hook_time = hook_info.hook_time or 0      -- 挂机时间
    local action = PlayerAction.action
    if hook_time >= max_config.val then
        action = PlayerAction.action_5
    elseif hook_time >= min_config.val then
        action = PlayerAction.action_3
    elseif hook_time >= cost_config.val then
        action = PlayerAction.action_1
    else
        action = PlayerAction.action
    end
    if self.resources_action ~= action then
        self.resources_action = action
        --self.resources_box:setToSetupPose()
        --self.resources_box:setAnimation(0, action, true)
    end

    local time_max_config = Config.DungeonData.data_drama_const.profit_time_max
    if time_max_config then
        self.resources_progress:setPercent(100 * hook_time / time_max_config.val)
    end

    if not _tolua_isnull(self.resources_time_label) then
        self.resources_time_label:setString(TimeTool.GetTimeFormatIII(hook_time))
    end
end

--==============================--
--desc:世界地图按钮
--@return 
--==============================--
function BttleTopDramaView:updateWorldMapInfo()
    if _tolua_isnull(self.top_info_container) then return end

    if self.world_map_node == nil then
        -- self.world_map_node = self:createSpecialIcon(PathTool.getResFrame("battledrama", "battledrama_1017"), TI18N("查看地图"), LOADTEXT_TYPE_PLIST)
        self.world_map_node = self:createSpecialIcon(nil, nil, nil)
        if self.world_map_node.bg then
            self.world_map_node.bg:setVisible(false)
        end
        self.top_info_container:addChild(self.world_map_node)
        local node_size = cc.size(197,180)
        self.world_map_node = ccui.Layout:create()
        self.world_map_node:setAnchorPoint(0.5, 0.5)
        self.world_map_node:setContentSize(node_size)
        self.world_map_node:setTouchEnabled(true)

        local map_icon_k = createSprite(PathTool.getResFrame("battledrama","hl_battledrama_1012"),node_size.width/2,node_size.height/2,self.world_map_node,cc.p(0.5,0.5),LOADTEXT_TYPE_PLIST)
        local name_label = createLabel(22,1,cc.c3b(0xed,0xda,0xdc),node_size.width/2,10,"",self.world_map_node,1,cc.p(0.5, 1))
        name_label:enableOutline(cc.c3b(101,99,101), 1)

        -- 小地图裁剪
        local draw = createSprite(PathTool.getResFrame("battledrama","hl_battledrama_1011"),node_size.width/2,node_size.height/2,nil,cc.p(0.5,0.5),LOADTEXT_TYPE_PLIST)
        local map_cli_node = cc.ClippingNode:create(draw)
        map_cli_node:setAnchorPoint(cc.p(0.5,0.5))
        map_cli_node:setContentSize(cc.size(102,103))
        map_cli_node:setCascadeOpacityEnabled(true)
        map_cli_node:setPosition(50, 40)
        map_cli_node:setAlphaThreshold(0)

        self.world_map_node:addChild(map_cli_node)
        self.world_map_node.name_label = name_label
        self.world_map_node.map_cli_node = map_cli_node

        self:updateCurMapInfo(true)

        self.top_info_container:addChild(self.world_map_node)
        self.world_map_node:addTouchEventListener(function(sender, event_type)
                customClickAction(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    playCommonButtonSound()
                    BattleDramaController:getInstance():openBattleDramaMapWindows(true)
                end
            end)
        local top_size = self.top_info_container:getContentSize() 
        self.world_map_node:setPosition(top_size.width-100, top_size.height-80)
    end
end

-- 刷新当前地图信息
function BttleTopDramaView:updateCurMapInfo( is_change_map )
    if self.world_map_node then
        self.drama_data = self.model:getDramaData()
        if self.drama_data then
            local map_config = Config.DungeonData.data_drama_dungeon_getmap_fun(self.drama_data.map_id)
            local drama_config = Config.DungeonData.data_drama_dungeon_info(self.drama_data.max_dun_id)
            -- 
            local _map_pos ={}
            _map_pos.pos = map_config.boss_pos2[1]

            print("--------------self.drama_data-----------1-----------",is_change_map)
            -- printLuaTable(self.drama_data)
            -- 容错处理，配置表删减关卡数据了，有些老号会取不到旧的关卡数据
            if not drama_config or next(drama_config) == nil then
                return
            end
            if self.world_map_node.name_label then
                self.world_map_node.name_label:setString(drama_config.name)
            end
            print("--------------self.drama_data-----------2-----------",self.cur_chapter_id)

            if is_change_map then
                local node_size = self.world_map_node:getContentSize()
                local world_config = Config.DungeonData.data_drama_world_info[self.drama_data.mode]
                if world_config and world_config[self.drama_data.chapter_id] then
                    local map_id =world_config[self.drama_data.chapter_id].map_id

                    if self.load_map_icon then
                        self.load_map_icon:DeleteMe()
                        self.load_map_icon = nil
                    end
                    -- local map_res = PathTool.getBattleSceneRes(_string_format("%s/blayer/small_map", map_id), true)
                    local map_res =   "resource/bigbg/hl_bigbg_79.png"
                    self.load_map_icon = createResourcesLoad(map_res, ResourcesType.single, function ()
                            if not self.map_icon_bg then
                                self.map_icon_bg = createSprite(map_res, 0, 0, self.world_map_node.map_cli_node, cc.p(0, 0), LOADTEXT_TYPE)
                            else
                                loadSpriteTexture(self.map_icon_bg, map_res, LOADTEXT_TYPE)
                            end
                            -- self.map_icon_bg:setScale(1/6)
                            local node_pos = self:getCliNodePos2(_map_pos)
                            self.map_icon_bg:setPosition(node_pos)
                            self.map_icon_bg:setScale(1/6)

                        end, self.load_map_icon)
                end
            elseif self.map_icon_bg then
                local node_pos = self:getCliNodePos2(_map_pos)
                self.map_icon_bg:setPosition(node_pos)
                self.map_icon_bg:setScale(1/6)

            end
        end
    end
end


function BttleTopDramaView:setTimeType( type )
    if type == 6 then
        self.cur_time_type = 1
    elseif type == 18 then
        self.cur_time_type = 2
    end
    if self.target_time_type ~= self.cur_time_type then
        self.target_time_type = self.cur_time_type
        if type == 6 then
            self.drama_background:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "battledrama/hl_battledrama_1024",false), LOADTEXT_TYPE)
            self.drama_background:setContentSize(cc.size(720,298))

            -- self.resources_model:loadTexture(PathTool.getResFrame("battledrama", "hl_battledrama_1019"), LOADTEXT_TYPE_PLIST)
            -- self.resources_model:setContentSize(cc.size(164,258))
        else
            self.drama_background:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "battledrama/hl_battledrama_1023",false), LOADTEXT_TYPE)
            self.drama_background:setContentSize(cc.size(720,290))

            -- self.resources_model:loadTexture(PathTool.getResFrame("battledrama", "hl_battledrama_1019"), LOADTEXT_TYPE_PLIST)
            -- self.resources_model:setContentSize(cc.size(164,258))
        end
    end
end

-- 获取小地图裁剪的位置
function BttleTopDramaView:getCliNodePos( info_config )
    if info_config and info_config.pos then

        local pos_x = info_config.pos[1]
        local pos_y = info_config.pos[2]
        local node_size = self.world_map_node:getContentSize()
        local icon_size = self.map_icon_bg:getContentSize()
        pos_x = pos_x/(1024/icon_size.width)
        pos_y = pos_y/(1024/icon_size.height)
        if not self.map_icon_flag then
            local flag_res = PathTool.getResFrame("battledrama","hl_battledrama_1010")
            self.map_icon_flag = createSprite(flag_res, pos_x, pos_y, self.map_icon_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
        end
        self.map_icon_flag:setPosition(cc.p(pos_x, pos_y))
        pos_x = - pos_x + node_size.width/2
        pos_y = - pos_y + node_size.height/2
        if pos_x < -(icon_size.width-node_size.width) then
            pos_x = -(icon_size.width-node_size.width)
        elseif pos_x > 0 then
            pos_x = 0
        end
        if pos_y < -(icon_size.height-node_size.height) then
            pos_y = -(icon_size.height-node_size.height)
        elseif pos_y > 0 then
            pos_y = 0
        end
        return cc.p(pos_x, pos_y)

    end
    return cc.p(0, 0)
end

-- 获取小地图裁剪的位置
function BttleTopDramaView:getCliNodePos2( info_config )
    if info_config and info_config.pos then

        -- local pos_x = info_config.pos[1]
        -- local pos_y = info_config.pos[2]
        -- local node_size = self.world_map_node:getContentSize()
        -- local icon_size = self.map_icon_bg:getContentSize()
        -- pos_x = pos_x/(3240/icon_size.width)
        -- pos_y = pos_y/(1920/icon_size.height)

         
        local pos_x = info_config.pos[1]/6
        local pos_y = info_config.pos[2]/6

        local node_size = self.world_map_node:getContentSize()
        local icon_size =  self.map_icon_bg:getContentSize()
        icon_size = cc.size(icon_size.width/6,icon_size.height/6)

        if not self.map_icon_flag1 then
            local flag_res = PathTool.getResFrame("battledrama","hl_battledrama_1010")
            self.map_icon_flag1 = createSprite(flag_res, pos_x, pos_y, self.map_icon_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
        end
        -- self.map_icon_flag1:setScale(6)
        -- self.map_icon_flag1:setPosition(cc.p(pos_x+1100, pos_y+400))
        pos_x = - pos_x +  node_size.width
        pos_y = - pos_y + node_size.width
        if pos_x < -(icon_size.width-node_size.width) then
            pos_x = -(icon_size.width-node_size.width)
        elseif pos_x > 0 then
            pos_x = 0
        end
        if pos_y < -(icon_size.height-node_size.height) then
            pos_y = -(icon_size.height-node_size.height)
        elseif pos_y > 0 then
            pos_y = 0
        end

        print("------pos_x,pos_y------------------------",pos_x,pos_y)
        return cc.p(pos_x, pos_y)

    end
    return cc.p(0, 0)
end
--==============================--
--desc:右边日常任务,排在右边的第一个位置
--@return 
--==============================--
function BttleTopDramaView:updateTaskInfo(status)
    if status == false then return end
    local need_update_pos = false
    if self.task_icon_vo == nil then
        local task_icon_vo = MainuiController:getInstance():getFucntionIconVoById(MainuiConst.icon.daily) 
        if task_icon_vo == nil then return end

        self.task_icon_vo = task_icon_vo 
        self.task_icon = self:createSpecialIcon(PathTool.getResFrame("battledrama", "battledrama_1016"), TI18N("日常任务"), LOADTEXT_TYPE_PLIST)
        self.task_icon:setPosition(52, 52)
        self.top_info_container:addChild(self.task_icon)

        self.task_icon.index = 1
        self.left_btn_list[1] = self.task_icon

        self.task_icon:addTouchEventListener(function(sender, event_type)
                customClickAction(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    MainuiController:getInstance():iconClickHandle(self.task_icon_vo.config.id)
                end
            end)

        if self.task_icon_event == nil then
            self.task_icon_event = self.task_icon_vo:Bind(FunctionIconVo.UPDATE_SELF_EVENT, function(key)
                    if key == "tips_status" then
                        self:checkTaskRed()
                    end
                end)
        end
        self:checkTaskRed()
        need_update_pos = true
    end
    if need_update_pos then
        self:updateRightBtnPos()
    end
end

--==============================--
--desc:任务红点
--@return 
--==============================--
function BttleTopDramaView:checkTaskRed()
    local is_show = false
    if self.task_icon_vo and self.task_icon_vo.tips_status_list and next(self.task_icon_vo.tips_status_list or {}) ~= nil then
        for i, v in ipairs(self.task_icon_vo.tips_status_list) do
            if v.num > 0 then
                is_show = true
                break
            end
        end
    end
    if self.task_icon and not _tolua_isnull(self.task_icon.tips) then
        self.task_icon.tips:setVisible(is_show)
    end
end


--==============================--
--desc:右边的图标列表,包含了日常和情报
--@return 
--==============================--
function BttleTopDramaView:updateRightBtnPos(is_right)
    if _tolua_isnull(self.top_info_container) then return end
    local btn_dict = {}
    if is_right == true then
        btn_dict = self.right_btn_list 
    else
        btn_dict = self.left_btn_list
    end
    if btn_dict == nil or next(btn_dict) == nil then return end
    local btn_list = {}
    for k,v in pairs(btn_dict) do
        if v.index ~= nil then
            _table_insert(btn_list, {index = v.index or 0, node = v})
        end

    end
    table.sort( btn_list, function(a, b) 
            return a.index < b.index
        end)

    local top_size = self.top_info_container:getContentSize()
    for i,v in ipairs(btn_list) do
        local _x, _y = 0, 0
        if is_right then
            _x = top_size.width - 0
            _y = 0 - (i - 1) * 94
        else
            _x = top_size.width-80  -(i - 1) * 94 
            _y = 20
        end

        if v.node and not _tolua_isnull(v.node) then
            v.node:setPosition(cc.p(_x, _y))    
        end
    end
end

--==============================--
--desc:右边章节奖励
--@return 
--==============================--
function BttleTopDramaView:updatePassCahpterInfo()
    if _tolua_isnull(self.top_info_container) then return end
    local config = self.model:getNewDramaRewardID()
    local need_update_pos = false
    if config then
        if self.reward_btn == nil then
            self.reward_btn = self:createSpecialIcon(PathTool.getResFrame("battledrama","hl_battledrama_1019"), TI18N("通关奖励"), LOADTEXT_TYPE_PLIST,50,60)
            self.top_info_container:addChild(self.reward_btn)

            self.reward_btn.index = 3
            self.left_btn_list[3] = self.reward_btn

            -- 引导需要
            self.reward_btn:setName("guidesign_battle_reward_btn")

            if not _tolua_isnull(self.reward_btn) then
                self.reward_btn:addTouchEventListener(function(sender, event_type)
                        customClickAction(sender, event_type)
                        if event_type == ccui.TouchEventType.ended then
                            BattleDramaController:getInstance():openDramRewardView(true)
                        end
                    end)
            end
            need_update_pos = true
        end
        -- 设置显示红点
        self.reward_btn.tips:setPosition(60,75)
        if not _tolua_isnull(self.reward_btn.tips) then
            local status = self.model:getDramaRewardRedPointInfo()
            self.reward_btn.tips:setVisible(status)
        end
    else
        if not _tolua_isnull(self.reward_btn) then
            --全副本通关，所有通关奖励领取完毕后清除按钮
            _table_remove(self.left_btn_list, self.reward_btn.index)
            self.reward_btn:removeFromParent()
            self.reward_btn = nil
            need_update_pos = true
        end
    end
    if need_update_pos then
        self:updateRightBtnPos(false)
    end
end

--==============================--
--desc:更新排行榜数据
--@status:
--@return 
--==============================--
-- function BttleTopDramaView:updateRankInfo(status)
--     if status == false then return end
--     if self.rank_icon_vo == nil then
--         local rank_icon_vo = MainuiController:getInstance():getFucntionIconVoById(MainuiConst.icon.rank)
--         if rank_icon_vo == nil then return end

--         self.rank_icon_vo = rank_icon_vo
--         self.rank_icon = self:createSpecialIcon(PathTool.getResFrame("battledrama", "battledrama_1015"), TI18N("排行榜"), LOADTEXT_TYPE_PLIST)
--         self.top_info_container:addChild(self.rank_icon)

--         self.rank_icon.index = 4
--         self.left_btn_list[4] = self.rank_icon

--         self.rank_icon:addTouchEventListener(function(sender, event_type)
--             customClickAction(sender, event_type)
--             if event_type == ccui.TouchEventType.ended then
--                 RankController:getInstance():openRankView(true, RankConstant.RankType.drama)
--             end
--         end)

--         self:updateRightBtnPos(false)
--     end 
-- end

--==============================--
--desc:通关录像图标(现改为我要变强)
--@return 
--==============================--
function BttleTopDramaView:updatePassCahpterVideo( )
    if _tolua_isnull(self.top_info_container) then return end
    local need_update_pos = false
    if self.strong_btn == nil then
        self.strong_btn = self:createSpecialIcon(PathTool.getResFrame("battledrama","battledrama_1024"), TI18N("我要变强"), LOADTEXT_TYPE_PLIST)
        self.top_info_container:addChild(self.strong_btn)

        self.strong_btn.index = 2
        self.left_btn_list[2] = self.strong_btn

        -- 引导需要
        self.strong_btn:setName("hero_btn")

        if not _tolua_isnull(self.strong_btn) then
            self.strong_btn:addTouchEventListener(function(sender, event_type)
                    customClickAction(sender, event_type)
                    if event_type == ccui.TouchEventType.ended then
                        playCommonButtonSound()
                        StrongerController:getInstance():openMainWin(true)
                    end
                end)
        end

        need_update_pos = true
    end

    if need_update_pos then
        self:updateRightBtnPos()
    end
end

--==============================--
--desc:冒险奇遇图标
--@return 
--==============================--
--[[function BttleTopDramaView:updateEncounter( )
local encounter_lev = Config.EncounterData.data_encounter_const.encounter_lev
if self.role_vo and encounter_lev ~= nil and self.role_vo.lev < encounter_lev.val then return end
if _tolua_isnull(self.top_info_container) then return end

if self.encounter_btn == nil then
    self.encounter_btn = self:createSpecialIcon(PathTool.getResFrame("battledrama","battledrama_1024"), TI18N("冒险奇遇"), LOADTEXT_TYPE_PLIST)
    self.top_info_container:addChild(self.encounter_btn)

    if not _tolua_isnull(self.encounter_btn) then
        self.encounter_btn:addTouchEventListener(function(sender, event_type)
                customClickAction(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    playCommonButtonSound()
                    local encounterId = EncounterController:getInstance():getModel():getEncounterId()
                    EncounterController:getInstance():openEncounterWindow(true,encounterId)    
                end
            end)
    end
end
local top_size = self.top_info_container:getContentSize()
self.encounter_btn:setPosition(top_size.width - 165, top_size.height - 200)
self:checkEncounterRed()
end--]]

function BttleTopDramaView:checkEncounterRed( )
    --local is_show_red = EncounterController:getInstance():getModel():getRedStatus()
    -- if self.encounter_btn then
    --     addRedPointToNodeByStatus(self.encounter_btn, is_show_red, 5, 5)
    -- end
end

function BttleTopDramaView:checkEncounterOpenStatus( )
    local is_open = true
    local encounter_lev = Config.EncounterData.data_encounter_const.encounter_lev
    if self.role_vo and encounter_lev ~= nil and self.role_vo.lev < encounter_lev.val then 
        is_open = false
    end
    if is_open then
        setChildUnEnabled(false, self.encounter_btn)
        self.encounter_btn_label:setTextColor(cc.c4b(0xff,0xf4,0xc8,0xff))
        self.encounter_btn_label:enableOutline(cc.c4b(0x4f,0x16,0x00,0xff), 2)
    else
        setChildUnEnabled(true, self.encounter_btn)
        self.encounter_btn_label:setTextColor(Config.ColorData.data_color4[1])
        self.encounter_btn_label:enableOutline(cc.c4b(0x49,0x49,0x49,0xff), 2)
    end
end

-- 世界等级
function BttleTopDramaView:updateWorldLevelIcon(  )
    -- if self.role_vo and self.role_vo.lev < 60 then return end
    -- if _tolua_isnull(self.top_info_container) then return end
    -- local need_update_pos = false
    -- if not self.world_lv_btn then
    --     local top_size = self.top_info_container:getContentSize()
    --     local pos_x = top_size.width - 150
    --     local pos_y = top_size.height - 40
    --     self.world_lv_btn = createImage(self.top_info_container, PathTool.getResFrame("common","txt_cn_common_90022"), pos_x, pos_y, cc.p(0.5, 0.5), true)
    --     self.world_lv_btn:setTouchEnabled(true)

    --     self.world_lv_btn.index = 6
    --     self.left_btn_list[6] = self.world_lv_btn

    --     registerButtonEventListener(self.world_lv_btn, function (  )
    --             self:showWorldLevelTips(true)
    --         end, true)
    --     need_update_pos = true
    -- end
    -- if need_update_pos then
    --     self:updateRightBtnPos()
    -- end
end

-- 显示世界等级tips
function BttleTopDramaView:showWorldLevelTips( status )
    if status == true then
        if not self.world_lv_layout then
            self.world_lv_layout = ccui.Layout:create()
            self.world_lv_layout:setTouchEnabled(true)
            self.world_lv_layout:setSwallowTouches(false)
            self.world_lv_layout:setContentSize(self.main_size)
            self.world_lv_layout:setLocalZOrder(999)
            self.world_lv_layout:setAnchorPoint(cc.p(0.5, 0.5))
            self.world_lv_layout:setPosition(self.main_size.width * 0.5, self.main_size.height * 0.5)
            self:addChild(self.world_lv_layout,1)
            registerButtonEventListener(self.world_lv_layout, function (  )
                    self:showWorldLevelTips(false)
                end)

            -- 背景
            local world_pos = self.world_lv_btn:convertToWorldSpace(cc.p(0, 0))
            local local_pos = self.world_lv_layout:convertToNodeSpace(world_pos) 
            local world_lv_bg = createImage(self.world_lv_layout, PathTool.getResFrame("common","common_1056"), local_pos.x-50, local_pos.y-20, cc.p(0.5, 1), true, nil, true)
            world_lv_bg:setTouchEnabled(true)
            local world_bg_size = cc.size(400, 150)

            -- 世界等级描述
            local world_lev_cfg = Config.WorldLevData.data_const["worldlev_des"]
            if world_lev_cfg then
                local world_lv_desc = createLabel(24,161,nil,30,85,world_lev_cfg.desc,world_lv_bg,nil,cc.p(0, 1))
                world_lv_desc:setMaxLineWidth(350)
                local desc_size = world_lv_desc:getContentSize()
                world_bg_size.height = world_bg_size.height + desc_size.height
                world_lv_desc:setPosition(cc.p(30, world_bg_size.height-90))
            end
            world_lv_bg:setContentSize(world_bg_size)

            -- 图标
            local world_lv_icon = createSprite(PathTool.getResFrame("common","txt_cn_common_90022"), 50, world_bg_size.height-40, world_lv_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
            local world_lv_title = createLabel(26,161,nil,85,world_bg_size.height-40,TI18N("世界等级"),world_lv_bg,nil,cc.p(0, 0.5))
            local world_lv_line = createSprite(PathTool.getResFrame("common","common_1072"), 200, world_bg_size.height-75, world_lv_bg, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
            world_lv_line:setScaleY(3)
            world_lv_line:setRotation(90)

            -- 世界等级
            self.world_lv_txt = createRichLabel(24, 161, cc.p(0, 0.5), cc.p(30, 35))
            world_lv_bg:addChild(self.world_lv_txt)
            local world_lev = RoleController:getInstance():getModel():getWorldLev()
            self.world_lv_txt:setString(string.format(TI18N("当前世界等级:<div fontcolor=#249003>%d级</div>"), world_lev))
        end
        self.world_lv_layout:setVisible(true)
    elseif self.world_lv_layout then
        self.world_lv_layout:setVisible(false)
    end
end

--==============================--
--desc:剧情副本创建下面的挑战BOSS,快速作战,英雄变强,以及资产收益组件
--@return 
--==============================--
function BttleTopDramaView:createDramaButton(  )
    if not _tolua_isnull(self.btn_layout) then
        if not self.battle_button_list then
            self.battle_button_list = createCSBNote(PathTool.getTargetCSB("battle/battle_button_list"))
            self.battle_button_list:setAnchorPoint(cc.p(0.5, 0))
            self.battle_button_list:setPositionY(0)
            self.btn_layout:addChild(self.battle_button_list)

            local image_bg = self.battle_button_list:getChildByName("image_bg")

            self.drama_background = self.battle_button_list:getChildByName("background")
            self.drama_reward_layout = self.battle_button_list:getChildByName("reward_layout")
            self.resour_collect = self.battle_button_list:getChildByName("resour_collect")
            -- self.drama_item_scrollview = self.battle_button_list:getChildByName("item_scrollview")
            -- self.drama_item_scrollview:setScrollBarEnabled(false)
            -- self.drama_item_scrollview:setSwallowTouches(false)



            -- 掉落详细按钮
            self.detail_btn = self.battle_button_list:getChildByName("detail_btn")
            self.detail_btn:addTouchEventListener(function(sender, event_type)
                    customClickAction(sender, event_type)
                    if event_type == ccui.TouchEventType.ended then
                        BattleDramaController:getInstance():openDramDropWindows(true)
                    end
                end)

            -- 挑战bOSS
            -- self.next_battle_btn = self.battle_button_list:getChildByName("next_battle_btn")
            -- self.boss_btn_notice = self.next_battle_btn:getChildByName("notice_label")

            self.next_battle_btn ={}

            self.boss_btn_challenge = self.battle_button_list:getChildByName("challenge_item")
            self.quick_Image_3 = self.battle_button_list:getChildByName("Image_3")
            self.quick_num_label=createRichLabel(20, cc.c3b(255,255,255), cc.p(0.5,0.5), cc.p(636, 190), nil, nil, 180)
            self.battle_button_list:addChild(self.quick_num_label)
            -- self.boss_btn_challenge_effect = createEffectSpine(Config.EffectData.data_effect_info[107], cc.p(95, 31), cc.p(0.5, 0.5), true, PlayerAction.action, nil, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
            -- self.boss_btn_challenge:addChild(self.boss_btn_challenge_effect, -1)
            self.boss_btn_challenge:addTouchEventListener(function(sender, event_type)
                    customClickAction(sender, event_type)
                    if event_type == ccui.TouchEventType.ended then
                        if not self.map_scroll_view:isVisible() then
                            message(TI18N("当前正在战斗中"))
                            return
                        end
                        if self.next_battle_btn.lev_limit and self.next_battle_btn.lev_limit > 0 then
                            message(TI18N("等级不足"))
                        elseif self.next_battle_btn.battle_status == 3 then
                            _controller:send13002()
                        else
                            self.drama_data.dun_id = self.default_dun_id
                            HeroController:getInstance():openFormGoFightPanel(true,nil,{checkpoint_id = self.default_dun_id})
                        end
                    end
                end)
                -- if  self.next_battle_btn then 
                -- self.next_battle_btn:addTouchEventListener(function(sender, event_type)
                --         customClickAction(sender, event_type)
                --         if event_type == ccui.TouchEventType.ended then
                --             if not self.map_scroll_view:isVisible() then
                --                 message(TI18N("当前正在战斗中"))
                --                 return
                --             end
                --             if self.next_battle_btn and self.next_battle_btn.lev_limit > 0 then
                --                 message(TI18N("等级不足"))
                --             elseif self.next_battle_btn.battle_status == 3 then
                --                 _controller:send13002()
                --             else
                --                 self.drama_data.dun_id = self.default_dun_id
                --                 HeroController:getInstance():openFormGoFightPanel(true,nil,{checkpoint_id = self.default_dun_id})
                --             end
                --         end
                --     end)
                -- end 

            -- 冷却时间
            self.next_battle_time = self.battle_button_list:getChildByName("next_battle_time")
            self.next_battle_time_label = self.next_battle_time:getChildByName("label")

            -- 冒险奇遇 --改为我要变强
            -- self.encounter_btn = self.battle_button_list:getChildByName("encounter_btn")
            -- self.encounter_btn_label = self.encounter_btn:getChildByName("label")
            -- self.encounter_btn_label:setString(TI18N("我要变强"))
            -- self.encounter_btn:addTouchEventListener(function(sender, event_type)
            --         customClickAction(sender, event_type)
            --         if event_type == ccui.TouchEventType.ended then
            --             playCommonButtonSound()
            --             StrongerController:getInstance():openMainWin(true)
            --         end
            --     end)


            -- 引导需要
            --self.encounter_btn:setName("hero_btn")

            -- 快速作战
            self.quick_battle_btn = self.battle_button_list:getChildByName("quick_battle_btn")
            resetStudioButton(self.quick_battle_btn,ButtonType.red,TI18N(""))
            self.quick_battle_tips = self.quick_battle_btn:getChildByName("tips")
            self.quick_battle_tips:setVisible(false)

            registerButtonEventListener(self.quick_battle_btn, function (  )
                    self:onQuick()
                    -- if self.quick_battle_status == true then
                    --     _controller:openDramBattleQuickView(true)
                    --     _drama_model:setOpenQuickBattleStatus(true)
                    --     _drama_model:checkRedPoint()
                    --     self.quick_battle_tips:setVisible(false)
                    -- end
                end, true, 1)
        end

        -- 当前资源宝箱
        if self.resour_collect then
            self.is_in_collect = false

            local container = self.resour_collect
            self.resources_progress = container:getChildByName("progress")              -- 宝箱进度
            local time_container = container:getChildByName("time_container")
            self.resources_time_label = time_container:getChildByName("time_label")
           self.resources_model = self.resour_collect:getChildByName("resources_model")
           local sp = time_container:getChildByName("Sprite_5")
           sp:setVisible(false)
           local newSpt = createImage(time_container,"resource/common2/segment/hl_common_0009.png",sp:getPositionX(),sp:getPositionY(),cc.p(0.5, 0.5),nil,-1,true)
           newSpt:setScaleX(-0.40)
           newSpt:setScaleY(0.45)

           -- self.resources_box = createEffectSpine(PathTool.getEffectRes(282), cc.p(40, 5), cc.p(0.5, 0.5), true, PlayerAction.action)  -- 宝箱特效
            -- self.resour_collect:addChild(self.resources_box)


            registerButtonEventListener(self.resources_model, function (  )
                self.resour_collect:stopAllActions()
                self.resour_collect:runAction(cc.Sequence:create(cc.ScaleTo:create(0.1, 0.95), cc.ScaleTo:create(0.1, 1)))
                if self.resources_action == PlayerAction.action then
                    message(TI18N("需要累积一定收益才能领取噢~"))
                else
                    -- if self.is_in_collect == true then return end
                    -- self.is_in_collect = true

                    local requestGetAwardFunc = function (  )
                        --if not _tolua_isnull(self.resources_box) then
                        local play_action = PlayerAction.action_2
                        if self.resources_action == PlayerAction.action_3 then
                            play_action = PlayerAction.action_4
                        elseif self.resources_action == PlayerAction.action_5 then
                            play_action = PlayerAction.action_6
                        end
                        --self.resources_box:setToSetupPose()
                        --self.resources_box:setAnimation(0, play_action, false)
                        BattleDramaController:getInstance():requestGetHookTimeAwards()

                        -- delayRun(self.resour_collect, 1.5, function()
                        --         self.is_in_collect = false
                        --         BattleDramaController:getInstance():requestGetHookTimeAwards()
                        --     end)
                        --end
                    end

                    local hook_info = _drama_model:getHookAccumulateInfo()
                    local cur_energy = self.role_vo.energy
                    local max_energy = self.role_vo.energy_max
                    local qingbao_val = 0 -- 可领取的情报值
                    if hook_info and hook_info.list then
                        for k,v in pairs(hook_info.list) do
                            if v.bid == Config.ItemData.data_assets_label2id.energy then
                                qingbao_val = v.num
                                break
                            end
                        end
                    end
                    if (cur_energy+qingbao_val) > max_energy then
                        if self.tips_alert then
                            self.tips_alert:close()
                            self.tips_alert = nil
                        end

                        local function call_back()
                            requestGetAwardFunc()
                            if self.tips_alert then
                                self.tips_alert:close()
                                self.tips_alert = nil
                            end
                        end
                        local function cancel_callback(  )
                            self.is_in_collect = false
                            if self.tips_alert then
                                self.tips_alert:close()
                                self.tips_alert = nil
                            end
                        end
                        local str = string.format("当前已有<div fontcolor=#249003>%s/%s</div>远航情报，领取后超出上限部分将损失，是否确认领取？", cur_energy, max_energy)
                        self.tips_alert = CommonAlert.show(str, TI18N("确定"), call_back, TI18N("取消"), cancel_callback, CommonAlert.type.rich,nil,nil,24)
                    else
                        requestGetAwardFunc()
                    end
                end
            end, true, 1)

        self.resources_action = PlayerAction.action
        self:updateResourceCollect()
    end

    self:updateNextBtnStatus(self.model:getDramaData())
    self:updateDramaDropInfo()
    self:updateBtnLayerStatus(self.btn_layout_status)
    BattleController:getInstance():playDrame()
end


    --变换白天黑夜
    local type = MainSceneController:getInstance():getMainScene():getCurTimeType()
    if type == 1 then
        type = 6
    else
        type = 18
    end
    self:setTimeType(type)
end

function BttleTopDramaView:playResourceCollect( x, y )
    if not self.resour_collect or _tolua_isnull(self.resour_collect) then return end
    if self.fly_item_sum and self.fly_item_sum >= 30 then return end  
    if self.fly_item_list and #self.fly_item_list >= 30 then return end

    local init_pos = self.btn_layout:convertToNodeSpace(cc.p(x, y))                        -- 起始位置
    local target_pos = self.resour_collect:convertToWorldSpace(cc.p(0, 0))
    target_pos = self.btn_layout:convertToNodeSpace(target_pos)                            -- 目标位置

    if self.fly_item_list == nil then
        self.fly_item_list = {}
    end
    if self.fly_cache_item_list == nil then
        self.fly_cache_item_list = {}
    end
    -- local wealth_list = {2, 5, 10008, 40204}
    local sum = math.random(10, 11)
    for i = 1, sum do
        local _x =(1 - math.random(0, 2)) * math.random(0, 40) + init_pos.x
        local _y =(1 - math.random(0, 2)) * math.random(0, 40) + init_pos.y
        -- local _index = math.random(1,#wealth_list)
        local _index = math.random(1, 4)
        local _item_res = PathTool.getResFrame("battledrama", "battledrama_resoure_" .. _index)

        local object = {}
        if #self.fly_cache_item_list == 0 then
            object.item = createSprite(_item_res, _x, _y, self.btn_layout, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST, 999)
            object.res_id = _item_res
        else
            object = _table_remove(self.fly_cache_item_list, 1)         -- 取出第一个
        end

        if object.item and object.res_id then
            object.item:setScale((1))
            object.item:setVisible(true)
            object.item:setPosition(_x, _y)
            if object.res_id ~= _item_res then
                object.res_id = _item_res
                loadSpriteTexture(object.item, _item_res, LOADTEXT_TYPE_PLIST)
            end
            _table_insert(self.fly_item_list, object)
        end
    end
    -- 定时飞
    if self.fly_timer == nil then
        self.fly_timer = GlobalTimeTicket:getInstance():add(function()
                if self.fly_item_list == nil or next(self.fly_item_list) == nil then
                    self:clearFlyTimer()
                    return
                end
                local object = table.remove(self.fly_item_list, 1)
                local _x, _y = object.item:getPosition()
                self.fly_item_sum = self.fly_item_sum + 1
                self:flyEnergyToWealth(object, cc.p(_x, _y), target_pos, #self.fly_item_list + 1)
            end, 0.01)
    end
end

function BttleTopDramaView:flyEnergyToWealth(object, init_pos, target_pos, index)
    if object == nil or _tolua_isnull(object.item) then return end

    local bezier = {}
    local begin_pos = cc.p(init_pos.x, init_pos.y)
    table.insert(bezier, begin_pos)

    local end_pos = cc.p(target_pos.x + 55, target_pos.y + 55)
    local min_pos = cc.pMidpoint(begin_pos, end_pos)

    local off_y = 10
    local off_x = - 30
    if index % 2 == 0 then
        off_y = math.random(100, 150)
        off_x = 30
    end

    local controll_pos = cc.p(min_pos.x + off_x, begin_pos.y - off_y)
    table.insert(bezier, controll_pos)
    table.insert(bezier, end_pos)

    local bezierTo = cc.BezierTo:create(1, bezier)
    local call_fun = cc.CallFunc:create(function()
            object.item:setVisible(false)
            self.fly_item_sum = self.fly_item_sum - 1
            _table_insert(self.fly_cache_item_list, object)
        end)

    local seq = cc.Sequence:create(bezierTo, call_fun)
    local scale_to = cc.ScaleTo:create(1, 0.2)
    local spawn = cc.Spawn:create(scale_to, seq)
    object.item:runAction(spawn)
end

-- 将fly_item_list中全部移到cache中
function BttleTopDramaView:clearAllFlyItemList(  )
    if self.fly_item_list and self.fly_cache_item_list then
        for i=#self.fly_item_list,1,-1 do
            local object = table.remove(self.fly_item_list, 1)
            object.item:setVisible(false)
            _table_insert(self.fly_cache_item_list, object)
        end
    end
end

function BttleTopDramaView:clearFlyTimer()
    if self.fly_timer then
        GlobalTimeTicket:getInstance():remove(self.fly_timer)
        self.fly_timer = nil
    end
end

--==============================--
--desc:设置挑战BOSS按钮状态以及快速作战的红点
--@time:倒计时时间
--@return
--==============================--
function BttleTopDramaView:updateNextBtnStatus(data)
    if data == nil then return end
    print("-------------updateNextBtnStatus---------------------",data.status)
    printLuaTable(data)
    local status = 0
    self:checkQuickRed()
    if not _tolua_isnull(self.next_battle_time) then
        self.next_battle_time:setVisible(false)
        -- self.next_chapter_btn1:setVisible(false)
        self.next_battle_btn.lev_limit = 0

        local cur_dungeon_config = Config.DungeonData.data_drama_dungeon_info(data.max_dun_id)
        if cur_dungeon_config then
            local next_id = cur_dungeon_config.next_id
            if next_id == 0 then
                -- self.next_chapter_btn1:setVisible(false)
                return
            end
        end

        if data.status == 2 and data.cool_time == 0 then            --可挑战
            local role_vo_lev = RoleController:getInstance():getRoleVo().lev or 0
            local config = Config.DungeonData.data_drama_dungeon_info(data.dun_id)
            -- self.next_chapter_btn1:setVisible(true)
            status = data.status
            if config and config.lev_limit and config.lev_limit > role_vo_lev then
                self.next_battle_btn.lev_limit = config.lev_limit
                -- self.boss_btn_notice:setVisible(true)
                self.boss_btn_challenge:setVisible(false)
                -- self.boss_btn_notice:setString(string.format(TI18N("%s级可挑战"), config.lev_limit))
            else
                -- self.boss_btn_notice:setVisible(false)
                self.boss_btn_challenge:setVisible(true)
                -- self.next_chapter_btn1:setVisible(false)
            end
        elseif data.status == 1 and data.cool_time ~= 0 then        --冷却中
            status = data.status
            self.next_battle_time:setVisible(true)
            -- self.next_chapter_btn1:setVisible(false)
            self:updateCoolTimer(data.cool_time)
        elseif data.status == 3 then                                --已通过
            status = data.status
            -- self.next_chapter_btn1:setVisible(true)
            -- self.boss_btn_notice:setVisible(true)
            self.boss_btn_challenge:setVisible(false)
            -- self.boss_btn_notice:setString(TI18N("前往下一章"))

            -- self.boss_btn_notice
        end
        -- 保存一下挑战按钮的状态
        self.next_battle_btn.battle_status = status
    end
end

function BttleTopDramaView:setBossBtnNotice()
    local map_id = self.model:getDramaData().map_id or 10001
    local config = Config.DungeonData.data_drama_dungeon_getmap_fun(map_id)

    if config and config.boss_pos then
         local last_pos =  config.boss_pos[#config.boss_pos]

    end

end 

--==============================--
--desc:挑战BOSS倒计时
--@time:倒计时时间
--@return
--==============================--
function BttleTopDramaView:updateCoolTimer(time)
    if _tolua_isnull(self.next_battle_time_label) then return end
    if time ~= 0 and time then
        if not self.cool_timer then
            self.battl_cool_timer = 0
            self.next_battle_time_label:setString(TimeTool.GetMinSecTime(time - GameNet:getInstance():getTime()))

            local call_back = function()
                self.battl_cool_timer = time - GameNet:getInstance():getTime()
                local new_time = self.battl_cool_timer or 0
                if new_time >= 1 and new_time ~= nil then
                    if not _tolua_isnull(self.next_battle_time_label) then
                        self.next_battle_time_label:setString(TimeTool.GetMinSecTime(new_time))
                    end
                else
                    self:clearCoolTimer()
                end
            end
            self.cool_timer = GlobalTimeTicket:getInstance():add(call_back, 1, 0)
        end
    else
        self:clearCoolTimer()
    end
end

function BttleTopDramaView:clearCoolTimer()
    if self.cool_timer then
        GlobalTimeTicket:getInstance():remove(self.cool_timer)
        self.cool_timer = nil
    end
end

--==============================--
--desc:更新快速作战红点状态
--@return 
--==============================--
function BttleTopDramaView:checkQuickRed()
    local drama_data = _drama_model:getDramaData()
    if drama_data == nil then return end
    if not _tolua_isnull(self.quick_battle_btn) then
        local limit_dun = Config.DungeonData.data_drama_const["fast_combat_first"].val
        local is_open = false
        if drama_data.max_dun_id >= limit_dun then
            is_open = true
        end
        if self.quick_battle_status ~= is_open then
            self.quick_battle_status = is_open
            if is_open then
            --    setChildUnEnabled(false, self.quick_battle_btn)
            else
             --   setChildUnEnabled(true, self.quick_battle_btn)
            end
        end

        if _drama_model:getOpenQuickBattleStatus() == false then --有免费次数
            local data = _drama_model:getQuickData()
            local num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(Config.DungeonData.data_drama_const["quick_swap_item"].val)
            if is_open == true then
                if data and data.fast_combat_num == 0 or num > 0 then
                    self.quick_battle_tips:setVisible(true)
                end
            end
        else
            self.quick_battle_tips:setVisible(false)
        end
    end
end

-- 刷新副本挂机收益、掉落信息
function BttleTopDramaView:updateDramaDropInfo(  )
    self:checkQuickBattle()
    -- if self.drama_reward_layout and not _tolua_isnull(self.drama_reward_layout) then
    --     local drama_data = _drama_model:getDramaData()
    --     if drama_data == nil then return end
    --     local drama_config
    --     if not self.cur_drama_max_id and drama_data.max_dun_id == 0 then
    --         drama_config = Config.DungeonData.data_drama_dungeon_info(10010)
    --     else
    --         if self.cur_drama_max_id == drama_data.max_dun_id then return end
    --         drama_config = Config.DungeonData.data_drama_dungeon_info(drama_data.max_dun_id)
    --     end
    --     if drama_config == nil then return end
    --     self.cur_drama_max_id = drama_data.max_dun_id
    --     -- 挂机收益信息
    --     self.drama_item_labels = self.drama_item_labels or {}
    --     for i,v in ipairs(self.drama_item_labels) do
    --         v:setVisible(false)
    --     end
    --     local start_x = 0
    --     local offset_x = 30
    --     local label_len = 0
    --     for i, v in ipairs(drama_config.per_hook_items) do
    --         local label = self.drama_item_labels[i]
    --         if label == nil then
    --             label = createRichLabel(20, cc.c3b(0xfa,0xe7,0xe8), cc.p(0,0.5), cc.p(_x, 22), nil, nil, 180)
    --             self.drama_item_labels[i] = label
    --             self.drama_reward_layout:addChild(label)
    --         end
    --         local config = Config.ItemData.data_get_data(v[1])
    --         local str = string.format(TI18N("<img src=%s visible=true scale=0.3 /><div fontcolor=#fae7e8>%s/m</div>"), PathTool.getItemRes(config.icon), v[2])
    --         label:setString(str)
    --         label:setVisible(true)
    --         local _x = start_x + label_len
    --         label:setPositionX(_x)
    --         label_len = label_len + label:getContentSize().width + offset_x
    --     end

    --     -- 关卡掉落信息
    --     -- self.drama_item_list = self.drama_item_list or {}
    --     -- for k,v in pairs(self.drama_item_list) do
    --     --     v:setVisible(false)
    --     -- end
    --     -- local item_datas = drama_config.hook_show_items
    --     -- local scale = 0.7
    --     -- local space_x = 18
    --     -- local start_x = 5
    --     -- local total_width = #item_datas * BackPackItem.Width * scale + (#item_datas-1) * space_x
    --     -- local max_width = math.max(self.drama_item_scrollview:getContentSize().width, total_width)
    --     -- self.drama_item_scrollview:setInnerContainerSize(cc.size(max_width, self.drama_item_scrollview:getContentSize().height))

    --     -- for i, v in ipairs(item_datas) do
    --     --     if self.init_drop_flag then
    --     --         self:createDramaDropItem( v, i, scale, space_x, start_x)
    --     --     else
    --     --         delayRun(self.drama_item_scrollview,i / display.DEFAULT_FPS,function ()
    --     --                 self:createDramaDropItem( v, i, scale, space_x, start_x)
    --     --                 self.init_drop_flag = true -- 创建的时候才分帧
    --     --             end)
    --     --     end
    --     -- end
    -- end
end

function BttleTopDramaView:createDramaDropItem( data, index, scale, space_x, start_x )
    local item = self.drama_item_list[index]
    if not item then
        item = BackPackItem.new(true, true)
        item:setDefaultTip()
        item:setAnchorPoint(0, 0.5)
        item:setScale(scale)
        self.drama_item_scrollview:addChild(item)
        self.drama_item_list[index] = item
    end
    item:setVisible(true)
    local _x = start_x + (index - 1) * (BackPackItem.Width * scale + space_x)
    item:setPosition(_x, self.drama_item_scrollview:getContentSize().height / 2)
    item:setBaseData(data[1], data[2], true)
end

function BttleTopDramaView:updateBtnLayerStatus( status )
    self.btn_layout_status = status -- 缓存一下显示状态
    if self.btn_layout and not _tolua_isnull(self.btn_layout) then
        self.btn_layout:setVisible(status)
        -- 剧情战斗
        if self.battle_type == BattleConst.Fight_Type.Darma then
            self.btn_layout:setVisible(true)
            if self.resour_collect then
                self.resour_collect:setVisible(status)
            end
            if self.hallows_layout then
                self.hallows_layout:setVisible(status)
            end
            if self.boss_btn_challenge_effect then
                self.boss_btn_challenge_effect:setVisible(status)
            end
        else
            self.btn_layout:setVisible(status)
        end
    end
end

-- 创建剧情副本的战法相关
function BttleTopDramaView:updataZhenfaInfo( status, data )
    print("===========updataZhenfaInfo==============",status)
    MainuiController:getInstance():setIsShowMainUITop(not status)
    if self.top_info_container then
        self.top_info_container:setVisible(not status)
    end
    if self.battle_button_list then
        self.battle_button_list:setVisible(not status)
    end


    if status == true then
        if data.formation == nil then return end
        local form_info = {}
        for i, v in pairs(data.formation) do
            form_info[v.group] = {v.formation_type or 1, v.formation_lev or 0}
        end
        -- 不满足任何一个条件,都直接不处理
        if form_info[1] == nil or form_info[2] == nil or form_info[1][1] == nil or form_info[1][2] == nil or form_info[2][1] == nil or form_info[2][2] == nil then return end
        if self.btn_layout and not _tolua_isnull(self.btn_layout) then
            if _tolua_isnull(self.form_view) then
                self.form_view = createCSBNote(PathTool.getTargetCSB("battle/battle_form_view"))
                self.form_view:setAnchorPoint(cc.p(0.5, 1))
                self.btn_layout:addChild(self.form_view, 999)
                self.form_view:setPosition(0, display.getTop(self) - MainuiController:getInstance():getBottomHeight())

                self.halo_info_btn = self.form_view:getChildByName("halo_info_btn")
                self.halo_info_label = self.halo_info_btn:getChildByName("label")
                self.halo_info_label:setString(TI18N("克制"))

                registerButtonEventListener(self.halo_info_btn, function ()
                        BattleController:getInstance():openBattleCampInfoView(true)
                    end ,true, 2)

                self.left_btn = self.form_view:getChildByName("left_btn")
                self.left_form_icon = self.left_btn:getChildByName("icon")

                self.right_btn = self.form_view:getChildByName("right_btn")
                self.right_form_icon = self.right_btn:getChildByName("icon")

                self.buff_btn = self.form_view:getChildByName("buff_btn")
                self.buff_btn:setOpacity(0)
                self.buff_btn:runAction(cc.FadeIn:create(0.7)) -- 延迟一些显示，避免可能打开buff界面却还没有数据
                registerButtonEventListener(self.buff_btn, function (  )
                        local left_name = data.actor_role_name
                        local right_name = data.target_role_name
                        local group = _b_controller:getModel():getGroup()
                        if group == BattleGroupTypeConf.TYPE_GROUP_ENEMY and not _b_controller:getWatchReplayStatus() then
                            left_name = data.target_role_name
                            right_name = data.actor_role_name
                        end
                        _b_controller:openBattleBuffInfoView(true, left_name, right_name)
                    end, true)

                local image_2 = self.form_view:getChildByName("image_2")
                self.round_label = image_2:getChildByName("round_label")

                self.left_name_panel = self.form_view:getChildByName("left_name_panel")
                self.right_name_panel = self.form_view:getChildByName("right_name_panel")
                self.left_name_label = self.left_name_panel:getChildByName("left_name_label")
                self.right_name_label = self.right_name_panel:getChildByName("right_name_label")

                self.left_camp_btn = self.form_view:getChildByName("left_camp_btn")
                self.right_camp_btn = self.form_view:getChildByName("right_camp_btn")
            end

            -- 阵法图标
            if not _tolua_isnull(self.form_view) then
                loadSpriteTexture(self.left_form_icon, PathTool.getResFrame("form", "hl_form_icon_" .. form_info[1] [1]), LOADTEXT_TYPE_PLIST)
                loadSpriteTexture(self.right_form_icon, PathTool.getResFrame("form", "hl_form_icon_" .. form_info[2] [1]), LOADTEXT_TYPE_PLIST)
            end

            -- 阵营图标
            local halo_list = data.halo_list or {}
            local left_halo_id = 0  -- 左侧光环id
            local right_halo_id = 0 -- 右侧光环id
            for k,v in pairs(halo_list) do
                if v.group == 1 then
                    left_halo_id = v.type
                elseif v.group == 2 then
                    right_halo_id = v.type
                end
            end
            local left_halo_id_list = {}
            local right_halo_id_list = {}
            -- 兼容旧的录像数据，可能发过来的阵营光环id还是旧的，需要转换为新的id
            if left_halo_id < 100 then
                left_halo_id_list = BattleConst.Old_Halo_Id_Change[left_halo_id] or {}
            else
                local left_id_1 = math.floor(left_halo_id/10000)
                local left_id_2 = math.floor((left_halo_id%10000)/100)
                local left_id_3 = left_halo_id%100
                if left_id_1 > 0 then
                    _table_insert(left_halo_id_list, left_id_1)
                end
                if left_id_2 > 0 then
                    _table_insert(left_halo_id_list, left_id_2)
                end

                if left_id_3 > 0 then
                    _table_insert(left_halo_id_list, left_id_3)
                end
            end
            -- 兼容旧的录像数据，可能发过来的阵营光环id还是旧的，需要转换为新的id
            if right_halo_id < 100 then
                right_halo_id_list = BattleConst.Old_Halo_Id_Change[right_halo_id] or {}
            else
                local right_id_1 = math.floor(right_halo_id/10000)
                local right_id_2 = math.floor((right_halo_id%10000)/100)
                local right_id_3 = right_halo_id%100
                if right_id_1 > 0 then
                    _table_insert(right_halo_id_list, right_id_1)
                end
                if right_id_2 > 0 then
                    _table_insert(right_halo_id_list, right_id_2)
                end
                if right_id_3 > 0 then
                    _table_insert(right_halo_id_list, right_id_3)
                end
            end
            if not _tolua_isnull(self.left_camp_btn) then
                local halo_res = PathTool.getCampGroupIcon( 1000 )
                local halo_icon_config = BattleController:getInstance():getModel():getCampIconConfigByIds(left_halo_id_list)
                if halo_icon_config and halo_icon_config.icon then
                    halo_res = PathTool.getCampGroupIcon(halo_icon_config.icon)
                    if not self.left_camp_effect then
                        local btn_size = self.left_camp_btn:getContentSize()
                        self.left_camp_effect = createImage(self.left_camp_btn, PathTool.getResFrame("common", "common_1101"), btn_size.width/2, btn_size.height/2, cc.p(0.5, 0.5), true)
                        self.left_camp_effect:setScale(0.8)
                    end
                    self:updateCampEffect(true, self.left_camp_effect)
                    addCountForCampIcon(self.left_camp_btn, halo_icon_config.nums)
                else
                    self:updateCampEffect(false, self.left_camp_effect)
                    addCountForCampIcon(self.left_camp_btn)
                end
                self.left_halo_load = loadImageTextureFromCDN(self.left_camp_btn, halo_res, ResourcesType.single, self.left_halo_load)
                local function onClickLeftCampBtn(  )
                    _b_controller:openBattleCampView(true, left_halo_id_list)
                end
                registerButtonEventListener(self.left_camp_btn, onClickLeftCampBtn, true,nil,nil,0.85)
            end
            if not _tolua_isnull(self.right_camp_btn) then
                local halo_res = PathTool.getCampGroupIcon( 1000 )
                local halo_icon_config = BattleController:getInstance():getModel():getCampIconConfigByIds(right_halo_id_list)
                if halo_icon_config and halo_icon_config.icon then
                    halo_res = PathTool.getCampGroupIcon(halo_icon_config.icon)
                    if not self.right_camp_effect then
                        local btn_size = self.right_camp_btn:getContentSize()
                        self.right_camp_effect = createImage(self.right_camp_btn, PathTool.getResFrame("common", "common_1101"), btn_size.width/2, btn_size.height/2, cc.p(0.5, 0.5), true)
                        self.right_camp_effect:setScale(0.8)
                    end
                    self:updateCampEffect(true, self.right_camp_effect)
                    addCountForCampIcon(self.right_camp_btn, halo_icon_config.nums)
                else
                    self:updateCampEffect(false, self.right_camp_effect)
                    addCountForCampIcon(self.right_camp_btn)
                end
                self.right_halo_load = loadImageTextureFromCDN(self.right_camp_btn, halo_res, ResourcesType.single, self.right_halo_load)
                local function onClickRightCampBtn(  )
                    _b_controller:openBattleCampView(true, right_halo_id_list)
                end
                registerButtonEventListener(self.right_camp_btn, onClickRightCampBtn, true,nil,nil,0.85)
            end

            -- 对阵双方名称
            local name1 = data.actor_role_name
            local name2 = data.target_role_name
            local group = _b_controller:getModel():getGroup()
            if group == BattleGroupTypeConf.TYPE_GROUP_ENEMY and not _b_controller:getWatchReplayStatus() then
                name1 = data.target_role_name
                name2 = data.actor_role_name
            end
            if name1 then
                self.left_name_label:setString(name1)
            end
            if name2 then
                self.right_name_label:setString(name2)
            end
        end
    else
        self:updateCampEffect(false, self.left_camp_effect)
        self:updateCampEffect(false, self.right_camp_effect)
        if self.form_view and not _tolua_isnull(self.form_view) then
            self.form_view:removeAllChildren()
            self.form_view:removeFromParent()
            self.form_view = nil
            self.left_camp_effect = nil
            self.right_camp_effect = nil
        end
    end
end

--更新回合
function BttleTopDramaView:updateRound(round)
    local fight_list_config = Config.CombatTypeData.data_fight_list
    if fight_list_config == nil or fight_list_config[self.battle_type] == nil then return end

    local total_round = fight_list_config[self.battle_type].max_action_count or 0
    if not _tolua_isnull(self.round_label) then
        self.round_label:setString(string.format(TI18N("第%d/%d回合"), round, total_round))
    end
end

-- 光环特效
function BttleTopDramaView:updateCampEffect( status, effect_node )
    if not effect_node or _tolua_isnull(effect_node) then return end
    if status == true then
        effect_node:setVisible(true)
        local fadein = cc.FadeIn:create(0.6)
        local fadeout = cc.FadeOut:create(0.6)
        effect_node:runAction(cc.RepeatForever:create(cc.Sequence:create(fadein, fadeout)))
    else
        doStopAllActions(effect_node)
        effect_node:setVisible(false)
    end
end

--==============================--
--desc:神器解锁的
--@return 
--==============================--
function BttleTopDramaView:updateDramaHallows()
    if not _tolua_isnull(self.btn_layout) then
        local hallows_model = HallowsController:getInstance():getModel()
        local is_open = HallowsController:getInstance():checkIsOpen()
        if is_open and not hallows_model:checkIsHaveAllHallows() then
            local layout_size = cc.size(160, 200)
            if not self.hallows_layout then
                self.hallows_layout = ccui.Layout:create()
                self.hallows_layout:setName("hallows_stage")
                self.hallows_layout:setContentSize(layout_size)
                self.hallows_layout:setPosition(cc.p(-self.main_size.width/2+layout_size.width/2, self.main_size.height/2+140))
                self.hallows_layout:setAnchorPoint(cc.p(0.5, 0.5))
                self.hallows_layout:setTouchEnabled(true)
                self.btn_layout:addChild(self.hallows_layout)
                self.hallows_layout:addTouchEventListener(function(sender, event_type)
                        if event_type == ccui.TouchEventType.ended then
                            playQuitSound()
                            MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.hallows)
                        end
                    end)
            end

            -- 显示当前正在解锁中的神器
            local hallows_id = hallows_model:getCurActivityHallowsId()
            if not self.cur_hallows_id or self.cur_hallows_id ~= hallows_id then
                self.cur_hallows_id = hallows_id
                if self.drama_hallows_model then
                    self.drama_hallows_model:clearTracks()
                    self.drama_hallows_model:removeFromParent()
                    self.drama_hallows_model = nil
                end
                local hallows_config = Config.HallowsData.data_base[hallows_id]
                if hallows_config then
                    self.drama_hallows_model = createEffectSpine(hallows_config.effect,cc.p(layout_size.width/2, 30), cc.p(0.5,0.5), true, PlayerAction.action_2)
                    self.drama_hallows_model:setScale(0.5)
                    self.hallows_layout:addChild(self.drama_hallows_model, 2)
                end
            end

            -- 进度条
            if not self.hallows_progress_bg then
                self.hallows_progress_bg = createImage(self.hallows_layout, PathTool.getResFrame("battledrama", "battledrama_1036"), layout_size.width/2, 40, cc.p(0.5, 0.5), true, nil, true)
                self.hallows_progress_bg:setContentSize(cc.size(130, 22))
                self.hallows_progress = ccui.LoadingBar:create()
                self.hallows_progress:setAnchorPoint(cc.p(0.5, 0.5))
                self.hallows_progress:loadTexture(PathTool.getResFrame("battledrama", "battledrama_1037"), LOADTEXT_TYPE_PLIST)
                self.hallows_progress:setPosition(cc.p(layout_size.width/2, 37))
                self.hallows_layout:addChild(self.hallows_progress)
                local progress_bg_2 = createImage(self.hallows_layout, PathTool.getResFrame("battledrama", "battledrama_1035"), layout_size.width/2, 40, cc.p(0.5, 0.5), true)

                self.hallows_progress_txt = createLabel(20,1,cc.c3b(79,37,0),layout_size.width/2, 40,"",self.hallows_layout,nil,cc.p(0.5, 0.5))
            end
            local hallows_task_list = HallowsController:getInstance():getModel():getHallowsTaskList(self.cur_hallows_id)
            if hallows_task_list then
                local max_num = tableLen(hallows_task_list)
                local cur_num = 0
                for k,v in pairs(hallows_task_list) do
                    if v.finish == 2 then
                        cur_num = cur_num + 1
                    end
                end
                local percent = 100 * cur_num / max_num
                self.hallows_progress:setPercent(percent)
                self.hallows_progress_txt:setString(cur_num .. "/" .. max_num)
            end

            self:updateHallowsRedStatus()
        else
            if self.drama_hallows_model then
                self.drama_hallows_model:clearTracks()
                self.drama_hallows_model:removeFromParent()
                self.drama_hallows_model = nil
            end
            if self.hallows_layout then
                self.hallows_layout:removeAllChildren()
                self.hallows_layout:removeFromParent()
                self.hallows_layout = nil
            end
            if self.update_hallows_red_status then
                EventManager:getInstance():UnBindEvent(self.update_hallows_red_status)
                self.update_hallows_red_status = nil
            end
        end
    end
end 

--==============================--
--desc:神器红点
--@return 
--==============================--
function BttleTopDramaView:updateHallowsRedStatus()
    local red_status = HallowsController:getInstance():getModel():checkRedIsShowByRedType(HallowsConst.Red_Index.task_award)
    addRedPointToNodeByStatus( self.hallows_layout, red_status, 0, -135 )
end

function BttleTopDramaView:DeleteMe()
    self:clearCoolTimer()
    self:clearFlyTimer()
    self:updataZhenfaInfo(false)
    if self.resources_load then
        self.resources_load:DeleteMe()
        self.resources_load = nil
    end
    if self.left_halo_load then
        self.left_halo_load:DeleteMe()
        self.left_halo_load = nil
    end
    if self.right_halo_load then
        self.right_halo_load:DeleteMe()
        self.right_halo_load = nil
    end
    if self.tips_alert then
        self.tips_alert:close()
        self.tips_alert = nil
    end
    if not _tolua_isnull(self.btn_layout) then
        if self.drama_hallows_model then
            self.drama_hallows_model:clearTracks()
            self.drama_hallows_model:removeFromParent()
            self.drama_hallows_model = nil
        end
        if self.drama_item_list then
            for k,v in pairs(self.drama_item_list) do
                v:DeleteMe()
                v = nil
            end
            self.drama_item_list = {}
        end
        self.btn_layout:removeAllChildren()
        self.btn_layout = nil
    end

    if not tolua.isnull(self.online_gift_node) then 
        doStopAllActions(self.online_gift_node.label)
    end
    if self.time_ticket then
        GlobalTimeTicket:getInstance():remove(self.time_ticket)
        self.time_ticket = nil
    end
    if self.map_name_container and not _tolua_isnull(self.map_name_container) then
        doStopAllActions(self.map_name_container)
        self.map_name_container:removeAllChildren()
        self.map_name_container = nil
    end
    _b_controller:setDramaStatus(false)
    EventManager:getInstance():UnBind(self)
    self:clearOnlineInfo()

    -- 移除任务监听
    if self.task_icon_vo then
        if self.task_icon_event then
            self.task_icon_vo:UnBind(self.task_icon_event)
            self.task_icon_event = nil
        end
        self.task_icon_vo = nil
    end

    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
    end


    if self.main_point_list then
        for k, v in pairs(self.main_point_list) do
            if v then
                v:DeleteMe() 
            end
        end
    end
    if self.effect then
        self.effect:runAction(cc.RemoveSelf:create(true))
        self.effect = nil
    end
    doStopAllActions(self.top_info_container)
    doStopAllActions(self.root_wnd)
    if self.map_resources_load then
        self.map_resources_load:DeleteMe()
        self.map_resources_load = nil
    end
    if self.btn_load_1 then
        self.btn_load_1:DeleteMe()
        self.btn_load_1 = nil
    end
    if self.load_map_icon then
        self.load_map_icon:DeleteMe()
        self.load_map_icon = nil
    end
    if not _tolua_isnull(self.root) then
        self.root:removeAllChildren()
        self.root:removeFromParent()
    end
    if self then
        self:removeAllChildren()
        self:removeFromParent()
    end
end

--------------------------------------------
-- @description    : 
-- 跨服天梯
---------------------------------
LadderMainWindow = LadderMainWindow or BaseClass(BaseView)

local controller = LadderController:getInstance()
local model = controller:getModel()

function LadderMainWindow:__init()

    self.layout_name = "ladder/ladder_main_window"

    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("ladder", "ladder"), type = ResourcesType.plist},
        {path = PathTool.getPlistImgForDownLoad("ladder", "ladderrank"), type = ResourcesType.plist},
        {path = PathTool.getSingleImgForDownLoad("bigbg","ladder/hl_ladder_1000"), type = ResourcesType.single },
        {path = PathTool.getSingleImgForDownLoad("bigbg","ladder/hl_ladder_1001"), type = ResourcesType.single },
        {path = PathTool.getSingleImgForDownLoad("herodraw","herodraw/diaocan"), type = ResourcesType.single },
        {path = PathTool.getSingleImgForDownLoad("bigbg","rank/hl_rank_1020"), type = ResourcesType.single },

    }
    self.background_path = "resource/bigbg/ladder/hl_ladder_1000.png"
    self.role_vo = RoleController:getInstance():getRoleVo()

    self.role_panels = {}
    self.role_items = {}
end

function LadderMainWindow:open_callback(  )
    self.background = self.root_wnd:getChildByName("background")
    if self.background then
        self.background:setScale(display.getMaxScale())
    end

    local main_container = self.root_wnd:getChildByName("main_container")
    self.main_container = main_container
    self:playEnterAnimatianByObj(main_container , 1) 

    self.layout_top_left = main_container:getChildByName("layout_top_left")
    self.layout_top_right = main_container:getChildByName("layout_top_right")
    self.layout_bottom = main_container:getChildByName("layout_bottom")
    self.layout_bottom_left = main_container:getChildByName("layout_bottom_left")

    self.top_panel = main_container:getChildByName("top_panel")
    self.top_panel:setVisible(false)

    local win_title = self.top_panel:getChildByName("win_title")
    win_title:setString(TI18N("天梯争霸"))
    self.btn_rule = self.top_panel:getChildByName("btn_rule")
    self.btn_role = self.layout_top_left:getChildByName("btn_role")
    self.btn_log = self.layout_top_left:getChildByName("btn_log")
    self.btn_rank = self.layout_top_left:getChildByName("btn_rank")
    self.btn_award = self.layout_top_left:getChildByName("btn_award")
    self.btn_shop = self.layout_top_right:getChildByName("btn_shop")
    self.btn_protect = self.layout_top_right:getChildByName("btn_protect") --布阵
    self.add_btn = self.layout_top_right:getChildByName("add_btn")

    self.count_label = self.layout_top_right:getChildByName("count_label")
    self.lbl_left_buy_count = self.layout_top_right:getChildByName("lbl_left_buy_count") --剩余购买次数
    -- self.lbl_left_buy_count:setVisible(false)
    local bottom_panel = self.layout_bottom:getChildByName("bottom_panel")
    self.bottom_panel = bottom_panel


    self.self_pic = main_container:getChildByName("self_pic")
    local look_config  = Config.LooksData.data_data[self.role_vo.look_id]
    if look_config then
        bid = look_config.partner_id
        updateHeroDrawPic(bid,self.self_pic,1)
    end
    

    -- local count_title = bottom_panel:getChildByName("count_title")
    -- count_title:setString(TI18N("挑战次数:"))

    local tips_label = bottom_panel:getChildByName("tips_label")
    tips_label:setVisible(false)
    tips_label:setString(TI18N("快速挑战排名不变"))
    self.time_title = bottom_panel:getChildByName("time_title")
    self.time_title:setString(TI18N("距离结束:"))
    self.time_label = bottom_panel:getChildByName("time_label")

    local score_bg = main_container:getChildByName("score_bg")
    score_bg:setVisible(false)
    self.score_label = score_bg:getChildByName("score_label")
    self.score_label:setString(self.role_vo.sky_coin)
    local rank_bg = main_container:getChildByName("rank_bg")
    local rank_title = rank_bg:getChildByName("rank_title")
    rank_title:setString(TI18N("排名:"))
    rank_bg:setVisible(false)
    self.rank_label = rank_bg:getChildByName("rank_label")

    self.close_btn = self.layout_bottom_left:getChildByName("close_btn")
    self.refresh_btn = main_container:getChildByName("refresh_btn")
    self.refresh_btn._can_touch = true
    self.refresh_btn_label = self.refresh_btn:getChildByName("label")
    self.refresh_btn_label:setString(TI18N("刷新"))
    self.challenge_btn = self.layout_bottom:getChildByName("challenge_btn")
    -- self.challenge_btn_label = self.challenge_btn:getChildByName("label")


    for i=1,5 do
        local role_panel = main_container:getChildByName(string.format("stage_%d", i))
        self.role_panels[i] = role_panel
    end
    self.role_panel_size = self.role_panels[1]:getContentSize()


end

function LadderMainWindow:refreshRoleList(  )
    local enemy_datas = model:getLadderEnemyListData()
    local function sortFunc( objA, objB )
        if objA.rank ~= 0 and objB.rank ~= 0 then
            return objA.rank < objB.rank
        elseif objA.rank == 0 and objB.rank ~= 0 then
            return false
        elseif objA.rank ~= 0 and objB.rank == 0 then
            return true
        else
            return false
        end
    end
    table.sort(enemy_datas, sortFunc)
    for i=1,5 do
        delayRun(self.main_container, i*4/60, function()
                local role_item = self.role_items[i]
                if not role_item then
                    local role_panel = self.role_panels[i]
                    role_item = LadderRoleItem.new(role_panel)
                    role_panel:addChild(role_item)
                    self.role_items[i] = role_item
                end
                local enemy_data = enemy_datas[i]
                if enemy_data and next(enemy_data) ~= nil then
                    role_item:setData(enemy_data)
                    role_item:setVisible(true)
                else
                    role_item:setVisible(false)
                end
            end)
    end
end

-- 刷新个人信息数据
function LadderMainWindow:refreshMyBaseInfo(  )
    self.myBaseInfo = model:getLadderMyBaseInfo()

    local is_open = model:getLadderIsOpen()

    self.count_label:setString(TI18N("挑战次数：")..self.myBaseInfo.can_combat_num or 0)

    -- 今日剩余购买次数
    -- if not self.left_buy_count then
    --     self.left_buy_count = createRichLabel(20, 1, cc.p(0.5, 0.5), cc.p(590, 10))
    --     self.bottom_panel:addChild(self.left_buy_count)
    -- end
    local left_count = model:getTodayLeftBuyCount()
    -- self.left_buy_count:setString(string.format(TI18N("<div fontcolor=#ddd6b9>(剩余购买次数:</div><div fontcolor=#61e179>%d</div><div fontcolor=#ddd6b9>)</div>"), left_count))
    self.lbl_left_buy_count:setString(string.format(TI18N("剩余购买次数:%d"),left_count))
    if not is_open or not self.myBaseInfo.rank or self.myBaseInfo.rank == 0 then
        self.rank_label:setString(TI18N("暂无"))
    else
        self.rank_label:setString(self.myBaseInfo.rank)
    end
    self.ref_time = self.myBaseInfo.ref_time or 0  -- 下次可刷新时间
    self.combat_time = self.myBaseInfo.combat_time or 0 -- 结束时间

    local cur_time = GameNet:getInstance():getTime()
    local com_left_time = self.combat_time - cur_time
    if com_left_time < 0 then
        com_left_time = 0
    end
    -- 活动开启显示剩余时间、活动未开启显示参赛条件
    if not is_open then
        self.time_label:setVisible(false)
        self.time_title:setVisible(false)
        if not self.join_text then
            self.join_text = createRichLabel(21, 1, cc.p(0.5, 0.5), cc.p(282, 50.5))
            self.bottom_panel:addChild(self.join_text)
        end
        self.join_text:setVisible(true)
        local rank_cfg = Config.SkyLadderData.data_const["arena_rank"]
        if rank_cfg then
            self.join_text:setString(string.format(TI18N("<div fontcolor=#fff8bf outline=2,#000000>参赛条件:竞技场排名前</div><div fontcolor=#39e522 outline=2,#000000>%d</div><div fontcolor=#fff8bf outline=2,#000000>名</div>"), rank_cfg.val))
        end
    else
        self.time_label:setVisible(true)
        self.time_title:setVisible(true)
        self.time_label:setString(TimeTool.GetTimeFormat(com_left_time))
        if self.join_text then
            self.join_text:setVisible(false)
        end
        self:openLadderTimer(true)
    end

    local ref_left_time = self.ref_time - cur_time
    if ref_left_time <= 0 and self.refresh_btn._can_touch == false then
        setChildUnEnabled(false, self.refresh_btn)
        self.refresh_btn:setTouchEnabled(true)
        self.refresh_btn._can_touch = true
        self.refresh_btn_label:enableOutline(cc.c3b(71, 132, 37), 1)
        self.refresh_btn_label:setString(TI18N("刷新"))
    elseif ref_left_time > 0 and self.refresh_btn._can_touch == true then
        setChildUnEnabled(true, self.refresh_btn)
        self.refresh_btn:setTouchEnabled(false)
        self.refresh_btn._can_touch = false
        self.refresh_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
        self.refresh_btn_label:setString(string.format(TI18N("%d秒"), ref_left_time))
    end
end

-- 计时器
function LadderMainWindow:openLadderTimer( status )
    if status == true then
        if self.ladder_timer == nil then
            self.ladder_timer = GlobalTimeTicket:getInstance():add(function()
                    local cur_time = GameNet:getInstance():getTime()
                    local com_left_time = self.combat_time - cur_time
                    local ref_left_time = self.ref_time - cur_time
                    if com_left_time <= 0 and ref_left_time <= 0 then
                        GlobalTimeTicket:getInstance():remove(self.ladder_timer)
                        self.ladder_timer = nil
                    end
                    if com_left_time < 0 then
                        com_left_time = 0
                    end
                    if com_left_time <= 0 then
                        self.time_label:setVisible(false)
                        self.time_title:setVisible(false)
                        if self.join_text then
                            self.join_text:setVisible(true)
                        end
                    else
                        self.time_label:setVisible(true)
                        self.time_title:setVisible(true)
                        self.time_label:setString(TimeTool.GetTimeFormat(com_left_time))
                    end
                    if ref_left_time <= 0 then
                        if self.refresh_btn._can_touch == false then
                            setChildUnEnabled(false, self.refresh_btn)
                            self.refresh_btn:setTouchEnabled(true)
                            self.refresh_btn._can_touch = true
                            self.refresh_btn_label:enableOutline(cc.c3b(71, 132, 37), 1)
                        end
                        self.refresh_btn_label:setString(TI18N("刷新"))
                    elseif ref_left_time > 0 then
                        if self.refresh_btn._can_touch == true then
                            setChildUnEnabled(true, self.refresh_btn)
                            self.refresh_btn:setTouchEnabled(false)
                            self.refresh_btn._can_touch = false
                            self.refresh_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
                        end
                        self.refresh_btn_label:setString(string.format(TI18N("%d秒"), ref_left_time))
                    end
                end, 1)
        end
    else
        if self.ladder_timer ~= nil then
            GlobalTimeTicket:getInstance():remove(self.ladder_timer)
            self.ladder_timer = nil
        end
    end
end

function LadderMainWindow:openRootWnd(  )
    controller:requestLadderMyBaseInfo()
    controller:requestLadderEnemyListData()
    self:refrehsBtnRedStatus()
end

function LadderMainWindow:register_event(  )
    registerButtonEventListener(self.close_btn, handler(self, self._onClickBtnClose), true, 2)
    registerButtonEventListener(self.btn_rule, handler(self, self._onClickBtnRule))
    registerButtonEventListener(self.btn_role, handler(self, self._onClickBtnRolePalace))
    registerButtonEventListener(self.btn_log, handler(self, self._onClickBtnLog))
    registerButtonEventListener(self.btn_rank, handler(self, self._onClickBtnRank))
    registerButtonEventListener(self.btn_award, handler(self, self._onClickBtnAward))
    registerButtonEventListener(self.btn_shop, handler(self, self._onClickBtnShop))
    registerButtonEventListener(self.add_btn, handler(self, self._onClickBtnAdd))
    registerButtonEventListener(self.refresh_btn, handler(self, self._onClickBtnRefresh), true)
    registerButtonEventListener(self.challenge_btn, handler(self, self._onClickBtnChallenge), true)
    registerButtonEventListener(self.btn_protect,handler(self,self._onClickBtnFightPanel),true)

    -- 个人数据更新
    EventManager:getInstance():Bind(LadderEvent.UpdateLadderMyBaseInfo,self, function (  )
            self:refreshMyBaseInfo()
        end)

    -- 更新所有对手列表
    EventManager:getInstance():Bind(LadderEvent.UpdateAllLadderEnemyList,self, function (  )
            self:refreshRoleList()
        end)

    -- 积分更新
    if self.role_vo ~= nil then
        if self.role_assets_event == nil then
            self.role_assets_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value)
                    if key == "sky_coin" then
                        self.score_label:setString(value)
                    end
                end)
        end
    end

    -- 活动开启/关闭
    self:addGlobalEvent(LadderEvent.UpdateLadderOpenStatus, function (  )
            self:refreshMyBaseInfo()
        end)


    -- 红点
    EventManager:getInstance():Bind(LadderEvent.UpdateLadderRedStatus,self, function ( bid, status )
            self:refrehsBtnRedStatus(bid, status)
        end)
end

function LadderMainWindow:_onClickBtnClose(  )
    controller:openMainWindow(false)
end
-- 规则
function LadderMainWindow:_onClickBtnRule(  )
    MainuiController:getInstance():openCommonExplainView(true, Config.SkyLadderData.data_explain)
end
-- 英雄殿
function LadderMainWindow:_onClickBtnRolePalace(  )
    controller:openLadderTopThreeWindow(true)
end
-- 战报
function LadderMainWindow:_onClickBtnLog(  )
    controller:openLadderLogWindow(true)
end
-- 排行榜
function LadderMainWindow:_onClickBtnRank(  )
    controller:openLadderRankWindow(true)
end
-- 奖励
function LadderMainWindow:_onClickBtnAward(  )
    controller:openLadderAwardWindow(true)
end
-- 商店
function LadderMainWindow:_onClickBtnShop(  )
    --controller:openLadderShopWindow(true)
    MallController:getInstance():openMallPanel(true, MallConst.MallType.Ladder)
end
-- 添加挑战次数
function LadderMainWindow:_onClickBtnAdd(  )
    local is_open = model:getLadderIsOpen()
    if not is_open then
        local txt_cfg = Config.SkyLadderData.data_const["close_text"]
        if txt_cfg then
            message(string.format(TI18N("每%s天梯争霸"), txt_cfg.desc))
        end
        return
    end
    if self.myBaseInfo then
        local role_vo = RoleController:getInstance():getRoleVo()
        local buy_combat_num = self.myBaseInfo.buy_combat_num or 0
        local cost_config = Config.SkyLadderData.data_buy_num[buy_combat_num+1]
        if cost_config then
            if role_vo.vip_lev >= cost_config.vip then
                local msg =string.format(TI18N("确定消耗<img src=%s visible=true scale=0.35 />%s增加一次挑战次数吗？"),PathTool.getItemRes(Config.ItemData.data_assets_label2id.gold),cost_config.cost)
                CommonAlert.show(
                    msg,
                    TI18N("确定"),
                    function()
                        controller:requestBuyChallengeCount()
                    end,
                    TI18N("取消"),
                    nil,
                    CommonAlert.type.rich
                )
            else
                message(TI18N("提升VIP等级可增加购买次数"))
                --message(string.format(TI18N("提升VIP等级达到%s，可增加一次购买次数！"), cost_config.vip))
            end
        else
            message(TI18N("当前已经购买达到上限"))
        end
    end
end
-- 刷新
function LadderMainWindow:_onClickBtnRefresh(  )
    local is_open = model:getLadderIsOpen()
    if is_open then
        controller:requestRefreshEnemyList()
    else
        local txt_cfg = Config.SkyLadderData.data_const["close_text"]
        if txt_cfg then
            message(string.format(TI18N("每%s天梯争霸"), txt_cfg.desc))
        end
    end
end
-- 一键挑战
function LadderMainWindow:_onClickBtnChallenge(  )
    local is_open = model:getLadderIsOpen()
    if not is_open then
        local txt_cfg = Config.SkyLadderData.data_const["close_text"]
        if txt_cfg then
            message(string.format(TI18N("每%s天梯争霸"), txt_cfg.desc))
        end
        return
    end
    local function fun()
        controller:checkJoinLadderBattle(nil, nil, true)
    end
    local str = TI18N("一键挑战将直接获得奖励，是否继续？\n\n\n                          <div fontsize=22>(消耗一次挑战次数)</div>")
    local ok_btn = TI18N("确定")
    local cancel_btn = TI18N("取消")
    CommonAlert.show(str,ok_btn,fun,cancel_btn,nil,CommonAlert.type.rich,nil,nil,24,nil)
end

function LadderMainWindow:_onClickBtnFightPanel()
    HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Ladder, {}, HeroConst.FormShowType.eFormSave)
end

-- 红点
function LadderMainWindow:refrehsBtnRedStatus( bid, status )
    if bid == LadderConst.RedType.TopThree then
        addRedPointToNodeByStatus( self.btn_role, status )
    elseif bid == LadderConst.RedType.BattleLog then
        addRedPointToNodeByStatus( self.btn_log, status )
    else
        local top_three_status = model:checkRedIsShowByRedType(LadderConst.RedType.TopThree)
        addRedPointToNodeByStatus( self.btn_role, top_three_status )
        local log_status = model:checkRedIsShowByRedType(LadderConst.RedType.BattleLog)
        addRedPointToNodeByStatus( self.btn_log, log_status )
    end
end

function LadderMainWindow:close_callback(  )
    EventManager:getInstance():UnBind(self)

    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
    end

    for k,item in pairs(self.role_items) do
        item:DeleteMe()
        item = nil
    end

    self:openLadderTimer(false)
    controller:openMainWindow(false)
end
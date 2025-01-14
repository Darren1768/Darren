-- --------------------------------------------------------------------
-- @description:
--      竞技场循环赛面板
--
-- --------------------------------------------------------------------
ArenaLoopMatchWindow = ArenaLoopMatchWindow or BaseClass(BaseView)

local controller = ArenaController:getInstance() 
local model = ArenaController:getInstance():getModel()

function ArenaLoopMatchWindow:__init()
    self.win_type = WinType.Full


    self.cur_type = 0

    self.title_str = TI18N("竞技场")

    self:initConfig()
    --结算跳转回来这里的用途 
    self.check_class_name = "ArenaLoopMatchWindow" 
    self.layout_name = "arena/arena_loop_match_window"
    self.panel_list = {}
    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("arena", "arenaloop"), type = ResourcesType.plist},
    }

    self.tab_info_list = {
        -- {label = TI18N("邀请帖"), index = ArenaConst.loop_index.challenge, status = true,no_show = true},
        {label = TI18N("排行榜"),index = ArenaConst.loop_index.rank, status = RankController:getInstance():checkRankIsShow(), notice = string.format(TI18N("%d级开启"), RankConstant.limit_open_lev)},
        {label = TI18N("赛季奖"),index = ArenaConst.loop_index.activity, status = true},--TI18N("日常\n奖励")
        {label = TI18N("每日奖"),index = ArenaConst.loop_index.awards, status = true},--TI18N("排名\n奖励")
        {label = TI18N("记录"),index = ArenaConst.loop_index.record, status = true},
    }

    self.background_path = "resource/bigbg/hl_bigbg_54.png"
end

function ArenaLoopMatchWindow:initConfig()
    --local id = BattleController:getInstance():curBattleResId(BattleConst.Fight_Type.Arena)

end


function ArenaLoopMatchWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale( display.getMaxScale())

    self.main_container = self.root_wnd:getChildByName("main_container")
    self:playEnterAnimatianByObj(self.main_container , 1)
    self.main_panel = self.main_container:getChildByName("main_panel")

    self.close_btn = self.root_wnd:getChildByName("close_btn")


    self.my_log_btn = self.root_wnd:getChildByName("my_log_btn")

    self.my_log_tips = self.my_log_btn:getChildByName("tips")

    self.challenge_shop = self.root_wnd:getChildByName("challenge_shop")
    self.protect_btn = self.root_wnd:getChildByName("protect_btn")

    self:initAllTabs()
end

function ArenaLoopMatchWindow:register_event()
    EventManager:getInstance():Bind(ArenaEvent.UpdateMyLoopData,self, function(key, value)
            self:updateMyInfoData(key, value)
        end)

    -- 这里会计算一下红点状态
    EventManager:getInstance():Bind(ArenaEvent.UpdateLoopChallengeTimesList,self, function()
            self:updateChallengeActivityStatus()
        end)

    EventManager:getInstance():Bind(ArenaEvent.UpdateArenaRedStatus,self, function(type, status)
            self:checkActivityStstus(type, status)
        end)

    registerButtonEventListener(self.protect_btn, function()
            HeroController:getInstance():openFormMainWindow(true, PartnerConst.Fun_Form.Arena)
        end,true, 1)

    registerButtonEventListener(self.my_log_btn, function()
            controller:openArenaLoopMyLogWindow(true)
            model:updateArenaLoopLogStatus(FALSE)
        end,true, 1)
    registerButtonEventListener(self.challenge_shop, function()
            MallController:getInstance():openMallPanel(true, MallConst.MallType.ArenaShop)
        end,true, 1)

    registerButtonEventListener(self.close_btn, function() self:close() end, true, 2)
end

function ArenaLoopMatchWindow:setNodeVisible()
    if self.my_log_tips == nil then return end
    local status = model:getLoopMatchRedStatus(ArenaConst.red_type.loop_log)
    self.my_log_tips:setVisible(status)
end

function ArenaLoopMatchWindow:openRootWnd(type)
    type = type or ArenaConst.loop_index.challenge
    self:setSelecteTab(type, true)
    self:changeTabPanel(type)
    -- 判断活跃宝箱标签是否要显示红点
    self:checkActivityStstus()
end

function ArenaLoopMatchWindow:selectedTabCallBack(index)
    self:changeTabPanel(index)
end

function ArenaLoopMatchWindow:changeTabPanel(index)
    if self.cur_panel ~= nil then
        self.cur_panel:setNodeVisible(false)
        self.cur_panel = nil
    end
    self.cur_type  = index
    self.cur_panel = self.panel_list[index]
    if self.cur_panel == nil then
        if index == ArenaConst.loop_index.challenge then
            self.cur_panel = ArenaLoopChallengePanel.new()
        elseif index == ArenaConst.loop_index.activity then
            self.cur_panel = ArenaLoopActivityPanel.new()
        elseif index == ArenaConst.loop_index.rank then
            self.cur_panel = ArenaLoopRankPanel.new()
        elseif index == ArenaConst.loop_index.awards then
            self.cur_panel = ArenaLoopAwardsPanel.new()
        end
        self.panel_list[index] = self.cur_panel
        self.main_panel:addChild(self.cur_panel)
        if self.cur_panel.addToParent then
            self.cur_panel:addToParent()
        end
    end
    if self.cur_panel ~= nil then
        self.cur_panel:setNodeVisible(true)
        if self.cur_panel.updatePanelInfo then
            self.cur_panel:updatePanelInfo(false)
        end
    end
    
    self:setNodeVisible()
end

--[[
@desc:针对需要根据自身信息做更新的面板
author:{author}
time:2018-05-14 21:43:04
--@key:
--@value: 
return
]]
function ArenaLoopMatchWindow:updateMyInfoData()
    if self.cur_panel ~= nil and self.cur_panel.updatePanelInfo then
        self.cur_panel:updatePanelInfo(true)
    end
end

--[[
@desc:添加宝箱标签页红点，以及如果是当前标签，则更新相关数据的
author:{author}
time:2018-05-14 21:43:19
return
]]
function ArenaLoopMatchWindow:updateChallengeActivityStatus()
    local panel = self.panel_list[ArenaConst.loop_index.activity]
    if panel ~= nil then
        panel:updatePanelInfo(true)
    end
end

function ArenaLoopMatchWindow:checkActivityStstus(type, status)
    if type == nil then
        local red_status = model:getLoopMatchRedStatus(ArenaConst.red_type.loop_challenge)
        -- self:setTabTips(red_status, ArenaConst.loop_index.challenge)

        red_status = model:getLoopMatchRedStatus(ArenaConst.red_type.loop_artivity)
        self:setTabTips(red_status, ArenaConst.loop_index.activity)
    else
        if type == ArenaConst.red_type.loop_challenge then
            -- self:setTabTips(status, ArenaConst.loop_index.challenge)
        elseif type == ArenaConst.red_type.loop_artivity then
            self:setTabTips(status, ArenaConst.loop_index.activity)
        elseif type == ArenaConst.red_type.loop_log then
            if self.cur_type == ArenaConst.loop_index.challenge then
                if self.cur_panel and self.cur_panel.updateMyLogTips then
                    self.cur_panel:updateMyLogTips()
                end
            end
        end
    end
end

function ArenaLoopMatchWindow:beforeClose()
    controller:openArenaEnterWindow(true)
end

function ArenaLoopMatchWindow:close_callback()
    -- 还原ui战斗类型
    MainuiController:getInstance():resetUIFightType()

    controller:openArenaLoopMathWindow(false, self.cur_type)
    EventManager:getInstance():UnBind(self)


    for k, panel in pairs(self.panel_list) do
        if panel.DeleteMe then
            panel:DeleteMe()
        end
    end
    self.panel_list = nil
end
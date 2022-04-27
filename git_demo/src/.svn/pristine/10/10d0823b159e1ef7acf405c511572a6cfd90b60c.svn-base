-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--星命塔
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
SpiritController = SpiritController or BaseClass(BaseController)

function SpiritController:config()
    self.model = SpiritModel.New(self)
    self.dispather = EventManager:getInstance()
end

function SpiritController:getModel()
    return self.model
end

function SpiritController:registerEvents()
end

function SpiritController:registerProtocals()
    self:RegisterProtocal(11320, "handle11320")     --星命塔信息
    self:RegisterProtocal(11321, "handle11321")     --购买挑战次数
    self:RegisterProtocal(11322, "handle11322")     --挑战星命塔
    self:RegisterProtocal(11323, "handle11323")     --推送星命塔结算
    self:RegisterProtocal(11324, "handle11324")     --扫荡星命塔
    self:RegisterProtocal(11325, "handle11325")     --请求星命塔通关录像
    self:RegisterProtocal(11326, "handle11326")     --推送星命塔有解锁
    self:RegisterProtocal(11333, "handle11333")     --分享通关录像
    self:RegisterProtocal(11327, "handle11327")     -- 星命塔排行榜

    self:RegisterProtocal(11328, "handle11328")     --通关奖励
    self:RegisterProtocal(11329, "handle11329")
end

function SpiritController:checkIsOpen(show_desc)
    local open_config = Config.StarTowerData.data_tower_const.open_floor 
    if open_config == nil then return false end

    local is_open = MainuiController:getInstance():checkIsOpenByActivate(open_config.val)
    if is_open == false and show_desc == true then
        message(open_config.desc)
    end
    return is_open
end

--==============================--
--desc:引导需要
--@return 
--==============================--
function SpiritController:getSpiritRoot()
    if self.main_view then
        return self.main_view.root_wnd
    end
end

--==============================--
--desc:引导需要
--@return 
--==============================--
function SpiritController:getSpiritChallengeRoot()
    if self.spirit_window then
        return self.spirit_window.root_wnd
    end
end

--打开主界面
function SpiritController:openMainView(bool)
    if bool == false then
        if self.main_view ~= nil then
            self.main_view:close()
            self.main_view = nil
        end
    else
        if self:checkIsOpen(true) == false then
            return
        end

        if not self.main_view then 
            self.main_view = SpiritWindow.New()
        end
        if self.main_view and self.main_view:isOpen() == false then
            self.main_view:open()
        end
    end
end
--打开挑战主界面
function SpiritController:openSpiritMainView(bool,data)
    if bool == true then
        if not self.spirit_window then 
            self.spirit_window = SpiritMainWindow.New(data)
        end
        if self.spirit_window and self.spirit_window:isOpen() == false then
            self.spirit_window:open()
        end

    else 
        if self.spirit_window then 
            self.spirit_window:close()
            self.spirit_window = nil
        end
    end
end
--打开奖励总览
function SpiritController:openAwardWindow(bool)
    if bool == true then
        if not self.award_window then 
            self.award_window = SpiritAwardWindow.New()
        end
        if self.award_window and self.award_window:isOpen() == false then
            self.award_window:open()
        end

    else 
        if self.award_window then 
            self.award_window:close()
            self.award_window = nil
        end
    end
end

--打开录像界面
function SpiritController:openVideoWindow(bool,data,tower)
    if bool == true then
        if not self.video_window then 
            self.video_window = SpiritVideoWindow.New(data,tower)
        end
        if self.video_window and self.video_window:isOpen() == false then
            self.video_window:open()
        end

    else 
        if self.video_window then 
            self.video_window:close()
            self.video_window = nil
        end
    end
end

--==============================--
--desc:星命塔结算
--@return 
--==============================--
function SpiritController:getResultWindow()
    return self.result_window
end


--打开结算界面
function SpiritController:openResultWindow(bool,data)
    if bool == true then
        -- 不能直接出剧情或者引导
        LevupgradeController:getInstance():waitForOpenLevUpgrade(true) 
        BattleResultMgr:getInstance():setWaitShowPanel(true)
        if not self.result_window then 
            self.result_window = SpiritResultWindow.New(data.result, BattleConst.Fight_Type.Spirit)
        end
        if self.result_window and self.result_window:isOpen() == false then
            self.result_window:open(data, BattleConst.Fight_Type.Spirit)
        end
    else 
        if self.result_window then 
            self.result_window:close()
            self.result_window = nil

            if self.is_show_lock == true and self.show_data then 
                -- self:openGetWindow(true,self.show_data.tower)
            else
                EventManager:getInstance():Fire(BattleEvent.CLOSE_RESULT_VIEW)
            end
        end

        self.is_show_lock =false
        self.show_data = nil
    end
end

--打开结算界面
function SpiritController:openGetWindow(bool,data)
    if bool == true then

        if not self.get_window then 
            self.get_window = SpiritGetWindow.New(data)
        end
        if self.get_window and self.get_window:isOpen() == false then
            self.get_window:open()
        end

    else 
        if self.get_window then 
            self.get_window:close()
            self.get_window = nil
        end
    end
end

--打开tips界面
function SpiritController:openTipsWindow(bool,data)
    if bool == true then
        if not self.tips_window then 
            self.tips_window = SpiritTipsWindow.New()
        end
        if self.tips_window and self.tips_window:isOpen() == false then
            self.tips_window:open(data)
        end
    else 
        if self.tips_window then 
            self.tips_window:close()
            self.tips_window = nil
        end
    end
end


--请求星命塔数据
function SpiritController:sender11320()
    self:SendProtocal(11320,{})
end
function SpiritController:handle11320( data )
    self.model:setSpiritData(data)
end

--购买挑战次数
function SpiritController:sender11321()
    local protocal ={}
    self:SendProtocal(11321,protocal)
end
function SpiritController:handle11321( data )
    message(data.msg)
    self.model:updateLessCount(data)
end
--挑战星命塔
function SpiritController:sender11322(tower)
    local protocal ={}
    protocal.tower = tower
    self:SendProtocal(11322,protocal)
end
function SpiritController:handle11322( data )
    message(data.msg)
    self:openSpiritMainView(false)
end
--推送星命塔结算
function SpiritController:handle11323( data )
    print("---------------handle11323------------------")
    printLuaTable(data)
    if data.result == 1 then
        -- if data.is_skip == 1 then--是否跳过战斗打开怪物逃跑界面
        --     self:openTipsWindow(true,data)
        -- else
        --     BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.Spirit, data)
        -- end     
        BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.Spirit, data)

        
        self.model:updateMaxTower(data) 
        self.model:updateLessCount(data)
        EventManager:getInstance():Fire(SpiritEvent.Fight_Success_Event)
    else
        BattleController:getInstance():openFailFinishView(true, BattleConst.Fight_Type.Spirit, data.result, data)
    end 
end
--扫荡星命塔
function SpiritController:sender11324(tower)
    local protocal ={}
    protocal.tower = tower
    self:SendProtocal(11324,protocal)    
end
function SpiritController:handle11324( data )
    message(data.msg)
    self.model:updateLessCount(data)
end
--请求星命塔通关录像
function SpiritController:sender11325(tower)
    local protocal ={}
    protocal.tower = tower
    self:SendProtocal(11325,protocal)
end
function SpiritController:handle11325( data )
    message(data.msg)

    EventManager:getInstance():Fire(SpiritEvent.Video_Data_Event,data)
end

function SpiritController:handle11326( data )
    self.show_data = data
    self.is_show_lock = true
    --    self:openGetWindow(true,data.tower)
end

--分享通关录像
function SpiritController:sender11333(replay_id,channel,tower)
    local protocal ={}
    protocal.replay_id = replay_id
    protocal.channel = channel
    protocal.tower = tower
    self:SendProtocal(11333,protocal)
end
function SpiritController:handle11333( data )
    message(data.msg)
    if data.result == 1 then
        self:openVideoWindow(false)
    end
end

function SpiritController:requestSpiritRank()
    self:SendProtocal(11327,{})
end
function SpiritController:handle11327(data)
    EventManager:getInstance():Fire(SpiritEvent.Update_Top3_rank, data.rank_lists)
end
--领取通关奖励
function SpiritController:sender11328(id)
    local proto = {}
    proto.id = id
    self:SendProtocal(11328, proto)
end
function SpiritController:handle11328(data)
    message(data.msg)
    if data.result == 1 then
        EventManager:getInstance():Fire(SpiritEvent.Update_Reward_Event)
    end
end
function SpiritController:handle11329(data)
    self.model:setRewardData(data.award_list)
    EventManager:getInstance():Fire(SpiritEvent.Update_First_Reward_Msg)
end

function SpiritController:getStrByLevel(level)
    local bo = level%5
    local ceng = math.ceil(level/5)
    if bo == 0 then
        bo = 5
        ceng = ceng -1
    end
    return (ceng..TI18N("层")..bo..TI18N("波"))
end

function SpiritController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end
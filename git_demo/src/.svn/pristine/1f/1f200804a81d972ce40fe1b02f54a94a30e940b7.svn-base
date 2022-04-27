-- --------------------------------------------------------------------
-- 众神战场控制器
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
GodbattleController = GodbattleController or BaseClass(BaseController)

function GodbattleController:config()
    self.model = GodbattleModel.New(self)
    self.dispather = EventManager:getInstance()
    self.kill_notice_list = {}          -- 连杀广播缓存
    self.apply_status = 0               -- 是否已经报过名
end

function GodbattleController:getModel()
    return self.model
end

function GodbattleController:registerEvents()
    
end

function GodbattleController:registerProtocals()
   
end

--==============================--
--desc:协议请求基础数据,
--@force:
--@return 
--==============================--
function GodbattleController:requestInitProtocal(force)
    if self.role_vo == nil then return end
    local config = Config.ZsWarData.data_const.limit_lev
    if config == nil then return end
    if self.role_vo.lev >= config.val then
        if force == true then
            self:SendProtocal(21403, {})
        else
            local had_request = self.model:hadRequestStatus()
            if had_request == false then
                self:SendProtocal(21403, {})
            end
        end
    end
end

--==============================--
--desc:检测报名情况
--@data:
--@return 
--==============================--
function GodbattleController:on21403(data)
    if data.code == GodBattleConstants.apply_status.auto_enter then
        self.model:updateApplyStatus(GodBattleConstants.apply_status.in_game)
        self:requestEnterGodBattle()
        return
    end
    self.model:updateApplyStatus(data.code)
    if data.code == GodBattleConstants.apply_status.in_game then
        if self.model:getSelfInfo() == nil then
            -- self:SendProtocal(21425, {})
        end
        if self.godbattle_window == nil then
            ActivityController:getInstance():openSignView(true, ActivitySignType.godbattle)
        end
    elseif data.code == GodBattleConstants.apply_status.un_apply then
        self:requestExitGodBattle()
    end
end

--==============================--
--desc:请求进入众神战场
--@return 
--==============================--
function GodbattleController:requestEnterGodBattle()
    local btn_index = MainuiController:getInstance():getMainUIIndex() 
    if btn_index == MainuiConst.btn_index.main_scene then
        MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Godbattle)
    else
        MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene, MainuiConst.sub_type.godbattle) 
    end
end

--==============================--
--desc:众神战场名称转换
--@return 
--==============================--
function GodbattleController:convertName(v)
    local name = transformNameByServ(v.name, v.srv_id)
    if v.camp == GodBattleConstants.camp.god then
        name = string.format("宙斯・%s", name)
    elseif v.camp == GodBattleConstants.camp.devil then
        name = string.format("炎魔・%s", name)
    end
    return name
end

--==============================--
--desc:请求退出众神战场
--@return 
--==============================--
function GodbattleController:requestExitGodBattle()
    if self.godbattle_window then
        self:openGodBattleMainWindow(false)
    end
    self.kill_notice_list = {}          -- 连杀广播缓存
    if self.kill_notice ~= nil then
        self.kill_notice:close()
        self.kill_notice = nil
        print("kill_notice_close")
    end
end

--==============================--
--desc:打开主窗体,这也是活动的主界面
--@status:
--@return 
--==============================--
function GodbattleController:openGodBattleMainWindow(status)
    if not status then
        if self.godbattle_window then
            self.godbattle_window:close()
            self.godbattle_window = nil
        end
    else
        local config = Config.ZsWarData.data_const.limit_lev 
        if config and config.val > self.role_vo.lev then
            message(TI18N("等级不足"))
            return
        end
        local function_vo = MainuiController:getInstance():getFunctionIconById(MainuiConst.icon.godbattle)
        if function_vo == nil then
            message(TI18N("活动暂未开始"))
            return 
        end
        local my_apply_status = self.model:getApplyStatus()
        -- 活动中,且未报名的话,直接打开报名界面
        if function_vo.status == MainuiConst.icon_status.prepare then
            if my_apply_status == GodBattleConstants.apply_status.un_apply then
                ActivityController:getInstance():openSignView(true, ActivitySignType.godbattle_sign)
            else
            
            end
        elseif function_vo.status == MainuiConst.icon_status.start then
            if my_apply_status == GodBattleConstants.apply_status.un_apply then
                ActivityController:getInstance():openSignView(true, ActivitySignType.godbattle)
            else
                if self.godbattle_window == nil then
                    self.godbattle_window = GodBattleScene.New()
                end
                -- print("self.godbattle_window:open")
                self.godbattle_window:open()
            end
        end
    end
end

--==============================--
--desc:是否在众神战场景中
--@return 
--==============================--
function GodbattleController:isInGodBattleScreen()
    return self.godbattle_window ~= nil
end

--==============================--
--desc:打开或者关闭报名面板
--@status:
--@type:类型,是报名阶段打开的类型,还是战斗死亡回到出生点的类型
--@return 
--==============================--
function GodbattleController:openGodBattleApplyView(status)
    if status == true then
        ActivityController:getInstance():openSignView(true, ActivitySignType.godbattle)
    end
end 

--==============================--
--desc:报名
--@return 
--==============================--
function GodbattleController:requestApplyGodBattle()
	self:SendProtocal(21401, protocal)
end

--==============================--
--desc:众神战场报名返回
--@data:
--@return 
--==============================--
function GodbattleController:on21401(data)
	message(data.msg)
end 

--==============================--
--desc:请求战场数据
--@return 
--==============================--
function GodbattleController:requestGodBattleRoleList()
	self:SendProtocal(21410, {})
end 

--==============================--
--desc:战场内的角色移动数据,这里判断一下当前角色不在场景中不做处理吧
--@data:
--@return 
--==============================--
function GodbattleController:on21411(data)
    self.model:updateRoleMoveData(data)
end

--==============================--
--desc:更新总积分
--@data:
--@return 
--==============================--
function GodbattleController:on21412(data)
    self.model:updateTotalScore(data)
end

--[[
    @desc: 打开众神战场奖励和说明面板
    author:{author}
    time:2018-09-16 16:54:32
    --@status: 
    @return:
]]
function GodbattleController:openGodBattleRewardsWindow(status, type)
    if not status then
        if self.godbattle_rewards then
            self.godbattle_rewards:close()
            self.godbattle_rewards = nil
        end
    else
        if self.godbattle_rewards == nil then
            self.godbattle_rewards = GodBattleRewardsWindow:New()
        end
        self.godbattle_rewards:open(type)
    end
end

--==============================--
--desc:众神战场退出返回
--@data:
--@return 
--==============================---
function GodbattleController:on21402(data)
    message(data.msg)
end

--==============================--
--desc:清空战场所有的数据,主要是退出场景之后
--@return 
--==============================--
function GodbattleController:clearGodBattleData()
    self.model:clearGodBattleData()

    -- 关掉战场内的数据查看面板
    self:openGodBattleInfoView(false)
    -- 关掉连杀的面板
    self:openGodBattleKillNoticeView(false)
end

--==============================--
--desc:当前战场角色信息,包含刚进入的全部数据,增加或者更新的
--@data:
--@return 
--==============================--
function GodbattleController:on21410(data)
    self.model:updateRoleData(data)
end

--==============================--
--desc:获取当前阶段的时间数据
--@return 
--==============================--
function GodbattleController:getTimeInfo()
    local mainui_ctrl = MainuiController:getInstance()
    if mainui_ctrl ~= nil then
        local fun_vo = mainui_ctrl:getFunctionIconById(MainuiConst.icon.godbattle)
        return fun_vo
    end
end

--==============================--
--desc:获取并更新守卫信息
--@data:
--@return 
--==============================--
function GodbattleController:on21413(data)
    self.model:updateGuardData(data)
end

function GodbattleController:on21414(data)
end

--==============================--
--desc:结算信息
--@data:
--@return 
--==============================--
function GodbattleController:on21415(data)
    self:requestExitGodBattle()
    if self.result_info == nil then
        self.result_info = {}
    end
    for k, v in pairs(data) do
        self.result_info[k] = v
    end
    -- 打开结算面板
    self:openGodBattleResult(true)
end

--==============================--
--desc:打开战斗结算面板
--@status:
--@return 
--==============================--
function GodbattleController:openGodBattleResult(status)
    if status == false then
        if self.godbattle_result ~= nil then
            self.godbattle_result:close()
            self.godbattle_result = nil
        end
    else
        if self.godbattle_result == nil then
            self.godbattle_result = GodBattleResultView.New(GodbattleController:getInstance())
        end
        if self.godbattle_result and self.godbattle_result:isOpen() == false then
            self.godbattle_result:open()
        end
    end
end

--==============================--
--desc:获得结算信息数据
--@return 
--==============================--
function GodbattleController:getGodBattleResult()
    return self.result_info or {}
end

--==============================--
--desc:打开众神之战战场里面小结算面板
--@status:
--@return 
--==============================--
function GodbattleController:openGodBattleInfoView(status)
    if status == false then
        if self.godbattle_info ~= nil then
            self.godbattle_info:close()
            self.godbattle_info = nil
        end
    else
        if self.godbattle_info == nil then
            self.godbattle_info = GodBattleInfoView.New()
        end
        self.godbattle_info:open()
    end
end

--==============================--
--desc:更新技能信息
--@data:
--@return 
--==============================--
function GodbattleController:on21420(data)
    self.model:updateRoleSkillData(data)
end

--==============================--
--desc:请求使用技能
--@index:
--@return 
--==============================--
function GodbattleController:requestUseGodBattleSkill(index)
    local protocal = {}
    protocal.id = index
    self:SendProtocal(21421, protocal)
end

--==============================--
--desc:技能使用返回结果
--@data:
--@return 
--==============================--
function GodbattleController:on21421(data)
    message(data.msg)
end

function GodbattleController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end

--==============================--
--desc:进入战场之后的倒计时
--@data:
--@return 
--==============================--
function GodbattleController:on21409(data)
    EventManager:getInstance():Fire(GodbattleEvent.UpdateTimeCountDown, data.time)
end

--==============================--
--desc:击杀胜利信息
--@data:
--@return 
--==============================--
function GodbattleController:on21416(data)
    if self.kill_notice ~= nil then
        table.insert( self.kill_notice_list, data )
    else
        self:openGodBattleKillNoticeView(true, data)
    end
end

--==============================--
--desc:打开或者关闭击杀提示信息面板
--@status:
--@data:
--@return 
--==============================--
function GodbattleController:openGodBattleKillNoticeView(status, data)
    if status == false then
        if self.kill_notice ~= nil then
            self.kill_notice:close()
            self.kill_notice = nil

            -- 缓存数据的话,就再播一次
            if self.kill_notice_list and next(self.kill_notice_list) ~= nil then
                local cache_data = table.remove( self.kill_notice_list, 1 )
                self:openGodBattleKillNoticeView(true,cache_data)
            end
        end
    else
        if data == nil then return end
        if self:checkIsInGodbattle() == false then  -- 已经不在众神之战战场了,就不需要播了
            return 
        end
        -- if BattleController:getInstance():isInFight() then
        --     return
        -- end
        if self.kill_notice == nil then
            self.kill_notice = GodBattleKillNoticeView.New()
        end
        if self.kill_notice and self.kill_notice:isOpen() == false then
            self.kill_notice:open(data)
        end
    end
end

function GodbattleController:checkIsInGodbattle()
    local my_apply_status = self.model:getApplyStatus()
    if my_apply_status ~= GodBattleConstants.apply_status.in_game then
        return false
    end
    if self.godbattle_window == nil then
        return false
    end
    return true
end

function GodbattleController:on21417(data)
    EventManager:getInstance():Fire(GodbattleEvent.UpdateRoleAwards, data.items)
end

--==============================--
--desc:个人战斗信息
--@data:
--@return 
--==============================--
function GodbattleController:on21425(data)
    self.model:setSelfInfo(data)
end

--==============================--
--desc:奖励领取信息
--@data:
--@return 
--==============================--
function GodbattleController:on21426(data)
    self.model:setRewardInfo(data)
end

--==============================--
--desc:请求领取奖励
--@index:
--@return 
--==============================--
function GodbattleController:requestGetCombatReward(type, num)
    local protocal = {}
    protocal.type = type
    protocal.num = num
    self:SendProtocal(21427, protocal)
end

--==============================--
--desc:奖励领取结果返回
--@data:
--@return 
--==============================--
function GodbattleController:on21427(data)
    message(data.msg)
    if data.code == 1 then
        local reward_info = self.model:getRewardInfo()
        if reward_info then
            if data.type == 1 then
                reward_info.win_list[data.num] = 1
            else
                reward_info.cnum_list[data.num] = 1
            end
        end
        self.model:recalcRedPoint()
        EventManager:getInstance():Fire(GodbattleEvent.UpdateCombatAwards, data.type, data.num)
    end
end

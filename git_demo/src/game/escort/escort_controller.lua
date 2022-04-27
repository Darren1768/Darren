-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
EscortController = EscortController or BaseClass(BaseController)

function EscortController:config()
    self.model = EscortModel.New(self)
    self.dispather = EventManager:getInstance()
end

function EscortController:getModel()
    return self.model
end

function EscortController:registerEvents()
    
end

function EscortController:registerProtocals()
    
end

--==============================--
--desc:根据等级判断开启与否
--@return 
--==============================-- 
function EscortController:requestInitProtocal(force)
    
end

--- 打开护送主界面
function EscortController:openEscortMainWindow(status, data)
    if status == false then
        if self.main_window ~= nil then
            self.main_window:close()
            self.main_window = nil
        end
    else
        if self:checkIsOpen(true) == false then
            return
        end

        if self.main_window == nil then
            self.main_window = EscortMainWindow.New()
            self.main_window:open(data)
        else
            self.main_window:setWindowData(data)
        end
    end
end

--==============================--
--desc:判断护送是否开启
--@return 
--==============================--
function EscortController:checkIsOpen(show_desc)
    local open_config = Config.EscortData.data_const.open_lev
    if open_config == nil then return false end
    local is_open = MainuiController:getInstance():checkIsOpenByActivate(open_config.val)
    if show_desc == true and is_open == false then
        message(open_config.desc)
    end
    return is_open
end

--==============================--
--desc:是否在护送场景中
--@return 
--==============================--
function EscortController:isInEscortScreen()
    return self.main_window ~= nil
end

--- 打开护送记录面板
function EscortController:openEscortLogWindow(status, index)
    if status == false then
        if self.log_window then
            self.log_window:close()
            self.log_window = nil
        end
    else
        if self.log_window == nil then
            self.log_window = EscortLogWindow.New()
        end
        index = index or EscortConst.log_type.def
        self.log_window:open(index)
    end
end

--==============================--
--desc:复仇或者击退界面
--@status:
--@type:
--@data:
--@return 
--==============================--
function EscortController:openEscortChallengeWindow(status, type, data)
    if status == false then
        if self.challenge_window then
            self.challenge_window:close()
            self.challenge_window  = nil
        end
    else
        type = type or EscortConst.challenge_type.revenge
        if self.challenge_window  == nil then
            self.challenge_window  = EscortChallengeWindow.New(type)
        end
        self.challenge_window:open(data)
    end
end

--==============================--
--desc:刷新雇佣列表主界面
--@status:
--@data:
--@return 
--==============================--
function EscortController:openEscortEmployWindow(status)
    if status == false then
        if self.escort_employ_window then
            self.escort_employ_window:close()
            self.escort_employ_window = nil
        end
    else
        if self.escort_employ_window == nil then
            self.escort_employ_window = EscortEmployWindow.New()
        end
        self.escort_employ_window:open(data)
    end
end

--==============================--
--desc:我的雇佣详情面板
--@status:
--@return 
--==============================--
function EscortController:openEscortMyInfoWindow(status)
    if status == false then
        if self.my_info_window then
            self.my_info_window:close()
            self.my_info_window = nil
        end
    else
        if self.my_info_window == nil then
            self.my_info_window = EscortMyInfoWindow.New()
        end
        self.my_info_window:open()
    end
end

--==============================--
--desc:掠夺他人的主界面
--@status:
--@data:
--@return 
--==============================--
function EscortController:openEscortPlunderWindow(status, data)
    if status == false then
        if self.plunder_window then
            self.plunder_window:close()
            self.plunder_window = nil
        end
    else
        if self.plunder_window == nil then
            self.plunder_window = EscortPlunderWindow.New()
        end
        self.plunder_window:open(data)
    end
end

function EscortController:handle24006(data)
    self.model:setMyInfo(data)
end

--==============================--
--desc:请求护送的基础属性值
--@rid:
--@srv_id:
--@return 
--==============================--
function EscortController:requestEscortBaseInfo(rid, srv_id)
    rid = rid or 0
    srv_id = srv_id or ""
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id  = srv_id
    self:SendProtocal(24000, protocal)
end
function EscortController:handle24000(data)
    self.model:updateEscortBaseInfo(data)
end

--==============================--
--desc:刷新护送品质
--@type:
--@return 
--==============================--
function EscortController:requestRefreshEscort(type)
    type = type or 1
    local protocal = {}
    protocal.type = type
    self:SendProtocal(24001, protocal)
end
--==============================--
--desc:刷新品质
--@data:
--@return 
--==============================--
function EscortController:handle24001(data)
    message(data.msg)
    if data.result == TRUE then
    end
end

--==============================--
--desc:发起护送
--@return 
--==============================-- 
function EscortController:requestEscort()
    self:SendProtocal(24002, {})
end

--==============================--
--desc:发起护送,如果是发起成功的话,那么就需要跑一个创建事件在主界面创建了
--@data:
--@return 
--==============================--
function EscortController:handle24002(data)
    message(data.msg)
    if data.result == TRUE then
        self:openEscortEmployWindow(false)
    end
end

--==============================--
--desc:请求查看剧情玩家信息
--@rid:
--@srv_id:
--@return 
--==============================--
function EscortController:requestCheckEscortPlayer(rid, srv_id)
    rid = rid or 0
    srv_id = srv_id or ""
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id = srv_id
    self:SendProtocal(24010, protocal)
end 
function EscortController:handle24010(data)
    self:openEscortPlunderWindow(true, data)
end

--==============================--
--desc:领取护送奖励
--@return 
--==============================--
function EscortController:requestGetEscortAwards()
    self:SendProtocal(24004, {})
end
function EscortController:handle24004(data)
    if data.result == TRUE then 
        self:openEscortMyInfoWindow(false)

        -- 移除掉护送的灯泡提示
        PromptController:getInstance():getModel():removePromptDataByTpye(PromptTypeConst.Escort) 
    end
end

--==============================--
--desc:快速完成
--@data:
--@return 
--==============================--
function EscortController:requestUseAssetsFinishEscort()
    self:SendProtocal(24003, {})
end

function EscortController:handle24003(data)
    if data.result == TRUE then
        self:openEscortMyInfoWindow(false)
    end
end

--==============================--
--desc:推送变化信息,只针对打开界面的处理,所以只需要抛出事件
--@data:
--@return 
--==============================--
function EscortController:handle24005(data)
    EventManager:getInstance():Fire(EscortEvent.UpdateEscortPlayerList, data)
end

--==============================--
--desc:请求掠夺指定玩家
--@rid:
--@srv_id:
--@return 
--==============================--
function EscortController:requestPlunderEscort(rid, srv_id)
    rid = rid or 0
    srv_id = srv_id or ""
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id = srv_id
    self:SendProtocal(24011, protocal)
end
function EscortController:handle24011(data)
    message(data.msg)
    if data.result == TRUE then
        self:openEscortPlunderWindow(false)
    end
end

--==============================--
--desc:掠夺返回
--@data:
--@return 
--==============================--
function EscortController:handle24012(data)
    BattleController:getInstance():openFinishView(true, BattleConst.Fight_Type.Escort, data) 
end

--==============================--
--desc:请求日志
--@type:1是被掠夺 2:是掠夺
--@return 
--==============================--
function EscortController:requestLogByType(type)
    local protocal = {}
    protocal.type = type
    self:SendProtocal(24013, protocal)
end

--==============================--
--desc:日志信息
--@data:
--@return 
--==============================--
function EscortController:handle24013(data)
    EventManager:getInstance():Fire(EscortEvent.UpdateEscortLogInfoEvent, data)
end

--==============================--
--desc:针对被掠夺的反击或者帮内反击
--@rid:
--@srv_id:
--@id:日志id
--@return 
--==============================--
function EscortController:requestAtkPlunderPlayer(rid, srv_id, id)
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id = srv_id
    protocal.id = id
    self:SendProtocal(24015, protocal)
end
function EscortController:handle24015(data)
    message(data.msg)
    if data.result == TRUE then
        self:openEscortChallengeWindow(false)
    end
end

--==============================--
--desc:请求掠夺者信息
--@rid:
--@srv_id:
--@id:
--@type:EscortConst.challenge_type.revenge 复仇  EscortConst.challenge_type.repel 击退
--@return 
--==============================--
function EscortController:requestPlunderInfo(rid, srv_id, id, type)
    rid = rid or 0
    srv_id = srv_id or ""
    id = id or 1
    type = type or EscortConst.challenge_type.revenge
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id = srv_id
    protocal.id = id
    protocal.type = type
    self:SendProtocal(24014, protocal)
end
function EscortController:handle24014(data)
    self:openEscortChallengeWindow(true,data.type,data)
end

--==============================--
--desc:护送的帮内求助
--@id:
--@return 
--==============================--
function EscortController:requestGuildForHelp(id)
    local protocal = {}
    protocal.id = id
    self:SendProtocal(24017, protocal)
end
function EscortController:handle24017(data)
    message(data.msg)
end

function EscortController:handle24018(data)
    EventManager:getInstance():Fire(EscortEvent.UpdateEscortSingleLogInfo, data)
end

--==============================--
--desc:更新双倍时间状态
--@data:
--@return 
--==============================--
function EscortController:handle24020(data)
    self.model:setDoubleTimes(data.code)
end

function EscortController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end

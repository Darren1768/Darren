-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      神殿玩法  策划 星宇 后端 爵爷 
-- --------------------------------------------------------------------
PrimusModel = PrimusModel or BaseClass()

function PrimusModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function PrimusModel:config()
end

function PrimusModel:setFirstLogin(status)
    self.is_show_redpoint = status
end
function PrimusModel:getFirstLogin()
    if self.is_show_redpoint then
        return self.is_show_redpoint
    end
    return false
end

function PrimusModel:showPrimusRedPoint()
    local is_show = self:checkPrimusRedStatus()
    MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.esecsice, {bid=RedPointType.primus, status=is_show})
end
function PrimusModel:checkPrimusRedStatus()
    local open_data = Config.DailyplayData.data_exerciseactivity
    local bool = MainuiController:getInstance():checkIsOpenByActivate(open_data[EsecsiceConst.exercise_index.honourfane].activate)
    if bool == false then return false end

    local status = false
    local login_status = self:getFirstLogin()
    if login_status and login_status == true then
        local primus_info = Config.PrimusData.data_const.redpoint_close_condition.val
        local role_vo = RoleController:getInstance():getRoleVo()
        --少于配置的等级的时候
        if role_vo.lev < primus_info then
            status = true
        else
            local my_data = ArenaController:getInstance():getModel():getMyLoopData()
            if my_data and my_data.rank then
                if my_data.rank ~= 0 and my_data.rank <= 50 then
                    status = true
                end
            end
        end
    end
    return status
end

function PrimusModel:__delete()
end
-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
LevupgradeController = LevupgradeController or BaseClass(BaseController)

function LevupgradeController:config()
    self.model = LevupgradeModel.New(self)
    self.dispather = EventManager:getInstance()

    self.wait_list = {}
end

function LevupgradeController:getModel()
    return self.model
end

function LevupgradeController:registerEvents()

end

function LevupgradeController:registerProtocals()
    self:RegisterProtocal(10344, "handle10344")
end

function LevupgradeController:handle10344(data)
    BattleResultMgr:getInstance():addShowData(BattleConst.Closed_Result_Type.LevelUpgradeType, data)
end

--==============================--
--desc:设置出现升级时候不能马上出面板
--@status:
--@return 
--==============================--
function LevupgradeController:waitForOpenLevUpgrade(status)
    -- table.insert( self.wait_list, true)
end

function LevupgradeController:openMainWindow(status, data)
    if not status then
        if self.lev_window then
            self.lev_window:close()
            self.lev_window = nil
        end
    else
        -- if next(self.wait_list) ~= nil then --lwc
        --     self.cache_data = data
        --     return 
        -- end

        if self.lev_window == nil then
            self.lev_window = LevupgradeWindow.New()
        end
        self.lev_window:open(data)
    end
end

function LevupgradeController:waitLevupgrade()
    return self.cache_data ~= nil or self.lev_window ~= nil or next(self.wait_list) ~= nil
end 

function LevupgradeController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end

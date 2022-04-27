-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
LevupgradeModel = LevupgradeModel or BaseClass()

function LevupgradeModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function LevupgradeModel:config()
end

function LevupgradeModel:__delete()
end

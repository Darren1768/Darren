-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
EsecsiceModel = EsecsiceModel or BaseClass()

function EsecsiceModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function EsecsiceModel:config()
end

function EsecsiceModel:__delete()
end
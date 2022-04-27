-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
LookModel = LookModel or BaseClass()

function LookModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function LookModel:config()
end

function LookModel:__delete()
end
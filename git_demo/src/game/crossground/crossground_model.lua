-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
CrossgroundModel = CrossgroundModel or BaseClass()

function CrossgroundModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function CrossgroundModel:config()
end

function CrossgroundModel:__delete()
end
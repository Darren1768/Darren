-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--    tips的相关处理
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
TipsModel = TipsModel or BaseClass()

function TipsModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function TipsModel:config()
end

function TipsModel:__delete()
end
-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
VerificationcodeModel = VerificationcodeModel or BaseClass()

function VerificationcodeModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function VerificationcodeModel:config()
end

function VerificationcodeModel:__delete()
end
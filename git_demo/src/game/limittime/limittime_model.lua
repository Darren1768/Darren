--******** 文件说明 ********
-- @description: 
LimitTimeActionModel = LimitTimeActionModel or BaseClass()

function LimitTimeActionModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function LimitTimeActionModel:config()
end


function LimitTimeActionModel:__delete()
end

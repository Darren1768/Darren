--******** 文件说明 ********
-- @description: 
LimitTimeActionController = LimitTimeActionController or BaseClass(BaseController)

function LimitTimeActionController:config()
    self.model = LimitTimeActionModel.New(self)
    self.dispather = EventManager:getInstance()
end

function LimitTimeActionController:getModel()
    return self.model
end

function LimitTimeActionController:registerEvents()

end

function LimitTimeActionController:registerProtocals()
    self:RegisterProtocal(28000, "handle28000")
end
--
function LimitTimeActionController:sender28000()
    self:SendProtocal(28000, {})
end
function LimitTimeActionController:handle28000(data)
    if data ~= nil and next(data) ~= nil then
        EventManager:getInstance():Fire(LimitTimeActionEvent.Limit_Time_Gift_Event, data)
    end
end



--打开限时钜惠礼包界面
function LimitTimeActionController:openLimitTimeGiftWindow(status)
    if status == true then
        if not self.limit_time_gift_window then
            self.limit_time_gift_window = LimitTimeGiftWindow.New()
        end
        self.limit_time_gift_window:open()
    else
        if self.limit_time_gift_window then 
            self.limit_time_gift_window:close()
            self.limit_time_gift_window = nil
        end
    end
end

function LimitTimeActionController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end
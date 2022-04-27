
--用于唯一标识obj的table
EventDispatcher = EventDispatcher or BaseClass()
function EventDispatcher:__init()
    self.eventSys=EventManager:getInstance()
end

function EventDispatcher:Bind(type_str, listener_func)
    return self.eventSys:Bind(type_str,self,listener_func)
end
function EventDispatcher:UnBind(obj)
    self.eventSys:UnBindEvent(obj)
end
function EventDispatcher:Fire(type_str, ...)
    self.eventSys:FireTarget(type_str,self, ...)
end

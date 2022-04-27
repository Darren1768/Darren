--[[
@自定义事件派发机制

]]
EventManager = EventManager or BaseClass()

local table_insert = table.insert
local table_remove= table.remove
-- 获取单例
function EventManager:getInstance()
    if self.m_pManager == nil then
        self.m_pManager = self:New()
    end

    return self.m_pManager
end

function EventManager:__init()
    --所有事件
    self.event_list ={}
    --所有目标
    self.event_target_list ={}
    self.is_deleted = false
end


--不考虑优先级
function EventManager:Bind(event_name,event_target, event_func)
    if event_name == nil then
        print(debug.traceback())
        error("Try to bind to a nil event_name")
        return nil
    end

    if event_func == nil then
        error("Try to bind to a nil event_func == "..event_name)
        return nil
    end

    if event_target == nil then
        return nil
    end

    if self.is_deleted then
        return nil
    end

    local event_listener = self.event_list[event_name]
    event_listener = event_listener or {}

    --不判断是否已存在
    --[[
    for i,cb in pairs(event_listener) do
        if cb.target == event_target and cb.func == event_func then
            return nil
        end
    end
    ]]
    local cb = {target = event_target, func = event_func, name = event_name}
    table_insert(event_listener, cb)
    self.event_list[event_name] = event_listener

    self.event_target_list[event_target] = true
    return cb
end


--不考虑是否正在派发
--@event_target 事件table

function EventManager:UnBindEvent(event)
    if event == nil then
        error("Try to unbind a nil event")
        return
    end
    if self.is_deleted then
        return
    end

    local event_listener = self.event_list[event.name]
    if event_listener then
        for i,cb in pairs(event_listener) do
            --只会存在一个,不考虑event_listener的变化
            if cb == event then
                table_remove(event_listener, i)
                break
            end
        end
    end
end

--不考虑是否正在派发
--@event_target 事件目标
function EventManager:UnBind(event_target)

    --local start = os.clock()
    if event_target == nil then
        error("Try to unbind a nil event_target")
        return
    end
    if self.is_deleted then
        return
    end

    if not self.event_target_list[event_target] then
        return
    end

    for k,event_listener in pairs(self.event_list) do
        for i=#event_listener,1,-1 do
            if event_listener[i].target == event_target then
                table_remove(event_listener, i)
            end
        end
        if #event_listener == 0 then
            self.event_list[k] =nil
        end
    end

    self.event_target_list[event_target] = nil

    --local endtime = os.clock()
    --print('UnBind time = '..tostring(endtime - start))
end

function EventManager:UnBindAll()
    self.event_list = {}
    self.event_target_list = {}
end

--立即触发
function EventManager:Fire(event_name, ...)
    if event_name == nil then
        print(debug.traceback())
        error("Try to call Event:Fire() with a nil event_name")
        return
    end
    if self.is_deleted then
        return
    end

    local event_listener = self.event_list[event_name]
    if event_listener then
        local all_func = {}
        for i,cb in pairs(event_listener) do
            local func = cb.func
            table_insert(all_func,func)
            --这里在被调用时可能有删除event_listener的操作，导致有回调无法触发
            --func(...)
        end
        for i,func in ipairs(all_func) do
            func(...)
        end
    end

end

function EventManager:FireTarget(event_name, event_target,...)
    if event_name == nil then
        print(debug.traceback())
        error("Try to call Event:Fire() with a nil event_name")
        return
    end
    if self.is_deleted then
        return
    end

    local event_listener = self.event_list[event_name]
    if event_listener then
        local all_func = {}
        for i,cb in pairs(event_listener) do
            if cb.target == event_target then
                local func = cb.func
                table_insert(all_func,func)
            end
        end
        for i,func in ipairs(all_func) do
            func(...)
        end
    end
end


function EventManager:__delete()
    if not self.is_deleted then
        self.is_deleted = true
    end
end
--[[
    * 类注释写在这里-----------------
    * @author {cloud}
]]
StoryController = StoryController or BaseClass(BaseController)

function StoryController:config()
    self.model = StoryModel.New(self)
    self.view = StoryView.New(self)
    self.dispather = EventManager:getInstance()
end

function StoryController:getModel()
    return self.model
end

function StoryController:registerEvents()
end

function StoryController:registerProtocals()
    self:RegisterProtocal(11101, "handle_11101")   -- 服务端触发剧情
    self:RegisterProtocal(11102, "handle_11102")   -- 跳过剧情
    self:RegisterProtocal(11100, "handle_11100")

    self:RegisterProtocal(11124, "handle_11124")    -- 剧情播放

    
end

function StoryController:getView()
    return self.view
end

function StoryController:openView()
    if self.view ~= nil then
        self.view:open()
    end
end

function StoryController:closeView()
    if self.view ~= nil then
        self.view:close()
    end
end

function StoryController:send_11100(drama_bid, step_id)
    print("---------------------send_11100----------------------------")
    local protocal = {}
    protocal.drama_bid = drama_bid
    protocal.step_id = step_id
    printLuaTable(protocal)

    self:SendProtocal(11100, protocal)
end

function StoryController:handle_11100(data)
    print("---------------------handle_11100----------------------------")
    printLuaTable(data)
    if self.view then
        self.view:playStepOver()
    end
end

function StoryController:handle_11101(data_list)
    print("---------------------handle_11101----------------------------")
    printLuaTable(data_list)
    if self.model then
        self.model:setCurStory(data_list)
    end
end

function StoryController:send_11102(drama_bid)
    print("---------------------send_11102----------------------------",drama_bid)

    local protocal = {}
    protocal.drama_bid = drama_bid
    self:SendProtocal(11102, protocal)
end

-- 跳过剧情;
function StoryController:handle_11102(data_list)
    print("---------------------send_11102----------------------------")
    printLuaTable(data_list)

    if self.model then
        if data_list.code == 1 then
            EventManager:getInstance():Fire(StoryEvent.SKIP_STORY)
        end
    end
end

function StoryController:send_11124(bid)
    print("---------------------send_11124---------------------------")
    local protocal = {}
    protocal.bid  = bid 

    self:SendProtocal(11124, protocal)
end

function StoryController:handle_11124(data)
    print("---------------------handle_11124----------------------------")
    printLuaTable(data)
  
end

function StoryController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end

--[[
    判断是否在剧情中
]]
function StoryController:isInStory()
    if self.model == nil then return false end
    return self.model:isStoryState()
end
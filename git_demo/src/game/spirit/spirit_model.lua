-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
SpiritModel = SpiritModel or BaseClass()

function SpiritModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function SpiritModel:config()
    -- 已通关的最大层数
    self.max_tower = 0
    --剩余挑战次数
    self.less_count = 0
    --已购买次数
    self.buy_count = 0
    self.reward_list = {} ----通关奖励状态
end

--是否已经获取试练塔的协议信息
function SpiritModel:isInitSpiritData()
    if next(self.reward_list) == nil then
        return false
    end
    return true
end

function SpiritModel:setSpiritData(data)
    self.max_tower = data.max_tower or 0
    self.less_count = data.count or 0
    self.buy_count = data.buy_count or 0 

    if next(data.award_list) ~= nil then
        for i,v in pairs(data.award_list) do
            local tab = {}
            tab.id = v.id
            tab.status = v.status
            self.reward_list[v.id] = tab
        end
    end
    -- self.reward_list = self:sortFunc(self.reward_list)
    self:checkRedPoint()
    EventManager:getInstance():Fire(SpiritEvent.Update_All_Data)
end

function SpiritModel:setRewardData(data)
    if not self.reward_list or not data[1] then return end
    for i,v in pairs(self.reward_list) do
        if v.id == data[1].id then
            self.reward_list[i].status = data[1].status
            break
        end
    end
    -- self.reward_list = self:sortFunc(self.reward_list)
end

function SpiritModel:sortFunc(data)
    local tempsort = {
        [0] = 2,  -- 0 未领取放中间
        [1] = 1,  -- 1 可领取放前面
        [2] = 3,  -- 2 已领取放最后
    }
    local function sortFunc( objA, objB )
        if objA.status ~= objB.status then
            if tempsort[objA.status] and tempsort[objB.status] then
                return tempsort[objA.status] < tempsort[objB.status]
            else
                return false
            end
        else
            return objA.id < objB.id
        end
    end
    table.sort(data, sortFunc)
    return data
end

function SpiritModel:getRewardData(id)
    if not self.reward_list then return end
    if id == nil then
        return self.reward_list or {}
    else
        return self.reward_list[id] or {}
    end
end

function SpiritModel:checkRedPoint()
    local is_open = SpiritController:getInstance():checkIsOpen() 
    if is_open  == false then return end
    local status = false
    for i,v in pairs(self.reward_list) do
        if v.status == 1 then
            status = true
            break
        end 
    end
    status = status or (self.less_count > 0)
    MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.spirit, {bid = 1, status = status}) 
    GhostdomController:getInstance():setBuildRedStatus(GhostdomConst.Build_Type.spirit, {bid = 1, status = status})
end

function SpiritModel:updateMaxTower(data)
    if data and data.max_tower and self.max_tower < data.max_tower then 
        self.max_tower = data.max_tower
    end
end

function SpiritModel:updateLessCount(data)
    if data.count then 
        self.less_count = data.count or 0
        self:checkRedPoint()
    end
    if data.buy_count then 
        self.buy_count = data.buy_count
    end
    EventManager:getInstance():Fire(SpiritEvent.Count_Change_Event)
end

function SpiritModel:getNowLevelId()

    local bo = self.max_tower%5
    local ceng = math.ceil(self.max_tower/5)
    if bo == 0 then
        bo = 5
        ceng = ceng -1
    end
    if ceng < 1 then
        ceng =1
    end
    return ceng

end


function SpiritModel:getNowCeng()

   
    local bo = self.max_tower%5
    local ceng = math.ceil(self.max_tower/5)
    if bo == 0 then
        bo = 5
        ceng = ceng+1
    end
    if ceng < 1 then
        ceng =1
    end
    return ceng

end


function SpiritModel:getNowTowerId()
    return self.max_tower or 0
end
function SpiritModel:getTowerLessCount()
    return self.less_count
end
function SpiritModel:getBuyCount()
    return self.buy_count
end
function SpiritModel:__delete()
end

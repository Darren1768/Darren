
local RedPointCPTb = {
    RP_UI2_Btn1 = 'RP_UI1_Btn0',
}

GlobalReminder = GlobalReminder or BaseClass()

-- 获取单例
function GlobalReminder:getInstance()
    if self.m_pManager == nil then
        self.m_pManager = self:New()
    end

    return self.m_pManager
end

function GlobalReminder:__init()
    self:InitRedPropertyTb()
end

-- 初始化总属性表
function GlobalReminder:InitRedPropertyTb()
    self.redPointPropertyTb = {}
    self:SetRootProperty()
    --self:InitRedPointCPTb()
end

function GlobalReminder:SetRootProperty()
    self.redPointPropertyTb['RP_Root'] = self:CreateEmptyPropertyTb() -- 所有RP的根节点，空节点
end

function GlobalReminder:InitRedPointCPTb()
    for k, v in pairs(RedPointCPTb) do
        self:AddProperty(k, {parent = v})
    end
end

-- 创建一个空的属性
function GlobalReminder:CreateEmptyPropertyTb()
    return {}
end

-- redPoint = {
--     count = 0, -- 某个属性的计数
--     rpObj = GameObject, -- 红点对象
--     parent = '', -- 父属性，每个属性数据都最多有一个父节点
-- }
function GlobalReminder:AddProperty(name, val)
    if self.redPointPropertyTb[name] ~= nil and val then
        self:SetProperty(name, val)
        -- ERROR('红点属性名重复: ' .. name)
        return
    end
    -- 如果没有父节点，设为root
    val = val or {}
    -- val.parent = val.parent or redPointCPTb[name]
    val.parent = val.parent or 'RP_Root'

    self.redPointPropertyTb[name] = self:CreateEmptyPropertyTb()
    self:CopyDataToProperty(self.redPointPropertyTb[name], val)
    -- 查询父节点是否存在，未存在即添加
    self:AddProperty(name,val)
end

function GlobalReminder:RemoveProperty(name)
    self.redPointPropertyTb[name] = nil
end

function GlobalReminder:CopyDataToProperty(propertyTb, dataTb)
    for k, v in pairs(dataTb) do
        propertyTb[k] = v
    end
end

-- val即propertyTb表
function GlobalReminder:SetProperty(name, val)
    local propertyTb = self.redPointPropertyTb[name]
    if not propertyTb then
        self:AddProperty(name, val)
    else
        self:CopyDataToProperty(self.redPointPropertyTb[name], val)
    end
    self:RefreshProperty(name)
end



-- 递归刷新红点，刷新红点的数据以及红点的表现
function GlobalReminder:RefreshProperty(name, diffCount)
    local propertyTb = self.redPointPropertyTb[name]
    assert(propertyTb, '红点属性不存在: ' .. name)
    propertyTb.count = propertyTb.count or 0
    diffCount = diffCount or 0
    propertyTb.count = propertyTb.count + diffCount
    if propertyTb and propertyTb.rpObj then
        print(name .. '      RedPoint Count:      ' .. propertyTb.count)
        if propertyTb.count > 0 then
            propertyTb.rpObj:setVisible(true)
        else
            propertyTb.rpObj:setVisible(false)
        end
    end
    if propertyTb.parent then
        -- 只有第一次的时候lastCount为0，直接将数据传给parent叠加即可
        propertyTb.lastCount = propertyTb.lastCount or 0
        self:RefreshProperty(propertyTb.parent, propertyTb.count - propertyTb.lastCount)
    end
    -- 刷新完成后
    propertyTb.lastCount = propertyTb.count
end

function GlobalReminder:__delete()
    if not self.is_deleted then
        self.is_deleted = true
    end
end
--tips: 红点字符串本类不做重复检测,重复会导致bug

local table_insert = table.insert
local table_remove= table.remove

RedManager = RedManager or BaseClass()

-- 获取单例
function RedManager:getInstance()
    if self.m_pManager == nil then
        self.m_pManager = self:New()
    end

    return self.m_pManager
end

function RedManager:__init()
    --字段对应多个节点对应{'show':{node}}
    self.str_node_list ={}

    --字段状态对应{"show":true}
    self.status_str_list ={}
end

function  RedManager:initRedNode(node,strings_list)
    if not strings_list or #strings_list == 0 then return end
    if not node.red_str_list then
        --只允许初始化一次
        node.red_str_list = strings_list
        for i,str in pairs(strings_list) do
            self.str_node_list[str] = self.str_node_list[str] or {}
            table_insert(self.str_node_list[str], node)
        end
    end
    --执行一次遍历
    node:setVisible(false)
    for j,strSim in pairs(node.red_str_list) do
        if self.status_str_list[strSim] == true then
            node:setVisible(true)
            break
        end
    end
end

function  RedManager:removeRedNode(node)
    for j,strSim in pairs(node.red_str_list) do
        table.removeItem(self.str_node_list[strSim], node)
    end
    node.red_str_list = nil
end

function RedManager:changeStrStatus(str,is_show)
    self.status_str_list[str] = is_show
    if not self.str_node_list[str] or #self.str_node_list[str]  == 0 then
        return
    end
    for i,node in pairs(self.str_node_list[str]) do
        if not tolua.isnull(node) then
            node:setVisible(false)
            for j,strSim in pairs(node.red_str_list) do
                if self.status_str_list[strSim] == true then
                    node:setVisible(true)
                    break
                end
            end
        end
    end
end

function RedManager:__delete()
    if not self.is_deleted then
        self.is_deleted = true
    end
    self.str_node_list = nil
    self.status_str_list = nil
end
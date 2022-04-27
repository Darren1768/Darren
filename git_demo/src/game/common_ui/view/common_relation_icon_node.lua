--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-12 19:04:08

    common_relation_icon_node
    该模块处理人物之间关系icon的显示
]]

CommonRelationIconNode = class("CommonRelationIconNode",function() return ccui.Widget:create() end)

local role_controller = RoleController:getInstance()
local role_model = role_controller:getModel()
-- data 是单个玩家的信息数据 主要就是rid和srv_id
-- scale 整体的缩放比例

local default_content_size = cc.size(250,80) --默认容器大小
local default_icon_size = cc.size(62,50) --这个是现有关系icon图片的尺寸
local colnum,rownum =1,4 --1列一排放4个icon超过则换行 (初始数据)

function CommonRelationIconNode:ctor(data,scale)
    self:setCascadeOpacityEnabled(true)
    self.view_width = default_content_size.width
    self.view_height = default_content_size.height
    self.root_wnd = ccui.Layout:create()
    self.root_wnd:setCascadeOpacityEnabled(true)
    self.root_wnd:setContentSize(cc.size(self.view_width, self.view_height))
    self.root_wnd:setAnchorPoint(cc.p(0, 0))
    self:addChild(self.root_wnd)
    self.scale = scale or 1

    self:configUi(scale)

    self:setData(data)

end

function CommonRelationIconNode:configUi(scale)
    self.main_container = ccui.Layout:create()
    self.main_container:setAnchorPoint(cc.p(0,0))
    self.main_container:setContentSize(cc.size(self.view_width, self.view_height))
    self.main_container:setSwallowTouches(false)

    self.node_icon = cc.Node:create()
    self.node_icon:setContentSize(cc.size(0,0))
    self.node_icon:setAnchorPoint(cc.p(0,0))


    
    self.main_container:setScale(self.scale)

    self.main_container:addChild(self.node_icon)
    self.root_wnd:addChild(self.main_container)
end

function CommonRelationIconNode:setData(data)
    self.singlePlayerData = data
    -- print("==============设置关系icon节点数据================")
    -- printLuaTable(data)
    self:updateContent(data)
end

function CommonRelationIconNode:updateContent(data)
    if not data then return end

    local rid = data.rid or 0
    local srv_id = data.srv_id or ""

    local relation_data = role_model:getPlayerRelationData(rid,srv_id) --获取到这个人和我的关系数据
    if not relation_data then return end

    self.real_icon_size = cc.size(default_icon_size.width *self.scale,default_icon_size.height*self.scale) --最终显示的icon尺寸
    local content_size =cc.size(#relation_data *self.real_icon_size.width , math.ceil(#relation_data/rownum)*self.real_icon_size.height) --最终显示的容器尺寸
    self.real_content_size = content_size

    self:resetRootWndSize(content_size)
    self:createRelationIcon(relation_data)
end

function CommonRelationIconNode:createRelationIcon(relation_data)
    local x,y = 0,self.real_content_size.height-5
    local col_num = colnum

    self.node_icon:removeAllChildren()
    for i,v in ipairs(relation_data)do
        local sp_icon = role_model:getRelationIcon(v.relation_id)
        self.node_icon:addChild(sp_icon)
        sp_icon:setPosition(x,y)
        if i%5==0 then
            col_num = col_num+1
            x= x + self.real_icon_size.width+5
        else
            x = 0
        end
        y = y - (col_num-1)*(self.real_icon_size.height+5)
    end
end

--返回容器尺寸  格式是cc.size
function CommonRelationIconNode:getContentSize()
    return self.real_content_size or cc.size(0,0)
end

--重置root_wnd尺寸大小
function CommonRelationIconNode:resetRootWndSize(viewSize)
    self.view_width = viewSize.width or default_content_size.width
    self.view_height = viewSize.height or default_content_size.height
    self.root_wnd:setContentSize(cc.size(self.view_width, self.view_height))
    self.main_container:setContentSize(cc.size(self.view_width, self.view_height))
end
--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-13 15:20:15
]]
UnionBuffItem = class("UnionBuffItem",function() return ccui.Layout:create() end)

local role_controller = RoleController:getInstance()
function UnionBuffItem:ctor()
    self:configUi()

    self:registerEvent()
end

function UnionBuffItem:configUi()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("union/union_buff_item"))
	self.size = self.root_wnd:getContentSize()
	self:setAnchorPoint(cc.p(0.5, 0.5))
	self:setContentSize(self.size)
	
	self.root_wnd:setAnchorPoint(0.5, 0.5)
	self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
	self:addChild(self.root_wnd)
	
	local container = self.root_wnd:getChildByName("container")
    self.container = container

    self.request_btn = self.container:getChildByName("request_btn")
    self.lbl_buff_name = self.container:getChildByName("lbl_buff_name")
    self.lbl_btn = self.request_btn:getChildByName("label")

    self.node_rich = self.container:getChildByName("node_rich")
end

function UnionBuffItem:registerEvent()
    registerButtonEventListener(self.request_btn,function()
        if not self.itemData then return end
        role_controller:sender29712(self.itemData.bid)
    end)
end

function UnionBuffItem:setData(data)
    self.itemData = data
    self:updateContentData(data)
end

function UnionBuffItem:updateContentData(data)
    if not data then return end

    self.node_rich:removeAllChildren()
    
    local lbl_des1 = createRichLabel(20,cc.c3b(129,104,65),cc.p(0,1),cc.p(0,0),2,nil,300)
    self.node_rich:addChild(lbl_des1)

    local lbl_des2 = createRichLabel(20,cc.c3b(129,104,65),cc.p(0,1),cc.p(0,-25),2,nil,300)
    self.node_rich:addChild(lbl_des2)


    -- relation_data表里面格式没有改 所以就直接读buff_data里面的数据 
    -- local relation_info = Config.RelationData.data_buff_list[data.bid] --data.bid 对应的是relation_data里面的
    -- if not relation_info then return end

    local buff_id = data.bid-- relation_info.buff_id --  
    local buff_info = Config.BuffData.data_get_buff_data[buff_id]

    if not buff_info then return end

    local des_day = buff_info.seconds/86400
    local is_activite = data.activate == 1
    local day_color = is_activite and "#47832D" or "#816841"
    self.lbl_buff_name:setString(buff_info.name)

    local des1 = "已激活<div fontcolor=%s>%s</div>天增益"--"已激活<div fontcolor=%s>%s,</div><div fontcolor=%s>%s,</div><div fontcolor=%s>%s,</div><div fontcolor=%s>%s</div>天增益"
    des1 = string.format(des1,day_color,des_day)
    local des2 = buff_info.des--TI18N("可获得")..data.des

    lbl_des1:setString(des1)
    lbl_des2:setString(des2)

    local enable_show = data.status==1
    local btn_text = data.status == -1 and TI18N("已领取") or TI18N("领取")

    self.lbl_btn:setString(btn_text)
    setChildUnEnabled(not enable_show,self.request_btn)
end
ForgeHouseController = ForgeHouseController or BaseClass(BaseController)

function ForgeHouseController:config()
    self.model = ForgeHouseModel.New(self)
    self.dispather = EventManager:getInstance()
end

function ForgeHouseController:getModel()
    return self.model
end

function ForgeHouseController:registerEvents()

end

function ForgeHouseController:registerProtocals()
    self:RegisterProtocal(11079, "handle11079")
    self:RegisterProtocal(11080, "handle11080")
    self:RegisterProtocal(11081, "handle11081")
    self:RegisterProtocal(11082, "handle11082")
end
--sub_sub_type 1 灵格 2 灵魄
function ForgeHouseController:openForgeHouseView(bool, sub_type,sub_sub_type )
    if bool == true then
        local config = Config.CityData.data_base[CenterSceneBuild.mall]
        if config == nil then return end
        local is_open = MainuiController:getInstance():checkIsOpenByActivate(config.activate)
        if not is_open then
            message(config.desc)
            return
        end

        if not self.forgehouseView then
            self.forgehouseView = ForgeHouseWindow.New()
        end
        self.forgehouseView:open(sub_type,sub_sub_type)
    else
        if self.forgehouseView then 
            self.forgehouseView:close()
            self.forgehouseView = nil
        end
    end
end
-- 一键合成装备预览
function ForgeHouseController:send11079(base_id,num)
    local proto = {}
    proto.base_id = base_id
    proto.num = num or 0
    print("--------------send11079---------------")
    printLuaTable(proto)
    self:SendProtocal(11079, proto)
end
function ForgeHouseController:handle11079(data)
    print("--------------handle11079---------------")
    printLuaTable(data)
    if next(data.list) == nil then
        message(TI18N("暂时无法合成任何装备或金币不足"))
        return
    end
    if data.type == 0 then
        self:openEquipmentAllSynthesisWindow(true,data)
    end
end
--合成装备
function ForgeHouseController:send11080(id,num)
	local proto = {}
	proto.base_id = id
	proto.num = num
	self:SendProtocal(11080, proto)
end
function ForgeHouseController:handle11080(data)
    message(data.msg)
    -- if data.result == 1 then
        EventManager:getInstance():Fire(ForgeHouseEvent.Composite_Result)
    -- end
end
--一键合成
function ForgeHouseController:send11081(base_id,num)
    local proto = {}
    proto.base_id = base_id
    proto.num = num or 0
    self:SendProtocal(11081, proto)
end
function ForgeHouseController:handle11081(data)
    message(data.msg)
    if data.result == 1 then
        self:openEquipmentAllSynthesisWindow(false)
        EventManager:getInstance():Fire(ForgeHouseEvent.Composite_Result)
    end
end



--@is_middle 是否居中显示
function ForgeHouseController:openForgehouseSelectPanel(list ,point,delay  , is_middle,selectIndex,redStaus)
    if self.forgehouse_select_panel ~= nil then
       self.forgehouse_select_panel:close()
       self.forgehouse_select_panel = nil
    end
    width = 120
    self.forgehouse_select_panel = ForgehouseTabSelectPanel.New(selectIndex,redStaus)
    self.forgehouse_select_panel:open()
    self:adjustTipsPosition1(self.forgehouse_select_panel, point, nil, false)
    table.insert({}, self.forgehouse_select_panel)
    return self.forgehouse_select_panel
end
function ForgeHouseController:tabChangeView(index)
    if  self.forgehouseView and  self.forgehouseView:isOpen() then 
        self.forgehouseView:tabChangeView(index)
    end 

end 

function ForgeHouseController:closeForgehouseSelectPanel()
    self.forgehouse_select_panel:close()
end
function ForgeHouseController:openEquipmentAllSynthesisWindow(bool,data)
    if bool == true then 
        if not self.all_synthsis_view then
            self.all_synthsis_view = EquipmentAllSynthesisWindow.New(data)
        end
        self.all_synthsis_view:open()
    else
        if self.all_synthsis_view then 
            self.all_synthsis_view:close()
            self.all_synthsis_view = nil
        end
    end
end
--合成日志
function ForgeHouseController:send11082()
    self:SendProtocal(11082, {})
end
function ForgeHouseController:handle11082(data)
    EventManager:getInstance():Fire(ForgeHouseEvent.Composite_Record,data)
end
function ForgeHouseController:openEquipmentCompRecordWindow(bool)
    if bool == true then 
        if not self.comp_record_view then
            self.comp_record_view = EquipmentCompRecordWindow.New()
        end
        self.comp_record_view:open()
    else
        if self.comp_record_view then 
            self.comp_record_view:close()
            self.comp_record_view = nil
        end
    end
end



--位置调整(现在某认为显示的tips的anchorPoint的为cc.p(0, 1)自己主动的去设)
function ForgeHouseController:adjustTipsPosition1(target, point, view_size, is_middle)
    local win_size = cc.size(SCREEN_WIDTH,SCREEN_HEIGHT)                 -- 父节点的尺寸
    local temp_size = cc.size(142,120)      -- 对象的除此你,这里的对象都是0,0的锚点
    local size = cc.size(temp_size.width, temp_size.height)
    local offset_height = 10                                             -- 偏移值

    local parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)
    local local_pos = parent:convertToNodeSpace(point)
    local start_x = local_pos.x
    local start_y = local_pos.y

    if start_x + size.width > win_size.width then
        start_x = win_size.width - size.width
    elseif start_x < size.width then
        start_x = start_x + 20
    end
    if is_middle then
        start_x = (win_size.width - size.width)/2
    end

    if start_y > win_size.height then
        start_y = win_size.height 
    elseif start_y < size.height then
        start_y = start_y + size.height + 20
    else 
        start_y = start_y 
    end
    target:setPosition(start_x-155, start_y-display.getBottom()+10)
end

function ForgeHouseController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end

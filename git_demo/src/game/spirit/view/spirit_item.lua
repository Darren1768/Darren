-- --------------------------------------------------------------------
-- 竖版伙伴主界面的子项
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
SpiritItem = class("SpiritItem", function()
        return ccui.Widget:create()
    end)

local _config = Config.StarTowerData.data_tower_base

local table_insert = table.insert
function SpiritItem:ctor()
    self:config()
    self:layoutUI()
    self:registerEvents()
end
function SpiritItem:config()
    self.ctrl = SpiritController:getInstance()
    self.size = cc.size(306,654)
    self:setTouchEnabled(true)
    self:setContentSize(self.size)
    self.is_lock = false
    self:retain()
    self.is_open_tower = true
    self.star_list = {}
    self.item_list = {}
end
function SpiritItem:layoutUI()
    local csbPath = PathTool.getTargetCSB("spirit/spirit_item")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)
    self.main_panel = self.root_wnd:getChildByName("main_panel")
    --背景
    self.background = self.main_panel:getChildByName("bg")


    self.tower_name = self.main_panel:getChildByName("name")
    self.role_node = self.main_panel:getChildByName("role_node")
    --锁
    self.lock_icon = self.main_panel:getChildByName("lock")
    self.name_big = self.main_panel:getChildByName("name_big")
    --通关图标
    self.pass_icon = self.main_panel:getChildByName("pass_icon")
    self.pass_icon:setVisible(false)


    --tips
    local desBG = self.main_panel:getChildByName("desBG")
    self.label_power = desBG:getChildByName("label_power")
    self.label_speed = desBG:getChildByName("label_speed")
    self.label_low_power = desBG:getChildByName("label_low_power")
    self.label_tips = desBG:getChildByName("label_tips")


    self.label_power_num =  CommonNum.new(101, desBG, 1, 0, cc.p(0, 0.5))
    self.label_power_num:setPosition(116, 24)


    self.video_btn = self.main_panel:getChildByName("video_btn")

    self.award_panel = desBG:getChildByName("award_list")

    local scroll_view_size = self.award_panel:getContentSize()
    local setting = {
        item_class = BackPackItem,      -- 单元类
        start_x = 10,                  -- 第一个单元的X起点
        space_x = 10,                    -- x方向的间隔
        start_y = 5,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = BackPackItem.Width*0.80,               -- 单元的尺寸width
        item_height = BackPackItem.Height*0.80,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 0,                         -- 列数，作用于垂直滚动类型
        scale = 0.80                     -- 缩放
    }
    self.item_scrollview = CommonScrollViewLayout.new(self.award_panel, cc.p(0,0) , ScrollViewDir.horizontal, ScrollViewStartPos.top, scroll_view_size, setting)
    self.item_scrollview:setSwallowTouches(false)

    -- self.vSize = cc.size(199,199)
    -- local bgRes  = PathTool.getResFrame("spirit", "hl_spirit_9")
    -- self:buildLayout(self.vSize,bgRes)
    -- self.item_icon             self.item_icon:loadTexture(skill_icon, LOADTEXT_TYPE)
end


function SpiritItem:setData(dataSend)
    if not dataSend then return end
    local data = _config[dataSend.level]
    if not data then return end
    self.data = data
    local name = math.ceil(dataSend.level%5) 
    if name ==0 then
        name = 5
    end
    self.tower_name:setString(name)

    -- 引导需要
    self:setName("guildsign_spirit_"..data.lev)

    self:updateMessage()
    self:updateGoodsList()

    self.label_low_power:setString(TI18N("最低战力：暂无"))
    self.label_speed:setString(TI18N("最快通关：暂无"))

    local list = data.tower_replay_data or {}
    for i,v in pairs(list) do
        if v and v.type == 1 then 
            local str = string.format(TI18N("最快通关：%s"),v.name)
            self.label_speed:setString(str)
        else
            local str = string.format(TI18N("最低战力：%s"),v.name)
            self.label_low_power:setString(str)
        end
    end

    local power = self.data.recommend or 0
    self.label_power_num:setNum(power)

    self.label_tips:setString(TI18N("挑战奖励"))
    self:updateModel()
end

function SpiritItem:updateModel()
    if not self.data then return end

    if self.partner_model then
        self.partner_model:removeFromParent()
        self.partner_model = nil
    end

    if not self.partner_model then 
        self.partner_model = BaseRole.new(BaseRole.type.unit, self.data.unit_id)
        self.partner_model:setAnimation(0,PlayerAction.show,true) 
        self.role_node:addChild(self.partner_model)
        self.partner_model:setPosition(cc.p(0,30))
        self.partner_model:setScale(0.8)
    

        local config = Config.UnitData.data_unit(self.data.unit_id)
        if config ~= nil then
            
            local descArr= {}
            local index = string.find(config.name, "：")
            if index then
                descArr = string.split(config.name, "：")
            else
                descArr[2] = config.name
            end
            self.name_big:setString(branchStr(descArr[2]))
        end

    end
end

--更新物品消耗
function SpiritItem:updateGoodsList()
    if not self.data then return end

    for i,v in pairs(self.item_list) do 
        v:setVisible(false)
    end
    local expend_list = {}

    local now_id = self.ctrl:getModel():getNowTowerId() or 0
    if now_id < self.data.lev then 
        local first_id  = 0
        local num = 0
        if self.data.first_show[1] and self.data.first_show[1][1] and self.data.first_show[1][2] then
            first_id = self.data.first_show[1][1]
            num = self.data.first_show[1][2]
        end
        local config = Config.ItemData.data_get_data(first_id)
        table_insert(expend_list,{[1]=first_id,[2]=num,[3]=true})
    end

    for i,v in pairs( self.data.award) do
        table_insert(expend_list,v)
    end

    local index  =1

    local size = self.award_panel:getContentSize()
    for i,v in pairs(expend_list) do 
        if not self.item_list[index] then 
            local item = BackPackItem.new(true,true,nil,0.8)
            item:setDefaultTip()
            self.item_scrollview.scroll_view:addChild(item)
            self.item_list[index] = item
        end

        self.item_list[index]:setPosition(cc.p(10 + BackPackItem.Width/2 + (BackPackItem.Width*0.8 +10)*(index-1),50))
        local config = Config.ItemData.data_get_data(v[1])
        if config then
            self.item_list[index]:setData(config)
            self.item_list[index]:setVisible(true)
            self.item_list[index]:setNum(v[2])
        end
        self.item_list[index]:setFirstIcon(false)
        if v and v[3] and v[3] == true then 
            self.item_list[index]:setFirstIcon(true)
        end
        index = index +1
    end
    local size = self.award_panel:getContentSize()
    local max_width = math.max(20 + (BackPackItem.Width*0.8+10)*#expend_list,size.width)
    self.item_scrollview.scroll_view:setInnerContainerSize(cc.size(max_width,size.height))

end


function SpiritItem:sweepCount(data)
    self.pass_icon:setVisible(false)

    local max_tower = self.ctrl:getModel():getNowTowerId() or 0
    if data and data.lev == max_tower then
        local count = self.ctrl:getModel():getTowerLessCount() or 0
        local buyCount = self.ctrl:getModel():getBuyCount()

        if count <= 0 then
            if buyCount >= 0 then

                local have_buycount = self.ctrl:getModel():getBuyCount() or 0
                if Config.StarTowerData.data_tower_buy[have_buycount+1] then
                else
                    self.pass_icon:setVisible(true)
                end
            else
                self.pass_icon:setVisible(true)
            end
        else
            self.pass_icon:setVisible(false)
        end
    end

    if data.lev <= max_tower then
        self.pass_icon:setVisible(true)
    end



    --层级奖励
    local max = max_tower
    local itemNum = 6 --写死显示6层的奖励

    if max_tower + itemNum >= #_config then 
        max = #_config
    else 
        max = max_tower + itemNum 
    end

    local current = max_tower
    if max_tower+1 >= #_config then 
        current = #_config
    else 
        current = max_tower+1
    end
    --[[
    if self.data.lev > current and self.data.lev <= max then
        local item_show = _config[self.data.lev].item_show[1]
        if item_show then
            local baseid = item_show[1]
            local num = item_show[2]
            local item = BackPackItem.new(nil,true,nil,0.6)
            item:setDefaultTip()
            self._floorAward:addChild(item)
            self._firstAward:setZOrder(10)
            item:setPosition(cc.p(62,51))
            item:setBaseData(baseid, num)
            self._floorAward:setVisible(true)
        else
            self._floorAward:setVisible(false)    
        end
    else
        self._floorAward:setVisible(false)
    end
    ]]
end

function SpiritItem:updateMessage()
    if not self.data then return end
    local max_tower = self.ctrl:getModel():getNowTowerId() or 0

    local bool = false
    if self.data.lev <= max_tower then
        bool = true
    end
    self.is_pass = bool
    self:sweepCount(self.data)

    self.is_lock = self.data.lev > max_tower+1
    self.lock_icon:setVisible(self.is_lock)

    self.is_open_tower = true
    if self.is_pass == false and self.is_lock == false then
        local limit_dun_id = self.data.limit_dun_id or 0
        local data = BattleDramaController:getInstance():getModel():getDramaData()
        if limit_dun_id~=0 and data and data.max_dun_id and data.max_dun_id < limit_dun_id then 
            self.is_open_tower = false
            return
        end
        if self.data.lev == max_tower+1 then


        else

        end
    else

    end
end

-- 裁剪 切割
function SpiritItem:buildLayout(size, bgRes)
	self.head_panel = ccui.Widget:create()
	self.head_panel:setAnchorPoint(cc.p(0.5,0.5))
	self.head_panel:setContentSize(self.vSize)
	self.head_panel:setPosition(self.vSize.width/2, self.vSize.height/2)
	self.head_panel:setCascadeOpacityEnabled(true)
	self:addChild(self.head_panel)
	self:setContentSize(self.vSize)
	self:setCascadeOpacityEnabled(true)

    self.mask = createSprite(bgRes, self.vSize.width/2, self.vSize.height/2, nil, cc.p(0.5, 0.5))
    self.clipNode = cc.ClippingNode:create(self.mask)
    self.clipNode:setAnchorPoint(cc.p(0.5,0.5))
    self.clipNode:setContentSize(self.vSize)
    self.clipNode:setCascadeOpacityEnabled(true)
    self.clipNode:setPosition(self.vSize.width/2,self.vSize.height/2 )
    self.clipNode:setAlphaThreshold(0)
    self.head_panel:addChild(self.clipNode,2)

    self.item_icon = ccui.ImageView:create()
    self.item_icon:setCascadeOpacityEnabled(true)
    self.item_icon:setAnchorPoint(0.5,0.5)
    self.item_icon:setPosition(self.vSize.width/2,self.vSize.height/2+2)
    self.clipNode:addChild(self.item_icon,3)

end
--事件
function SpiritItem:registerEvents()
    self.video_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                if not self.data then return end
                if not self.data.tower_replay_data or next(self.data.tower_replay_data) ==nil then 
                    message(TI18N("暂时没有玩家通过此关，努力成为第一名吧！"))
                    return
                end
                self.ctrl:openVideoWindow(true,self.data,self.data.lev)
            end
        end)

    self:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                self.touch_end = sender:getTouchEndPosition()
                local is_click = true
                if self.touch_began ~= nil then
                    is_click =
                    math.abs(self.touch_end.x - self.touch_began.x) <= 20 and
                    math.abs(self.touch_end.y - self.touch_began.y) <= 20
                end
                if is_click == true then
                    playCommonButtonSound()
                    self:clickHandler()
                    if sender.guide_call_back ~= nil then
                        sender.guide_call_back(sender)
                    end
                end
            elseif event_type == ccui.TouchEventType.began then
                self.touch_began = sender:getTouchBeganPosition()
            end
        end)


end

function SpiritItem:clickHandler()
    local index = self.data.lev
    local cur_lev = self.ctrl:getModel():getNowTowerId() + 1
    if index > cur_lev then
        message(TI18N("当前关卡未开启"))
        return
    end
    if index < cur_lev then
        message(TI18N("当前关卡已通过"))
        return
    end
    local config = Config.StarTowerData.data_tower_base[index]
    if config then
        if not config then return end
        HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.Spirit, {tower_lev = index})

    end

end

function SpiritItem:getData()
    return self.data
end

function SpiritItem:clearInfo()

    self:removeFromParent()
end


function SpiritItem:DeleteMe()
    self:removeFromParent()
    self:removeAllChildren()
    self:release()
end




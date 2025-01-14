--------------------------------------------
-- @description    : 
-- 远航订单item
---------------------------------
VoyageOrderItem = class("VoyageOrderItem", function()
        return ccui.Widget:create()
    end)

local controller = VoyageController:getInstance()
local model = controller:getModel()
local table_insert = table.insert
local string_format = string.format

function VoyageOrderItem:ctor()
    self:configUI()
    self:register_event()
end

function VoyageOrderItem:configUI(  )
    self.size = cc.size(187, 283)
    self:setTouchEnabled(true)
    self:setContentSize(self.size)

    local csbPath = PathTool.getTargetCSB("voyage/voyage_order_item")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    local container = self.root_wnd:getChildByName("container")
    self.container = container

    self.rarity_image = container:getChildByName("rarity_image")
    self.order_name = container:getChildByName("order_name")
    self.order_name:setFontSize(19)

    self.btn_quick_finish = container:getChildByName("btn_quick_finish")
    local btn_res = PathTool.getResFrame("common", "hl_common_4_22")
    self.btn_quick_finish:loadTextures(btn_res,btn_res,btn_res,LOADTEXT_TYPE_PLIST)
    self.btn_quick_finish:setVisible(false)
    self.hl_common_0023_2 = container:getChildByName("hl_common_0023_2")
    self.lbl_pre_times = self.hl_common_0023_2:getChildByName("lbl_pre_time")
    self.lbl_pre_times:setPosition(cc.p(135,12))

    -- self.acc = container:getChildByName("acc")
    self.button = container:getChildByName("button")

    self.get_btn_label = createRichLabel(24, 1, cc.p(0.5, 0.5), cc.p(93, 68))
    self.container:addChild(self.get_btn_label)

    -- self.progress_bg = container:getChildByName("progress_bg")
    -- self.progress = self.progress_bg:getChildByName("progress")
    -- self.progress:setScale9Enabled(true)
    -- self.progress_value = self.progress_bg:getChildByName("progress_value")
    -- self.progress_bg:setVisible(false)

    self.goods_list = container:getChildByName("goods_list")
end

function VoyageOrderItem:register_event()
    self.button:setSwallowTouches(false)
    self.btn_quick_finish:setSwallowTouches(false)
    registerButtonEventListener(self.button, handler(self, self._onClickGetBtn), false, 2,nil,nil,nil,true)
    registerButtonEventListener(self.btn_quick_finish, handler(self, self._onClickQuickFinish), true, REGISTER_BUTTON_SOUND_BUTTON_TYPY,nil,nil,nil,true)
end

function VoyageOrderItem:_onClickGetBtn()
    if self.data then
        if self.data.status == VoyageConst.Order_Status.Unget then
            controller:openVoyageDispatchWindow(true, self.data)
        -- elseif self.data.status == VoyageConst.Order_Status.Underway then
        --     controller:requestFinishOrder(self.data.order_id, 1)
        elseif self.data.status == VoyageConst.Order_Status.Finish then
            controller:requestFinishOrder(self.data.order_id, 0)
        end
        --[[
        -- 引导需要
        if sender and sender.guide_call_back ~= nil then
            sender.guide_call_back(sender)
        end
        ]]
    end
end

--点击快速完成按钮，弹出提示框
function VoyageOrderItem:_onClickQuickFinish()
    local expend = self.config.expend[1]
    local icon_res = ""
    local bid = 0
    local item_config = nil
    if expend then
        bid = expend[1]
        local num = expend[2]
        item_config = Config.ItemData.data_get_data(bid)
        icon_res = PathTool.getItemRes(item_config.icon)
    end

    local str = string.format(TI18N("是否消耗 <img src='%s' scale=0.4 /><div fontcolor=#fff2e6 outline=1,#351d18> %d </div> 快速完成悬赏？"),icon_res,self.gold_num)
    CommonAlert.show( str, TI18N("确定"), function()
        local coupon_num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(bid) --背包
        if self.gold_num>coupon_num then
            message(TI18N(item_config.name.."不足"))
            return
        end
        controller:requestFinishOrder(self.data.order_id, 1)
    end, TI18N("取消"),nil, CommonAlert.type.rich,nil,nil,nil,true)
end

function VoyageOrderItem:setData( data )
    if self.data ~= nil then
        if self.update_self_event ~= nil then
            self.data:UnBind(self.update_self_event)
            self.update_self_event = nil
        end
    end

    EventManager:getInstance():UnBind(self)
    -- 远航活动开启/关闭时价格刷新
    EventManager:getInstance():Bind(VoyageEvent.UpdateActivityStatusEvent,self, function (  )
            self:refreshOrderBtnStatus()
        end)


    if data ~= nil then
        self.data = data
        if self.update_self_event == nil then
            self.update_self_event = self.data:Bind(VoyageEvent.UpdateOrderDataEvent, function()
                    self:refreshOrderInfo()
                end)
        end
        self:refreshOrderInfo()
    end
end

function VoyageOrderItem:refreshOrderInfo(  )
    if not self.data then return end

    local config = self.data.config
    print("================================打印订单配置数据======================")
    printLuaTable(config)
    if not config or next(config) == nil then return end
    self.config = config
    -- 稀有度背景
    local rarity_res = PathTool.getResFrame("voyage", VoyageConst.Order_Rarity_Res[config.quality])
    self.rarity_image:loadTexture(rarity_res, LOADTEXT_TYPE_PLIST)

    self.order_name:setString(config.name)
    -- 奖励
    local award_data = {}
    for i,v in ipairs(config.award) do
        local bid = v[1]
        local num = v[2]
        local vo = deepCopy(Config.ItemData.data_get_data(bid))
        vo.quantity = num
        table_insert(award_data, vo)
    end
    --只显示一个，也应该只有一个
    local item = BackPackItem:new()
    item:setData(award_data[1])
    self.goods_list:addChild(item)
    item:setDefaultTip()
    item:setScale(0.8)
    item:setPositionY(10)

    -- 引导需要
    --[[
    if self.get_btn and self.data.index then
        self.get_btn:setName("get_btn_" .. self.data.index)
    end
    ]]
    self:refreshOrderBtnStatus()
end

-- 刷新按钮状态显示
function VoyageOrderItem:refreshOrderBtnStatus(  )
    
    -- self.acc:setVisible(false)
    
    if self.data.status == VoyageConst.Order_Status.Unget then
        -- if not self.expend_label then
        --     self.expend_label = createRichLabel(24, cc.c3b(255,242,230), cc.p(0.5, 0.5), cc.p(93.5, 55))
        --     self.container:addChild(self.expend_label)
        -- end
        local expend = self.config.expend[1]
        local need_time = self.config.need_time
        if expend then
            local bid = expend[1]
            local num = expend[2]
            local item_config = Config.ItemData.data_get_data(bid)
            local res = PathTool.getItemRes(item_config.icon)
            if model:getActivityStatus() == 1 then
                local discount_cfg = Config.ShippingData.data_const["discount"]
                if discount_cfg then
                    num = num * discount_cfg.val/1000
                end
            end
            -- --self.expend_label:setString(string_format(TI18N("<img src='%s' scale=0.5 /> %d"), res, num))
            -- self.expend_label:setString(string_format(TI18N("<img src='%s' scale=0.5 /><div fontcolor=#fff2e6 outline=1,#351d18>%d</div>"), res, num))
        end
        -- self.get_btn_label:setString('')
        -- self.progress_bg:loadTexture(PathTool.getResFrame("common", "hl_common_172"), LOADTEXT_TYPE_PLIST)

        loadSpriteTexture(self.hl_common_0023_2, PathTool.getResFrame("common", "hl_common_172"), LOADTEXT_TYPE_PLIST)
        -- self.hl_common_0023_2:loadTextures(PathTool.getResFrame("common", "hl_common_172"), LOADTEXT_TYPE_PLIST)
        self.lbl_pre_times:setString(string.format(TI18N("预计%d时"),need_time/60/60))
        -- self.btn_quick_finish:setVisible(false)
        self:openOrderTimer(false)
        -- self.expend_label:setVisible(true)
        -- self.progress_bg:setVisible(false)
    elseif self.data.status == VoyageConst.Order_Status.Underway then
        -- self.progress_bg:loadTexture(PathTool.getResFrame("common", "hl_common_172"), LOADTEXT_TYPE_PLIST)
        loadSpriteTexture(self.hl_common_0023_2, PathTool.getResFrame("common", "hl_common_172"), LOADTEXT_TYPE_PLIST)
        -- self.hl_common_0023_2:loadTextures(PathTool.getResFrame("common", "hl_common_172"), LOADTEXT_TYPE_PLIST)
        local cur_time = GameNet:getInstance():getTime()
        self.left_time = self.data.end_time - cur_time
        if self.left_time < 0 then self.left_time = 0 end
        local gold_num = model:getQuickFinishNeedGoldByTime(self.left_time)
        self.gold_num = gold_num
        -- self.get_btn_label:setString(string_format(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#fff2e6 outline=1,#351d18>%d 助成</div>"), PathTool.getItemRes(3), gold_num))

        -- self.btn_quick_finish:setVisible(true)
        self.lbl_pre_times:setString(TimeTool.GetTimeFormat(self.left_time))
        -- 进度
        -- local percent = 100 - (self.left_time/self.config.need_time)*100
        -- self.progress:setPercent(percent)
        -- self.progress_value:setString(TimeTool.GetTimeFormat(self.left_time))
        
        self:openOrderTimer(true)
        -- 只有未领取,转到领取的时候拨一下特效
        if self.data.old_status == VoyageConst.Order_Status.Unget then
            self.data.old_status = self.data.status
            self:handleEffect(true)
        end
        -- if self.expend_label then
        --     self.expend_label:setVisible(false)
        -- end
        -- self.progress_bg:setVisible(true)
        
        -- self.acc:setVisible(true)
        
    elseif self.data.status == VoyageConst.Order_Status.Finish then
        -- self.get_btn_label:setString('')
        self.lbl_pre_times:setString(TI18N("完成"))
        loadSpriteTexture(self.hl_common_0023_2, PathTool.getResFrame("common", "hl_common_173"), LOADTEXT_TYPE_PLIST)
        -- self.hl_common_0023_2:loadTexture(PathTool.getResFrame("common", "hl_common_173"), LOADTEXT_TYPE_PLIST)
        -- self.btn_quick_finish:setVisible(false)
        -- self.progress_bg:loadTexture(PathTool.getResFrame("common", "hl_common_173"), LOADTEXT_TYPE_PLIST)
        -- self.progress:setPercent(0)
        -- self.progress_value:setString(TI18N("完成"))

        self:openOrderTimer(false)
        -- if self.expend_label then
        --     self.expend_label:setVisible(false)
        -- end
        -- self.progress_bg:setVisible(true)
    end
end

-- 剩余时间定时器
function VoyageOrderItem:openOrderTimer( status )
    self.btn_quick_finish:setVisible(status)
    if status == true then
        if self.order_timer == nil then
            self.order_timer = GlobalTimeTicket:getInstance():add(function ()
                    self.left_time = self.left_time - 1
                    if self.left_time >= 0 then
                        local percent = 100 - (self.left_time/self.config.need_time)*100
                        -- self.progress:setPercent(percent)
                        -- self.progress_value:setString(TimeTool.GetTimeFormat(self.left_time))
                        self.lbl_pre_times:setString(TimeTool.GetTimeFormat(self.left_time))
                    else
                        -- self.progress:setPercent(100)
                        -- self.progress_value:setString(TI18N("完成"))
                        self.btn_quick_finish:setVisible(false)
                        self.lbl_pre_times:setString(TI18N("完成"))
                        GlobalTimeTicket:getInstance():remove(self.order_timer)
                        self.order_timer = nil
                    end
                end, 1)
        end
    else
        if self.order_timer ~= nil then
            GlobalTimeTicket:getInstance():remove(self.order_timer)
            self.order_timer = nil
        end
    end
end

function VoyageOrderItem:handleEffect(status)
    --特效不匹配，暂时不显示
    --[[
    if status == false then
        if self.play_effect then
            self.play_effect:clearTracks()
            self.play_effect:removeFromParent()
            self.play_effect = nil
        end
    else
        if not tolua.isnull(self.container) and self.play_effect == nil then
            local container_size = self.container:getContentSize()
            self.play_effect = createEffectSpine(PathTool.getEffectRes(629), cc.p(container_size.width * 0.5, container_size.height * 0.5), cc.p(0.5, 0.5), false, PlayerAction.action)
            self.container:addChild(self.play_effect, 1)
        elseif self.play_effect then
            self.play_effect:setToSetupPose()
            self.play_effect:setAnimation(0, PlayerAction.action, false)
        end
    end
    ]]
end

function VoyageOrderItem:suspendAllActions()
    if self.data ~= nil then
        if self.update_self_event ~= nil then
            self.data:UnBind(self.update_self_event)
            self.update_self_event = nil
        end
        self.data = nil
    end
    EventManager:getInstance():UnBind(self)
    self:openOrderTimer(false)
    self:handleEffect(false)
end

function VoyageOrderItem:DeleteMe(  )
    if self.good_scrollview then
        self.good_scrollview:DeleteMe()
        self.good_scrollview = nil
    end
    if self.data ~= nil then
        if self.update_self_event ~= nil then
            self.data:UnBind(self.update_self_event)
            self.update_self_event = nil
        end
        self.data = nil
    end
    EventManager:getInstance():UnBind(self)
    self:handleEffect(false)
    self:openOrderTimer(false)
    self:removeAllChildren()
    self:removeFromParent()
end
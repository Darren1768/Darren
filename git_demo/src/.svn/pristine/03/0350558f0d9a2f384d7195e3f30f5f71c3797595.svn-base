-- 
-- User: 
-- Date: 
-- Time: 
-- 文件功能：用于提示的功能
CommonRewardAlert = CommonRewardAlert or BaseClass(BaseView)

CommonRewardAlert.type =
{
    common  = 1,
    rich    = 2,
}

function CommonRewardAlert:__init(type, title, is_auto_close, is_show_title, view_tag, win_type)
    self.type = type or CommonRewardAlert.type.common
    self.offset_height = 95
    self.title = title
    self.timer = 0
    self.timer_for = true
    self.pk_status = FALSE
    self.auto_close = is_auto_close or TRUE
    self.is_show_title = is_show_title or TRUE
    self.view_tag = view_tag or ViewMgrTag.DIALOGUE_TAG
    self.layout_name = "common/common_award_alert"
    self.win_type = win_type or WinType.Tips
end

function CommonRewardAlert:initParam(confirm_callback, cancel_label, cancel_callback, close_callback)
   self.confirm_callback = confirm_callback
   self.cancel_label = cancel_label
   self.cancel_callback = cancel_callback
   self.external_close_callback = close_callback
end

function CommonRewardAlert:open()
    BaseView.open(self)
    self:openCallBack()
end

function CommonRewardAlert.closeAllWin()
    
end

function CommonRewardAlert:close()
    BaseView.close(self)
end

function CommonRewardAlert:close_callback()
    if _is_game_restart then return end
    if self.timer_id then
        GlobalTimeTicket:getInstance():remove(self.timer_id)
    end
    if self.item_list and next(self.item_list) ~= nil then
        for i,v in ipairs(self.item_list) do
            v:DeleteMe()
        end
        self.item_list = {}
    end
end

function CommonRewardAlert:open_callback()
    self.background_panel = self.root_wnd:getChildByName("background_panel")
    self.background_panel:setScale(display.getMaxScale())

    self.main_panel = self.root_wnd:getChildByName("main_panel")
    self:playEnterAnimatianByObj(self.main_panel, 2)

    self.alert_panel = self.main_panel:getChildByName("main_container")
    self.alert_panel:setTouchEnabled(true)
    self.WIDTH = self.alert_panel:getContentSize().width
    
    self.tip_label = self.main_panel:getChildByName("tip_label")
    
    self.ok_btn = self.main_panel:getChildByName("ok_btn")
    self.ok_btn.label = self.ok_btn:getTitleRenderer()

    self.close_btn = self.main_panel:getChildByName("close_btn")
end

--打开调用
function CommonRewardAlert:openCallBack()
    self.ok_btn.label:setString(self.confirm_label)
end

--==============================--
--desc:设置二级扩展字符
--@val:
--@font_size:
--@dis_y:
--@aligment:文本对其情况
--@return 
--==============================--
function CommonRewardAlert:setExtendTextString(val, font_size, dis_y, type, aligment, index) 
    local font_size = font_size or 22
    local dis_y = dis_y or 0
    local type = type  or CommonRewardAlert.type.common
    local index = index or 1

    if self.extend_txt_list == nil then
        self.extend_txt_list = {}    
    end

    if self.extend_txt_list[index] then
        if self.extend_txt_list[index]:getParent() then
            self.extend_txt_list[index]:removeFromParent()
        end
        self.extend_txt_list[index] = nil
    end

    aligment = aligment or cc.TEXT_ALIGNMENT_LEFT 
    if type == CommonRewardAlert.type.common then
        self.extend_txt_list[index] = self:recoutTextFieldSize(val, 560, font_size, Config.ColorData.data_color4[188], aligment)
    else
        self.extend_txt_list[index] = self:recoutRichTextField(val, 560, font_size, Config.ColorData.data_color4[188])
    end
    self.alert_panel:addChild(self.extend_txt_list[index]) 
    
    if aligment == cc.TEXT_ALIGNMENT_LEFT then
        self.extend_txt_list[index]:setAnchorPoint(cc.p(0, 0.5))
        self.extend_txt_list[index]:setPosition(cc.p(20, self.alert_panel:getContentSize().height / 2 + dis_y)) 
    elseif aligment == cc.TEXT_ALIGNMENT_CENTER then
        self.extend_txt_list[index]:setAnchorPoint(cc.p(0.5, 0.5))
        self.extend_txt_list[index]:setPosition(cc.p(self.alert_panel:getContentSize().width / 2, self.alert_panel:getContentSize().height / 2 + dis_y)) 
    end
end

-- 从新计算文本的大小
function CommonRewardAlert:recoutTextFieldSize(str_label, width, font_size, color, aligment)
    color = color or cc.c4b(0x83,0x52,0x4b,0xff)
    aligment = aligment or cc.TEXT_ALIGNMENT_CENTER 
    local label = createWithSystemFont(str_label, DEFAULT_FONT, font_size)
    label:setTextColor(color)
    label:setAlignment(aligment, cc.TEXT_ALIGNMENT_CENTER)
    label:setAnchorPoint(cc.p(0, 1))
    if width ~= nil then
        local label_width = label:getContentSize().width
        local label_height = label:getContentSize().height
        if label_width > width then
            local line_num = math.ceil(label_width/width)
            label:setContentSize(cc.size(width, label_height*line_num))
            label:setWidth(width)
        end
    end
    return label
end

--
function CommonRewardAlert:recoutRichTextField(str_label,maxWidth,font_size, color)
    color = color or cc.c4b(0x83,0x52,0x4b,0xff)
    local Rich = require("common.richlabel.RichLabel")
    local richlabel = Rich.new {
        fontName = DEFAULT_FONT,
        fontSize = font_size,
        fontColor = color,
        maxWidth = maxWidth or 350,
        lineSpace = 5,
        charSpace = 0,
    }
    richlabel:setString(str_label)
    richlabel:setPosition(cc.p(100,0))
    richlabel:setAnchorPoint(0, 1)
    return richlabel
end

function CommonRewardAlert:register_event()
    self.ok_btn:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            if self.confirm_callback then
                if self.input_edit~=nil then
                    
                    self.confirm_callback(self.input_edit:getText())
                else
                    self:confirm_callback()
                end
            end
            if self.auto_close == TRUE then
                self.confirm_callback = nil
                self:close()
            end
        end
    end)

    self.close_btn:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playQuitSound()
            if self.external_close_callback ~= nil then
                self:external_close_callback()
            end
            self.external_close_callback= nil
            self:close()
        end
    end)
end



--[[
    显示带物品的通用提示,暂时只支持一个物品的,多个物品视后续需求再添加
    @param:str 描述,可以不填
    @param:list 物品列表, 第一个参数是物品bid 第二个参数是物品数量
    @param:confirm_callback 确定按钮回调
    @param:cancel_callback 取消按钮回调
    @param:title_str title名字
    @param:type 文字显示的类型, 如果第一个参数str带多颜色,则需要需要填这个,否则默认是普通label
    @param:close_callback 关闭回调
    @param:view_tag 面板层级，引导问题用到
    @param:margin item之间的间距，默认为40
]]
function CommonRewardAlert.showItemApply(str, list, confirm_callback, cancel_callback, title_str, font_size, type, close,close_callback,desc_label,item_info,view_tag,margin)
    type = type or CommonRewardAlert.type.common
    local show_need = false
    item_info = item_info or {}
    if item_info.show_need then
        show_need = item_info.show_need
    end
    local win_type = item_info.win_type
    
    local alert = CommonRewardAlert.New(type, title_str,nil,nil,view_tag, win_type)
    alert.timer = item_info.timer or 0
    alert:initParam(confirm_callback, cancel_callback, close_callback)
    alert:open()
    alert:showItemList(list,show_need,margin)
    alert:setCommonUIZOrder(alert.root_wnd) 
    font_size = font_size or 24
    desc_label = desc_label or ""
    if close == true then
        alert.close_btn:setVisible(true)
    end
    alert.tip_label:setString(str)
    return alert
end

function CommonRewardAlert:showItemList(list,show_need,margin)
    if list == nil or next(list) == nil then return end
    self.item_list = {}
    self.item_name_list = {}
    local over_height = 60
    local item = nil
    local scale = 0.8
    local off = margin or 40
    local _x, _y = 0, 118
    local sum = #list
    local item_conf = nil
    local total_width = sum * BackPackItem.Width * scale + (sum - 1) * off
    local backpack_model = BackpackController:getInstance():getModel()
    local role_vo = RoleController:getInstance():getRoleVo()
    local assets_config = Config.ItemData.data_assets_id2label
    local panel_size = self.alert_panel:getContentSize()
    local max_width = math.max(total_width, panel_size.width)
    local start_x = 2
    if max_width <= panel_size.width then
        start_x = (panel_size.width - total_width) / 2 
    else
        max_width = max_width + start_x 
    end
    if self.item_scroll_view == nil then
        self.item_scroll_view = createScrollView(panel_size.width, panel_size.height+over_height, 0, panel_size.height, self.alert_panel, ccui.ScrollViewDir.horizontal) 
        self.item_scroll_view:setAnchorPoint(cc.p(0, 1))
        self.item_scroll_view:setInnerContainerSize(cc.size(max_width, panel_size.height+over_height))

        if sum > 4 then
            self.item_scroll_view:setTouchEnabled(true)
        else
            self.item_scroll_view:setTouchEnabled(false)
        end
    end

    for i, v in ipairs(list) do
        if v[1] and v[2] then
            local bid = v[1]
            local num = v[2]
            item_conf = Config.ItemData.data_get_data(bid)
            if item_conf then
                item = BackPackItem.new(false, true, false, scale, false, true)
                _x = start_x + (BackPackItem.Width * scale + off) * (i-1) + BackPackItem.Width*scale*0.5
                item:setBaseData(bid, num)
                item:setDefaultTip(true,true)
                if show_need == true then
                    _y = 60 + over_height
                    if assets_config[bid] == nil then -- 不是资产才需要显示需求数量
                        sum = backpack_model:getBackPackItemNumByBid(bid)
                        item:setNeedNum(num, sum)
                    end
                    item:setExtendDesc(true, item_conf.name, BackPackConst.quality_color_id[item_conf.quality]) 
                end
                item:setPosition(_x, _y)
                self.item_scroll_view:addChild(item)
                table.insert(self.item_list, item)
            end
        end
    end 
end





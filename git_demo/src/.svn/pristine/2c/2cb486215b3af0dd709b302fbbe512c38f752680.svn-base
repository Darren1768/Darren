--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-03 13:19:43
]]
NewHallowsStrengthenNode = class("NewHallowsStrengthenNode",function() return ccui.Widget:create() end)

local controller = HallowsController:getInstance()
local bag_controller = BackpackController:getInstance():getModel()
local role_vo = RoleController:getInstance():getRoleVo()
local item_key = {"coin","gold"}
local ui_size = cc.size(690,600)
function NewHallowsStrengthenNode:ctor()
    self:configUi()

    self:createScrollView()
    self:register_event()
end

function NewHallowsStrengthenNode:configUi()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("hallows/new_hallows_strengthen_node"))
    self:addChild(self.root_wnd)
    self:setCascadeOpacityEnabled(true)
    self:setAnchorPoint(0,0)
    self:setContentSize(ui_size)

    self.main_container = self.root_wnd:getChildByName("main_container")

    self.lbl_yimanji = self.main_container:getChildByName("lbl_yimanji")
    --神器属性相关
    self.panel_property = self.main_container:getChildByName("panel_property") --神器属性相关容器
    self.sp_pre_di = self.panel_property:getChildByName("sp_pre_di") --
    self.sp_next_di = self.panel_property:getChildByName("sp_next_di") --
    self.lbl_pre_property = self.panel_property:getChildByName("lbl_pre_property") --当前等级属性文本
    self.lbl_next_property = self.panel_property:getChildByName("lbl_next_property") --下一级属性文本
    self.panel_property_scroll = self.panel_property:getChildByName("panel_property_scroll") --属性容器，存放文本


    --强化消耗道具容器
    self.panel_skill = self.main_container:getChildByName("panel_skill") -- 容器
    self.panel_skill_scroll = self.panel_skill:getChildByName("panel_skill_scroll") -- 容器

    --按钮
    self.btn_streng_all = self.main_container:getChildByName("btn_streng_all") --一键强化
    self.btn_streng = self.main_container:getChildByName("btn_streng") --正常强化

    self.lbl_streng_lv = self.main_container:getChildByName("lbl_streng_lv") --炼化 1/24


    self.cost_item_list = {} --消耗道具列表
    self.pre_property_sp_list = {} --前一级遮罩
    self.next_property_sp_list = {} --下一级遮罩
end

function NewHallowsStrengthenNode:register_event()
    registerButtonEventListener(self.btn_streng_all,handler(self,self.onBtnTouched))
    registerButtonEventListener(self.btn_streng,handler(self,self.onBtnTouched))
end

--创建滑动容器scrollview
function NewHallowsStrengthenNode:createScrollView()
    local size_property = self.panel_property_scroll:getContentSize() --属性容器
    local size_skill = self.panel_skill_scroll:getContentSize() --消耗道具容器

    self.size_property = size_property
    self.size_cost = size_skill

    self.scroll_property = createScrollView(size_property.width,size_property.height,0,0,self.panel_property_scroll,ccui.ScrollViewDir.vertical)
    self.scroll_cost = createScrollView(size_skill.width,size_skill.height,0,0,self.panel_skill_scroll,ccui.ScrollViewDir.horizontal)
    self.scroll_property:setAnchorPoint(cc.p(0, 0))
    self.scroll_cost:setAnchorPoint(cc.p(0, 0))
    self.scroll_cost:setTouchEnabled(false)
end

-- id = base[1],
-- step = base[2],
-- name = base[3],
-- attr = base[4],
-- loss = base[5],
-- max_lucky = base[6],
-- clear_limit = base[7],
-- clear_time = base[8],
-- notice = base[9],
-- effect = base[10],
--单个神器数据
function NewHallowsStrengthenNode:setData(curHallowsData)
    print("===============加载强化数据===")
    self.curHallowsData = curHallowsData
    self:updateContent()
end

function NewHallowsStrengthenNode:updateContent()
    local max_lev = Config.HallowsData.data_max_lev[self.curHallowsData.id] --当前id最大可以升级的阶数
    --当前神器的阶数对应的数据
    local id_in_table = string.format("%d_%d",self.curHallowsData.id,self.curHallowsData.step) --通过id和阶级组合而成的id 后面可能要改成id和等级组合

    local next_step = math.min(max_lev,self.curHallowsData.step+1)  --下一阶
    local next_id_in_table = string.format("%d_%d",self.curHallowsData.id,next_step) --通过id和阶级组合而成的id 后面可能要改成id和等级组合


    local is_max = self.curHallowsData.step>=max_lev

    --
    --
    local hallows_info = Config.HallowsData.data_info(id_in_table) --当前阶级的属性信息
    local next_hallows_info = Config.HallowsData.data_info(next_id_in_table) --下一阶级的属性信息
    self.hallows_info = hallows_info
    self.next_hallows_info = next_hallows_info

    self.lbl_pre_property:setString(string.format(TI18N("%d级属性"),self.curHallowsData.step))
    self.lbl_next_property:setString(string.format(TI18N("%d级属性"),next_step))

    self.lbl_streng_lv:setString(string.format(TI18N("炼化 %d/%d"),self.curHallowsData.step,max_lev))

    local sp_show_x = is_max and 242 or 117
    local lbl_show_x = is_max and 248 or 113
    self.sp_pre_di:setPositionX(sp_show_x)
    self.lbl_pre_property:setPositionX(lbl_show_x)
    self.sp_next_di:setVisible(not is_max)
    self.lbl_next_property:setVisible(not is_max)
    self.lbl_yimanji:setVisible(is_max)
    setChildUnEnabled(is_max,self.btn_streng_all)
    setChildUnEnabled(is_max,self.btn_streng)


    self:updatePropertyLabel(hallows_info,next_hallows_info,is_max) -- 更新属性文本数据
    self:updateCostItem(hallows_info,is_max)
end

-- 更新属性文本数据
function NewHallowsStrengthenNode:updatePropertyLabel(hallows_info,next_hallows_info,is_max)
    local cur_x = is_max and 165 or 15
    local next_x = 245
    local origin_height = self.scroll_property:getContentSize().height-30
    local middle_width = self.scroll_property:getContentSize().width
    local height = 0
    local height_list = {}

    self.scroll_property:removeAllChildren()
    for i,v in ipairs(hallows_info.attr)do
        
        local str = Config.AttrData.data_key_to_name_fun(v[1])
        local lbl_node = createRichLabel(22, cc.c3b(98,53,43),cc.p(0,0),cc.p(0,0),8,nil,400,DEFAULT_FONT)
        str = str.."  +"..v[2]
        lbl_node:setString(str) --skillInfo.des  ,skillInfo.skill_desc
        local size = lbl_node:getSize()
        height = height + size.height


        if not self.pre_property_sp_list[i] and i%2==0 then
            local sp_mask = createImage(self.scroll_property,PathTool.getResFrame("common2","hl_common_0095"),cur_x-10,origin_height,cc.p(0,0),true,nil,true)
            sp_mask:setContentSize(cc.size(199,24))
            sp_mask:setVisible(true)
        end

        lbl_node:setPosition(cc.p(cur_x,origin_height))
        height_list[i] = origin_height
        origin_height = origin_height - size.height -8


        -- if self.pre_property_sp_list[i] and self.pre_property_sp_list[i].setVisible then self.pre_property_sp_list[i]:setVisible(true) end
        self.scroll_property:addChild(lbl_node)
    end

    if is_max then return end

    --箭头图标
    local sp_jiantou = createImage(self.scroll_property,PathTool.getResFrame("common2","hl_common_0096"),middle_width/2-10,origin_height+20,cc.p(0,0),true,nil,true)
    sp_jiantou:setVisible(#hallows_info.attr>0)
    
    --下一级文本
    for i,v in ipairs(next_hallows_info.attr)do
        local str = Config.AttrData.data_key_to_name_fun(v[1])
        local lbl_node = createRichLabel(22, cc.c3b(98,53,43),cc.p(0,0),cc.p(0,0),8,nil,400,DEFAULT_FONT)
        -- str = str..":"..v[2]
        str = string.format("%s <div fontcolor=#47832D>  +%d</div>",str,v[2])
        lbl_node:setString(str)

        lbl_node:setPosition(cc.p(next_x,height_list[i]))

        if not self.next_property_sp_list[i] and i%2==0 then
            local sp_mask = createImage(self.scroll_property,PathTool.getResFrame("common2","hl_common_0095"),next_x,height_list[i],cc.p(0,0),true,nil,true)
            sp_mask:setContentSize(cc.size(210,24))

            sp_mask:setVisible(true)
        end

        self.scroll_property:addChild(lbl_node)
    end
    self.scroll_property:setInnerContainerSize(cc.size(self.size_property.width,height))
end

--更新消耗道具 当前阶级里的消耗的数量
function NewHallowsStrengthenNode:updateCostItem(hallows_info,is_max)
    local loss = hallows_info.loss
    self.scroll_cost:removeAllChildren()
    self.cost_item_list = {}

    local size = self.scroll_cost:getContentSize()
    local middle = size.width/2
    local item_num = #loss
    local origin_x = middle-30-- middle/item_num
    local container_width = 0
    local coupon_num = 0
    local need_num,cost_id = 0,0
    for i,v in ipairs(loss)do
        cost_id = v[1] --消耗的道具id
        local cost_num = v[2] --消耗的道具数量
        need_num = cost_num
        coupon_num = bag_controller:getBackPackItemNumByBid(cost_id) --背包
        if item_key[cost_id] then
            coupon_num = role_vo[item_key[cost_id]] or 0
            break
        end

        if not self.cost_item_list[i] then
            local item = BackPackItem.new(false, true)
            item:setAnchorPoint(0, 0)
            item:setScale(0.9)
            item:setSwallowTouches(false)
            item:setBaseData(cost_id, cost_num) --, cost_num
            item:setDefaultTip()
            self.cost_item_list[i] = item
            self.scroll_cost:addChild(item)
            item:setNeedNum(cost_num,coupon_num)
        else
            self.cost_item_list[i]:setBaseData(cost_id, cost_num) --cost_num
            self.cost_item_list[i]:setNeedNum(cost_num,coupon_num)
        end  

        local item_size = self.cost_item_list[i]:getSize()
        self.cost_item_list[i]:setPosition(origin_x,25)
        self.cost_item_list[i]:setVisible(not is_max)
        origin_x = origin_x + item_size.width+20
        container_width = container_width+item_size.width+5
    end
    self.scroll_cost:setInnerContainerSize(cc.size(container_width,size.height))

    --只会显示一种消耗道具(目前只支持显示一种道具)
    self:updateCostLbl(middle-45,70,MoneyTool.GetMoneyWanString(coupon_num),MoneyTool.GetMoneyWanString(need_num),cost_id,is_max)

    --所需材料提示文本
    if self.tips_lbl then self.tips_lbl:setVisible(not is_max) return end
    
    local lbl =createRichLabel(20,cc.c3b(102,60,43),cc.p(1,0),cc.p(middle-35,155),nil,nil,600,DEFAULT_FONT)
    self.panel_skill:addChild(lbl)
    lbl:setString(TI18N("所需材料 "))
    self.tips_lbl = lbl
    self.tips_lbl:setVisible(not is_max)
end
--total_num,need_num 背包中的数量，所需要的数量
function NewHallowsStrengthenNode:updateCostLbl(x,y,total_num,need_num,cost_bid,is_max)
    local item_info = Config.ItemData.data_get_data(cost_bid)
    if self.lbl_cost then self.lbl_cost:setVisible(not is_max) end
    if not item_info then return end

    local img_path = PathTool.getItemRes(item_info.icon)

    local str = "<img src=%s scale=0.3 /><div fontsize=20 fontcolor=#663c2b> %s/%s</div>"
    str = string.format(str,img_path,total_num,need_num)

    if self.lbl_cost then
        self.lbl_cost:setString(str)
    else
        local lbl_cost = createRichLabel(20,cc.c3b(102,60,43),cc.p(0,0),cc.p(x,y),nil,nil,600,DEFAULT_FONT)
        lbl_cost:setString(str)
        self.panel_skill:addChild(lbl_cost)
        self.lbl_cost = lbl_cost
    end
    
end


--请求服务器强化
function NewHallowsStrengthenNode:requestStrengData(idx,step)
    
    local max_count = self:getMaxCanStrengCount()
    -- print("=========================强化按钮点击",idx,step,max_count)
    local condition_num = idx == 1 and 0 or 5
    if idx == 1 then
        if max_count == condition_num then message(TI18N("道具数量不足")) return end
    else
        if max_count < condition_num then message(TI18N("道具数量不足")) return end
    end

    controller:requestHallowsAdvance(self.curHallowsData.id,step)--requestStrengData(idx,self.curHallowsData.item_id)
end

-- 根据背包中的道具数量判断最多可以强化几次
function NewHallowsStrengthenNode:getMaxCanStrengCount()
    local loss = self.hallows_info.loss
    local cost_id,cost_num = 0,0 --需要消耗的数量
    local max_streng_count = 0 --背包中最大可以强化的数量
    for i,v in ipairs(loss)do
        cost_id = v[1] --消耗的道具id
        cost_num = v[2] --消耗的道具数量
        local coupon_num = bag_controller:getBackPackItemNumByBid(cost_id) --背包
        if item_key[cost_id] then
            coupon_num = role_vo[item_key[cost_id]] or 0
        end
        print("==========获取背包中的道具==",cost_id,coupon_num)
        local count = math.floor(coupon_num/cost_num)
        max_streng_count = max_streng_count==0 and count or (max_streng_count>count and count or max_streng_count)
    end
    return max_streng_count
end








-----------------------------------------------------------------按钮点击事件------------------------------------
function NewHallowsStrengthenNode:onBtnTouched(param,sender)
    local name = sender:getName()
    local idx = name == "btn_streng_all" and 1 or (name == "btn_streng" and 2 or 3)
    local step = name == "btn_streng_all" and 0 or (name == "btn_streng" and 5 or 1)

    self:requestStrengData(idx,step)
end
--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-08 24:23:55
]]
NewHallowUpStarNode = class("NewHallowUpStarNode",function() return ccui.Widget:create() end)

local controller = HallowsController:getInstance()
local bag_controller = BackpackController:getInstance():getModel()
local role_vo = RoleController:getInstance():getRoleVo()
local item_key = {"coin","gold"}
local ui_size = cc.size(690,600)
function NewHallowUpStarNode:ctor()
    self:configUi()
    self:registerEvent()
    self:createScrollView()
end

function NewHallowUpStarNode:configUi()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("hallows/new_hallows_upstar_node"))
    self:addChild(self.root_wnd)
    self:setCascadeOpacityEnabled(true)
    self:setAnchorPoint(0,0)
    self:setContentSize(ui_size)

    self.main_container = self.root_wnd:getChildByName("main_container")

    self.panel_property = self.main_container:getChildByName("panel_property")
    self.panel_property_scroll = self.panel_property:getChildByName("panel_property_scroll") --属性scroll容器

    self.panel_skill = self.main_container:getChildByName("panel_skill")
    self.panel_skill_scroll = self.panel_skill:getChildByName("panel_skill_scroll") --幻化技能scroll容器

    self.panel_cost = self.main_container:getChildByName("panel_cost")
    self.node_cost = self.panel_cost:getChildByName("node_cost")  --消耗道具节点
    self.node_cost_label = self.panel_cost:getChildByName("node_cost_label")  --消耗道具的数量
    self.lbl_tips = self.panel_cost:getChildByName("lbl_tips")  --提示文本
    

    self.lbl_upstar_lv = self.main_container:getChildByName("lbl_upstar_lv")  --幻化等级
    self.btn_upstar = self.main_container:getChildByName("btn_upstar")  --幻化升级按钮

    self.lbl_yimanji = self.main_container:getChildByName("lbl_yimanji")  --已完成幻化

    self.lbl_tips:setPosition(142,50)
    -- self.btn_upstar:setPositionY(0)
    self.cost_item_list = {}
end

function NewHallowUpStarNode:registerEvent()
    registerButtonEventListener(self.btn_upstar,handler(self,self.onBtnTouched))
end

--创建滑动容器scrollview
function NewHallowUpStarNode:createScrollView()
    local size_property = self.panel_property_scroll:getContentSize() --属性容器
    local size_skill = self.panel_skill_scroll:getContentSize() --消耗道具容器

    self.size_property = size_property
    self.size_skill = size_skill

    self.scroll_property = createScrollView(size_property.width,size_property.height,0,0,self.panel_property_scroll,ccui.ScrollViewDir.vertical)
    self.scroll_skill = createScrollView(size_skill.width,size_skill.height,0,0,self.panel_skill_scroll,ccui.ScrollViewDir.vertical)
    self.scroll_property:setAnchorPoint(cc.p(0, 0))
    self.scroll_skill:setAnchorPoint(cc.p(0, 0))

end

function NewHallowUpStarNode:setData(curHallowsData)
    self.curHallowsData = curHallowsData
    self:updateContent(curHallowsData)
end

function NewHallowUpStarNode:updateContent(curHallowsData)
    local id_in_table = string.format("%d_%d",self.curHallowsData.id,self.curHallowsData.skill_lev) --通过id和阶级组合而成的id 后面可能要改成id和等级组合
    print("=========curHallowsData.quality==========idididididdidi  ",id_in_table,curHallowsData.quality,curHallowsData.effect)
    local skill_up_info = Config.HallowsData.data_skill_up(id_in_table) --hallow_data
    local costData = skill_up_info and skill_up_info.lose or {}

    local skill_bid = self.curHallowsData.skill_bid--skill_up_info and skill_up_info.skill_bid or 0
    local skill_info = Config.SkillData.data_get_skill(skill_bid) --skill_data 

    local next_id = skill_info and skill_info.next_id or skill_bid --下一级技能id
    local next_skill_info = Config.SkillData.data_get_skill(next_id) --下一级技能属性加成
    next_skill_info = next_skill_info or skill_info  --如果当前等级技能为最大则默认下一级也是当前技能


    -- local cur_star_lv = self.curHallowsData.skill_lev%5 or 0

    local add_attr = skill_info and skill_info.add_attr or {} --当前等级技能属性加成
    local next_add_attr = next_skill_info and next_skill_info.add_attr or {}

    local cur_skill_lv = skill_info and skill_info.level or 1  --当前技能等级
    local next_skill_lv = next_skill_info and next_skill_info.level or 1  --下一级技能等级



    local max_skill_lev = Config.HallowsData.data_skill_max_lev[self.curHallowsData.id]
    self.lbl_upstar_lv:setString(string.format(TI18N("幻化 %d/%d"),self.curHallowsData.skill_lev,max_skill_lev))

    local is_max = self.curHallowsData.skill_lev>=max_skill_lev

    self.panel_cost:setVisible(not is_max) --满级不显示消耗和按钮
    self.lbl_yimanji:setVisible(is_max) --满级显示已完成幻化
    setChildUnEnabled(is_max,self.btn_upstar)

    self:updateScrollPorperty(add_attr,next_add_attr,cur_skill_lv,next_skill_lv,is_max)
    self:updateCostItem(costData,is_max)
    self:updateSkillScroll()
end

--当前等级加成，下一级加成
function NewHallowUpStarNode:updateScrollPorperty(cur_add_property,next_add_property,cur_skill_lv,next_skill_lv,is_max)
    local cur_x = is_max and 130 or 15
    local next_x = 245
    local origin_height = self.scroll_property:getContentSize().height-80
    local middle_width = self.scroll_property:getContentSize().width
    local height = 0
    local height_list = {}
    self.scroll_property:removeAllChildren()

    self:updateSkillIcon(cur_x+45,origin_height-20,cur_skill_lv)
    if not is_max then
        self:updateSkillIcon(next_x+52,origin_height-20,next_skill_lv)
    end

    for i,v in ipairs(cur_add_property)do
        local str = Config.AttrData.data_key_to_name_fun(v[1])
        local lbl_node = createRichLabel(22, cc.c3b(98,53,43),cc.p(0,0),cc.p(0,0),8,nil,400,DEFAULT_FONT)
        str = str.."  +"..v[2]
        lbl_node:setString(str) --skillInfo.des  ,skillInfo.skill_desc
        local size = lbl_node:getSize()
        height = height + size.height


        if i%2==0 then
            local sp_mask = createImage(self.scroll_property,PathTool.getResFrame("common2","hl_common_0095"),cur_x-10,origin_height,cc.p(0,0),true,nil,true)
            sp_mask:setContentSize(cc.size(199,24))
            sp_mask:setVisible(true)
        end

        lbl_node:setPosition(cc.p(cur_x,origin_height))
        height_list[i] = origin_height
        origin_height = origin_height - size.height -8

        self.scroll_property:addChild(lbl_node)
    end

    if is_max then return end

    --箭头图标
    local sp_jiantou = createImage(self.scroll_property,PathTool.getResFrame("common2","hl_common_0096"),middle_width/2-10,origin_height+20,cc.p(0,0),true,nil,true)
    sp_jiantou:setVisible(#cur_add_property>0)
    ---------下一级属性---------
    for i,v in ipairs(next_add_property)do
        local str = Config.AttrData.data_key_to_name_fun(v[1])
        local lbl_node = createRichLabel(22, cc.c3b(98,53,43),cc.p(0,0),cc.p(0,0),8,nil,400,DEFAULT_FONT)

        str = string.format("%s <div fontcolor=#47832D>  +%d</div>",str,v[2])
        lbl_node:setString(str)

        lbl_node:setPosition(cc.p(next_x,height_list[i]))

        if i%2==0 then
            local sp_mask = createImage(self.scroll_property,PathTool.getResFrame("common2","hl_common_0095"),next_x,height_list[i],cc.p(0,0),true,nil,true)
            sp_mask:setContentSize(cc.size(210,24))

            sp_mask:setVisible(true)
        end

        self.scroll_property:addChild(lbl_node)
    end

    self.scroll_property:setInnerContainerSize(cc.size(self.size_property.width,height+50))
end

function NewHallowUpStarNode:updateSkillScroll()
-------------------------添加神器技能文本---------------------------
    local origin_height = self.size_skill.height
    local skill_height = 0
    local skill_bid = self.curHallowsData.skill_bid or 0
    local skillInfo = Config.SkillData.data_get_skill(skill_bid) or {des = "测试用的数据是多亏和积分换看看格局和克第三节课",type = "active_skill"}
    if not skillInfo then return end

    local des = skillInfo.des
    local skill_type = skillInfo.type  --技能类型，主动 被动 active_skill passive_skill
    local skill_name = skillInfo.name -- 技能名字

    

    local skill_name_des = skill_name.."："
    local dessss = "<div fontcolor=#62352b>                   %s</div><div fontcolor=#816841>%s</div>"
    dessss = string.format(dessss,skill_name_des,des) --技能名字和技能描述

    if not self.skill_lbl_node then
        local res_skill_di,skill_type_des = controller:getImageSkillBgBySkillType(skill_type)
        local sp_skill_di = createImage(self.scroll_skill,PathTool.getResFrame("common",res_skill_di),3,origin_height+14,cc.p(0,1),true,0,true)
        createLabel(20,cc.c3b(255,238,202),nil,7,4,skill_type_des,sp_skill_di,nil,cc.p(0,0),DEFAULT_FONT)

        local lbl_node = createRichLabel(20, cc.c3b(129,104,65),cc.p(0,1),cc.p(5,0),8,nil,440,DEFAULT_FONT)
        self.scroll_skill:addChild(lbl_node)
        self.skill_lbl_node = lbl_node
    end
    
    self.skill_lbl_node:setString(dessss)
    skill_height = self.skill_lbl_node:getSize().height
    self.skill_lbl_node:setPositionY(origin_height+8)
    self.scroll_skill:setInnerContainerSize(cc.size(self.size_skill.width,skill_height+5))
end

--更新消耗道具 当前阶级里的消耗的数量
function NewHallowUpStarNode:updateCostItem(costData)
    local loss = costData
    -- self.node_cost:removeAllChildren()

    local item_num = #loss
    local origin_x = -35
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
            -- coupon_num = role_vo[item_key[cost_id]] or 0
        end

        if not self.cost_item_list[i] then
            local item = BackPackItem.new(true, true)
            item:setAnchorPoint(0, 0)
            item:setScale(0.8)
            item:setSwallowTouches(false)
            item:setBaseData(cost_id, cost_num) --, cost_num
            item:setDefaultTip()
            self.cost_item_list[i] = item
            self.node_cost:addChild(item)
            item:setNeedNum(cost_num,coupon_num)
        else
            self.cost_item_list[i]:setBaseData(cost_id, cost_num) --cost_num
            self.cost_item_list[i]:setNeedNum(cost_num,coupon_num)
        end  

        local item_size = self.cost_item_list[i]:getSize()
        self.cost_item_list[i]:setPosition(origin_x,-55)
        origin_x = origin_x + item_size.width

    end
print("=================cost_bid=====",cost_id)
    --只会显示一种消耗道具(目前只支持显示一种道具)
    self:updateCostLbl(origin_x-85,-25,MoneyTool.GetMoneyWanString(coupon_num),MoneyTool.GetMoneyWanString(need_num),cost_id)
end

--total_num,need_num 背包中的数量，所需要的数量
function NewHallowUpStarNode:updateCostLbl(x,y,total_num,need_num,cost_bid)
    local item_info = Config.ItemData.data_get_data(cost_bid)
    if not item_info then return end

    local img_path = PathTool.getItemRes(item_info.icon)

    local str = "<img src=%s scale=0.3 /><div fontsize=20 fontcolor=#663c2b> %s/%s</div>"
    str = string.format(str,img_path,total_num,need_num)

    if self.lbl_cost then
        self.lbl_cost:setString(str)
    else
        local lbl_cost = createRichLabel(20,cc.c3b(102,60,43),cc.p(0,0),cc.p(x,y),nil,nil,600,DEFAULT_FONT)
        lbl_cost:setString(str)
        self.node_cost_label:addChild(lbl_cost)
        self.lbl_cost = lbl_cost
    end
end

--技能icon
function NewHallowUpStarNode:updateSkillIcon(x,y,star_lev)
    local quality = self.curHallowsData.quality
    local effect = self.curHallowsData.effect

    local ress_name = string.format("hl_common_30%d",quality)
    print("=====ress_name=====quality==",ress_name,quality)
    local res = PathTool.getResFrame("common", controller:getImageNameByQuality2(quality))
    -- local res = PathTool:getResFrame("common","hl_common_304")
    local size =self.scroll_property:getContentSize()
    local sp_di = createImage(self.scroll_property,res,x,y,cc.p(0,0),true,0,true) --20,size.height-20
    sp_di:setScale(0.88)
    -- --icon特效
    -- local size_di = sp_di:getContentSize()
    -- local effect_node = createEffectSpine(effect,cc.p(size_di.width/2-2,size_di.height/2-65),cc.p(0.5,0.5),true,PlayerAction.action_1)
    -- sp_di:addChild(effect_node)
    -- effect_node:setScale(0.36)
    --icon图片
    
    local res =PathTool.getItemRes(self.curHallowsData.item_id)
    local size_di = sp_di:getContentSize()
    local sp_icon = createImage(sp_di,res,size_di.width/2,size_di.height/2,cc.p(0.5,0.5),false,0,true) --20,size.height-20

    --品质图标 ssr
    -- local x,y = sp_di:getContentSize()
    local res = PathTool.getResFrame("common", controller:getImageNameByQuality(quality))
    local sp_quality = createSprite(res,-3,size_di.height+2,sp_di,cc.p(0,1),LOADTEXT_TYPE_PLIST)
    sp_quality:setScale(0.8)


    --星星图标
    local res_month = "hl_common_1007_2"
    local res_sun = "hl_common_1007_1"
    local res_star = "hl_common_1007"
    local res_show = (star_lev>=1 and star_lev<6) and res_star or ((star_lev>=6 and star_lev<=10) and res_month or res_sun)
    print("=========升星数量 ==star_lev",star_lev)
    local star_x,star_y = 0,15
    local middle_x = size_di.width/2-2
    local res_count = star_lev%5==0 and 5 or star_lev%5--(star_lev>=1 and star_lev<6) and star_lev or ((star_lev>=6 and star_lev<=10) and star_lev-5 or star_lev-10)--
    local origin_x = middle_x - (res_count-1)*5
    print("=========升星数量 ==star_lev",star_lev,res_count)
    for i=1,res_count do
        local res = PathTool.getResFrame("common",res_show)
        local star = createImage(sp_di,res,origin_x,star_y,cc.p(0.5,0.5),true,0,false)
        origin_x = origin_x + 12
        star:setScale(1.3)
    end
end

-- 更新属性文本数据
function NewHallowUpStarNode:updatePropertyLabel(hallows_info,next_hallows_info)
    local cur_x = 15
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
            -- self.pre_property_sp_list[i] = sp_mask
            sp_mask:setVisible(true)
        end

        lbl_node:setPosition(cc.p(cur_x,origin_height))
        height_list[i] = origin_height
        origin_height = origin_height - size.height -8


        -- if self.pre_property_sp_list[i] and self.pre_property_sp_list[i].setVisible then self.pre_property_sp_list[i]:setVisible(true) end
        self.scroll_property:addChild(lbl_node)
    end

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
            -- self.next_property_sp_list[i] = sp_mask
            sp_mask:setVisible(true)
        end

        -- if self.next_property_sp_list[i] and self.next_property_sp_list[i].setVisible then self.next_property_sp_list[i]:setVisible(true) end

        self.scroll_property:addChild(lbl_node)
    end
    self.scroll_property:setInnerContainerSize(cc.size(self.size_property.width,height))
end









--------------------------------------onTouched----------------------------
function NewHallowUpStarNode:onBtnTouched(params,sender)
    local name = sender:getName()
    if name == "btn_upstar" then
        controller:requestHallowsSkillUpgrade(self.curHallowsData.id)
    end
end
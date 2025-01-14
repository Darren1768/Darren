--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-03 13:15:22
]]
NewHallowsDetialNode = class(
    "NewHallowsDetialNode",
    function()
        return ccui.Widget:create()
    end
)

local controller = HallowsController:getInstance()
local ui_size = cc.size(690,600)
function NewHallowsDetialNode:ctor()
    self:configUi()
    self:createScrollView()
end

function NewHallowsDetialNode:configUi()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("hallows/new_hallows_detail_node"))
    self:addChild(self.root_wnd)
    self:setCascadeOpacityEnabled(true)
    self:setAnchorPoint(0,0)
    self:setContentSize(ui_size)


    self.main_container = self.root_wnd:getChildByName("main_container")

    --神器属性相关
    self.panel_property = self.main_container:getChildByName("panel_property") --神器属性相关容器
    self.lbl_des = self.panel_property:getChildByName("lbl_des") --描述文本
    self.panel_property_scroll = self.panel_property:getChildByName("panel_property_scroll") --属性容器，存放文本

    local des = TI18N("注：全队属性给所有魂师增加")
    self.lbl_des:setString(des)


    --神器技能
    self.panel_skill = self.main_container:getChildByName("panel_skill") -- 神器技能容器
    self.panel_skill_scroll = self.panel_skill:getChildByName("panel_skill_scroll") -- 技能容器
end

--创建滑动容器scrollview
function NewHallowsDetialNode:createScrollView()
    local size_property = self.panel_property_scroll:getContentSize()
    local size_skill = self.panel_skill_scroll:getContentSize()
    self.size_property = size_property
    self.size_skill = size_skill

    self.scroll_property = createScrollView(size_property.width,size_property.height,0,0,self.panel_property_scroll,ccui.ScrollViewDir.vertical)
    self.scroll_skill = createScrollView(size_skill.width,size_skill.height,0,0,self.panel_skill_scroll,ccui.ScrollViewDir.vertical)
    self.scroll_property:setAnchorPoint(cc.p(0, 0))
    self.scroll_skill:setAnchorPoint(cc.p(0, 0))
end

function NewHallowsDetialNode:updateLabelInScrollView(curHallowsData)

    -------------------------当前添加的是神器属性文本---------------------------
    local attr_data = curHallowsData.add_attr
    self.scroll_property:removeAllChildren()
    self.scroll_skill:removeAllChildren()

    local panel_height = self.size_property.height
    local height = 0
    local origin_height = panel_height-30
    local x1,x2,x,y = 50,270,90,0

    for i,v in ipairs(attr_data)do --skillData  --遍历技能获取技能信息   des_list这个是测试用，正式数据替换成skillData
        local str_property = Config.AttrData.data_id_to_name_fun(v.attr_id)
        local add_value = v.attr_val
        local str = str_property.."                            "..add_value
        local is_double = i%2 == 0
        -- local x = is_double and x2 or x1
        -- local skillInfo = Config.SkillData.data_get_skill(v.skill_bid) --替换成skillData打开此注释
        local lbl_node = createRichLabel(22, cc.c3b(98,53,43),cc.p(0,0),cc.p(0,0),8,nil,400,DEFAULT_FONT)
        lbl_node:setString(str) --skillInfo.des  ,skillInfo.skill_desc
        local size = lbl_node:getSize()

        lbl_node:setPosition(cc.p(x,origin_height))

        --if is_double then
            height = height + size.height+15    
            origin_height = origin_height - height
        --end
         
        self.scroll_property:addChild(lbl_node)  
    end
    self.scroll_property:setInnerContainerSize(cc.size(self.size_property.width,height))


    -------------------------添加神器技能文本---------------------------
    local origin_height = self.size_skill.height-12
    local skill_height = 0
    local skill_bid = curHallowsData.skill_bid or 0
    local skillInfo = Config.SkillData.data_get_skill(skill_bid) or {des = "",type = "active_skill"}
    if not skillInfo then return end

    local des = skillInfo.des

    --======================获得加成的值 替换技能描述里的值 start==================----------
    local hallows_vo = controller:getModel():getHallowsById(curHallowsData.id)
    local skill_atk_val, refine_atk_val = 0,0  --技能加成，精炼加成等级
    if hallows_vo then
        skill_atk_val, refine_atk_val = hallows_vo:getHallowsSkillAndRefineAtkVal()
    end
    local total_atk_val = skill_atk_val + refine_atk_val
    des = string.format(des, total_atk_val, refine_atk_val)
    --======================获得加成的值 替换技能描述里的值 end==============--------------

    local skill_type = skillInfo.type  --技能类型，主动 被动 active_skill passive_skill
    local skill_name = skillInfo.name -- 技能名字

    local res_skill_di,skill_type_des = controller:getImageSkillBgBySkillType(skill_type)
    local sp_skill_di = createImage(self.scroll_skill,PathTool.getResFrame("common",res_skill_di),28,origin_height+8,cc.p(0,1),true,0,true)
    createLabel(20,cc.c3b(255,238,202),nil,7,4,skill_type_des,sp_skill_di,nil,cc.p(0,0),DEFAULT_FONT)

    local skill_name_des = skill_name.."："
    local dessss = "<div fontcolor=#62352b>                   %s</div><div fontcolor=#816841>%s</div>"
    dessss = string.format(dessss,skill_name_des,des) --技能名字和技能描述
    local lbl_node = createRichLabel(20, cc.c3b(129,104,65),cc.p(0,1),cc.p(28,0),8,nil,405,DEFAULT_FONT)
    lbl_node:setString(dessss)
    skill_height = lbl_node:getSize().height
    self.scroll_skill:addChild(lbl_node)
    lbl_node:setPositionY(origin_height)
    self.scroll_skill:setInnerContainerSize(cc.size(self.size_skill.width,skill_height))
end

function NewHallowsDetialNode:setData(curHallowsData) 
    self:updateLabelInScrollView(curHallowsData)
end
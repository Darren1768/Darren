--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-02 19:11:43
]]
NewHallowsDialogWindow = NewHallowsDialogWindow or BaseClass(BaseView)

local controller = HallowsController:getInstance()

local name_quality = {[1] = "B",[2] = "A",[3] = "S",[4] = "SS",[5] = "SS+"}
function NewHallowsDialogWindow:__init()
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Tips

	self.layout_name = "hallows/new_hallows_dialog_window"
end

function NewHallowsDialogWindow:configUi()
    self.background_panel = self.root_wnd:getChildByName("background_panel")
    self.background_panel:setScale(display.getMaxScale())
    self.main_container = self.root_wnd:getChildByName("main_container")
    self.panel_normal = self.main_container:getChildByName("panel_normal")
    self.sp_skill_mask = self.main_container:getChildByName("sp_skill_mask")

    self.node_label = self.panel_normal:getChildByName("node_label")
    self.panel_skill_des = self.sp_skill_mask:getChildByName("panel_skill_des") --技能效果文本容器

    self.lbl_title = self.main_container:getChildByName("sp_title_di"):getChildByName("lbl_title") --标题文本
    self.lbl_num_sp = self.node_label:getChildByName("lbl_num_sp") --合成碎片文本 （合成碎片：30/90）
    self.lbl_quality = self.node_label:getChildByName("lbl_quality") --神器品质文本 （神器品质：SS+级）
    

    self.sp_icon = self.panel_normal:getChildByName("sp_icon")  --神器icon图片
    self.sp_quality = self.panel_normal:getChildByName("sp_quality") --神器品质图片
    self.lbl_name = self.panel_normal:getChildByName("lbl_name") --生命神器文本

    self.btn_jihuo = self.main_container:getChildByName("btn_jihuo")  --激活按钮
    self.btn_close = self.main_container:getChildByName("btn_close")  --关闭按钮

    local panel_size = self.panel_skill_des:getContentSize()
    self.panel_size = panel_size
    self.skill_des_scroll_view = createScrollView(panel_size.width, panel_size.height-5,0,0,self.panel_skill_des,ccui.ScrollViewDir.vertical)
    self.skill_des_scroll_view:setAnchorPoint(cc.p(0, 0))

    local lbl_rich_skill_des = createRichLabel(20, cc.c3b(129,104,65),cc.p(0,1),cc.p(-167,17),10,nil,320,DEFAULT_FONT)
    self.node_label:addChild(lbl_rich_skill_des)
    self.lbl_rich_skill_des = lbl_rich_skill_des

    -- self.sp_icon:setVisible(false)
    self.sp_quality:setVisible(false)
end

function NewHallowsDialogWindow:register_event()
    registerButtonEventListener(self.btn_jihuo,handler(self,self.onTouchedJihuo))
    registerButtonEventListener(self.btn_close,handler(self,self.onCloseTouched))
end

function NewHallowsDialogWindow:open_callback()
    self:configUi()
end

-- step    1
-- is_update       true
-- seal    0
-- eventSys        table: 0x13e2aea8
-- reward  table: 0x13f8c8c0
-- skill_lev       1
-- red_status_list table: 0x13f8c8e8
-- power   0
-- lucky_endtime   0
-- is_activate     0
-- add_attr        table: 0x15949458
-- _class_type     table: 0x11d66680
-- id      5
-- DeleteMe        function: 0x13f8b8e0
-- look_id 0
-- skill_bid       0
-- lucky   0
-- refine_lev      0
function NewHallowsDialogWindow:openRootWnd(params)
    self:updateContent(params)
end

function NewHallowsDialogWindow:updateContent(itemData)
    if not itemData then return end
    self.itemData = itemData
    self.lbl_title:setString(itemData.name)

    --itemData.skill --服务器传过来的技能数据格式
    -- skill{
    --     1 = {
    --         lev = 1,
    --         skill_bid = 0
    --     }
    -- }
    -- local skillData = itemData.skill --服务器传过来的技能
    local skillbid = itemData.skill_bid --技能id
    local skillLev = itemData.skill_lev --技能等级

    local cur_sp_num,total_sp_num = itemData.cur_sp_num or 0,itemData.total_sp_num or 0  --合成碎片 拥有的碎片和总需要的碎片
    local quality_str = name_quality[itemData.quality]

    self.lbl_num_sp:setString(string.format(TI18N("合成碎片：%d/%d"),cur_sp_num,total_sp_num))
    self.lbl_quality:setString(string.format(TI18N("神器品质：%s级"),quality_str))

    -- local res = PathTool.getResFrame("common", controller:getImageNameByQuality(itemData.quality))
    -- self.sp_qual exture(res, LOADTEXT_TYPE_PLIST)
    
    --icon图片
    self.sp_icon:loadTexture(PathTool.getItemRes(itemData.item_id),LOADTEXT_TYPE)
    -- --icon特效
    -- if not self.icon_effect then
    --     local effect_name = itemData.effect
    --     print("=============特效名字==",effect_name)
    --     local x,y = self.sp_icon:getPosition()
    --     local effect = createEffectSpine(effect_name,cc.p(x+6,y-70),cc.p(0.5,0.5),true,PlayerAction.action_1)
    --     self.panel_normal:addChild(effect)
    --     effect:setScale(0.4)
    --     self.icon_effect = effect
    -- end

    --品质图标 ssr
    if not self.sprite_quality then
        local x,y = self.sp_quality:getPosition()
        local res = PathTool.getResFrame("common", controller:getImageNameByQuality(itemData.quality))
        local sp_quality = createSprite(res,x,y,self.panel_normal,cc.p(0,1),LOADTEXT_TYPE_PLIST)
        self.sprite_quality = sp_quality
    end
    local des = itemData.desc or "无"
    local des_name = itemData.name or "无"

    self.lbl_rich_skill_des:setString(des)
    self.lbl_name:setString(des_name)


    -- local skill_des_list = {{skill_des = "测试用的技能描述数据沙发客交电话费是肯定结构和梵蒂冈就好"},{skill_des = "睡大觉返回的开个回复的顾客很干净返回看见发货"}}
    -- local skill_des= "测试用的技能描述数据沙发客交电话费是发客交电话费是肯的开个回复的顾客很干净定肯定结构和梵蒂冈就好\n睡大觉返回的的开个回复的顾客很干净开个回复的顾客很干净的开个回复的顾客很干净返回看见发货"
    -- local des_list = string.split(skill_des,"\n")
    local height = 0
    -- for i,v in ipairs(skillData)do --skillData  --遍历技能获取技能信息   des_list这个是测试用，正式数据替换成skillData
    local skillInfo = Config.SkillData.data_get_skill(skillbid) --替换成skillData打开此注释
    local lbl_node = createRichLabel(22, cc.c3b(98,53,43),cc.p(0,1),cc.p(0,0),8,nil,600,DEFAULT_FONT)  

    local hallows_vo = controller:getModel():getHallowsById(itemData.id)
    local skill_atk_val, refine_atk_val = 0,0
    if hallows_vo then
        skill_atk_val, refine_atk_val = hallows_vo:getHallowsSkillAndRefineAtkVal()
    end
    local total_atk_val = skill_atk_val + refine_atk_val
    local des1 = skillInfo.des
    des1 = string.format(des1, total_atk_val, refine_atk_val)
    lbl_node:setString(des1) --skillInfo.des  ,skillInfo.skill_desc


    local size = lbl_node:getSize()

    lbl_node:setPositionY(self.panel_size.height-8)
    height = height + size.height+8

    self.skill_des_scroll_view:addChild(lbl_node)
    -- end
    self.skill_des_scroll_view:setInnerContainerSize(cc.size(self.panel_size.width,height))
end


------------------------------------------onTouched-------------------
-- 点击激活按钮回调
function NewHallowsDialogWindow:onTouchedJihuo()
    controller:requestJiHuoHallows(self.itemData.id)
end

function NewHallowsDialogWindow:onCloseTouched()
    controller:openUnlockDialogWindow(false)
end
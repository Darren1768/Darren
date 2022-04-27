--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-02 13:14:22
]]
NewHallowsMainItem =
    class(
    "NewHallowsMainItem",
    function()
        return ccui.Widget:create()
    end
)

local controller = HallowsController:getInstance()
local ui_size = cc.size(200,240)

function NewHallowsMainItem:ctor()
    self:configUi()
    self:registerEvent()
end

function NewHallowsMainItem:configUi()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("hallows/new_hallows_item"))
    self:addChild(self.root_wnd)
    self:setCascadeOpacityEnabled(true)
    self:setAnchorPoint(0,0)
    self:setContentSize(ui_size)

    self.main_container = self.root_wnd:getChildByName("main_container")
    

    self.node_content = self.main_container:getChildByName("node_content")
    self.nodes_label = self.main_container:getChildByName("nodes_label")

    self.sp_bg = self.node_content:getChildByName("sp_bg")
    self.sp_icon = self.node_content:getChildByName("sp_icon")
    self.sp_mask = self.node_content:getChildByName("sp_mask")
    self.node_star = self.node_content:getChildByName("node_star")

    self.sp_quality = self.nodes_label:getChildByName("sp_quality")
    self.lbl_name = self.nodes_label:getChildByName("lbl_name") --名字
    self.lbl_num = self.nodes_label:getChildByName("lbl_num") --等级

    self.sp_quality:setVisible(false)
    self.sp_icon:setVisible(false)
end

function NewHallowsMainItem:registerEvent()
    registerButtonEventListener(self.main_container,function()
        if self.callback then self.callback(self.itemData) end
    end)
    self.main_container:setSwallowTouches(false)
end

function NewHallowsMainItem:setCallback(callback)
    self.callback = callback
end

function NewHallowsMainItem:setData(data)
    self.data = data
    self.itemData = clone(data)
    self:updateContent(data)
end

-- Config.HallowsData.data_base = {
-- 	[1] = {id=1, name="埃里克血斧", effect="E21050", item_id=72104, c_res_id="H21050"},
-- 	[2] = {id=2, name="阿瑞斯战腕", effect="E21070", item_id=72106, c_res_id="H21070"},
-- 	[3] = {id=3, name="永恒神枪", effect="E21020", item_id=72107, c_res_id="H21020"},
-- 	[4] = {id=4, name="罗睺之弓", effect="E21010", item_id=72102, c_res_id="H21010"},
-- 	[5] = {id=5, name="魔神之锤", effect="E21030", item_id=72103, c_res_id="H21030"},
-- }

--Config.ItemData.data_get_data
-- id = base[1],
-- name = base[2],
-- icon = base[3],
-- type = base[4],
-- sub_type = base[5],
-- quality = base[6],
-- overlap = base[7],
-- gain_type = base[8],
-- use_type = base[9],
-- expire_type = base[10],
-- value = base[11],
-- effect = base[12],
-- client_effect = base[13],
-- source = base[14],
-- desc = base[15],
-- lev = base[16],
-- career = base[17],
-- sex = base[18],
-- ext = base[19],
-- is_effect = base[20],
-- eqm_jie = base[21],
-- fast_use = base[22],
-- tips_btn = base[23],
-- type_desc = base[24],
-- use_desc = base[25],
-- can_share = base[26],
-- camp_type = base[27],


--单条神器的服务器数据
-- 1 = {
--     step = 1,
--     is_activate = 0,
--     refine_lev = 0,
--     id = 5,
--     seal = 0,
--     skill = {
    --      1 = {
    --       lev = 1,
    --       skill_bid = 0,
    --      },
--     },
--     look_id = 0,
--     add_attr = {
    --      1 = {
    --       attr_id = 104,
    --       attr_val = 471,
    --      },
    --      2 = {
    --       attr_id = 101,
    --       attr_val = 55,
    --      },
--      },
--    },

function NewHallowsMainItem:updateContent(data)
    if not data then return end

    local id = data.id
    local info = Config.HallowsData.data_base[data.id]
    print("===================info.item_id=",info.item_id)
    local item_data = Config.ItemData.data_get_data(info.item_id)

    table.merge(self.itemData,item_data)

    self.itemData.id = id
    self.itemData.effect = info.effect
    self.itemData.item_id = info.item_id

    self.lbl_name:setString(info.name)
    self.lbl_num:setString(data.step) --refine_lev 精练等级  --step 神器阶级

    --icon特效
    if not self.icon_effect then
        local effect_name = info.effect
        local x,y = self.sp_icon:getPosition()
        local effect = createEffectSpine(effect_name,cc.p(-5,-70),cc.p(0.5,0.5),true,PlayerAction.action_2)
        self.node_content:addChild(effect)
        effect:setScale(0.4)
        self.icon_effect = effect
    end
    
    -- -- 神器icon
    -- local icon = PathTool.getSkillRes(item_data.icon)
    -- self.sp_icon:loadTexture(icon,LOADTEXT_TYPE)
    
    --品质图标 ssr
    if not self.sprite_quality then
        local x,y = self.sp_quality:getPosition()
        local res = PathTool.getResFrame("common", controller:getImageNameByQuality(item_data.quality))
        local sp_quality = createSprite(res,x+3,y+4,self.nodes_label,cc.p(0,1),LOADTEXT_TYPE_PLIST)
        self.sprite_quality = sp_quality
        sp_quality:setScale(0.8)
    end

    --底图颜色
    res = PathTool.getResFrame("hallows",controller:getImageNameByQuality(item_data.quality,true))
    self.sp_bg:loadTexture(res,LOADTEXT_TYPE_PLIST)

    setChildUnEnabled(data.is_activate == 0,self.node_content)
    -- setChildUnEnabled(data.is_activate == 0,self.node_content)
    -- setChildUnEnabled(false,self.lbl_name)
    

end
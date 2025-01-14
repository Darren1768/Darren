-- --------------------------------------------------------------------
-- 技能
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------

SkillPanel = class("SkillPanel", function()
        return ccui.Widget:create()
    end)


local string_format = string.format

SkillPanel.Width = 709
SkillPanel.Height = 242

function SkillPanel:ctor(skill_vo, is_lock, not_show_next, hide_flag, fire_cd, hallows_atk_val)
    self.title_str= ""
    self.skill_vo=skill_vo
    self.is_lock=is_lock
    self.size = cc.size(SkillPanel.Width, SkillPanel.Height)
    self:setContentSize(self.size)
    self:open_callback( )
    self:register_event()
    self:updateVo(skill_vo, is_lock, not_show_next, hide_flag, fire_cd, hallows_atk_val)
end

--[[
@功能:构建UI
@参数:
@返回值:
]]
function SkillPanel:open_callback( ... )
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/skill_panel"))
    self:addChild(self.root_wnd)
    self.main_panel = self.root_wnd:getChildByName("main_panel")

    self.container = self.main_panel:getChildByName("container")            -- 背景,需要动态设置尺寸
    self.container_init_size = self.container:getContentSize()

    self.base_panel = self.container:getChildByName("base_panel")
    self.base_panel_height = self.base_panel:getContentSize().height

    self.skill_icon = self.base_panel:getChildByName("skill_icon")
    self.skill_item = SkillItem.new(false,false,false,nil,true,nil,true,true)
    self.skill_icon:addChild(self.skill_item)
    self.skill_name = self.base_panel:getChildByName("name")
    self.line = self.container:getChildByName("line")
    self.line_1 = self.container:getChildByName("line_1")


    -- 描述
    self.desc_panel = self.container:getChildByName("desc_panel")
    self.scroll_view_desc =  self.desc_panel:getChildByName("scroll_view")
    self.scroll_view_desc:setScrollBarEnabled(false)
    self.skill_desc = createRichLabel(20,cc.c4b(0x4a,0x23,0x1c,0xff),cc.p(0,1),cc.p(0,120),4,nil,430)
    self.scroll_view_desc:addChild(self.skill_desc)
    self.scroll_desc_size = self.scroll_view_desc:getContentSize()
    -- self.scroll_view_desc:setSwallowTouches(false)
    self.desc_panel:setSwallowTouches(false)

    --buff描述
    self.buff_panel = self.container:getChildByName("buff_panel")
    self.scroll_view_buff = self.buff_panel:getChildByName("scroll_view")
    self.scroll_view_buff:setScrollBarEnabled(false)
    self.buff_desc = createRichLabel(20,cc.c4b(0x4a,0x23,0x1c,0xff),cc.p(0,1),cc.p(0,50),4,nil,430)
    self.scroll_view_buff:addChild(self.buff_desc)
    self.scroll_buff_size = self.scroll_view_buff:getContentSize()
    -- self.scroll_view_buff:setSwallowTouches(false)
    self.buff_panel:setSwallowTouches(false)

    self.tip_panel =self.container:getChildByName("tip_panel")

    local tab_btn_obj =  self.base_panel:getChildByName("tab_btn")
    self.tab_list = {}
    for i=1,3 do
        local tab_btn = {}
        local item = tab_btn_obj:getChildByName("tab_btn_"..i)
        tab_btn.btn = item
        tab_btn.index = i
        tab_btn.select_bg = item:getChildByName("select_img")
        tab_btn.select_bg:setVisible(false)

        self.tab_list[i] = tab_btn

    end

    if self.is_lock then -- 未开启
        self.cur_tab_index = 1
        self.cur_tab = self.tab_list[1]
        self.tab_list[1].select_bg:setVisible(true)
    elseif self.skill_vo.next_id == 0 then -- 已满级
        self.cur_tab_index = 2
        self.cur_tab = self.tab_list[2]
        self.tab_list[2].select_bg:setVisible(true)
    else
        self.cur_tab_index = 1
        self.cur_tab = self.tab_list[1]
        self.tab_list[1].select_bg:setVisible(true)
    end

 
end

function SkillPanel:register_event()
    for index, tab_btn in ipairs(self.tab_list) do
        registerButtonEventListener(tab_btn.btn, function() self:changeTabType(index) end ,false, 1) 
    end
end

-- @_type 参考 HeroConst.MainInfoTab 定义
function SkillPanel:changeTabType(index)
    if not self.tab_list then return end
    if not self.tab_list[index] then return end
    if self.cur_tab == self.tab_list[index] then return end


    if self.cur_tab ~= nil then
        self.cur_tab.select_bg:setVisible(false)
    end
    self.cur_tab = self.tab_list[index]

    if self.cur_tab ~= nil then

        self.cur_tab.select_bg:setVisible(true)

    end
    self.cur_tab_index = index
    self:changeDesc(index)
    -- EventManager:getInstance():Fire(HeroEvent.Hero_Data_Update_Scroll)
end

function SkillPanel:changeDesc(index)
    self.cur_tab_index = index
    self:updateVo(self.skill_vo, self.is_lock, self.not_show_next, self.hide_flag, self.fire_cd, self.hallows_atk_val)
end

--[[
@功能:设置技能信息
@参数:Config.Skill   ,  Config.RoleCareerSkill
@返回值:
]]
function SkillPanel:updateVo( skill_vo, is_lock, not_show_next, hide_flag, fire_cd, hallows_atk_val )
    self.skill_vo = skill_vo
    self.is_lock = is_lock
    self.not_show_next = not_show_next
    self.hide_flag = hide_flag
    self.fire_cd = fire_cd
    self.hallows_atk_val = hallows_atk_val

    local level = skill_vo.skill_up_level and skill_vo.skill_up_level+1 or 1--skill_vo.level or 1
    if skill_vo.client_lev and skill_vo.client_lev>0 then
        level = skill_vo.client_lev
    end
    -- 技能名字
    -- if not hide_flag then
    --     self.skill_name:setString(skill_vo.name.."  Lv."..level)
    -- else
    --     self.skill_name:setString(skill_vo.name)
    -- end
    self.skill_name:setString(skill_vo.name)

  
    self.skill_item:setData(skill_vo)
    self.skill_item:showUnEnabled(is_lock)

    if self.extend_desc == nil then
        self.extend_desc = createRichLabel(20,cc.c3b(129,104,65),cc.p(1,0.5),cc.p(675,218),nil,nil,300)
        self.base_panel:addChild(self.extend_desc)
    end
    if not hide_flag then
        local extend_str = ""
        if self.skill_vo.cd == 0 then
            extend_str = TI18N("无冷却时间")
        else
            extend_str = string_format("<div fontcolor=#816841>%s</div><div fontcolor=#816841>%s</div><div fontcolor=#816841>%s</div>", TI18N("冷却"),self.skill_vo.cd, TI18N("回合") )
        end
        if fire_cd and fire_cd ~= 0 then
            fire_cd = fire_cd
        else
            fire_cd = self.skill_vo.fire_cd or 0
        end
        if fire_cd ~= 0 then
            extend_str = extend_str..string_format("<div fontcolor=#816841>%s</div><div fontcolor=#816841>%s</div><div fontcolor=#816841>%s</div>", TI18N("，第"), fire_cd, TI18N("回合释放")) 
        end
        self.extend_desc:setString(extend_str)
    end

    -- 统计最大高度
    local skill_des_height = 0
    if self.skill_vo.des ~= "" then
        if self.skill_vo.hallows_atk and self.skill_vo.hallows_atk > 0 and hallows_atk_val then
            local skill_atk_val = self.skill_vo.hallows_atk
            local total_atk_val = skill_atk_val + hallows_atk_val
            local str = string.format(self.skill_vo.des, total_atk_val, hallows_atk_val)
            self.skill_desc:setString(str)
        else
            self.skill_desc:setString(self.skill_vo.des)
        end

        self.skill_desc:setString(self.skill_vo.des)


        local label_size = self.skill_desc:getContentSize()
        local max_height = math.max(label_size.height,   self.scroll_desc_size.height)
        self.scroll_view_desc:setContentSize(cc.size(self.scroll_desc_size.width, math.min(max_height, 120))) 
        self.scroll_view_desc:setInnerContainerSize(cc.size(self.scroll_desc_size.width, max_height))
        self.skill_desc:setPositionY(max_height)

        if label_size.height < 120 then 
            self.scroll_view_desc:setTouchEnabled(false)
        end 
    end



    ---- 2 3 显示
    self.tip_panel:setVisible(false)

    local buff_desc_str = ""
    local buff_desc_height = 0
    if self.skill_vo.buff_des ~= nil and self.skill_vo.buff_des[1] and next(self.skill_vo.buff_des[1])  then
        self.line:setVisible(true)
        local buff_config = Config.SkillData.data_get_buff 
        local _top_x = self.tip_panel:getChildByName("tip_1"):getPositionX()

        -- for i=1 ,2 do  
        --     table.insert(self.skill_vo.buff_des[1],self.skill_vo.buff_des[1][1])
        -- end 

        for i, v in ipairs(self.skill_vo.buff_des[1]) do
            local config = buff_config[v]
            if config then


                local name_color = "#bd5110"

                local res_hero_tip = PathTool.getResFrame("hero","hl_hero_1006")
                if config.positive_or_negative ==1  then --增益 -绿色
                    name_color = "#47832d"
                    res_hero_tip = PathTool.getResFrame("hero","hl_hero_1007")
                elseif config.positive_or_negative ==2 then  --减益 --红色
                    name_color = "#d6453b"
                    res_hero_tip = PathTool.getResFrame("hero","hl_hero_1008")
                elseif config.positive_or_negative ==3 then  --控制 --橙色
                    name_color = "#bd5110"
                    res_hero_tip = PathTool.getResFrame("hero","hl_hero_1006")
                end 

                self.tip_panel:setVisible(true)
                local tip_item =  self.tip_panel:getChildByName("tip_"..i)
                if tip_item then 
                    tip_item:setVisible(true)
                    local tip_name = tip_item:getChildByName("Text_1")
                    tip_name:setString(config.name)
                    tip_name:setPosition(cc.p(8,10))
                    tip_item:setPositionX(_top_x)
                    tip_item:setCapInsets(cc.rect(30, 10, 5, 10))
                    tip_item:setContentSize(cc.size(tip_name:getContentSize().width+20,22))
                    tip_item:loadTexture(res_hero_tip, LOADTEXT_TYPE_PLIST)
                    _top_x= tip_item:getPositionX()+tip_item:getContentSize().width + 5
                end 

                
              

                if self.cur_tab_index==2 and config.show_type == 1 then
                    local buff_desc = string_format("<div fontcolor=%s>\n[%s]</div><div fontcolor=#62352b>：%s</div>",name_color, config.name, config.desc)
                    buff_desc_str = buff_desc_str..buff_desc    
                end
              
                if self.cur_tab_index==3 and config.show_type == 2 then
                    local buff_desc = string_format("<div fontcolor=%s>\n[%s]</div><div fontcolor=#62352b>：%s</div>",name_color, config.name, config.desc)
                    buff_desc_str = buff_desc_str..buff_desc
                end

            end
        end

    end
    if buff_desc_str == "" then
        buff_desc_str = "<div fontcolor=#4a231c>无</div>"
    end

    ---  1 显示
    -- 下级描述
    if self.skill_vo.open_desc ~= "" and not not_show_next and not hide_flag and  self.cur_tab_index==1  then
        if is_lock then -- 未开启
            buff_desc_str = self.skill_vo.open_desc
        elseif self.skill_vo.next_id == 0 then -- 已满级
            buff_desc_str = string_format(TI18N("<div fontcolor=#4a231c>技能已满级</div>"))
        else
            buff_desc_str = self.skill_vo.skill_desc
        end
    end
    
    if buff_desc_str ~= "" then
        self.buff_desc:setString(buff_desc_str)
        local label_size_buff = self.buff_desc:getContentSize()
        local max_height_buff = math.max(label_size_buff.height,   self.scroll_buff_size.height)
        self.scroll_view_buff:setContentSize(cc.size(self.scroll_buff_size.width, math.min(max_height_buff, 50))) 
        self.scroll_view_buff:setInnerContainerSize(cc.size(self.scroll_buff_size.width, max_height_buff))
        self.buff_desc:setPositionY(max_height_buff)
        self.scroll_view_buff:setTouchEnabled(true)

        if label_size_buff.height < 50 then 
            self.scroll_view_buff:setTouchEnabled(false)
        end 
    else
        if self.buff_desc ~= nil then
            self.buff_desc:setString('')
        end
    end


   
    -- -- 统计最大高度
    -- local total_height = 20

    -- local skill_des_height = 0
    -- if self.skill_vo.des ~= "" then
    --     if self.skill_desc == nil then
    --         self.skill_desc = createRichLabel(20,cc.c4b(0x4a,0x23,0x1c,0xff),cc.p(0,1),cc.p(150,570),4,nil,430)
    --         self.container:addChild(self.skill_desc)
    --     end
    --     if self.skill_vo.hallows_atk and self.skill_vo.hallows_atk > 0 and hallows_atk_val then
    --         local skill_atk_val = self.skill_vo.hallows_atk
    --         local total_atk_val = skill_atk_val + hallows_atk_val
    --         local str = string.format(self.skill_vo.des, total_atk_val, hallows_atk_val)
    --         self.skill_desc:setString(str)
    --     else
    --         self.skill_desc:setString(self.skill_vo.des)
    --     end

    --     self.skill_desc:setString(self.skill_vo.des)

    --     skill_des_height = self.skill_desc:getContentSize().height 
    --     --避免挡住按钮
    --     if skill_des_height <120 then
    --         skill_des_height = 120
    --     end
    --     total_height  = total_height + skill_des_height + 2
    -- end


    -- total_height  = total_height  + 18


    -- ---- 1 3 显示

    -- local buff_desc_str = ""
    -- local buff_desc_height = 0
    -- if self.skill_vo.buff_des ~= nil and self.skill_vo.buff_des[1] and next(self.skill_vo.buff_des[1]) and  (self.cur_tab_index==1 or self.cur_tab_index ==3) then
    --     self.line:setVisible(true)
    --     local buff_config = Config.SkillData.data_get_buff 
    --     for i, v in ipairs(self.skill_vo.buff_des[1]) do
    --         local config = buff_config[v]
    --         if config then
    --             if buff_desc_str ~= "" then
    --                 buff_desc_str = buff_desc_str.."\n"
    --             end
    --             if self.cur_tab_index==1 and config.show_type == 1 then
    --                 local buff_desc = string_format("<div fontcolor=#47832d>[%s]</div><div fontcolor=#4a231c>\n%s</div>", config.name, config.desc)
    --                 buff_desc_str = buff_desc_str..buff_desc
    --             end


    --             if self.cur_tab_index==3 and config.show_type == 2 then
    --                 local buff_desc = string_format("<div fontcolor=#47832d>[%s]</div><div fontcolor=#4a231c>\n%s</div>", config.name, config.desc)
    --                 buff_desc_str = buff_desc_str..buff_desc
    --             end
    --         end
    --     end

    -- end
    -- if buff_desc_str == "" then
    --     buff_desc_str = "<div fontcolor=#4a231c>无</div>"
    -- end


    -- ---  2 显示
    -- -- 下级描述
    -- if self.skill_vo.open_desc ~= "" and not not_show_next and not hide_flag and  self.cur_tab_index==2  then
    --     if is_lock then -- 未开启
    --         buff_desc_str = self.skill_vo.open_desc
    --     elseif self.skill_vo.next_id == 0 then -- 已满级
    --         buff_desc_str = string_format(TI18N("<div fontcolor=#4a231c>技能已满级</div>"))
    --     else
    --         buff_desc_str = self.skill_vo.skill_desc
    --     end
    -- end
    
    -- if buff_desc_str ~= "" then
    --     if self.buff_desc == nil then
    --         self.buff_desc = createRichLabel(20,cc.c4b(0x4a,0x23,0x1c,0xff),cc.p(0,1),cc.p(150,10),4,nil,400)
    --         self.container:addChild(self.buff_desc)
    --     end
    --     self.buff_desc:setString(buff_desc_str)
    --     buff_desc_height = self.buff_desc:getContentSize().height
    --     total_height  = total_height + buff_desc_height + 40
    -- else
    --     if self.buff_desc ~= nil then
    --         self.buff_desc:setString('')
    --     end
    -- end

    -- print("===============================buff_desc_str==========================",buff_desc_str)

    -- total_height = total_height + 50
    -- if total_height < self.base_panel:getContentSize().height then 
    --     total_height = self.base_panel:getContentSize().height
    -- end

    -- self.container:setContentSize(cc.size(self.container_init_size.width, total_height))
    -- self.base_panel:setPositionY(total_height-10)
    -- self.skill_desc:setPositionY(total_height-80)

    -- self.line:setPositionY(total_height/2)
    -- self.line:setContentSize(cc.size(1,total_height-20))
    -- if self.buff_desc and buff_desc_str ~= "" then
    --     self.line_1:setVisible(true)
    --     self.line_1:setPositionY(total_height-80 - skill_des_height -10)
    --     self.buff_desc:setPositionY(total_height-80 - skill_des_height  - 20)
    -- else
    --     self.line_1:setVisible(false)
    -- end
    -- self:setContentSize(self.container:getContentSize())
end




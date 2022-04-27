-- --------------------------------------------------------------------
-- 突破升星成功
-- 
-- @description:
--      进阶成功
-- --------------------------------------------------------------------
HeroBreakExhibitionWindow = HeroBreakExhibitionWindow or BaseClass(BaseView)

local table_insert = table.insert
local string_format = string.format

function HeroBreakExhibitionWindow:__init(ctrl, title)
    self.ctrl = ctrl
    self.win_type = WinType.Mini
    self.layout_name = "hero/hero_exhibition_window"
    self.view_tag = ViewMgrTag.MSG_TAG
    self.is_csb_action = true
    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("hero","hero"), type = ResourcesType.plist },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hero/hl_hero_bigbg_1000", false), type = ResourcesType.single},
        { path = PathTool.getSingleImgForDownLoad("bigbg","hero/hl_hero_bigbg_1001", false), type = ResourcesType.single},
    }
    self.attr_list ={}
    self.star_list = {}
end

function HeroBreakExhibitionWindow:open_callback()
    local backpanel = self.root_wnd:getChildByName("backpanel")
    backpanel:setScale(display.getMaxScale())
    self.background = backpanel:getChildByName("background")

    self.main_container = self.root_wnd:getChildByName("main_container")
    local size = self.main_container:getContentSize()
    self.back_panel = self.main_container:getChildByName("back_panel")
    self.back_panel:setScale(display.getMaxScale())
    -- self.back_panel:setContentSize(cc.size(720, 550))
    --local curY = self.main_container:getPositionY()
    --self.main_container:setPosition()
    self.hero_info = self.back_panel:getChildByName("hero_info")

    for i=1,6 do
        self.star_list[i] = self.hero_info:getChildByName("star_"..i)
    end


    local titlepanel = self.root_wnd:getChildByName("titlepanel")

    -- self.title_container = titlepanel:getChildByName("title_container")
    -- self.title_width = self.title_container:getContentSize().width
    -- self.title_height = self.title_container:getContentSize().height

    self.left_item = HeroExhibitionItem.new(0.7, false)
    self.left_item:setPosition(cc.p(90,90))
    self.hero_info:addChild(self.left_item)
    self.advanced_node = self.back_panel:getChildByName("advanced_node")

    -- local label = createLabel(24,cc.c3b(0xf6,0xf3,0xd6),nil,size.width/2,-120,"",self.main_container,2, cc.p(0.5,0))
    -- label:setString(TI18N("点击空白处关闭界面"))
    self.closeshow = self.root_wnd:getChildByName("closeshow")
    self.closeshow:setPositionY(350)
end

function HeroBreakExhibitionWindow:register_event()
    registerButtonEventListener(self.background, handler(self, self._onClickBtnClose) ,false, 1)
end

--关闭
function HeroBreakExhibitionWindow:_onClickBtnClose()
    self.ctrl:openBreakExhibitionWindow(false, self.unlock_skill_id)
end

function HeroBreakExhibitionWindow:openRootWnd(old_data,new_data)
    if not old_data or not new_data then return end

    playOtherSound("c_get")
    self.old_data = old_data
    self.new_data = new_data

    self:handleEffect(true, open_type)

    self:updateHead()
    self:updateAttrList()
end

function HeroBreakExhibitionWindow:updateHead()
    self.left_item:setData(self.new_data)

    local max_count = self.ctrl:getModel():getHeroMaxBreakCountByInitStar(self.new_data.init_star)
    local break_count = self.new_data.break_lev

    for i=1,6 do
        if i <= break_count then
            local res = PathTool.getResFrame("hero","hl_hero_1002")
            self.star_list[i]:loadTexture(res, LOADTEXT_TYPE_PLIST)
            self.star_list[i]:setContentSize(cc.size(20,31))
            self.star_list[i]:setVisible(true)
        elseif i <= max_count then
            local res = PathTool.getResFrame("hero","hl_hero_1003")
            self.star_list[i]:loadTexture(res, LOADTEXT_TYPE_PLIST)
            self.star_list[i]:setContentSize(cc.size(14,16))
            self.star_list[i]:setVisible(true)
        else
            self.star_list[i]:setVisible(false)
        end
    end

end
--更新属性
function HeroBreakExhibitionWindow:updateAttrList()
    local old_break_lev = self.old_data.break_lev or 0
    local new_break_lev = self.new_data.break_lev or 0

    local key = getNorKey(self.old_data.type, self.old_data.break_id, old_break_lev)
    local old_break_config = Config.PartnerData.data_partner_brach[key]
    local new_key = getNorKey(self.new_data.type, self.new_data.break_id, new_break_lev)
    local new_break_config = Config.PartnerData.data_partner_brach[new_key]

    if not old_break_config or not new_break_config then return end

    local new_kill_list=new_break_config.skill_up_list
    local old_kill_list=old_break_config.skill_up_list

    --查找是否有解锁新技能
    if new_break_lev > old_break_lev and #new_kill_list > #old_kill_list then
        --说明有解锁技能
             local partner_config = Config.PartnerData.data_partner_base[self.new_data.bid]
         local skillIdx=new_kill_list[#new_kill_list][1]
         local skill_id=partner_config.skill_list[skillIdx]

--        local key = getNorKey(self.old_data.bid, self.old_data.star)
--        local star_config = Config.PartnerData.data_partner_star(key)
--        if star_config then
--            local skill_id = nil --200101
--            for i,info in ipairs(star_config.skills) do
--                if info[1] ==  new_break_config.skill_num then
--                    skill_id = info[2]
--                    break
--                end
--            end
            if skill_id ~= nil then
                self.unlock_skill_id = skill_id
            end
      --end
    end 

    local show_list = {} 
    --战斗力
    -- local res = PathTool.getResFrame("common","hl_common_28")
    -- local str = string_format(" <img src='%s' />  %s", res, self.old_data.power)
    -- local str = string_format("%s:", TI18N("战       力"), self.old_data.power)
    local str = string_format("%s:", TI18N("战力"), self.old_data.power)
    table_insert(show_list, {left_value = str, right_value = self.new_data.power})
    --等级上限
    local str1 = string_format("%s: %s", TI18N("等级上限"), old_break_config.lev_max)
    table_insert(show_list, {left_value = str1 , right_value = new_break_config.lev_max})

    --属性
    for i,v in ipairs(new_break_config.all_attr) do
        local attr_str = v[1]
        if attr_str == "hp_max" then 
            attr_str = "hp"
        end
        local attr_name = Config.AttrData.data_key_to_name[attr_str]
        local str2 = string_format("%s: %s", attr_name, self.old_data[attr_str])
        table_insert(show_list, {left_value = str2, right_value = self.new_data[attr_str]})
    end

    for i,v in ipairs(show_list) do
        if not self.attr_list[i] then 
            self.attr_list[i] = {}

            -- local res = PathTool.getResFrame("hero","hl_hero_2003")
            -- local bg = createImage(self.advanced_node, res,360,255-(i-1)*41 -10, cc.p(0.5,0.5), true, 0, true)
            local bg  = ccui.Layout:create()
            bg:setPosition(cc.p(0,255-(i-1)*41 -10))
            self.advanced_node:addChild(bg)
            -- bg:setContentSize(self.size)

            local now_label =createRichLabel(24, cc.c4b(74,35,28,0xff), cc.p(0,0.5), cc.p(130,21), 0, 0, 400)
            bg:addChild(now_label) 
            local next_label = createRichLabel(24, cc.c4b(111,175,73,0xff), cc.p(0,0.5), cc.p(480,21), 0, 0, 400)
            bg:addChild(next_label) 
            local res = PathTool.getResFrame("common","hl_common_1016")
            local arrow =  createImage(bg, res,358,22, cc.p(0.5,0.5), true, 0, false)
            self.attr_list[i].now_label = now_label
            self.attr_list[i].next_label = next_label
            self.attr_list[i].arrow = arrow
        end

        self.attr_list[i].now_label:setString(v.left_value )
        self.attr_list[i].next_label:setString(v.right_value )
    end
end



function HeroBreakExhibitionWindow:handleEffect(status, open_type)
    if status == false then
        if self.play_effect then
            self.play_effect:clearTracks()
            self.play_effect:removeFromParent()
            self.play_effect = nil
        end
    else
        local action = PlayerAction.action_5
        if open_type and open_type == 2 then 
            action = PlayerAction.action_6
        end
        action = PlayerAction.action_6
        -- if not tolua.isnull(self.title_container) and self.play_effect == nil then
        --     self.play_effect = createEffectSpine(PathTool.getEffectRes(103), cc.p(self.title_width * 0.5, self.title_height * 0.5), cc.p(0.5, 0.5), false, action)
        --     self.title_container:addChild(self.play_effect)
        -- end
    end
end 

function HeroBreakExhibitionWindow:close_callback()
    self:handleEffect(false)
    if self.left_item then
        self.left_item:DeleteMe()
        self.left_item = nil
    end
    self.ctrl:openBreakExhibitionWindow(false)
end

function HeroBreakExhibitionWindow:onExitAnim()
    EventManager:getInstance():Fire(EventId.CAN_OPEN_LEVUPGRADE, true)
    EventManager:getInstance():Fire(PokedexEvent.Call_End_Event)
end
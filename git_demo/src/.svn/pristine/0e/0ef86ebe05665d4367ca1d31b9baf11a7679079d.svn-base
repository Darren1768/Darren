-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      组队我的支援界面
-- --------------------------------------------------------------------
OrganizeTeamMeHelpPanel = class("OrganizeTeamMeHelpPanel", function()
    return ccui.Layout:create()
end)

local controller = OrganizeController:getInstance()
local model = OrganizeController:getInstance():getModel() 
local hero_model = HeroController:getInstance():getModel()

function OrganizeTeamMeHelpPanel:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("organizeteam/organizeteam_me_help_panel"))
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5 - 10, self.size.height * 0.5 - 40)
    self:addChild(self.root_wnd)

    local scroll_container = self.root_wnd:getChildByName("scroll_container")
    local desc_title = scroll_container:getChildByName("desc_title")
    desc_title:setString(TI18N("可选武灵"))
    self.desc_label = scroll_container:getChildByName("desc_label")

 


    -- self.desc_label:setString(TI18N("每日派遣支援武灵可得奖励，若武灵被使用自己将获得\n友情点"))

    local scroll_size = scroll_container:getContentSize()
    local size = cc.size(scroll_size.width - 4, scroll_size.height - 13)
    local setting = {
        item_class = OrganizeTeamFriendHelpItem2,
        start_x = 0,
        space_x = 0,
        start_y = 0,
        space_y = 0,
        item_width = 600,
        item_height = 138,
        row = 0,
        col = 1,
        need_dynamic = true
    }
    self.scroll_view = CommonScrollViewLayout.new(scroll_container, cc.p(4, 7), nil, nil, size, setting)



    self.main_container = self.root_wnd:getChildByName("my_container")
    self.no_label = self.main_container:getChildByName("no_label")
    self.item_list = {}
    local width = HeroExhibitionItem.Width * 1
    for i=1,3 do
        local item_bg = self.main_container:getChildByName("item_container_"..i)
        item_bg:setVisible(false)
        self.item_list[i] = {}
        self.item_list[i].item_btn = item_bg
        local item_node = item_bg:getChildByName("item_node")
        self.item_list[i].hero_item = HeroExhibitionItem.new(1, true, 0, true) 
        self.item_list[i].hero_item:setBgOpacity(128)
        item_node:addChild(self.item_list[i].hero_item)
        local x, y = item_node:getPosition()
        self.item_list[i].rect = cc.rect( x - width*0.5 ,y - width*0.5 , width, width)
        -- self.item_list[i].change_img = item_bg:getChildByName("lock_img")
        -- self.item_list[i].change_img:setVisible(true)

        
        self.item_list[i].career_bg= item_bg:getChildByName("career_bg")
        self.item_list[i].role_name= item_bg:getChildByName("role_name")
        self.item_list[i].career_name= item_bg:getChildByName("career_name")
        self.item_list[i].role_power= CommonNum.new(101, item_bg, 1, 0, cc.p(0, 0.5))
        self.item_list[i].role_power:setPosition(30, 36)
    end 


    
    self:registerEvent()
end

--
function OrganizeTeamMeHelpPanel:onClickHeroItem( )
    -- if self.send_role_data then 
    --     local hero_vo = HeroController:getInstance():getModel():getHeroById(self.send_role_data.id)
    --     HeroController:getInstance():openHeroTipsPanel(true, hero_vo)
    -- end
end

function OrganizeTeamMeHelpPanel:registerEvent()
    -- if self.comfirm_button then
    --     self.comfirm_button:addTouchEventListener(function(sender,event_type)
    --         if event_type == ccui.TouchEventType.ended then
    --             if self.select_vo then
    --                 if self.select_vo.info_data and self.select_vo.info_data.partner_id then
    --                     controller:send23908(self.select_vo.info_data.partner_id)
    --                     if self.select_item then
    --                         self.select_item:updateBtnStatus(false)
    --                         self.select_item = nil
    --                         self.select_vo = nil
    --                     end
    --                 end
    --             end
    --         end
    --     end)
    -- end
    if self.item_list then
        self.long_touch_type = LONG_TOUCH_INIT_TYPE
        for i,item in ipairs(self.item_list) do
            item.hero_item:addTouchEventListener(function(sender, event_type)
                --播放动作中 和 数据为空
                if self.is_play_item_action then return end
                if self.hero_pos_list and self.hero_pos_list[i] == nil then return end
                if event_type == ccui.TouchEventType.began then
                    --有长点击效果
                    self.touch_began = sender:getTouchBeganPosition()
                    doStopAllActions(self.main_container)
                    self.long_touch_type = LONG_TOUCH_BEGAN_TYPE
                    delayRun(self.main_container, 0.6, function ()
                        if self.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
                            if self.hero_pos_list[i] then
                                HeroController:getInstance():openHeroTipsPanel(true, self.hero_pos_list[i])
                            end
                        end
                        self.long_touch_type = LONG_TOUCH_END_TYPE
                    end)
                elseif event_type == ccui.TouchEventType.moved then
                    -- if self.long_touch_type == LONG_TOUCH_END_TYPE then
                    --     --事件触发了就不处理移动事件了
                    --     return 
                    -- elseif self.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
                    --     local touch_began = self.touch_began
                    --     local touch_end = sender:getTouchMovePosition()
                    --     if touch_began and touch_end and (math.abs(touch_end.x - touch_began.x) > 20 or math.abs(touch_end.y - touch_began.y) > 20) then 
                    --         --移动大于20了..表示取消长点击效果
                    --         doStopAllActions(self.main_container)
                    --         self.long_touch_type = LONG_TOUCH_CANCEL_TYPE
                    --     end 
                    -- end
                    -- self:onClickHeroItemMove(i, sender)
                elseif event_type == ccui.TouchEventType.canceled then
                    if self.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
                        doStopAllActions(self.main_container)
                        self.long_touch_type = LONG_TOUCH_CANCEL_TYPE
                    elseif self.long_touch_type == LONG_TOUCH_END_TYPE then
                        --事件触发了就不处理点击事件了
                        if self.move_hero_item then
                            self.move_hero_item:setPosition(-10000, 0)
                        end
                        self:setHeroItemData(item.hero_item, self.hero_pos_list[i])
                        return
                    end

                    self:onClickHeroItemCanceled(i, sender)
                elseif event_type == ccui.TouchEventType.ended then
                    if self.long_touch_type == LONG_TOUCH_BEGAN_TYPE then
                        doStopAllActions(self.main_container)
                        self.long_touch_type = LONG_TOUCH_CANCEL_TYPE
                    elseif self.long_touch_type == LONG_TOUCH_END_TYPE then
                        --事件触发了就不处理点击事件了
                        if self.move_hero_item then
                            self.move_hero_item:setPosition(-10000, 0)
                        end
                        self:setHeroItemData(item.hero_item, self.hero_pos_list[i])
                        return
                    end

                    self.select_cancel_index = i
                    print("---------------点击了-------------") 
                    controller:sender29705(self.send_data.list[i].pid)

                    -- self:onClickHeroItemEnd(i, sender)
                end
            end)
        end
    end


     EventManager:getInstance():Bind(OrganizeEvent.UPDATA_SENDPARTNER_DATA,self,function(data)
            self:updateListData(data)
        end)
     EventManager:getInstance():Bind(OrganizeEvent.UPDATA_SENDPARTNER_SUCESS_DATA,self,function(data)
            if data.code == 1 then
                if self.select_item then
                    self.select_item:updateBtnStatus(false)
                    self.select_item = nil
                    self.select_vo = nil
                end
            end
        end)
        EventManager:getInstance():Bind(OrganizeEvent.UPDATA_ZHIYUAN_DOWN_SUCESS_DATA,self,function()
            -- self:onClickHeroItemEnd(self.select_cancel_index)
        end)

    
end


function OrganizeTeamMeHelpPanel:updateListData(data)
    if data then
        self.send_data = data
        if self.send_data.list and next(self.send_data.list or {}) == nil then
            for i,v in ipairs(self.item_list) do
                    self:updateItemByindex(i)
            end
            self.no_label:setVisible(true)
        else
            self.no_label:setVisible(false)

                --选中武灵信息 [pid] = hero_vo
                self.dic_hero_data = {}
                --位置上的武灵信息 [pos] = hero_vo
                self.hero_pos_list = {}
              
                for i,v in ipairs(self.send_data.list) do
                    -- local hero_data = hero_model:getHeroById(v.pid)
                    self.hero_pos_list[i] = self.send_data.list[i]
                    self.dic_hero_data[v.pid] = self.send_data.list[i]
                end
                
                if self.item_list then
                    for i,v in ipairs(self.item_list) do
                        if self.hero_pos_list[i] then
                            self:updateItemByindex(i, self.hero_pos_list[i])
                        else
                            self:updateItemByindex(i)
                        end
                    end
                end
        end



        local index = 1
        local list = {}

        local model = HeroController:getInstance():getModel()
        local data = model:getAllHeroArray()
        local dic_resonate_five_hero_vo =  model:getDicResonateFiveHeroVo() or {}
        local cystal_pre_lev_limit = model:getCystalPreLevLimit()

        data:UpperSortByParams("power", "quality", "star", "lev", "sort_order")
        for i = 1, data:GetSize() do
            local info = data:Get(i - 1)
            if (self.send_data.list[1] and self.send_data.list[1].pid and self.send_data.list[1].pid == info.id)
             or (self.send_data.list[2] and self.send_data.list[2].pid and self.send_data.list[2].pid == info.id) 
             or (self.send_data.list[3] and self.send_data.list[3].pid and self.send_data.list[3].pid == info.id) then
                -- list[index] = {info_data = info, type = OrganizeEvent.helptype.me,team_select= true}
                -- index = index + 1   
            else
                if info.isResonateCrystalHero and info:isResonateCrystalHero() then
                    --原力水晶上的武灵有限制
                    if dic_resonate_five_hero_vo[info.id] then
                        list[index] = {info_data = info, type = OrganizeEvent.helptype.me,team_select= false}
                        index = index + 1  
                    end 
                else
                    list[index] = {info_data = info, type = OrganizeEvent.helptype.me,team_select= false}
                    index = index + 1    
                end
            end
          
        end
        local function callback(item, vo, index)
            if vo and next(vo) ~= nil then
                self:clickFun(item,vo,index)
            end
        end
        self.scroll_view:setData(list, callback)
    end


    local role_vo = RoleController:getInstance():getRoleVo()
    local _config = model:getHelpShow(role_vo.lev)
    if _config then 
        self.desc_label:setString(string.format("%s级将开放支援%s个武灵",_config.lev ,_config.num ))
    else
        _config = Config.RelationData.data_appoint_num[Config.RelationData.data_appoint_num_length]
        self.desc_label:setString(string.format("最多可支援%s个武灵",_config.num ))
    end 



end


--点击5个武灵Item end
function OrganizeTeamMeHelpPanel:onClickHeroItemEnd(index, sender)
--    local hero_vo = self.hero_pos_list[index]

--     self.dic_hero_data[hero_vo.pid] = nil
--     self.hero_pos_list[index] = nil
 
    self:updateItemByindex(index, nil)


 
end


--点击5个武灵Item Cancel
function OrganizeTeamMeHelpPanel:onClickHeroItemCanceled(index, sender)
    if not self.hero_pos_list then return end
    self.is_move_hero = false
    if self.move_hero_item then
        --相当于隐藏
        self.move_hero_item:setPosition(-10000, 0)
    end
    
    local touch_pos = sender:getTouchMovePosition()
    for i,item in ipairs(self.item_list) do
        local target_pos = item.item_btn:convertToNodeSpace(touch_pos) 
        if cc.rectContainsPoint( item.rect, target_pos ) then
            if i ~= index then
                --转换
                local temp_hero_vo = self.hero_pos_list[i]
                self.hero_pos_list[i] = self.hero_pos_list[index]

                self:setHeroItemData(item.hero_item, self.hero_pos_list[i])
                self:setHeroItemData(self.item_list[index].hero_item, temp_hero_vo)

                if temp_hero_vo ~= nil then
                    self.hero_pos_list[index] = temp_hero_vo
                else
                    -- self.dic_hero_data[self.hero_pos_list[index].id] = nil
                    self.hero_pos_list[index] = nil
                end
                return
            else
                --点自己是下阵了 
                --这里系统直接执行 self:onClickHeroItemEnd()方法了
            end
        end
    end
    --上面没有遇到说不用交换 直接放回去
    self:setHeroItemData(self.item_list[index].hero_item, self.hero_pos_list[index])
end


--点击5个武灵Item move
function OrganizeTeamMeHelpPanel:onClickHeroItemMove(index, sender)
    if not self.hero_pos_list then return end
    --判断是否有移动
    self.is_move_hero = true

    if self.move_hero_item == nil then
        self.move_hero_item = HeroExhibitionItem.new(0.8, false)
        self.main_container:addChild(self.move_hero_item, 1)
    end
    self.move_hero_item:setData(self.hero_pos_list[index])
    self:setHeroItemData(self.item_list[index].hero_item, nil)

    local touch_pos = sender:getTouchMovePosition()
    -- print("---------------touch_pos------------",touch_pos.x)
    local target_pos = self.main_container:convertToNodeSpace(touch_pos) 
    self.move_hero_item:setPosition(target_pos)
end


function OrganizeTeamMeHelpPanel:updateItemByindex(index, data)
    print("--------------item_list-------------------",index)

    if self.item_list[index] then
        if data then
            -- self.item_list[index].hero_item:setData(data)
            -- self.item_list[index].hero_item:setBgOpacity(255)
            -- self.item_list[index].hero_item:showAddIcon(false)
            -- self.item_list[index].hero_item:setVisible(true)
            local send_role_data = data
            local _item =  self.item_list[index]
            if send_role_data then
                _item.item_btn:setVisible(true)
                _item.hero_item:setData(send_role_data,true)
                _item.hero_item:setSupportSelected(true)
                _item.role_power:setNum(send_role_data.power)
                local partner_config = Config.PartnerData.data_partner_base[send_role_data.bid]
                if partner_config then
                    local res = PathTool.getCareerIcon(partner_config.type)
                    loadSpriteTexture(self.career_bg, res, LOADTEXT_TYPE_PLIST)
                    local str = PartnerConst.Hero_Type[partner_config.type] or ""
                    -- _item.role_name:setString(partner_config.name)
                    _item.role_name:setString(StringUtil.branchStr(partner_config.name))
                    _item.role_name:setPosition(cc.p(130,110))
                    _item.role_name:setAnchorPoint(0.25,0.75)
                    -- 类型 2-5
                    local _type_list_data ={
                    [2]={name ="法" ,res = "hl_common_262"},
                    [3]={name ="战" ,res = "hl_common_258"}, --红 
                    [4]={name ="坦" ,res = "hl_common_261"},
                    [5]={name ="辅" ,res = "hl_common_260"}}
                    local _type_data  = _type_list_data[ partner_config.type]  
                    local type_res = PathTool.getResFrame("common",  _type_data.res)
                    loadSpriteTexture( _item.career_bg, type_res)
                    _item.career_name:setString(_type_data.name )
 
                    -- _item.career_bg:setVisible(true )
                    -- _item.role_power:setVisible(true )
                    -- _item.career_name:setVisible(true)
                    -- _item.role_name:setVisible(true)
                end
            end
        
        else
            -- self.item_list[index].hero_item:setData(nil)
            -- self.item_list[index].hero_item:setBgOpacity(0)
            -- self.item_list[index].hero_item:setVisible(false)
            -- self.item_list[index].hero_item:showAddIcon(false, self.add_res)
            -- -- self.item_list[index].hero_item:showAddIcon(false)
            -- self.item_list[index].change_img:setVisible(true)
            local send_role_data = data
            local _item =  self.item_list[index]
            _item.item_btn:setVisible(false)
            -- _item.hero_item:setVisible(false)
            -- _item.role_power:setVisible(false)
            -- _item.career_name:setVisible(false)
            -- _item.role_name:setVisible(false)
            -- _item.career_bg:setVisible(false )

           
        end
    end
end

function OrganizeTeamMeHelpPanel:setHeroItemData(hero_item, data)
    -- if data then
    --     hero_item:setData(data)
    --     hero_item:showAddIcon(false)
    --     hero_item:setBgOpacity(255)
    --     hero_item:setVisible(true)

    -- else

    --     hero_item:setData(nil)
    --     hero_item:showAddIcon(false, self.add_res)
    --     hero_item:setBgOpacity(0)
    --     hero_item:setVisible(false)
    -- end
end


--显示移动效果
--@start_pos 开始位置 
--@end_pos 结束位置
function OrganizeTeamMeHelpPanel:showMoveEffect(start_pos, end_pos, hero_vo, callback)
    self.is_play_item_action = true
    if self.move_hero_item == nil then
        self.move_hero_item = HeroExhibitionItem.new(0.8, false)
        self.main_container:addChild(self.move_hero_item, 1)
    end
    self.move_hero_item:setData(hero_vo)
    self.move_hero_item:setPosition(start_pos)
    local action1 = cc.MoveTo:create(0.2, end_pos)
    local callfunc = cc.CallFunc:create(function()
        if self.move_hero_item then
            self.move_hero_item:setPosition(-10000, 0)
        end
        self.is_play_item_action = false
        if callback then
            callback()
        end
    end)
    self.move_hero_item:runAction(cc.Sequence:create(action1,callfunc))
end
function OrganizeTeamMeHelpPanel:setNodeVisible(status)
	self:setVisible(status)
end 

function OrganizeTeamMeHelpPanel:addToParent()
    controller:sender29701()
end

function OrganizeTeamMeHelpPanel:clickFun(item,vo,index)
    if self.select_item and self.select_item.index == index then
        self.select_item:updateBtnStatus(false)
        self.select_item = nil
        self.select_vo = nil
        return
    end

    if vo and vo.info_data and vo.info_data.checkResonateHero and vo.info_data:checkResonateHero() then
        return
    end

    if vo and vo.info_data and vo.info_data.isResonateCrystalHero and vo.info_data:isResonateCrystalHero() then
        local cystal_pre_lev_limit = 340
        local config = Config.ResonateData.data_const.cystal_pre_lev_limit
        if config then
            cystal_pre_lev_limit = config.val
        end
        --策划要求如果是共鸣武灵 但是等级超过 340 又能上阵的了
        if vo.info_data.lev < cystal_pre_lev_limit then
             message(TI18N("该武灵在原力水晶槽位中已上阵"))
            return    
        end
    end

    if self.select_item then
        self.select_item:updateBtnStatus(false)
    end
    self.select_item = item
    self.select_vo = vo
    self.select_item:updateBtnStatus(true)
    if self.select_vo.info_data and self.select_vo.info_data.partner_id then     
        controller:sender29703(self.select_vo.info_data.partner_id)
    end
end

function OrganizeTeamMeHelpPanel:DeleteMe()
    EventManager:getInstance():UnBind(self)
    if self.scroll_view then
        self.scroll_view:DeleteMe()
        self.scroll_view = nil
    end
end



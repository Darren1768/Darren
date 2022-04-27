-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      好友支援单项列表
-- --------------------------------------------------------------------
OrganizeTeamFriendHelpItem =
    class(
    "OrganizeTeamFriendHelpItem",
    function()
        return ccui.Layout:create()
    end
)

function OrganizeTeamFriendHelpItem:ctor()
    self.item_list = {}
    self.is_init = false
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("organizeteam/organizeteam_friend_help_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)
    local container = self.root_wnd:getChildByName("container")
    self.career_name = container:getChildByName("career_name")
    self.career_icon = container:getChildByName("career_icon")
    self.return_icon = container:getChildByName("return_icon")
    self.return_icon:setVisible(false)
    self.power_panel = container:getChildByName("power_panel")

    self.role_power = CommonNum.new(101, self.power_panel, 1, 1, cc.p(0, 0.5))
    self.role_power:setPosition(32, 24)
    self.bg = self.root_wnd:getChildByName("Image_1")



    self.role_name = container:getChildByName("role_name")
    -- self.help_button = container:getChildByName("help_button")
    -- self.help_label = self.help_button:getChildByName("help_label")
    -- self.help_label:setString(TI18N("选择"))
    self.firend_label = container:getChildByName("firend_label")
    self.firend_label:setVisible(false)
    self.lock_panel = container:getChildByName("lock_panel")
    local limit_label = self.lock_panel:getChildByName("limit_label")
    limit_label:setString(TI18N("战力超出范围"))
    self.lock_panel:setVisible(false)
    
    self.hero_icon = HeroExhibitionItem.new(1)
    self.hero_icon:setPosition(75,68)
    self.hero_icon:addCallBack(handler(self, self.onClickHeroItem))
    container:addChild(self.hero_icon)



    self:registerEvent()
end

function OrganizeTeamFriendHelpItem:onClickHeroItem( )
    if self.data then 
        local role_vo = RoleController:getInstance():getRoleVo()
        if role_vo and role_vo.rid == self.data.rid and role_vo.srv_id == self.data.srv_id then
            --自己
            local hero_vo = HeroController:getInstance():getModel():getHeroById(self.data.id)
            HeroController:getInstance():openHeroTipsPanel(true, hero_vo)
        else
            LookController:getInstance():sender11061(self.data.rid, self.data.srv_id, self.data.id)
        end
    end
end

function OrganizeTeamFriendHelpItem:registerEvent()
    -- if self.help_button then
    --     self.help_button:addTouchEventListener(function (sender,eventType)
    --         if eventType == ccui.TouchEventType.ended then
    --             if self.click_fun and self.data then
    --                 if self.data.select == true then
    --                     self.click_fun(self, self.data, self.index, false)
    --                 else
    --                     self.click_fun(self, self.data, self.index, true)
    --                 end
    --             end
    --         end
    --     end)
    -- end
end

function OrganizeTeamFriendHelpItem:setData(data)
    self.data = data 
    
    if self.data then
        self.type = self.data.type
        self.info_data = self.data.info_data
        self.index = self.data._index
        self.hero_icon:setData(self.data,true)

        self.bg:setOpacity(0)
        if self.index%2 == 1 then 
            self.bg:setOpacity(100)
        end 

        self.firend_label:setString(TI18N("来自队友：")..self.data.rname)
        self.role_power:setNum(self.data.power)

        self.firend_label:setVisible(true)
        -- self.power_panel:setPosition(181,43)
        local config = Config.PartnerData.data_partner_base[self.data.bid]
        if config then
            self.role_name:setString(config.name)
        end
        if self.data.is_lock == true then
            self.lock_panel:setVisible(true)
        else
            self.lock_panel:setVisible(false)
        end

        if self.data.is_return == 1 then
            self.return_icon:setVisible(true)
        else
            self.return_icon:setVisible(false)
        end
       
        --[[if self.data.select == true and not self.is_init then
            self.click_fun(self, self.data, self.index,true,true)
            self.is_init = true
        end--]]
        self:updateBtnStatus(self.data.select)
        -- local res = PathTool.getCareerIcon(self.info_data.type)
        -- loadSpriteTexture(self.career_icon, res, LOADTEXT_TYPE_PLIST)
        -- local str = PartnerConst.Hero_Type[self.info_data.type] or ""
        -- self.career_name:setString("["..str.."]")


        
        -- 类型 2-5
        local _type_list_data ={
        [2]={name ="法" ,res = "hl_common_262"},
        [3]={name ="战" ,res = "hl_common_258"}, --红 
        [4]={name ="坦" ,res = "hl_common_261"},
        [5]={name ="辅" ,res = "hl_common_260"}}
        local _type_data  = _type_list_data[ self.info_data.type]  
        local type_res = PathTool.getResFrame("common",  _type_data.res)
        loadSpriteTexture( self.career_icon, type_res)
        self.career_name:setString(_type_data.name )
    end
end

function OrganizeTeamFriendHelpItem:getData(  )
    return self.data
end

function OrganizeTeamFriendHelpItem:addCallBack(click_fun)
    self.click_fun = click_fun
end

function OrganizeTeamFriendHelpItem:updateBtnStatus(status)
    -- if status == true then
    --     self.help_button:loadTextures(
    --             PathTool.getResFrame('common', 'hl_common_4.1'),
    --             PathTool.getResFrame('common', 'hl_common_4.1'),
    --             PathTool.getResFrame('common', 'hl_common_4.1'),
    --             LOADTEXT_TYPE_PLIST
    --         )
    --     self.help_label:setString(TI18N("取消选择"))
    -- else
    --     self.help_button:loadTextures(
    --         PathTool.getResFrame("common", "hl_common_4"),
    --         PathTool.getResFrame("common", "hl_common_4"),
    --         PathTool.getResFrame("common", "hl_common_4"),
    --         LOADTEXT_TYPE_PLIST
    --     )

    --     self.help_label:setString(TI18N("选择"))

    -- end
end

function OrganizeTeamFriendHelpItem:DeleteMe()
    self:removeAllChildren()
    self:removeFromParent()
end

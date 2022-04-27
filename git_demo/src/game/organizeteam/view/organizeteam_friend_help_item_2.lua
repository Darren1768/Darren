-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      好友支援单项列表
-- --------------------------------------------------------------------
OrganizeTeamFriendHelpItem2 =
    class(
    "OrganizeTeamFriendHelpItem2",
    function()
        return ccui.Layout:create()
    end
)

function OrganizeTeamFriendHelpItem2:ctor()
    self.item_list = {}
    self.is_init = false
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("organizeteam/organizeteam_friend_help_item_2"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)
    local container = self.root_wnd:getChildByName("container")
    self.career_name = container:getChildByName("career_name")
    self.career_icon = container:getChildByName("career_icon")

    self.power_panel = container:getChildByName("power_panel")

    self.role_power = CommonNum.new(101, self.power_panel, 1, 0, cc.p(0, 0.5))
    self.role_power:setPosition(30, 24)


    self.role_name = container:getChildByName("role_name")
    self.help_button = container:getChildByName("help_button")
    self.help_label = self.help_button:getChildByName("help_label")
    self.help_label:setString(TI18N("选择"))

    self.bg = self.root_wnd:getChildByName("Image_1")

    self.hero_icon = HeroExhibitionItem.new(1)
    self.hero_icon:setPosition(75,68)
    self.hero_icon:addCallBack(handler(self, self.onClickHeroItem))
    container:addChild(self.hero_icon)

    self:registerEvent()
end

function OrganizeTeamFriendHelpItem2:onClickHeroItem( )
    if self.data and self.data.info_data then 
        HeroController:getInstance():openHeroTipsPanel(true, self.data.info_data)
    end
end

function OrganizeTeamFriendHelpItem2:registerEvent()

    if self.help_button then
        self.help_button:addTouchEventListener(function (sender,eventType)
            if eventType == ccui.TouchEventType.ended then
                if self.click_fun then
                    if self.select_status == true then
                        self.click_fun(self, self.data, self.index, false)
                    else
                        self.click_fun(self, self.data, self.index, true)
                    end
                end
            end
        end)
    end
end

function OrganizeTeamFriendHelpItem2:setData(data)
    self.data = data 

    if self.data then
        self.type = self.data.type
        self.info_data = self.data.info_data
        self.index = self.data._index
        self.role_name:setString(self.info_data.name)
        self.role_power:setNum(self.info_data.power)

        self.hero_icon:setData(self.info_data,true)

     
        self.bg:setOpacity(0)
        if self.index%2 == 1 then 
            self.bg:setOpacity(100)
        end 



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


        if self.data.team_select then 
            setChildUnEnabled(true, self.help_button)
            self.help_label:setString("已支援")
            self.help_button:setTouchEnabled(false)
        else 
            setChildUnEnabled(false, self.help_button)
            self.help_label:setString("选择")
            self.help_button:setTouchEnabled(true)
        end 
    end
end

function OrganizeTeamFriendHelpItem2:getData()
    return self.data 
end



function OrganizeTeamFriendHelpItem2:addCallBack(click_fun)
    self.click_fun = click_fun
end

function OrganizeTeamFriendHelpItem2:updateBtnStatus(status)
    self.select_status = status
    if status == true then
        -- self.help_label:setString(TI18N("取消选择"))
    else
        -- self.help_label:setString(TI18N("选择"))
    end
end

function OrganizeTeamFriendHelpItem2:DeleteMe()
    self:removeAllChildren()
    self:removeFromParent()
end

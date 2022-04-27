
-- --------------------------------------------------------------------
-- @description:
--      选择英雄界面
-- <br/> 2018年11月20日
-- --------------------------------------------------------------------
HeroUpgradeStarSkillEffectPanel = HeroUpgradeStarSkillEffectPanel or BaseClass(BaseView)

local controller = HeroController:getInstance()
local model = controller:getModel()
local string_format = string.format
local table_insert = table.insert
local table_remove = table.remove

function HeroUpgradeStarSkillEffectPanel:__init()
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Mini   
    
    self.layout_name = "hero/hero_upgrade_star_skill_effect_panel"

    self.res_list = {
        -- { path = PathTool.getSingleImgForDownLoad("bigbg","bigbg_3"), type = ResourcesType.single }
    }

end

function HeroUpgradeStarSkillEffectPanel:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    if self.background ~= nil then
        self.background:setScale(display.getMaxScale())
    end

    self.main_container = self.root_wnd:getChildByName("main_container")
    self:playEnterAnimatianByObj(self.main_container , 2) 
    self.title = self.main_container:getChildByName("win_title")

    self.closebtn =  self.main_container:getChildByName("close")

    local scroll_container = self.main_container:getChildByName("lay_scrollview")
    local scorll_size = scroll_container:getContentSize()
    local size = cc.size(scorll_size.width , scorll_size.height )
    local setting = {
        item_class = HeroUpgradeStarSkillEffectItem,
        start_x = 0,
        space_x = 0,
        start_y = 0,
        space_y = 0,
        item_width = 600,
        item_height = 200,
        row = 0,
        col = 1,
        need_dynamic = true
    }
    self.scroll_view = CommonScrollViewLayout.new(scroll_container, cc.p(0,0), nil, nil, size, setting)
  
end

function HeroUpgradeStarSkillEffectPanel:register_event()
    registerButtonEventListener(self.background, handler(self, self.onClickBtnClose) ,false, 1)
    registerButtonEventListener(self.closebtn, handler(self, self.onClickBtnClose) ,false, 1)

   
end

--关闭
function HeroUpgradeStarSkillEffectPanel:onClickBtnClose()
    controller:openHeroUpgradeStarSkillEffectPanel(false)
end


function HeroUpgradeStarSkillEffectPanel:openRootWnd(select_data)
    self:updateListData(select_data)
end


function HeroUpgradeStarSkillEffectPanel:updateListData(data)
    if data then

        local hero_vo  = data 
     local partner_config = Config.PartnerData.data_partner_base[hero_vo.bid]

    if partner_config.star_skill then
        local index =1 
        local list = {}
        local num = hero_vo.star_skill_lev 
        if  hero_vo.star_skill_lev < 0 then 
            num=1 
        end



        for i=num,8 do 
           local config = Config.SkillData.data_get_skill(partner_config.star_skill + i -1)
           if config then 
              local obj ={}
              obj.config = config
              obj.is_active = false
              obj.index = i 
              if hero_vo.star_skill_lev >0 then 
                if i <= hero_vo.star_skill_lev    then 
                    obj.is_active = true
                end 
              end 
              index = index +1 
              table.insert(list,obj)
           end 
        
        end 

        self.scroll_view:setData(list)
     
    end

   
    
    end
end

function HeroUpgradeStarSkillEffectPanel:close_callback()
    controller:openHeroUpgradeStarSkillEffectPanel(false)
end


-- --------------------------------------------------------------------
-- @description:
--     使用的单元
--
-- --------------------------------------------------------------------
HeroUpgradeStarSkillEffectItem   = class("OrganizeTeamMyTeamItem", function()
    return ccui.Layout:create()
end)

function HeroUpgradeStarSkillEffectItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("hero/hero_upgrade_star_skill_effect_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.title =  self.root_wnd:getChildByName("title")
  
    self.skill_item = SkillItem.new(true, true, true, 0.9, false,nil,true)
    self.skill_item:setPosition(cc.p(56,self.size.height/2))
    self.root_wnd:addChild(self.skill_item)


    self.desc = createRichLabel(22, cc.c4b(74,35,28,0xff), cc.p(0, 1), cc.p(self.title:getPositionX(),self.title:getPositionY()-20), 5, nil, 460)
    self.root_wnd:addChild(self.desc)

    self:registerEvent()
end

function HeroUpgradeStarSkillEffectItem:registerEvent()
   

end

function HeroUpgradeStarSkillEffectItem:setData(data)
    self.data = data

    self.title:setString(string.format("%d阶效果",data.index-1))

    self.skill_item:setData(data.config)

  
    local str = ""
    if self.data.is_active then 
        self.title:setTextColor(cc.c3b(74,35,28))
        str = string.format(TI18N("<div fontcolor=#4A231C>%s</div>)"), data.config.des)

        setChildUnEnabled(false,self.skill_item)
    else
        str = string.format(TI18N("<div fontcolor=#676666>%s</div>)"), data.config.des)

        self.title:setTextColor(cc.c3b(103,102,102))
        setChildUnEnabled(true,self.skill_item)
    end 
    self.desc:setString(str)
end

function HeroUpgradeStarSkillEffectItem:DeleteMe()
   
    if self.data ~= nil then
      
        self.data = nil
    end
    self:removeAllChildren()
    self:removeFromParent()
end

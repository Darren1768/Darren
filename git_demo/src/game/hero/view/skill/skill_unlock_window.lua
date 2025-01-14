-- --------------------------------------------------------------------
-- @description:
--      技能解锁
-- <br/> 2018年11月20日
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
SkillUnlockWindow = SkillUnlockWindow or BaseClass(BaseView)


local controller = HeroController:getInstance()

function SkillUnlockWindow:__init(skill_bid, setting)
    
    self.layout_name = "hero/skill_unlock"
    self.res_list = {
       
    }
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Mini   
    self.skill_bid = skill_bid or 0

    self.setting = setting or {}
    --显示类型  1 表示原本技能 的  2 表示 天赋栏开锁
    self.show_type = self.setting.show_type or 1
    self.is_can_close = false
end

function SkillUnlockWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale())
    self.background:setVisible(true)

    self.main_panel = self.root_wnd:getChildByName("main_container")
    self.main_panel:setTouchEnabled(false)


    self.title_panel = self.main_panel:getChildByName("title_panel")
    self.title = self.title_panel:getChildByName("title")
    self:createDesc()

    self:updateDesc()
end

function SkillUnlockWindow:register_event()
    self.background:addTouchEventListener(function(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            playQuitSound()
            if self.is_can_close == true then
                controller:openSkillUnlockWindow(false)
            end
        end
    end)
end

function SkillUnlockWindow:createDesc()
    local size = self.main_panel:getContentSize()
    self.head_icon = SkillItem.new(true,nil,nil,nil,nil,nil,true)
    self.head_icon:setPosition(cc.p(size.width/2,575))
    self.head_icon:setAnchorPoint(cc.p(0.5,0.5))
    self.main_panel:addChild(self.head_icon)

    self.star_name = createLabel(24,cc.c4b(239,212,174,0xff),cc.c4b(75,37,33,255),size.width/2,480,"",self.main_panel,2,cc.p(0.5,0),TITLE_FONT)

    self.star_desc =   createRichLabel(22,cc.c4b(239,212,174,0xff),cc.p(0.5,1),cc.p(size.width/2,450),nil,nil,570)
    self.main_panel:addChild(self.star_desc)
end

function SkillUnlockWindow:updateDesc()
    delayOnce(function ()
        self.is_can_close = true
    end,1)
    if self.show_type == 1 then
        if self.skill_bid == 0 then return end
        local bg_res = PathTool.getResFrame("common2","hl_common_0109")
        loadSpriteTexture(self.title, bg_res, LOADTEXT_TYPE_PLIST)

        local config = Config.SkillData.data_get_skill(self.skill_bid)
        if not config then return end
        local desc = config.des or ""
        local str = string.format( "<div outline=1,#4B2521>%s</div>",desc)
        -- self.star_desc:enableOutline(cc.c4b(49,14,8,156), 1)

        self.star_desc:setString(str)



        local name = config.name or ""
        self.star_name:setString(name)
       
        self.head_icon:setData(config)

    elseif self.show_type == 2 then
        self.star_name:setString(TI18N("觉醒天赋栏"))
        self.star_desc:setString(TI18N("<div outline=2,#000000>已解锁13星专属天赋栏，可学习13星专属职业天赋</div>"))

        if self.head_icon and self.head_icon.item_icon then
            local skill_icon = PathTool.checkRes("resource/bigbg/hero/talent_pos.png")
            self.head_icon.item_icon:setVisible(true)
            loadSpriteTexture(self.head_icon.item_icon, skill_icon, LOADTEXT_TYPE)
        end

        local bg_res = PathTool.getSingleImgForDownLoad("bigbg/hero","hero_unlock_talent_bg")
        self.title_bg_load = loadSpriteTextureFromCDN(self.title, bg_res, ResourcesType.single, self.title_bg_load)
    end
   
end

function SkillUnlockWindow:openRootWnd()
    playOtherSound("c_get")
    self:handleEffect(true) 
end

--[[
    @desc: 设置标签页面板数据内容
    author:{author}
    time:2018-05-03 21:57:09
    return
]]
function SkillUnlockWindow:setPanelData()
end

function SkillUnlockWindow:handleEffect(status)
    if status == false then
        if self.play_effect then
            self.play_effect:clearTracks()
            self.play_effect:removeFromParent()
            self.play_effect = nil
        end
    else
        local size = self.main_panel:getContentSize() 
        if not tolua.isnull(self.main_panel) and self.play_effect == nil then
            self.play_effect = createEffectSpine(PathTool.getEffectRes(145), cc.p(size.width*0.5, size.height*0.5+40), cc.p(0.5, 0.5), true, PlayerAction.action)
            self.main_panel:addChild(self.play_effect, -1)
        end
    end
end 

function SkillUnlockWindow:close_callback()
    self:handleEffect(false)
    if self.bottom_head then 
        self.bottom_head:DeleteMe()
        self.bottom_head = nil
    end
    if self.head_icon then 
        self.head_icon:DeleteMe()
        self.head_icon = nil
    end

    if self.title_bg_load then
        self.title_bg_load:DeleteMe()
        self.title_bg_load = nil
    end
    --可能会有礼包触发
    EventManager:getInstance():Fire(BattleEvent.NEXT_SHOW_RESULT_VIEW)

    controller:openSkillUnlockWindow(false)
end








-- --------------------------------------------------------------------
-- @description:
--      弹劾面板
--
-- --------------------------------------------------------------------
UnionImpeachPostWindow = UnionImpeachPostWindow or BaseClass(BaseView)

local controller = UnionController:getInstance()

function UnionImpeachPostWindow:__init()
	self.view_tag = ViewMgrTag.DIALOGUE_TAG
	
	self.win_type = WinType.Mini
	self.set_index = 1
	self.condition_index = 1
	self.layout_name = "union/union_impeach_post_window"
end 

function UnionImpeachPostWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale()) 
    
    local container = self.root_wnd:getChildByName("container")
    
    self:playEnterAnimatianByObj(container, 2)
    container:getChildByName("title_con"):getChildByName("title_label"):setString(TI18N("管理设置"))
    self._notice = container:getChildByName("notice")
    self.close_btn = container:getChildByName("close_btn")

    self._btnImpeach = container:getChildByName("impeach_btn")              -- 弹劾帮主
    self._btnImpeach:getChildByName("label"):setString(TI18N("弹劾"))
    self._spriteDiamond = self._btnImpeach:getChildByName("spriteDiamond")
    self._textDiamond = self._btnImpeach:getChildByName("textDiamond")
    self._textDiamond:setString(50)
end

function UnionImpeachPostWindow:register_event()
    self.close_btn:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playQuitSound()
            controller:openUnionImpeachPostWindow(false)
        end
    end)
    registerButtonEventListener(self.background, function()
        controller:openUnionImpeachPostWindow(false)
    end ,false, 2)
    
    self._btnImpeach:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            controller:send29265()
            controller:openUnionImpeachPostWindow(false)
        end
    end)
end

function UnionImpeachPostWindow:openRootWnd()
    if self._notice then
        self._notice:setString(TI18N("该盟主决心归隐田园，现急需有志之士担当联盟重任。弹劾盟主后，您将成为新的盟主。"))
    end
    -- local res = string.format("resource/item/%d.png", Config.UnionData.data_const.impeach_gold.val[1][1])
    -- local sprite = createSprite(res, 28, 33, self._btnImpeach,cc.p(0.5,0.5),LOADTEXT_TYPE)
    -- sprite:setScale(0.30)

    -- self._textDiamond:setString(Config.UnionData.data_const.impeach_gold.val[1][2])
end

function UnionImpeachPostWindow:close_callback()
    controller:openUnionImpeachPostWindow(false)
end
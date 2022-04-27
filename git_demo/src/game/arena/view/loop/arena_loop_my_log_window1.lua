--[[
    记录 主界面
]]
-- ArenaLoopMyLogWindow1 = ArenaLoopMyLogWindow1 or BaseClass(BaseView)
ArenaLoopMyLogWindow1 = class("ArenaLoopMyLogWindow1",function()
    return ccui.Layout:create()
end)

local controller = ArenaController:getInstance()
local string_format = string.format
local role_vo = RoleController:getInstance():getRoleVo()


-- function ArenaLoopMyLogWindow1:__init()
--     self.view_tag = ViewMgrTag.DIALOGUE_TAG
-- 	self.win_type = WinType.Big
	
-- 	self.layout_name = "arena/new_arena_loop_my_log_window"

-- end

-- function ArenaLoopMyLogWindow1:open_callback()
-- 	self.background = self.root_wnd:getChildByName("background")
-- 	self.background:setScale(display.getMaxScale())
	
-- 	local main_container = self.root_wnd:getChildByName("main_container")
--     self:playEnterAnimatianByObj(main_container, 2)

-- 	local main_panel = main_container:getChildByName("main_panel")
-- 	self.good_cons = main_panel:getChildByName("good_cons")
-- 	main_panel:getChildByName("win_title"):setString("")

-- end

-- function ArenaLoopMyLogWindow1:register_event()
-- 	self.background:addTouchEventListener(function(sender, event_type)
-- 		if event_type == ccui.TouchEventType.ended then
-- 			playQuitSound()
-- 			controller:openArenaLoopMyLogWindow(false)
-- 		end
-- 	end)

--      EventManager:getInstance():Bind(ArenaEvent.UpdateMylogListEvent,self, function(list)
-- 			self:updateMyGuessList(list)
-- 		end)
-- end

-- function ArenaLoopMyLogWindow1:openRootWnd()
-- 	controller:requestMyLoopLogInfo()
-- end

-- function ArenaLoopMyLogWindow1:close_callback()
--     EventManager:getInstance():UnBind(self)
-- 	if self.scroll_view then
-- 		self.scroll_view:DeleteMe()
-- 		self.scroll_view = nil
-- 	end
-- 	controller:openArenaLoopMyLogWindow(false)
-- end




function ArenaLoopMyLogWindow1:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("arena/new_arena_loop_my_log_window"))

    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    
    self.background = self.root_wnd:getChildByName("background")
	self.background:setScale(display.getMaxScale())
	
	local main_container = self.root_wnd:getChildByName("main_container")
    -- self:playEnterAnimatianByObj(main_container, 2)

	local main_panel = main_container:getChildByName("main_panel")
	self.good_cons = main_panel:getChildByName("good_cons")
	main_panel:getChildByName("win_title"):setString("")


    self:registerEvent()
end

function ArenaLoopMyLogWindow1:registerEvent()
	self.background:addTouchEventListener(function(sender, event_type)
		if event_type == ccui.TouchEventType.ended then
			playQuitSound()
			-- controller:openArenaLoopMyLogWindow(false)
            EventManager:getInstance():Fire(ArenaEvent.UpdateLoopTabStatus)
		end
	end)

     EventManager:getInstance():Bind(ArenaEvent.UpdateMylogListEvent,self, function(list)
			self:updateMyGuessList(list)
		end)
end

function ArenaLoopMyLogWindow1:setNodeVisible(enable)
    self:setVisible(enable)
end

function ArenaLoopMyLogWindow1:addToParent()
    controller:requestMyLoopLogInfo()
end

function ArenaLoopMyLogWindow1:updatePanelInfo()
end

function ArenaLoopMyLogWindow1:DeleteMe()
    EventManager:getInstance():UnBind(self)
	if self.scroll_view then
		self.scroll_view:DeleteMe()
		self.scroll_view = nil
	end
	-- controller:openArenaLoopMyLogWindow(false)
end


function ArenaLoopMyLogWindow1:updateMyGuessList(list)
	if list == nil or next(list) == nil then

        commonShowEmptyIcon(self.good_cons,true,{text = TI18N("暂无任何记录")})
		if self.scroll_view then
			self.scroll_view:setVisible(false)
		end
	else
        commonShowEmptyIcon(self.good_cons,false)

		if self.scroll_view == nil then
			local size = self.good_cons:getContentSize()
			local setting = {
				item_class = ArenaLoopMyLogItem1,
				start_x = 0,
				space_x = 0,
				start_y = 0,
				space_y = 5,
				item_width = 620,
				item_height = 119,
				row = 0,
				col = 1,
				need_dynamic = true
			}
			self.scroll_view = CommonScrollViewLayout.new(self.good_cons, nil, nil, nil, size, setting)
		end
		self.scroll_view:setVisible(true)
		self.scroll_view:setData(list)
	end
end


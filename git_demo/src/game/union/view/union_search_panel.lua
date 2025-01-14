-- --------------------------------------------------------------------
-- @description:
--      联盟查找面板
--
-- --------------------------------------------------------------------
UnionSearchPanel = class("UnionSearchPanel", function()
	return ccui.Layout:create()
end)

local controller = UnionController:getInstance()

function UnionSearchPanel:ctor(ctrl)
    self.panel_index = -1 -- 1:为搜索界面 2:为列表界面 3:为没有查找到界面

	self.root_wnd = createCSBNote(PathTool.getTargetCSB("union/union_search_panel"))
	self.size = self.root_wnd:getContentSize()
	self:setContentSize(self.size)
	
	self.root_wnd:setAnchorPoint(0.5, 0.5)
	self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
	self:addChild(self.root_wnd)

    self.background = self.root_wnd:getChildByName("background")
    self.background_width = self.background:getContentSize().width

    self.search_container = self.root_wnd:getChildByName("search_container")
    local desc = self.search_container:getChildByName("desc")
    desc:setString(TI18N("请输入完整联盟名或关键词"))
    self.search_btn = self.search_container:getChildByName("search_btn")
    local label = self.search_btn:getChildByName("label")
    label:setString(TI18N("查找"))
    local res = PathTool.getResFrame("common", "common_99998")
    self.union_value = createEditBox(self.search_container, res, cc.size(378, 50), nil, 20, Config.ColorData.data_color4[1], 20, TI18N("请输入"), nil, nil, LOADTEXT_TYPE_PLIST)
    self.union_value:setAnchorPoint(cc.p(0.5, 0.5))
    self.union_value:setPlaceholderFontColor(cc.c3b(129,104,65))
    self.union_value:setFontColor(cc.c3b(129,104,65))
    self.union_value:setPosition(cc.p(285, 123))
    self.union_value:setMaxLength(20) 

    self.list_container = self.root_wnd:getChildByName("list_container")

    self.return_btn = self.list_container:getChildByName("return_btn")
    local label = self.return_btn:getChildByName("label")
    label:setString(TI18N("返回搜索")) 

    self.notice_container = self.root_wnd:getChildByName("notice_container")
    -- local desc = self.notice_container:getChildByName("desc")
    -- desc:setString(TI18N("抱歉，查找不到对应的联盟，试试别的名字吧！")) 
    self.notice_btn = self.notice_container:getChildByName("notice_btn")
    local label = self.notice_btn:getChildByName("label")
    label:setString(TI18N("返回搜索")) 

    self:registerEvent()
end

function UnionSearchPanel:registerEvent()
    self.search_btn:addTouchEventListener(
        function(sender, event_type)
            customClickAction(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                local union_name = self.union_value:getText()
                if union_name == "" then
                    message(TI18N("联盟名字不得为空"))
                else
                    controller:requestUnionList(nil, nil, nil, union_name) 
                end
            end
        end
    ) 
    self.return_btn:addTouchEventListener(              -- 列表界面的返回按钮
        function(sender, event_type)
            customClickAction(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                self:changeViewStatus(1)
            end
        end
    ) 
    self.notice_btn:addTouchEventListener(              -- 没有信息的返回按钮
        function(sender, event_type)
            customClickAction(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                self:changeViewStatus(1)
            end
        end
    ) 
    EventManager:getInstance():Bind(UnionEvent.UpdateUnionList,self, function(type, list)
            if type ~= UnionConst.list_type.search then return end
            self:updateUnionList(list)
        end)
    
end

function UnionSearchPanel:addToParent(status)
    self:changeViewStatus(1)
	self:setVisible(status)
end

function UnionSearchPanel:changeViewStatus(index)
    if self.panel_index == index then return end
    -- 1:为搜索界面 2:为列表界面 3:为没有查找到界面
    self.panel_index = index
    self.search_container:setVisible(self.panel_index == 1) 
    self.list_container:setVisible(self.panel_index == 2)
    self.notice_container:setVisible(self.panel_index == 3)
    if self.panel_index== 3 then 
        commonShowEmptyIcon(self.background, true, {text = TI18N("抱歉，查找不到\n对应的联盟，试试\n别的名字吧！")})
    
        else
            commonShowEmptyIcon(self.background, false)
        end 
    if self.panel_index == 1 then
        self.background:setContentSize(self.background_width, 620)
    else
        self.background:setContentSize(self.background_width, 620) 
    end
end

--==============================--
--desc:外部判断是不是在联盟查找到的列表界面
--@return 
--==============================--
function UnionSearchPanel:checkIsInListStatus()
    return self.panel_index == 2
end

function UnionSearchPanel:changeToSearchListStatus()
    self:changeViewStatus(1)
end

function UnionSearchPanel:updateUnionList(list)
    if list == nil or next(list) == nil then
        self:changeViewStatus(3)
    else
        if self.scroll_view == nil then
            local size = self.list_container:getContentSize()
            local setting = {
            	item_class = UnionRequestItem,
            	start_x = 4,
            	space_x = 4,
            	start_y = 0,
            	space_y = - 3,
            	item_width = 616,
            	item_height = 134,
            	row = 0,
            	col = 1
            }
            self.scroll_view = CommonScrollViewLayout.new(self.list_container, nil, nil, nil, size, setting)
        end
        self.scroll_view:setData(list)
        self:changeViewStatus(2)
    end
end

function UnionSearchPanel:DeleteMe()
    EventManager:getInstance():UnBind(self)
	if self.scroll_view then
		self.scroll_view:DeleteMe()
		self.scroll_view = nil
	end
end 
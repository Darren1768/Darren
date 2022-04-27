-- --------------------------------------------------------------------
-- @description:
--      联盟列表面板
--
-- --------------------------------------------------------------------

UnionListPanel = class("UnionListPanel", function()
	return ccui.Layout:create()
end)

local controller = UnionController:getInstance()

function UnionListPanel:ctor(ctrl) 
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("union/union_list_panel"))
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd) 

    -- self.empty_tips = self.root_wnd:getChildByName("empty_tips")
    -- self.desc = self.empty_tips:getChildByName("desc")
    -- self.desc:setString(TI18N("暂无任何联盟信息"))
    self.scroll_container = self.root_wnd:getChildByName("background")

    self.checkbox = self.root_wnd:getChildByName("checkbox")
    local name = self.checkbox:getChildByName("name")
    name:setString(TI18N("只看未满人联盟"))
    self.checkbox:setSelected(false)

    self.create_btn = self.root_wnd:getChildByName("create_btn")


    self:registerEvent()
end

function UnionListPanel:registerEvent()
     EventManager:getInstance():Bind(UnionEvent.UpdateUnionList,self, function(type, list)
            if type ~= UnionConst.list_type.total then return end
            self.all_list = list or {}
            self:filterNotFullList()
        end)

    self.checkbox:addEventListener(function ( sender,event_type )
        playCommonButtonSound()
        self:filterNotFullList()
    end)

    registerButtonEventListener(self.create_btn, function () 
        
        controller:openUnionCreatWindow(true)
    end,false, 1)


end

function UnionListPanel:addToParent(status)
	self:setVisible(status)
    if status == true then
        if self.scroll_view == nil then
            controller:requestUnionList()
        end

        -- 入帮冷却时间
        if self.desc == nil then
            local role_vo = RoleController:getInstance():getRoleVo()
            if role_vo ~= nil then
                local cost_config = Config.UnionData.data_const.union_quit_cd
                local base_time = 43200
                if cost_config then
                    base_time = cost_config.val
                end
                local time = GameNet:getInstance():getTime() - role_vo.union_quit_time
                -- time = 10
                if time < base_time then -- 冷却结束
                    local less_time = base_time - time
                    self.desc = createRichLabel(24, 175, cc.p(1, 0.5), cc.p(628, 784), nil, nil, 400)
                    self.root_wnd:addChild(self.desc) 
                    self.desc:setString(string.format(TI18N("<div fontcolor=#249003>%s</div>后才可以再次申请入会"), TimeTool.GetTimeFormatTwo(less_time))) 
                end
            end
        end
    end
end 

--
function UnionListPanel:filterNotFullList()
    if not self.all_list then return end
    local status = self.checkbox:isSelected()
    local list 

    if status then
    --过滤未满人
        if self.filter_list == nil then
            self.filter_list = {}
            local table_insert = table.insert
            for i,data in ipairs(self.all_list) do
                if data.guild_num < data.members_max then
                    table_insert(self.filter_list, data)
                end
            end
        end
        list = self.filter_list
    else
        list = self.all_list
    end
 

    self:updateUnionList(list)
end

function UnionListPanel:updateUnionList(list)
    if list == nil or next(list) == nil then
        -- self.empty_tips:setVisible(true)
        commonShowEmptyIcon(self.scroll_container, true, {text = TI18N("暂无任何联盟信息")})

    else
        -- self.empty_tips:setVisible(false) 
        commonShowEmptyIcon(self.scroll_container, false)

        if self.scroll_view == nil then
            local list_size = self.scroll_container:getContentSize()
            local list_setting = {
                item_class = UnionRequestItem,
                start_x = 2,
                space_x = 0,
                start_y = 0,
                space_y = 0,
                item_width = 558,
                item_height = 164, 
                row = 0,
                col = 1,
                need_dynamic = true
            } 
            self.scroll_view = CommonScrollViewLayout.new(self.scroll_container, cc.p(0,0), nil, nil, cc.size(list_size.width, list_size.height), list_setting) 
        end
        self.scroll_view:setData(list) 
    end
end

function UnionListPanel:DeleteMe()
    EventManager:getInstance():UnBind(self)
    if self.scroll_view then
        self.scroll_view:DeleteMe()
        self.scroll_view = nil
    end
end 
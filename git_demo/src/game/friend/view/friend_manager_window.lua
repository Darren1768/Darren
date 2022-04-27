-- --------------------------------------------------------------------
-- 竖版好友管理
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
FriendManagerWindow = FriendManagerWindow or BaseClass(BaseView)

local table_insert = table.insert

function FriendManagerWindow:__init()
    self.ctrl = FriendController:getInstance()

    self.win_type = WinType.Mini
    self.view_tag = ViewMgrTag.DIALOGUE_TAG  
    self.show_close_btn			= false  
    self.title_str = nil
    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("friend","friend"), type = ResourcesType.plist },
    }
    self.tab_info_list = {
        {label=TI18N("添加\n好友"), index=FriendConst.Type.AddFriend, status=true},
        {label=TI18N("好友\n申请"), index=FriendConst.Type.ApplyList, status=true},
        {label=TI18N("删除\n好友"), index=FriendConst.Type.MyFriend, status=true},
        {label=TI18N("黑名\n单"), index=FriendConst.Type.BlackList, status=true},
    }
    self.view_list = {}
    self.friend_list = {}--因为4个标签页都是有列表。直接主界面创建复用

    self.scroll_width = 558
    self.scroll_height = 536

    self.rend_list = {}
    self.cache_list = {}
    self.is_init = true

    self.role_vo = RoleController:getInstance():getRoleVo()
end

function FriendManagerWindow:open_callback()
    local size = self.container:getContentSize()
    self.list_view = ccui.Layout:create()
    self.list_view:setContentSize(cc.size(self.scroll_width, self.scroll_height))
    self.list_view:setAnchorPoint(cc.p(0.5, 1))
    self.list_view:setPosition(282, 624)
    self.list_view:setCascadeOpacityEnabled(true)
    self.container:addChild(self.list_view, 10)

    local setting = {
        item_class = FriendListItem2,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 0,                    -- x方向的间隔
        start_y = 0,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = 558,               -- 单元的尺寸width
        item_height = 108,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 1,                         -- 列数，作用于垂直滚动类型
        once_num = 1,
        need_dynamic = true
    }
    self.item_scrollview = CommonScrollViewLayout.new(self.list_view, cc.p(0, 0) , ScrollViewDir.vertical, ScrollViewStartPos.top, cc.size(self.scroll_width, self.scroll_height), setting)
end

-- function FriendManagerWindow:setInviteCodeRedPointVisible(visible)
--     if not self.red_point then
--         self.red_point = createSprite(PathTool.getResFrame("mainui","mainui_1009"),0,0,self.container,cc.p(1,1),LOADTEXT_TYPE_PLIST)
--         self.red_point:setPosition(cc.p(657, -29))
--     end
--     if self.red_point then
--         self.red_point:setVisible(visible)
--     end
-- end

function FriendManagerWindow:register_event()
    --申请好友列表返回
    self:addGlobalEvent(FriendEvent.FRIEND_APPLY, function()
            if self.cur_type ~= FriendConst.Type.ApplyList then return end
            self:updateFriendList(false)
        end)
    --删除好友返回
    self:addGlobalEvent(FriendEvent.FRIEND_DELETE, function()
            if self.cur_type ~= FriendConst.Type.MyFriend and self.cur_type ~= FriendConst.Type.BlackList then return end
            self:updateFriendList(false, true)
        end)
    --增加好友
    self:addGlobalEvent(FriendEvent.UPDATE_APPLY, function()
            if self.cur_type ~= FriendConst.Type.MyFriend then 
                self:setTabTips(true,FriendConst.Type.MyFriend)
                if self.cur_type == FriendConst.Type.ApplyList then
                    self:updateFriendList(false)
                end
            else
                self:updateFriendList(false)
            end    
            self:showRedPoint()
        end)

    self:addGlobalEvent(FriendEvent.UPDATE_COUNT, function()
            self:updateFriendList(false)
            self:showRedPoint()
        end)
    --被删好友
    self:addGlobalEvent(FriendEvent.UPDATE_GROUP_COUNT, function()
            self:updateFriendList(false, true)
            self:showRedPoint()
        end)
    --有人来礼物
    self:addGlobalEvent(FriendEvent.FRIEND_LIST, function()
            self:updateFriendList(false)
            self:showRedPoint()
        end)
    --更新红点用
    self:addGlobalEvent(FriendEvent.Update_Red_Point, function()
            self:showRedPoint()
        end)

end

function FriendManagerWindow:openRootWnd(type)
    type = type or FriendConst.Type.AddFriend
    self:setSelecteTab(type,true)
    self:showRedPoint()
    -- InviteCodeController:getInstance():sender19804()
end

--[[
@desc: 切换标签页
author:{author}
time:2018-05-03 21:58:15
--@type: 
return
]]
function FriendManagerWindow:selectedTabCallBack(type)
    type = type or FriendConst.Type.AddFriend
    if self.cur_type == type then return end

    --切换到好友列表就把红点清掉
    self:setTabTips(false,FriendConst.Type.AddFriend)

    self.cur_type = type
    if self.pre_panel ~= nil then
        if self.pre_panel.setVisibleStatus then
            self.pre_panel:setVisibleStatus(false)
        end
    end

    self.pre_panel= self:createSubPanel(self.cur_type)
    if self.pre_panel ~= nil then
        if self.pre_panel.setVisibleStatus then
            self.pre_panel:setVisibleStatus(true)
        end
    end

    self.list_view:setVisible(true)
    if self.cur_type == FriendConst.Type.MyFriend then 
        self.list_view:setContentSize(cc.size(self.scroll_width, 536))
        self.item_scrollview:resetSize(cc.size(self.scroll_width, 536))
        self:updateFriendList(true)
    elseif self.cur_type == FriendConst.Type.AddFriend then 
        self.list_view:setVisible(false)
        commonShowEmptyIcon(self.container,false)
    else 
        self.list_view:setContentSize(cc.size(self.scroll_width, 492))
        self.item_scrollview:resetSize(cc.size(self.scroll_width, 492))
        self:updateFriendList(true)
    end

end

function FriendManagerWindow:createSubPanel(index)
    local panel = self.view_list[index]
    if panel == nil then
        if index == FriendConst.Type.MyFriend then
            panel = FriendApplyPanel.new()
        elseif index == FriendConst.Type.AddFriend then
            panel = FriendAddPanel.new()

        elseif index == FriendConst.Type.ApplyList then
            panel = FriendApplyPanel.new()
        elseif index == FriendConst.Type.Award then
            panel = FriendAwardPanel.new()
        elseif index == FriendConst.Type.BlackList then
            panel = FriendBlackPanel.new()
        end
        local size = self.container:getContentSize()
        panel:setPosition(cc.p(size.width/2,340))
        self.container:addChild(panel)
        self.view_list[index] = panel
    end
    return panel
end

function FriendManagerWindow:getDelFriendStatus(  )
    return self.cur_type == FriendConst.Type.MyFriend
end

function FriendManagerWindow:updateFriendList(change_index)
    change_index = change_index or false
    self.rend_list = {}
    local list = {}
    if self.cur_type == FriendConst.Type.MyFriend then
        list = self.ctrl:getModel():getArray() or Array.New()

    elseif self.cur_type == FriendConst.Type.ApplyList then
        if change_index == true then
            self.ctrl:apply()    
            return
        else
            local array = Array.New()
            local apply_list = self.ctrl:getModel():getApplyList() or {}
            for i,v in pairs(apply_list) do 
                array:PushBack(v)
            end
            list = array
        end
        self:updateApplyNum()
    elseif self.cur_type == FriendConst.Type.Award then
        local array = self.ctrl:getModel():getArray() or Array.New()
        award_array = Array.New()
        for i=1,array:GetSize() do 
            local vo = array:Get(i-1) do 
                if vo and vo.is_draw == 1 then 
                    award_array:PushBack(vo)
                end
            end
        end
        list = award_array
    elseif self.cur_type == FriendConst.Type.BlackList then
        list = self.ctrl:getModel():getBlackArray() or Array.New()
    end

    if list and list.items then
        for k,v in pairs(list.items) do
            table_insert(self.rend_list, v)
        end
    end    
    commonShowEmptyIcon(self.container,false)
    if #self.rend_list <= 0 then 

        local str = TI18N("暂无好友")
        if self.cur_type == FriendConst.Type.Award then 
            str = TI18N("暂无好友赠送")
        elseif self.cur_type == FriendConst.Type.ApplyList then 
            str = TI18N("暂无好友申请")
        elseif self.cur_type == FriendConst.Type.AddFriend then 
            str = ''
            -- self.empty_con:setVisible(false)
        elseif self.cur_type == FriendConst.Type.BlackList then 
            str = TI18N("黑名单列表为空")
        end
        commonShowEmptyIcon(self.container,true,{text = str})
    end
    self.pre_panel:setData(self.rend_list)
    if self.cur_type == FriendConst.Type.MyFriend then
        self.pre_panel:setDelNum(#self.rend_list)
    end
    self.item_scrollview:setData(self.rend_list, nil, nil, self.cur_type)
end

--更新申请数
function FriendManagerWindow:updateApplyNum()
    if self.pre_panel and self.pre_panel.setApplyNum then 
        local num = self.ctrl:getModel():getApplyNum() or 0
        self.pre_panel:setApplyNum(num)
    end
end

function FriendManagerWindow:setscheduleUpdate(status)
end

function FriendManagerWindow:createItem(vo)    
end

--[[
@desc: 设置标签页面板数据内容
author:{author}
time:2018-05-03 21:57:09
return
]]
function FriendManagerWindow:setPanelData()
end

--红点处理
function FriendManagerWindow:showRedPoint()
    local award_num = self.ctrl:getModel():getAwardNum() or 0
    local appl_num =  self.ctrl:getModel():getApplyNum() or 0
    self:setTabTipsII(award_num,FriendConst.Type.Award)
    self:setTabTipsII(appl_num,FriendConst.Type.ApplyList)
    local list = {bid=2,num = appl_num}--{{bid=1,num = award_num},{bid=2,num = appl_num}}
    MainuiController:getInstance():setFunctionTipsStatus(MainuiConst.icon.friend, list)
    EventManager:getInstance():Fire(FriendEvent.Update_Friend_List_Red_Point,list )

end

function FriendManagerWindow:close_callback()
    self.ctrl:openFriendManagerWindow(false)
    if self.item_scrollview then
        self.item_scrollview:DeleteMe()
        self.item_scrollview = nil
    end

    for i,v in pairs(self.view_list) do 
        if v and v["DeleteMe"] then
            v:DeleteMe()
        end
    end
    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
    end
    self.view_list = nil
end

-- --------------------------------------------------------------------
-- @description:
--      联盟成员窗体
--
-- --------------------------------------------------------------------
UnionMemberWindow = UnionMemberWindow or BaseClass(BaseView)

local controller = UnionController:getInstance()
local model = UnionController:getInstance():getModel()
local string_format = string.format

function UnionMemberWindow:__init()
    --self.view_tag = ViewMgrTag.DIALOGUE_TAG 
     
    -- self.background_path = "resource/bigbg/union/hl_union.png"
    self.background_path = "resource/bigbg/guild/hl_guild.png"

    --self.win_type = WinType.Big
    self.win_type = WinType.Big
    self.title_str = TI18N("")
    self.my_union_info = model:getMyUnionInfo()
    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("union", "union"), type = ResourcesType.plist}
    }
    self.title_sprite = PathTool.getResFrame("guild", "hl_guild_0011")

    self.touch_btn = true
    self.show_menber_list = {} --当前展示的成员列表
end 

function UnionMemberWindow:open_callback()
    self.main_view = createCSBNote(PathTool.getTargetCSB("union/union_member_window"))
    self.container:addChild(self.main_view) 
    self.main_view:setPosition(cc.p(-35,-80))

    self.scroll_container = self.main_view:getChildByName("background")
    self.desc = self.main_view:getChildByName("desc")

    self.explain_btn = self.main_view:getChildByName("explain_btn")

    self.exit_btn = self.main_view:getChildByName("exit_btn")
    self.exit_btn_label = self.exit_btn:getChildByName("label")

    self.recruit_btn = self.main_view:getChildByName("recruit_btn")
    self.recruit_btn:getChildByName("label"):setString(TI18N("联盟招募"))

    self.checkapply_btn = self.main_view:getChildByName("checkapply_btn")
    self.checkapply_btn:getChildByName("label"):setString(TI18N("查看申请"))

    self.notice_btn  = self.main_view:getChildByName("notice_btn")


end

function UnionMemberWindow:register_event()
    self.recruit_btn:addTouchEventListener(function(sender, event_type)
            customClickAction(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                controller:openUnionApplySetWindow(true)
            end
        end) 
    self.checkapply_btn:addTouchEventListener(function(sender, event_type)
            customClickAction(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                controller:openUnionApplyWindow(true)
            end
        end) 
    self.exit_btn:addTouchEventListener(function(sender, event_type)
            customClickAction(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                if self.show_type == UnionConst.show_type.all then
                    controller:requestExitUnion() --退出联盟
                else 
                    if not self.touch_btn then return end
                    if self.time_ticket == nil then
                        self.time_ticket = GlobalTimeTicket:getInstance():add(function()
                                self.touch_btn = true
                                if self.time_ticket ~= nil then
                                    GlobalTimeTicket:getInstance():remove(self.time_ticket)
                                    self.time_ticket = nil
                                end
                            end, 2)
                    end
                    self.touch_btn = nil
                    local list = {}
                    for k,v in pairs(self.show_menber_list) do
                        table.insert(list, {rid = v.rid, srv_id = v.srv_id})
                    end
                    controller:send29279(self.show_type, list) --一键提醒
                end
            end
        end) 

        self.notice_btn:addTouchEventListener(function(sender, event_type)
            customClickAction(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                controller:openUnionNoticeWindow(true)
    
            end
        end) 
    

    registerButtonEventListener(self.explain_btn, function(param,sender, event_type)
            local config = Config.UnionData.data_const.game_rule
            TipsManager:getInstance():showCommonTips(config.desc, sender:getTouchBeganPosition(),nil,nil,500)
        end,true, 1)


    EventManager:getInstance():Bind(UnionEvent.UpdateMyMemberListEvent,self, function(type)
            if type == 0 then return end 
            self:updateMemberList(type)
        end)

    if self.my_union_info ~= nil then
        if self.update_myunion_event == nil then
            self.update_myunion_event = self.my_union_info:Bind(UnionEvent.UpdateMyInfoEvent, function(key, value)
                    if key == "members_num" or key == "members_max" then
                        self:updateMemberNum()
                    end
                end)
        end
    end

    EventManager:getInstance():Bind(UnionEvent.UpdateAssistantNumEvent,self, function() 
            if self.role_vo ~= nil and self.role_vo.league_position ~= UnionConst.post_type.member then
                self:updateMemberNum()
            end
        end)

    self.role_vo = RoleController:getInstance():getRoleVo()
    if self.role_vo ~= nil then
        if self.role_assets_event == nil then
            self.role_assets_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value)
                    if key == "gid" then
                        if value == 0 then
                            controller:openUnionMemberWindow(false) 
                        end
                    elseif key == "position" then
                        self:updateExitStatus()
                    end
                end)
        end 
    end

    EventManager:getInstance():Bind(UnionEvent.UpdateUnionRedStatus,self, function(red_type, status)
            self:updateApplyRedStatus(red_type, status)
        end)
end

function UnionMemberWindow:openRootWnd(show_type)
    self.show_type = show_type or UnionConst.show_type.all --成员列表打开索引

    controller:requestUnionMemberList()     -- 请求联盟成员信息
    self:updateApplyRedStatus() --刷新联盟申请红点
end

function UnionMemberWindow:updateExitStatus()
    if self.role_vo == nil then return end
    if self.show_type ~= UnionConst.show_type.all then
        self.exit_btn_label:setString(TI18N("一键提醒"))
        self.recruit_btn:setVisible(false)
        self.checkapply_btn:setVisible(false)
        self.exit_btn:setVisible(self.role_vo.league_position ~= UnionConst.post_type.member)
        if next(self.show_menber_list) == nil then
            self.exit_btn:setVisible(false)
        end
    else
        if self.role_vo.league_position == UnionConst.post_type.leader then
            self.exit_btn_label:setString(TI18N("解散联盟"))
        else
            self.exit_btn_label:setString(TI18N("退出联盟")) 
            self.exit_btn:setPositionX(500)
            self.notice_btn:setPositionX(200)
        end
        self.recruit_btn:setVisible(self.role_vo.league_position ~= UnionConst.post_type.member)
        self.checkapply_btn:setVisible(self.role_vo.league_position ~= UnionConst.post_type.member)
    end
end

--申请按钮红点状态
function UnionMemberWindow:updateApplyRedStatus(red_type, status)
    if red_type == UnionConst.red_index.apply then
        addRedPointToNodeByStatus(self.checkapply_btn, status)
    else
        local red_status = model:getRedStatus(UnionConst.red_index.apply)
        addRedPointToNodeByStatus(self.checkapply_btn, red_status)
    end
end

--==============================--
--desc:只有会长或者副会长才做这个处理
--@return 
--==============================--
function UnionMemberWindow:updateMemberNum()
    if self.show_type ~= UnionConst.show_type.all then
        local tips_str = ""
        if self.show_type == UnionConst.show_type.union_war then
            tips_str = TI18N("联盟战有剩余挑战次数的玩家：%s/%s")
        elseif self.show_type == UnionConst.show_type.union_donate then
            tips_str = TI18N("联盟捐献今日还未捐献的玩家：%s/%s")
        elseif self.show_type == UnionConst.show_type.union_voyage then
            tips_str = TI18N("联盟副本有剩余购买挑战次数的玩家：%s/%s")
        end
        if self.my_union_info then
            self.desc:setString(string.format(tips_str, #self.show_menber_list, self.my_union_info.members_max))
        end
    else
        if self.my_union_info ~= nil and self.role_vo ~= nil then
            if self.role_vo.league_position == UnionConst.post_type.member then
                self.desc:setString(string.format(TI18N("人数：%s/%s"), self.my_union_info.members_num, self.my_union_info.members_max))
            else
                local config = Config.UnionData.data_post[getNorKey(UnionConst.post_type.assistant, self.my_union_info.lev)]
                if config ~= nil then
                    local num = model:getAssistantSum()
                    self.desc:setString(string.format("%s%s/%s   %s%s/%s", TI18N("人数："), self.my_union_info.members_num, self.my_union_info.members_max, TI18N("副联盟长："), num, config.num ))
                end 
            end
        end
    end
end

--==============================--
--desc:打开窗体或者收到增删成员的时候才会更新
--@return 
--==============================--
function UnionMemberWindow:updateMemberList(type)
    self.show_menber_list = model:getUnionMemberList(self.show_type)
    if self.show_menber_list ~= nil and next(self.show_menber_list) ~= nil then
        if self.scroll_view == nil then
            local list_size = cc.size(self.scroll_container:getContentSize().width,self.scroll_container:getContentSize().height-12)
            local list_setting = {
                item_class = UnionMemberItem,
                start_x = 0,
                space_x = 4,
                start_y = 0,
                space_y = 0,
                item_width = 650,
                item_height = 139,
                row = 0,
                col = 1,
                need_dynamic = true
            }
            self.scroll_view = CommonScrollViewLayout.new(self.scroll_container, cc.p(0,0), nil, nil, list_size, list_setting) 
        end
        if type == 1 then
            if self.scroll_view then
                self.scroll_view:setData(self.show_menber_list)
            end
        else
            self.scroll_view:resetAddPosition(self.show_menber_list)
        end
    end
    self:updateMemberNum()
    self:updateExitStatus()
end

function UnionMemberWindow:close_callback()
    if self.scroll_view then
        self.scroll_view:DeleteMe()
        self.scroll_view = nil
    end
    controller:openUnionMemberWindow(false)
    EventManager:getInstance():UnBind(self)
    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
        self.role_vo = nil
    end
    for k,v in pairs(self.show_menber_list) do
        v:DeleteMe()
        v = nil
    end
    if self.time_ticket ~= nil then
        GlobalTimeTicket:getInstance():remove(self.time_ticket)
        self.time_ticket = nil
    end
end



-- --------------------------------------------------------------------
-- @description:
--      成员列表单元
--
-- --------------------------------------------------------------------
UnionMemberItem = class("UnionMemberItem", function()
        return ccui.Layout:create()
    end)

function UnionMemberItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("union/union_member_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    --self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    --self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    local container = self.root_wnd:getChildByName("container")

    --管理设置按钮
    self.set_post_btn = container:getChildByName("set_post_btn")

    self.role_online = container:getChildByName("role_online")
    self.role_name = container:getChildByName("role_name")
    self.role_position = container:getChildByName("role_position")
    self.role_donate = container:getChildByName("role_donate")
    self.role_day_donate = container:getChildByName("role_day_donate")
    self.role_action = container:getChildByName("role_action")

    container:getChildByName("position_title"):setString(TI18N("职位："))

    self.role_head = PlayerHead.new(PlayerHead.type.circle)
    self.role_head:setPosition(83, 70)
    container:addChild(self.role_head)
    self.role_head:setLev(99) 

    self.container = container

    self:registerEvent()
end

function UnionMemberItem:registerEvent()
    self.role_head:addCallBack(function()
            if self.data ~= nil then
                if self.data.is_self == true then
                    message(TI18N("怎么？自己都不认识了？"))
                else
                    FriendController:getInstance():openFriendCheckPanel(true, {srv_id = self.data.srv_id, rid = self.data.rid})
                end
            end
        end, false)

    self.set_post_btn:addTouchEventListener(function(sender, event_type)
            customClickAction(sender, event_type)
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                if self.data ~= nil then    
                    local role_vo = RoleController:getInstance():getRoleVo()

                    if role_vo.league_position == 1 then
                        if self.data.post ~= UnionConst.post_type.leader then
                            controller:openUnionOperationPostWindow(true, self.data)
                        end
                    elseif role_vo.league_position == 2 then
                        if self.data.post == UnionConst.post_type.member then
                            controller:openUnionOperationPostWindow(true, self.data)
                        elseif self.data.post == UnionConst.post_type.leader then
                            controller:openUnionImpeachPostWindow(true)
                        end
                    elseif role_vo.league_position == 3 then
                        if self.data.post == UnionConst.post_type.leader then
                            controller:openUnionImpeachPostWindow(true)
                        end
                    end
                end
            end
        end)
end

function UnionMemberItem:addCallBack(call_back)
    self.call_back = call_back
end

function UnionMemberItem:setData(data)
    if self.data ~= nil then
        if self.update_self_event ~= nil then
            self.data:UnBind(self.update_self_event)
            self.update_self_event = nil
        end
        self.data = nil
    end

    if data then
        self.data = data
        self.set_post_btn:setVisible(true)
        self:setBaseData()
        self:setOnLineStatus()
        self:updateBtnStatusByRolePost()
        if self.update_self_event == nil then
            self.update_self_event = self.data:Bind(UnionEvent.UpdateMyMemberItemEvent, function(key, value)
                    if key == "post" or key == "role_post" then               -- 只更新职位
                        self:setPostInfo()
                        self:updateBtnStatusByRolePost()
                    end
                end) 
        end
        --[[
        if data.is_self == true then
            self.container:loadTexture(PathTool.getResFrame("common","common_1020"), LOADTEXT_TYPE_PLIST) 
        else
            self.container:loadTexture(PathTool.getResFrame("common", "common_1029"), LOADTEXT_TYPE_PLIST) 
        end
        ]]
    end
end

function UnionMemberItem:setBaseData()
    if self.data == nil then return end
    local data = self.data
    self.role_name:setString(data.name)
    self.role_head:setHeadRes(data.face, false, LOADTEXT_TYPE, data.face_file, data.face_update_time)
    self.role_head:setLev(data.lev)
    self.role_donate:setString(string.format(TI18N("贡献：%s"), data.donate))
    self.role_day_donate:setString(string.format(TI18N("今日贡献：%s"), data.day_donate))
    self.role_action:setString(string.format(TI18N("活跃等级：%s"), data.active_lev))
    self:setPostInfo() 
end

--==============================--
--desc:按钮的一些状态判断，比如说是否是自己需要怎么显示，以及自己是什么职位需要怎么显示
--@return 
--==============================--
--会长不上线X天可以弹劾
local imprachTime = 3--Config.UnionData.data_const.impeach_offline_day.val
local imprachTime_2 = 7 --成员
function UnionMemberItem:updateBtnStatusByRolePost()
    if self.data == nil then return end
    local role_vo = RoleController:getInstance():getRoleVo()

    if role_vo.league_position == 1 then
        if self.data.post == UnionConst.post_type.leader then
            self.set_post_btn:setVisible(false)
        else
            self.set_post_btn:setVisible(true)
        end
    elseif role_vo.league_position == 2 then
        if role_vo.league_position == self.data.post then --本人
            self.set_post_btn:setVisible(false)
        end
        if self.data.post == UnionConst.post_type.leader then
            -- local time = GameNet:getInstance():getTime() - self.data.login_time
            -- if time >= 86400*imprachTime then
            --     self.set_post_btn:setVisible(true)
            -- else
            --     self.set_post_btn:setVisible(false)
            -- end

            self.set_post_btn:setVisible(true)
        end
    elseif role_vo.league_position == 3 then
        if self.data.post == UnionConst.post_type.leader then
            local time = GameNet:getInstance():getTime() - self.data.login_time
            -- if time >= 86400*imprachTime_2 then
            --     self.set_post_btn:setVisible(true)
            -- else
            --     self.set_post_btn:setVisible(false)
            -- end

            self.set_post_btn:setVisible(true)
        else
            self.set_post_btn:setVisible(false)
        end
    end
end

function UnionMemberItem:setOnLineStatus()
    if self.data == nil then return end
    local data = self.data
    if data.online == FALSE then -- 不在线
        -- self.role_online:setTextColor(Config.ColorData.data_color4[183])
        self.role_online:setTextColor(cc.c3b(189,81,16))

        local pass_time = GameNet:getInstance():getTime() - data.login_time
        if pass_time <= 60 then -- 小于1分钟
            self.role_online:setString(TI18N("刚刚")) 
        elseif 60 < pass_time and pass_time <= 3600 then -- 大于1分钟小于1小时
            self.role_online:setString(string.format(TI18N("%s分钟前"), math.floor( pass_time / 60 )))
        elseif 3600 < pass_time and pass_time <= 86400 then -- 大于1小时小于24小时
            self.role_online:setString(string.format(TI18N("%s小时前"), math.floor(pass_time / 3600))) 
        elseif 86400 < pass_time and pass_time <= 604800 then -- 大于24小时小于7天
            self.role_online:setString(string.format(TI18N("%s天前"), math.floor(pass_time / 86400)))
        else
            self.role_online:setString(TI18N("7天前")) 
        end
    else
        -- self.role_online:setTextColor(Config.ColorData.data_color4[178])
        self.role_online:setTextColor(cc.c3b(71,131,45))

        self.role_online:setString(TI18N("在线"))
    end 
end

function UnionMemberItem:setPostInfo()
    if self.data == nil then return end
    local config = Config.UnionData.data_position[self.data.post]
    if config ~= nil then
        if self.data.post == UnionConst.post_type.member then
            -- self.role_position:setTextColor(Config.ColorData.data_color4[175]) 
        else
            -- self.role_position:setTextColor(Config.ColorData.data_color4[185]) 
        end
        self.role_position:setString(config.name)
    end
end

function UnionMemberItem:suspendAllActions()
    if self.data ~= nil then
        if self.update_self_event ~= nil then
            self.data:UnBind(self.update_self_event)
            self.update_self_event = nil
        end
        self.data = nil
    end 
end

function UnionMemberItem:DeleteMe()
    self:suspendAllActions()
    self:removeAllChildren()
    self:removeFromParent()
end

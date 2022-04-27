-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
UnionModel = UnionModel or BaseClass()

local table_insert = table.insert
local table_sort = table.sort

function UnionModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function UnionModel:config()
    self.union_cache_list = {}      -- 缓存的当前服务器列表
    self.union_apply_list = {}      -- 公会申请列表
    self.donate_sum = 0             -- 今天已经捐献的次数
    self.union_member_list = {}     -- 成员列表
    self.union_list = {}            -- 当前所有的公会列表
    self.union_search_list = {}     -- 当前待查找的公会列表
    self.my_union_assistant = {}    -- 当前副会长的数据
    self.union_red_status_list = {} -- 公会红点的状态
    self.union_donate_activity_list = {}    -- 捐献活跃宝箱清空
    self.union_notice_list = {}     -- 公会日志列表
end

function UnionModel:updateUnionList(name, data_list)
    if name == "" then      -- 这个就是全部的公会列表
        self.union_list = {}
        for i,v in ipairs(data_list) do
            local union_vo = self.union_cache_list[getNorKey(v.lid, v.lsrv_id)]
            if union_vo == nil then
                union_vo = UnionListVo.New()
                self.union_cache_list[getNorKey(v.lid, v.lsrv_id)] = union_vo
            end
            union_vo:updateData(v)
            table_insert(self.union_list, union_vo)
        end
    else
        self.union_search_list = {}
        for i, v in ipairs(data_list) do
            local union_vo = self.union_cache_list[getNorKey(v.lid, v.lsrv_id)]
            if union_vo == nil then
                union_vo = UnionListVo.New()
                self.union_cache_list[getNorKey(v.lid, v.lsrv_id)] = union_vo
            end
            union_vo:updateData(v)
            table_insert(self.union_search_list, union_vo)
        end 
    end
    local type = UnionConst.list_type.total
    local union_list = self.union_list
    if name ~= "" then
        type = UnionConst.list_type.search
        union_list = self.union_search_list
    end
    EventManager:getInstance():Fire(UnionEvent.UpdateUnionList, type, union_list) 
end

--==============================--
--desc:申请某个公会的返回
--@lid:
--@lsrv_id:
--@return 
--==============================--
function UnionModel:updateUnionApplyStatus(lid, lsrv_id, is_apply)
    local union_list_vo = self.union_cache_list[getNorKey(lid, lsrv_id)]
    if union_list_vo ~= nil then
        union_list_vo:setUnionAttribute("is_apply", is_apply)
    end
end

--==============================--
--desc:更新自己公会的基础信息
--@data:
--@return 
--==============================--
function UnionModel:updateMyUnionInfo(data)
    if self.my_union_info == nil then
        self.my_union_info = UnionMyInfoVo.New()
    end
    self.my_union_info:updateData(data)
end

--==============================--
--desc:清空自己本地缓存的客户端数据
--@return 
--==============================--
function UnionModel:clearMyUnionInfo()
    self.my_union_info = nil
    self.union_red_status_list = {}
    self.my_union_assistant = {}
    self.union_member_list = {}
    self.union_donate_activity_list = {}

    -- 这里需要做清楚红点操作
    GhostdomController:getInstance():setBuildRedStatus(GhostdomConst.Build_Type.union)
end

--==============================--
--desc:获取自己公会信息
--@return 
--==============================--
function UnionModel:getMyUnionInfo()
    return self.my_union_info
end

--==============================--
--desc:更新成员列表，增删
--@data_list:
--@type:"0:更新 1:添加 2:删除" 
--@return 
--==============================--
function UnionModel:updateMyUnionMemberList(data_list,type)
    print("0:更新 1:添加 2:删除..--------------------....",type)
    printLuaTable(data_list)
    local role_vo = RoleController:getInstance():getRoleVo() 
    if role_vo == nil then return end 
    if type == 2 then       -- 删除
        for i,v in ipairs(data_list) do
            self.union_member_list[getNorKey(v.rid, v.srv_id)] = nil

            if self.my_union_assistant[getNorKey(v.rid, v.srv_id)] ~= nil then
                self.my_union_assistant[getNorKey(v.rid, v.srv_id)] = nil
                -- 这里抛出时间更新副会长的数量吧
                if role_vo.position ~= UnionConst.post_type.member then
                    EventManager:getInstance():Fire(UnionEvent.UpdateAssistantNumEvent)
                end
            end
        end 
    else
        local member_vo = nil
        for i,v in ipairs(data_list) do
            member_vo = self.union_member_list[getNorKey(v.rid, v.srv_id)]
            -- 如果之前存在副会长，但是现在没有了的话，就移除掉
            if self.my_union_assistant[getNorKey(v.rid, v.srv_id)] ~= nil then
                if v.post ~= UnionConst.post_type.assistant then
                    self.my_union_assistant[getNorKey(v.rid, v.srv_id)] = nil
                    if role_vo.position ~= UnionConst.post_type.member then 
                        EventManager:getInstance():Fire(UnionEvent.UpdateAssistantNumEvent) 
                    end
                end
            else
                if v.post == UnionConst.post_type.assistant then
                    self.my_union_assistant[getNorKey(v.rid, v.srv_id)] = v 
                    if role_vo.position ~= UnionConst.post_type.member then 
                        EventManager:getInstance():Fire(UnionEvent.UpdateAssistantNumEvent) 
                    end
                end
            end

            if member_vo == nil then
                member_vo = UnionMemberVo.New()
                self.union_member_list[getNorKey(v.rid, v.srv_id)] = member_vo
            end
            if v.is_self == nil then
                v.is_self = RoleController:getInstance():checkIsSelf(v.srv_id, v.rid)       -- 当前是不是自己
            end
            v.role_post = role_vo.position                                              -- 自己的职位
            
            member_vo:updateData(v)
        end
    end
    -- 只有是增，删才处理这个事件 1:添加 2:删除
    EventManager:getInstance():Fire(UnionEvent.UpdateMyMemberListEvent, type)
end

--==============================--
--desc:自己职位变化的时候更改一下成员列表里面的自己职位数据
--@value:
--@return 
--==============================--
function UnionModel:updateMemberByPosition(value)
    if self.union_member_list ~= nil then
        for k,v in pairs(self.union_member_list) do
            v:setUnionAttribute("role_post", value)
        end
    end
end

--==============================--
--desc:获取当前副会长的总数
--@return 
--==============================--
function UnionModel:getAssistantSum()
    if self.my_union_assistant == nil then 
        return 0 
    end
    local sum = 0
    for k,v in pairs(self.my_union_assistant) do
        sum = sum + 1
    end
    return sum
end

--==============================--
--desc:获取成员列表
--@return 
--==============================--
function UnionModel:getUnionMemberList(show_type)
    local sort_keys = {}
    local member_list = {}
    local role_vo = RoleController:getInstance():getRoleVo()
    for k,v in pairs(self.union_member_list) do
        local temp_status = false
        if show_type == UnionConst.show_type.all then
            temp_status = true
     
        end
        if temp_status then
            if show_type == UnionConst.show_type.all then
                table_insert(member_list, v)
            else
                if not role_vo:isSameRole(v.srv_id, v.rid) then -- 筛选列表不需要显示本身
                    table_insert(member_list, v)
                end
            end
        end
    end
    if show_type == UnionConst.show_type.all then
        sort_keys = {"online", "post_sort"}
    elseif show_type == UnionConst.show_type.union_war then
        sort_keys = {"online", "post_sort", "day_war_time"}
    elseif show_type == UnionConst.show_type.union_donate then
        sort_keys = {"online", "post_sort", "day_donate"}
    elseif show_type == UnionConst.show_type.union_voyage then
        sort_keys = {"online", "post_sort", "day_dun_time"}
    end
    
    if #member_list > 1 and #sort_keys > 0 then
        local sort_func = SortTools.tableUpperSorter(sort_keys)
        table_sort(member_list, sort_func)
    end
    return member_list
end

--==============================--
--desc:更新玩家捐献情况
--@data_list:
--@return 
--==============================--
function UnionModel:updateDonateInfo(data_list)
    if data_list == nil then return end
    self.donate_sum = 0
    self.donate_list = {}
    for i,v in ipairs(data_list) do
        self.donate_list[v.type] = v.num
        self.donate_sum = self.donate_sum + v.num
    end
    EventManager:getInstance():Fire(UnionEvent.UpdateDonateInfo)
    -- 设置红点
    self:updateUnionRedStatus(UnionConst.red_index.donate, (self.donate_sum <= 0))
end

--==============================--
--desc:这里表示捐献成功了
--@return 
--==============================--
function UnionModel:setUnionDonateStatus()
    self.donate_sum = self.donate_sum + 1
    self:updateUnionRedStatus(UnionConst.red_index.donate, false) 
end

--==============================--
--desc:判断某一个捐献状态
--@type:
--@return: 是否可以捐献，当前捐献次数
--==============================--
function UnionModel:checkDonateStatus(type)
    local num = 0
    if self.donate_list and self.donate_list[type] then
        num = self.donate_list[type]
    end
    return (self.donate_sum > 0), (num and num > 0)
end 

--==============================--
--desc:更新申请列表，
--@data_list:
--@return 
--==============================--
function UnionModel:updateUnionApplyList(data_list)
    self.union_apply_list = {}
    for i,v in ipairs(data_list) do
        self.union_apply_list[getNorKey(v.lid, v.lsrv_id)] = v
    end
    EventManager:getInstance():Fire(UnionEvent.UpdateApplyListInfo)
    self:clearApplyRedStatus()
end

--==============================--
--desc:处理完成某个玩家申请请求之后，在总的申请列表中删除这个数据
--@lid:
--@lsrv_id:
--@return 
--==============================--
function UnionModel:deleteApplyInfo(lid, lsrv_id)
    if self.union_apply_list[getNorKey(lid, lsrv_id)] ~= nil then
        self.union_apply_list[getNorKey(lid, lsrv_id)] = nil
        EventManager:getInstance():Fire(UnionEvent.UpdateApplyListInfo)
        self:clearApplyRedStatus()
    end
end

--==============================--
--desc:清楚公会申请红点状态
--@return 
--==============================--
function UnionModel:clearApplyRedStatus()
    if tableLen(self.union_apply_list) == 0 then
        self:updateUnionRedStatus(UnionConst.red_index.apply, false)
    end 
end

--==============================--
--desc:获取当前申请列表，按照在线，战力以及vip等级从打到小排序
--@return 
--==============================--
function UnionModel:getUnionApplyList()
    local apply_list = {}
    for k,v in pairs(self.union_apply_list) do
        table_insert(apply_list, v)
    end
    -- 做一个排序吧
    if #apply_list > 1 then
        local sort_func = SortTools.tableUpperSorter({"is_online", "power", "vip_lev"})
        table_sort(apply_list, sort_func) 
    end
    return apply_list
end

--==============================--
--desc:处理公会红点的状态
--@type:
--@status:
--@return 
--==============================--
function UnionModel:updateUnionRedStatus(type, status)
    local base_data = Config.FunctionData.data_base
    local bool = MainuiController:getInstance():checkIsOpenByActivate(base_data[5].activate)
    if bool == false then return end

    local _status = self.union_red_status_list[type]
    if _status == status then return end

	self.union_red_status_list[type] = status

    if type ~= UnionConst.red_index.notice and type ~= UnionConst.red_index.skill_2 and type ~= UnionConst.red_index.skill_3 and 
    type ~= UnionConst.red_index.skill_4 and type ~= UnionConst.red_index.skill_5 and 
    type ~= UnionConst.red_index.pvp_skill_2 and type ~= UnionConst.red_index.pvp_skill_3 and 
    type ~= UnionConst.red_index.pvp_skill_4 and type ~= UnionConst.red_index.pvp_skill_5 then --公会日志、技能不需要更新公会UI红点
        -- 更新场景红点状态
        GhostdomController:getInstance():setBuildRedStatus(GhostdomConst.Build_Type.union, {bid = type, status = status})
    end

    -- 事件用于同步更新公会主ui的红点
    EventManager:getInstance():Fire(UnionEvent.UpdateUnionRedStatus, type, status)
end

--联盟活跃红点
function UnionModel:updataUnionActionRedStatus(data)
    self.goal_data = data
    local red = false
    local lev_data = Config.UnionQuestData.data_lev_data
    if data.lev < #lev_data and data.exp >= lev_data[data.lev].exp then
        red = true
    end
    GhostdomController:getInstance():setBuildRedStatus(GhostdomConst.Build_Type.union, {bid = UnionConst.red_index.goal_action, status = red})

    self:updateUnionRedStatus(UnionConst.red_index.goal_action, red)
end

function UnionModel:getGoalRedStatus()
    if self.goal_data == nil or not next(self.goal_data) then return end
    local status = false
    local lev_data = Config.UnionQuestData.data_lev_data
    if self.goal_data.lev < #lev_data and self.goal_data.exp >= lev_data[self.goal_data.lev].exp then
        status = true
    end
    return status
end

-- 获取公会活跃等级
function UnionModel:getUnionActiveLev(  )
    if self.goal_data then
        return self.goal_data.lev or 0
    end
    return 0
end

--==============================--
--desc:判断某个类型的红点状态
--@type:
--@return 
--==============================--
function UnionModel:getRedStatus(type)
    return self.union_red_status_list[type]
end

--==============================--
--desc:判断是否有捐献红点
--@return 
--==============================--
function UnionModel:getDonateRedStatus()
    local status = self:getRedStatus(UnionConst.red_index.donate)
    if status == true then 
        return status
    end
    status = self:getRedStatus(UnionConst.red_index.donate_activity)
    return status
end

--==============================--
--desc:捐献活跃宝箱情况
--@boxes:
--@donate_exp:
--@return 
--==============================--
function UnionModel:updateDonateBoxInfo(boxes, donate_exp)
    self.union_donate_activity_list = {}
    self.union_donate_activity = donate_exp     -- 当前公会捐献活跃度
    for i,v in ipairs(boxes) do
        self.union_donate_activity_list[v.box_id] = true
    end
    self:checkDonateActivity()
end

--==============================--
--desc:设置某个捐献宝箱的状态
--@box_id:
--@return 
--==============================--
function UnionModel:setDonateBoxStatus(box_id)
    if self.union_donate_activity_list == nil then
        self.union_donate_activity_list = {}
    end
    self.union_donate_activity_list[box_id] = true
    EventManager:getInstance():Fire(UnionEvent.UpdateDonateBoxStatus, box_id)
    self:checkDonateActivity()
end

--==============================--
--desc:别人捐献的时候更新当前捐献进度,可能同步会有红点提示
--@value:
--@return 
--==============================--
function UnionModel:updateDonateActivity(value)
    self.union_donate_activity = value
    EventManager:getInstance():Fire(UnionEvent.UpdateDonateBoxStatus)
    self:checkDonateActivity()
end

--==============================--
--desc:监测是否有公会捐献活跃宝箱
--@return 
--==============================--
function UnionModel:checkDonateActivity()
    local activity = self.union_donate_activity or 0
    local red_status = false
    for i, v in ipairs(Config.UnionData.data_donate_box) do
        if activity >= v.box_val and (not self.union_donate_activity_list[i]) then
            red_status = true
            break
        end
    end 
    self:updateUnionRedStatus(UnionConst.red_index.donate_activity, red_status)
end

--==============================--
--desc:返回捐献活跃度的值
--@return 
--==============================--
function UnionModel:getDonateActivityValue()
    return self.union_donate_activity or 0
end

--==============================--
--desc:获取捐献宝箱状态
--@id:
--@return 
--==============================--
function UnionModel:getDonateBoxStatus(id)
    return self.union_donate_activity_list[id]
end

--==============================--
--desc:公会日志列表
--@return 
--==============================--
function UnionModel:initUnionNoticeList(data_list)
    if not data_list then return end

    self.union_notice_list = {}
    for i,v in ipairs(data_list) do
        local key = TimeTool.getMD3(v.time) -- X月-X日
        if not self.union_notice_list[key] then
            self.union_notice_list[key] = {}
        end
        local notice_vo =  UnionNoticeVo.New()
        notice_vo:updateData(v)
        table_insert(self.union_notice_list[key], notice_vo)
    end
    EventManager:getInstance():Fire(UnionEvent.UpdateUnionNoticeList)
end

function UnionModel:getUnionNoticeList(show_type)
    local show_type = show_type
    local list, temp_list = {}, {}
    local key_list = {}
    for day,item in pairs(self.union_notice_list) do
        table_insert(key_list, TimeTool.getMixTime(day))
        for _,data in pairs(item) do
            if not list[day] then
                list[day] = {}
            end
            if show_type == UnionConst.show_type.all then
                table_insert(list[day], data)
            else
                if data.type == show_type then
                    table_insert(list[day], data)
                end
            end
        end
        if next(list[day]) == nil then
            list[day] = nil
        end
    end
    for _,v in pairs(list) do
        if #v > 1 then
            table.sort(v, SortTools.KeyUpperSorter("time"))
        end
    end
    table_sort(key_list, function(a, b)
        if tonumber(a) > tonumber(b) then 
            return true
        end
        return false
    end)
    for _,value in pairs(key_list) do
        local value = TimeTool.getSplitTime(value)
        if list[value] and next(list[value]) ~= nil then
            table_insert(temp_list, list[value])
        end
    end
    return temp_list
end

--==============================--
--desc:新增公会日志
--@return 
--==============================--
function UnionModel:addUnionNoticeItem(data_list)
    if not data_list or next(data_list) == nil then return end
    for i,v in ipairs(data_list) do
        local key = TimeTool.getMD3(v.time) -- X月-X日
        if not self.union_notice_list[key] then
            self.union_notice_list[key] = {}
        end
        local notice_vo =  UnionNoticeVo.New()
        notice_vo:updateData(v)
        table_insert(self.union_notice_list[key], notice_vo)
    end
    EventManager:getInstance():Fire(UnionEvent.UpdateUnionNoticeList)
end

function UnionModel:__delete()
end

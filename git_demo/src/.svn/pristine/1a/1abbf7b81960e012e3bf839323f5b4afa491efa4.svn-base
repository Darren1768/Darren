--[[
* 类注释写在这里-----------------
* @author {AUTHOR}
]]
LeagueExploreModel = LeagueExploreModel or BaseClass()

function LeagueExploreModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function LeagueExploreModel:config()
    self.base_data = {}
    self.role_vo = RoleController:getInstance():getRoleVo()

    self.step_status = 0 -- 当前阶段 0:未开启 1:报名中 2：开战前准备 3战斗中 4:结束
    self.resource_id = 0 -- 资源id

    self.current_resource = {} -- 当前报名资源信息

    self.embattled_list = {}  -- 查看布阵列表
    self.member_list = {}  --盟主/副盟主布阵 信息查看
    self.member_list_had = {}  --盟主/副盟主 已上阵
    self.member_list_unhad = {}  --盟主/副盟主 未上阵


    self.battle_result_data = {} --战斗结果界面数据
    self.def_embattled_data  = {} --战斗结果界面防御布阵数据
    self.atk_embattled_data  = {} --战斗结果界面进攻布阵数据
    self.atk_last_member=0
    self.def_last_member=0        -- 存活人数

    self.atk_rank_data = {}        -- 本次攻方积分排行 29307
    self.team_data_list = {}        -- 本次攻方积分排行 29308


    self.video_list = {}            -- 视频列表

    self.is_sign = false             -- 联盟是否已报名
end

-- 阶段
function LeagueExploreModel:setStepStatus(step_status)
    self.step_status = step_status
end 

function LeagueExploreModel:getStepStatus()
    return  self.step_status 
end 

-- 资源id
function LeagueExploreModel:setResourceID(id)
    self.resource_id = id 
end 

function LeagueExploreModel:getResourceID()
    return  self.resource_id 
end 

function LeagueExploreModel:setBaseData(data)
    self.base_data ={}
    self.current_resource={}
    if not data then 
        return
    end 
    self.base_data = data 
    self:setStepStatus(self.base_data.step_status)
    self.is_sign = false
    -- 有申请时
    for i,v in ipairs(self.base_data.resources)  do  
        if v.is_apply  == 1 then 
            self.is_sign = true
            self.current_resource = v 
            self:setResourceID(self.current_resource.id)
        end
        -- if v.league_id ~= 0 and v.league_srv_id == self.role_vo.lsrv_id and v.league_id==self.role_vo.lid then 
        --     self.current_resource = v 
        --     self:setResourceID(self.current_resource.id)
        -- end 
    end 

end

-- 根据id 获取资源数据
function LeagueExploreModel:getResourceDataByID(id)
  
    -- 有申请时
    for i,v in ipairs(self.base_data.resources)  do  
        if v.id   == id  then 
            return v 
        end 
    end 

    return nil 
end


function LeagueExploreModel:getBaseData()
    return self.base_data
end

-- 放弃资源点成功后成功后刷新数据
function LeagueExploreModel:updateGaveUpDataByID(id)
    for i,v in ipairs(self.base_data.resources)  do  
        if v.id == id then 
            v.league_name = ""
            v.league_srv_id = ""
            v.league_id = 0
            v.occupy_time = 0
            return
        end
    end 
end

-- 报名成功后刷新数据
function LeagueExploreModel:updateApplyDataByID(id)
    for i,v in ipairs(self.base_data.resources)  do  
        if v.id == id then 
            v.is_apply = 1 
            self.is_sign = true
            self.current_resource = v
            self:setResourceID(self.current_resource.id)
            return
        end
    end 
end

function LeagueExploreModel:isSign()
    return self.is_sign
end 


function LeagueExploreModel:isOpen()
    if  self.step_status==0 then 
        return false
    end 
    return true
end


function LeagueExploreModel:getCurrentResource()
    return self.current_resource
end


-- 获取是 攻防类型 只有占领方是 0 防守   
function LeagueExploreModel:getCurrentType()
    self.role_vo = RoleController:getInstance():getRoleVo()
    if self.role_vo.lid == self.current_resource.league_id  and  self.current_resource.league_id~=0 then 
        return 0
    end 
    return 1
end



-- 得到当前对位类型
function LeagueExploreModel:getParaPos()
    print("-----------getParaPos----------------")
    printLuaTable(self.current_resource)
    if self.current_resource and self.current_resource.id then 
       local _pos =  Config.LeagueExploreData.data_resource_data[self.current_resource.id].para_pos
       return _pos
    end
    return 0
end

--- 布阵
--布阵列表
function LeagueExploreModel:setTeamEmbattled(data)
    self.embattled_list = {} 
    for i,v in pairs(data.embattled) do 
        self.embattled_list[v.pos] = v 
    end 
end
function LeagueExploreModel:getTeamEmbattledByPos(pos)
    if  self.role_vo.league_position == UnionConst.post_type.leader or   self.role_vo.league_position == UnionConst.post_type.assistant then 
       return  self.member_list_had[pos]
    end 
    return self.embattled_list[pos]
end

-- 盟主/副盟主查看已方布阵信息
function LeagueExploreModel:setTeamMemberList(data)
    self.member_list={}
    self.member_list = data
    -- 按战力从高往底排 
    table.sort(self.member_list.members, SortTools.KeyUpperSorter("power"))

    self.member_list_had ={}
    self.member_list_unhad ={}
    local _list = data.members
    if #_list > 0 then 
        for i,v in pairs(data.members) do 
            if v.pos > 1000 then 
                self.member_list_had[v.pos] = v  
            else
                table.insert(self.member_list_unhad,v)
            end
        end 
    end 
end

-- 获取上阵时人员列表
function LeagueExploreModel:getTeamMemberList()
    local _res = {}
    _res =deepCopy(self.member_list_unhad)
    for i,v in pairs(self.member_list_had) do 
        table.insert(_res,v)
    end 
    return _res 
end

-- 布阵选择位置
function LeagueExploreModel:setCurrentTeamPos(pos)
    self.pos_team = pos 
end

function LeagueExploreModel:getCurrentTeamPos()
    return self.pos_team or 1001
end

function LeagueExploreModel:getUpTeamData(id)
     
   return self.member_list.members[id]
     
end

--- 查看已占领所有资源奖励领取状态 

function LeagueExploreModel:updateReceiceData(data)
    -- self.receive_status_data = {}
    -- if not data then return end 
    -- if data and next(data.status ) ~=nil then 
    --     for i,v in pairs(data.status) do 
    --         self.receive_status_data[v.id] = v 
    --     end 
    -- end 
 end 

 
function LeagueExploreModel:getReceiceDataByID(id)
    return self.receive_status_data[id]
 end 



-- 战斗结果界面数据----------------------------------
function LeagueExploreModel:setBattleBaseResultData(data )
    self.battle_result_data = data 
    self.def_embattled_data={}
    self.atk_embattled_data={}
    -- 计算剩余人数
    local _atk_last_member = 0  
    local _def_last_member = 0  

    if #data.def_embattled > 0 then 
        for i,v in pairs(data.def_embattled) do 
            if v.pos > 1000 then 
                self.def_embattled_data[v.pos] = v
                if v.status ==1 then 
                    _def_last_member = _def_last_member+1
                end
            end
        end 
    end 
    if #data.atk_embattled > 0 then 
        for i,v in pairs(data.atk_embattled) do 
            if v.pos > 1000 then 
                self.atk_embattled_data[v.pos] = v
                if v.status ==1 then 
                    _atk_last_member = _atk_last_member+1
                end
            end
        end 
    end 

   self.atk_last_member=_atk_last_member
   self.def_last_member=_def_last_member

end



function LeagueExploreModel:getBattleBaseResultData()
    return self.battle_result_data 
end
-- 获取防御队伍数据
function LeagueExploreModel:getDefEmbattleDataByPos(pos)
   return  self.def_embattled_data[pos]
end 
-- 获取进攻队伍数据
function LeagueExploreModel:getAtkEmbattleDataByPos(pos )
    return  self.atk_embattled_data[pos]
end 
-- 战斗获取当前阶段
function LeagueExploreModel:getCurrentStep()
    return  self.battle_result_data.step
end 


-- -- 获取进攻剩余人数
function LeagueExploreModel:getAtkLastMember()
    return   self.atk_last_member
end 
function LeagueExploreModel:getDefLastMember()
    return   self.def_last_member
end 



-- -- 29307
function LeagueExploreModel:setAtkRankData(data)
    self.atk_rank_data = data 
end 
function LeagueExploreModel:getAtkBaseRankData()
    return   self.atk_rank_data
end 
--对数据进行排序
function LeagueExploreModel:getAtkRankData()

    local _data = self.atk_rank_data.league_rank
    local sort_fun = SortTools.tableUpperSorter({"score"}) 
    table.sort(_data, sort_fun)
    return _data 
end 


-- -- 29308
function LeagueExploreModel:setTeamRankData(data)
    self.team_data_list = data 
end 
function LeagueExploreModel:getTeamRankData()
    return   self.team_data_list
end 

--判断我是否上阵
function LeagueExploreModel:isBattle()
    local role_vo = RoleController:getInstance():getRoleVo()
    local _data = self.team_data_list.atk_embattled
    for i,v in  ipairs(_data) do 
        if role_vo.rid == v.rid and role_vo.srv_id == v.srv_id then 
            return true
        end 
    end
    return false 
end 
--对数据进行排序
function LeagueExploreModel:getScoreRankData()

  
    local _data = self.team_data_list.atk_embattled
  
    local sort_fun = SortTools.tableUpperSorter({"score"}) 
    table.sort(_data, sort_fun)
    return _data 
end 

-- 视频列表
function LeagueExploreModel:setVideoData(data)
    self.video_list = data 
end 
function LeagueExploreModel:getVideoData()
    return   self.video_list
end 
function LeagueExploreModel:setVideoPoint( point )
    -- self.video_position = {}
    -- self.video_position.pos = pos 
    -- self.video_position.point = point 
    self.video_point = point
end 
function LeagueExploreModel:getVideoPos()
    return self.video_point
end 
--获取积分排行前三个
function LeagueExploreModel:getRaknRoleTopThreeList(rank_list)
    local list = {{rank = 1, atk_league_name = TI18N("虚位以待")}, {rank = 2, atk_league_name = TI18N("虚位以待")}, {rank = 3, atk_league_name = TI18N("虚位以待")}}
   
   
    if rank_list and next(rank_list or {}) ~= nil then
        for i, v in ipairs(rank_list) do
            for i2, v1 in ipairs(list) do
                if v.rank == v1.rank then
                    list[i2] = v
                end
            end
        end
    end
    return list
end

function LeagueExploreModel:__delete()
end

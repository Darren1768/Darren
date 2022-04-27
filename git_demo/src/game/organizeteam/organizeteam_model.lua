-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
OrganizeModel = OrganizeModel or BaseClass()

function OrganizeModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function OrganizeModel:config()
	self.my_team_list = {}		-- 我的队伍
	self.add_team_list = {}		-- 加入队伍
	self.get_team_list = {}		 -- 招募

    self.apply_team_list = {}    --申请 邀请列表

    self.notice_team_list = {}    --日志

end
-- 我的队伍
function OrganizeModel:setMyTeamData(data)
	self.my_team_list = data 
end

function OrganizeModel:getMyTeamData(data)
    return self.my_team_list 
end


function OrganizeModel:getMyTeamLev()
    return self.my_team_list.lev  
end
function OrganizeModel:updateMyListData(data)
    return self.my_team_list 
end



--- 加入队伍数据
function OrganizeModel:setaddListData(data)
    self.add_team_list={}
    self.add_team_list = data 
end 

function OrganizeModel:getaddListData(data)
    return self.add_team_list 
end 

function OrganizeModel:updateaddListData(data)

    for i,v in pairs(self.add_team_list) do 
        if data.htid == v.htid and data.htsrd_id == v.htsrd_id then 
            v.is_apply=1
            return
        end 
    end 
end 

function OrganizeModel:getaddListDataIndex(data)

    for i,v in pairs(self.add_team_list) do 
        if data.htid == v.htid and data.htsrd_id == v.htsrd_id then 
            return i 
            
        end 
    end 
    return 0
end 

--- 招募队伍数据
function OrganizeModel:setgetListData(data)
    self.get_team_list = {}	
    self.get_team_list = data 
end 

function OrganizeModel:getgetListData(data)
    return self.get_team_list 
end 

function OrganizeModel:updategetListData(data)

    for i,v in pairs(self.get_team_list) do 
        if data.rid == v.rid  and data.srd_id == v.srd_id then 
            v.is_invite=1
            return
        end 
    end 
end 
function OrganizeModel:getgetListDataIndex(data)

    for i,v in pairs(self.get_team_list) do 
        if data.rid == v.rid  and data.srd_id == v.srd_id then 
            return i 
            
        end 
    end 
    return 0
end 

-- 日志
function OrganizeModel:setNoticeListData(data)
    self.notice_team_list={}
    self.notice_team_list = data 
end 

function OrganizeModel:getNoticeListData(data)
    return self.notice_team_list
end 

function OrganizeModel:updateNoticeListData(data)

    -- for i,v in pairs(self.get_team_list) do 
    --     if data.rid == v.rid  and data.srd_id == v.srd_id then 
    --         v.is_invite=1
    --         return
    --     end 
    -- end 
end 


--*************************** 支援 *************************************
--[[
    @desc: 已派遣的伙伴信息
    author:{author}
    time:2018-08-20 14:42:39
    --@data: 
    @return:
]]
function OrganizeModel:setSendPartnerData(data)
    self.send_partner = data
    EventManager:getInstance():Fire(OrganizeEvent.UPDATA_SENDPARTNER_DATA, data)
    -- self:checkRedPoint()
 end
 
 function OrganizeModel:getSendPartnerData()
     if self.send_partner and next(self.send_partner or {}) ~= nil then
         return self.send_partner
     end
 end
 
 --[[
     @desc: 可雇佣伙伴的信息
     author:{author}
     time:2018-08-20 15:27:20
     --@data: 
     @return:
 ]]
 function OrganizeModel:setHirePartnerData(data)
     self.hire_partner_list = data
     EventManager:getInstance():Fire(OrganizeEvent.UPDATA_HIREPARNER_DATA, data)
 end
 
 function OrganizeModel:getHirePartnerData()
     if self.hire_partner_list and next(self.hire_partner_list or {}) ~= nil then
         return self.hire_partner_list
     end
 end
 
 --[[
     @desc: 已雇佣的伙伴列表
     author:{author}
     time:2018-08-20 17:57:28
     @return:
 ]]
 function OrganizeModel:setHasHirePartnerData(data)
     self.has_hire_partner_list = data
     EventManager:getInstance():Fire(OrganizeEvent.UPDATA_HASHIREPARNER_DATA, data)
 end
 
 function OrganizeModel:getHasHirePartnerData()
     if self.has_hire_partner_list and next(self.has_hire_partner_list or {}) ~= nil then
         return self.has_hire_partner_list
     end
 end
 


 function OrganizeModel:getHelpShow(lev)
     local  _config = Config.RelationData.data_appoint_num
     for k,v in pairs(_config) do  
         
         if lev < v.lev then 
            return v 
         end 
     end
     return nil 
 end 


function OrganizeModel:__delete()
end
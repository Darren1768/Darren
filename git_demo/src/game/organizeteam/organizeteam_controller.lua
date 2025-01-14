-- -- --------------------------------------------------------------------
-- -- 这里填写简要说明(必填),
-- --
-- -- @description:
-- --     好友协议和逻辑控制层
-- -- --------------------------------------------------------------------
OrganizeController = OrganizeController or BaseClass(BaseController)


function OrganizeController:config()
    self.pri_list = {}            --私聊聊天条数
    self.model = OrganizeModel.New(self)
    self.dispather = EventManager:getInstance()
end

function OrganizeController:getModel()
    return self.model
end



function OrganizeController:registerEvents()
    -- if self.login_success == nil then
    --     self.login_success = self.dispather:Bind(EventId.ROLE_CREATE_SUCCESS, self, function ()
    --         self:friendList()
    --         -- self:getBlackList()
            
    --         GlobalTimeTicket:getInstance():add(function()
    --             self:updateFriendTishi()
    --         end, 1, 1) 
    --     end)
    -- end

    -- EventManager:getInstance():Bind(FriendEvent.REQUEST_LIST,self,function()
    --         self:friendList()
    --         self:getBlackList()
    --     end)
    
end

function OrganizeController:registerProtocals()
    self:RegisterProtocal(29600, "handle29600")       --获取挂机队伍列表
    self:RegisterProtocal(29601, "handle29601")       --申请加入挂机队伍
    
    self:RegisterProtocal(29602, "handle29602")       --同意或者拒绝加入挂机队伍
    self:RegisterProtocal(29604, "handle29604")       --挂机队伍踢人
    self:RegisterProtocal(29605, "handle29605")       --退出挂机队伍
    self:RegisterProtocal(29606, "handle29606")       --我的列表获取本挂机队伍基本信息

    self:RegisterProtocal(29609, "handle29609")       --招募队友
    self:RegisterProtocal(29610, "handle29610")       --招募  获取可邀请玩家列表
    self:RegisterProtocal(29611, "handle29611")       --招募 

    self:RegisterProtocal(29612, "handle29612")       --同意或者拒绝邀请

    self:RegisterProtocal(29614, "handle29614")       -- 我的红点

    self:RegisterProtocal(29615, "handle29615")       -- 队伍日志
    self:RegisterProtocal(29616, "handle29616")       -- 推送新日志

    
    -- 支援
    self:RegisterProtocal(29701, "handle29701")       -- 已派出伙伴信息
    self:RegisterProtocal(29702, "handle29702")       -- 已雇佣伙伴信息结果
    self:RegisterProtocal(29703, "handle29703")       -- 派出伙伴
    self:RegisterProtocal(29704, "handle29704")       -- 镜像数据
    self:RegisterProtocal(29705, "handle29705")       -- 取消派出伙伴

end


-- --获取挂机队伍列表
function OrganizeController:sender29600(data)
    
    local protocal = {}
    protocal.page = data.page
    protocal.tab =data.tab 
    protocal.sort = data.sort
    protocal.flag = data.flag
    protocal.name = data.name 
    protocal.num = 0
    print("------------------sender29600--------------------")
    printLuaTable(protocal)
    self:SendProtocal(29600,protocal)
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29600(data)
    -- print("data.period....... ",data.period)
    print("-----------------handle29600---------------------")
    printLuaTable(data)
    self.model:setaddListData(data.hook_team_teams)
    EventManager:getInstance():Fire(OrganizeEvent.Update_AddTeam_Data_List,data)

end

-- --申请加入挂机队伍
function OrganizeController:sender29601(htid,htsrv_id , type )
    local protocal = {}
    protocal.htid = htid
    protocal.htsrv_id= htsrv_id
    protocal.type =type -- 1 申请， 2 取消申请
    printLuaTable(protocal)
    self:SendProtocal(29601,protocal)
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29601(data)
    -- print("data.period....... ",data.period)
    message(data.msg)
    print("-----------------handle29601---------------------")
    printLuaTable(data)
    if data.code ==1 then 
        self.model:updateaddListData(data)
        EventManager:getInstance():Fire(OrganizeEvent.Update_Apply_Team_Success,data)
    end 
end

-- --任务信息
function OrganizeController:sender29602(rid,srv_id , type )
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id= srv_id
    protocal.type =type -- 1 同意， 2 拒绝
    self:SendProtocal(29602, protocal)
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29602(data)
    message(data.msg)
end



-- --我的列表获取本挂机队伍基本信息
function OrganizeController:sender29604(rid,srv_id)
    print("-----------------sender29604---------------------")
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id =srv_id
    self:SendProtocal(29604, protocal)
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29604(data)
    -- print("data.period....... ",data.period)
    print("-----------------handle29604---------------------")
    printLuaTable(data)
    if data.code ==1 then 
        self.model:updateMyListData(data)
        EventManager:getInstance():Fire(OrganizeEvent.Update_Delect_Team_Data_List)
    end 
end

-- --我的列表获取本挂机队伍基本信息
function OrganizeController:sender29605()
    print("-----------------sender29605---------------------")
    self:SendProtocal(29605, {})
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29605(data)
    -- print("data.period....... ",data.period)
    print("-----------------handle29605---------------------")
    printLuaTable(data)
end
-- --我的列表获取本挂机队伍基本信息
function OrganizeController:sender29606()
    print("-----------------sender29606---------------------")

    self:SendProtocal(29606, {})
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29606(data)
    -- print("data.period....... ",data.period)
    print("-----------------handle29606---------------------")
    printLuaTable(data)
    self.model:setMyTeamData(data)
    EventManager:getInstance():Fire(OrganizeEvent.Update_MyTeam_Data_List,data)
    
end


-- --我的列表获取本挂机队伍基本信息
function OrganizeController:sender29609()
    print("-----------------sender29609---------------------")


    self:SendProtocal(29609, {})
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29609(data)
    -- print("data.period....... ",data.period)
    print("-----------------handle29609---------------------")
    printLuaTable(data)
    message(data.msg)
    
end

-- --获取可邀请玩家列表
function OrganizeController:sender29610(data)
    print("-----------------sender29610---------------------")
    local protocal = {}
    protocal.page = data.page
    protocal.tab =data.tab 
    protocal.sort = data.sort
    protocal.name = data.name 
    protocal.flag = data.flag
    protocal.num = 0
    printLuaTable(protocal)

    self:SendProtocal(29610, protocal)
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29610(data)
    -- print("data.period....... ",data.period)
    print("-----------------handle29610---------------")
    printLuaTable(data)
    message(data.msg)
    self.model:setgetListData(data.invite_list)
    EventManager:getInstance():Fire(OrganizeEvent.Update_GetTeam_Data_List,data)
    
end


-- --我的列表获取本挂机队伍基本信息
function OrganizeController:sender29611(rid,srv_id)
    print("-----------------sender29611---------------------")
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id =srv_id
    printLuaTable(protocal)

    self:SendProtocal(29611,protocal)
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29611(data)
    -- print("data.period....... ",data.period)
    print("-----------------handle29611---------------------")
    printLuaTable(data)
    message(data.msg)

    if data.code ==1 then 
        self.model:updategetListData(data)
        EventManager:getInstance():Fire(OrganizeEvent.Update_Get_Team_Success,data)
    end 
end

-- --邀请
function OrganizeController:sender29612(rid,srv_id , type )
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id= srv_id
    protocal.type =type -- 1 同意 0 拒绝
    self:SendProtocal(29612, protocal)
end
-- --[[
-- 由于第三期的界面改动比较大，所以相对应的有些界面就特殊去处理
-- ]]
function OrganizeController:handle29612(data)
    message(data.msg)
end



--我的队伍红点 挂机队伍红点，当前只用于申请/邀请列表
function OrganizeController:sender29614()
    self:SendProtocal(29614, {})
end

function OrganizeController:handle29614(data)
    print("-----------------handle29614---------------------")
    printLuaTable(data)
    EventManager:getInstance():Fire(OrganizeEvent.Update_My_Team_Red_Status,data)

end

--挂机队伍日志
function OrganizeController:sender29615()
    self:SendProtocal(29615, {})
end

function OrganizeController:handle29615(data)
    print("-----------------handle29615---------------------")
    printLuaTable(data)
    self.model:setNoticeListData(data)
    EventManager:getInstance():Fire(OrganizeEvent.Update_Team_Notice_Data,data)
end


--推送新日志
function OrganizeController:sender29616()
    self:SendProtocal(29616, {})
end

function OrganizeController:handle29616(data)
    print("-----------------handle29616---------------------")
    printLuaTable(data)
end


-- *****************************支援****************************************************
-- 已派出伙伴信息-
function OrganizeController:sender29701()
    self:SendProtocal(29701, {})
end

function OrganizeController:handle29701(data)
    print("-----------------handle29701---------------------")
    printLuaTable(data)
    if data then 
        self.model:setSendPartnerData(data)
    end 
end
-- 已雇佣伙伴信息
function OrganizeController:sender29702()
    self:SendProtocal(29702, {})
end

function OrganizeController:handle29702(data)
    print("-----------------handle29702---------------------")
    printLuaTable(data)
    if data then 
       self.model:setHirePartnerData(data)
    end 
end

--派出伙伴
function OrganizeController:sender29703(id)
    local protocal = {}
    protocal.id = id

    self:SendProtocal(29703, protocal)
end

function OrganizeController:handle29703(data)
    print("-----------------handle29703---------------------")
    printLuaTable(data)
    message(data.msg)
    if data.code == 1 then
        EventManager:getInstance():Fire(OrganizeEvent.UPDATA_SENDPARTNER_SUCESS_DATA ,data)
    end
end

--镜像数据
function OrganizeController:sender29704(type,pid_list)
    print("-----------------sender29704---------------------")
    local protocal = {}
    protocal.type = type
    protocal.pid_list = pid_list
    printLuaTable(protocal)
    self:SendProtocal(29704, protocal)
end

function OrganizeController:handle29704(data)
    print("-----------------handle29704---------------------")
    printLuaTable(data)
end
-- local is_can_employ = model:getShowTeamZhiYuanByFormType(self.fun_form_type)

function OrganizeController:sender29705(id)
    local protocal = {}
    protocal.id = id
    self:SendProtocal(29705, protocal)
end

function OrganizeController:handle29705(data)
    print("-----------------handle29705---------------------")
    printLuaTable(data)
    message(data.msg)
    EventManager:getInstance():Fire(OrganizeEvent.UPDATA_ZHIYUAN_DOWN_SUCESS_DATA )

  
end


-- --好友体力领取 赠送 code: 0 赠送 ，1领取
-- function OrganizeController:sender_13316(code, rid, srv_id)
--     local protocal = {}
--     protocal.rid = rid
--     protocal.srv_id = srv_id
--     protocal.code = code
--     self:SendProtocal(13316, protocal)
   
-- end

-- function OrganizeController:strengthHandler(data)
--     if data.code == 1 then
--         self.model:setFriendPresentCount(data.present_count)
--         self.model:setFriendDrawCount(data.draw_count)

--         local vo = self.model:updateVo(data.srv_id,data.rid,"is_draw",data.is_draw)
--         local vo = self.model:updateVo(data.srv_id,data.rid,"is_present",data.is_present)

--        EventManager:getInstance():Fire(FriendEvent.STRENGTH_UPDATE, {list={vo}})
--        EventManager:getInstance():Fire(FriendEvent.Update_Red_Point)
--     end
--     message(data.msg)
-- end

--竖版好友主界面
function OrganizeController:openOrganizeTeamWindow(bool,index)
    if bool == true then 
        if not self.organize_window  then
            self.organize_window = OrganizeTeamMainWindow.New()
        end
        self.organize_window:open(index)
    else
        if self.organize_window then 
            self.organize_window:close()
            self.organize_window = nil
        end
    end
end

function OrganizeController:ChangeOrganizeTeamWindow(index)
    if  self.organize_window  then
         self.organize_window:setSelecteTab(index,false,cc.c3b(168,150,121),cc.c3b(250,232,150))
    end
end 

--- 打开队伍支援界面
function OrganizeController:openOrganizeHelpWindow(status)

    if status == true then 
        if not  self.organizehelp_window then 
           self.organizehelp_window = OrganizeTeamFriendHelpWindow.New()
        end 
        self.organizehelp_window:open()
    else
        if self.organizehelp_window then 
            self.organizehelp_window:close()
            self.organizehelp_window = nil
        end

    end 
end



function OrganizeController:closeOrganizeTeamSelectPanel()
    self.video_select_panel:close()
end

--@is_middle 是否居中显示
function OrganizeController:openOrganizeTeamSelectPanel(list ,point,delay  , is_middle,selectIndex,type)
    if self.video_select_panel ~= nil then
       self.video_select_panel:close()
       self.video_select_panel = nil
    end
    self.video_select_panel = OrganizeTeamSelectPanel.New(delay,selectIndex,type)
    self.video_select_panel:open()
    self:adjustTipsPosition1(self.video_select_panel, point, nil, false)
    table.insert({}, self.video_select_panel)
    return self.video_select_panel
end


--位置调整(现在某认为显示的tips的anchorPoint的为cc.p(0, 1)自己主动的去设)
function OrganizeController:adjustTipsPosition1(target, point, view_size, is_middle)
    local win_size = cc.size(SCREEN_WIDTH,SCREEN_HEIGHT)                 -- 父节点的尺寸
    local temp_size = cc.size(180,110)      -- 对象的除此你,这里的对象都是0,0的锚点
    local size = cc.size(temp_size.width, temp_size.height)
    local offset_height = 10                                             -- 偏移值

    local parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)
    local local_pos = parent:convertToNodeSpace(point)
    local start_x = local_pos.x
    local start_y = local_pos.y

    if start_x + size.width > win_size.width then
        start_x = win_size.width - size.width
    elseif start_x < size.width then
        start_x = start_x + 20
    end
    if is_middle then
        start_x = (win_size.width - size.width)/2
    end

    if start_y > win_size.height then
        start_y = win_size.height 
    elseif start_y < size.height then
        start_y = start_y + size.height + 20
    else 
        start_y = start_y 
    end
    start_x= start_x-17
    start_y= start_y+880
    target:setPosition(start_x, start_y-display.getBottom())
end



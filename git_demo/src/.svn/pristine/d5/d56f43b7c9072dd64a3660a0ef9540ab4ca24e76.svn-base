-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
LeagueExploreController = LeagueExploreController or BaseClass(BaseController)

function LeagueExploreController:config()
    self.dispather = EventManager:getInstance()
    self.model = LeagueExploreModel.New(self)

    self.allRedDatas = {}
end

function LeagueExploreController:registerEvents()
    EventManager:getInstance():Bind(LeagueExploreEvent.Updata_Step_Change_Data,self,function(step_status)
        print("-----------------Updata_Step_Change_Data----------1-----------",step_status)
        -- if step_status ~= 3 and step_status ~= 4 then 
        --     if self.league_explore_result_window and self.league_explore_result_window:isOpen() == true then
        --         self:openLeagueExploreResultWindow(false)
        --         self:openMainScene(true)
        --     end
        -- end 
        if step_status == 3  then 
            if self.league_main_window and self.league_main_window:isOpen() == true then
                local _parapos = self.model:getParaPos()
                if _parapos~=0 then
                    self:openMainScene(false)
                    self:openLeagueExploreResultWindow(true)
                end 
            end
        end 

        self:upDateRedStatus()

       
    end)
  
end

function LeagueExploreController:registerProtocals()

    self:RegisterProtocal(29300, "handle29300")     --请求探索历练界面数据 0:未开启 1:报名中 2：开战前准备 3战斗中 4:结果展示
    self:RegisterProtocal(29301, "handle29301")     --报名
    self:RegisterProtocal(29302, "handle29302")     --放弃资源点
    self:RegisterProtocal(29303, "handle29303")     --布阵
    self:RegisterProtocal(29304, "handle29304")     --查看己方布阵信息
    self:RegisterProtocal(29305, "handle29305")     --盟主/副盟主查看己方布阵信息
    self:RegisterProtocal(29306, "handle29306")     --本联盟战斗过程数据查看
    self:RegisterProtocal(29307, "handle29307")     --查看上次战斗积分排行
    self:RegisterProtocal(29308, "handle29308")     --查看上次战斗双方布阵数据
    self:RegisterProtocal(29309, "handle29309")     --探索历练状态通知 
    self:RegisterProtocal(29310, "handle29310")     --领取资源奖励
    self:RegisterProtocal(29311, "handle29311")     --查看某一位置上的英雄战斗回放ID列表
    self:RegisterProtocal(29312, "handle29312")     --自动布阵
    self:RegisterProtocal(29313, "handle29313")     --查看资源领取状态
    self:RegisterProtocal(29314, "handle29314")     --弹窗报错
    self:RegisterProtocal(29315, "handle29315")     --查看已占领所有资源奖励领取状态
    self:RegisterProtocal(29316, "handle29316")     --领取已占领所有资源奖励

end

function LeagueExploreController:getModel()
    return self.model
end

--请求探索历练界面数据
function LeagueExploreController:sender29300(  )
	self:SendProtocal(29300, {})
end

function LeagueExploreController:handle29300(data)
    print("-----------------handle29300-------------------")
    -- printLuaTable(data)
    self.model:setBaseData(data)
    self:upDateRedStatus()
    EventManager:getInstance():Fire(LeagueExploreEvent.Update_Main_Base_Data)
end 

--报名
function LeagueExploreController:sender29301(id)
    local protocal  ={}
    protocal.id = id 
    print("---------sender29301--------",id)
	self:SendProtocal(29301, protocal)
end

function LeagueExploreController:handle29301(data)
    print("-----------------handle29301-------------------")
    printLuaTable(data)
    message(data.msg)
    if data.code ==1 then 
        EventManager:getInstance():Fire(LeagueExploreEvent.Update_Apply_Success_Data)
    end 
end
--放弃资源点
function LeagueExploreController:sender29302(id )
    local protocal  ={}
    protocal.id = id 
    self.give_up_id  = id 
    print("-----------------sender29302-------------------",id)
	self:SendProtocal(29302, protocal)
end

function LeagueExploreController:handle29302(data)
    print("-----------------handle29302-------------------")
    printLuaTable(data)
    message(data.msg)
    if data.code == 1 then 
        self.model:updateGaveUpDataByID(data.id  or  self.give_up_id)
        EventManager:getInstance():Fire(LeagueExploreEvent.Update_GiveUp_Success_Data)
    end 
    
end 


--布阵
function LeagueExploreController:sender29303(data)

    local protocal  ={}
    protocal.id = data.id 
    protocal.type = data.type
    protocal.pos_info= data.pos_info
    print("----------------------29303----------------------")
    printLuaTable(protocal)
	self:SendProtocal(29303, protocal)
end

function LeagueExploreController:handle29303(data)
    print("-----------------handle29303-------------------")
    printLuaTable(data)
    message(data.msg)
    if data.code then 
        EventManager:getInstance():Fire(LeagueExploreEvent.Set_Team_Success_Data)
    end 

end 
--查看己方布阵信息
function LeagueExploreController:sender29304(data )
    local protocal  ={}
    protocal.id = data.id
    protocal.type =data.type  
	self:SendProtocal(29304, protocal)
end

function LeagueExploreController:handle29304(data)
    print("-----------------handle29304-------------------")
    printLuaTable(data)
    message(data.msg)
    self.model:setTeamEmbattled(data)
    EventManager:getInstance():Fire(LeagueExploreEvent.Look_Team_Embattled_Data)

end 

--获取本联盟所有成员数据
function LeagueExploreController:sender29305( data  )
    local protocal  ={}
    protocal.id = data.id
    protocal.type =data.type
	self:SendProtocal(29305, protocal)
end

function LeagueExploreController:handle29305(data)
    print("-----------------handle29305-------------------")
    printLuaTable(data)
    message(data.msg)
    self.model:setTeamMemberList(data)
    self.model:setResourceID(data.id)
    if data.code ==1 then 
        EventManager:getInstance():Fire(LeagueExploreEvent.Look_Team_Embattled_Data)
    end 


end 
--本联盟战斗过程数据查看
function LeagueExploreController:sender29306(id)
    local protocal  ={}
    protocal.id = id
	self:SendProtocal(29306, protocal)
end

function LeagueExploreController:handle29306(data)
    print("-----------------handle29306-------------------")
    printLuaTable(data)
    self.model:setBattleBaseResultData(data)
    self.model:setResourceID(data.id)

    if data.code ==1 then 
        EventManager:getInstance():Fire(LeagueExploreEvent.Updata_Battle_Base_Data)
    end 

end 

--查看上次战斗积分排行
function LeagueExploreController:sender29307(id)
    local protocal  ={}
    protocal.id = id
    print("------------sender29307----------",id)
	self:SendProtocal(29307, protocal)
end

function LeagueExploreController:handle29307(data)
    printLuaTable(data)
    message(data.msg)
    if data.code ==1 then 
        self.model:setAtkRankData(data)
        LeagueExploreController:getInstance():openLeagueExploreChanllengeResultWindow(true)
        EventManager:getInstance():Fire(LeagueExploreEvent.Updata_Chanllenge_Result_Data,data)
    end
end
--查看上次战斗双方布阵数据
function LeagueExploreController:sender29308(data)
    local protocal  ={}
    protocal.id = data.id 
    protocal.atk_league_id =data.atk_league_id
    protocal.atk_league_srv_id =data.atk_league_srv_id
	self:SendProtocal(29308, protocal)
end

function LeagueExploreController:handle29308(data)
    print("-----------------handle29308-------------------")
    printLuaTable(data)
    if data.code ==1 then 
        self.model:setTeamRankData(data)
        EventManager:getInstance():Fire(LeagueExploreEvent.Updata_Chanllenge_Team_Data,data)
    end
end

--探索历练状态通知 --主动推
function LeagueExploreController:sender29309(  )
	self:SendProtocal(29309, {})
end

function LeagueExploreController:handle29309(data)
    print("-----------------探索历练当前阶段------------",data.step_status)
    -- printLuaTable(data)
    self.model:setStepStatus(data.step_status)
    EventManager:getInstance():Fire(LeagueExploreEvent.Updata_Step_Change_Data, data.step_status)
end

--查看上次占领积分排行
function LeagueExploreController:sender29310(id)
    local protocal  ={}
    protocal.id = id
    print("------------sender29310-------------",id )
	self:SendProtocal(29310, protocal)
end

function LeagueExploreController:handle29310(data)
    print("-----------------handle29310-------------------")
    printLuaTable(data)
    message(data.msg)
end


--查看视频列表
function LeagueExploreController:sender29311(data)
    local protocal  ={}
    protocal.id = data.id 
    protocal.rid  = data.rid  -- 角色id 
    protocal.srv_id  = data.srv_id -- 服务器id 
	self:SendProtocal(29311, protocal)
end

function LeagueExploreController:handle29311(data)
    print("-----------------handle29311-------------------")
    printLuaTable(data)
    if data.replay_list and next(data.replay_list) ~= nil then
        self.model:setVideoData(data.replay_list)
        EventManager:getInstance():Fire(LeagueExploreEvent.Updata_Video_Look_Data)
    else
        message("暂无视频")
    end 

end


--自动布阵
function LeagueExploreController:sender29312(data)
    local protocal  ={}
    protocal.id = data.id
    protocal.type =data.type
    protocal.embattled_type = data.embattled_type  -- 1 上阵 2 下阵
    print("------------data.embattled_type-------------",data.embattled_type)
	self:SendProtocal(29312, protocal)
end

function LeagueExploreController:handle29312(data)
     print("-----------------handle29312-------------------")
     printLuaTable(data)

     if data.code ==1 then 
        EventManager:getInstance():Fire(LeagueExploreEvent.Updata_Up_Down_Team_Success_Data)
     end 
     message(data.msg)
end

--查看资源奖励领取状态
function LeagueExploreController:sender29313(id)
    local protocal  ={}
    protocal.id = id
    print("------------id--------------",id)
	self:SendProtocal(29313, protocal)
end

function LeagueExploreController:handle29313(data)
     print("-----------------handle29313-------------------")
     printLuaTable(data)
    --  message(data.msg)
     if data.code == 1 then 
        EventManager:getInstance():Fire(LeagueExploreEvent.Updata_Resource_Receive_Data,data)
     end
end

-- 弹窗提示
function LeagueExploreController:sender29314(id)
	self:SendProtocal(29314, protocal)
end

function LeagueExploreController:handle29314(data)
     print("-----------------handle29314-------------------")
     printLuaTable(data)
    --1 灵界联盟探险报名已经开始，请前往灵界查看报名。
    --2 灵界联盟探险即将在18：00开始，17：50报名结束，请做好报名
    --3 灵界联盟探险报名已结束，布阵将在18：00结束，请做好布阵，探险在18：00准时开启，记得观战不错过细节
    if data and data.status then 
      local str = LeagueExploreConst.show_tip[data.status]
      CommonAlert.show(str, TI18N("确定"),nil,nil,nil,nil,function()end)
    end 
    
end


--查看资源奖励领取状态
function LeagueExploreController:sender29315()
    local protocal  ={}
    -- protocal.id = id
    print("------------id--------------",id)
	self:SendProtocal(29315, protocal)
end

function LeagueExploreController:handle29315(data)
     print("-----------------handle29315-------------------")
     printLuaTable(data)
    --  message(data.msg)
     if data.code == 1 then 
        -- self.model:updateReceiceData(data)
        EventManager:getInstance():Fire(LeagueExploreEvent.Updata_Resource_Receive_Data,data)
     end
end

--领取已占领所有资源奖励
function LeagueExploreController:sender29316(id)
	self:SendProtocal(29316, {})
end

function LeagueExploreController:handle29316(data)
     print("-----------------handle29316-------------------")
     printLuaTable(data)
     message(data.msg)
end


----------- @ 界面相关
-- 判断灵界是否显示红点
function LeagueExploreController:upDateRedStatus()
    -- 灵界添加红点
    -- local step_status =self.model:getStepStatus()
    -- local red_status = false
    -- if step_status==1 then 
    --     red_status = true
    --     if self.model:isSign() then 
    --         red_status = false
    --     end 
      
    -- end 
    -- GhostdomController:getInstance():setBuildRedStatus(GhostdomConst.Build_Type.league_explore, {bid = LeagueExploreConst.Red_Type.sign, status = red_status})
end 

-- 判断打开哪个界面
function LeagueExploreController:isOpenWindow()

    -- 没有报名 
    local _parapos = self.model:getParaPos()
    if _parapos==0 then
        LeagueExploreController:getInstance():openMainScene(true)
        return
    end 
    local _step_status =self.model:getStepStatus()
    if _step_status==3 then
         LeagueExploreController:getInstance():openLeagueExploreResultWindow(true)
         return 
    end
    LeagueExploreController:getInstance():openMainScene(true)
end 


-- 打开区场景
function LeagueExploreController:openMainScene(status, data)
    if status == true then
        if not self.league_main_window then
            self.league_main_window = LeagueExploreMainWindow.New(data)
        end
        if self.league_main_window:isOpen() == false then
            self.league_main_window:open()
        end
    else
        if self.league_main_window then
            self.league_main_window:close()
            self.league_main_window = nil
        end
    end
end

-- 引导需要
function LeagueExploreController:getGhostdomSceneRoot(  )
    if self.league_main_window then
        return self.league_main_window.root_wnd
    end
end

-- 管理界面
function LeagueExploreController:openLeagueExploreManagerWindow(status)
    if status == true then
        if not self.league_explore_manager_window then
            self.league_explore_manager_window = LeagueExploreManagerWindow.New()
        end
        if self.league_explore_manager_window and self.league_explore_manager_window:isOpen() == false then
            self.league_explore_manager_window:open()
        end
    else
        if self.league_explore_manager_window then
            self.league_explore_manager_window:close()
            self.league_explore_manager_window = nil
        end
    end
end
--  打开报名界面
function LeagueExploreController:openLeagueExploreSignWindow(status)
    if status == true then
        if not self.league_explore_sign_window then
            self.league_explore_sign_window = LeagueExploreSignWindow.New()
        end
        if self.league_explore_sign_window and self.league_explore_sign_window:isOpen() == false then
            self.league_explore_sign_window:open()
        end
    else
        if self.league_explore_sign_window then
            self.league_explore_sign_window:close()
            self.league_explore_sign_window = nil
        end
    end
end

-- 打开领取界面
function LeagueExploreController:openReceiveExploreWindow(status)
    if status == true then
        if not self.league_explore_receive_window then
            self.league_explore_receive_window = LeagueExploreReceiveWindow.New()
        end
        if self.league_explore_receive_window and self.league_explore_receive_window:isOpen() == false then
            self.league_explore_receive_window:open()
        end
    else
        if self.league_explore_receive_window then
            self.league_explore_receive_window:close()
            self.league_explore_receive_window = nil
        end
    end
end


-- 打开布阵界面
function LeagueExploreController:openTeamExploreWindow(status)
    if status == true then
        if not self.league_explore_team_window then
            self.league_explore_team_window = LeagueExploreTeamWindow.New()
        end
        if self.league_explore_team_window and self.league_explore_team_window:isOpen() == false then
            self.league_explore_team_window:open()
        end
    else
        if self.league_explore_team_window then
            self.league_explore_team_window:close()
            self.league_explore_team_window = nil
        end
    end
end

--普通tips
--@is_middle 是否居中显示
function LeagueExploreController:openTeamSelectPanel(tips, point, font_size,delay, width, is_middle)
    if self.team_select_panel ~= nil then
       self.team_select_panel:close()
       self.team_select_panel = nil
    end
    width = width or 449
    self.team_select_panel = LeagueExploreTeamSelectPanel.New(delay)
    self.team_select_panel:open()
    self:adjustTipsPosition(self.team_select_panel, point, nil, false)
    table.insert({}, self.team_select_panel)
    return self.team_select_panel
end


function LeagueExploreController:closeTeamSelectPanel()
    self.team_select_panel:close()
end


--@is_middle 是否居中显示
function LeagueExploreController:openVideoSelectPanel(list ,point,delay  , is_middle)
    if self.video_select_panel ~= nil then
       self.video_select_panel:close()
       self.video_select_panel = nil
    end
    width = 132
    self.video_select_panel = LeagueExploreVideoSelectPanel.New(delay)
    self.video_select_panel:open()
    self:adjustTipsPosition1(self.video_select_panel, point, nil, false)
    table.insert({}, self.video_select_panel)
    return self.video_select_panel
end


function LeagueExploreController:closeVideoSelectPanel()
    self.video_select_panel:close()
end
-- 奖励领取结果界面
function LeagueExploreController:openLeagueExploreResultWindow(status)
    if status == true then
        if not self.league_explore_result_window then
            self.league_explore_result_window = LeagueExploreResultWindow.New()
        end
        if self.league_explore_result_window and self.league_explore_result_window:isOpen() == false then
            self.league_explore_result_window:open()
        end
    else
        if self.league_explore_result_window then
            self.league_explore_result_window:close()
            self.league_explore_result_window = nil
        end
    end
end
-- 战斗结果界面
function LeagueExploreController:openLeagueExploreChanllengeResultWindow(status)
    if status == true then
        if not self.league_explore_chanllenge_result_window then
            self.league_explore_chanllenge_result_window = LeagueExploreChanllengeResultWindow.New()
        end
        if self.league_explore_chanllenge_result_window and self.league_explore_chanllenge_result_window:isOpen() == false then
            self.league_explore_chanllenge_result_window:open()
        end
    else
        if self.league_explore_chanllenge_result_window then
            self.league_explore_chanllenge_result_window:close()
            self.league_explore_chanllenge_result_window = nil
        end
    end
end

-- 积分排行详情
function LeagueExploreController:openLeagueExploreScoreRankWindow(status,type)
    if status == true then
        if not self.league_explore_score_rank_window then
            self.league_explore_score_rank_window = LeagueExploreScoreRankWindow.New(type)
        end
        if self.league_explore_score_rank_window and self.league_explore_score_rank_window:isOpen() == false then
            self.league_explore_score_rank_window:open(type)
        end
    else
        if self.league_explore_score_rank_window then
            self.league_explore_score_rank_window:close()
            self.league_explore_score_rank_window = nil
        end
    end
end

-------------- 主页面--------end-------------------


--位置调整(现在某认为显示的tips的anchorPoint的为cc.p(0, 1)自己主动的去设)
function LeagueExploreController:adjustTipsPosition(target, point, view_size, is_middle)
    local win_size = cc.size(SCREEN_WIDTH,SCREEN_HEIGHT)                 -- 父节点的尺寸
    local temp_size = cc.size(449,654)      -- 对象的除此你,这里的对象都是0,0的锚点
    local size = cc.size(temp_size.width, temp_size.height)
    local offset_height = 10                                             -- 偏移值

    local parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)
    local local_pos = parent:convertToNodeSpace(point)
    local start_x = local_pos.x
    local start_y = local_pos.y

    if start_x + size.width > win_size.width then
        print("-----------------1------------------",start_x)
        start_x = win_size.width - size.width
        -- start_x = win_size.width - start_x
    elseif start_x < size.width then
        print("-----------------2------------------",start_x)
        start_x = start_x + 20
    end
    if is_middle then
        start_x = (win_size.width - size.width)/2
    end

    if start_y > win_size.height then
        start_y = win_size.height 
    elseif start_y < size.height then
        start_y = start_y + size.height + 20- 200
    else 
        start_y = start_y +200
    end
    target:setPosition(start_x, start_y-display.getBottom())
--    if point.x + size.width + offset_height >= 0 then -- 显示左边
--         if point.y + size.height + offset_height > win_size.height then -- 显示下边
--             if point.y - offset_height - size.height > 0 then
--                 target:setPosition(point.x - size.width - offset_height , point.y - offset_height)
--             else --超出屏幕
--                 target:setPosition(point.x - size.width - offset_height , point.y - offset_height + math.abs(point.y - offset_height - size.height))
--             end
--         else
--             target:setPosition(point.x - size.width - offset_height , point.y + size.height + offset_height)
--         end
--    else  -- 显示右边
--        if point.y + size.height + offset_height > win_size.height then -- 显示下边
--            if point.y - offset_height - size.height > SCREEN_WIDTH then
--                target:setPosition(point.x + offset_height , point.y - offset_height)
--            else --超出屏幕
--               local posy =  point.y - offset_height + math.abs(point.y - offset_height - size.height)
--               if posy + size.height > display.height then
--                 target:setPosition(point.x + offset_height , posy-(math.abs(point.y - offset_height - size.height)))
--               else 
--                 target:setPosition(point.x + offset_height , point.y - offset_height + math.abs(point.y - offset_height - size.height))
--               end
               
--            end
--        else
--            target:setPosition(point.x + offset_height , point.y + size.height + offset_height)
--        end
--    end
end

--位置调整(现在某认为显示的tips的anchorPoint的为cc.p(0, 1)自己主动的去设)
function LeagueExploreController:adjustTipsPosition1(target, point, view_size, is_middle)
    local win_size = cc.size(SCREEN_WIDTH,SCREEN_HEIGHT)                 -- 父节点的尺寸
    local temp_size = cc.size(132,120)      -- 对象的除此你,这里的对象都是0,0的锚点
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
    target:setPosition(start_x, start_y-display.getBottom())
end
function LeagueExploreController:__delete()
    self.allRedDatas = {}
end
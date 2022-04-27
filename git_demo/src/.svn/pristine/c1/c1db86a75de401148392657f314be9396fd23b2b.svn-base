-- --------------------------------------------------------------------
-- @description:
--      日常主界面，包含了任务和成就
--
-- --------------------------------------------------------------------
OrganizeTeamMainWindow = OrganizeTeamMainWindow or BaseClass(BaseView)

function OrganizeTeamMainWindow:__init()
    self.ctrl = OrganizeController:getInstance()
    self.model = self.ctrl:getModel()
    self.win_type = WinType.Full
    self.layout_name = "organizeteam/organizeteam_main_window"
    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("bigbg","hl_bigbg_60", false), type = ResourcesType.single },
        { path = PathTool.getPlistImgForDownLoad("bigbg","hl_bigbg_61", false), type = ResourcesType.single },
        { path = PathTool.getPlistImgForDownLoad("bigbg","hl_bigbg_62", false), type = ResourcesType.single },

    }
    self.tab_info_list1 = {
        {label = TI18N("我的队伍"),notice = TI18N(""),index = 1,status = true},
        {label = TI18N("加入队伍"),notice = TI18N(""),index = 2,status = false},
        {label = TI18N("招募队友"),notice = TI18N(""),index = 3,status = true},
    }
    self.panel_list = {}
    self.cur_panel = nil
    self.cur_index = 0

    self.role_vo = RoleController:getInstance():getRoleVo()
end

function OrganizeTeamMainWindow:open_callback()

    self.background_last = self.root_wnd:getChildByName("background_last")
    loadSpriteTexture(self.background_last, PathTool.getSingleImgForDownLoad("bigbg","hl_guild",false), LOADTEXT_TYPE)

    self.background = self.root_wnd:getChildByName("background")
    loadSpriteTexture(self.background, PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_61",false), LOADTEXT_TYPE)

    self.main_panel = self.root_wnd:getChildByName("main_panel")  
    self:playEnterAnimatianByObj(  self.main_panel , 1)
   
    self.container = self.main_panel:getChildByName("container")  
    self.close_btn = self.root_wnd:getChildByName("close_btn")
    -- self.main_panel:setPositionY(660)
    local tab_btn_obj =  self.main_panel:getChildByName("tab_btn")  
    -- tab_btn_obj:setPositionY(1150)
    self.tab_btn_list = {}    
    for i=1,3 do
        local item = tab_btn_obj:getChildByName("tab_btn_"..i)
        item.index = i
        item.select_bg = item:getChildByName("select_img")
        item.unselect_bg = item:getChildByName("normal_img")
        item.select_bg:setVisible(false)
        item.label = item:getChildByName("label")
        if self.tab_info_list1[i] then
            item.label:setString(self.tab_info_list1[i].label)
        end

        item.notice = self.tab_info_list1[i].notice or ""

        item.tips = addRedPointToNodeByStatus( item, false, 6, 6, nil)

        -- 添加注册监听事件
        item:addTouchEventListener(function(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    playTabButtonSound()
                    if sender.can_touch == false then
                        message(sender.notice)
                    else
                        self:setSelecteTab(sender.index,false,cc.c3b(168,150,121),cc.c3b(250,232,150))
                    end
                end
            end)

        self.tab_btn_list[i] = item
    end

    self:addNotice()
end

function OrganizeTeamMainWindow:register_event()

    self.close_btn:addTouchEventListener(function(sender, event_type)
            customClickAction(sender,event_type)
            if event_type == ccui.TouchEventType.ended then
                playQuitSound()
                self.ctrl:openOrganizeTeamWindow(false)
            end
        end)

    self:addGlobalEvent(OrganizeEvent.Update_My_Team_Red_Status, function(data)
        print("---------data----------------------------")
         self:updateMyTeamRedStatus(data.code)
     end)

    self:addGlobalEvent(OrganizeEvent.Update_Team_Notice_Data, function()
        self:updateNotice()
    end)
     

end

function OrganizeTeamMainWindow:openRootWnd(index)
    index = index or OrganizeConst.Type.MyTeam
    self:setSelecteTab(index, true,cc.c3b(168,150,121),cc.c3b(250,232,150))
end

 
-- 日志
function OrganizeTeamMainWindow:addNotice()
    if not self.team_notice then
        self.team_notice =   OrganizeNoticePanel.New({})
        self.team_notice:setParentWnd(self.main_panel)
        self.team_notice:getRoot():setPosition(cc.p(360,152))
    end 
end 
function OrganizeTeamMainWindow:updateNotice()
    if not self.team_notice then
        self:addNotice()
    end 
    local data = self.model:getNoticeListData()
    self.team_notice:setBaseData(data) 
end 


function OrganizeTeamMainWindow:selectedTabCallBack(index)
   print("----------selectedTabCallBack-----------",index)

    if index == 1 then
        self:changeTitleName(TI18N("我的队伍"))

        if self.team_notice then
            self.team_notice:isPanelStatus(true)
        end 

    elseif index == 2 then
        self:changeTitleName(TI18N("加入队伍"))
        if  self.team_notice then
            self.team_notice:isPanelStatus(false)
        end 
    elseif index == 3 then
        self:changeTitleName(TI18N("招募队友"))
        if  self.team_notice then
            self.team_notice:isPanelStatus(false)
        end 
 
    end

    self:changePanel(index)

end

function OrganizeTeamMainWindow:changePanel(index)
    if self.cur_panel ~= nil then
        self.cur_panel:addToParent(false)
        self.cur_panel = nil
    end
    if self.panel_list[index] == nil then
        if index ==1 then
            self.panel_list[index] = OrganizeMyTeamPanel.new()
        elseif index == 2 then
            self.panel_list[index] = OrganizeAddTeamPanel.new() 

        elseif index == 3 then
            self.panel_list[index] = OrganizeGetTeamPanel.new()

      
        end

        self.container:addChild(self.panel_list[index])
    end
    self.cur_panel = self.panel_list[index]
    self.cur_index  = index
    if self.cur_panel ~= nil then
        self.cur_panel:addToParent(true)
    end

    -- for i, item in ipairs(self.tab_btn_list) do
    --     item.title:setPositionY(92)
    -- end 
    -- self.tab_btn_list[index].title:setPositionY(80)
end

function OrganizeTeamMainWindow:updateMyTeamRedStatus(staus)

     local item =  self.tab_btn_list[self.cur_index]
    if staus == 1 then 
        if  self.cur_index ==1  then 
            self:setTabTips(false,1)
            -- 当前界面 
            self.ctrl:sender29606() 
        else 
            self:setTabTips(true,1)
        end
    else
        self:setTabTips(false,1)
    end 
    

end 

function OrganizeTeamMainWindow:close_callback()
    for k, panel in pairs(self.panel_list) do
        panel:DeleteMe()
    end

    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
        self.role_vo = nil
    end

    self.panel_list = nil
    self.ctrl:openOrganizeTeamWindow(false)
end

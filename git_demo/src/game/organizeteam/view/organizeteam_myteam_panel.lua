-- --------------------------------------------------------------------
-- @description:
--      我的队伍的成就标签页
--
-- --------------------------------------------------------------------
local controller = OrganizeController:getInstance()
local model  = OrganizeController:getInstance():getModel()
local role_controller = RoleController:getInstance()

OrganizeMyTeamPanel = class("OrganizeMyTeamPanel",function()
    return ccui.Layout:create()
end)

function OrganizeMyTeamPanel:ctor() 
    self:config()
    self:layoutUI()
end
function OrganizeMyTeamPanel:config()
    self.ctrl = OrganizeController:getInstance()
    -- self.size = cc.size(720,800)
    self:setContentSize(self.size)
    self.item_list = {}
    self.is_del = false
end
function OrganizeMyTeamPanel:layoutUI()
    local csbPath = PathTool.getTargetCSB("organizeteam/organizeteam_myteam_panel")
    self.root_wnd = createCSBNote(csbPath)
    self:setPosition(cc.p(-3,136))

    self:addChild(self.root_wnd)

    self.container = self.root_wnd:getChildByName("container")

    self.my_name = self.container:getChildByName("my_name")
    self.my_ID = self.container:getChildByName("my_ID")
    self.role_vo = RoleController:getInstance():getRoleVo()
    self.btn_help = self.container:getChildByName("btn_help")
    self.scrollview_container = self.container:getChildByName("scrollview_container")
    self.main_container_size = self.scrollview_container:getContentSize()
    --  local setting = {
    --     item_class = OrganizeTeamMyTeamItem,
    --     start_x = 0,
    --     space_x = 0,
    --     start_y = 0,
    --     space_y = 4,
    --     item_width = 556,
    --     item_height = 133,
    --     row = 1,
    --     col = 1,
    --     scale = 1,
    -- }
    -- self.scrollview = CommonScrollViewLayout.new(self.scrollview_container, cc.p(0,0) , ScrollViewDir.vertical, ScrollViewStartPos.top, main_container_size, setting) 
    -- self.scrollview:setSwallowTouches(false)
	self.scroll_view = createScrollView(self.main_container_size.width, self.main_container_size.height, 0, 1, self.scrollview_container, ccui.ScrollViewDir.vertical)
end


--事件
function OrganizeMyTeamPanel:registerEvents()
    
end
function OrganizeMyTeamPanel:addToParent(status)
    self:setVisible(status)
    self:handleDynamicEvent(status)

    -- self:updateTeamList()
    self.ctrl:sender29606()
    self.ctrl:sender29615() --日志
end


function OrganizeMyTeamPanel:handleDynamicEvent(status)
    if status == false then
         EventManager:getInstance():UnBind(self)
    else
        EventManager:getInstance():Bind(OrganizeEvent.Update_MyTeam_Data_List,self, function(data) 
            self:updateTeamList()
        end)
        EventManager:getInstance():Bind(RoleEvent.UPDATE_PALYER_RELATION_EVENT,self, function() 
            self:updateTeamList()
        end)
    end
    self.btn_help:addTouchEventListener(function(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            controller:openOrganizeHelpWindow(true)
        end
    end)
end

function OrganizeMyTeamPanel:updateTeamList()
    local list = model:getMyTeamData()
     
  
    local _list = {}
    if list and list.members  then 
      
        for i =1 ,#list.members do 
            list.members[i].team_type = 0   -- 0 我的队伍 1 招募队友 2申请或邀请
            list.members[i].is_my_team = 0   -- 0 我不是队长  1 我是队长
            if  list.htleadersrv_id ==  self.role_vo.srv_id  and  list.htleaderid ==   self.role_vo.rid then 
                list.members[i].is_my_team = 1
            end 
            table.insert(_list , list.members[i])
        end 
        local _vo = {}
        _vo.team_type = 1
        table.insert(_list , _vo)
    end 

    if list and list.guids  then 
        for i =1 ,#list.guids do 
            list.guids[i].team_type = 2
            table.insert(_list , list.guids[i])
        end 
    end 

    -- 计算总高度
    print("------------------list-------------------")
    printLuaTable(_list)
    table.sort( _list, function(a,b)
        if a.post~=nil and b.post~=nil then
            return a.post<b.post
        end
    end)

    local space_y = 4
    local content_h = #list.members * (133 + space_y) + (112+space_y) + #list.guids * (233+space_y) 
    local max_height = math.max(content_h, self.main_container_size.height)
    self.scroll_view:setInnerContainerSize(cc.size(self.main_container_size.width, max_height))
    self.item_list={}
    self.scroll_view:removeAllChildren()
    for i, v in ipairs(_list) do
        delayRun(self.container, i/120, function()
            if not self.item_list[i] then
                self.item_list[i] = OrganizeTeamMyTeamItem.new()
                self.scroll_view:addChild(self.item_list[i])
            end
            if self.item_list[i] then
                self.item_list[i]:setData(v)
                 local item_y = 0
                 if v.team_type ==0 then 
                     item_y = i * (133 + space_y)  -20
                  end
                 if v.team_type ==1 then 
                    item_y = #list.members * (133 + space_y)   + (112+space_y) +1 
                  end 
                 if v.team_type ==2 then 
                     item_y = #list.members * (133 + space_y)   + (112+space_y) + (i-#list.members-1) * (233+space_y) -233/2 -2
                 end    
                -- if v.team_type ==0 then 
                --     item_y = i * (133 + space_y) -133/2 -50
                --  end
                -- if v.team_type ==1 then 
                --    item_y = #list.members * (133 + space_y) -133/2  + (112 + space_y) -50
                --  end
                -- if v.team_type ==2 then 
                --     item_y = #list.members * (133 + space_y)-133/2   + (112-4 + space_y)  + (i-#list.members) * (233+space_y) -233 -50
                -- end   
                  -- self.item_list[i]:setPosition(556/2,item_y)
 
                 print("---------item_y---------------",item_y)
                self.item_list[i]:setPosition(556/2,max_height-item_y)
              
            end
        end)
		
    end

    -- self.scrollview:setData(_list)
    -- htleaderid
    if list and list.name  then 
        self.my_name:setString(list.name.."的队伍")
        self.my_ID:setString("ID:"..list.htid)
    end 
      
  
end



function OrganizeMyTeamPanel:DeleteMe()
    self:handleDynamicEvent(false)

    if self.scrollview then
        self.scrollview:DeleteMe()
        self.scrollview = nil
    end
end

-- --------------------------------------------------------------------
-- @description:
--     使用的单元
--
-- --------------------------------------------------------------------
OrganizeTeamMyTeamItem = class("OrganizeTeamMyTeamItem", function()
    return ccui.Layout:create()
end)

function OrganizeTeamMyTeamItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("organizeteam/organizeteam_myteam_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.bg = self.root_wnd:getChildByName("bg") 

    self.top_sprite = self.root_wnd:getChildByName("top_sprite")
    self.stage_label = self.top_sprite:getChildByName("stage_label")

    self.container = self.root_wnd:getChildByName("container")
    self.Image_1 = self.container:getChildByName("Image_1")
    self.image_5 = self.container:getChildByName("Image_5")
    self.sp_type = self.container:getChildByName("sp_type")
    self.lbl_text = self.image_5:getChildByName("lbl_text")
    self.time =  self.Image_1:getChildByName("time")

    self.role_name = self.container:getChildByName("role_name")
    self.team_name = self.container:getChildByName("team_name")

    self.node_relation = self.container:getChildByName("node_relation") --存放关系icon显示的节点
    self.btn_heart_suo = self.container:getChildByName("btn_heart_suo") --同心锁按钮
    self.btn_heart_suo:setVisible(false)

    self.guild_name = self.container:getChildByName("guild_name")
    self.grage_name = self.container:getChildByName("grage_name")
    self.day_label = self.container:getChildByName("day_label")

    self.get_btn = self.container:getChildByName("Panel_1")-- +招募

    self.btn_click = self.container:getChildByName("btn_click")

    self.type_label = self.container:getChildByName("type_label") 

    self.arrow_bg = self.container:getChildByName("arrow_bg")
    self.power_label= CommonNum.new(101, self.container, 99999, -1, cc.p(0, 0.5))
    self.power_label:setPosition(170, 80)

    self.cancel_btn = self.container:getChildByName("cancel_btn") 
    self.confirm_btn = self.container:getChildByName("confirm_btn") 

    self.submit_btn = self.root_wnd:getChildByName("submit_btn")
    
    local head_node = self.container:getChildByName("head_node")
    self.my_head = PlayerHead.new(PlayerHead.type.circle)
    -- self.my_head:setHeadLayerScale(0.8)
    self.my_head:setPosition(0, 0)
    head_node:addChild(self.my_head)
    self.role_vo = RoleController:getInstance():getRoleVo()

  
    self:registerEvent()
end

function OrganizeTeamMyTeamItem:registerEvent()
     self.get_btn:setTouchEnabled(true)
     self.get_btn:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            if self.data.team_type==1 then 
                -- 跳转到招募
                controller:ChangeOrganizeTeamWindow(3)
            end 
    
        end
    end)

    self.submit_btn:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            if self.data.team_type==1 then 
                -- 招募
                controller:sender29609()
            end 
          
        end
    end)

    self.btn_click:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
           if self.data.is_my_team ==1 then 
               -- 队长
            --    controller:sender29604(self.data.rid,self.data.srv_id)
                local comfirm_callback = function()
                    controller:sender29604(self.data.rid,self.data.srv_id)
                end
        
                local cancel_callback = function()
                
                end
        
                local _desc = "是否将该玩家踢出队伍，你们俩之间累积的\n组队时间将清零？"
                CommonAlert.show(_desc,TI18N("踢出"),comfirm_callback, TI18N("取消"), cancel_callback)
            end 
            if self.data.is_my_team ==0 then 
                 --退出 队员
                 local comfirm_callback = function()
                    controller:sender29605()
                end
                local cancel_callback = function()

                end
        
                local _desc = "是否退出该队伍，你们俩之间累积的组队时间将清零？"
                CommonAlert.show(_desc,TI18N("退出"),comfirm_callback, TI18N("取消"), cancel_callback)
            end 
            
          
        end
    end)
    self.cancel_btn:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
             print("----------拒绝---------------------")
               --  sender29602 申请
            if self.data.type == 0 then 
                controller:sender29602(self.data.rid,self.data.srv_id,0)
            else
                controller:sender29612(self.data.rid,self.data.srv_id,0)
            end 
        end
    end)
    self.confirm_btn:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
             print("----------同意---------------------")
            --  sender29602 申请
            if self.data.type == 0 then 
                controller:sender29602(self.data.rid,self.data.srv_id,1)

            else
                controller:sender29612(self.data.rid,self.data.srv_id,1)

            end 

        end
    end)

    self.btn_heart_suo:addTouchEventListener(function(sender, event_type)
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
             print("----------赠送同心锁---------------------")
            --  sender29602 申请
            role_controller:sender29707(self.data.rid,self.data.srv_id)
        end
    end)

end

function OrganizeTeamMyTeamItem:setData(data)
    self.data = data
    if data.team_type==1 then 
        self.get_btn:setVisible(true)
        self.Image_1:setVisible(false)
        self.role_name:setVisible(false)
        self.guild_name:setVisible(false)
        self.day_label:setVisible(false)
        self.my_head:setVisible(false)
        self.grage_name:setVisible(false)
        -- self.container:setTouchEnabled(true)
        self.btn_click:setVisible(false)
        self.cancel_btn:setVisible(false)
        self.confirm_btn:setVisible(false)
        self.type_label:setVisible(false)
        self.sp_type:setVisible(false)
        self.submit_btn:setVisible(true)
        self.power_label:setVisible(false)
        self.size=cc.size(556,112)
        self.root_wnd:setContentSize(self.size)
        self.bg:setContentSize(self.size)
        self.arrow_bg:setVisible(false)
        self.top_sprite:setVisible(false)
        self.image_5:setVisible(false)
        self.team_name:setVisible(false)
        self.node_relation:setVisible(false) --关系icon节点

        self.container:setPositionY(116)
        self.submit_btn:setPositionY(116)
        return
    end 
    self.submit_btn:setVisible(false)
    self.power_label:setVisible(true)

    if data.team_type==0 then
        self.size=cc.size(556,133)
        self.root_wnd:setContentSize(self.size)
        self.bg:setContentSize(self.size)
        self.container:setPositionY(116)

        -- 我的队伍
        self.btn_click:setVisible(true)
        self.cancel_btn:setVisible(false)
        self.confirm_btn:setVisible(false)
        self.type_label:setVisible(true)

        self.Image_1:setVisible(true)
        self.role_name:setVisible(true)
        self.guild_name:setVisible(true)
        self.day_label:setVisible(true)
        self.my_head:setVisible(true)
        self.grage_name:setVisible(true)
        self.arrow_bg:setVisible(true)
        self.top_sprite:setVisible(false)
        self.image_5:setVisible(false)
        self.team_name:setVisible(false)
        self.node_relation:setVisible(true) --关系icon节点
        print("--------------------is_my_team-----------------",data.is_my_team)
        if data.is_my_team ==1 then 
            -- 如果我是队长
            if  self.role_vo.rid == self.data.rid and self.role_vo.srv_id == self.data.srv_id then 
                self.btn_click:setVisible(false)
                -- self.type_label:setString("我")

            else 
                -- 不是我 
                self.btn_click:setVisible(true)
                -- self.type_label:setString("别人")
            end 
         
        end 

        if data.is_my_team ==0 then 
            -- 如果我不是队长
            if  self.role_vo.rid == self.data.rid and self.role_vo.srv_id == self.data.srv_id then 
                self.btn_click:setVisible(true)
                -- self.type_label:setString("我")

            else 
                -- 不是我 
                self.btn_click:setVisible(false)
                -- self.type_label:setString("别人")
            end 
        end 
        self.type_label:setString("")
        self.sp_type:setVisible(false)
        if data.post == 1 then 
            self.type_label:setString("") --队
            self.sp_type:setVisible(true)
        end 

        self:createRelationIcon(data)
    elseif data.team_type==2 then 
        self.size=cc.size(556,233)
        self.root_wnd:setContentSize(self.size)
        self.bg:setContentSize(self.size)
        -- self.container:setPositionY(130)
        -- 邀请或者申请
        self.btn_click:setVisible(false)
        self.cancel_btn:setVisible(true)
        self.confirm_btn:setVisible(true)
        self.type_label:setVisible(false)
        self.sp_type:setVisible(false)
        self.node_relation:setVisible(false) --关系icon节点
        self.top_sprite:setVisible(true)
        self.image_5:setVisible(true)

        self.day_label:setVisible(false)
        self.Image_1:setVisible(true)
        self.role_name:setVisible(true)
        self.guild_name:setVisible(true)
        self.my_head:setVisible(true)
        self.grage_name:setVisible(true)
        self.arrow_bg:setVisible(true)
        self.team_name:setVisible(false)

        if data.type == 0 then 
            self.type_label:setString("")--申请
            self.lbl_text:setString("申")
        end 
        if data.type == 1 then 
            self.type_label:setString("")--邀请
            self.lbl_text:setString("邀")
            self.team_name:setVisible(true )
            self.team_name:setString(data.name.."的队伍")
        end 

        local _dun_id = data.max_dun_id
        if _dun_id== 0 then 
            _dun_id =10010 
        end 
        local _stage  =  Config.DungeonData.data_drama_dungeon_info(_dun_id)
        if _stage then 
            self.stage_label:setString(_stage.name)
        end 

    end 

    self.get_btn:setVisible(false)
    self.container:setTouchEnabled(false)
    local role_vo = RoleController:getInstance():getRoleVo()
    self.my_head:setHeadRes(data.face, false, LOADTEXT_TYPE, data.face_file, data.face_update_time)
    self.my_head:setLev(data.lev)
    self.my_head:setVIP(data.vip_lev) 

    self.role_name:setString(data.name)
    self.node_relation:setPositionX(self.role_name:getPositionX()+self.role_name:getContentSize().width)
    self.power_label:setNum(data.power)

    self.guild_name:setString("公会："..data.guild_name)
    self.grage_name:setString("段位："..data.arena_elite_lev)
  
    -- 最后一次登录时间 或者在线
    if data.online == 1 then 
        self.time:setString("在线")
    else 
        local last_time = data.login_time  or 0
        local less_time = GameNet:getInstance():getTime() - last_time
        self.time:setString(TimeTool.GetTimeFormatFriendShowTime(less_time))
    end 
  

    -- 加入多长时间TimeTool.getDayOrHour
    local last_time = data.join_time  or 0
    local less_time = GameNet:getInstance():getTime() - last_time
    self.day_label:setString(TimeTool.getDayOrHour(less_time))
    self:enableShowHeartSuo(data)
end

--添加关系icon节点 只需要传入玩家数据即可
function OrganizeTeamMyTeamItem:createRelationIcon(data)
    local common_relation_node = CommonRelationIconNode.new(data)
    self.node_relation:removeAllChildren()

    self.node_relation:addChild(common_relation_node)
    common_relation_node:setPosition(0,-70)
end


--是否显示同心锁
function OrganizeTeamMyTeamItem:enableShowHeartSuo(data)
    
    local is_spouse = role_controller:getModel():checkIsHaveSpouse() --是否有夫妻关系 true 有
    local cur_time = GameNet:getInstance():getTime()
    local join_time = data.join_time --加入队伍时间
    
    local dis_time = (cur_time-join_time)/86400
    local my_sex = self.role_vo:getRoleSex()
    local team_sex = data.sex --队友的性别
    local is_same = data.sex == my_sex --同性
    local enable = data.team_type == 2 and not is_same and not is_spouse and dis_time>=3 and data.online==1
    self.btn_heart_suo:setVisible(enable)

    local length = role_controller:getModel():getRelationListLength()
    local x,y = self.node_relation:getPosition()
    self.btn_heart_suo:setPosition(x+length*70,y)
end

function OrganizeTeamMyTeamItem:DeleteMe()
    for i,v in ipairs(self.item_list) do
        v:DeleteMe()
    end
    self.item_list = nil
    if self.data ~= nil then
      
        self.data = nil
    end
    self:removeAllChildren()
    self:removeFromParent()
end
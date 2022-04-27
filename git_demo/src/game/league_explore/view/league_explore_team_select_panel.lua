
LeagueExploreTeamSelectPanel = LeagueExploreTeamSelectPanel or BaseClass()
local controller = LeagueExploreController:getInstance()
local model = LeagueExploreController:getInstance():getModel()

function LeagueExploreTeamSelectPanel:__init(delay)
    self.delay = delay or 30
    self:createRootWnd()
end

function LeagueExploreTeamSelectPanel:createRootWnd()
    self:LoadLayoutFinish()
    self:registerCallBack()
end

function LeagueExploreTeamSelectPanel:closeCallBack()

end



function LeagueExploreTeamSelectPanel:LoadLayoutFinish()
    self.screen_bg = ccui.Layout:create()
    self.screen_bg:setAnchorPoint(cc.p(0.5, 0.5))
    self.screen_bg:setContentSize(cc.size(SCREEN_WIDTH, display.height))
    self.screen_bg:setPosition(SCREEN_WIDTH*0.5, SCREEN_HEIGHT*0.5)
    self.screen_bg:setTouchEnabled(true)
    self.screen_bg:setSwallowTouches(false)

    self.root_wnd = ccui.Widget:create()
    self.root_wnd:setTouchEnabled(true)
    self.root_wnd:setAnchorPoint(cc.p(0, 0))
    self.root_wnd:setPosition(cc.p(0, 0))
    self.screen_bg:addChild(self.root_wnd)
    
    self.background = ccui.ImageView:create(PathTool.getResFrame("exploration","hl_exploration_0012"), LOADTEXT_TYPE_PLIST)
    self.background:setScale9Enabled(true)
    self.background:setAnchorPoint(cc.p(0, 0))
    self.root_wnd:addChild(self.background)

    self.root_wnd:setContentSize(cc.size(449, 654))
    self.background:setContentSize(cc.size(449, 654))


    local size = cc.size(440,640)
    local setting = {
        item_class = LeagueExploreTeamSelectItem,
        start_x = 15 ,
        space_x = 0,
        start_y = 0,
        space_y = 4,
        item_width = 412,
        item_height = 122,
        row = 0,
        col = 1,
        need_dynamic = true
    }
    self.scroll_view = CommonScrollViewLayout.new(self.background, cc.p(5, 5), nil, nil, cc.size(size.width, size.height), setting)
    self.scroll_view:setSwallowTouches(false)
end


function LeagueExploreTeamSelectPanel:registerCallBack()
    self.screen_bg:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.began then
            LeagueExploreController:getInstance():closeTeamSelectPanel()
        end
    end)

    -- 获取成员列表
  
   
    EventManager:getInstance():Bind(LeagueExploreEvent.Set_Team_Success_Data,self,function(data)
         LeagueExploreController:getInstance():closeTeamSelectPanel()
    end)
end



function LeagueExploreTeamSelectPanel:open()
    local parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)
    parent:addChild(self.screen_bg)
	doStopAllActions(self.screen_bg)
    

    self:setData()
end



function LeagueExploreTeamSelectPanel:setData()
    local _data = model:getTeamMemberList() 

    if #_data==0 then 
        
    else
        self.scroll_view:setData(_data)
    end 
end


function LeagueExploreTeamSelectPanel:setPosition(x, y)
    self.root_wnd:setAnchorPoint(cc.p(0, 1))
    self.root_wnd:setPosition(cc.p(x, y))
end

function LeagueExploreTeamSelectPanel:addToParent(parent, zOrder)
    self.parent_wnd = parent
    if not tolua.isnull(self.root_wnd) then
        self.root_wnd:removeFromParent()
        if not tolua.isnull(parent) then
            self.parent_wnd:addChild(self.root_wnd,zOrder)
        end
    end
end

function LeagueExploreTeamSelectPanel:setPos(x, y)
    self.root_wnd:setPosition(cc.p(x, y))
end

function LeagueExploreTeamSelectPanel:getContentSize()
    return self.root_wnd:getContentSize()
end


function LeagueExploreTeamSelectPanel:getScreenBg()
    return self.screen_bg
end


function LeagueExploreTeamSelectPanel:setAnchorPoint(pos)
    self.screen_bg:setAnchorPoint(pos)
end




function LeagueExploreTeamSelectPanel:close()
    print("------------------close----------------------------")
    if self.scroll_view then
        self.scroll_view:DeleteMe()
        self.scroll_view = nil
    end
    if self.screen_bg then
	  doStopAllActions(self.screen_bg)
      self.screen_bg:removeFromParent()
      self.screen_bg = nil
    end

  
end


LeagueExploreTeamSelectItem = class("LeagueExploreTeamSelectItem",function()
    return ccui.Layout:create()
end)

function LeagueExploreTeamSelectItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("league_explore/league_explore_team_select_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.bg_image = self.root_wnd:getChildByName("bg_image")
    self.container = self.root_wnd:getChildByName("container")
    self.name_label = self.container:getChildByName("name_label")
    self.power_label = self.container:getChildByName("power_label")
    self.duwei_label = self.container:getChildByName("duwei_label")

    self.select_sprite = self.container:getChildByName("select_sprite")

    self.face_node  =  self.container:getChildByName("face")


    	
    self.role_head = PlayerHead.new(PlayerHead.type.circle)
    self.role_head:setPosition(0, 0)
    self.role_head:setScale(1)
    self.face_node:addChild(self.role_head)



    self.next_vip = CommonNum.new(106,self.container, 1, 0, cc.p(0, 0.5))
    self.next_vip:setPosition(300,108)

    self.select_sprite:setVisible(false)

    self:setTouchEnabled(true)
	self:setCascadeOpacityEnabled(true)

    -- self:buildLayout(cc.size(128,128),0.8)

    self:registerEvent()
end

function LeagueExploreTeamSelectItem:registerEvent()
        self:addTouchEventListener(
            function(sender, event_type)
                customClickAction(sender,event_type)
                if event_type == ccui.TouchEventType.ended then
                    if self.data.pos > 1000 then 
                        message("已上阵人不能重新上阵")
                        return
                    end 

                    local protocal = {}
                    protocal.id = model:getResourceID()
                    protocal.type = model:getCurrentType()
                    local _v = {}
                    _v[1] = {pos= model:getCurrentTeamPos(),rid = self.data.rid,srv_id = self.data.srv_id}
                    
                    protocal.pos_info= _v

                    controller:sender29303(protocal)
                   
                end
            end
        )

        self.role_head:addCallBack(function()
            if self.data ~= nil and self.data.srv_id ~= "" then
                if self.data.srv_id == "robot" then
                    message(TI18N("神秘人太高冷，不给查看"))
                else
                    FriendController:getInstance():openFriendCheckPanel(true, {srv_id = self.data.srv_id, rid = self.data.rid})
                end
            end
        end, false)
        
end

function LeagueExploreTeamSelectItem:addCallBack(call_back)
    self.call_back = call_back
end

function LeagueExploreTeamSelectItem:setData(data)
    self.data = data 
    
    self.name_label:setString(data.name )
    self.power_label:setString(data.power)
    self.duwei_label:setString("段位：".."")
   
    self.next_vip:setNum("v"..data.vip_lev)

    self.next_vip:setPositionX(self.name_label:getPositionX()+self.name_label:getContentSize().width+10)


    self.role_head:setHeadRes(data.face, false, LOADTEXT_TYPE)
    self.role_head:setLev(data.lev)


    if data.pos > 1000 then 
        self.select_sprite:setVisible(true)
    else
        self.select_sprite:setVisible(false)

    end 
  

end








-- 裁剪 切割
function LeagueExploreTeamSelectItem:buildLayout(size,scale)
	local scale = 1 or scale
    self.vSize =size
	self.mask_res = mask_res or PathTool.getResFrame("common", "hl_common_108") -- 圆
	self.head_panel = ccui.Widget:create()
	self.head_panel:setAnchorPoint(cc.p(0.5,0.5))
	self.head_panel:setContentSize(self.vSize)
	self.head_panel:setPosition(self.vSize.width/2-66, self.vSize.height/2-62)
	self.head_panel:setCascadeOpacityEnabled(true)
	self.face_node:addChild(self.head_panel,1)

	if self.mask_res ~= nil then
		self.mask = createSprite(self.mask_res, self.vSize.width/2, self.vSize.height/2, nil, cc.p(0.5, 0.5))
		self.clipNode = cc.ClippingNode:create(self.mask)
		self.clipNode:setAnchorPoint(cc.p(0.5,0.5))
		self.clipNode:setContentSize(self.vSize)
		self.clipNode:setCascadeOpacityEnabled(true)
		self.clipNode:setPosition(self.vSize.width/2,self.vSize.height/2 )
		self.clipNode:setAlphaThreshold(0)
		self.head_panel:addChild(self.clipNode,1)

		self.head_icon = ccui.ImageView:create()
		self.head_icon:setCascadeOpacityEnabled(true)
		self.head_icon:setAnchorPoint(0.5,0.5)
		self.head_icon:setPosition(self.vSize.width/2,self.vSize.height/2)
		self.clipNode:addChild(self.head_icon,1)
        self.clipNode:setScale(0.85)
	else
		self.head_icon = ccui.ImageView:create()
		self.head_icon:setCascadeOpacityEnabled(true)
		self.head_icon:setAnchorPoint(0.5,0.5)
        self.head_icon:setPosition(self.vSize.width/2,self.vSize.height/2)
		self.head_panel:addChild(self.head_icon)
	end
end

function LeagueExploreTeamSelectItem:DeleteMe()
   
    self:removeAllChildren()
    self:removeFromParent()
end
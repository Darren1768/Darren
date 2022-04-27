
LeagueExploreVideoSelectPanel = LeagueExploreVideoSelectPanel or BaseClass()
local controller = LeagueExploreController:getInstance()
local model = LeagueExploreController:getInstance():getModel()

function LeagueExploreVideoSelectPanel:__init(delay)
    self.delay = delay or 30
    self.select_combox_type = 0
    self:createRootWnd()
end

function LeagueExploreVideoSelectPanel:createRootWnd()
    self:LoadLayoutFinish()
    self:registerCallBack()
end

function LeagueExploreVideoSelectPanel:closeCallBack()

end

function LeagueExploreVideoSelectPanel:LoadLayoutFinish()
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
    
    self.background = ccui.ImageView:create(PathTool.getResFrame("common2","hl_common_0030"), LOADTEXT_TYPE_PLIST)
    self.background:setScale9Enabled(true)
    self.background:setAnchorPoint(cc.p(0, 0))
    self.root_wnd:addChild(self.background)

    self.root_wnd:setContentSize(cc.size(132, 120))
    self.background:setContentSize(cc.size(132, 120))

end 

function LeagueExploreVideoSelectPanel:registerCallBack()
    self.screen_bg:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.began then
            LeagueExploreController:getInstance():closeVideoSelectPanel()
        end
    end)

    -- 获取成员列表
    -- EventManager:getInstance():Bind(LeagueExploreEvent.Set_Team_Success_Data,self,function(data)
    --      LeagueExploreController:getInstance():closeVideoSelectPanel()
    -- end)
end



function LeagueExploreVideoSelectPanel:open(list)
    local parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)
    parent:addChild(self.screen_bg)
	doStopAllActions(self.screen_bg)

    self.data = model:getVideoData() 
    self:setData()
end


function LeagueExploreVideoSelectPanel:setData()
    self.combox_list ={}
    for i=1,10 do 
        local vo = {}
        vo.combox_type= i 
        vo.desc= "回放"..i
        table.insert( self.combox_list ,vo )
    end 
    -- self.data = self.combox_list
    local height = #self.data* 40 

    self.root_wnd:setContentSize(cc.size(132, height))
    self.background:setContentSize(cc.size(132, height))
    self:showComboboxList(true)
end


--更新下拉框
function LeagueExploreVideoSelectPanel:showComboboxList(status)
    if status then
        self.is_show_combobox_panel = true
        if self.combox_item_list ==nil then
            self.combox_item_list = {}
            local count = #self.data
            local item_height = 40

            local total_height = count * item_height +10
            self.background:setContentSize(cc.size(132, total_height))
            
            local x = 132 * 0.5
            local start_y = #self.data* 40 +10
            for i,v in ipairs(self.data) do
                local index = i
                local item = self:createNewComboxItem(item_height, function()
                    for i,v in ipairs(self.data) do
                        if v.combox_type == index then
                            if self.combox_item_list[i] then
                                self.combox_item_list[i].mark_img:setVisible(true)
                                self.combox_item_list[i].label:setColor(cc.c3b(250,232,150))
                            end
                        else
                            if self.combox_item_list[i] then
                                self.combox_item_list[i].mark_img:setVisible(false)
                                self.combox_item_list[i].label:setColor(cc.c3b(255,252,220))
                            end
                        end
                    end
                    if index ~= self.select_combox_type then
                        print("----------index-------------",index )
                        self.select_combox_type =index 
                        self:_onClickBtnWatch(self.data[index])
                        --需要跳转页面去看视频
                        self:showComboboxList(false)
                    end
                end)
                item.label:setString(self.combox_list[i].desc)
                item.layout:setPosition(x-7, start_y - item_height * 0.5 - (i-1) * item_height )
                self.background:addChild(item.layout)
                self.combox_item_list[i] = item
            end
        end
        for i,v in ipairs(self.combox_list) do
            if v.combox_type == self.select_combox_type then
                if self.combox_item_list[i] then
                    self.combox_item_list[i].mark_img:setVisible(true)
                    self.combox_item_list[i].label:setColor(cc.c3b(250,232,150))
                end
            else
                if self.combox_item_list[i] then
                    self.combox_item_list[i].mark_img:setVisible(false)
                    self.combox_item_list[i].label:setColor(cc.c3b(255,252,220))
                end
            end
        end
    else
        self.is_show_combobox_panel = false
        self.background:setVisible(false)
    end
end

function LeagueExploreVideoSelectPanel:createNewComboxItem(height, callback)
    local width = 132 
    local height = height or 40
    local cell = {}
    cell.layout = ccui.Layout:create()
    cell.layout:setCascadeOpacityEnabled(true)
    cell.layout:setAnchorPoint(0.5,0.5)
    cell.layout:setTouchEnabled(true)
    cell.layout:setContentSize(cc.size(width, height))

    local size = cc.size(width, height)

    local mark_res = PathTool.getResFrame("common2", "hl_common_0106")
    cell.mark_img = createSprite(mark_res,width/2, height/2, cell.layout, cc.p(0.5,0.5), LOADTEXT_TYPE_PLIST)
    
    cell.label = createLabel(20, cc.c4b(255,252,220,0xff), nil,  width/2-30, height * 0.5 , "", cell.layout, nil, cc.p(0,0.5))

    cell.layout:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.began then
     
        elseif event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            -- 点击-->
            if callback then
                callback()
            end
        end
    end)
    return cell
end


function LeagueExploreVideoSelectPanel:_onClickBtnWatch(data)
    if data and data.replay_id and data.replay_srv_id then
        BattleController:getInstance():csRecordBattle(data.replay_id, data.replay_srv_id)
    end
end


function LeagueExploreVideoSelectPanel:setPosition(x, y)
    self.root_wnd:setAnchorPoint(cc.p(0, 1))
    self.root_wnd:setPosition(cc.p(x, y))
end

function LeagueExploreVideoSelectPanel:addToParent(parent, zOrder)
    self.parent_wnd = parent
    if not tolua.isnull(self.root_wnd) then
        self.root_wnd:removeFromParent()
        if not tolua.isnull(parent) then
            self.parent_wnd:addChild(self.root_wnd,zOrder)
        end
    end
end

function LeagueExploreVideoSelectPanel:setPos(x, y)
    self.root_wnd:setPosition(cc.p(x, y))
end

function LeagueExploreVideoSelectPanel:getContentSize()
    return self.root_wnd:getContentSize()
end


function LeagueExploreVideoSelectPanel:getScreenBg()
    return self.screen_bg
end


function LeagueExploreVideoSelectPanel:setAnchorPoint(pos)
    self.screen_bg:setAnchorPoint(pos)
end




function LeagueExploreVideoSelectPanel:close()
    print("------------------close----------------------------")
    if self.screen_bg then
	  doStopAllActions(self.screen_bg)
      self.screen_bg:removeFromParent()
      self.screen_bg = nil
    end

  
end





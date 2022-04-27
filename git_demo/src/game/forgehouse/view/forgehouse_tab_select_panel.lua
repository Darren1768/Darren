
ForgehouseTabSelectPanel = ForgehouseTabSelectPanel or BaseClass()
local controller = ForgeHouseController:getInstance()
local model = ForgeHouseController:getInstance():getModel()

function ForgehouseTabSelectPanel:__init(selectIndex,redStaus)
    self.delay = delay or 30
    self.select_combox_type = selectIndex
    self.red_status = redStaus
    self:createRootWnd()
end

function ForgehouseTabSelectPanel:createRootWnd()
    self:LoadLayoutFinish()
    self:registerCallBack()
end

function ForgehouseTabSelectPanel:closeCallBack()

end

function ForgehouseTabSelectPanel:LoadLayoutFinish()
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
    self.background:setContentSize(cc.size(142, 120))

    self.background:setCapInsets(cc.rect(8, 8, 8, 8))   --(0,0,0,3)
  
    self.root_wnd:setContentSize(cc.size(142, 120))

end 

function ForgehouseTabSelectPanel:registerCallBack()
    self.screen_bg:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.began then
            ForgeHouseController:getInstance():closeForgehouseSelectPanel()
        end
    end)
end


function ForgehouseTabSelectPanel:open(list)
    local parent = ViewManager:getInstance():getLayerByTag(ViewMgrTag.MSG_TAG)
    parent:addChild(self.screen_bg)
	doStopAllActions(self.screen_bg)
    self:setData()
end


function ForgehouseTabSelectPanel:setData()
    self.combox_list = {
        [1] = {combox_type = 1, desc = TI18N("武器")},
        [2] = {combox_type = 2, desc = TI18N("衣服")},
        [3] = {combox_type = 3, desc = TI18N("头盔")},
        [4] = {combox_type = 4, desc = TI18N("鞋子")},
    } 
    self.data = self.combox_list
    local height = #self.data* 40 

    self.root_wnd:setContentSize(cc.size(142, height))
    self.background:setContentSize(cc.size(142, height))
    self:showComboboxList(true)
end


--更新下拉框
function ForgehouseTabSelectPanel:showComboboxList(status)
    if status then
        self.is_show_combobox_panel = true
        if self.combox_item_list ==nil then
            self.combox_item_list = {}
            local count = #self.data
            local item_height = 40

            local total_height = count * item_height +10
            self.background:setContentSize(cc.size(142, total_height))
            
            local x = 142 * 0.5
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
                        self:_onClickBtnWatch(self.data[index].combox_type)
                        --需要跳转页面去看视频
                        self:showComboboxList(false)
                    end
                end)
                item.label:setString(self.combox_list[i].desc)
                item.layout:setPosition(x-7, start_y - item_height * 0.5 - (i-1) * item_height )
                self.background:addChild(item.layout)
                self.combox_item_list[i] = item
                addRedPointToNodeByStatusLeft( item.layout,self.red_status[i] ,10) 

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

function ForgehouseTabSelectPanel:createNewComboxItem(height, callback)
    local width = 142 
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


function ForgehouseTabSelectPanel:_onClickBtnWatch(index)
     controller:tabChangeView(index )
  
end


function ForgehouseTabSelectPanel:setPosition(x, y)
    self.root_wnd:setAnchorPoint(cc.p(0, 1))
    self.root_wnd:setPosition(cc.p(x, y))
end

function ForgehouseTabSelectPanel:addToParent(parent, zOrder)
    self.parent_wnd = parent
    if not tolua.isnull(self.root_wnd) then
        self.root_wnd:removeFromParent()
        if not tolua.isnull(parent) then
            self.parent_wnd:addChild(self.root_wnd,zOrder)
        end
    end
end

function ForgehouseTabSelectPanel:setPos(x, y)
    self.root_wnd:setPosition(cc.p(x, y))
end

function ForgehouseTabSelectPanel:getContentSize()
    return self.root_wnd:getContentSize()
end


function ForgehouseTabSelectPanel:getScreenBg()
    return self.screen_bg
end


function ForgehouseTabSelectPanel:setAnchorPoint(pos)
    self.screen_bg:setAnchorPoint(pos)
end




function ForgehouseTabSelectPanel:close()
    print("------------------close----------------------------")
    if self.screen_bg then
	  doStopAllActions(self.screen_bg)
      self.screen_bg:removeFromParent()
      self.screen_bg = nil
    end

  
end





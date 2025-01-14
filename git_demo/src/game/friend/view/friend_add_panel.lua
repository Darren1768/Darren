-- --------------------------------------------------------------------
-- 竖版添加好友列表
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
FriendAddPanel = class("FriendAddPanel", function()
        return ccui.Widget:create()
    end)

function FriendAddPanel:ctor()  
    self:config()
    self:layoutUI()
    self:registerEvents()
end
function FriendAddPanel:config()
    self.ctrl = FriendController:getInstance()

    self.scroll_width = 610
    self.scroll_height = 492

    self.create_index = 1

    self.rend_list = Array.New()
    self.cache_list = {}
    self.is_init = true

    self.default_msg = TI18N("请输入玩家昵称")
    self.size = cc.size(558,673)
    self:setContentSize(self.size)
end
function FriendAddPanel:layoutUI()
    local csbPath = PathTool.getTargetCSB("friend/friend_find_panel")
    local root = createCSBNote(csbPath)
    self:addChild(root)
   

    self.main_panel = root:getChildByName("main_panel")
    self.container = self.main_panel:getChildByName("bg") 
    self.top_panel = self.main_panel:getChildByName("top_panel")
    self.top_panel:setZOrder(100)

    --刷新按钮
    self.find_btn = self.top_panel:getChildByName("find_btn")
    self.flash_btn = self.main_panel:getChildByName("flash_btn")
    
    local size = cc.size(453,39)
    local res = PathTool.getResFrame("common", "hl_common_31")
    self.edit_box =  createEditBox(self.top_panel, res,size, nil, 24, Config.ColorData.data_color3[151], 20, self.default_msg, nil, nil, LOADTEXT_TYPE_PLIST, nil, nil--[[, cc.KEYBOARD_RETURNTYPE_SEND]])
    self.edit_box:setAnchorPoint(cc.p(0,0))
    local color=cc.c3b(116,88,60)
    self.edit_box:setPlaceholderFontColor(color)
    self.edit_box:setFontColor(color)
    self.edit_box:setPosition(cc.p(30,36))
    self.edit_box:setMaxLength(14)
    self.edit_box:setPlaceholderFontName("fonts/title.ttf")
    self.edit_box:setFontName("fonts/title.ttf")
    local function editBoxTextEventHandle(strEventName,pSender)
        if strEventName == "return" then
            local str = pSender:getText()
            if GmCmd and GmCmd.show_from_chat and GmCmd:show_from_chat(str) then return end
        end
    end
    if not tolua.isnull(self.edit_box) then
        self.edit_box:registerScriptEditBoxHandler(editBoxTextEventHandle)
    end

    local size = self.container:getContentSize()
    local x, y = self.container:getPosition()
    self.scroll_view = createScrollView( size.width,size.height,558/2,y,self.main_panel,ccui.ScrollViewDir.vertical)
    self.scroll_view:setLocalZOrder(10)
    self.scroll_view:setAnchorPoint(cc.p(0.5,0))

    self.num_label = self.main_panel:getChildByName('text_num')
    self.num_label:setFontSize(24)
    self.num_label:setTextColor(cc.c3b(98,53,43))

    local online_num, all_num = self.ctrl:getModel():getFriendOnlineAndTotal() 
    local str = string.format(TI18N("好友数：%s/%s"),all_num,100)
    self.num_label:setString(str)

end

function FriendAddPanel:setData(data)
    if not data then return end
    self.data = data
end

function FriendAddPanel:setApplyNum(num)
    num = num or 0
    local str = string.format(TI18N("申请数：%s/%s"),num,99)
    self.num_label:setString(str)
end
--事件
function FriendAddPanel:registerEvents()
    --申请好友列表返回
    EventManager:getInstance():Bind(FriendEvent.UD_COMMEND_LIST,self,function(data_list)
            self:updateFriendList(data_list)
        end)

    EventManager:getInstance():Bind(FriendEvent.FRIEND_QUERY_RESULT,self, function(data_list)


            self:updateFriendList(data_list)

        end)


    self.flash_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                self.ctrl:recommend()

            end
        end)

    self.find_btn:addTouchEventListener(function(sender, event_type)
        print("----------------find_btn------------------") 
            if event_type == ccui.TouchEventType.ended then
                playCommonButtonSound()
                local name = self.edit_box:getText() or ""
                if name == "" then
                    message(self.default_msg)
                    return
                end
                self.ctrl:queryFind(name)
            end
        end)

    --请求推荐列表
    self.ctrl:recommend()
end

--显示空白
function FriendAddPanel:showEmptyIcon(bool)

    local str = TI18N("未搜索到玩家")

    commonShowEmptyIcon(self.main_panel,bool,{text = str})
end


function FriendAddPanel:updateFriendList(data_list)
    for i,v in pairs(self.cache_list) do 
        v:setVisible(false)
    end
    self.create_index = 1
    local list = Array.New()
    for i,v in pairs(data_list) do 
        v._index= i 
        list:PushBack(v)
    end
    self.rend_list = list or Array.New()

    self:showEmptyIcon(false)
    if list:GetSize()<=0 then 
        self:showEmptyIcon(true)
        return
    end
    if self.is_init == true then 
        self:setscheduleUpdate(true)
        self.is_init = false
    else
        for i=1,list:GetSize() do 
            self:createItem(list:Get(i-1))
        end
    end
end

function FriendAddPanel:setscheduleUpdate(status)
    if status == true then
        if self.queue_timer == nil then
            self.queue_timer = GlobalTimeTicket:getInstance():add(function()
                    local vo = self.rend_list:Get(self.create_index-1)
                    if vo then
                        self:createItem(vo)
                    end
                    if self.create_index >=self.rend_list:GetSize()+1 then 
                        self:setscheduleUpdate(false)
                    end
                end, 1/display.DEFAULT_FPS)
        end
    else
        if self.queue_timer ~= nil then
            GlobalTimeTicket:getInstance():remove(self.queue_timer)
            self.queue_timer = nil
        end
    end
end

function FriendAddPanel:createItem(vo)
    local item
    if self.cache_list[self.create_index] == nil then
        item = FriendListItem2.new(self.create_index,FriendConst.Type.AddFriend)
        self.cache_list[self.create_index] = item
        self.scroll_view:addChild(item)
    end
    item = self.cache_list[self.create_index]
    local offy = self.scroll_height-120*self.create_index
    item:setPosition(cc.p(self.scroll_view:getContentSize().width/2,offy))
    item:setVisible(true)
    item:setExtendData(FriendConst.Type.AddFriend)
    item:setData(vo)
    self.create_index = self.create_index +1
end


function FriendAddPanel:setCallFun(call_fun)
    self.call_fun =call_fun
end
function FriendAddPanel:setVisibleStatus(bool)
    self:setVisible(bool)
end



function FriendAddPanel:DeleteMe()
    self.ctrl:openFriendFindWindow(false)
    self:setscheduleUpdate(false)
    for i,v in pairs(self.cache_list) do 
        if v and v["DeleteMe"] then 
            v:DeleteMe()
        end
    end
    self.cache_list = nil
    EventManager:getInstance():UnBind(self)
end




-- --------------------------------------------------------------------
-- 竖版好友黑名单
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
FriendBlackPanel = class("FriendBlackPanel", function()
    return ccui.Widget:create()
end)

function FriendBlackPanel:ctor()  
    self:config()
    self:layoutUI()
    self:registerEvents()
end
function FriendBlackPanel:config()
    self.ctrl = FriendController:getInstance()
    self.size = cc.size(558,673)
    self:setContentSize(self.size)
    self.item_list = {}
end
function FriendBlackPanel:layoutUI()
    local csbPath = PathTool.getTargetCSB("friend/friend_black_panel")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)
    
    self.main_panel = self.root_wnd:getChildByName("main_panel")
    
   
    self.icon = self.main_panel:getChildByName("icon")
    self.num_label = self.icon:getChildByName("text")
    self.num_label:setFontSize(24)
    self.num_label:setTextColor(cc.c3b(98,53,43))
end

function FriendBlackPanel:setData(data)
    if not data then return end
    self.data = data

    local online_num, all_num = self.ctrl:getModel():getBlackListOnlineAndTotal() 
    local str = string.format(TI18N("黑名单数：%s/%s"),all_num,50)
    self.num_label:setString(str)
end

--事件
function FriendBlackPanel:registerEvents()
    
end
function FriendBlackPanel:setCallFun(call_fun)
    self.call_fun =call_fun
end
function FriendBlackPanel:setVisibleStatus(bool)
    self:setVisible(bool)
end



function FriendBlackPanel:DeleteMe()
    
end




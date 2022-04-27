-- --------------------------------------------------------------------
-- 好友申请，删除好友列表
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
FriendApplyPanel = class("FriendApplyPanel", function()
        return ccui.Widget:create()
    end)

function FriendApplyPanel:ctor()  

    self:config()
    self:layoutUI()
    self:registerEvents()
end

function FriendApplyPanel:config()
    self.ctrl = FriendController:getInstance()
    self.size = cc.size(558,673)
    self:setContentSize(self.size)
    self.item_list = {}
end

function FriendApplyPanel:layoutUI()
    local csbPath = PathTool.getTargetCSB("friend/friend_apply_panel")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    self.main_panel = self.root_wnd:getChildByName("main_panel")

    self.icon = self.main_panel:getChildByName("icon")
    self.num_label = self.icon:getChildByName("text")

    self.num_label:setFontSize(24)
    self.num_label:setTextColor(cc.c3b(98,53,43))
end

function FriendApplyPanel:setData(data)
    if not data then return end
    self.data = data
end

function FriendApplyPanel:setApplyNum(num)
    
    local res = PathTool.getResFrame("friend","friend_6")
    self.icon:loadTexture(res, LOADTEXT_TYPE_PLIST)
    num = num or 0
    local str = string.format(TI18N("申请数：%s/%s"),num,99)
    self.num_label:setString(str)
end

function FriendApplyPanel:setDelNum(num)
    -- local res = PathTool.getResFrame("common","hl_common_27")
    local res = PathTool.getResFrame("friend","friend_4")
    self.icon:loadTexture(res, LOADTEXT_TYPE_PLIST)
    num = num or 0
    local str = string.format(TI18N("好友数：%s/%s"),num,99)
    self.num_label:setString(str)
end

--事件
function FriendApplyPanel:registerEvents()

end
function FriendApplyPanel:setCallFun(call_fun)
    self.call_fun =call_fun
end
function FriendApplyPanel:setVisibleStatus(bool)
    self:setVisible(bool)
end



function FriendApplyPanel:DeleteMe()

end




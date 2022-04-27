--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-12 16:05:23
]]
ChatTabNode = class("ChatTabNode",function() return ccui.Widget:create() end)
local ui_size = cc.size(95,185)
function ChatTabNode:ctor()
    self:configUi()
end

function ChatTabNode:configUi()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("mainui/chat_tab_node"))
    self:addChild(self.root_wnd)
    self:setCascadeOpacityEnabled(true)
    self:setAnchorPoint(0,0)
    self:setContentSize(ui_size)


    self.main_container = self.root_wnd:getChildByName("main_container")
    self.main_container:setSwallowTouches(false)
    self.sp_hole = self.main_container:getChildByName("hole") --位于第一个item才显示

    self.tab_btn_1 = self.main_container:getChildByName("tab_btn_1") --按钮
    self.tab_btn_1:setSwallowTouches(false)

    self.title = self.tab_btn_1:getChildByName("title") --标题
    self.light = self.tab_btn_1:getChildByName("light") --选中状态时候显示
    self.lbl_title_light = self.light:getChildByName("title") --选中状态时候显示

    self.tab_tips = self.tab_btn_1:getChildByName("tab_tips") --红点节点
    self.lbl_red_num = self.tab_tips:getChildByName("red_num") --红点数量

    self.line = self.main_container:getChildByName("line") --位于第一个item时候显示的红线
    self.line_0 = self.main_container:getChildByName("line_0") --非第一个item时候显示的红线


    self.tab_btn_1:addTouchEventListener(function(sender, event)
        if event == ccui.TouchEventType.ended then
            if self.itemData.is_open == true then
                if self.callback then self.callback(self.itemData.index) end
            else
                message(self.itemData.notice)
            end
        end
    end)
end

function ChatTabNode:setCallback(callback)
    self.callback = callback
end


function ChatTabNode:setData(data)
    self.itemData = data
    self:updateContent(data)
end

--处理数据
function ChatTabNode:updateContent(data)
    if not data then return end

    self.title:setString(data.title)
    self.lbl_title_light:setString(data.title)
    self.sp_hole:setVisible(data.index == 1)
    self.line:setVisible(data.index == 1)
    self.line_0:setVisible(data.index ~= 1)

    setChildUnEnabled(not data.is_open, self.tab_btn_1)
end

--设置红点显示和数量显示
function ChatTabNode:setDotNum(num)
    local num = num or 0
    local enable_show = num>0
    num = num>=99 and "99" or tostring(num)

    self.tab_tips:setVisible(enable_show)
    self.lbl_red_num:setString(num)
end

--item选中显示
function ChatTabNode:enableShowSelect(enable)
    print("==============enableShowSelect====",tostring(enable))
    self.light:setVisible(enable)
end
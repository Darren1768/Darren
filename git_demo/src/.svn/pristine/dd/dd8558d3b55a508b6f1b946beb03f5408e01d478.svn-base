--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-13 13:22:39
]]
UnionBuffPanel = class("UnionBuffPanel", function()
	return ccui.Layout:create()
end)

local controller = UnionController:getInstance()

function UnionBuffPanel:ctor(ctrl) 
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("union/union_buff_panel"))
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd) 

    self.empty_tips = self.root_wnd:getChildByName("empty_tips")
    self.desc = self.empty_tips:getChildByName("desc")
    -- self.desc:setString(TI18N("暂无任何联盟信息"))
    self.scroll_container = self.root_wnd:getChildByName("background")

    self.checkbox = self.root_wnd:getChildByName("checkbox")
    self.checkbox:setScale(0.8)
    local name = self.checkbox:getChildByName("name")
    name:setString(TI18N(""))
    self.checkbox:setSelected(false)
    self.checkbox:setVisible(false)

    self.btn_close = self.root_wnd:getChildByName("btn_close")


    self:registerEvent()
    self:addScrollView()
end

function UnionBuffPanel:registerEvent()

   registerButtonEventListener(self.btn_close, function () 
       
        controller:openUnionBuffWindow(false)
   end,false, 1)
end

function UnionBuffPanel:addScrollView()
    if self.scroll_view == nil then
        local list_size = self.scroll_container:getContentSize()
        local list_setting = {
            item_class = UnionBuffItem,
            start_x = 4,
            space_x = 4,
            start_y = 0,
            space_y = 6,
            item_width = 558,
            item_height = 108, 
            row = 0,
            col = 1,
            need_dynamic = true
        } 
        self.scroll_view = CommonScrollViewLayout.new(self.scroll_container, cc.p(0,5), nil, nil, cc.size(list_size.width, list_size.height-10), list_setting) 
    end
end

function UnionBuffPanel:setData(data,is_init)
    self.buff_data = data
    print("============================buff初始化数据===============")
    printLuaTable(data)
    self:updateUnionList(data,is_init)
end
function UnionBuffPanel:updateUnionList(data,is_init)
    if data == nil or next(data) == nil then
        self.empty_tips:setVisible(true)
    else
        self.empty_tips:setVisible(false) 
        if not is_init then
            -- local sort_function = function(a,b)
            --     return a.status>b.status
            -- end
            self.scroll_view:resetPosition()
        else
            self.scroll_view:setData(data)
        end
    end
end

function UnionBuffPanel:DeleteMe()
    -- EventManager:getInstance():UnBind(self)
    if self.scroll_view then
        self.scroll_view:DeleteMe()
        self.scroll_view = nil
    end
end 
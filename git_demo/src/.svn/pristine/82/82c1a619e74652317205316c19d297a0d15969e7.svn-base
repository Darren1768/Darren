--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2022-04-13 14:40:20
]]
UnionBuffWindow = UnionBuffWindow or BaseClass(BaseView)

local role_controller = RoleController:getInstance()
function UnionBuffWindow:__init()
    self.ctrl = UnionController:getInstance()
	self.model = self.ctrl:getModel()
	self.win_type = WinType.Big
    self.is_mini_view = true
    self.show_background = false
    self.show_close_btn = false
    -- self.click_dark_backgroud = false  --是否允许点击背景关闭

    self.title_str = TI18N("增益领取")

    -- self.res_list = {
	-- 	{path = PathTool.getPlistImgForDownLoad("union", "union"), type = ResourcesType.plist},
	-- }
end

function UnionBuffWindow:open_callback()
    self.container:removeAllChildren()

    local panel_buff = UnionBuffPanel.new()
    self.panel_buff = panel_buff
    self.container:addChild(panel_buff)

    self.is_init = true
end

function UnionBuffWindow:openRootWnd()
    role_controller:sender29711()
end

function UnionBuffWindow:register_event()
    EventManager:getInstance():Bind(RoleEvent.UpdateBuffData,self,function()
        self:updatePanelData()
    end)
end

function UnionBuffWindow:updatePanelData()
    if not self.panel_buff then return end

    local buff_list = role_controller:getModel():getBuffData()
    self.panel_buff:setData(buff_list,self.is_init)
    self.is_init = nil
end


function UnionBuffWindow:close_callback()
    self.ctrl:openUnionBuffWindow(false)
    self.panel_buff:DeleteMe()
	self.panel_list = nil
end
-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      无尽试炼排行榜主界面
-- --------------------------------------------------------------------
EndlessFirstRewardWindow = EndlessFirstRewardWindow or BaseClass(BaseView)

local controller = Endless_trailController:getInstance()
local model = Endless_trailController:getInstance():getModel()
local string_format = string.format

function EndlessFirstRewardWindow:__init(type,endless_type)
    -- --self.view_tag = ViewMgrTag.DIALOGUE_TAG
    -- self.win_type = WinType.Full
    self.win_type = WinType.Mini
    self.view_tag = ViewMgrTag.DIALOGUE_TAG  
    self.type = type 
    self.endless_type = endless_type
    
    self.title_str = TI18N("首通奖励")

    --self.layout_name = "endlesstrail/endlesstrail_rank_window"
    self.res_list = {
        {path = PathTool.getSingleImgForDownLoad("bigbg", "bigbg_3"), type = ResourcesType.single}
    }

    self.tab_info_list = {
        {label = TI18N("单人\n模式"), index = 1 , status = true},
        {label = TI18N("全体\n模式"),index = 2, status = true},
    }
    self.selected_tab = nil -- 当前选中的标签
    self.tab_list = {}
    self.panel_list = {}
    self.show_close_btn = false
end

function EndlessFirstRewardWindow:open_callback()
  

end

function EndlessFirstRewardWindow:register_event()
  
end

function EndlessFirstRewardWindow:openRootWnd(type,endless_type)
    self.type = type or 1
    self.endless_type= endless_type
    self:setSelecteTab(type)
end

function EndlessFirstRewardWindow:selectedTabCallBack(index)
    self:changeSelectedTab(index)
end
--==============================--
--desc:切换标签页
--@index:
--@return
--==============================--
function EndlessFirstRewardWindow:changeSelectedTab(index)
    if self.selected_tab ~= nil then
        if self.selected_tab.index == index then
            return
        end
    end
    if self.selected_tab then
        self.selected_tab.label:setTextColor(cc.c4b(0xf5, 0xe0, 0xb9, 0xff))
        self.selected_tab:setBright(false)
        self.selected_tab = nil
    end
    self.selected_tab = self.tab_list[index]
    if self.selected_tab then
        self.selected_tab.label:setTextColor(cc.c4b(0x59, 0x34, 0x29, 0xff))
        self.selected_tab:setBright(true)
    end
    if self.cur_panel ~= nil then
        self.cur_panel:setNodeVisible(false)
        self.cur_panel = nil
    end

    self.cur_panel = self.panel_list[index]
    if self.cur_panel == nil then
        if index == 1 then
            self.cur_panel = EndlessFirstRewardPanel.new(self.endless_type)
            self.cur_panel:setPosition(cc.p(20 ,4))

        elseif index ==  2 then
            self.cur_panel = EndlessFirstRewardPanel.new(self.endless_type)
            self.cur_panel:setPosition(cc.p(20 ,4))

        end
        self.panel_list[index] = self.cur_panel
        self.container:addChild(self.cur_panel)
        if self.cur_panel.addToParent then
            self.cur_panel:addToParent()
        end

    end
    self.cur_panel:setNodeVisible(true)
end

function EndlessFirstRewardWindow:close_callback()
    controller:openEndlessFirstRewardWindow(false)

    for k, panel in pairs(self.panel_list) do
        panel:DeleteMe()
    end
    self.panel_list = {}
end

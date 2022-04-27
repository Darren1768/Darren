--伙伴状态设置界面
--
local chat_controller = ChatController:getInstance()
local ref_controller = RefController:getInstance()

TipButtonsPanel = class("TipButtonsPanel", function()
        return ccui.Widget:create()
    end)

function TipButtonsPanel:ctor(ctrl,parent)
    self.button_names = {'教学','图鉴','编队','队伍','热度','录像'}
    self.button_index = {MainuiConst.icon.teacher,MainuiConst.icon.whole_pic,MainuiConst.icon.formation,MainuiConst.icon.troops,
        MainuiConst.icon.temperature,MainuiConst.icon.vedio}

    self.button_list = {}
    self.time = 0

    self.root_wnd = createCSBNote(PathTool.getTargetCSB("mainui/tip_buttons_panel"))
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.main_panel = self.root_wnd:getChildByName("main_panel")

    for i=1,6 do
        self.button_list[i] = self.main_panel:getChildByName("btn_"..i)
        resetStudioButton(self.button_list[i],ButtonType.red,TI18N(self.button_names[i]))
    end

    addRedPointToNodeByStrs(self.button_list[6],{MainuiConst.red_str.vedio})
    addRedPointToNodeByStrs(self.button_list[3],{MainuiConst.red_str.formation})

    self:register_event()
end

function TipButtonsPanel:register_event()



    --按钮
    handleTouchEnded(self.button_list[1], function()
            TrainingcampController:getInstance():openTrainingcampWindow(true)
        end)
    handleTouchEnded(self.button_list[3], function()
            HeroController:getInstance():openFormMainWindow(true)
        end)
    handleTouchEnded(self.button_list[4], function()
        OrganizeController:getInstance():openOrganizeTeamWindow(true)
    end)
    handleTouchEnded(self.button_list[6], function()
            VedioController:getInstance():openVedioMainWindow(true)
        end)


end

function TipButtonsPanel:close_callback()

end

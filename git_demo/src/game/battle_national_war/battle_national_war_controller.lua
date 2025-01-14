-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
BattleNationalWarController = BattleNationalWarController or BaseClass(BaseController)

function BattleNationalWarController:config()
    self.dispather = EventManager:getInstance()
    self.model = BattleNationalWarModel.New(self)
    
    self.allRedDatas = {}
end

function BattleNationalWarController:getModel()
    return self.model
end

function BattleNationalWarController:registerEvents()
end

function BattleNationalWarController:registerProtocals()
    -- self:RegisterProtocal(21010, "handle21010")
end

-- function DayChargeController:sender21010()
--     self:SendProtocal(21010, {})
-- end
-- function DayChargeController:handle21010(data)
    
--     EventManager:getInstance():Fire(DayChargetEvent.DAY_FIRST_CHARGE_EVENT, data)
-- end

--
----------- @ 界面相关
-- 打开区场景
function BattleNationalWarController:openNationalOneScene(status, data)
    if status == true then
        if not self.national_one_wnd then
            self.national_one_wnd = BattleNationalWarOneWindow.New(data)
        end
        if self.national_one_wnd:isOpen() == false then
            self.national_one_wnd:open()
        end
    else
        if self.national_one_wnd then
            self.national_one_wnd:close()
            self.national_one_wnd = nil
        end
    end
end
function BattleNationalWarController:openNationalTwoScene(status, data)
    if status == true then
        if not self.national_two_wnd then
            self.national_two_wnd = BattleNationalWarTwoWindow.New(data)
        end
        if self.national_two_wnd:isOpen() == false then
            self.national_two_wnd:open()
        end
    else
        if self.national_two_wnd then
            self.national_two_wnd:close()
            self.national_two_wnd = nil
        end
    end
end

function BattleNationalWarController:getCurrentScene()
    if self.national_one_wnd and self.national_one_wnd:isOpen() then
        self.national_one_wnd._layer_index =1
        return self.national_one_wnd
    end
    if self.national_two_wnd and self.national_two_wnd:isOpen() then
        self.national_two_wnd._layer_index =2

        return self.national_two_wnd
    end
end 

function BattleNationalWarController:openNationalOneResultScene(status, data)
    if status == true then
        if not self.national_one_result_wnd then
            self.national_one_result_wnd = BattleNationalWarOneResultWindow.New(data)
        end
        if self.national_one_result_wnd:isOpen() == false then
            self.national_one_result_wnd:open()
        end
    else
        if self.national_one_result_wnd then
            self.national_one_result_wnd:close()
            self.national_one_result_wnd = nil
        end
    end
end


function BattleNationalWarController:openNationalTwoResultScene(status, data)
    if status == true then
        if not self.national_two_result_wnd then
            self.national_two_result_wnd = BattleNationalWarTwoResultWindow.New(data)
        end
        if self.national_two_result_wnd:isOpen() == false then
            self.national_two_result_wnd:open()
        end
    else
        if self.national_two_result_wnd then
            self.national_two_result_wnd:close()
            self.national_two_result_wnd = nil
        end
    end
end

-- 对战信息
function BattleNationalWarController:openNationalOneShowInfoWindow(status)
    if status == true then
        if not self.national_one_showinfo_wnd then
            self.national_one_showinfo_wnd = BattleNationalWarOneShowInfoWindow.New(data)
        end
        if self.national_one_showinfo_wnd:isOpen() == false then
            self.national_one_showinfo_wnd:open()
        end
    else
        if self.national_one_showinfo_wnd then
            self.national_one_showinfo_wnd:close()
            self.national_one_showinfo_wnd = nil
        end
    end
end
function BattleNationalWarController:openNationalTwoShowInfoWindow(status)
    if status == true then
        if not self.national_two_showinfo_wnd then
            self.national_two_showinfo_wnd = BattleNationalWarTwoShowInfoWindow.New(data)
        end
        if self.national_two_showinfo_wnd:isOpen() == false then
            self.national_two_showinfo_wnd:open()
        end
    else
        if self.national_two_showinfo_wnd then
            self.national_two_showinfo_wnd:close()
            self.national_two_showinfo_wnd = nil
        end
    end
end
-- 引导需要
function BattleNationalWarController:getGhostdomSceneRoot(  )
    if self.national_one_wnd then
        return self.national_one_wnd.root_wnd
    end
end

function BattleNationalWarController:onClickGhostdomBuildById(area_type, bid)
  
end



function BattleNationalWarController:__delete()
end
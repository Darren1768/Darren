-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
BattleBorderWarController = BattleBorderWarController or BaseClass(BaseController)

function BattleBorderWarController:config()
    self.dispather = EventManager:getInstance()
    self.model = BattleBorderWarModel.New(self)
    
    self.allRedDatas = {}
end

function BattleBorderWarController:getModel()
    return self.model
end

function BattleBorderWarController:registerEvents()
end

function BattleBorderWarController:registerProtocals()
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
function BattleBorderWarController:openHomeScene(status, data)
    if status == true then
        if not self.home_scene_wnd then
            self.home_scene_wnd = BattleBorderWarHomeWindow.New(data)
        end
        if self.home_scene_wnd:isOpen() == false then
            self.home_scene_wnd:open()
        end
    else
        if self.home_scene_wnd then
            self.home_scene_wnd:close()
            self.home_scene_wnd = nil
        end
    end
end
function BattleBorderWarController:openEnemyScene(status, data)
    if status == true then
        if not self.enemy_scene_wnd then
            self.enemy_scene_wnd = BattleBorderWarEnemyWindow.New(data)
        end
        if self.enemy_scene_wnd:isOpen() == false then
            self.enemy_scene_wnd:open()
        end
    else
        if self.enemy_scene_wnd then
            self.enemy_scene_wnd:close()
            self.enemy_scene_wnd = nil
        end
    end
end

function BattleBorderWarController:getCurrentScene()
    if self.home_scene_wnd and self.home_scene_wnd:isOpen() then
        self.home_scene_wnd._layer_index =1
        return self.home_scene_wnd
    end
    if self.enemy_scene_wnd and self.enemy_scene_wnd:isOpen() then
        self.enemy_scene_wnd._layer_index =2

        return self.enemy_scene_wnd
    end
end 

-- 引导需要
function BattleBorderWarController:getGhostdomSceneRoot(  )
    if self.home_scene_wnd then
        return self.home_scene_wnd.root_wnd
    end
end

function BattleBorderWarController:onClickGhostdomBuildById(area_type, bid)
  
end



function BattleBorderWarController:__delete()
end
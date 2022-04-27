-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
Stone_dungeonController = Stone_dungeonController or BaseClass(BaseController)

function Stone_dungeonController:config()
    self.model = Stone_dungeonModel.New(self)
    self.dispather = EventManager:getInstance()
end

function Stone_dungeonController:getModel()
    return self.model
end

function Stone_dungeonController:registerEvents()

end

function Stone_dungeonController:registerProtocals()
	self:RegisterProtocal(13030, "handle13030")
    self:RegisterProtocal(13031, "handle13031")
    self:RegisterProtocal(13032, "handle13032")
end

function Stone_dungeonController:openStoneDungeonView(status)
	if status == true then 
        local open_data = Config.DailyplayData.data_exerciseactivity[1]
        if open_data == nil then 
            message(TI18N("日常副本数据异常"))
            return 
        end

        local bool = MainuiController:getInstance():checkIsOpenByActivate(open_data.activate)
        if bool == false then 
            message(open_data.lock_desc)
            return 
        end

        if not self.stoneDungeonView then
            self.stoneDungeonView = StoneDungeonWindow.New()
        end
        self.stoneDungeonView:open()
    else
        if self.stoneDungeonView then 
            self.stoneDungeonView:close()
            self.stoneDungeonView = nil
        end
    end
end

-- 引导需要
function Stone_dungeonController:getStoneDungeonRoot(  )
    if self.stoneDungeonView then
        return self.stoneDungeonView.root_wnd
    end
end
--
function Stone_dungeonController:send13030()
    self:SendProtocal(13030, {})
end
function Stone_dungeonController:handle13030(data)
    self.model:setChangeSweepCount(data.list)
    self.model:setPassClearanceID(data.pass_list)
    EventManager:getInstance():Fire(Stone_dungeonEvent.Updata_StoneDungeon_Data,data)
end 
--挑战宝石
function Stone_dungeonController:send13031(_id)
    local protocal = {}
    protocal.id = _id
    self:SendProtocal(13031, protocal)
end
function Stone_dungeonController:handle13031(data)
    message(data.msg)
end
--扫荡宝石
function Stone_dungeonController:send13032(_id)
    local protocal = {}
    protocal.id = _id
    self:SendProtocal(13032, protocal)
end
function Stone_dungeonController:handle13032(data)
    message(data.msg)
end

function Stone_dungeonController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end

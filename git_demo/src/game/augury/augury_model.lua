-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
AuguryModel = AuguryModel or BaseClass()

function AuguryModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function AuguryModel:config()
    self.flash_count = 0
    self.luck = 0
    self.end_count = 0
    self.flag = 0
    self.quality = 0
    self.day_gold_count = 0

    self.have_free_times = false
end

function AuguryModel:getFlashCount()
    return self.flash_count
end
function AuguryModel:updateData(data)
    if not data then return end
    if data.ref_count then
        self.flash_count = data.ref_count or 0
    end
    if data.end_count then 
        self.end_count = data.end_count or 0
    end

    if data.luck then 
        self.luck = data.luck
    end
    if data.quality then 
        self.quality = data.quality
    end
    if data.day_gold_count then 
        self.day_gold_count = data.day_gold_count
    end
    if data.flag == 0 then
        self.have_free_times = true
    else
        self.have_free_times = false
    end
    
    -- MainSceneController:getInstance():setBuildRedStatus(CenterSceneBuild.study, self.have_free_times) 
    EventManager:getInstance():Fire(AuguryEvent.Update_Event)
end

function AuguryModel:getLuck()
    return self.luck
end
function AuguryModel:getLessCount()
    return self.end_count
end
function AuguryModel:getDataGoldCount()
    return self.day_gold_count
end
function AuguryModel:getQuality()
    return self.quality
end
--==============================--
--desc:有没有免费次数
--@return 
--==============================--
function AuguryModel:checkHaveFreeTimes()
    return self.have_free_times 
end

function AuguryModel:__delete()
end
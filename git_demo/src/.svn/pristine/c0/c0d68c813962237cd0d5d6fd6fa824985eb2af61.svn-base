-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
SmasheggModel = SmasheggModel or BaseClass()

function SmasheggModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function SmasheggModel:config()
	self._egg_ani_playing = false
	self.myself_record_data = {}
	self.all_record_data = {}
end

function SmasheggModel:setSmasheggAniPlaying( status )
	self._egg_ani_playing = status
end

function SmasheggModel:getSmasheggAniPlaying(  )
	return self._egg_ani_playing
end

-- 个人日志
function SmasheggModel:setMyselfRecordData( data )
	self.myself_record_data = data
end

function SmasheggModel:getMyselfRecordData(  )
	return self.myself_record_data
end

-- 全服日志
function SmasheggModel:setAllRecordData( data )
	self.all_record_data = data
end

function SmasheggModel:getAllRecordData(  )
	return self.all_record_data
end

function SmasheggModel:__delete()
end
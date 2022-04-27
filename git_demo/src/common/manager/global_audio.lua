-- --------------------------------------------------------------------
-- @description:
--      音乐音效控制器
--
-- --------------------------------------------------------------------
GlobalAudio = GlobalAudio or BaseClass()

GlobalAudio.AUDIO_TYPE = 
{
    COMMON   = "common",
    SCENE    = "scene",
    BATTLE   = "battle",
    DUBBING  = "dubbing",
    Recruit  = "recruit",
    Drama    = "drama"
}

function GlobalAudio:getInstance( ... )
    if GlobalAudio.instance == nil then
        GlobalAudio.instance = GlobalAudio.New()
    end
    return GlobalAudio.instance
end

function GlobalAudio:__init( ... )
    if GlobalAudio.instance ~= nil then return end

    -- 从缓存中读取当前音效的大小
    self.music_volume = SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100)
    self.music_volume = self.music_volume/100
    self:setMusicVolume(self.music_volume)

    self.effect_volume = SysEnv:getInstance():getNum(SysEnv.keys.audio_volume, 100)
    self.effect_volume = self.effect_volume/100
    self:setEffectVolume(self.effect_volume)

    self.effect_list = {}

    self.load_music_list = {}
end

-- --[[
-- @功能:预加载背景音乐
-- @参数:
-- @返回值:
-- ]]
function GlobalAudio:preLoadMusic( type, name )
    audio.preloadMusic(PathTool.getSound(type, name))
end

--[[
@功能:预加载音效
@参数:
@返回值:
]]
function GlobalAudio:preLoadEffect( type, name )
    audio.preloadSound(PathTool.getSound(type, name))
end

--==============================--
--desc:预加载音效根据完整路径
--@path:
--@return 
--==============================--
function GlobalAudio:preLoadMusicByPath(path)
	audio.preloadMusic(path)
end 

--==============================--
--desc:预加载音效根据完整路径
--@path:
--@return 
--==============================--
function GlobalAudio:preLoadEffectByPath(path)
	audio.preloadSound(path)
end 

function GlobalAudio:unLoadEffect( type, name )
    audio.unloadSound(PathTool.getSound(type, name))
end

--==============================--
--desc:播放音乐处理
--@type:
--@name:
--@is_loop:
--@return 
--==============================--
function GlobalAudio:playMusic( type, name , is_loop )
    if IS_VERIFYIOS_AUDIO == true then return end
    if type == nil or type == "" or name == nil or name == "" then return end
    local tmp_music = {type=type, name=name, is_loop=is_loop or false}
    if self.music and self.music.type == tmp_music.type and self.music.name == tmp_music.name then 
        return
    end
    self.last_music = self.music or tmp_music
    self.music = tmp_music
    
    local music_path = PathTool.getSound(self.music.type, self.music.name)
    if self.load_music_list[music_path] == nil then
        self.load_music_list[music_path] = music_path
    end
    -- self:preLoadMusicByPath(music_path)
    -- if RenderMgr:getInstance() then
    --     RenderMgr:getInstance():doNextFrame(function() 
            audio.playMusic(music_path, self.music.is_loop)
        -- end)
    -- end
end

function GlobalAudio:showLoadMuiscPath()

end

--==============================--
--desc:播放上一个音乐
--@return 
--==============================--
function GlobalAudio:playLastMusic()
    if self.last_music then
        self:playMusic(self.last_music.type,self.last_music.name,self.last_music.is_loop)
    end
end

--==============================--
--desc:设置音乐音量大小
--@value:
--@return 
--==============================--
function GlobalAudio:setMusicVolume( value )
    self.music_volume = value
    local music_open = SysEnv:getInstance():getBool(SysEnv.keys.music_is_open,true)
    if music_open then
        audio.setMusicVolume(value)
    else
        audio.setMusicVolume(0)
    end
end

--[[
@功能:暂停背景音乐,主要作用录音
]]
function GlobalAudio:pauseMusic( ... )
    audio.pauseMusic()
end

--[[
@功能:恢复背景音乐
]]
function GlobalAudio:resumeMusic()
    audio.resumeMusic()
end

--[[
@功能:停止播放背景音乐
]]
function GlobalAudio:stopMusic()
    if self.last_music ~= nil then
        if self.last_music.type == GlobalAudio.AUDIO_TYPE.BATTLE then
            self.music.name = nil
            self.music = nil
            self.last_music = nil
        end
    end
    audio.stopMusic()
end

--==============================--
--desc:播放音效处理,现在是要同时存在多个的
--@type:
--@name:
--@is_loop:
--@return 
--==============================--
function GlobalAudio:playEffect( type, name, is_loop)
    if IS_VERIFYIOS_AUDIO == true then return end
    if not name or name == "" then return end

    

    local audio_open = SysEnv:getInstance():getBool(SysEnv.keys.audio_is_open,true)
    if audio_open == true then
        
        local file_name = PathTool.getSound(type,name)
        if not PathTool.isFileExist(file_name) then return end
        
        if self.time_ticket == nil  then
            self.time_ticket = GlobalTimeTicket:getInstance():add(function()
                self:removeOldEffect()
            end,1)
        end
        local sound_id = audio.playSound(file_name, is_loop) 
        local object = self.effect_list[sound_id]
        if object == nil then
            object = {}
            object.file_name = file_name
            object.sound_id = sound_id
            object.sound_type = type
            self.effect_list[sound_id] = object
        end
        object.time = GameNet:getInstance():getTime()

        if Config.VoiceData.data_voice_info[type] and Config.VoiceData.data_voice_info[type][name] then
            local time = Config.VoiceData.data_voice_info[type][name].time or 4
            --补充一秒时差 
            time = time + 1
            --策划配置 是否需要压背景音量
            if self.voice_time_ticket == nil then
                --减少音量
                local volume = SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100)
                volume = volume - 60
                GlobalAudio:getInstance():setMusicVolume(volume/100)
            else
                GlobalTimeTicket:getInstance():remove(self.voice_time_ticket)
                self.voice_time_ticket = nil
            end

            self.voice_time_ticket = GlobalTimeTicket:getInstance():add(function() 
                --还原音量
                local volume = SysEnv:getInstance():getNum(SysEnv.keys.music_volume, 100)
                GlobalAudio:getInstance():setMusicVolume(volume/100)
                self.voice_time_ticket = nil
            end, time, 1) 
        end

        return object 
    end
end

--==============================--
--desc:移除一个指定音效
--@data:
--@return 
--==============================--
function GlobalAudio:removeEffectByData(data)
    if data and data.sound_id ~= nil then
        if self.effect_list[data.sound_id] then
            audio.stopSound(data.sound_id)
        end
        self.effect_list[data.sound_id] = nil
    end
end

--==============================--
--desc:移除10秒以上的音效
--@return 
--==============================--
function GlobalAudio:removeOldEffect()
    local cur_time = GameNet:getInstance():getTime()
    local sum = #self.effect_list
    if self.effect_list and next(self.effect_list) ~= nil then
        for sound_id, object in pairs(self.effect_list) do
            if cur_time - object.time >= 10 then
                audio.stopSound(object.sound_id)
                self.effect_list[sound_id] = nil
            end
        end
    else
        self:clearTimeTicket()
    end
end

-- 按照类型停掉所有该类型的音效
function GlobalAudio:stopAllSoundsByType( sound_type )
    if self.effect_list and next(self.effect_list) ~= nil then
        for sound_id,object in pairs(self.effect_list) do
            if object.sound_type == sound_type then
                audio.stopSound(object.sound_id)
                self.effect_list[sound_id] = nil
            end
        end
    end
end

--[[
@功能:设置音效大小
@参数:
@返回值:
]]
function GlobalAudio:setEffectVolume( value )
    self.effect_volume = value
    local audio_open = SysEnv:getInstance():getBool(SysEnv.keys.audio_is_open,true)
    if audio_open then
        audio.setSoundsVolume(value)
    else
        audio.setSoundsVolume(0)
    end
end

-- 设置语音音量
function  GlobalAudio:setRecordVolume( value )
    value = value or 0
    local voice_open = SysEnv:getInstance():getBool(SysEnv.keys.voice_is_open,true)
	if audio.setRecordVolume then
        if voice_open then
		  audio.setRecordVolume(value/100)
        else
            audio.setRecordVolume(0)
        end
	end
end

--获取之前音乐
function GlobalAudio:getMusicInfo()
    if self.music then
        return self.music
    end
end

function GlobalAudio:playChatSound(file_name)
    if IS_VERIFYIOS_AUDIO == true then return end
    local path = PathTool.getVoicePath(file_name)
    if self.sound_id then
        audio.stopSound(self.sound_id)
        self.sound_id = nil
    end
    self.sound_id = audio.playSound(path, false)
end

function GlobalAudio:clearTimeTicket()
    if self.time_ticket then
        GlobalTimeTicket:getInstance():remove(self.time_ticket)
        self.time_ticket = nil
    end
end

function GlobalAudio:cleanAll()
    self:stopMusic()
    self:clearTimeTicket()
end

function GlobalAudio:__delete()
    self:cleanAll()
end

function GlobalAudio:DeleteMe()
    self:cleanAll()
end

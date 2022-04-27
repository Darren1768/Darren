-- 语音播放效果


SoundEffect = class("SoundEffect", function()
        return ccui.Widget:create()
    end)

function SoundEffect:ctor()
    local function onNodeEvent(event)
        if "exit" == event then
            if self["stop"] then
                self:stop()
            end
        end
    end
    self:registerScriptHandler(onNodeEvent)

    self:setAnchorPoint(0,0)
    for i=1, 3 do
        self["record"..i] = cc.Sprite:create(PathTool.getResFrame("mainui","record"..i))
        self["record"..i]:setVisible(i==3)
        if i~=3 then
            self["record"..i]:setPositionY(2)
        end
        self:addChild(self["record"..i])
    end
    self:setContentSize(self["record1"]:getContentSize())
end

function SoundEffect:play()
    local index = 1
    if not self.time_ticket then
        self.time_ticket = GlobalTimeTicket:getInstance():add(function()
                if not self["record1"] then
                    if self.time_ticket then
                        GlobalTimeTicket:getInstance():remove(self.time_ticket)
                        self.time_ticket = nil
                    end
                    return
                end
                if index > 3 then index = 1 end
                for i=1, 3 do
                    self["record"..i]:setVisible(i==index)
                end
                index = index + 1
            end, 0.5, 0)
    end
end

function SoundEffect:stop()
    if self.time_ticket then
        self.bg:stopAllActions()
        GlobalTimeTicket:getInstance():remove(self.time_ticket)
        self.time_ticket = nil
    end
end

function SoundEffect:over()
    if tolua.isnull(self["record1"]) then return end
    for i=1, 3 do
        self["record"..i]:setVisible(i==3)
    end
    if self["stop"] then
        self:stop()
    end
end
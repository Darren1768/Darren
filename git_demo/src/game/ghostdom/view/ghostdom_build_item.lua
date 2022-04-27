---------------------------------
-- @description: 区场景建筑
---------------------------------
local _ghostdom_ctrl = GhostdomController:getInstance()
local _string_format = string.format

GhostdomBuildItem = GhostdomBuildItem or BaseClass()

function GhostdomBuildItem:__init(data, area_type)
    self.data = data or {}
    self.area_type = area_type or GhostdomConst.Ghostdom_Type -- 对应 Config.city_data 中的id，3为商业区
    self.can_click = false
    self.is_build = (self.data.type == BuildItemType.build)
    self.red_data = {} -- 红点数据

    self.is_lock,self.desc = RoleController:getInstance():checkEnterIsLock(data.bid)
   
    self:createRootwnd()
end

function GhostdomBuildItem:createRootwnd()
    self.size = cc.size(80, 80)
    self.root = ccui.Widget:create()
    self.root:setAnchorPoint(0.5, 0.5)
    self.root:setContentSize(self.size)

    if self.is_build == true then -- 静态建筑图片
        local offset_x = self.size.width/2 + self.data.name_x or 0
        local offset_y = self.size.height/2 +self.data.name_y or 0
        self.name_bg = createImage(self.root, PathTool.getResFrame("common", "hl_common_2202"), offset_x, offset_y, cc.p(0.5, 0.5), true, 9, true)
        -- self.name_bg:setContentSize(cc.size(149, 41))
        		-- self.name_bg:setScale(0.7)

        self.name_bg:setTouchEnabled(true)
        registerButtonEventListener(self.name_bg, handler(self, self.onClickBuild), true)

        self.name_txt = createLabel(22, cc.c4b(231,213,196,255), cc.c4b(65,29,4,255), self.name_bg:getContentSize().width*0.5-2, self.name_bg:getContentSize().height*0.5+35, self.data.name or "", self.name_bg, 0, cc.p(0.5, 0.5),TITLE_FONT)
        self.name_txt:setLocalZOrder(9)


    else -- 特效
        self:createEffect()
    end

    setChildUnEnabled(self.is_lock, self.root)

    self.red_data = GhostdomController:getInstance():getRedData(self.data.bid) or {}
    self:updateRedStatus()
    GhostdomController:getInstance():updateRedData(self.data.bid,self.red_data)
end

function GhostdomBuildItem:createEffect()
    self.effect = 
    createEffectSpine(
        self.data.res,
        cc.p(self.size.width * 0.5, self.size.height * 0.5),
        cc.p(0.5, 0.5),
        true,
        PlayerAction.action
    )
    self.root:addChild(self.effect)
end

function GhostdomBuildItem:onClickBuild()
    local role_vo = RoleController:getInstance():getRoleVo()
    if self.is_lock then
        message(self.desc)
        return
    end
    _ghostdom_ctrl:onClickGhostdomBuildById(self.area_type, self.data.bid)
end

function GhostdomBuildItem:setParentWnd(parent)
    if tolua.isnull(parent) then return end
    self.parent_wnd = parent
    if self.data ~= nil then
        self.root:setPosition(self.data.x, self.data.y)
        self.parent_wnd:addChild(self.root, 1)
    end
end

function GhostdomBuildItem:updateRedStatus(  )

    local red_state = false

    if not self.is_lock then
        for k,v in pairs(self.red_data) do
            if v.status == true then
                red_state = true
                break
            end
        end
    end
    addRedPointToNodeByStatus(self.name_bg, red_state, 4, 7)
end

function GhostdomBuildItem:getData()
    return self.data
end

function GhostdomBuildItem:getRoot()
    return self.root
end

function GhostdomBuildItem:__delete()
    if self.build_load then
        self.build_load:DeleteMe()
        self.build_load = nil
    end
    if self.effect then
        self.effect:setVisible(false)
        self.effect:clearTracks()
        self.effect:runAction(cc.RemoveSelf:create(true))
    end
    if self.root:getParent() then
        self.root:removeAllChildren()
        self.root:removeFromParent()
    end
end
-- --------------------------------------------------------------------
-- 这里填写简要说明(必填)
-- @description:
--      区场景（商业区）
-- --------------------------------------------------------------------
local _ctrl = BattleFieldController:getInstance()
local _string_format = string.format
local _table_insert = table.insert
local _table_remove = table.remove

BattleFieldWindow = BattleFieldWindow or BaseClass(BaseView)

function BattleFieldWindow:__init()
    
    self.win_type = WinType.Full
    self.layout_name = "battle_field/battle_field_main_window"
    --self.background_path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_55", false)
    self.res_list = {
        {path = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_56",false), type = ResourcesType.single}
    }
    
    self.config = BattleFieldConst.btn_data[1]
    self.size = cc.size(self.config.width, self.config.height)
    self.btn_item_list = {} -- 建筑
    self.effect_list = {} -- 特效
    
    self.layer_num = self.config.layer_sum or 1
    self.map_data = {}  -- 地图数据
    self.speed_list = {0, -0.15, -0.25} -- 各图层移动速度
    self.map_resources_list = {} -- 地图资源
end

function BattleFieldWindow:open_callback( )
    self.size = cc.size(self.config.width*display.getMaxScale(), self.config.height*display.getMaxScale())
    
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层
    self.close_btn = self.ui_container:getChildByName("close_btn")
    
    self.touch_layer = self.root_wnd:getChildByName("touch_layer")   -- 触摸层
    self.map_layer = self.root_wnd:getChildByName("map_layer")       -- 地图层

    -- 创建对应配置数量的图层
    for i=1,self.layer_num do
        self["map_layer"..i] = ccui.Widget:create()
        self["map_layer"..i]:setAnchorPoint(cc.p(0, 0))
        self["map_layer"..i]:setContentSize(self.size)
	    self.map_layer:addChild(self["map_layer"..i], self.layer_num + 1 - i)
        -- 同时定义每一层的相对移动速度
        self["map_layer"..i].speed = self.speed_list[i]
    end

    -- 适配
    local bottom_off = display.getBottom(self.map_layer)
    self.map_layer:setScale(display.getMaxScale())
    self.ui_container:setPositionY(bottom_off)

    -- 计算出地图的初始位置(居中)
    self.init_x = ( SCREEN_WIDTH - self.size.width ) * 0.5
    self.init_y = bottom_off
    self:updateMainScene(self.init_x, self.init_y)

    local test_btn = createButton(self.ui_container,TI18N("我是测试按钮"),192,60,cc.size(120,45),PathTool.getResFrame("common", "hl_common_4_6"),20)
    registerButtonEventListener(test_btn.btn,function()
        print("==================点击测试按钮回调")
        UnionController:getInstance():openUnionBuffWindow(true)
    end,true,1)
end

-- 更新位置
function BattleFieldWindow:updateMainScene(x, y)
    y = y or self.init_y
    for i=1, self.layer_num do
        if self["map_layer"..i] then
            self["map_layer"..i]:setPosition((x-self.init_x) * self["map_layer"..i].speed, y-self.init_y)
        end
    end
    self.map_layer:setPosition( x, y )
end

function BattleFieldWindow:register_event()
    registerButtonEventListener(self.close_btn, handler(self, self.onClickCloseBtn), true, 2)
    
    -- 注册场景触摸移动事件
    local function onTouchBegin(touch, event)
		-- 只在范围以内曹做移动
		if self.screenSize == nil then
			local pos = self.touch_layer:convertToWorldSpace(cc.p(0, 0))
			self.screenSize = cc.rect(pos.x, pos.y , SCREEN_WIDTH, SCREEN_HEIGHT )
		end
		local pos = cc.p(touch:getLocation().x, touch:getLocation().y)
		if not cc.rectContainsPoint(self.screenSize, pos) then
			return false
		end
		
		self.last_point = nil
		for i = 1, self.layer_num do
			doStopAllActions(self["map_layer" .. i])
		end
		doStopAllActions(self.map_layer)
		return true
	end
	
	local function onTouchMoved(touch, event)
		self.last_point = touch:getDelta()
		self:moveMainScene(self.last_point.x)
	end
	
	local function onTouchEnded(touch, event)
		if self.last_point == nil then return end
		local interval_x = self.last_point.x * 3
		
		local temp_x = self.map_layer:getPositionX() + interval_x
		
		-- 修正之后的目标位置
		local target_x = self:scaleCheckPoint(temp_x)
		
		for i = 1, self.layer_num do
			if self["map_layer" .. i] then
				local move_to = cc.MoveTo:create(1, cc.p((target_x - self.init_x) * self["map_layer" .. i].speed, 0))
				self["map_layer" .. i]:runAction(cc.EaseBackOut:create(move_to))
			end
		end
		
		local root_move_to = cc.MoveTo:create(1, cc.p(target_x, self.init_y))
		local ease_out = cc.EaseBackOut:create(root_move_to)
		self.map_layer:runAction(cc.Sequence:create(ease_out))
	end
	
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
	listener:registerScriptHandler(onTouchBegin, cc.Handler.EVENT_TOUCH_BEGAN)
	listener:registerScriptHandler(onTouchMoved, cc.Handler.EVENT_TOUCH_MOVED)
	listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
	self.touch_layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self.touch_layer)
end

function BattleFieldWindow:openRootWnd()

    self:setMapAndBuild()
    --测试音效 --"lwc"
    -- GlobalAudio:getInstance():playMusic(GlobalAudio.AUDIO_TYPE.SCENE, "s_002", true) --

    RoleController:getInstance():openRoleSetNameView(true)

end

-- 移动场景
function BattleFieldWindow:moveMainScene(x)
    x = self.map_layer:getPositionX() + x
    local _x = self:scaleCheckPoint(x)
    self:updateMainScene(_x)
end

-- 位置校准
function BattleFieldWindow:scaleCheckPoint( _x )
    if _x > 0 then
        _x = 0
    elseif _x < SCREEN_WIDTH - self.size.width then
        _x = SCREEN_WIDTH - self.size.width
    end
    return _x
end

function BattleFieldWindow:setVisible(bool)
	self.is_visible = bool
	if self.root_wnd == nil or tolua.isnull(self.root_wnd) then return end
    self.root_wnd:setVisible(bool)
    
end

-- 创建建筑
function BattleFieldWindow:createBtnList()
    if not self.config.btn_list or next(self.config.btn_list) == nil then return end
    local role_vo = RoleController:getInstance():getRoleVo()

    for i, build_info in pairs(self.config.btn_list) do
        delayRun(self.root_wnd, i/display.DEFAULT_FPS, function ()
            local build_item = self.btn_item_list[i]
            local btn_config = self.config.btn_list[i]
            if build_item == nil then
                build_item = BattleFieldMainBuildItem.New(build_info, self.config.id)
                -- build_item = createTypeButton(self["map_layer1"], TI18N(btn_config.name), btn_config.x, btn_config.y, ButtonType.yellow)
                build_item.bid = btn_config.bid  
                build_item:setParentWnd(self["map_layer" .. build_info.layer])
                self.btn_item_list[i] = build_item
             
                -- build_item:addTouchEventListener(function(sender, event_type)
                --     if event_type == ccui.TouchEventType.ended then
                --         if build_item.bid==4 then 
                --             UnionController:getInstance():checkOpenUnionWindow()
                --         end 
                --     end
                -- end)
            end
        end)
    end
end

-- 更新或创建地图和建筑
function BattleFieldWindow:setMapAndBuild()
    self:initMapCacheData()
    -- 创建地图
    self:createMap()
    -- 创建建筑和特效
    self:createBtnList()

end

-- 初始化地图数据
function BattleFieldWindow:initMapCacheData()
    self.map_data = {}
    --local map_res = _string_format("resource/area_scene/map/%s", self.config.res_id)
    for i = 1, self.layer_num  do
        local res_path = "resource/bigbg/hl_bigbg_56.png"
        local pos_y = Area_sceneConst.Map_Pos_Y[i] or 0
        _table_insert(self.map_data, {res = res_path, layer = i, pos_y = pos_y})
    end
end

-- 创建地图
function BattleFieldWindow:createMap()
    if not self.map_data or next(self.map_data) == nil then return end
    for i, map_info in ipairs(self.map_data) do
        delayRun(self.root_wnd, i/display.DEFAULT_FPS, function ()
            cc.Director:getInstance():getTextureCache():addImageAsync(map_info.res, function()
                if self["map_layer"..map_info.layer] then
                    local tmp_spr = self.map_resources_list[map_info.layer]
                    if tmp_spr == nil then
                        local tmp_spr = createSprite(map_info.res, 0, map_info.pos_y, self["map_layer"..map_info.layer], cc.p(0, 0), LOADTEXT_TYPE, -1)
                        self.map_resources_list[map_info.layer] = tmp_spr
                        -- if map_info.layer == 3 then -- 远景层做适配
                        --     local spr_size = tmp_spr:getContentSize()
                        --     local scale_val = (display.height - map_info.pos_y)/spr_size.height                  
                        --     tmp_spr:setScale(scale_val)
                        -- end
                    else
                        loadSpriteTexture(tmp_spr, map_info.res, LOADTEXT_TYPE)
                    end
                end
            end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
        end)
    end
end

function BattleFieldWindow:onClickCloseBtn()
    _ctrl:openMainScene(false)
    MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene)
end



function BattleFieldWindow:setBuildRedStatus( bid )
    for k,build_item in pairs(self.btn_item_list) do
        local vo = build_item:getData()
        if vo and vo.bid == bid then
            build_item:updateRedStatus()
            break
        end
    end
end

function BattleFieldWindow:close_callback()

    self.btn_item_list = {}
    _ctrl:openMainScene(false)
end
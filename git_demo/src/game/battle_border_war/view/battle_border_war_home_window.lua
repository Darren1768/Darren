-- --------------------------------------------------------------------
-- 这里填写简要说明(必填)
-- @description:
--      区场景（商业区）
-- --------------------------------------------------------------------
local _ctrl = BattleBorderWarController:getInstance()
local _model  = _ctrl:getModel() 
local _string_format = string.format
local _table_insert = table.insert
local _table_remove = table.remove

BattleBorderWarHomeWindow = BattleBorderWarHomeWindow or BaseClass(BaseView)

function BattleBorderWarHomeWindow:__init()
    
    self.win_type = WinType.Full
    self.layout_name = "battle_border_war/battle_border_war_home_window"
    --self.background_path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_55", false)
    self.res_list = {
        {path = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_78",false), type = ResourcesType.single},
        { path = PathTool.getPlistImgForDownLoad("battleborderwar","battleborderwar"), type = ResourcesType.plist}

    }
    
    self.config = BattleBorderWarConst.btn_data[1]
    self.size = cc.size(self.config.width, self.config.height)
    self.btn_item_list = {} -- 建筑
    self.effect_list = {} -- 特效
    
    self.layer_num = self.config.layer_sum or 1
    self.map_data = {}  -- 地图数据
    self.speed_list = {0, -0.15, -0.25} -- 各图层移动速度
    self.map_resources_list = {} -- 地图资源
end

function BattleBorderWarHomeWindow:open_callback( )
    self.size = cc.size(self.config.width*display.getMaxScale(), self.config.height*display.getMaxScale())
    
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层
    self.close_btn = self.ui_container:getChildByName("close_btn")
    self.show_up_bg= self.ui_container:getChildByName("Image_4")

    self.touch_layer = self.root_wnd:getChildByName("touch_layer")   -- 触摸层
    self.map_layer = self.root_wnd:getChildByName("map_layer")       -- 地图层

    self.steal_btn = self.ui_container:getChildByName("steal_btn")

    self.show_up_content = createRichLabel(20, cc.c4b(255,252,220,0xff), cc.p(0.5, 0.5), cc.p(SCREEN_WIDTH/2,self.show_up_bg:getContentSize().height/2), 5, nil, 540)
    self.show_up_bg:addChild(self.show_up_content)
    local _str =string.format(TI18N("天啊！！<div fontcolor=#FC5549>%s</div>居然被<div fontcolor=#5cAEF8>%s</div>打败了"), "魏国的国主","阿拉伯国国主")
    self.show_up_content:setString(_str)

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

end

-- 更新位置
function BattleBorderWarHomeWindow:updateMainScene(x, y)
    y = y or self.init_y
    for i=1, self.layer_num do
        if self["map_layer"..i] then
            self["map_layer"..i]:setPosition((x-self.init_x) * self["map_layer"..i].speed, y-self.init_y)
        end
    end
    self.map_layer:setPosition( x, y )
end

function BattleBorderWarHomeWindow:register_event()
    registerButtonEventListener(self.close_btn, handler(self, self.onClickCloseBtn), true, 2)
    registerButtonEventListener(self.steal_btn, handler(self, self.onClickStealBtn), true, 2)

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

function BattleBorderWarHomeWindow:openRootWnd()

    self:setMapAndBuild()
   

    self:createXiulingBtnView()
    self:createShowResultView()
    self:createProgress()


    self.index=0
    self.all_objects ={}
    _model:createBattleRole()
end

-- 移动场景
function BattleBorderWarHomeWindow:moveMainScene(x)
    x = self.map_layer:getPositionX() + x
    local _x = self:scaleCheckPoint(x)
    self:updateMainScene(_x)
end

-- 位置校准
function BattleBorderWarHomeWindow:scaleCheckPoint( _x )
    if _x > 0 then
        _x = 0
    elseif _x < SCREEN_WIDTH - self.size.width then
        _x = SCREEN_WIDTH - self.size.width
    end
    return _x
end

function BattleBorderWarHomeWindow:setVisible(bool)
	self.is_visible = bool
	if self.root_wnd == nil or tolua.isnull(self.root_wnd) then return end
    self.root_wnd:setVisible(bool)
    
end

-- 创建建筑
function BattleBorderWarHomeWindow:createBtnList()
    -- if not self.config.btn_list or next(self.config.btn_list) == nil then return end

    local  data ={}
    for i=1,19 do 
        local obj ={}
        obj.name = "名字" .. i 
        obj.x =100 + math.random(1,50) * 50
        obj.y =200 + i * 50
		data[i]=obj 
	end 
    

    local role_vo = RoleController:getInstance():getRoleVo()
    for i, build_info in pairs(data) do
        delayRun(self.root_wnd, i/display.DEFAULT_FPS, function ()
            local build_item = self.btn_item_list[i]
            -- local btn_config = self.config.btn_list[i]
            if build_item == nil then
                build_item = BattleBorderWarMainBuildItem.New(build_info)
                -- build_item.bid = btn_config.bid  
                build_item:setParentWnd(self["map_layer1"])
                self.btn_item_list[i] = build_item
            end
        end)
    end

     

end


function BattleBorderWarHomeWindow:addRoleToLayer1(obj)
    if  not obj then
        return
    end 
    self.all_objects[self.index]=obj
    self.index = self.index+1
    obj:addToLayer(self["map_layer1"],1)
    local _pos = cc.p(self.index *50+200 , 50+ self.index *20)
    obj:setPosByGrid(_pos)

    delayRun(self.root_wnd,1/60,function() 
        obj:createrSpineBtn(function() 
            print('----------点击英雄--------------')
            local str = string.format( TI18N("该玩家在战斗中，另行匹配其周围玩家，是否进入战斗？"))
            CommonAlert.show(str, TI18N("是"), function()
            end, TI18N("否"))
        
        end)
    end )
 
end



-- 更新或创建地图和建筑
function BattleBorderWarHomeWindow:setMapAndBuild()
    self:initMapCacheData()
    -- 创建地图
    self:createMap()
    -- 创建建筑和特效
    self:createBtnList()

    -- 创建建筑点击按钮
    self:createBuildBtn()

end

-- 初始化地图数据
function BattleBorderWarHomeWindow:initMapCacheData()
    self.map_data = {}
    --local map_res = _string_format("resource/area_scene/map/%s", self.config.res_id)
    for i = 1, self.layer_num  do
        local res_path = "resource/bigbg/hl_bigbg_78.png"
        local pos_y = Area_sceneConst.Map_Pos_Y[i] or 0
        _table_insert(self.map_data, {res = res_path, layer = i, pos_y = pos_y})
    end
end

-- 创建地图
function BattleBorderWarHomeWindow:createMap()
    if not self.map_data or next(self.map_data) == nil then return end
    for i, map_info in ipairs(self.map_data) do
        delayRun(self.root_wnd, i/display.DEFAULT_FPS, function ()
            cc.Director:getInstance():getTextureCache():addImageAsync(map_info.res, function()
                if self["map_layer"..map_info.layer] then
                    local tmp_spr = self.map_resources_list[map_info.layer]
                    if tmp_spr == nil then
                        local tmp_spr = createSprite(map_info.res, 0, map_info.pos_y, self["map_layer"..map_info.layer], cc.p(0, 0), LOADTEXT_TYPE, -1)
                        self.map_resources_list[map_info.layer] = tmp_spr
                    else
                        loadSpriteTexture(tmp_spr, map_info.res, LOADTEXT_TYPE)
                    end
                end
            end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
        end)      
    end
end




-- 创建修灵按钮
function BattleBorderWarHomeWindow:createXiulingBtnView()
    self._xiuling_root_wnd  = createCSBNote(PathTool.getTargetCSB("battle_border_war/battle_border_war_button_icon"))
    if not self._xiuling_root_wnd then return end
    self._xiuling_root_wnd:setAnchorPoint(0.5,0.5) 
    self._xiuling_root_wnd:setPosition(cc.p(800,600))
    self.map_layer1:addChild(self._xiuling_root_wnd)

    self._xiuling_root_wnd:setVisible(false)
    local _container = self._xiuling_root_wnd:getChildByName("container")
    _container:setTouchEnabled(true)
    _container:setSwallowTouches(true)

    local _icon = _container:getChildByName("icon")
    loadSpriteTexture(_icon, PathTool.getResFrame("common2","hl_common_0034"), LOADTEXT_TYPE_PLIST)


    local _up_icon =_container:getChildByName("up_icon")
    loadSpriteTexture(_up_icon, PathTool.getResFrame("battleborderwar","battle_border_war_0003"), LOADTEXT_TYPE_PLIST)

    local _name = _container:getChildByName("name")
    _name:setString("修灵")

	_container:addTouchEventListener(function(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
            print("----------------修灵---------------------")
            self:showProgress()
            self._xiuling_root_wnd:setVisible(false)

		end
	end)
    
end 




-- 创建数字展示
function BattleBorderWarHomeWindow:createShowResultView()

    self.show_result_num = createSprite(PathTool.getResFrame("common2","hl_common_0029"),800,1000,self.map_layer1,cc.p(0.5,0.5))
    local title = createLabel(22, cc.c4b(255,252,220,0xff), nil, self.show_result_num:getContentSize().width/2, self.show_result_num:getContentSize().height/2, "666", self.show_result_num, nil, cc.p(0.5, 0.5))

    
    
end 


-- 创建建筑点击按钮
function BattleBorderWarHomeWindow:createBuildBtn()
    if not self.build_btn then 
         self.build_btn = ccui.Layout:create()
         local _size = cc.size(200,200)
         self.build_btn:setContentSize(_size)
         self.build_btn:setPosition(cc.p(800,700))
         self.build_btn:setAnchorPoint(cc.p(0.5, 0.5))
         self.build_btn:setTouchEnabled(true)
         self.map_layer1:addChild(self.build_btn)
         local res = PathTool.getResFrame("mainui","mainui_1037")
         createImage(self.build_btn,res,_size.width/2,_size.height/2,cc.p(0.5,0.5),true,0,false)
    end

     self.is_click_build = false
    self.build_btn:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
	    	print("--------------11--------------")
            if not self.is_click_build then 
                self.is_click_build = true
                self._xiuling_root_wnd:setVisible(true)
            else
                self.is_click_build = false
                self._xiuling_root_wnd:setVisible(false)
            end 

        end
    end)

end


--交付 绿色
function BattleBorderWarHomeWindow:createProgress()
    if self.comp_bar == nil then
        local size = cc.size(262, 10)
        local res = PathTool.getResFrame("common2","hl_common_0021")
        local res1 = PathTool.getResFrame("common2","hl_common_0020")

        local bar_layout = ccui.Layout:create()
        bar_layout:setContentSize(cc.size(500,1000))
        bar_layout:setAnchorPoint(0,0)
        bar_layout:setPosition(cc.p(750,530))
        -- bar_layout:setRotation(90)
        if bar_layout then
            self.map_layer1:addChild(bar_layout)	
            self.bar_layout = bar_layout
        end

        local bg,comp_bar = createLoadingBar(res, res1, size, self.bar_layout, cc.p(0,0.5), 0, 0, true, true)

        self.comp_bar_bg = bg
        self.comp_bar = comp_bar

        self.bar_value = createLabel(20, cc.c4b(255,252,220,0xff), nil , 262/2 +20, 20, "修灵中...", bar_layout, nil, cc.p(0.5, 0.5))
      
    end
    self.bar_layout:setVisible(false)
    self.comp_bar_bg:setContentSize(cc.size(270,16))
    self.comp_bar:setContentSize(cc.size(262,10))
    self.comp_bar:setPosition(cc.p(4,8))
    self.comp_bar:setPercent(0)

end


function BattleBorderWarHomeWindow:showProgress()
    if not self._running then
        self.bar_layout:setVisible(true)
		self._running = true
        local _perent =0 
	    self._ticket_name = GlobalTimeTicket:getInstance():add(function()
            _perent = _perent + 1
            self.comp_bar:setPercent(_perent)
            if _perent >=100 then
               self:hideProgress()
            end
	    end,0.1)
	end
end 

function BattleBorderWarHomeWindow:hideProgress()
    if self._running then
        self._running = nil
        if self._ticket_name then
            GlobalTimeTicket:getInstance():remove(self._ticket_name)
            self._ticket_name = nil
        end
        self.bar_layout:setVisible(false)
    end
end 

function BattleBorderWarHomeWindow:onClickCloseBtn()
    for k,v in pairs(self.all_objects) do 
        v:removeBody()
    end
    _ctrl:openHomeScene(false)
end

function BattleBorderWarHomeWindow:onClickStealBtn()
    
    for k,v in pairs(self.all_objects) do 
        v:removeBody()
    end
    _ctrl:openHomeScene(false)
    _ctrl:openEnemyScene(true)
end


function BattleBorderWarHomeWindow:close_callback()


    self.btn_item_list = {}
    _ctrl:openHomeScene(false)
end
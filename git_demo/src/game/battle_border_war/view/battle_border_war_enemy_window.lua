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

BattleBorderWarEnemyWindow = BattleBorderWarEnemyWindow or BaseClass(BaseView)

function BattleBorderWarEnemyWindow:__init()
    
    self.win_type = WinType.Full
    self.layout_name = "battle_border_war/battle_border_war_enemy_window"
    --self.background_path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_55", false)
    self.res_list = {
        {path = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_78",false), type = ResourcesType.single}
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

function BattleBorderWarEnemyWindow:open_callback( )
    self.size = cc.size(self.config.width*display.getMaxScale(), self.config.height*display.getMaxScale())
    
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层
    self.close_btn = self.ui_container:getChildByName("close_btn")
    self.back_btn = self.ui_container:getChildByName("back_btn")
    self.show_up_bg= self.ui_container:getChildByName("Image_4")

    self.touch_layer = self.root_wnd:getChildByName("touch_layer")   -- 触摸层
    self.map_layer = self.root_wnd:getChildByName("map_layer")       -- 地图层

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
function BattleBorderWarEnemyWindow:updateMainScene(x, y)
    y = y or self.init_y
    for i=1, self.layer_num do
        if self["map_layer"..i] then
            self["map_layer"..i]:setPosition((x-self.init_x) * self["map_layer"..i].speed, y-self.init_y)
        end
    end
    self.map_layer:setPosition( x, y )
end

function BattleBorderWarEnemyWindow:register_event()
    registerButtonEventListener(self.close_btn, handler(self, self.onClickCloseBtn), true, 2)
    registerButtonEventListener(self.back_btn, handler(self, self.onClickBackBtn), true, 2)

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

function BattleBorderWarEnemyWindow:openRootWnd()

    self:setMapAndBuild()

    -- 创建攻击按钮 窃取按钮
    self:createAttackBtnView()
    self:createstealBtnView()
    -- 创建展示数字
    self:createShowResultView()

    self:createProgress()

    
    self.index=0
    self.all_objects ={}
    _model:createBattleRole()

end

-- 移动场景
function BattleBorderWarEnemyWindow:moveMainScene(x)
    x = self.map_layer:getPositionX() + x
    local _x = self:scaleCheckPoint(x)
    self:updateMainScene(_x)
end

-- 位置校准
function BattleBorderWarEnemyWindow:scaleCheckPoint( _x )
    if _x > 0 then
        _x = 0
    elseif _x < SCREEN_WIDTH - self.size.width then
        _x = SCREEN_WIDTH - self.size.width
    end
    return _x
end

function BattleBorderWarEnemyWindow:setVisible(bool)
	self.is_visible = bool
	if self.root_wnd == nil or tolua.isnull(self.root_wnd) then return end
    self.root_wnd:setVisible(bool)
    
end

-- 创建建筑
function BattleBorderWarEnemyWindow:createBtnList()
    if not self.config.btn_list or next(self.config.btn_list) == nil then return end
    local role_vo = RoleController:getInstance():getRoleVo()

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



function BattleBorderWarEnemyWindow:addRoleToLayer1(obj)
    if  not obj then
        return
    end 
    self.all_objects[self.index]=obj
    self.index = self.index+1
    obj:addToLayer(self["map_layer1"],1)
    local _pos = cc.p(self.index *50+200 , 50+ self.index *20)
    obj:setPosByGrid(_pos)
end



-- 更新或创建地图和建筑
function BattleBorderWarEnemyWindow:setMapAndBuild()
    self:initMapCacheData()
    -- 创建地图
    self:createMap()
    -- 创人名
    self:createBtnList()

    -- 创建建筑点击按钮
    self:createBuildBtn()
end

-- 初始化地图数据
function BattleBorderWarEnemyWindow:initMapCacheData()
    self.map_data = {}
    for i = 1, self.layer_num  do
        local res_path = "resource/bigbg/hl_bigbg_78.png"
        local pos_y = Area_sceneConst.Map_Pos_Y[i] or 0
        _table_insert(self.map_data, {res = res_path, layer = i, pos_y = pos_y})
    end
end

-- 创建地图
function BattleBorderWarEnemyWindow:createMap()
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


-- 创建建筑点击按钮
function BattleBorderWarEnemyWindow:createBuildBtn()
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
                self.attack_root_wnd:setVisible(true)
                self._steal_root_wnd:setVisible(true)
            else
                self.is_click_build = false
                self.attack_root_wnd:setVisible(false)
                self._steal_root_wnd:setVisible(false)
            end 

        end
    end)

end

-- 创建攻击按钮
function BattleBorderWarEnemyWindow:createAttackBtnView()
     
    
    self.attack_root_wnd  = createCSBNote(PathTool.getTargetCSB("battle_border_war/battle_border_war_button_icon"))
   
    if not self.attack_root_wnd then return end
    self.attack_root_wnd:setPosition(cc.p(800,800))
    self.attack_root_wnd:setAnchorPoint(0.5,0.5) 
    self.attack_root_wnd:setPosition(cc.p(800,800))
    self.map_layer1:addChild(self.attack_root_wnd)
    self.attack_root_wnd:setZOrder(10)


    self.attack_root_wnd:setVisible(false)


    local _x = self.attack_root_wnd:getPositionX() 
    local _y = self.attack_root_wnd:getPositionY() +5
    self.team_image_bg =  createScale9Sprite(PathTool.getResFrame("common2", "hl_common_0031"), _x, _y, LOADTEXT_TYPE_PLIST, self.map_layer1)
    self.team_image_bg:setAnchorPoint(cc.p(0, 0.5))
    self.team_image_bg:setContentSize(cc.size(150, 34))
    self.team_image_bg:setZOrder(9)
    self.team_image_bg:setVisible(false)

    local  _label = createLabel(20, cc.c3b(255,252,220), nil, 80 , 17 ,"选择编队" , self.team_image_bg, 0, cc.p(0.5, 0.5)) 



    self.attack_btn = self.attack_root_wnd:getChildByName("container")
    self.attack_btn:setTouchEnabled(true)
    self.attack_btn:setSwallowTouches(true)


    self.current_index_team = 1

	self.attack_btn:addTouchEventListener(function(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
            print("-------------------------------------")
            if self.team_root_wnd then 
                 return    
            end
            self:createTeamView()   
            self.team_image_bg:setVisible(true)

            if  self._steal_root_wnd then 
                self._steal_root_wnd:setVisible(false)
            end 
      
		end
	end)



end 

-- 创建窃取按钮
function BattleBorderWarEnemyWindow:createstealBtnView()
     
    self._steal_root_wnd  = createCSBNote(PathTool.getTargetCSB("battle_border_war/battle_border_war_button_icon"))
    if not self._steal_root_wnd then return end
    self._steal_root_wnd:setAnchorPoint(0.5,0.5) 
    self._steal_root_wnd:setPosition(cc.p(800,600))
    self.map_layer1:addChild(self._steal_root_wnd)

    local _container = self._steal_root_wnd:getChildByName("container")
    _container:setTouchEnabled(true)
    _container:setSwallowTouches(false)

    self._steal_root_wnd:setVisible(false)

    local _icon = _container:getChildByName("icon")
    loadSpriteTexture(_icon, PathTool.getResFrame("common2","hl_common_0034"), LOADTEXT_TYPE_PLIST)


    local _up_icon =_container:getChildByName("up_icon")
    loadSpriteTexture(_up_icon, PathTool.getResFrame("battleborderwar","battle_border_war_0004"), LOADTEXT_TYPE_PLIST)


    local _name =  _container:getChildByName("name")
    _name:setString("窃灵")
    _container:setSwallowTouches(true)
	_container:addTouchEventListener(function(sender, event_type) 
		if event_type == ccui.TouchEventType.ended then
            print("-----------------窃灵--------------------")
            
            if  self.attack_root_wnd then 
                self.attack_root_wnd:setVisible(false)
            end 
            if  self.team_image_bg then 
                self.team_image_bg:setVisible(false)
            end 
            self.is_click_build=false
            self._steal_root_wnd:setVisible(false)
            -- 窃灵进度条
            self:showProgress()

		end
	end)

end 


-- 添加编队
function BattleBorderWarEnemyWindow:createTeamView()

    local team_data = {[1]={name="第一队"},
        [2]={name="第二编队"},
        [3]={name="第二编队"},
        [4]={name="第二编队"}
    }

    self.team_root_wnd = createCSBNote(PathTool.getTargetCSB("battle_border_war/battle_border_war_team_select_node"))
    if not self.team_root_wnd then return end
    self.map_layer1:addChild(self.team_root_wnd)

    local _team_height = #team_data * 34 + 30 
    self.team_root_wnd:setContentSize(cc.size(150 ,_team_height))

    local _x = self.attack_root_wnd:getPositionX() + self.attack_root_wnd:getContentSize().width/2  -20
    local _y = self.attack_root_wnd:getPositionY()  - _team_height  -10  -- + self.attack_root_wnd:getContentSize().height/2 
    self.team_root_wnd:setPosition(_x,_y)
    self.team_root_wnd:setAnchorPoint(0, 0)



    --背景
    local _image_1 = self.team_root_wnd:getChildByName("Image_1")
    _image_1:setAnchorPoint(0, 0)
    _image_1:setContentSize(cc.size(150 ,_team_height))
    _image_1:setAnchorPoint(0, 0)
    self._team_selct_img = self.team_root_wnd:getChildByName("team_selct_img")


    

    self._team_selct_img:setPositionY( _team_height- self.current_index_team * 34 +15 )

    self._team_title_list={}
    for i ,v in pairs(team_data) do 
        local _tab_btn =  ccui.Layout:create()
        _tab_btn:setAnchorPoint(cc.p(0, 0.5))
        _tab_btn:setContentSize(130, 34)
        _tab_btn:setTouchEnabled(true)
        self.team_root_wnd:addChild(_tab_btn)
        _tab_btn:setPosition(cc.p(0,  _team_height-  (#team_data -i +1 ) * 34 + 30))

        local  _label = createLabel(20, cc.c3b(255,252,220), nil,65 , 0 , team_data[#team_data -i +1].name , _tab_btn, 0, cc.p(0.5, 0.5)) 
        _tab_btn.label = _label
        _tab_btn.index = #team_data -i +1 
        self._team_title_list[i] = _tab_btn

        _tab_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                print("------------------11-------------------",_tab_btn.index)
                self.current_index_team= _tab_btn.index
                self._team_selct_img:setPositionY( _team_height- self.current_index_team * 34+15 )

                
                self:clearTeamView()
                if  self.attack_root_wnd then 
                    self.attack_root_wnd:setVisible(false)
                end 
                self.is_click_build=false
            end
        end)
    end
end 

function BattleBorderWarEnemyWindow:clearTeamView()
     self._team_title_list ={}
     self.team_root_wnd:removeAllChildren()
     self.team_root_wnd:removeFromParent()
     self.team_root_wnd=nil
     self.team_image_bg:setVisible(false)

end 



-- 创建数字展示
function BattleBorderWarEnemyWindow:createShowResultView()
    self.show_result_num = createSprite(PathTool.getResFrame("common2","hl_common_0029"),800,1000,self.map_layer1,cc.p(0.5,0.5))
    local title = createLabel(22, cc.c4b(255,252,220,0xff), nil, self.show_result_num:getContentSize().width/2, self.show_result_num:getContentSize().height/2, "666", self.show_result_num, nil, cc.p(0.5, 0.5))

end 



--交付 绿色
function BattleBorderWarEnemyWindow:createProgress()
    if self.comp_bar == nil then
        local size = cc.size(262, 10)
        local res = PathTool.getResFrame("common2","hl_common_0021")
        local res1 = PathTool.getResFrame("common2","hl_common_0019")

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

        self.bar_value = createLabel(20, cc.c4b(255,252,220,0xff), nil , 262/2 +20, 20, "窃灵中...", bar_layout, nil, cc.p(0.5, 0.5))

    end
    self.bar_layout:setVisible(false)
    self.comp_bar_bg:setContentSize(cc.size(270,16))
    self.comp_bar:setContentSize(cc.size(262,10))
    self.comp_bar:setPosition(cc.p(4,8))
    self.comp_bar:setPercent(0)
  
end

function BattleBorderWarEnemyWindow:showProgress()
    if not self._running then
        self.bar_layout:setVisible(true)
		self._running = true
        local _perent =0 
	    self._ticket_name = GlobalTimeTicket:getInstance():add(function()
            _perent = _perent + 0.5
            self.comp_bar:setPercent(_perent)
            if _perent >=100 then
               self:hideProgress()
            end
	    end,0.1)
	end
end 

function BattleBorderWarEnemyWindow:hideProgress()
    if self._running then
        self._running = nil
        if self._ticket_name then
            GlobalTimeTicket:getInstance():remove(self._ticket_name)
            self._ticket_name = nil
        end
        self.bar_layout:setVisible(false)
    end
end 


function BattleBorderWarEnemyWindow:onClickCloseBtn()

    _ctrl:openEnemyScene(false)
    _ctrl:openHomeScene(true)
end


function BattleBorderWarEnemyWindow:onClickBackBtn()
    _ctrl:openEnemyScene(false)
    _ctrl:openHomeScene(true)
end


function BattleBorderWarEnemyWindow:close_callback()
    for k,v in pairs(self.all_objects) do 
        v:removeBody()
    end

    self.btn_item_list = {}
    _ctrl:openEnemyScene(false)
end
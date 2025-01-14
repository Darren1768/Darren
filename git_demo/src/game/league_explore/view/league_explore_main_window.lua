-- --------------------------------------------------------------------
-- 这里填写简要说明(必填)
-- @description:
--    探索历练
-- --------------------------------------------------------------------
local _ctrl = LeagueExploreController:getInstance()
local model = _ctrl:getModel()
local _string_format = string.format
local _table_insert = table.insert
local _table_remove = table.remove

LeagueExploreMainWindow = LeagueExploreMainWindow or BaseClass(BaseView)

function LeagueExploreMainWindow:__init()
    
    self.win_type = WinType.Full
    self.layout_name = "league_explore/league_explore_main_window"
    --self.background_path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_55", false)
    self.res_list = {
        {path = PathTool.getSingleImgForDownLoad("bigbg/explore", "hl_explore_bigbg_1",false), type = ResourcesType.single},
        {path = PathTool.getSingleImgForDownLoad("bigbg/explore", "hl_explore_bigbg_2",false), type = ResourcesType.single},
        {path = PathTool.getSingleImgForDownLoad("bigbg/explore", "hl_explore_bigbg_3",false), type = ResourcesType.single},
        {path = PathTool.getSingleImgForDownLoad("bigbg/explore", "hl_explore_bigbg_4",false), type = ResourcesType.single},
        {path = PathTool.getSingleImgForDownLoad("bigbg/explore", "explore_bigbg_5",false), type = ResourcesType.single},
    	{path = PathTool.getPlistImgForDownLoad("exploration","exploration"), type = ResourcesType.plist },
        {path = PathTool.getPlistImgForDownLoad("guild", "guild"), type = ResourcesType.plist},  --guild_1030
    }
    
    self.config = LeagueExploreConst.resourse_data[1]
    self.size = cc.size(self.config.width, self.config.height)
    self.resourse_item_list = {} -- 建筑
    self.effect_list = {} -- 特效
    
    self.layer_num = self.config.layer_sum or 1
    self.map_data = {}  -- 地图数据
    self.speed_list = {0, -0.15, -0.25} -- 各图层移动速度
    self.map_resources_list = {} -- 地图资源
end

function LeagueExploreMainWindow:open_callback( )
    self.size = cc.size(self.config.width*display.getMaxScale(), self.config.height*display.getMaxScale())
    
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层
    self.close_btn = self.ui_container:getChildByName("close_btn")

    self.manager_btn = self.ui_container:getChildByName("manager_btn")
    self.sign_btn = self.ui_container:getChildByName("sign_btn")
    self.team_btn = self.ui_container:getChildByName("team_btn")
    self.get_btn = self.ui_container:getChildByName("get_btn")
    self.shop_btn = self.ui_container:getChildByName("shop_btn")
    self.hallows_btn = self.ui_container:getChildByName("hallows_btn")

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

    self.role= RoleController:getInstance():getRoleVo()

    -- 计算出地图的初始位置(居中)
    self.init_x = ( SCREEN_WIDTH - self.size.width ) * 0.5
    self.init_y = bottom_off
    self:updateMainScene(self.init_x, self.init_y)
end

-- 更新位置
function LeagueExploreMainWindow:updateMainScene(x, y)
    y = y or self.init_y
    for i=1, self.layer_num do
        if self["map_layer"..i] then
            self["map_layer"..i]:setPosition((x-self.init_x) * self["map_layer"..i].speed, y-self.init_y)
        end
    end
    self.map_layer:setPosition( x, y )
end

function LeagueExploreMainWindow:register_event()
    registerButtonEventListener(self.close_btn, handler(self, self.onClickCloseBtn), true, 2)
    registerButtonEventListener(self.manager_btn, handler(self, self.onClickManagerBtn), true, 2)
    registerButtonEventListener(self.sign_btn, handler(self, self.onClickSignBtn), true, 2)
    registerButtonEventListener(self.team_btn, handler(self, self.onClickTeamBtn), true, 2)
    registerButtonEventListener(self.get_btn, handler(self, self.onClickGetBtn), true, 2)
    registerButtonEventListener(self.shop_btn, handler(self, self.onClickShopBtn), true, 2)
    registerButtonEventListener(self.hallows_btn,handler(self,self.onClickHallowsBtn),true,2)

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


     -- 活动开启/关闭
     self:addGlobalEvent(LeagueExploreEvent.Update_Main_Base_Data, function (  )
        self:updateBtnList()
        self:updateDownBtn()
    end)

    -- 阶段改变 刷新按钮 
    self:addGlobalEvent(LeagueExploreEvent.Updata_Step_Change_Data, function (step_status)
        if step_status == 1 then 
            _ctrl:sender29300()
        end 
         self:updateDownBtn()
         if step_status == 2 then 
             -- 刷新去掉已报名
             self:updateBtnList()
         end 
    end)
    -- 放弃资源点
    EventManager:getInstance():Bind(LeagueExploreEvent.Update_GiveUp_Success_Data,self,function()
        print("----------------give up main-------------")
        self:updateBtnList()
    end)

end

function LeagueExploreMainWindow:openRootWnd()
     _ctrl:sender29300()
     self:setMapAndBuild()

end


-- 移动场景
function LeagueExploreMainWindow:moveMainScene(x)
    x = self.map_layer:getPositionX() + x
    local _x = self:scaleCheckPoint(x)
    self:updateMainScene(_x)
end

-- 位置校准
function LeagueExploreMainWindow:scaleCheckPoint( _x )
    if _x > 0 then
        _x = 0
    elseif _x < SCREEN_WIDTH - self.size.width then
        _x = SCREEN_WIDTH - self.size.width
    end
    return _x
end

function LeagueExploreMainWindow:setVisible(bool)
	self.is_visible = bool
	if self.root_wnd == nil or tolua.isnull(self.root_wnd) then return end
    self.root_wnd:setVisible(bool)
    
end

-- 创建建筑
function LeagueExploreMainWindow:createBtnList()
    if not self.config.building_list or next(self.config.building_list) == nil then return end
    
    
    local _data_list  = model:getBaseData()
    local _config = Config.LeagueExploreData.data_resource_data

    if not _data_list then 
        return
    end
    if not  _data_list.resources then
        return
    end

    for i, build_info in pairs(self.config.building_list) do
        delayRun(self.root_wnd, i/display.DEFAULT_FPS, function ()
            local build_item = self.resourse_item_list[i]
            local btn_config = self.config.building_list[i]

            local _value = _data_list.resources[i]

            if build_item == nil then
                build_item = LeagueExploreResourceItem.New(build_info, self.config.id)
                build_item:setParentWnd(self["map_layer" .. build_info.layer])
                build_item:setBaseData(_value,_config[_value.id])
                self.resourse_item_list[i] = build_item

            end
        end)
    end
end
-- 刷新建筑
function LeagueExploreMainWindow:updateBtnList()

    local _data_list  = model:getBaseData()
    local _config = Config.LeagueExploreData.data_resource_data
    for i =1 ,#_data_list.resources do 
        local _value = _data_list.resources[i]
        local build_item = self.resourse_item_list[i]
        if build_item and _value then 
            build_item:setBaseData(_value,_config[_value.id])
        end 
    end 
end





-- 更新或创建地图和建筑
function LeagueExploreMainWindow:setMapAndBuild()
    self:initMapCacheData()
    -- 创建地图
    self:createMap()
    -- 创建建筑和特效
    self:createBtnList()
end

-- 初始化地图数据
function LeagueExploreMainWindow:initMapCacheData()
    self.map_data = {}
    --local map_res = _string_format("resource/area_scene/map/%s", self.config.res_id)
    for i = 1, self.layer_num  do
        local res_path = "resource/bigbg/explore/hl_explore_bigbg_1.png"
        local pos_y =  0
        _table_insert(self.map_data, {res = res_path, layer = i, pos_y = pos_y})
    end
end

-- 创建地图
function LeagueExploreMainWindow:createMap()
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

-- 是否打开结果结算
function LeagueExploreMainWindow:updateDownBtn()
    if self:isOpen()  == false then 
        return
    end
    local step_status = model:getStepStatus()
    if step_status == 1 then 
        setChildUnEnabled(false,self.sign_btn)
        setChildUnEnabled(false,self.team_btn)
        self.sign_btn:setTouchEnabled(true)
        self.team_btn:setTouchEnabled(true)
        local _str = "当前可报名"
       if  model:isSign() then 
           _str= "已报名，18：00开启战斗"
       end      

        commonShowBuddle(true,cc.p(self.sign_btn:getPositionX(),self.sign_btn:getPositionY()), self.ui_container,_str,0.75,0.5)
    else
        setChildUnEnabled(true,self.sign_btn)
        setChildUnEnabled(true,self.team_btn)
        self.sign_btn:setTouchEnabled(false)
        self.team_btn:setTouchEnabled(false)

        local _str = "12：00-17：50开始报名"
        commonShowBuddle(true,cc.p(self.sign_btn:getPositionX(),self.sign_btn:getPositionY()), self.ui_container,_str,0.75,0.5)

        -- 可能开着关闭
        LeagueExploreController:getInstance():openLeagueExploreSignWindow(false)
        LeagueExploreController:getInstance():openTeamExploreWindow(false)
    end 
end



-- 管理
function LeagueExploreMainWindow:onClickManagerBtn()

    if self.role.lid == 0 then 
        self:showMessage()
        return 
    end 

    LeagueExploreController:getInstance():openLeagueExploreManagerWindow(true)
end

-- 报名
function LeagueExploreMainWindow:onClickSignBtn()
    if self.role.lid == 0 then 
        self:showMessage()
        return 
    end 
    if model:getStepStatus()~=1 then 
        message("不在报名时间")
        return
    end 

    LeagueExploreController:getInstance():openLeagueExploreSignWindow(true)
end

-- 布阵
function LeagueExploreMainWindow:onClickTeamBtn()
    if self.role.lid == 0 then 
        self:showMessage()
        return 
    end 
    if model:getParaPos()==0 then 
        message("请先选择一个资源点报名")
        return
    end 
    if model:getStepStatus()~=1 then 
        message("当前不在布阵时间")
        return
    end 

    LeagueExploreController:getInstance():openTeamExploreWindow(true)

end

--领取
function LeagueExploreMainWindow:onClickGetBtn()
    -- if model:getStepStatus()~=4 then 
    --     message("未开启")
    --     return
    -- end 
    if self.role.lid == 0 then 
        self:showMessage()
        return 
    end 
    LeagueExploreController:getInstance():openReceiveExploreWindow(true)

    
end

-- 商店
function LeagueExploreMainWindow:onClickShopBtn()
    MallController:getInstance():openMallPanel(true,MallConst.MallType.LeagueExplore)
end

-- 新神器主界面
function LeagueExploreMainWindow:onClickHallowsBtn()
    HallowsController:getInstance():openNewHallowsMainWindow(true)
end

function LeagueExploreMainWindow:showMessage()
    local str = string.format(TI18N("您目前还没有联盟，不能查看，快去加入联盟获得神器等丰厚奖励"))
    -- CommonAlert.show( str, TI18N("确定"), function()
    -- end, TI18N("取消"))
    CommonAlert.show(str, TI18N("确定"),nil,nil,nil,nil,function()end)

end 


function LeagueExploreMainWindow:onClickCloseBtn()
    _ctrl:openMainScene(false)
    -- MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene)
end


function LeagueExploreMainWindow:setBuildRedStatus( bid )
    for k,build_item in pairs(self.resourse_item_list) do
        local vo = build_item:getData()
        if vo and vo.bid == bid then
            build_item:updateRedStatus()
            break
        end
    end
end

function LeagueExploreMainWindow:close_callback()

    self.resourse_item_list = {}
    _ctrl:openMainScene(false)
end
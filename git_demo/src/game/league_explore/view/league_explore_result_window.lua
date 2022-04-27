-- --------------------------------------------------------------------
-- 这里填写简要说明(必填)
-- @description:
--    探索历练
-- --------------------------------------------------------------------
local controller = LeagueExploreController:getInstance()
local model = LeagueExploreController:getInstance():getModel()

local _string_format = string.format
local _table_insert = table.insert
local _table_remove = table.remove

LeagueExploreResultWindow = LeagueExploreResultWindow or BaseClass(BaseView)

function LeagueExploreResultWindow:__init()
    

    -- self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Full
    self.layout_name = "league_explore/league_explore_result_window"
    self.res_list = {
    	{path = PathTool.getPlistImgForDownLoad("exploration","exploration"), type = ResourcesType.plist },
    }
    self.config = LeagueExploreConst.resourse_data[3]
    self.config_b = LeagueExploreConst.resourse_data[4]
    self.size = cc.size(self.config.width, self.config.height)
    self.btn_item_list = {} -- 建筑
    self.btn_item_list_b = {} -- 建筑

    self.effect_list = {} -- 特效
    
    self.layer_num = self.config.layer_sum or 1
    self.map_data = {}  -- 地图数据
    self.speed_list = {0, -0.15, -0.25} -- 各图层移动速度
    self.map_resources_list = {} -- 地图资源
end

function LeagueExploreResultWindow:open_callback( )
    self.size = cc.size(self.config.width*display.getMaxScale(), self.config.height*display.getMaxScale())
    
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层
    self.background = self.root_wnd:getChildByName("background")
    
    self.touch_layer = self.root_wnd:getChildByName("touch_layer")   -- 触摸层
    self.map_layer = self.root_wnd:getChildByName("map_layer")       -- 地图层

    self.close_btn = self.ui_container:getChildByName("close_btn")

    self.down_container =self.ui_container:getChildByName("down_container")
    self.left_result_sprite = self.down_container:getChildByName("left_result_sprite") --败
    self.right_result_sprite = self.down_container:getChildByName("right_result_sprite") --胜
    self.left_result_x = 108
    self.right_result_x = 404
    self.left_result_sprite:setVisible(false)
    self.right_result_sprite:setVisible(false)

    self.current_label = self.down_container:getChildByName("current_label")


    -- 攻击方
    self.label_1 = self.down_container:getChildByName("label_1")
    -- 守方
    self.label_2 = self.down_container:getChildByName("label_2")

    self.left_last_label = self.down_container:getChildByName("left_last_label")
    self.right_last_label = self.down_container:getChildByName("right_last_label")

    self.result_btn = self.ui_container:getChildByName("result_btn")
    self.result_btn:setVisible(false)

    self.role_vo = RoleController:getInstance():getRoleVo()
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
function LeagueExploreResultWindow:updateMainScene(x, y)
    y = y or self.init_y
    for i=1, self.layer_num do
        if self["map_layer"..i] then
            self["map_layer"..i]:setPosition((x-self.init_x) * self["map_layer"..i].speed, y-self.init_y)
        end
    end
    self.map_layer:setPosition( x, y )
end

function LeagueExploreResultWindow:register_event()
   
    registerButtonEventListener(self.close_btn, handler(self, self.onClickCloseBtn), true, 2)
    registerButtonEventListener(self.result_btn,function()
        local _id = model:getResourceID()
        controller:sender29307(_id)
    end, true, 2)

    -- 注册场景触摸移动事件
    local function onTouchBegin(touch, event)
		-- 只在范围以内曹做移动
		if self.screenSize == nil then
			local pos = self.touch_layer:convertToWorldSpace(cc.p(0, 0))
			self.screenSize = cc.rect(pos.x, pos.y , SCREEN_WIDTH, 1280 )
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

		if self.last_point == nil then 
            return 
        end
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


    -- 查看 刷新数据
    self:addGlobalEvent(LeagueExploreEvent.Updata_Battle_Base_Data, function ()
        self:updateBtnList()
        self:updateBottomData()
    end)

     -- 打开视频列表
    self:addGlobalEvent(LeagueExploreEvent.Updata_Video_Look_Data, function ()
        local point = model:getVideoPos()
        controller:openVideoSelectPanel("" ,point)
    end)

    self:addGlobalEvent(LeagueExploreEvent.Updata_Step_Change_Data, function (step_status)
        if step_status == 4 then 
             self.result_btn:setVisible(true)
        end 
   end)



end

function LeagueExploreResultWindow:openRootWnd()

    self:setMapAndBuild()


    local _parapos = model:getParaPos()
    local num =   #self.config.building_list[_parapos]
    delayRun(self.root_wnd, num/display.DEFAULT_FPS, function ()
        local _id = model:getResourceID()
        controller:sender29306(_id)
    end)

    -- controller:sender29309()
    
end


-- 移动场景
function LeagueExploreResultWindow:moveMainScene(x)
    x = self.map_layer:getPositionX() + x
    local _x = self:scaleCheckPoint(x)
    self:updateMainScene(_x)
end

-- 位置校准
function LeagueExploreResultWindow:scaleCheckPoint( _x )
    if _x > 0 then
        _x = 0
    elseif _x < SCREEN_WIDTH - self.size.width then
        _x = SCREEN_WIDTH - self.size.width
    end
    return _x
end

function LeagueExploreResultWindow:setVisible(bool)
	self.is_visible = bool
	if self.root_wnd == nil or tolua.isnull(self.root_wnd) then return end
    self.root_wnd:setVisible(bool)
    
end

-- 创建建筑
function LeagueExploreResultWindow:createBtnList()
    if not self.config.building_list or next(self.config.building_list) == nil then return end

    local _parapos = model:getParaPos()
    if _parapos == 0 then 
       return
    end 


    for i, build_info in pairs(self.config.building_list[_parapos]) do
        delayRun(self.root_wnd, i/display.DEFAULT_FPS, function ()
            local build_item = self.btn_item_list[i]
            local btn_config = self.config.building_list[i]
            if build_item == nil then
                build_item = LeagueExploreTeamItem.New(build_info, self.config.id ,1)
                build_item:setParentWnd(self["map_layer" .. build_info.layer])  
                build_item._pos =  build_info.bid                            
                self.btn_item_list[i] = build_item
            end
        end)
    end

  
    for i, build_info in pairs(self.config_b.building_list[_parapos]) do
        delayRun(self.root_wnd, i/display.DEFAULT_FPS, function ()
            local build_item = self.btn_item_list_b[i]
            local btn_config = self.config.building_list[i]
            if build_item == nil then
                build_item = LeagueExploreTeamItem.New(build_info, self.config.id ,2)
                build_item:setParentWnd(self["map_layer" .. build_info.layer])
                build_item._pos =  build_info.bid                
                self.btn_item_list_b[i] = build_item
            end
        end)
    end
end

--刷新数据
function LeagueExploreResultWindow:updateBtnList()

    local _step = model:getCurrentStep()

    for i =1 ,#self.btn_item_list do 
        local build_item = self.btn_item_list[i]
        local _value = model:getAtkEmbattleDataByPos(build_item._pos)
        if build_item and _value then 
            build_item:setBaseData(_value,_step)
        end 
    end 

    for i =1 ,#self.btn_item_list_b do 
        local build_item1 = self.btn_item_list_b[i]
        local _value = model:getDefEmbattleDataByPos(build_item1._pos)
        if build_item1 and _value then 
            build_item1:setBaseData(_value,_step)
        end 
    end 




end
-- 更新或创建地图和建筑
function LeagueExploreResultWindow:setMapAndBuild()
    self:initMapCacheData()
    -- 创建地图
    self:createMap()
    -- 创建建筑和特效
    self:createBtnList()

end

-- 更新下面结果
function LeagueExploreResultWindow:updateBottomData()
     local data = model:getBattleBaseResultData()
     if not data then 
        return
     end 

     self.current_label:setString("当前阶段".."第"..StringUtil.numToChinese(data.step).."阶段")

     local status_step = model:getStepStatus()
     if status_step == 4  then 
        self.result_btn:setVisible(true)
     end 

     if  data.step==5  then 
        self.current_label:setString("争夺战已结束")
     end 

     self.label_1:setString("攻方(敌方)")
     self.label_2:setString("守方(我方)")
     local _is_my_atk = false
     if self.role_vo.lid == data.atk_league_id and  self.role_vo.lsrv_id ==data.atk_league_srv_id   then 
        _is_my_atk = true
        self.label_1:setString("攻方(我方)")
        self.label_2:setString("守方(敌方)")
     end 

       
     -- 进攻方
     local _atk_last_num = model:getAtkLastMember()
     self.left_last_label:setString("余：".._atk_last_num.."人" )


     -- 防守方
     local _def_last_num = model:getDefLastMember()
     self.right_last_label:setString("余：".._def_last_num.."人" )

     if data.result ==0 then 
        -- 无结果
        self.left_result_sprite:setVisible(false)
        self.right_result_sprite:setVisible(false)
     elseif data.result==1 then 
         -- 进攻方胜
         self.left_result_sprite:setPositionX(self.right_result_x )
         self.right_result_sprite:setPositionX(self.left_result_x )
         self.left_result_sprite:setVisible(true)
         self.right_result_sprite:setVisible(true)
     else 
         -- 进攻方败
         self.left_result_sprite:setPositionX(self.left_result_x )
         self.right_result_sprite:setPositionX(self.right_result_x )
         self.left_result_sprite:setVisible(true)
         self.right_result_sprite:setVisible(true)

     end 


end
-- 初始化地图数据
function LeagueExploreResultWindow:initMapCacheData()
    self.map_data = {}
    for i = 1, self.layer_num  do
        local res_path = "resource/bigbg/explore/hl_explore_bigbg_2.png"
        local pos_y = 0
        _table_insert(self.map_data, {res = res_path, layer = i, pos_y = pos_y})
    end
end

-- 创建地图
function LeagueExploreResultWindow:createMap()
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

function LeagueExploreResultWindow:onClickCloseBtn()
     controller:openLeagueExploreResultWindow(false)
end



function LeagueExploreResultWindow:setBuildRedStatus( bid )
    for k,build_item in pairs(self.btn_item_list) do
        local vo = build_item:getData()
        if vo and vo.bid == bid then
            build_item:updateRedStatus()
            break
        end
    end

    for k,build_item in pairs(self.btn_item_list_b) do
        local vo = build_item:getData()
        if vo and vo.bid == bid then
            build_item:updateRedStatus()
            break
        end
    end
end

function LeagueExploreResultWindow:close_callback()

    self.btn_item_list = {}
    self.btn_item_list_b = {}
    controller:openLeagueExploreResultWindow(false)
end
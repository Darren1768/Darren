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

LeagueExploreTeamWindow = LeagueExploreTeamWindow or BaseClass(BaseView)

function LeagueExploreTeamWindow:__init()
    

    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Big
    self.layout_name = "league_explore/league_explore_team_window"

    self.config = LeagueExploreConst.resourse_data[2]
    self.size = cc.size(self.config.width, self.config.height)
    self.btn_item_list = {} -- 建筑
    self.effect_list = {} -- 特效
    self.res_list = {
    	{ path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_93"), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_94"), type = ResourcesType.single },
    }
    self.layer_num = self.config.layer_sum or 1
    self.map_data = {}  -- 地图数据
    self.speed_list = {0, -0.15, -0.25} -- 各图层移动速度
    self.map_resources_list = {} -- 地图资源
end

function LeagueExploreTeamWindow:open_callback( )
    self.size = cc.size(self.config.width*display.getMaxScale(), self.config.height*display.getMaxScale())
    
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层
    self.background = self.root_wnd:getChildByName("background")

    self.bg_mid = self.root_wnd:getChildByName("bg_mid")

    if not self.item_load then
        local res = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_93", false)
        self.item_load = createResourcesLoad(res, ResourcesType.single, function()
            if not tolua.isnull(self.bg_mid) then
                loadSpriteTexture(self.bg_mid, res, LOADTEXT_TYPE)
            end
        end,self.item_load)
    end

    self.touch_layer = self.root_wnd:getChildByName("touch_layer")   -- 触摸层
    self.map_layer = self.root_wnd:getChildByName("map_layer")       -- 地图层
    self.map_layer:setInnerContainerSize(cc.size( self.size.width,self.size.height))
    self.map_layer:setScrollBarEnabled(false)
    self.map_layer:scrollToPercentHorizontal(50, 0, false)

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
    self.init_y =320 --  bottom_off
    self:updateMainScene(self.init_x, self.init_y)
end

-- 更新位置
function LeagueExploreTeamWindow:updateMainScene(x, y)
    y = y or self.init_y
    for i=1, self.layer_num do
        if self["map_layer"..i] then
            self["map_layer"..i]:setPosition((x-self.init_x) * self["map_layer"..i].speed, y-self.init_y)
        end
    end
    -- self.map_layer:setPosition( x, y )
end

function LeagueExploreTeamWindow:register_event()
    if self.background then
		self.background:addTouchEventListener(function(sender, event_type)
			if event_type == ccui.TouchEventType.ended then
				playQuitSound()
                controller:openTeamExploreWindow(false) 
			end
		end)
	end


    -- 注册场景触摸移动事件
    local function onTouchBegin(touch, event)
		-- 只在范围以内曹做移动
		if self.screenSize == nil then
			local pos = self.touch_layer:convertToWorldSpace(cc.p(0, 0))
			self.screenSize = cc.rect(pos.x, pos.y ,self.size.width, self.size.height )
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
            -- playQuitSound()
            -- controller:openTeamExploreWindow(false) 
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
		-- self.map_layer:runAction(cc.Sequence:create(ease_out))
	end
	
    local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
	listener:registerScriptHandler(onTouchBegin, cc.Handler.EVENT_TOUCH_BEGAN)
	listener:registerScriptHandler(onTouchMoved, cc.Handler.EVENT_TOUCH_MOVED)
	listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
	self.touch_layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self.touch_layer)

    self.scroll_view_container = self.map_layer:getInnerContainer()

    self.map_layer:addEventListener(function(sender, eventType)
        if eventType == ccui.ScrollviewEventType.containerMoved then
                   local container_x  = self.scroll_view_container:getPositionX()
                   if container_x < -120 and  container_x >-175 then 
                        self.editbox_1_name:setVisible(true)
                        self.Sprite_1:setVisible(true)
                        self.Sprite_2:setVisible(true)
                    else
                        self.editbox_1_name:setVisible(false)
                        self.Sprite_1:setVisible(false)
                        self.Sprite_2:setVisible(false)
                   end 
                --  print("----------------------1--------------",container_x)
        end
    end)
    -- self.map_layer:addEventListener(function()
    --     print("----------------------1--------------")
        
    -- end,9)

     -- 查看 刷新数据
     self:addGlobalEvent(LeagueExploreEvent.Look_Team_Embattled_Data, function ()
        -- local _parapos = model:getParaPos()
        -- local num =   #self.config.building_list[_parapos]
        -- delayRun(self.root_wnd, num/display.DEFAULT_FPS, function ()
        --     self:updateBtnList()
        -- end)
        self:updateBtnList()
    end)
     -- 自动布阵成功
     self:addGlobalEvent(LeagueExploreEvent.Updata_Up_Down_Team_Success_Data, function ()
        if  self._is_up_team then 
            -- 下阵
            self._is_up_team = false
            self.up_team_btn:setBtnLabel("自动上阵")

        else 
            self._is_up_team = true
            self.up_team_btn:setBtnLabel("一键下阵")

        end 
    end)
    
end

function LeagueExploreTeamWindow:openRootWnd()

    self:setMapAndBuild()

    local _parapos = model:getParaPos()
    local num =   #self.config.building_list[_parapos]
    delayRun(self.root_wnd, num/display.DEFAULT_FPS, function ()
        local _protocal = {}
        _protocal.type = model:getCurrentType()
        _protocal.id = model:getResourceID()

        if  self.role_vo.league_position == UnionConst.post_type.leader or   self.role_vo.league_position == UnionConst.post_type.assistant then 
            controller:sender29305(_protocal)
        else
            controller:sender29304(_protocal)
        end
    end)

end

-- 移动场景
function LeagueExploreTeamWindow:moveMainScene(x)
    x = self.map_layer:getPositionX() + x
    local _x = self:scaleCheckPoint(x)
    self:updateMainScene(_x)
end

-- 位置校准
function LeagueExploreTeamWindow:scaleCheckPoint( _x )
    if _x > 0 then
        _x = 0
    elseif _x < SCREEN_WIDTH - self.size.width then
        _x = SCREEN_WIDTH - self.size.width
    end
    return _x
end

function LeagueExploreTeamWindow:setVisible(bool)
	self.is_visible = bool
	if self.root_wnd == nil or tolua.isnull(self.root_wnd) then return end
    self.root_wnd:setVisible(bool)
    
end

-- 创建建筑
function LeagueExploreTeamWindow:createBtnList()
    if not self.config.building_list or next(self.config.building_list) == nil then return end

    local _parapos = model:getParaPos()
    print("---------------_parapos---------------",_parapos)
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
end
--刷新数据
function LeagueExploreTeamWindow:updateBtnList()

    for i =1 ,#self.btn_item_list do 
        local build_item = self.btn_item_list[i]
        local _value = model:getTeamEmbattledByPos(build_item._pos)
        print("-------------updateBtnList------------------------",_value)
        if build_item then 
            build_item:setBaseData(_value)
        end 
    end 
     
    
end


-- 创建标题
function LeagueExploreTeamWindow:createLayerTitle()
    self.editbox_1_name = self.ui_container:getChildByName("editbox_1_name")
    self.Sprite_1 = self.ui_container:getChildByName("Sprite_1")
    self.Sprite_2 = self.ui_container:getChildByName("Sprite_2")

    -- if self.editbox_1_name == nil then 
    --     -- self.titile_sprite = createSprite(PathTool.getResFrame("exploration", "hl_exploration_0010"), 380,954, LOADTEXT_TYPE_PLIST) 
    --     -- self.titile_sprite:setAnchorPoint(cc.p(0.5, 0.5))
    --     -- self.ui_container:addChild(self.titile_sprite, 1)
    --     -- self.editbox_1_name = createLabel(22, cc.c4b(239,212,174,0xff) , nil,380, 860, "设置出战阵容", self.ui_container, nil, cc.p(0.5, 0.5),TITLE_FONT)
    -- end

    if self.up_team_btn== nil then 
        self._is_up_team = false
        local res = PathTool.getResFrame("common","hl_common_4_5")
        self.up_team_btn = createButton(self.ui_container , "自动上阵", 360,490,nil, res,22,cc.c3b(255,238,202))
        self.up_team_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                print("自动上阵")
                self:upOrDownTeam()
            end
        end)    
    end 

    -- if self.up_team_btn== nil then 
    --     self._is_up_team = false
    --     local res = PathTool.getResFrame("common","hl_common_4_5")
    --     self.up_team_btn = createButton(self.ui_container , "自动上阵", 360,360,nil, res,22,cc.c3b(255,238,202))
    --     self.up_team_btn:addTouchEventListener(function(sender, event_type) 
    --         if event_type == ccui.TouchEventType.ended then
    --             print("自动上阵")
    --             self:upOrDownTeam()
    --         end
    --     end)    
    -- end 

end


-- 自动上阵  一键下阵
function LeagueExploreTeamWindow:upOrDownTeam()
    if  self.role_vo.league_position == UnionConst.post_type.leader or   self.role_vo.league_position == UnionConst.post_type.assistant then 
        if  self._is_up_team then 
            -- 下阵
            -- self:downTeamData()
            local _protocal = {}
            _protocal.type = model:getCurrentType()
            _protocal.id = model:getResourceID()
            _protocal.embattled_type = 2 
              controller:sender29312(_protocal)
         else
            -- 上阵
            -- self:upTeamData()
            local _protocal = {}
            _protocal.type = model:getCurrentType()
            _protocal.id = model:getResourceID()
            _protocal.embattled_type = 1
              controller:sender29312(_protocal)
         end
    else
        message("只有联盟会长或者副会长才可以编辑队伍") 
    end 
    
   
end
-- local pos_info = {}
-- for i,v in pairs(self.hero_pos_list) do
--     local d = {}
--     d.pos = i
--     d.id = v.partner_id
--     table_insert(pos_info, d)
-- end
-- -- if #pos_info == 0 then
-- --     message(TI18N("至少需要展示一个英雄"))
-- --     return
-- -- end
--  HeroController:getInstance():sender11212(PartnerConst.Fun_Form.PersonalSpace, 1, pos_info, 0)
function LeagueExploreTeamWindow:upTeamData()
    self.pos_info ={}
    for i =1 ,#self.btn_item_list do 
        local build_item = self.btn_item_list[i]
        local _value = model:getUpTeamData(i)
        if build_item then 
            -- if _value then 
            --     local d = {}
            --     d.pos =build_item._pos
            --     d.id = _value.face  
            --     table.insert(self.pos_info,d)
            -- end 
            build_item:setBaseData(_value)
        end 
    end 
    print("------------upTeamData------------------")
    -- printLuaTable(self.pos_info)
    -- HeroController:getInstance():sender11212(PartnerConst.Fun_Form.LeagueExploreMode, 1, self.pos_info, 0)

end 

function LeagueExploreTeamWindow:downTeamData()
    for i =1 ,#self.btn_item_list do 
        local build_item = self.btn_item_list[i]
        if build_item then 
            build_item:setBaseData(nil)
        end 
    end 

    -- HeroController:getInstance():sender11212(PartnerConst.Fun_Form.LeagueExploreMode, 1,{}, 0)

end 
-- 更新或创建地图和建筑
function LeagueExploreTeamWindow:setMapAndBuild()
    self:initMapCacheData()
    -- 创建地图
    self:createMap()
   
    self:createLayerTitle()
    -- 创建建筑和特效
    self:createBtnList()

end

-- 初始化地图数据
function LeagueExploreTeamWindow:initMapCacheData()
    self.map_data = {}
    for i = 1, self.layer_num  do
        local res_path = "resource/bigbg/explore/hl_explore_bigbg_3.png"
        local pos_y =0
        _table_insert(self.map_data, {res = res_path, layer = i, pos_y = pos_y})
    end
   

end

-- 创建地图
function LeagueExploreTeamWindow:createMap()
    if not self.map_data or next(self.map_data) == nil then return end
    for i, map_info in ipairs(self.map_data) do
        delayRun(self.root_wnd, i/display.DEFAULT_FPS, function ()
            cc.Director:getInstance():getTextureCache():addImageAsync(map_info.res, function()
                if self["map_layer"..map_info.layer] then
                    local tmp_spr = self.map_resources_list[map_info.layer]
                    if tmp_spr == nil then
                        -- local tmp_spr = createSprite(map_info.res, 0, map_info.pos_y, self["map_layer"..map_info.layer], cc.p(0, 0), LOADTEXT_TYPE, -1)
                        local tmp_spr = createSprite(map_info.res, 0, map_info.pos_y, self.map_layer, cc.p(0, 0), LOADTEXT_TYPE, -1)
                        self.map_resources_list[map_info.layer] = tmp_spr
                    else
                        loadSpriteTexture(tmp_spr, map_info.res, LOADTEXT_TYPE)
                    end
                end
            end, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
        end)
    end
end

function LeagueExploreTeamWindow:onClickCloseBtn()
    controller:openTeamExploreWindow(false)
    MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.main_scene)
end



function LeagueExploreTeamWindow:setBuildRedStatus( bid )
    for k,build_item in pairs(self.btn_item_list) do
        local vo = build_item:getData()
        if vo and vo.bid == bid then
            build_item:updateRedStatus()
            break
        end
    end
end

function LeagueExploreTeamWindow:close_callback()

    self.btn_item_list = {}
    controller:openTeamExploreWindow(false)
end
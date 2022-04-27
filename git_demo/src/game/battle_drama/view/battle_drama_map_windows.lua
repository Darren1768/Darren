--------------------------------------------
-- @description    : 
-- 剧情副本章节地图
---------------------------------
BattleDramaMapWindows = BattleDramaMapWindows or BaseClass(BaseView)

local controller = BattleDramaController:getInstance()
local model = controller:getModel()
local _string_format = string.format

function BattleDramaMapWindows:__init()
    self.win_type = WinType.Big
    self.layout_name = "battledrama/battle_drama_map_windows"

    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("battledrop", "battledrop"), type = ResourcesType.plist},
        {path = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_79",false), type = ResourcesType.single},
    }
    -- 地图
    self.size = cc.size(3240*display.getMaxScale(), 1920*display.getMaxScale())
    self.layer_num =  1
    self.speed_list = {0, -0.15, -0.25} -- 各图层移动速度
    self.map_resources_list = {} -- 地图资源
    self.map_data = {}  -- 地图数据
    self.resourse_item_list = {} -- 建筑
    self.all_enemy_data = {}  -- 

    -- local max_chapter_id = BattleDramaController:getInstance():getModel():getCurMaxChapterId(model:getDramaData().mode)
    local max_chapter_id = model:getDramaData().chapter_id
    -- 章
    local config = Config.DungeonData.data_drama_world_info[1] -- 1 代表章
    self.all_chapter_data ={}
    local index = 1
    for i,v in ipairs(config) do
        self.all_chapter_data[index] = {info = v,is_lock = max_chapter_id < v.chapter_id, parent_view = self}
        index = index + 1
    end

end


function BattleDramaMapWindows:open_callback()
    self.map_layer = self.root_wnd:getChildByName("background")
    if self.map_layer then
        self.map_layer:setScale(display.getMaxScale())
    end
    self.touch_layer = self.root_wnd:getChildByName("touch_layer")   -- 触摸层

      -- 创建对应配置数量的图层
     for i=1,self.layer_num do
        self["map_layer"..i] = ccui.Widget:create()
        self["map_layer"..i]:setAnchorPoint(cc.p(0, 0))
        self["map_layer"..i]:setContentSize(self.size)
	    self.map_layer:addChild(self["map_layer"..i], self.layer_num + 1 - i)
        -- 同时定义每一层的相对移动速度
        self["map_layer"..i].speed = self.speed_list[i]
    end
    self["map_layer1"]:setScale(1)

    local main_container = self.root_wnd:getChildByName("main_container")
    self.main_container = main_container

    local map_node = main_container:getChildByName("map_node")
    local card_node = main_container:getChildByName("card_node")

    local chapter_node = main_container:getChildByName("chapter_node") -- 下面章

    self.map_layout = map_node:getChildByName("map_layout")
    self.card_layout = card_node:getChildByName("card_layout")
    self.chapter_layout = chapter_node:getChildByName("chapter_layout")

    self.left_btn = chapter_node:getChildByName("left_btn")
    self.right_btn = chapter_node:getChildByName("right_btn")

    local Sprite_2 =  map_node:getChildByName("Sprite_2")
    Sprite_2:setPosition(cc.p(650,74))

    self.base_pic = card_node:getChildByName("base_pic")
    self.close_btn = main_container:getChildByName("close_btn")

 

    -- 适配
    local top_off = display.getTop(main_container)
    local y =  map_node:getPositionY()
    map_node:setPositionY(top_off - (1280 -y))
    y =  card_node:getPositionY()
    card_node:setPositionY(top_off - (1280 -y))
    --创建map scroll
    local bgSize = self.map_layout:getContentSize()
    local scroll_view_size = cc.size(bgSize.width, bgSize.height)
    local setting = {
        item_class = BattleDramaMapItem,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 0,                    -- x方向的间隔
        start_y = 10,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = 235,               -- 单元的尺寸width
        item_height = 151,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 0,                         -- 列数，作用于垂直滚动类型
        need_dynamic = true,
        -- is_cancelHuiTan = true  --取消回弹
    }

    self.chapter_scrollview = CommonScrollViewLayout.new(self.map_layout, cc.p(0,0) , ScrollViewDir.horizontal, ScrollViewStartPos.top, scroll_view_size, setting)
    self.chapter_scrollview:setData(self.all_chapter_data)
    self.chapter_scrollview.scroll_view:setBounceEnabled(false)
    self.chapter_scrollview:setSwallowTouches(false)
    local unlockCnt=0
    for i,v in ipairs(self.all_chapter_data) do
        if v.is_lock == false   then  
            unlockCnt =unlockCnt + 1
            if unlockCnt >1 then
                self.chapter_scrollview:setClickEnabled(true)
            end
        end
    end
    local percent  = ((unlockCnt-1)/#self.all_chapter_data) *100 +(unlockCnt-1)
    self.chapter_scrollview:scrollToPercentHorizontal(percent,2,false)
    --创建node scroll
    local bgSize = self.card_layout:getContentSize()
    local scroll_view_size2 = cc.size(bgSize.width, bgSize.height)
    local setting2 = {
        item_class = BattleDramaNodeItem,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 0,                    -- x方向的间隔
        start_y = 0,                    -- 第一个单元的Y起点
        space_y = -5,                   -- y方向的间隔
        item_width = 253,               -- 单元的尺寸width
        item_height = 114,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 1,                         -- 列数，作用于垂直滚动类型
        need_dynamic = false
    }
    self.enemy_scrollview = CommonScrollViewLayout.new(self.card_layout, cc.p(0,0) , ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size2, setting2)
    self.enemy_scrollview:setClickEnabled(false)
    self:updateCardNode()
    -- self.enemy_scrollview:setBounceEnabled(false)

    --- 下面章（故事）
    --创建node scroll
    local bgSize_1 = self.chapter_layout:getContentSize()
    local scroll_view_size3 = cc.size(bgSize_1.width, bgSize_1.height)
    local setting3= {
        item_class = BattleDramaBtnNodeItem,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 20,                    -- x方向的间隔
        start_y = 0,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = 100,               -- 单元的尺寸width
        item_height = 100,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 1,                         -- 列数，作用于垂直滚动类型
        need_dynamic = true,
        -- is_cancelHuiTan = true  --取消回弹

    }
    self.chapter_btn_scrollview = CommonScrollViewLayout.new(self.chapter_layout, cc.p(0,0) , ScrollViewDir.horizontal, ScrollViewStartPos.top, scroll_view_size3, setting3)
    self.chapter_btn_scrollview:setSwallowTouches(false)
    self.chapter_btn_scrollview.scroll_view:setBounceEnabled(false)
    

    -- 适配
    local bottom_off = display.getBottom(self.map_layer)
    self.map_layer:setScale(display.getMaxScale())
    self.init_x = ( SCREEN_WIDTH - self.size.width ) * 0.5
    self.init_y = bottom_off
end


function BattleDramaMapWindows:updateChapterData( chapter_id )
    local chapter = chapter_id or model:getDramaData().chapter_id
    local map_id = model:getDramaData().map_id
    self.all_enemy_data = {}

    self.all_map_avatar = {}
    self.totle_map_avatar = {}
    -- local mapConfig = Config.DungeonData.data_drama_dungeon_getmap
    -- for i,v in pairs(mapConfig) do
    --     if v.chapter_id == chapter and i<=map_id then
    --         self.all_enemy_data[i%1000] = {floor =  i%1000,id_list = v.map_avatar[1],map_id =i}
    --     end
    --     if i <= map_id then 
    --         self.all_map_avatar[i] = v
    --     end 
    -- end
    local mapConfig = Config.DungeonData.data_drama_dungeon_getmap
    for i,v in pairs(mapConfig) do
        if v.chapter_id == chapter and i<=map_id then
            self.all_enemy_data[i%1000] = {floor =  i%1000,id_list = v.map_avatar[1],map_id =i}
        end
        if i <= map_id then 
            if v and v.map_avatar and v.map_avatar[1] then 
                for j,k in pairs(v.map_avatar[1]) do 
                    if  v.boss_pos2[j] then 
                        self.all_map_avatar[k] = v.boss_pos2[j]
                    end 
                end 
            end 
           
        end 
        if v and v.map_avatar and v.map_avatar[1] then 
            for j,k in pairs(v.map_avatar[1]) do 
                if  v.boss_pos2[j] then 
                    self.totle_map_avatar[k] = v.boss_pos2[j]
                end 
            end 
        end 
    end

    --
   
end

function BattleDramaMapWindows:register_event()
    registerButtonEventListener(self.close_btn, handler(self, self._onClickCloseBtn), true, 2)
    registerButtonEventListener(self.left_btn, handler(self, self._onClickLeftBtn), true, 1)
    registerButtonEventListener(self.right_btn, handler(self, self._onClickRightBtn), true, 1)


      -- 注册场景触摸移动事件
    local function onTouchBegin(touch, event)
		-- 只在范围以内曹做移动
		if self.screenSize == nil then
			local pos = self.touch_layer:convertToWorldSpace(cc.p(0, 0))
			self.screenSize = cc.rect(pos.x, pos.y , SCREEN_WIDTH, SCREEN_HEIGHT)
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
		self:moveMainScene(self.last_point.x,self.last_point.y)
	end
	
	local function onTouchEnded(touch, event)
		if self.last_point == nil then return end
		local interval_x = self.last_point.x * 3
		local interval_y = self.last_point.y * 3
		local temp_x = self.map_layer:getPositionX() + interval_x
        local temp_y = self.map_layer:getPositionY() + interval_y

		-- 修正之后的目标位置
		local target_x = self:scaleCheckPoint(temp_x)
        local target_y = self:scaleCheckPointY(temp_y)

        for i = 1, self.layer_num do
			if self["map_layer" .. i] then
				local move_to = cc.MoveTo:create(1, cc.p((target_x - self.init_x) * self["map_layer" .. i].speed, (target_y - self.init_y) * self["map_layer" .. i].speed))
				self["map_layer" .. i]:runAction(cc.EaseBackOut:create(move_to))
			end
		end
		local root_move_to = cc.MoveTo:create(1, cc.p(target_x, target_y))
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


-- 移动场景
function BattleDramaMapWindows:moveMainScene(x,y)
    x = self.map_layer:getPositionX() + x
    local _x = self:scaleCheckPoint(x)

     y = self.map_layer:getPositionY() + y
    local _y  = self:scaleCheckPointY(y)
    self:updateMainScene(_x,_y)
end


-- 更新位置
function BattleDramaMapWindows:updateMainScene(x, y)

    for i=1, self.layer_num do
        if self["map_layer"..i] then
            self["map_layer"..i]:setPosition((x-self.init_x) * self["map_layer"..i].speed, (y-self.init_y) * self["map_layer"..i].speed)
        end
    end
    self.map_layer:setPosition( x, y )
end

-- 位置校准
function BattleDramaMapWindows:scaleCheckPoint( _x )
    if _x > 0 then
        _x = 0
    elseif _x < SCREEN_WIDTH - self.size.width then
        _x = SCREEN_WIDTH - self.size.width
    end
    return _x
end

-- 位置校准
function BattleDramaMapWindows:scaleCheckPointY( _y )
    if _y > 0 then
        _y = 0
    elseif _y < SCREEN_HEIGHT - self.size.height -70 then
        _y = SCREEN_HEIGHT - self.size.height -70
    end
    return _y
end

-- 创建建筑
function BattleDramaMapWindows:createBtnList()
    self.resourse_item_list={}
    local index =1 
    -- for k, v  in pairs(self.all_map_avatar) do
    --     index = index+1 
    --     delayRun(self.root_wnd, index/display.DEFAULT_FPS, function ()
    --         local build_item = self.resourse_item_list[k]
    --         local _id  = k
    --         local _pos = v
    --         if build_item == nil then
    --             local _par_config = Config.PartnerData.data_partner_base[_id].draw_res
    --             local icon_res = PathTool.getSingleImgForDownLoad("herodraw/herodrawres",_par_config, false)
    --             local load_type = LOADTEXT_TYPE
    --             build_item = createSprite(icon_res, _pos[1],_pos[2], self["map_layer1"] , cc.p(0, 0), load_type )
    --             self.resourse_item_list[k] = build_item
    --             build_item:setScale(0.22)  
    --             build_item:setPosition(cc.p(_pos[1],_pos[2]))   
    --             setChildBlackShader(true,build_item,cc.c3b(94,93,93))
    --             -- build_item:setColor(cc.c3b(94,93,93))
    --         end
    --     end)
    -- end
    for k, v  in pairs(self.totle_map_avatar) do
        index = index+1 
        delayRun(self.root_wnd, index/display.DEFAULT_FPS, function ()
            local build_item = self.resourse_item_list[k]
            local _id  = k
            local _pos = v
            if build_item == nil then
                local _par_config = Config.PartnerData.data_partner_base[_id].draw_res
                local icon_res = PathTool.getSingleImgForDownLoad("herodraw/herodrawres_small",_par_config, false)
                local load_type = LOADTEXT_TYPE
                build_item = createSprite(icon_res, _pos[1],_pos[2], self["map_layer1"] , cc.p(0, 0), load_type )
                self.resourse_item_list[k] = build_item
                -- build_item:setScale(0.22)  
                build_item:setPosition(cc.p(_pos[1],_pos[2]))   
                if self.all_map_avatar[k] then 
                    setChildBlackShader(false,build_item,cc.c3b(94,93,93))
                else
                    setChildBlackShader(true,build_item,cc.c3b(94,93,93))
                end
            end
        end)
    end
end


-- -- 创建建筑
-- function BattleDramaMapWindows:createBtnList()
--     self.resourse_item_list={}
--     local index =1 
--     for i, build_info in pairs(self.all_map_avatar) do
--         index = index+1 
--         delayRun(self.root_wnd, index/display.DEFAULT_FPS, function ()
--             if build_info and build_info.map_avatar and build_info.map_avatar[1] then 
--                 for k,v in pairs(build_info.map_avatar[1]) do 
--                     local build_item = self.resourse_item_list[i..k]
--                     local _id  = v 
--                     local _pos = build_info.boss_pos2[k]
--                     if _pos then 
--                         if build_item == nil then
--                             local _par_config = Config.PartnerData.data_partner_base[_id].draw_res
--                             local icon_res = PathTool.getSingleImgForDownLoad("herodraw/herodrawres",_par_config, false)
--                             local load_type = LOADTEXT_TYPE
--                             build_item = createSprite(icon_res, _pos[1]+30,_pos[2], self["map_layer1"] , cc.p(1, 1), load_type )
--                             self.resourse_item_list[i..k] = build_item
--                             build_item:setScale(0.22/1)  
--                             build_item:setPosition(cc.p(_pos[1]+30,_pos[2]))   
--                         end
--                     end 
--                 end 
--             end 
--         end)
--     end
-- end
-- 刷新建筑
function BattleDramaMapWindows:updateBtnList()

end


-- 更新或创建地图和建筑
function BattleDramaMapWindows:setMapAndBuild()
    self:initMapCacheData()
    -- 创建地图
    self:createMap()
    -- 创建建筑和特效
    self:createBtnList()
end

-- 初始化地图数据
function BattleDramaMapWindows:initMapCacheData()
    self.map_data = {}
    for i = 1, self.layer_num  do
        local res_path = "resource/bigbg/hl_bigbg_79.png"
        local pos_y =  0
        table.insert(self.map_data, {res = res_path, layer = i, pos_y = pos_y})
    end
end

-- 创建地图
function BattleDramaMapWindows:createMap()
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


function BattleDramaMapWindows:_onClickCloseBtn(  )
    controller:openBattleDramaMapWindows(false)
end


function BattleDramaMapWindows:_onClickRuleBtn(  )
    WorldmapController:getInstance():openWorldMapTipsWindow(true,self.chapter_id,WorldmapEvent.open_type.open_type_4)
end

function BattleDramaMapWindows:_onClickRankBtn(  )
    RankController:getInstance():openRankView(true, RankConstant.RankType.drama)
end

function BattleDramaMapWindows:_onClickWorldBtn(  )
    WorldmapController:getInstance():openWorldMapMainWindow(true)
end

function BattleDramaMapWindows:openRootWnd( chapter_id )
    self.drama_data = model:getDramaData()
    if self.drama_data and next(self.drama_data) ~= nil then
        self.chapter_id = chapter_id or self.drama_data.chapter_id
        controller:send13020()
    end

    self:setMapAndBuild()

    self:updataChapterBtnList()
end

function BattleDramaMapWindows:updateCardNode( chapter_id )
    
    -- self.enemy_scrollview:setContentSize(cc.size(25*#self.all_enemy_data,120))

    local chapter = chapter_id or model:getDramaData().chapter_id
    self:updateChapterData(chapter)
    self.enemy_scrollview:setData(self.all_enemy_data)
    local y = self.card_layout:getPositionY() - 114 *#self.all_enemy_data - (-5) *(#self.all_enemy_data -1)
    self.base_pic:setPositionY(y )


    -- self.background:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "battledrama/hl_battledrama_bg_100"..chapter,false), LOADTEXT_TYPE)
    -- self.map_layer:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_79"), LOADTEXT_TYPE)

end



-----**************** 章btn start*************


function BattleDramaMapWindows:updataChapterBtnList( )
    -- self.data = data
    -- local item_list = data.item_list
    local chapter_id  = 1


    local _config = Config.DungeonData.data_drama_world_info
    local list = {}
    self.current_chapter_index =1
    for i = 1,#_config do
        local vo = {}
        vo.id  = i 
        vo.is_lock = true
        if i <= chapter_id then 
            vo.is_lock = false
        end 
        vo.isSelect = false
        if i == chapter_id then 
            vo.isSelect = true
            self.current_chapter_index = i
        end 
        vo.parent_view = self
        table.insert(list,vo)
    end
    print("------------------------",self.chapter_btn_scrollview)
    self.chapter_btn_list = list
    self.chapter_btn_scrollview:setData(list)
    -- self.chapter_btn_scrollview:addEndCallBack(function (  )
    --     local list_item = self.item_scrollview:getItemList()
    --     for k,v in pairs(list_item) do
    --         v:addCallBack(function()
    --          print("---------111-------")
    --         end)
    --     end
    -- end)

end
function BattleDramaMapWindows:selectChapterBtnList(id)
    print("-------------selectChapterBtnList-----------",id)
    for k,v in pairs(self.chapter_btn_list) do 
        v.isSelect = false
        if v.id == id then
            v.isSelect = true
            self.current_chapter_index  = id
        end 
    end 
    self.chapter_btn_scrollview:reloadData()
end 

function BattleDramaMapWindows:_onClickRightBtn()
    self.current_chapter_index = self.current_chapter_index +1 
    if  self.current_chapter_index > #self.chapter_btn_list then 
        self.current_chapter_index =  #self.chapter_btn_list
        return
    end 
    local is_lock =  self.chapter_btn_list[self.current_chapter_index ].is_lock
    if is_lock then 
         return
    end 

    local percent  = (self.current_chapter_index/#self.chapter_btn_list) *100
    self.chapter_btn_scrollview:scrollToPercentHorizontal(percent,0.5)
    self:selectChapterBtnList(self.current_chapter_index)

end 
function BattleDramaMapWindows:_onClickLeftBtn()
    self.current_chapter_index = self.current_chapter_index -1 
    if  self.current_chapter_index <1 then
        self.current_chapter_index = 1
        return
    end 
    local is_lock =  self.chapter_btn_list[self.current_chapter_index ].is_lock
    if is_lock then 
         return
    end 

    
    local percent  =  (self.current_chapter_index/#self.chapter_btn_list) *100

    self.chapter_btn_scrollview:scrollToPercentHorizontal(percent,0.5)
    self:selectChapterBtnList(self.current_chapter_index)
end
-----**************** 章end *************

function BattleDramaMapWindows:close_callback(  )
    if self.resources_load then
        self.resources_load:DeleteMe()
        self.resources_load = nil
    end

    if self.main_point_list then
        for k, v in pairs(self.main_point_list) do
            if v then
                v:DeleteMe() 
            end
        end
    end

    if not tolua.isnull(self.spine_model) then
        self.spine_model:runAction(cc.RemoveSelf:create(true))
        self.spine_model = nil
    end

    if self.cur_effect then
        self.cur_effect:clearTracks()
        self.cur_effect:removeFromParent()
        self.cur_effect = nil
    end

    if self.map_layer then
        self.map_layer:removeAllChildren()
        self.map_layer:stopAllActions()
    end
    
    if self.enemy_scrollview then
        self.enemy_scrollview:DeleteMe()
        self.enemy_scrollview = nil
    end
    
    if self.chapter_scrollview then
        self.chapter_scrollview:DeleteMe()
        self.chapter_scrollview = nil
    end

    if self.chapter_btn_scrollview then
        self.chapter_btn_scrollview:DeleteMe()
        self.chapter_btn_scrollview = nil
    end

    controller:openBattleDramaMapWindows(false)
end



BattleDramaMapItem = class("BattleDramaMapItem", function()
        return ccui.Widget:create()
    end)

function BattleDramaMapItem:ctor()
    self:configUI()
    self:register_event()
end

function BattleDramaMapItem:configUI(  )
    self.size = cc.size(235,151)
    self:setTouchEnabled(false)
    self:setContentSize(self.size)

    local csbPath = PathTool.getTargetCSB("battledrama/battle_drama_map_item")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    local container = self.root_wnd:getChildByName("main_container")
    self.container = container

    self.bg = container:getChildByName("bg")
    self.name = container:getChildByName("name")
    self.lock = container:getChildByName("lock")
    self.lock:setPositionX(116)
end

function BattleDramaMapItem:register_event(  )
    registerButtonEventListener(self.bg, handler(self, self._onClickChapter), false, 1)
    self.bg:setSwallowTouches(false)
end

function BattleDramaMapItem:setData( data )
    if not data then return end
    self.data = data
    self.lock:setVisible(data.is_lock)
    local name = '第'..StringUtil.numToChinese(data.info.chapter_id)..'节'
    self.name:setString(StringUtil.branchStr(name))
    if data.is_lock then
        self.bg:setColor(cc.c3b(120,120,120))
    else
        self.bg:setColor(cc.c3b(255,255,255))
    end

    -- local res_id =  Config.DungeonData.data_drama_world_info[1][data.info.bid].map_id
    -- local res = PathTool.getBattleSceneRes(_string_format("%s/map_bg", res_id), false)
    -- self.bg:loadTexture(res, LOADTEXT_TYPE)
    -- delayRun(self.root_wnd, data.info.chapter_id/display.DEFAULT_FPS, function ()
    --     self.bg:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "battledrama/hl_battledrama_"..data.info.map_id,false), LOADTEXT_TYPE)
    -- end)
    self.bg:loadTexture(PathTool.getSingleImgForDownLoad("bigbg", "battledrama/hl_battledrama_"..data.info.map_id,false), LOADTEXT_TYPE)

end

function BattleDramaMapItem:_onClickChapter(  )
    if self.data.is_lock then
        return
    end
    if self.data.parent_view.updateCardNode then
        self.data.parent_view:updateCardNode(self.data.info.chapter_id)
    end
end


BattleDramaNodeItem = class("BattleDramaNodeItem", function()
        return ccui.Widget:create()
    end)

function BattleDramaNodeItem:ctor()
    self:configUI()
    self:register_event()
end

function BattleDramaNodeItem:configUI(  )
    self.size = cc.size(253,114)
    self:setTouchEnabled(false)
    self:setContentSize(self.size)

    local csbPath = PathTool.getTargetCSB("battledrama/battle_drama_node_item")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    local container = self.root_wnd:getChildByName("main_container")
    self.name = container:getChildByName('name')
    self.title_pic = container:getChildByName('title_pic')
    self.head_box_list = {}
    self.head_icon_list = {}
    for i=1,3 do
        self.head_box_list[i] = container:getChildByName('head_box_'..i)
        self.head_icon_list[i] = container:getChildByName('head_icon_'..i)
    end

end

function BattleDramaNodeItem:register_event(  )

end

function BattleDramaNodeItem:setData( data )
    if not data then 
        return
    end 
 
    --最多3个
    if data.id_list and next(data.id_list) ~=nil then 
        for i=1,3 do
            if data.id_list[i] then
                local res = PathTool.getHeadIcon(data.id_list[i])
                self.head_icon_list[i]:loadTexture( res, LOADTEXT_TYPE)

                self.head_icon_list[i]:setVisible(true)
                self.head_box_list[i]:setVisible(true)
            else
                self.head_icon_list[i]:setVisible(false)
                self.head_box_list[i]:setVisible(false)
            end
        end
    end 
    self.title_pic:setVisible(data.floor ~= 1)
    self.name:setVisible(data.floor ~= 1)

    self.name:setString(StringUtil.numToChinese(data.floor))
end

function BattleDramaNodeItem:DeleteMe(  )

end



BattleDramaBtnNodeItem = class("BattleDramaBtnNodeItem", function()
    return ccui.Widget:create()
end)

function BattleDramaBtnNodeItem:ctor()
    self:configUI()
    self:register_event()
end

function BattleDramaBtnNodeItem:configUI(  )
    self.size = cc.size(100,100)
    self:setContentSize(self.size)

    local csbPath = PathTool.getTargetCSB("battledrama/battle_drama_chapter_btn_node")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    self.container = self.root_wnd:getChildByName("container")
    self.normal_img = self.container:getChildByName('normal_img')
    self.select_img = self.container:getChildByName('select_img')
    self.label = self.container:getChildByName('label')

     self.lock =  self.container:getChildByName('lock')

end

function BattleDramaBtnNodeItem:register_event(  )
    registerButtonEventListener(self.container, handler(self, self._onClickBtnChapter), false, 1)
    self.container:setSwallowTouches(false)
end

function BattleDramaBtnNodeItem:setData(data)
    self.data = data 
    if data.isSelect then 
        self.select_img:setVisible(true)
        self.normal_img:setVisible(false)
        self.label:setTextColor(cc.c3b(249,231,150))
    else
        self.select_img:setVisible(false)
        self.normal_img:setVisible(true)
        self.label:setTextColor(cc.c3b(239,212,174))
    end 
    
    if self.data.is_lock then 
        setChildUnEnabled(true, self.container)
        self.label:setVisible(false)
        self.lock:setVisible(true)
    else
        setChildUnEnabled(false, self.container)
        self.label:setVisible(true)
        self.lock:setVisible(false)

    end 

     print("----------------BattleDramaBtnNodeItem--------------------",self.data.is_lock)
    --  printLuaTable(data)
    self.label:setString("章"..StringUtil.numToChinese(data.id))
end

function BattleDramaBtnNodeItem:_onClickBtnChapter()
    if self.data.is_lock then
        return
    end
    if self.data.parent_view.selectChapterBtnList then
        self.data.parent_view:selectChapterBtnList(self.data.id)
    end
end
function BattleDramaBtnNodeItem:DeleteMe(  )

end


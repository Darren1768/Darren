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

LeagueExploreChanllengeResultWindow = LeagueExploreChanllengeResultWindow or BaseClass(BaseView)

function LeagueExploreChanllengeResultWindow:__init()
    
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Mini
    self.layout_name = "league_explore/league_explore_chanllenge_result_window"
    self.res_list = {
    	{ path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_93"), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_94"), type = ResourcesType.single },
    }

    self.rank_list = {}
end

function LeagueExploreChanllengeResultWindow:open_callback( )
    self.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)
    self.background = self.root_wnd:getChildByName("background")
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层

    self.bg_sprite=  self.ui_container:getChildByName("bg_sprite")
    -- loadSpriteTexture(self.bg_sprite,  PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_93"), LOADTEXT_TYPE)
    self.bg_sprite:setOpacity(0)

    self.title =  self.ui_container:getChildByName("title")

    -- -- 守方
    self.defender_container = self.ui_container:getChildByName("defender_container")
    self.defender_score = self.defender_container:getChildByName("defender_score")
    self.defender_title = self.defender_container:getChildByName("defender_title")
    self.defender_name  = self.defender_container:getChildByName("label")

    -- 攻方
    self.attack_container = self.ui_container:getChildByName("attack_container")
    self.attack_title = self.attack_container:getChildByName("attack_title")
    self.attack_score = self.attack_container:getChildByName("attack_score")
    self.attack_name  = self.attack_container:getChildByName("label")

    -- 战斗详情
    self.resule_detail_btn = self.ui_container:getChildByName("resule_detail_btn")
    -- 积分详情
    self.score_detail_btn = self.ui_container:getChildByName("score_detail_btn")

    -- 积分排名
    self.score_container = self.ui_container:getChildByName("score_container")
    
    -- 获得奖励
    self.reward_container = self.ui_container:getChildByName("reward_container")

    -- 占领成功/失败
    self.result_label = self.score_container:getChildByName("result_label")

    self.result_sprite = self.ui_container:getChildByName("result_sprite")

    self.Panel_6 = self.reward_container:getChildByName("Panel_6")
    -- local scroll_view_size = self.Panel_6:getContentSize()
    -- local setting = {
    --     item_class = BackPackItem, -- 单元类
    --     start_x =BackPackItem.Width * 0.8-2, -- 第一个单元的X起点
    --     space_x = 0, -- x方向的间隔
    --     start_y = 2, -- 第一个单元的Y起点
    --     space_y = 0, -- y方向的间隔
    --     item_width = BackPackItem.Width * 0.8, -- 单元的尺寸width
    --     item_height = BackPackItem.Height * 0.8, -- 单元的尺寸height
    --     row = 1, -- 行数，作用于水平滚动类型
    --     col = 0, -- 列数，作用于垂直滚动类型
    --     scale = 0.8
    -- }

    -- self.item_scrollview = CommonScrollViewLayout.new(self.Panel_6, cc.p(0, 0), ScrollViewDir.horizontal, ScrollViewStartPos.bottom, scroll_view_size, setting)
    -- self.item_scrollview:setSwallowTouches(true)
    -- self.item_scrollview:setTouchEnabled(false)
end


function LeagueExploreChanllengeResultWindow:register_event()
    if self.background then
		self.background:addTouchEventListener(function(sender, event_type)
			if event_type == ccui.TouchEventType.ended then
				playQuitSound()
                controller:openLeagueExploreChanllengeResultWindow(false) 
			end
		end)
	end

    registerButtonEventListener(self.resule_detail_btn, function()
        
        print("--------------resule_detail_btn--------1-------")
        controller:openLeagueExploreScoreRankWindow(true,1)
     end ,true , 2)
    registerButtonEventListener(self.score_detail_btn, function() 
        controller:openLeagueExploreScoreRankWindow(true,2)
        print("--------------score_detail_btn-----2----------")
    end ,true, 2)



     -- 查看 刷新数据
     self:addGlobalEvent(LeagueExploreEvent.Updata_Chanllenge_Result_Data, function (data)
        self:updataUI(data)
    end)
    self:addGlobalEvent(LeagueExploreEvent.Updata_Chanllenge_Team_Data, function (data)
        self:updateRewardData()
    end)

end

function LeagueExploreChanllengeResultWindow:openRootWnd()
    -- local _id = model:getResourceID()
    -- controller:sender29307(_id)


    local data = model:getAtkBaseRankData()
    self:updataUI(data)
end


function LeagueExploreChanllengeResultWindow:updataUI(data)
    if not data then
        return 
    end 
    local _data = data 

    local role_vo = RoleController:getInstance():getRoleVo()
    

    -- 判断挑战成功或者失败
    -- 我方是否是进攻吗
    local isMyAtk  = false 
    local _myData = {}
    local _league_rank = _data.league_rank
    if _league_rank and #_league_rank >0 then 
        for i=1 , #_league_rank do 
            if role_vo.lid == _league_rank[i].atk_league_id and role_vo.lsrv_id ==_league_rank[i].atk_league_srv_id   then --  
                isMyAtk = true 
                _myData =_league_rank[i]

                -- 有我方联盟了 请求布阵数据 判断是否上阵了
                local _id = model:getResourceID()

                local protocal = {}
                protocal.id = _id
                protocal.atk_league_id = _league_rank[i].atk_league_id
                protocal.atk_league_srv_id = _league_rank[i].atk_league_srv_id

                controller:sender29308(protocal)
                break
            end    
        end 
    end 


    if  _myData.result ==1 then 
        if isMyAtk  then 
            -- 挑战成功
            self.title:setString("挑战成功")
            self:setBackGround(true)
            self.attack_name:setString("攻方[我方]")
            self.defender_name:setString("守方[敌方]")
            self.result_sprite:setPositionX(506)

        else
            -- 挑战失败
            self.title:setString("挑战失败")
            self:setBackGround(false)
            self.attack_name:setString("攻方[敌方]")
            self.defender_name:setString("守方[我方]")

        end
        self.result_label:setString("占领失败")
    elseif _myData.result ==2 then 
        if isMyAtk  then 
              -- 挑战失败
            self.title:setString("挑战失败")
            self:setBackGround(false)
            self.attack_name:setString("攻方[我方]")
            self.defender_name:setString("守方[敌方]")
            self.result_sprite:setPositionX(183)
        else
            -- 挑战成功
            self.title:setString("挑战成功")
            self:setBackGround(true)
            self.attack_name:setString("攻方[敌方]")
            self.defender_name:setString("守方[我方]") 

        end
        self.result_label:setString("占领成功")
    else
        self:setBackGround(false)
    end 

    self.defender_title:setString(_data.def_league_name)

    if _myData then 
        self.defender_score:setString("积分   ".._myData.def_score)
        self.attack_title:setString(_myData.atk_league_name)
        self.attack_score:setString("积分   ".._myData.atk_score)    
    end 
   
    self:updateRankData( _data.league_rank)
    self.my_data = _myData
end

function LeagueExploreChanllengeResultWindow:updateRewardData()
    local _data = self.my_data
    local _reward_data = {}
    -- Config.LeagueExploreData.data_const

     if _data.result == 1 then 
         -- 成功
         local _win_reward = Config.LeagueExploreData.data_const["win_award"].val
         for i =1,#_win_reward do 
             table.insert(_reward_data,_win_reward[i])
         end 
     end

     if _data.result == 2 then 
        -- 失败
        local _loss_reward = Config.LeagueExploreData.data_const["loss_award"].val
        for i =1,#_loss_reward do 
            table.insert(_reward_data,_loss_reward[i])
        end 
    end

    local isTeam = model:isBattle() 
    
    if  isTeam then 
        -- 我是否上阵
        local _join_reward = Config.LeagueExploreData.data_const["join_award"].val
        for i =1,#_join_reward do 
            table.insert(_reward_data,_join_reward[i])
        end 
    end

    self.total_width= 280
    self.item_list ={}
    local item_config = nil
    local index = 1
    local item = nil
    local scale = 0.8
    local off = 0
    local _x, _y = 0, 50
    local sum = #_reward_data
    for i=sum,1,-1 do
        local v = _reward_data[i]
        item_config = Config.ItemData.data_get_data(v[1])
        if item_config then
            if self.item_list[index] == nil then
                item = BackPackItem.new(false, true, false, scale, false, true) 
                _x = self.total_width - ( (index-1)*(BackPackItem.Width*scale+off) + BackPackItem.Width*0.5*scale )
                item:setPosition(_x, _y)
                self.Panel_6:addChild(item)
                self.item_list[index] = item
            end
            item = self.item_list[index]
            item:setBaseData(v[1],v[2])
            index = index + 1
        end
    end

    --  -- 奖励数据
    --  local item_list = {}
    --  for k, v in pairs(_reward_data) do
    --      local vo = {}
    --      vo.id = v[1]
    --      vo.quantity = v[2]
    --      table.insert(item_list, vo)
    --  end
    --  self.item_scrollview:addEndCallBack(function()
    --          local list = self.item_scrollview:getItemList()
    --          for k, v in pairs(list) do
    --              v.effect = false
    --              v:setDefaultTip()
    --              v:setSwallowTouches(true)
    --          end
    --      end)
    --  self.item_scrollview:setData(item_list)

end 

function LeagueExploreChanllengeResultWindow:updateRankData(list)
    local rank_list = model:getRaknRoleTopThreeList(list)
    if rank_list and next(rank_list or {}) ~= nil then
        for i, v in ipairs(rank_list) do
            if not self.rank_list[i] then
                local item = self:createSingleRankItem(i, v)
                self.score_container:addChild(item)
                self.rank_list[i] = item
            end
            local item = self.rank_list[i]
            if item then
                item:setPosition(25, 140 - (i - 1) * item:getContentSize().height -34)
                item.label:setString(v.atk_league_name )
                item.value:setString("积分  "..(v.atk_score or 0))
            end
        end
    end
end


--排行榜单项
function LeagueExploreChanllengeResultWindow:createSingleRankItem(i, data)
    local container = ccui.Layout:create()
    container:setAnchorPoint(cc.p(0, 1))
    container:setContentSize(cc.size(180, 36))
    local sp = createSprite(PathTool.getResFrame("common", "hl_common_200" .. (i-1)), 30, 40 / 2, container)
    sp:setScale(0.4)
    container.sp = sp
    local label = createLabel(20, cc.c4b(129,104,65,0xff), nil, 60, 20, "", container)
    label:setAnchorPoint(cc.p(0, 0.5))
    local value = createLabel(20, cc.c4b(129,104,65,0xff), nil, 180, 20, "", container)
    value:setAnchorPoint(cc.p(0, 0.5))
    container.label = label
    container.value = value
    return container
end


function LeagueExploreChanllengeResultWindow:setBackGround(status)
    print("---------------------setBackGround-----------------")
   local _res ={}
    if status == true  then 
        -- 成功
        _res =  PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_93")
    else
        _res = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_94")
    end
    self.bg_sprite:setOpacity(255)
    loadSpriteTexture(self.bg_sprite,  _res, LOADTEXT_TYPE)

end

function LeagueExploreChanllengeResultWindow:close_callback()

    self.btn_item_list = {}
    controller:openLeagueExploreChanllengeResultWindow(false)
end


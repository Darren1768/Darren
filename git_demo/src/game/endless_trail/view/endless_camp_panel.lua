-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      阵容试炼主场景
-- --------------------------------------------------------------------

EndlessTrailCampPanel = class("EndlessTrailCampPanel", function()
    return ccui.Widget:create()
end)
local ctrl = Endless_trailController:getInstance()
local model = ctrl:getModel()
local string_format = string.format

function EndlessTrailCampPanel:ctor()
    -- 今日已挑战或者今日没挑战的状态
    self.ack_status = 0
    self.rank_list = {}
    self.is_first_open = true  -- 首次打开界面标识
    self.is_first_send_23903 = true -- 是否首次请求23903
    self.item_list = {}

    self:configUI()
	self:register_event()
end


function EndlessTrailCampPanel:addToParent( status )
	status = status or false
    self:setVisible(status)
    if self.is_first_open == true then
        self.is_first_open = false
        self:setRankShow()
        self:updateBaseInfo()
    end

    if self.is_first_send_23903 == true then
        local data = model:getEndlessData()
        if data and data.select_type then
            self.is_first_send_23903 = false
            ctrl:send23903(Endless_trailEvent.endless_type.singlemode)
        end
    end

    if status == true then
        self:updateFirendRedPoint()
        self:updateGetBtnRedPoint()
        self:updateAckBtnRedPoint()
    end
end

function EndlessTrailCampPanel:configUI(...)
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_camp_panel"))
	self.root_wnd:setPosition(0,0)
    self:addChild(self.root_wnd)
    self:setCascadeOpacityEnabled(true)
    self:setAnchorPoint(0,0)


	self.mainContainer = self.root_wnd:getChildByName("main_container")
    self.top_panel = self.mainContainer:getChildByName("top_panel")
    self.bottom_panel = self.mainContainer:getChildByName("bottom_panel")
    self.friend_btn = self.bottom_panel:getChildByName("friend_btn")
    self.firend_red_point = self.friend_btn:getChildByName("red_point")
    self.firend_red_point:setVisible(false)
    local label = self.friend_btn:getChildByName("label")
    label:setString(TI18N("好友助阵"))

    self.ack_btn = self.bottom_panel:getChildByName("ack_btn")
    self.ack_btn_label = self.ack_btn:getChildByName("label")
    self.ack_btn_label:setString(TI18N("开始挑战"))
    self.ack_btn_red_point = self.ack_btn:getChildByName("red_point") 

    self.tips_button = self.top_panel:getChildByName("tips_button")
    
    self.rank_container = self.top_panel:getChildByName("rank_container")
    local rank_desc_label  = self.rank_container:getChildByName("rank_desc_label")
    rank_desc_label:setString(TI18N("闯关排行榜"))
    self.rank_info_btn = self.rank_container:getChildByName("rank_info_btn")

    self.mid_panel =  self.mainContainer:getChildByName("mid_panel")

    local  mid_sprite =  self.mainContainer:getChildByName("mid_sprite")
    loadSpriteTexture(mid_sprite, PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_30"), LOADTEXT_TYPE)

    -- 当前进度
    self.current_label = createRichLabel(22, cc.c4b(255, 255, 255, 0xff), cc.p(0.5,0.5), cc.p(320,356))
    self.mid_panel:addChild(self.current_label)
    


    self.friend_container = self.bottom_panel:getChildByName("friend_container")
    self.friend_container:setVisible(false)
    -- self.friend_container:getChildByName("label_1"):setString(TI18N("已选择:"))
    -- self.friend_power = self.friend_container:getChildByName("power")
    -- self.friend_head = PlayerHead.new(PlayerHead.type.circle)
    -- self.friend_head:setScale(0.4)
    -- self.friend_head:setPosition(100, 24)
    -- self.friend_container:addChild(self.friend_head)

    
    --一些文本
    self.friend_label = createRichLabel(22, cc.c4b(0x64, 0x32, 0x23, 0xff), cc.p(0.5,0.5), cc.p(590,-21))
    self.bottom_panel:addChild(self.friend_label)

    -- self.from_label = createRichLabel(22, cc.c4b(0x95, 0x53, 0x22, 0xff), cc.p(0.5, 0.5), cc.p(358,115))
    -- self.bottom_panel:addChild(self.from_label)
    -- self.has_label = createRichLabel(22, cc.c4b(0xff, 0xf8, 0xbf, 0xff), cc.p(0.5, 0.5), cc.p(358,-30))
    -- self.bottom_panel:addChild(self.has_label)

    self:updateMidPanel()

    local top_off = display.getTop(main_container)
	self.top_panel:setPositionY(top_off - 237)
    
	local bottom_off = display.getBottom(main_container)
	-- self.bottom_panel:setPositionY(bottom_off + 180)

    
end

function EndlessTrailCampPanel:register_event( ... )
   
    registerButtonEventListener(self.info_touch, function()
        if self.base_data then
            ctrl:openEndlessRewardWindow(true,Endless_trailEvent.endless_type.singlemode)
        end
        
    end,true, 1)

    registerButtonEventListener(self.rank_info_btn, function()
        if self.base_data then
            ctrl:openEndlessRankView(true,Endless_trailEvent.type.rank,Endless_trailEvent.endless_type.singlemode)
        end
    end,true, 1)

    registerButtonEventListener(self.tips_button, function()
        if  Config.EndlessData.data_explain and Config.EndlessData.data_explain[2] then
            MainuiController:getInstance():openCommonExplainView(true,  Config.EndlessData.data_explain[2], TI18N("玩法规则"))
        end
    end,true, 1)



    registerButtonEventListener(self.ack_btn, function()
        -- if self.base_data and self.base_data.type ~= 0 and self.base_data.type ~= self.base_data.select_type then
        --     message(TI18N("当日无法挑战"))
        --     return
        -- end
        local  open_level = Config.EndlessData.data_get_open_level[Endless_trailEvent.endless_type.singlemode][self.base_data.now_current_round_individual]
        if open_level > self.base_data.hero_max_level then
            message(TI18N("武灵等级不足"))
            return
        end 
        -- local rolevo = RoleController:getInstance():getRoleVo()
        -- local open_config = Config.EndlessData.data_const.endless_new_limit
        -- local open_lev = Config.EndlessData.data_const.endless_new_limit_lev
        -- if self.base_data and rolevo and open_config and open_lev then
        --     if self.base_data.max_round < open_config.val and rolevo.lev < open_lev.val then
        --         message(string_format(TI18N("无尽试炼通关%d关且等级达到%d级后开启挑战"),open_config.val,open_lev.val))
        --         return
        --     elseif self.base_data.max_round < open_config.val then
        --         message(string_format(TI18N("无尽试炼通关%d关后开启挑战"),open_config.val))
        --         return
        --     elseif rolevo.lev < open_lev.val then
        --         message(string_format(TI18N("等级达到%d级后开启挑战"),open_lev.val))
        --         return
        --     end
        -- end


        local has_hire_list = model:getHasHirePartnerData() or {}
        local list = has_hire_list.list or {}
        local fun_form = PartnerConst.Fun_Form.EndLessSingleMode
       

        HeroController:getInstance():openFormGoFightPanel(true, fun_form, {has_hire_list = list})
        -- if self.ack_status == 2 then
        --     CommonAlert.show(TI18N("本日已不可获得通关累计奖励，但依然可以继续挑战<div fontcolor=#289b14>首通奖励</div>和<div fontcolor=#289b14>排行榜排名</div>，是否确认继续挑战？"), TI18N("确定"), function() 
        --         HeroController:getInstance():openFormGoFightPanel(true, fun_form, {has_hire_list = list})
        --     end, TI18N("取消"), nil, CommonAlert.type.rich)
        -- else
           
        -- end
    end,true, 1)

    -- registerButtonEventListener(self.friend_btn, function()
    --     ctrl:openEndlessFriendHelpView(true)
    -- end,true, 1)

    EventManager:getInstance():Bind(Endless_trailEvent.UPDATA_BASE_DATA,self,function()
            if self.is_first_send_23903 == true then
                local data = model:getEndlessData()
                if data and data.select_type then
                    self.is_first_send_23903 = false
                    ctrl:send23903(Endless_trailEvent.endless_type.singlemode)
                end
            end
            self:updateBaseInfo()
        end)
    
 
    EventManager:getInstance():Bind(Endless_trailEvent.UPDATA_REDPOINT_SENDPARTNER_DATA,self,function()
            self:updateFirendRedPoint()
        end)
    
    EventManager:getInstance():Bind(Endless_trailEvent.UPDATA_REDPOINT_FIRST_DATA,self,function()
            self:updateGetBtnRedPoint()
        end)
    
    EventManager:getInstance():Bind(Endless_trailEvent.UPDATA_REDPOINT_REWARD_DATA,self,function()
            self:updateAckBtnRedPoint()
        end)
    

    EventManager:getInstance():Bind(Endless_trailEvent.UPDATA_RANK_DATA,self,function()
            self:updateRankData()
            -- 自己当前排名奖励
            self:updateRankItem()
        end)
    
end

--更新挑战按钮红点
function EndlessTrailCampPanel:updateAckBtnRedPoint()
    -- if self.ack_btn_red_point then
    --     local status = model:getIsGetAllRewardNew()
    --     if status == nil or ctrl:checkNewEndLessIsOpen() == false then
    --         status = false
    --     end
    --     self.ack_btn_red_point:setVisible(status)
    -- end
end

--更新领取按钮红点
function EndlessTrailCampPanel:updateGetBtnRedPoint()
    if self.get_btn and self.base_data then
        local status = model:getFirstGet(Endless_trailEvent.endless_type.singlemode)
        if status == nil then
            status = false
        end
        addRedPointToNodeByStatus( self.get_btn, status, 5, 5)
    end
end

--更新好友红点
function EndlessTrailCampPanel:updateFirendRedPoint()
    -- if self.firend_red_point and not tolua.isnull(self.firend_red_point) then
    --     local bool = model:getIsSendPartner()
    --     if bool == nil or ctrl:checkNewEndLessIsOpen() == false then
    --         bool = false
    --     end
    --     self.firend_red_point:setVisible(bool)
    -- end
end

function EndlessTrailCampPanel:setRankShow()
    if RankController:getInstance():checkRankIsShow() then
        self.rank_container:setVisible(true)
    else
        self.rank_container:setVisible(false)
    end
end

function EndlessTrailCampPanel:updateBaseInfo()
    local data = model:getEndlessData()
    self.base_data = data
    if self.base_data then
        -- self.from_label:setString(string.format(TI18N("从%s关开始"),data.new_current_round))
        -- self.has_label:setString(string.format(TI18N("今天已通关%s关"),data.new_day_pass_round))
        self.ack_btn_label:setString(TI18N("开始挑战"))

        if data.day_pass_round_individual  ~= 0 and data.is_reward_individual == TRUE then
            self.ack_status = 2
        else
            self.ack_status = 1
        end

        -- if data.is_employ == FALSE and next(data.list or {}) == nil then --没雇佣伙伴
        --     self.friend_label:setString(TI18N("选择一位好友的英雄帮助"))
        --     self.friend_container:setVisible(false)
        --     self.friend_label:setVisible(true)
        -- else
        --     if data.list and data.list[1] then
        --         local partner_data = data.list[1]
        --         self.friend_label:setVisible(false)
        --         self.friend_container:setVisible(true)
        --         self.friend_head:setHeadRes(partner_data.bid)
        --         self.friend_power:setString(partner_data.power)
        --     end
        -- end
        local line = math.modf( data.now_current_round_individual / 5 )  -- 取整数
        local mod = math.fmod( data.now_current_round_individual, 5 )    -- 取余数

        local _str = "第" ..(line+1) .. "盏" .. mod .. "波"
        local _currten_str = "<div fontcolor=#EFD4AE outline=2,#533D33>当前进度：</div>" .. "<div fontcolor=#FAE896 outline=2,#533D33>".._str.."</div>" 
        self.current_label:setString(_currten_str)


        self:updateMidPanelList()

        self:updateRankData()
        -- 自己当前排名奖励
        self:updateRankItem()
        
        setChildUnEnabled(false,self.ack_btn)
        self.ack_btn_label:disableEffect(cc.LabelEffect.OUTLINE)

       
        if self.base_data.now_current_round_individual ==0 then 
            self.base_data.now_current_round_individual =1
        end

        local  open_level = Config.EndlessData.data_get_open_level[Endless_trailEvent.endless_type.singlemode][self.base_data.now_current_round_individual]
        if open_level <= self.base_data.hero_max_level then
            -- 可以打
            setChildUnEnabled(false,self.ack_btn)
            self.ack_btn_red_point:setVisible(true)
            self.ack_btn_label:enableOutline(Config.ColorData.data_color4[264], 2)
        else
            setChildUnEnabled(true,self.ack_btn)
            self.ack_btn_red_point:setVisible(false)
            self.ack_btn_label:disableEffect(cc.LabelEffect.OUTLINE)
          
        end
    end
end

function EndlessTrailCampPanel:updateMidPanel()
    
    local good_cons =   self.mid_panel 
    local scroll_view_size = good_cons:getContentSize()
    local setting = {
        item_class = EndlessTrailCampItem,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 20,                    -- x方向的间隔
        start_y = 70,                    -- 第一个单元的Y起点
        space_y = 20,                   -- y方向的间隔
        item_width = 140,               -- 单元的尺寸width
        item_height = 300,              -- 单元的尺寸height
        row = 1,                        -- 行数，作用于水平滚动类型
        col = 0                         -- 列数，作用于垂直滚动类型
    }
    self.child_scrollview = CommonScrollViewLayout.new(good_cons,cc.p(0,0),ScrollViewDir.horizontal ,ScrollViewStartPos.top, scroll_view_size, setting)
    self.child_scrollview:setSwallowTouches(false)
end

function EndlessTrailCampPanel:updateMidPanelList()
    local item_list ={}
    local config_floor=  Config.EndlessData.data_floor_data[Endless_trailEvent.endless_type.singlemode]
    local  open_level = Config.EndlessData.data_get_open_level[Endless_trailEvent.endless_type.singlemode]
    for i=1,#config_floor do
        local now_current_round_individual =self.base_data.now_current_round_individual 
        if now_current_round_individual ==0 then 
            now_current_round_individual=1
        end
        if  now_current_round_individual  >20 then
              if i > (now_current_round_individual -10)  or  i < (now_current_round_individual +10) then 
                local _vv = {}
                _vv.item = config_floor[i].items
                _vv.open_lev = open_level[i]
                _vv.id = config_floor[i].id 
                _vv.current_round_individual =now_current_round_individual      
                _vv.hero_max_level = self.base_data.hero_max_level      
                table.insert(item_list, _vv)
              end
        elseif  i <= 20 then 
            local _vv = {}
            _vv.item = config_floor[i].items
            _vv.open_lev = open_level[i]
            _vv.id = config_floor[i].id 
            _vv.current_round_individual = now_current_round_individual    
            _vv.hero_max_level = self.base_data.hero_max_level      
            table.insert(item_list, _vv)
        end
      
    end 

    self.item_list = item_list
    self.child_scrollview:setData(item_list)

    local _num =0 
    for i=1,#item_list do 
         local _v = item_list[i]
         if _v.id == _v.current_round_individual then 
            _num = i 
            break 
         end
    end
    _num= _num -1
    local _percent = 0 
    _percent =( _num / (#self.item_list-1)) * 120
    self.child_scrollview:scrollToPercentHorizontal(_percent, 0, false)

end 

--[[
    @desc: 更新首通奖励
    author:{author}
    time:2018-08-16 10:17:14
    --@args: 
    @return:
]]
--- 排名奖励
function EndlessTrailCampPanel:updateRankItem()
    if self.base_data == nil then return end
    if self.base_data.new_my_individual == nil then return end
    local config = nil

    if Config.EndlessData.data_rank_reward_data and Config.EndlessData.data_rank_reward_data[Endless_trailEvent.endless_type.singlemode] then
        for i,v in ipairs(Config.EndlessData.data_rank_reward_data[Endless_trailEvent.endless_type.singlemode]) do
            if self.base_data.new_my_individual >= v.min and self.base_data.new_my_individual <= v.max then
                config = v
                break
            end
        end
    end
    
    
end

--[[
    @desc: 更新排行榜
    author:{author}
    time:2018-08-16 10:38:15
    --@args: 
    @return:
]]
function EndlessTrailCampPanel:updateRankData( ... )
    local rank_list = {}
    if self.base_data then
        rank_list = model:getRaknRoleTopThreeList(Endless_trailEvent.endless_type.singlemode)
    end
    
    if rank_list and next(rank_list or {}) ~= nil then
        for i, v in ipairs(rank_list) do
            if not self.rank_list[i] then
                local item = self:createSingleRankItem(i, v)
                self.rank_container:addChild(item)
                self.rank_list[i] = item
            end
            local item = self.rank_list[i]
            if item then
                item:setPosition(15, 238 - (i - 1) * item:getContentSize().height)
                item.label:setString(v.name)
                item.value:setString((v.val or 0)..TI18N("关"))
            end
        end
    end
end


--排行榜单项
function EndlessTrailCampPanel:createSingleRankItem(i, data)
    local container = ccui.Layout:create()
    container:setAnchorPoint(cc.p(0, 1))
    container:setContentSize(cc.size(180, 40))
    local sp = createSprite(PathTool.getResFrame("common", "hl_common_28" .. (i+6)), 30, 40 / 2, container)
    sp:setScale(0.7)
    container.sp = sp
    local label = createLabel(20, cc.c4b(47,34,33,0xff), nil, 60, 20, "", container)
    label:setAnchorPoint(cc.p(0, 0.5))
    local value = createLabel(20, cc.c4b(0xff,0x9b,0x1e,0xff), nil, 180, 20, "", container)
    value:setAnchorPoint(cc.p(0, 0.5))
    container.label = label
    container.value = value
    return container
end



function EndlessTrailCampPanel:DeleteMe(...)
  
    if self.item_scrollview then
        self.item_scrollview:DeleteMe()
        self.item_scrollview = nil
    end
   
    if self.rank_item_scrollview then
        self.rank_item_scrollview:DeleteMe()
        self.rank_item_scrollview = nil
    end
    EventManager:getInstance():UnBind(self)
    
end
---------------------------------
EndlessTrailCampItem = class("EndlessTrailCampItem",function()
    return ccui.Layout:create()
end)

function EndlessTrailCampItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_camp_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)
    self:setCascadeOpacityEnabled(true)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    local container = self.root_wnd:getChildByName("container")
    self.unselect_bg = container:getChildByName("unselect_bg")
    self.select_bg = container:getChildByName("select_bg")
    local  title_node = container:getChildByName("title")
    title_node:setVisible(false)

    self.title = createRichLabel(24, cc.c4b(98, 53, 43, 0xff), cc.p(0.5,0.5), cc.p(65,198),0,nil,0,TITLE_FONT)
    container:addChild(self.title)

    local reward_node  = container:getChildByName("reward")
    self.score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 60), nil, nil, 300)
    container:addChild(self.score_info)

    self.reward_label = container:getChildByName("label")
    self.reward_label:setPositionX(64)

    self.reward = BackPackItem.new(false, true, false, 0.6, false)
    self.reward:setAnchorPoint(0.5, 0.5)
    reward_node:addChild( self.reward)
    self.reward:setDefaultTip()


    self.container = container

    self:registerEvent()
end

function EndlessTrailCampItem:registerEvent()
   
end

function EndlessTrailCampItem:addCallBack(call_back)
    self.call_back = call_back
end
function EndlessTrailCampItem:setData(data)
    local role_vo = RoleController:getInstance():getRoleVo()
    if data and role_vo then
        self.data = data

        self.reward:setBaseData(self.data.item[1][1],self.data.item[1][2])
       

        local  open_level = Config.EndlessData.data_get_open_level[Endless_trailEvent.endless_type.singlemode][self.data.current_round_individual]
        local _str = "最高武灵\n≥" .. (self.data.open_lev +1 ) .. "(".. self.data.hero_max_level .. ")\n级开启"
        if open_level > self.data.hero_max_level then
            -- 不可以打
             _str = "最高武灵\n≥" .. (self.data.open_lev +1 ) .. " (<div fontcolor=#FF0000>".. self.data.hero_max_level .. "</div>)\n级开启"
        end

       
        self.title:setString(_str)

        if self.data.current_round_individual == self.data.id then 
            self.select_bg:setVisible(true)
            self.unselect_bg:setVisible(false)
            self.reward_label:setColor(cc.c3b(250,232,150))
        else
            self.select_bg:setVisible(false)
            self.unselect_bg:setVisible(true)
            self.reward_label:setColor(cc.c3b(239,212,174))

        end
        
    end
end

function EndlessTrailCampItem:DeleteMe()
    
    self:removeAllChildren()
    self:removeFromParent()
end

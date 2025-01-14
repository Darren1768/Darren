-- --------------------------------------------------------------------
--      召唤伙伴主界面
-- --------------------------------------------------------------------
NewPartnerSummonWindow = NewPartnerSummonWindow or BaseClass(BaseView)

local item_pos_limit1 = 240
local item_pos_limit2 = 490
local item_img_width  = 360 --图片的宽度
local item_center_pos = {360,640} --位于中间的位置

-- local item_pos_y = 157
-- 100 --基础召唤-- 200 --友情召唤-- 300 --高级召唤
local recruit_list = {100,300,200}

local base_info = Config.RecruitData.data_partnersummon_data
--背景图动作参数
local action_info = Config.RecruitData.data_partnersummon_action_params
local controller = NewPartnersummonController:getInstance()
local model = controller:getModel()
function NewPartnerSummonWindow:__init()
    self.win_type = WinType.Full
    self.layout_name = "newpartnersummon/newpartnersummon_window"
    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("newpartnersummon", "newpartnersummon"), type = ResourcesType.plist},
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_21", false), type = ResourcesType.single },
        -- { path = PathTool.getSingleImgForDownLoad("bigbg/role_card","1",false), type = ResourcesType.single },
        -- { path = PathTool.getSingleImgForDownLoad("bigbg/role_card","2",false), type = ResourcesType.single },
        -- { path = PathTool.getSingleImgForDownLoad("bigbg/role_card","3",false), type = ResourcesType.single },
        -- { path = PathTool.getSingleImgForDownLoad("newpartnersummon","partnersummon_role2"), type = ResourcesType.single },
        -- { path = PathTool.getSingleImgForDownLoad("newpartnersummon","partnersummon_role3"), type = ResourcesType.single },
    }
    -- self.sprite_role_load = {}
    self.item_list_res = {}
    self.item_list_time = {}
    self.item_time_bg = {}
    self.cur_index = 2
    self.cur_box_status = nil
    self.first_come = nil
    self.happening_touch = nil --避免玩家不断点击动画的时候
    self.use_once_item = {}
    self.use_five_item = {}
    self.summon_timer = {}
    self.is_use_once_ext = false
    self.is_use_five_ext = false
    self.role_vo = RoleController:getInstance():getRoleVo()


    local hori_base_num,portrait_base_num = action_info[1].hori_base_num,action_info[1].portrait_base_num
    self.size                   = cc.size(1440,1280)
    self.singleSize             = cc.size(self.size.width/hori_base_num,self.size.height/portrait_base_num)
    self.layer_num              = 4
    self.speed_list             = {0.25, 0, -0.2, -0.3}
    self.layer_img_list         = {"1.png", "2.png", "3.png", "4.png"}
    self.map_resources_list = {}

    -- 计算出地图的初始位置
    self.init_x = ( SCREEN_WIDTH - self.size.width ) * 0.5
    self.init_y = ( SCREEN_HEIGHT - self.size.height ) * 0.5
end

--创建层次场景
function NewPartnerSummonWindow:createLayer()
    -- 创建7个地图层,其中1是最靠前的层
    local main_path = "resource/newpartnersummon/draw_bg_image/"
    for i=4,1,-1 do
        self["map_layer"..i] = ccui.Layout:create()
        self["map_layer"..i]:setAnchorPoint(cc.p(0,0))
        self["map_layer"..i]:setContentSize(self.size)
        if self.touch_layer and self["map_layer"..i] then
            self.touch_layer:addChild(self["map_layer"..i]) 	
        end

        local tmp_spr = createSprite(main_path..self.layer_img_list[i],self.size.width/2,self.size.height/2, self["map_layer"..i], cc.p(0.5,0.5), LOADTEXT_TYPE, -1)
        self.map_resources_list[i] = tmp_spr
    end

    self.difference_width = ( SCREEN_WIDTH*display.getMaxScale() - (display.getRight(self.root_wnd, true) - display.getLeft(self.root_wnd, true)) ) * 0.5 / display.getMaxScale()
    self:updateDrawScene(self.init_x,self.init_y)
end

-- --==============================--
-- --desc:场景计时器
-- --@return 
-- --==============================--
-- function NewPartnerSummonWindow:setScheduleUpdate(status)
--     if status == true then
--         if self.queue_timer == nil then
--             self.queue_timer = GlobalTimeTicket:getInstance():add(function() 
--                     self:update()
--                 end, 1/display.DEFAULT_FPS)
--         end
--     else
--         if self.queue_timer ~= nil then
--             GlobalTimeTicket:getInstance():remove(self.queue_timer)
--             self.queue_timer = nil
--         end
--     end
-- end

function NewPartnerSummonWindow:readyRunAction()
    --动作层1 cc.EaseSineOut:create() seq1
    local runtime1,runtime2,runtime3 = action_info[2][1].run_time,action_info[2][2].run_time,action_info[2][3].run_time

    local move_base_x1,move_base_y1 = action_info[2][1].move_base_x,action_info[2][1].move_base_y
    local move_base_x2,move_base_y2 = action_info[2][2].move_base_x,action_info[2][2].move_base_y
    local move_base_x3,move_base_y3 = action_info[2][3].move_base_x,action_info[2][3].move_base_y

    local movex1,movey1 = self.singleSize.width*move_base_x1,self.singleSize.height*move_base_y1
    local movex2,movey2 = self.singleSize.width*move_base_x2,self.singleSize.height*move_base_y2
    local movex3,movey3 = self.singleSize.width*move_base_x3,self.singleSize.height*move_base_y3

    -- local origin_x = self.map_resources_list[1]:getPositionX()
    local seq1 = cc.Sequence:create(
        cc.EaseExponentialOut:create(cc.MoveBy:create(runtime1,cc.p(movex1,movey1))),
        cc.EaseExponentialOut:create(cc.MoveBy:create(runtime2,cc.p(movex2,movey2))),
        cc.EaseExponentialOut:create(cc.MoveBy:create(runtime3,cc.p(movex3,movey3)))  
        -- cc.MoveBy:create(10,cc.p(-self.singleSize.width,0)),
        -- cc.MoveBy:create(10,cc.p(self.singleSize.width*2,0)),
        -- cc.MoveBy:create(10,cc.p(-self.singleSize.width,0))
    )
    
    local act1 = cc.RepeatForever:create(seq1)
    self.map_layer1:runAction(act1) --self.map_layer1 self.map_layer2 self.map_layer3
    --动作层2
    runtime1,runtime2,runtime3 = action_info[3][1].run_time,action_info[3][2].run_time,action_info[3][3].run_time

    move_base_x1,move_base_y1 = action_info[3][1].move_base_x,action_info[3][1].move_base_y
    move_base_x2,move_base_y2 = action_info[3][2].move_base_x,action_info[3][2].move_base_y
    move_base_x3,move_base_y3 = action_info[3][3].move_base_x,action_info[3][3].move_base_y

    movex1,movey1 = self.singleSize.width*move_base_x1,self.singleSize.height*move_base_y1
    movex2,movey2 = self.singleSize.width*move_base_x2,self.singleSize.height*move_base_y2
    movex3,movey3 = self.singleSize.width*move_base_x3,self.singleSize.height*move_base_y3

    local seq2 = cc.Sequence:create(
        -- cc.EaseExponentialOut:create(cc.MoveBy:create(runtime1,cc.p(movex1,movey1 ))),
        -- cc.EaseExponentialOut:create(cc.MoveBy:create(runtime2,cc.p(movex2,movey2))),
        -- cc.EaseExponentialOut:create(cc.MoveBy:create(runtime3,cc.p(movex3,movey3)))
        cc.MoveBy:create(runtime1,cc.p(movex1,movey1)),
        cc.MoveBy:create(runtime2,cc.p(movex2,movey2)),
        cc.MoveBy:create(runtime3,cc.p(movex3,movey3))
        -- cc.MoveBy:create(10,cc.p(-self.singleSize.width,0)),
        -- cc.MoveBy:create(20,cc.p(self.singleSize.width*2,0)),
        -- cc.MoveBy:create(runtime3,cc.p(movex3,movey3))
    )
    local act2 = cc.RepeatForever:create(seq2)
    self.map_layer2:runAction(act2)
    --动作层3
    runtime1,runtime2,runtime3 = action_info[4][1].run_time,action_info[4][2].run_time,action_info[4][3].run_time
    -- local runty1,runty2,runty3 = action_info[4][1].run_time_y,action_info[4][2].run_time_y,action_info[4][3].run_time_y

    move_base_x1,move_base_y1 = action_info[4][1].move_base_x,action_info[4][1].move_base_y
    move_base_x2,move_base_y2 = action_info[4][2].move_base_x,action_info[4][2].move_base_y
    move_base_x3,move_base_y3 = action_info[4][3].move_base_x,action_info[4][3].move_base_y

    movex1,movey1 = self.singleSize.width*move_base_x1,self.singleSize.height*move_base_y1
    movex2,movey2 = self.singleSize.width*move_base_x2,self.singleSize.height*move_base_y2
    movex3,movey3 = self.singleSize.width*move_base_x3,self.singleSize.height*move_base_y3
    local seq3 = cc.Sequence:create(
        -- cc.EaseExponentialOut:create(cc.MoveBy:create(runtime1,cc.p(movex1,movey1))),
        -- cc.EaseExponentialOut:create(cc.MoveBy:create(runtime2,cc.p(movex2,movey2))),
        -- cc.EaseExponentialOut:create(cc.MoveBy:create(runtime3,cc.p(movex3,movey3)))
        -- cc.MoveBy:create(15,cc.p(-self.singleSize.width,self.singleSize.height*0.5)),
        -- cc.MoveBy:create(30,cc.p(self.singleSize.width*2,-self.singleSize.height)),
        -- cc.MoveBy:create(15,cc.p(-self.singleSize.width,self.singleSize.height*0.5))
        cc.MoveBy:create(runtime1,cc.p(movex1,movey1)),
        cc.MoveBy:create(runtime2,cc.p(movex2,movey2)),
        cc.MoveBy:create(runtime3,cc.p(movex3,movey3))

    )
    -- local seq4 = cc.Sequence:create(
    --     cc.EaseExponentialOut:create(cc.MoveBy:create(runty1,cc.p(0,movey1))),
    --     cc.EaseExponentialOut:create(cc.MoveBy:create(runty2,cc.p(0,movey2))),
    --     cc.EaseExponentialOut:create(cc.MoveBy:create(runty3,cc.p(0,movey3)))
    --     -- cc.MoveBy:create(15,cc.p(-self.singleSize.width,self.singleSize.height*0.5)),
    --     -- cc.MoveBy:create(30,cc.p(self.singleSize.width*2,-self.singleSize.height)),
    --     -- cc.MoveBy:create(15,cc.p(-self.singleSize.width,self.singleSize.height*0.5))
    -- )

    -- local spaw1 = cc.Spawn:create(cc.EaseExponentialOut:create(cc.MoveBy:create(runtime1,cc.p(movex1,0))),cc.EaseExponentialOut:create(cc.MoveBy:create(runty1,cc.p(0,movey1))))
    -- local spaw2 = cc.Spawn:create(cc.EaseExponentialOut:create(cc.MoveBy:create(runtime2,cc.p(movex2,0))),cc.EaseExponentialOut:create(cc.MoveBy:create(runty2,cc.p(0,movey2))))
    -- local spaw3 = cc.Spawn:create(cc.EaseExponentialOut:create(cc.MoveBy:create(runtime3,cc.p(movex3,0))),cc.EaseExponentialOut:create(cc.MoveBy:create(runty3,cc.p(0,movey3))))

    -- local seq = cc.Sequence:create(spaw1,spaw2,spaw3)--cc.Spawn:create(seq4,seq3)
    local act3 = cc.RepeatForever:create(seq3)
    self.map_layer3:runAction(act3)
end

-- --自动移动背景图
-- function NewPartnerSummonWindow:update()

-- end


function NewPartnerSummonWindow:open_callback()

    local main_container = self.root_wnd:getChildByName("main_container")
    local bottom_y = display.getBottom(main_container)
    local pos_y = 0
    if display.getMaxScale() > 1 then
        pos_y = 20
    end
    main_container:setPositionY(main_container:getPositionY() + bottom_y + pos_y)

    self.main_container = main_container
    -- self.sprite_role = main_container:getChildByName("sprite_role")
    self.touch_layer = main_container:getChildByName("touch_layer")
    
    self.advanced_bg = main_container:getChildByName("Sprite_2") --高级召唤必出
    -- self.advanced_bg:setVisible(false)
    self.btn_rule = main_container:getChildByName("btn_rule")


    self.touch_rect = main_container:getChildByName("touch_rect")
    self.touch_rect:setTouchEnabled(false)
    self.touch_rect:setSwallowTouches(false)
    --self.btn_left = self.touch_rect:getChildByName("btn_left")
    --self.btn_right = self.touch_rect:getChildByName("btn_right")
    self.redpoint = {}
    for i=1,3 do
        local tab = {}
        tab.item = self.touch_rect:getChildByName("item_"..i)
        tab.item:setTouchEnabled(true)
        tab.item:setSwallowTouches(false)
     
        tab.label_name = tab.item:getChildByName("label_name")
        tab.normal = tab.item:getChildByName("normal")
        tab.normal_down = tab.item:getChildByName("normal_down")
        tab.select = tab.item:getChildByName("select")
        tab.select_down = tab.item:getChildByName("select_down")
        tab.select:setVisible(false)

        if not  self.item_list_time[i]  then 
            
            local _layout = ccui.Layout:create()
            local size = cc.size(24,79)
            _layout:setContentSize(size)
            _layout:setPosition(cc.p(41,-9))
            _layout:setAnchorPoint(cc.p(0.5, 1))
            tab.item:addChild(_layout)
            _layout:setVisible(false)

            for j = 1,3 do 
                local title_bg = createScale9Sprite(PathTool.getResFrame("common", "hl_common_0"), 0, j* (20+2), LOADTEXT_TYPE_PLIST, _layout)
                title_bg:setContentSize(cc.size(size.width, 20))

            end 
            self.item_time_bg[i] =_layout
           self.item_list_time[i] = createRichLabel(20,1,cc.p(1,0.5),cc.p(tab.item:getContentSize().width-22,-44))
        end 
        tab.item:addChild(self.item_list_time[i])

        self.redpoint[i] = tab.item:getChildByName("redpoint_"..i)
        if self.redpoint[i] then
            self.redpoint[i]:setLocalZOrder(1)
            self.redpoint[i]:setVisible(false)
        end
        tab.index = i
        self.item_list_res[i] = tab
    end

    local score_bg = main_container:getChildByName("score_bg")
    score_bg:setLocalZOrder(1)
    self.score_label = score_bg:getChildByName("Text_2")
    self.score_label:setString("")

    self.score_btn = score_bg:getChildByName("score_btn")
    
    self.item_pos_y = self.item_list_res[1].item:getPositionY()
    -- self.progress_bg = createSprite(PathTool.getResFrame("newpartnersummon","hl_partnersummon_5"), 76, 78, score_bg, cc.p(0.5, 0.5))
    self.score_progress = cc.ProgressTimer:create(createSprite(PathTool.getResFrame("common2", "hl_common_0059"), 0, 0, nil, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST))
    self.score_progress:setPosition(69.38,45.42)
    self.score_progress:setType(cc.PROGRESS_TIMER_TYPE_RADIAL)
    score_bg:addChild(self.score_progress)
    self.score_progress:setPercentage(0)

    local item_bg = main_container:getChildByName("item_bg")

    --推荐阵容
    self.btn_lineup = main_container:getChildByName("btn_lineup")
    self.btn_lineup:getChildByName("Text_3"):setString(TI18N("推荐阵容"))
    self.btn_lineup:setVisible(false)
    --幻灵一次
    self.btn_summon_1 = main_container:getChildByName("btn_summon_1")
    self.btn_summon_1:setScale(0.95)
    self.btn_summon_1:setPositionY(self.btn_summon_1:getPositionY()+8)
    self.summon_1_diammand = createRichLabel(22,cc.c4b(0xff,0xff,0xff,0xff),cc.p(0.5,0.5),cc.p(self.btn_summon_1:getContentSize().width*0.5-10,-14),nil,nil,nil,TITLE_FONT)
    self.btn_summon_1:addChild(self.summon_1_diammand)
    --幻灵10次
    self.btn_summon_10 = main_container:getChildByName("btn_summon_10")
    self.btn_summon_10:setScale(0.95)
    self.btn_summon_10:setPositionY(self.btn_summon_10:getPositionY()+8)
    self.summon_10_diammand = createRichLabel(22,cc.c4b(0xff,0xff,0xff,0xff),cc.p(0.5,0.5),cc.p(self.btn_summon_10:getContentSize().width*0.5,-16),nil,nil,nil,TITLE_FONT)
    self.btn_summon_10:addChild(self.summon_10_diammand)

    self.label_tips = self.advanced_bg:getChildByName("label_tips")
    self.label_tips:setVisible(false)
    self.lable_tips_rich = createRichLabel(24,cc.c4b(255,255,255,255),cc.p(1,0.5),cc.p(self.label_tips:getPositionX()+270,self.label_tips:getPositionY()),nil,nil,400,TITLE_FONT)
    self.advanced_bg:addChild(self.lable_tips_rich)
    self.btn_close = self.main_container:getChildByName("btn_close")

  
    for i=1,3 do
        self:itemData(i,recruit_list[i])
    end
    self.first_come = true
    -- 引导需要
    local dun_id = self:getDramaDunMaxID()
    if dun_id <= 1 then
        self.cur_index = 1
        self.btn_summon_1:setName("guildsign_summon_1_1")
    else
        self.btn_summon_1:setName("guildsign_summon_3_1")
    end
    self:tabChangeIndex(self.cur_index)

    -- 适配
    local top_y = display.getTop(self.main_container)
    local main_container_size = main_container:getContentSize()
    local tab_y = self.btn_lineup:getPositionY()
    self.btn_lineup:setPositionY(top_y - (main_container_size.height - tab_y))

    

    local tab_y = score_bg:getPositionY() - 25
    score_bg:setPositionY(top_y - (main_container_size.height - tab_y))

    local tab_y = self.btn_rule:getPositionY() - 25
    self.btn_rule:setPositionY(top_y - (main_container_size.height - tab_y))

end

function NewPartnerSummonWindow:getDramaDunMaxID()
    local dun_id = 1
    local drame_controller = BattleDramaController:getInstance()
    local drama_data = drame_controller:getModel():getDramaData()
    if drama_data and drama_data.max_dun_id then
        local current_dun = Config.DungeonData.data_drama_dungeon_info(drama_data.max_dun_id)
        if current_dun then
            dun_id = current_dun.floor or 1
        end
    end
    return dun_id
end

function NewPartnerSummonWindow:register_event()
    registerButtonEventListener(self.btn_rule,function()
            MainuiController:getInstance():openCommonExplainView(true, Config.RecruitData.data_explain,TI18N("规则说明"),true)
        end)
    -- 积分更新
    if self.role_vo ~= nil then
        if self.role_assets_event == nil then
            self.role_assets_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value)
                    if key == "recruit_hero" then
                        local cur_score = value
                        local max_score = PartnersummonController:getInstance():getModel():getScoreSummonNeedCount()
                        local percent = (cur_score/max_score)*100
                        self.score_progress:setPercentage(percent)
                        self.score_label:setString(string.format("%d/%d", cur_score, max_score))
                        self:showScoreFullAction(cur_score>=max_score)
                    elseif key == "friend_point" then
                        if self.touch_index and base_info then
                            local group_id = recruit_list[self.touch_index]
                            local item_id = base_info[group_id].item_once[1][1]
                            local res = PathTool.getItemRes(Config.ItemData.data_get_data(item_id).icon)
                            local str = string.format("<img src=%s visible=true scale=0.40 /><div fontcolor=#efd4ae>  %s</div>",res, value)
                            self.summon_assets:setString(str)
                        end
                    end
                end)
        end
    end

    registerButtonEventListener(self.btn_close,function()
            playQuitSound()
            self:close()
        end)

    registerButtonEventListener(self.score_btn,function()
            PartnersummonController:getInstance():openPartnerSummonScoreWindow(true)
        end)

    registerButtonEventListener(self.btn_summon_1,function()
            self:ChooseSummonType(1)
        end,true)
    registerButtonEventListener(self.btn_summon_10,function()
            self:ChooseSummonType(10)
        end,true)

    for k, object in pairs(self.item_list_res) do
        if object.item then
            registerButtonEventListener(object.item,function()
                    self.cur_index = object.index
                    self:tabChangeIndex(object.index)
                end)
        end
    end

    registerButtonEventListener(self.btn_lineup,function()
            JumpController:getInstance():jumpViewByEvtData({16, 3})
        end,true)

    self:addGlobalEvent(PartnersummonEvent.updateSummonItemEvent, function(data)
            if data then
                local check_index = nil
                for i=1, #recruit_list do
                    if data.group_id == recruit_list[i] then
                        check_index = i
                        break
                    end
                end
                if check_index == nil then
                    return
                end

                self:itemData(check_index, data.group_id)
            end
        end)
    self:addGlobalEvent(PartnersummonEvent.updateSummonFiveStarEvent,function()
            self:heightSummonFiveStar()
        end)

    -- 道具数量更新
    self:addGlobalEvent(BackpackEvent.ADD_GOODS,function(bag_code, data_list)
            self:refreshExchangeItemNum(bag_code,data_list)
        end)
    self:addGlobalEvent(BackpackEvent.DELETE_GOODS,function(bag_code, data_list)
            self:refreshExchangeItemNum(bag_code,data_list)
        end)
    self:addGlobalEvent(BackpackEvent.MODIFY_GOODS_NUM,function(bag_code, data_list)
            self:refreshExchangeItemNum(bag_code,data_list)
        end)
end

-- 刷新道具显示
function NewPartnerSummonWindow:refreshExchangeItemNum(bag_code,data_list)
    if bag_code == BackPackConst.Bag_Code.BACKPACK and self.touch_index then
        local group_id = recruit_list[self.touch_index]
        local item_id = base_info[group_id].item_once[1][1]
        local item_config = Config.ItemData.data_get_data(item_id)
        local res = PathTool.getItemRes(item_config.icon)
        for i,v in pairs(data_list) do 
            if v and v.base_id and item_id == v.base_id then 
                local count = BackpackController:getInstance():getModel():getBackPackItemNumByBid(item_id)
                -- local str = string.format("<div fontcolor=#ffffff outline=2,#000000>%s </div><img src=%s visible=true scale=0.40 /><div fontcolor=#ffffff outline=2,#000000> %s</div>",TI18N("拥有物品"),res, count)
                local str = string.format("<img src=%s visible=true scale=0.40 /><div fontcolor=#efd4ae>  %s</div>",res, count)
                self.summon_assets:setString(str)
            end
        end
        self:setOnceStatus(group_id)
        self:setTenStatus(group_id)
    end
end

function NewPartnerSummonWindow:openRootWnd()
    self:refreshProgressInfo(  )
    self:heightSummonFiveStar()
    self:createLayer()
    self:registerEvent()
end
-- 刷新进度条相关信息
function NewPartnerSummonWindow:refreshProgressInfo(  )
    if self.role_vo then
        local cur_score = self.role_vo.recruit_hero
        local max_score = PartnersummonController:getInstance():getModel():getScoreSummonNeedCount()
        local percent = (cur_score/max_score)*100
        self.score_progress:setPercentage(percent)
        self.score_label:setString(string.format("%d/%d", cur_score, max_score))
        self:showScoreFullAction(cur_score>=max_score)
    end
end
function NewPartnerSummonWindow:showScoreFullAction(status)
    -- if self.cur_box_status == status then return end
    -- self.cur_box_status = status
    -- local action = PlayerAction.action_1
    -- if status then
    --     action = PlayerAction.action_2
    -- end
    -- if self.box_effect then
    --     self.box_effect:clearTracks()
    --     self.box_effect:removeFromParent()
    --     self.box_effect = nil
    -- end
    -- self.box_effect = createEffectSpine(PathTool.getEffectRes(110), cc.p(self.progress_bg:getContentSize().width*0.5, 10), cc.p(0.5, 0), true, action)
    -- self.progress_bg:addChild(self.box_effect)
end

function NewPartnerSummonWindow:moveDrawScene(x)
    x = self.touch_layer:getPositionX() + x
    local _x = self:scaleCheckPoint(x)
    self:updateDrawScene(_x)
end
function NewPartnerSummonWindow:scaleCheckPoint( _x )
    if _x > self.difference_width then
        _x = self.difference_width
    elseif _x < SCREEN_WIDTH - self.size.width - self.difference_width then
        _x = SCREEN_WIDTH - self.size.width - self.difference_width
    end
    return _x
end
--==============================--
--desc:刷新地图位置
--@x:
--@y:
--@return 
--==============================--
function NewPartnerSummonWindow:updateDrawScene(x, y)
    y = y or self.init_y
    for i=1, self.layer_num do
        if self["map_layer"..i] then
            self["map_layer"..i]:setPosition((x-self.init_x) * self.speed_list[i], y-self.init_y)
        end
    end
    self.touch_layer:setPosition( x, y )
end

function NewPartnerSummonWindow:registerEvent()
    self:readyRunAction()
    -- self:setScheduleUpdate(true)
    -- local function onTouchBegin(touch, event)
    --     if GuideController:getInstance():isInGuide() == true then
    --         return false
    --     end

    --     -- 如果使用提审资源的话
    --     if USESCENEMAKELIFEBETTER == true then
    --         return false
    --     end

    --     -- 只在范围以内曹做移动
    --     if self.screenSize == nil then
    --         local pos = self.main_container:convertToWorldSpace(cc.p(0, 0))
    --         self.screenSize = cc.rect(pos.x, pos.y + 100, SCREEN_WIDTH, SCREEN_HEIGHT - 100)
    --     end
    --     local pos = cc.p(touch:getLocation().x, touch:getLocation().y)
    --     if not cc.rectContainsPoint(self.screenSize, pos) then
    --         return false
    --     end

    --     self.last_point = nil
    --     for i = 1, self.layer_num do
    --         doStopAllActions(self["map_layer" .. i])
    --     end
    --     self.is_moving_scene = false
    --     doStopAllActions(self.touch_layer)
    --     return true
    -- end
    -- local function onTouchMoved(touch, event)
    --     self.last_point = touch:getDelta()
    --     self:moveDrawScene(self.last_point.x)
    -- end
    -- local function onTouchEnded(touch, event)

    --     if self.last_point == nil then return end
    --     local interval_x = self.last_point.x * 3

    --     local temp_x = self.touch_layer:getPositionX() + interval_x

    --     -- 修正之后的目标位置
    --     local target_x = self:scaleCheckPoint(temp_x)

    --     for i = 1, self.layer_num do
    --         if self["map_layer" .. i] then
    --             local move_to = cc.MoveTo:create(1, cc.p((target_x - self.init_x) * self.speed_list[i], 0))
    --             self["map_layer" .. i]:runAction(cc.EaseBackOut:create(move_to))
    --         end
    --     end

    --     local root_move_to = cc.MoveTo:create(1, cc.p(target_x, self.init_y))
    --     local ease_out = cc.EaseBackOut:create(root_move_to)
    --     self.touch_layer:runAction(cc.Sequence:create(ease_out))
    -- end
    -- local listener = cc.EventListenerTouchOneByOne:create()
	-- listener:registerScriptHandler(onTouchBegin, cc.Handler.EVENT_TOUCH_BEGAN)
	-- listener:registerScriptHandler(onTouchMoved, cc.Handler.EVENT_TOUCH_MOVED)
	-- listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
	-- self.touch_layer:getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self.touch_layer)
end


function NewPartnerSummonWindow:tabChangeIndex(index)
    if self.touch_index == index then return end
    self.touch_index = index

    if self.select_tab  ~= nil then
        self.select_tab.select:setVisible(false)
        self.select_tab.select_down:setVisible(false)
        self.select_tab.normal:setVisible(true)
        self.select_tab.normal_down:setVisible(true)
        self.select_tab.label_name:setColor(cc.c3b(239,212,174))
    end
    self.select_tab = self.item_list_res[self.touch_index]
    if self.select_tab then
        self.select_tab.select:setVisible(true)
        self.select_tab.select_down:setVisible(true)
        self.select_tab.normal:setVisible(false)
        self.select_tab.normal_down:setVisible(false)
        self.select_tab.label_name:setColor(cc.c3b(255,218,101))
    end

    local _tab  = self.item_list_res[3]
    _tab.normal_down:setVisible(false)
    _tab.select_down:setVisible(false)


    
    self:heightSummonFiveStar()
    local num = PartnersummonController:getInstance():getModel():getFiveStarHeroIsOut()
    if num ~= 0 and index == 2 then
        self.advanced_bg:setVisible(true)
    else
        self.advanced_bg:setVisible(false)
    end
    print("=========five_star_hero==数量==如果为0那么久不显示 x次提示====",num)
    -- self.background:setScale(display.getMaxScale())
  
    local group_id = recruit_list[index]
    --拥有的劵数
    --10
    self:setTenStatus(group_id)

    if not self.summon_assets then
        self.summon_assets = createRichLabel(22,1,cc.p(0,0.5),cc.p(596,540))
        self.main_container:addChild(self.summon_assets)
    end
    if self.summon_assets then
        local item_id_10 = base_info[group_id].item_five[1][1]
        local coupon_num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(base_info[group_id].item_five[1][1])
        if index == NewPartnersummonConst.Partnersummon_Type.Friend then
            coupon_num = self.role_vo.friend_point
        end
        local item_config_1 = Config.ItemData.data_get_data(base_info[group_id].item_once[1][1])
        local res_1 = PathTool.getItemRes(item_config_1.icon)
        local str = string.format("<img src=%s visible=true scale=0.40 /><div fontcolor=#efd4ae>  %s</div>",res_1, coupon_num)
        self.summon_assets:setString(str)
    end

    if self.first_come then
        self:itemData(index,group_id)
    end
end

local function convertTime(less_time)
    less_time = tonumber(less_time) or 0
    local hour = math.floor(less_time / 3600)
    local min = math.floor((less_time % 3600) / 60)
    local sec = less_time % 3600 % 60
    hour = (hour < 10) and "0"..hour or hour
    min = (min < 10) and "0"..min or min
    sec = (sec < 10) and "0"..sec or sec
    return hour .. "\n".."时".. "\n" .. min

end
--免費時間  TimeTool.GetTimeFormatVertical
function NewPartnerSummonWindow:itemData(index,group_id)
    local item_data = model:getSummonItemData(group_id)
    if item_data then
        if self.redpoint[index] then
            self.redpoint[index]:setVisible(item_data.free_num == 1)
        end
        self.left_time = item_data.time_num - GameNet:getInstance():getTime()
        if item_data.free_num == 0 then --代表召唤过的
            if group_id ~= 200 then
                if self.left_time > 0 then
                    if not self.summon_timer[index] then
                        self.summon_timer[index] = GlobalTimeTicket:getInstance():add(function()
                                if item_data.time_num and (item_data.time_num - GameNet:getInstance():getTime()) > 0 then
                                    self.left_time = item_data.time_num - GameNet:getInstance():getTime()
                                    self.item_time_bg[index]:setVisible(false)
                                    self.item_list_time[index]:setString(string.format(TI18N("<div  fontColor=#62352b >%s</div>"), convertTime(self.left_time)))
                                else
                                    self.item_list_time[index]:setString(string.format("<div fontColor=#62352B>%s</div>", TI18N("免费抽取")))
                                    local str = string.format("<div fontcolor=#62352B> %s</div>",TI18N("免费召唤"))
                                    self.summon_1_diammand:setString(str)
                                    GlobalTimeTicket:getInstance():remove(self.summon_timer[index])
                                    self.summon_timer[index] = nil
                                end
                            end, 1)
                    end
                else
                    self.item_list_time[index]:setString(string.format("<div fontColor=#62352B>%s</div>", TI18N("免\n费")))
                    local str = string.format("<div fontcolor=#62352B> %s</div>",TI18N("免费召唤"))
                    self.summon_1_diammand:setString(str)
                    if self.summon_timer[index] ~= nil then
                        GlobalTimeTicket:getInstance():remove(self.summon_timer[index])
                        self.summon_timer[index] = nil
                    end
                end
            end
            self:setOnceStatus(group_id)
        else
            self.item_list_time[index]:setString(string.format("<div fontColor=#62352B>%s</div>", TI18N("免\n费")))
            local str = string.format("<div fontcolor=#62352B> %s</div>",TI18N("免费召唤"))
            self.summon_1_diammand:setString(str)
        end     
    end
end
--设置单抽按钮的状态
function NewPartnerSummonWindow:setOnceStatus(group_id)
    self.is_use_once_ext = false
    if group_id == 400 then return end
    local consume_item_ext
    if base_info[group_id].ext_item_once and base_info[group_id].ext_item_once[1] then
        consume_item_ext = base_info[group_id].ext_item_once[1]
    end
    local consume_item_ext_num = (consume_item_ext and consume_item_ext[1] and BackpackController:getInstance():getModel():getBackPackItemNumByBid(consume_item_ext[1])) or 0 --单抽拥有特殊道具数量
    self.use_once_item = base_info[group_id].item_once[1]
    if consume_item_ext and consume_item_ext[2] and consume_item_ext_num >= consume_item_ext[2] then
        self.use_once_item = consume_item_ext
        self.is_use_once_ext = true
    end
    local item_config_1 = Config.ItemData.data_get_data(self.use_once_item[1])
    local res_1 = PathTool.getItemRes(item_config_1.icon)
    local consume_1 = self.use_once_item[2]
    local coupon_num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(self.use_once_item[1])
    if coupon_num < consume_1 then
        local once_data = base_info[group_id].exchange_once[1]
        if once_data then
            item_config_1 = Config.ItemData.data_get_data(once_data[1])
            res_1 = PathTool.getItemRes(item_config_1.icon)
            consume_1 = once_data[2]
        end
    end
    local str = string.format("<div fontcolor=#62352B>%s </div><img src=%s visible=true scale=0.25 /><div fontcolor=#BD5110> x%s</div>",item_config_1.name,res_1, consume_1)
    self.summon_1_diammand:setString(str)
end
--设置10连抽的按钮状态
function NewPartnerSummonWindow:setTenStatus(group_id)
    self.is_use_five_ext = false
    if group_id == 400 then return end
    local consume_item_ext
    if base_info[group_id].ext_item_five and base_info[group_id].ext_item_five[1] then
        consume_item_ext = base_info[group_id].ext_item_five[1]
    end
    local consume_item_ext_num = (consume_item_ext and consume_item_ext[1] and BackpackController:getInstance():getModel():getBackPackItemNumByBid(consume_item_ext[1])) or 0 --单抽拥有特殊道具数量
    self.use_five_item = base_info[group_id].item_five[1]
    if consume_item_ext and consume_item_ext[2] and consume_item_ext_num >= consume_item_ext[2] then
        self.use_five_item = consume_item_ext
        self.is_use_five_ext = true
    end

    local item_id_10 = self.use_five_item[1]
    local consume_10 = self.use_five_item[2]
    local coupon_num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(item_id_10)
    local item_config_10 = Config.ItemData.data_get_data(item_id_10)
    local res_10 = PathTool.getItemRes(item_config_10.icon)
    if coupon_num < consume_10 then
        local ten_data = base_info[group_id].exchange_five[1]
        if ten_data then
            item_config_10 = Config.ItemData.data_get_data(ten_data[1])
            res_10 = PathTool.getItemRes(item_config_10.icon)
            consume_10 = ten_data[2]
        end
    end
    local str = string.format("<div fontcolor=#62352B>%s </div><img src=%s visible=true scale=0.25 /><div fontcolor=#BD5110> x%s</div>",item_config_10.name,res_10, consume_10)
    self.summon_10_diammand:setString(str)
end
--召唤的模式
function NewPartnerSummonWindow:ChooseSummonType(_type)
    self.is_use_ext = false
    if self.touch_summon then return end
    if self.touch_summon_ticket == nil then
        self.touch_summon_ticket = GlobalTimeTicket:getInstance():add(function()
                self.touch_summon = nil
                if self.touch_summon_ticket ~= nil then
                    GlobalTimeTicket:getInstance():remove(self.touch_summon_ticket)
                    self.touch_summon_ticket = nil
                end
            end,2)
    end
    self.touch_summon = true
    local max, count = HeroController:getInstance():getModel():getHeroMaxCount()
    if count >= max then
        local str = TI18N("英雄列表已满，可通过提升VIP等级或购买增加英雄携带数量，是否前往购买？")
        local call_back = function()
            MainuiController:getInstance():changeMainUIStatus(MainuiConst.btn_index.partner)
            controller:openNewPartnerSummonWindow(false)
        end
        CommonAlert.show(str, TI18N("前往"), call_back, TI18N("取消"), nil, CommonAlert.type.common)
        return
    end

    local data = base_info[recruit_list[self.touch_index]]
    if data then
        local summon_type = 4 --默认是道具
        if self.touch_index == NewPartnersummonConst.Partnersummon_Type.Normal then --普通召唤的时候
            local item_data = model:getSummonItemData(data.group_id)
            if item_data and item_data.free_num == 1 and _type == 1 then
                summon_type = 1
            end
        elseif self.touch_index == NewPartnersummonConst.Partnersummon_Type.Advanced then --高级召唤的时候
            local item_data = model:getSummonItemData(data.group_id)
            if item_data and item_data.free_num == 1 and _type == 1 then
                summon_type = 1
            else
                -- local item_id = base_info[data.group_id].item_five[1][1]
                -- local consume = base_info[data.group_id].item_five[1][2] --消耗
                local item_id = self.use_five_item[1]
                local consume = self.use_five_item[2] --消耗
                self.is_use_ext = false
                if self.is_use_five_ext then
                    self.is_use_ext = true
                end
                if _type == 1 then
                    -- item_id = base_info[data.group_id].item_once[1][1]
                    -- consume = base_info[data.group_id].item_once[1][2] --消耗
                    item_id = self.use_once_item[1]
                    consume = self.use_once_item[2] --消耗
                    self.is_use_ext = false
                    if self.is_use_once_ext then
                        self.is_use_ext = true
                    end
                end
                local coupon_num = BackpackController:getInstance():getModel():getBackPackItemNumByBid(item_id) --背包
                if coupon_num < consume then
                    local have_sum = self.role_vo.gold + self.role_vo.red_gold
                    local ten_data = base_info[data.group_id].exchange_once[1][2]
                    local call_num = base_info[data.group_id].draw_list[1] or 1
                    local val_num = base_info[data.group_id].exchange_once_gain[1][2]

                    local val_str = Config.ItemData.data_get_data(base_info[data.group_id].exchange_five_gain[1][1]).name or ""                    
                    if _type == 10 then
                        ten_data = base_info[data.group_id].exchange_five[1][2]
                        call_num = base_info[data.group_id].draw_list[2] or 10
                        val_num = base_info[data.group_id].exchange_five_gain[1][2]
                    end
                    local function call_back()
                        controller:send23201(data.group_id, _type, 3)    
                    end
                    local str = string.format("%s<img src=%s visible=true scale=0.3 /><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#764519>(%s:</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#764519>)\n</div>",TI18N("是否使用"),PathTool.getItemRes(3),ten_data,TI18N("拥有"),have_sum)
                    local str_ = str..string.format("<div fontColor=#764519>%s</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#764519></div><div fontColor=#d95014 fontsize= 26>%s</div><div fontColor=#764519>(%s</div><div fontColor=#289b14 fontsize= 26>%s</div><div fontColor=#764519>%s)</div>",TI18N("购买"),val_num,val_str,TI18N("同时附赠"),call_num,TI18N("次幻灵"))
                    CommonAlert.show(str_, TI18N("确定"), call_back, TI18N("取消"), nil, CommonAlert.type.rich)
                    return
                end
            end
        elseif self.touch_index == NewPartnersummonConst.Partnersummon_Type.Friend then --友情召唤的时候
            summon_type = 4
        end
        -- print("data.group_id, _type,... ",self.touch_index,data.group_id, _type, summon_type)
        if self.is_use_ext then
            controller:send23201(data.group_id, _type, 5)
        else
            controller:send23201(data.group_id, _type, summon_type)
        end
    end
end

local enum = {
    "一",
    "二",
    "三", 
    "四", 
    "五", 
    "六" ,
    "七", 
    "八",
    "九",
    "十"
}
--10次以内召唤得5星英雄
function NewPartnerSummonWindow:heightSummonFiveStar()
    if self.touch_index ~= 2 then return end
    local num = PartnersummonController:getInstance():getModel():getFiveStarHeroIsOut()
    if num == 0 then
        if self.five_star then
            self.five_star:setVisible(false)
        end
        -- if not self.special_label then
        --     self.special_label = createRichLabel(22, cc.c4b(0xff,0xff,0xff,0xff), cc.p(0.5, 0.5), cc.p(360, 600),nil,nil,600)
        --     self.main_container:addChild(self.special_label)
        -- end
        self.advanced_bg:setVisible(false)
        -- self.special_label:setString(TI18N("<div fontcolor=#ffffff fontsize=22 outline=2,#8f1c00>随机召唤1个或10个3~5星英雄</div>"))
        -- self.label_tips:setString('')
        self.lable_tips_rich:setString("")
    else
        self.advanced_bg:setVisible(true)
        self.lable_tips_rich:setString(string.format("<div fontcolor=#efd4ae >%s</div>",enum[num]..TI18N('次幻灵内必得五星武灵')))
        -- self.label_tips:setString(''..num..TI18N('次幻灵内必得五星武灵'))
    end
end

function NewPartnerSummonWindow:close_callback()
    -- self:setScheduleUpdate(false)
    CommonAlert.closeAllWin()
    if self.touch_ticket ~= nil then
        GlobalTimeTicket:getInstance():remove(self.touch_ticket)
        self.touch_ticket = nil
    end
    for i,v in pairs(self.summon_timer) do
        if v ~= nil then
            GlobalTimeTicket:getInstance():remove(v)
            v = nil
        end
    end
    -- for i,v in pairs(self.sprite_role_load) do
    --     if v then
    --         v:DeleteMe()
    --         v = nil
    --     end
    -- end
    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
    end
    if self.box_effect then
        self.box_effect:clearTracks()
        self.box_effect:removeFromParent()
        self.box_effect = nil
    end
    if self.touch_summon_ticket ~= nil then
        GlobalTimeTicket:getInstance():remove(self.touch_summon_ticket)
        self.touch_summon_ticket = nil
    end

    doStopAllActions(self.item_list_res[1].item)
    doStopAllActions(self.item_list_res[2].item)
    doStopAllActions(self.item_list_res[3].item)
    doStopAllActions(self.map_layer1)
    doStopAllActions(self.map_layer2)
    doStopAllActions(self.map_layer3)

    controller:openNewPartnerSummonWindow(false)
end
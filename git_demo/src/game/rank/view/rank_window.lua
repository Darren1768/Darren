-- --------------------------------------------------------------------
-- 竖版排行榜排行界面
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
RankWindow = RankWindow or BaseClass(BaseView)
local table_sort = table.sort
local elite_controller = ElitematchController:getInstance()
local elite_level_data = Config.ArenaEliteData.data_elite_level
function RankWindow:__init(index, is_cluster)
    self.is_cluster = is_cluster or false
    self.ctrl = RankController:getInstance()
    self.win_type = WinType.Full  
    --self.view_tag = ViewMgrTag.DIALOGUE_TAG   
    self.layout_name = "rank/rank_window"
    self.cur_type = 0
    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("rank","rank"), type = ResourcesType.plist },
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_guild", false), type = ResourcesType.single },
    }
    self.tab_info_list = {
    }
    self.first_list = {}
    self.click_index = index or 1
end

function RankWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    if self.background ~= nil then
        self.background:setScale(display.getMaxScale())
    end
    self.main_panel = self.root_wnd:getChildByName("main_container")
    self.container_size = self.main_panel:getContentSize()

    self:playEnterAnimatianByObj(self.main_panel , 1)
    self.close_btn = self.root_wnd:getChildByName("close_btn")

    self.rank_panel = self.main_panel:getChildByName("rank_panel")
    self.my_rank = self.main_panel:getChildByName("my_rank")


    self.rank_index = self.my_rank:getChildByName("rank_id")
    self.four_label = createRichLabel(20, cc.c3b(239,212,174),cc.p(0,0.5), cc.p(410,66), 0, 0, 500)
    self.my_rank:addChild(self.four_label)


    self.my_rank_power = createLabel(24,cc.c3b(0xb2,0x77,0x42),nil,528,35,"",self.my_rank,0, cc.p(0.5,0.5))
    self.power_bg =	createSprite(PathTool.getResFrame("common2", "hl_common_3079"), 580, 56,self.my_rank, cc.p(0.5,0.5))
    local power_11 =  createSprite(PathTool.getResFrame("common", "hl_common_28"), 20, 18, self.power_bg, cc.p(0.5,0.5))
    power_11:setScale(0.8)
    self.my_rank_power_num = CommonNum.new(220, self.power_bg, num, -1, cc.p(0, 0))
    self.my_rank_power_num:setPosition(32, 18)
    self.my_rank_power_num:setScale(0.8)
    self.power_bg:setVisible(false)

    self.my_head = PlayerHead.new(PlayerHead.type.circle)
    self.my_head:setHeadLayerScale(0.8)
    self.my_head:setPosition(210, 56)
    self.my_rank:addChild(self.my_head)

    self.no_rank = createLabel(22,cc.c3b(239,212,174),nil,58,76,TI18N("未上榜"),self.my_rank,0, cc.p(0.5,0.5))
    self.my_name = createLabel(22,cc.c3b(239,212,174),nil,285,66,"",self.my_rank,0, cc.p(0,0.5))

    self.five_label = createLabel(22,cc.c3b(239,212,174),nil,385,66,"",self.my_rank,0, cc.p(0,0.5))
    self.six_label = createLabel(20,cc.c3b(239,212,174),nil,70,78,"",self.my_rank,0, cc.p(0,0.5))

    self.five_label:setVisible(false)
    self.six_label:setVisible(false)

    if self.click_index == RankConstant.RankType.elite then
        self.rank_index:setVisible(false)
        self.my_head:setVisible(false)
        self.my_name:setVisible(false)
        self.elite_lev = createSprite("", 220, 60, self.my_rank,cc.p(0.5,0.5),LOADTEXT_TYPE)
        self.elite_lev:setVisible(false)
        local bg_res = PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon","elitemmatch_little_icon_01", false)
        if not self.elite_load then
            self.elite_load = loadSpriteTextureFromCDN(self.elite_lev, bg_res, ResourcesType.single, self.elite_load) 
        end

        self.rank_score = createLabel(24,Config.ColorData.data_color4[175],nil,333,60,"",self.my_rank,0, cc.p(0.5,0.5))
        self.rank_score:setString("0")
        local btn = createTypeButton(self.my_rank, TI18N('查看结算奖励'), 509, 60, ButtonType.red)
        btn:addTouchEventListener(function(sender, event_type)
                if event_type == ccui.TouchEventType.ended then
                    playCommonButtonSound()
                    local lev = ElitematchController:getInstance():getModel():getEliteLev()
                    local rank = ElitematchController:getInstance():getModel():getEliteRank()
                    ElitematchController:getInstance():openElitematchRewardPanel(true, 3, lev, rank)
                end
            end)
    end

    self.title_con = self.main_panel:getChildByName("title_con")
    local title = self.title_con:getChildByName("title_label")
    local title_sprite = self.title_con:getChildByName("title_sprite")
    if self.click_index == RankConstant.RankType.elite then
        local name = string.format(TI18N("S%d赛季"),elite_controller:getModel():getElitePeriod())
        title:setString(name)
    elseif self.click_index == RankConstant.RankType.union then
        loadSpriteTexture(title_sprite, PathTool.getResFrame("rank", "hl_rank_0003"), LOADTEXT_TYPE_PLIST)
        title:setVisible(false)
        title_sprite:setVisible(true)
    elseif self.click_index == RankConstant.RankType.union_union then
        loadSpriteTexture(title_sprite, PathTool.getResFrame("rank", "hl_rank_0008"), LOADTEXT_TYPE_PLIST)
        title:setVisible(false)
        title_sprite:setVisible(true)
    else
        local name =RankConstant.TitleName[self.click_index] or ""
        title:setString(name)
    end

    self:updateTitle()

    --
    local top_y = display.getTop(self.main_panel)
    local bottom_y = display.getBottom(self.main_panel)
    local left_x = display.getLeft(self.main_panel)
    local right_x = display.getRight(self.main_panel)
    local close_btn_y = self.close_btn:getPositionY()

    local tab_y = self.main_panel:getPositionY()
    self.main_panel:setPositionY(top_y - (self.container_size.height - tab_y))


    self.close_btn:setPositionY(bottom_y+close_btn_y)
end

function RankWindow:register_event()
    self.background:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                playQuitSound()
                self.ctrl:openRankView(false)
            end
        end)
    self.close_btn:addTouchEventListener(function(sender, event_type) 
            if event_type == ccui.TouchEventType.ended then
                playQuitSound()
                self.ctrl:openRankView(false)
            end
        end)
    if not self.update_data_event then 
        self.update_data_event =EventManager:getInstance():Bind(RankEvent.RankEvent_Get_Rank_data,self,function(data)
                self:updateRankList(data)
            end)
    end
    EventManager:getInstance():Bind(ArenaEvent.UpdateLoopChallengeRank,self, function (data)
            self:updateRankList(data)
        end)
    EventManager:getInstance():Bind(RankEvent.RankEvent_Get_Time_event,self,function(data)
            if not data or not self.click_index then return end
            local index = self.click_index or RankConstant.RankType.drama
            if data.type and index ~= data.type then
                return 
            end
            local info = SysEnv:getInstance():loadRankFile(index, self.is_cluster)
            if not info or next(info) == nil then 
                self:senProto(index)
            else
                if data.time and info.data and data.type and (data.time ==0 or data.time ==info.timestamp ) and index == data.type then
                    self:updateRankList(info.data)
                else 
                    self:senProto(index)
                end
            end
        end)

end

function RankWindow:openRootWnd()
    if self.click_index == RankConstant.RankType.fans then --粉丝排行榜
        local role_model = RoleController:getInstance():getModel()
        if role_model and role_model.fans_rank_data then
            self:updateRankList(role_model.fans_rank_data)
        end
    else
        self.ctrl:send_12901(self.click_index, self.is_cluster)
    end
end

function RankWindow:setPanelData()
end
--更新标题
function RankWindow:updateTitle()
    local title_list = RankConstant.RankTitle[self.click_index] or {}
    local num = #title_list or 0
    local pos_list= RankConstant.TitlePos[self.click_index] or {}
    local line_pos_list = RankConstant.TitleLinePos[self.click_index] or {}
    local title_bg =  self.rank_panel:getChildByName('title_bg')
    for i = 1,num do  
        local offx = pos_list[i] or 0
        local label = createLabel(23,cc.c3b(98,53,43),nil,offx,18,"",title_bg,0, cc.p(0,0.5))
        local str = title_list[i] or ""
        label:setString(str)
    end
end

function RankWindow:updateRankList(data)
    local bg = self.rank_panel:getChildByName('bg')
    if self.click_index == RankConstant.RankType.elite then return end
    self.data = data
    self:updateMyData()
    self:updateRankData()
    if not self.list_view then
        local scroll_view_size = bg:getContentSize()
        local setting = {
            -- item_class = RankItem,      -- 单元类
            start_x = 0,                  -- 第一个单元的X起点
            space_x = 5,                    -- x方向的间隔
            start_y = 0,                    -- 第一个单元的Y起点
            space_y = 0,                   -- y方向的间隔
            item_width = scroll_view_size.width,               -- 单元的尺寸width
            item_height = 139,              -- 单元的尺寸height
            row = 1,                        -- 行数，作用于水平滚动类型
            col = 1,                         -- 列数，作用于垂直滚动类型
            need_dynamic = true
        }
        self.list_view = CommonScrollViewSingleLayout.new(bg, cc.p(0, 0) , ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting, cc.p(0,0))

        self.list_view:registerScriptHandlerSingle(handler(self,self.createNewCell), ScrollViewFuncType.CreateNewCell) --创建cell
        self.list_view:registerScriptHandlerSingle(handler(self,self.numberOfCells), ScrollViewFuncType.NumberOfCells) --获取数量
        self.list_view:registerScriptHandlerSingle(handler(self,self.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex) --更新cell
        -- self.list_view:registerScriptHandlerSingle(handler(self,self.onCellTouched), ScrollViewFuncType.OnCellTouched) --更新cell
    end
    if not data or next(data) == nil then
        self:senProto(self.click_index)
        return
    end

    self.show_list = data.rank_list or {}
    self.list_view:reloadData()

    if #self.show_list == 0 then
        self:showEmptyIcon(true)
    else
        self:showEmptyIcon(false)
    end
end
--创建cell 
--@width 是setting.item_width
--@height 是setting.item_height
function RankWindow:createNewCell(width, height)
    local cell = RankItem.new(1)
    cell:setExtendData({rank_type = self.click_index, is_cluster = self.is_cluster})
    return cell
end
--获取数据数量
function RankWindow:numberOfCells()
    if not self.show_list then return 0 end
    return #self.show_list
end

--更新cell(拖动的时候.刷新数据时候会执行次方法)
--cell :createNewCell的返回的对象
--index :数据的索引
function RankWindow:updateCellByIndex(cell, index)
    cell.index = index
    local data = self.show_list[index]
    if data then
        print("----------------",index )
        cell:setData(data, index)
    end
end

-- --点击cell .需要在 createNewCell 设置点击事件
-- function RankWindow:onCellTouched(cell)
--     local index = cell.index
--     local data = self.show_list[index]
-- end

--显示空白
function RankWindow:showEmptyIcon(bool)
    if bool == true then 
        commonShowEmptyIcon(self.rank_panel, true, {text = TI18N("当前排行榜暂无数据")})

    else
        commonShowEmptyIcon(self.rank_panel, false)
    end 

    -- if not self.empty_con and bool == false then return end
    -- local main_size = self.main_panel:getContentSize()
    -- if not self.empty_con then 
    --     local size = cc.size(200,200)
    --     self.empty_con = ccui.Widget:create()
    --     self.empty_con:setContentSize(size)
    --     self.empty_con:setAnchorPoint(cc.p(0.5,0))
    --     self.empty_con:setPosition(cc.p(main_size.width/2,330))
    --     self.main_panel:addChild(self.empty_con,10)
    --     local res = PathTool.getSingleImgForDownLoad("bigbg","bigbg_3")
    --     local bg = createImage(self.empty_con, res, size.width/2, size.height/2, cc.p(0.5,0.5), false)
    --     self.empty_label = createLabel(26,Config.ColorData.data_color4[175],nil,size.width/2,-10,"",self.empty_con,0, cc.p(0.5,0))
    -- end
    -- local str = TI18N("当前排行榜暂无数据")
    -- self.empty_label:setString(str)
    -- self.empty_con:setVisible(bool)
end

function RankWindow:senProto(index)
    if index == RankConstant.RankType.union then
        self.ctrl:send_12903(self.is_cluster)
    elseif index == RankConstant.RankType.union_union then 
        self.ctrl:send_12905(self.is_cluster)
    elseif index == RankConstant.RankType.arena then 
        ArenaController:getInstance():requestLoopChalllengeRank()
    elseif index == RankConstant.RankType.action_partner then 
        self.ctrl:send_12904( 0,100 )
    else
        self.ctrl:send_12900(index, nil, nil, self.is_cluster)
    end 
end

--更新自己数据
function RankWindow:updateMyData()
    if not self.data then return end 

    print("----------updateMyData--------------")
    printLuaTable(self.data)

    local data = self.data
    local str = TI18N("0")
    local my_idx = data.my_idx or data.rank or 0
    if my_idx and my_idx >0 then 
        str = my_idx
    end
    self.no_rank:setVisible(false)
    local role_vo = RoleController:getInstance():getRoleVo()
    self.rank_index:setFontName(TITLE_FONT)
    self.rank_index:setFontSize(28)
    self.rank_index:setString(str)
    -- if my_idx and my_idx >= 1 and my_idx <= 3 then
    --     self.rank_index:setVisible(false)
    --     if not self.my_rank_icon then
    --         local x, y = self.rank_index:getPosition()
    --         self.my_rank_icon = createImage(self.my_rank, nil,x,y, cc.p(0.5,0.5), true, 1, false) 
    --     end
    --     self.my_rank_icon:setVisible(true)
    --     self.my_rank_icon:loadTexture(PathTool.getResFrame("rank","hl_rank_14"..(my_idx - 1)),LOADTEXT_TYPE_PLIST)
    -- else
    --     if my_idx <=0 then
    --         self.rank_index:setFontName(DEFAULT_FONT)
    --         self.rank_index:setFontSize(26)
    --         self.rank_index:setString(TI18N("未上榜"))
    --     else    
    --         if self.my_rank_icon then
    --             self.my_rank_icon:setVisible(false)
    --         end
    --     end
    -- end
          
    if my_idx <=0 then
        self.rank_index:setFontName(DEFAULT_FONT)
        self.rank_index:setFontSize(26)
        self.rank_index:setString(TI18N("未上榜"))
    else    
        if self.my_rank_icon then
            self.my_rank_icon:setVisible(false)
        end
    end

    self.my_head:setHeadRes(role_vo.face_id, false, LOADTEXT_TYPE, role_vo.face_file, role_vo.face_update_time)
    local name = role_vo.name or ""
    self.my_name:setString(name)
    local avatar_bid = data.avatar_bid 
    local vo = Config.AvatarData.data_avatar[avatar_bid]
    if vo then
        local res_id = vo.res_id or 1
        local res = PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. res_id, false, false)
        self.my_head:showBg(res, nil, false, vo.offy)
    end

    local str = ""
    self.my_rank_power:setString("")
    self.my_rank_power:setPositionX(528)
    self.four_label:setVisible(true)
    if self.rune_item then 
        self.rune_item:setVisible(false)
    end
    self.four_label:setPosition(cc.p(485,66))
    if self.click_index == RankConstant.RankType.power or self.click_index == RankConstant.RankType.action_power  then 
        -- self.my_rank_power:setString(data.power)
        local res = PathTool.getResFrame("common","hl_common_134")
        local power = data.my_val1 or 0
        str = string.format( "<img src='%s' /> %s",res,power)
    elseif self.click_index == RankConstant.RankType.drama or self.click_index == RankConstant.RankType.action_drama  then 
        local config = Config.DungeonData.data_drama_dungeon_info(data.my_val1)
        if config then 
            str = config.name
        end
    elseif self.click_index == RankConstant.RankType.union then 
        str = string.format(TI18N("<div fontsize=20 fontcolor=#efd4ae>会长：%s</div>"),data.leader_name)
        if role_vo.gid == 0 then 
            str = TI18N("暂无公会")
        end
        self.my_name:setString(role_vo.gname)
        self.my_name:setPosition(cc.p(255,75))


        self.five_label:setVisible(true)
        self.five_label:setPosition(425,56)
        local num1 = #self.data.rank_list or 0
		local num2 = self.data.num  or 0
		self.five_label:setString(num1.."/"..num2)

        self.six_label:setVisible(true)
        self.six_label:setString("我的公会")
       
        self.four_label:setPosition(cc.p(255,40))
        local power = data.power or 0

        self.my_rank_power:setVisible(false)
        self.power_bg:setVisible(true)
        self.my_rank_power_num:setNum(power) 

    elseif self.click_index == RankConstant.RankType.union_union then 
        str = string.format(TI18N("<div fontsize=20 fontcolor=#efd4ae>联盟长：%s</div>"),data.leader_name)
        if role_vo.gid == 0 then 
            str = TI18N("暂无联盟")
        end
        self.my_name:setString(role_vo.lname)
        self.my_name:setPosition(cc.p(255,75))


        self.five_label:setVisible(true)
        self.five_label:setPosition(425,56)
        local num1 = #self.data.rank_list or 0
		local num2 = self.data.num  or 0
		self.five_label:setString(num1.."/"..num2)

        self.six_label:setVisible(true)
        self.six_label:setString("我的联盟")
       
        self.four_label:setPosition(cc.p(255,40))
        local power = data.power or 0

        self.my_rank_power:setVisible(false)
        self.power_bg:setVisible(true)
        self.my_rank_power_num:setNum(power) 

    elseif self.click_index == RankConstant.RankType.tower or self.click_index == RankConstant.RankType.action_tower  then 
        local num = data.my_val2 or 0
        local tim = TimeTool.GetTimeMS(num,true)
        if data.my_val1 and data.my_val1 ==0 then 
            tim = ""
            self.four_label:setVisible(false)
        end
        self.my_rank_power:setString(tim)
        str = SpiritController:getInstance():getStrByLevel(data.my_val1)
        self.four_label:setPosition(cc.p(430,66))
        self.my_rank_power:setPosition(cc.p(540,66))
    elseif self.click_index == RankConstant.RankType.adventure then
        str = data.my_val1 or 0
        local val2_str = (data.my_val2 ~= 0) and data.my_val2 or ""
        self.my_rank_power:setString(val2_str)
        self.four_label:setPosition(cc.p(430,76))
        self.my_rank_power:setPosition(cc.p(540,53))
    elseif self.click_index == RankConstant.RankType.arena or self.click_index == RankConstant.RankType.action_arena then   
        local res = PathTool.getItemRes("8")
        local score = self.data.score or self.data.my_val1 or 0
        str = string.format( "<img src='%s' scale=0.35 /> %s",res,score)
    elseif self.click_index == RankConstant.RankType.action_adventure then   
        local res = PathTool.getResFrame("common","hl_common_134")
        local power = data.my_val1 or 0
        str = power
    elseif self.click_index == RankConstant.RankType.hallows_power or self.click_index == RankConstant.RankType.treasure then   
        local res = PathTool.getResFrame("common","hl_common_134")
        local power = data.my_val1 or 0
        str = power
    elseif self.click_index == RankConstant.RankType.action_partner then          
        local res = PathTool.getResFrame("common","hl_common_134")
        local power = data.power or 0
        str = power
        if power >0 then 
            if not self.hero_item then
                self.hero_item = HeroExhibitionItem.new(0.8,true)
                self.hero_item:setPosition(cc.p(410,66))
                self.my_rank:addChild(self.hero_item)
                self.hero_item:addCallBack(function(item)
                        local vo = item:getData()
                        if vo and next(vo) ~= nil then 
                            local role_vo = RoleController:getInstance():getRoleVo()
                            LookController:sender11061(role_vo.rid,role_vo.srv_id,vo.partner_id)
                        end
                    end)
            end
            local vo = self:createPartnerVo()
            self.hero_item:setData(vo)
        end
        self.four_label:setPosition(cc.p(525,76))
    elseif self.click_index == RankConstant.RankType.action_star or self.click_index == RankConstant.RankType.star_power then   
        local res = PathTool.getResFrame("common","hl_common_134")
        local power = data.my_val1 or 0
        str = power
        self.four_label:setPosition(cc.p(525,76))
    elseif self.click_index == RankConstant.RankType.elite then
        self.elite_lev:setVisible(true)
        self.rank_score:setString(self.data.score or 0)
        local lev = self.data.elite_lev or 1
        local bg_res = PathTool.getPlistImgForDownLoad("elitematch/elitematch_icon",elite_level_data[lev].little_ico, false)
        if self.elite_load then
            loadSpriteTexture(self.elite_lev, bg_res, LOADTEXT_TYPE)
        end
    elseif self.click_index == RankConstant.RankType.ladder then
        local res = PathTool.getResFrame("common","hl_common_134")
        local power = data.my_val1 or 0
        str = string.format( "<img src='%s' /> %s",res,power)
        if self.guild_name == nil then
            self.guild_name = createLabel(24,Config.ColorData.data_color4[175],nil,480,65,"",self.my_rank,0, cc.p(0.5,0.5))
        end

        local guild_str 
        if role_vo.gid == 0 then 
            guild_str = TI18N("暂无公会")
        else
            guild_str = role_vo.gname
        end
        self.guild_name:setString(guild_str)
        self.my_name:setPosition(285, 78)
        self.four_label:setPosition(285, 50)
    elseif self.click_index == RankConstant.RankType.fans then
        str = role_vo.fans_num
    elseif self.click_index == RankConstant.RankType.planes_rank or self.click_index == RankConstant.RankType.sweet then
        str = self.data.my_val1 or 0
        self.my_name:setAnchorPoint(cc.p(0, 0.5))
        self.my_name:setPositionX(208)
        self.four_label:setPosition(445, 76)
    end
    if str == 0 then 
        str = ""
    end
    self.four_label:setString(str)
end
--创建一个英雄数据
function RankWindow:createPartnerVo()
    local vo = HeroVo.New()
    local data = {
        partner_id = self.data.pid,
        bid = self.data.pbid,
        lev = self.data.plev,
        star = self.data.pstar,
    }
    vo:updateHeroVo(data)
    return vo
end
--更新前三名头像
function RankWindow:updateRankData()
    if not self.data then return end
    local rank_list 
    if self.click_index == RankConstant.RankType.elite then
        rank_list = self.data.arena_elite_rank or {}
    else
        rank_list = self.data.rank_list or {}
    end
    local count = 0
    local size = self.main_panel:getContentSize()

    for i = 1, 3 do
        self.first_list[i] = self.first_list[i] or {}

        if self.first_list[i].role_spine then
            self.first_list[i].role_spine:DeleteMe()
            self.first_list[i].role_spine = nil
        end

        local pos_x = size.width/2
        local pos_y = 883
        local off_y = 0
        if i ==2 then 
            pos_x = size.width/2-226
            pos_y = 870
            off_y = 6
        elseif i ==3 then 
            pos_x = size.width/2+234
            pos_y = 870
            off_y = 6
        end
        -- 名称
        if not self.first_list[i].name_txt then
            self.first_list[i].name_txt = self.main_panel:getChildByName('name'..i)
            self.first_list[i].name_txt:setString( StringUtil.branchStr(TI18N("虚位以待"))  )  
            self.first_list[i].name_txt:setLocalZOrder(1)
        end
      
    end

    for i,v in ipairs(rank_list) do
        local idx = v.idx or v.rank 
        if idx > 0 and idx <=3 then 
            count = count+1
            -- 形象id
            local look_id = v.look_id or v.lookid or v.leader_look_id or 110101
            if look_id == 0 then look_id = 110101 end --新增的字段，后端可能发0过来

            -- 模型
            local width = size.width/2
            local height = 1073
            if idx ==2 then 
                width = size.width/2-226
                height = 1060
            elseif idx ==3 then 
                width = size.width/2+234
                height = 1060
            end
            local role_spine = BaseRole.new(BaseRole.type.role, look_id)
            role_spine:setScale(2)
            role_spine:setCascade(true)
            role_spine:setAnchorPoint(cc.p(0.5, 0))
            role_spine:setAnimation(0,"stand",true)
            role_spine:showShadowUI(false)
            self.main_panel:getChildByName('spine'..idx):addChild(role_spine)
            self.first_list[idx].role_spine = role_spine
            -- 名称
            if self.first_list[idx].name_txt then
                self.first_list[idx].name_txt:setString(  StringUtil.branchStr( v.name or v.leader_name or "")  ) 
            end
            -- 点击区域
            if not self.first_list[idx].touch_layer then
                local touch_layer = ccui.Layout:create()
                touch_layer:setAnchorPoint(cc.p(0.5, 0))
                touch_layer:setContentSize(cc.size(160, 260))
                touch_layer:setPosition(width, height-173)
                touch_layer:setTouchEnabled(true)
                self.main_panel:addChild(touch_layer)
                self.first_list[idx].touch_layer = touch_layer
            end
            self.first_list[idx].touch_layer:addTouchEventListener(function(sender, event)
                    if ccui.TouchEventType.ended == event and v then
                        local touchPos = cc.p(sender:getTouchEndPosition().x+320,sender:getTouchEndPosition().y)
                        local rid = v.rid or v.leader_rid or 0
                        local srv_id = v.srv_id or v.leader_srvid or 0
                        self.ctrl:openChatMessage(rid, srv_id, nil,touchPos)
                    end
                end)
        end
        if count >=3 then 
            break
        end
    end
end
function RankWindow:onEnterAnim()
end
function RankWindow:close_callback()
    if self.data and self.data.time and self.data.time ~=0 then
        SysEnv:getInstance():saveRankFile(self.click_index, self.data.time, self.data, self.is_cluster)
    end
    self.ctrl:openRankView(false)
    EventManager:getInstance():UnBind(self)
    for i,v in pairs(self.first_list) do
        if v.role_spine then
            v.role_spine:DeleteMe()
            v.role_spine = nil
        end
    end
    self.first_list = {}
    if self.list_view then 
        self.list_view:DeleteMe()
    end
    self.list_view = nil

    if self.elite_list_view then 
        self.elite_list_view:DeleteMe()
    end
    self.elite_list_view = nil

    if self.item_load then
        self.item_load:DeleteMe()
    end
    if self.hero_item then 
        self.hero_item:DeleteMe()
    end
    self.hero_item = nil
    self.item_load = nil
    if self.elite_load then
        self.elite_load:DeleteMe()
    end
    self.elite_load = nil
end

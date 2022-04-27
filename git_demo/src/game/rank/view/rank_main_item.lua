-- --------------------------------------------------------------------
-- 排行榜主界面子项
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
RankMainItem = class("RankMainItem", function()
    return ccui.Widget:create()
end)

function RankMainItem:ctor()
    self:config()
    self:layoutUI()
    self:registerEvents()
end
function RankMainItem:config()
    self.size = cc.size(597,213)
    self:setTouchEnabled(true)
    self:setContentSize(self.size)
end
function RankMainItem:layoutUI()
    local csbPath = PathTool.getTargetCSB("rank/rank_main_item")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)
    
    self.main_panel = self.root_wnd:getChildByName("main_panel")
    self.label_panel = self.main_panel:getChildByName("label_panel")
    --原画
    self.bg = self.main_panel:getChildByName("bg")

    
    self.name = self.main_panel:getChildByName("name")
    local x,y = self.name:getPosition()

    self.rank_label = createRichLabel(20, cc.c4b(0xff,0xf2,0xd6,0xff), cc.p(0.5,0), cc.p(x,y-40), 0, 0, 400)
    self.main_panel:addChild(self.rank_label)
    
    
end

function RankMainItem:setData(vo)
    if not vo then return end
    self:showActionIcon(false)
    self.data = vo.rank_vo or {}
    self.rank_type = vo.rank_type or 1

    local res_id = PathTool.getSingleImgForDownLoad("bigbg/rank", "hl_rank_1") --"txt_cn_rank_" .. self.rank_type)
    if self.item_res_id ~= res_id then
        self.item_res_id = res_id 
        self.item_load = loadSpriteTextureFromCDN(self.bg, res_id, ResourcesType.single, self.item_load)
    end
    
    local name = RankConstant.TitleName[vo.rank_type] or ''
    local name1 = self.main_panel:getChildByName('name1')
    local name2 = self.main_panel:getChildByName('name2')
    if name ~= '' then
        local k = string.sub(name,1,3)
        local m = string.sub(name,4,string.len(name))
        name1:setString(k)
        name2:setString(m)
    else
        name1:setString('')
        name2:setString('')
    end
    
    if self.data.val1 ~= 0 then

        local name = self.data.name
        if name == "" then
            TI18N("暂无排名")
        else
            if self.is_cluster == true then
                name = transformNameByServ(self.data.name, self.data.srv_id)
            end
        end
        self.name:setString(name)
        -- self.name:setPosition(cc.p(125,38))
        if not self.data or next(self.data) ==nil then return end
        if self.rank_type ~= RankConstant.RankType.union then
            if not self.player_head then 
                self.player_head = PlayerHead.new(PlayerHead.type.circle)
                local x,y = self.name:getPosition()
                self.player_head:setPosition(x, y + 70)
                self.main_panel:addChild(self.player_head)
            end

            self.player_head:setHeadRes(self.data.face_id, false, LOADTEXT_TYPE, self.data.face_file, self.data.face_update_time)

            local avatar_bid = self.data.avatar_bid
            local vo = Config.AvatarData.data_avatar[avatar_bid]
            if vo then
                local res_id = vo.res_id or 1
                local res = PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. res_id, false, false)
                self.player_head:showBg(res, nil, false, vo.offy)
            end
            if self.union_icon then
                self.union_icon:setVisible(false)
            end
            self.player_head:setVisible(true)
        else
            if not self.union_icon then 
                local x,y = self.name:getPosition()
                
                self.union_icon = createImage(self.main_panel, nil, x, y + 70, cc.p(0.5,0.5), true)
                local res = PathTool.getSingleImgForDownLoad("bigbg/rank", "rank_3")
                if not self.qizi_load then
                    self.qizi_load = loadImageTextureFromCDN(self.union_icon, res, ResourcesType.single, self.qizi_load)
                end
            end
            self.union_icon:setVisible(true)
            if self.player_head then
                self.player_head:setVisible(false)
            end
        end

        local str = ""
        if self.rank_type == RankConstant.RankType.arena then
            local res = PathTool.getItemRes("8")
            local val = self.data.val1 or 0
            str = string.format("<img src='%s' scale=0.3 /><div outline=2,#3a3a3a>%s</div>",res,val)
        elseif self.rank_type == RankConstant.RankType.drama then
            local dungeon_id = self.data.val1 or 0
            local config = Config.DungeonData.data_drama_dungeon_info(dungeon_id)
            if config then
                str = string.format(TI18N("<div outline=2,#3a3a3a>%s</div>"),config.name)
            end
        elseif self.rank_type == RankConstant.RankType.power or 
            self.rank_type == RankConstant.RankType.ladder or 
            self.rank_type == RankConstant.RankType.action_partner or 
            self.rank_type == RankConstant.RankType.colors_tone then
            local res = PathTool.getResFrame("common","common_90001")
            local val = self.data.val1 or 0
            str = string.format("<img src='%s' scale=0.9 /><div outline=2,#3a3a3a>%s</div>",res,val)
            if self.rank_type == RankConstant.RankType.action_partner then 
                self:showActionIcon(true)
            end
        elseif self.rank_type == RankConstant.RankType.tower then
            local val = self.data.val1 or 0
            str = string.format(TI18N("<div outline=2,#3a3a3a>通关层数：%s</div>"),val)
        elseif self.rank_type == RankConstant.RankType.union then
            if self.is_cluster == true then
                name = transformNameByServ(self.data.guild_name, self.data.srv_id)
            else
                name = self.data.guild_name or ""
            end
            local val = self.data.val1 or 0
            str = string.format(TI18N("<div outline=2,#3a3a3a>总战力：%s</div>"),val)
        elseif self.rank_type == RankConstant.RankType.star_power then
            local val = self.data.val1 or 0
            str = string.format(TI18N("<div outline=2,#3a3a3a>评分：%s</div>"),val)
        elseif self.rank_type == RankConstant.RankType.action_star then
            local val = self.data.val1 or 0
            str = string.format(TI18N("<div outline=2,#3a3a3a>评分：%s</div>"),val)
            self:showActionIcon(true)
        elseif self.rank_type == RankConstant.RankType.action_adventure then
            local val = self.data.val1 or 0
            str = string.format(TI18N("<div outline=2,#3a3a3a>神界探索度：%s</div>"),val)
            self:showActionIcon(true)
        elseif self.rank_type == RankConstant.RankType.hallows_power then
            local val = self.data.val1 or 0
            str = string.format(TI18N("<div outline=2,#3a3a3a>圣器战力：%s</div>"),val)
        end
        self.name:setString(name)
        -- self.name:setPosition(cc.p(125,55))
        self.rank_label:setString(str)
    else
        self.name:setString(TI18N("虚位以待"))
        -- self.name:setPosition(cc.p(25,35))
        self.rank_label:setString("")

        
        if self.union_icon then
            self.union_icon:setVisible(false)
        end
        if self.player_head then
            self.player_head:setVisible(false)
        end
    end
end

function RankMainItem:setExtendData(is_cluster)
    self.is_cluster = is_cluster 
end

--活动标签
function RankMainItem:showActionIcon(bool)
    if bool == false and not self.action_icon then return end
    if not self.action_icon then 
		local res = PathTool.getResFrame("common","common_90015")
		self.action_icon = createImage(self.main_panel,res,33,133,cc.p(0.5,0.5),true,10,true)
		self.action_label = createLabel(20,Config.ColorData.data_color4[1],Config.ColorData.data_color4[9],29,25,"",self.action_icon,2, cc.p(0.5,0))
		self.action_label:setRotation(-45)
		
	end
    local str = TI18N("活动")
    self.action_label:setString(str)
	self.action_icon:setVisible(bool)	
end
--事件
function RankMainItem:registerEvents()
    self:addTouchEventListener(function(sender, event_type) 
        -- customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            self.touch_end = sender:getTouchEndPosition()
            local is_click = true
            if self.touch_began ~= nil then
                is_click =
                    math.abs(self.touch_end.x - self.touch_began.x) <= 20 and
                    math.abs(self.touch_end.y - self.touch_began.y) <= 20
            end
            if is_click == true then
                playCommonButtonSound()
                if not self.data or next(self.data) ==nil then 
                    message(TI18N("暂无排名数据"))
                    return
                end
                if self.call_fun then
                    self:call_fun(self.data)
                end
            end
        elseif event_type == ccui.TouchEventType.began then
            self.touch_began = sender:getTouchBeganPosition()
        end
    end)
end

function RankMainItem:clickHandler()
    if self.call_fun then 
        self:call_fun(self.data)
    end
end
function RankMainItem:addCallBack(call_fun)
    self.call_fun =call_fun
end

function RankMainItem:setSelectStatus(bool)
    self.select_bg:setVisible(bool)
end

function RankMainItem:setVisibleStatus(bool)
    self:setVisible(bool)
end

function RankMainItem:getRankIndex()
    return self.rank_type or 1
end

function RankMainItem:DeleteMe()
    if self.item_load then
        self.item_load:DeleteMe()
    end
    if self.qizi_load then
        self.qizi_load:DeleteMe()
    end

    if self.player_head then 
        self.player_head:DeleteMe()
    end
    self.player_head = nil
    self.item_load = nil
end




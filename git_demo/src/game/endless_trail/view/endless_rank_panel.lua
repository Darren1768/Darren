-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      无尽试炼排行榜数据
-- --------------------------------------------------------------------
EndlessRankPanel = class("EndlessRankPanel",function()
    return ccui.Layout:create()
end)

local controller = Endless_trailController:getInstance()
local model = Endless_trailController:getInstance():getModel() 

function EndlessRankPanel:ctor(type)
    self.type = type or Endless_trailEvent.endless_type.old
    self.is_init = true
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_rank_panel"))

    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    self.scroll_container = self.root_wnd:getChildByName("scroll_container")
    self.empty_bg = self.scroll_container:getChildByName("empty_bg")
    self.empty_bg:setVisible(false)
    loadSpriteTexture(self.empty_bg, PathTool.getSingleImgForDownLoad("bigbg", "bigbg_3"), LOADTEXT_TYPE)
    self.desc_label = self.empty_bg:getChildByName("desc_label")
    self.desc_label:setPositionX(self.empty_bg:getContentSize().width / 2)
    self.desc_label:setString(TI18N("暂无记录"))

    -- self.scroll_container:setPositionX(-10)
    local size = cc.size(self.scroll_container:getContentSize().width, self.scroll_container:getContentSize().height-10)
    local setting = {
        item_class = EndlessRankItem,
        start_x = 0,
        space_x = 4,
        start_y = 0,
        space_y = 0,
        item_width = 614,
        item_height = 108,
        row = 0,
        col = 1,
        need_dynamic = true
    }
    self.scroll_view = CommonScrollViewLayout.new(self.scroll_container, cc.p(0, 5), nil, nil, size, setting)

    local my_container = self.root_wnd:getChildByName("my_container")
    -- local my_rank_title = my_container:getChildByName("my_rank_title")

    self.rank_img = my_container:getChildByName("rank_img")
    self.rank_img:setVisible(false)
    self.rank_x = self.rank_img:getPositionX()
    self.rank_y = self.rank_img:getPositionY()


    self.role_name = my_container:getChildByName("role_name")
    self.role_power = my_container:getChildByName("role_power")
    self.role_power:setVisible(false)
    self.power_bg = my_container:getChildByName("Image_1")
    self.no_rank = my_container:getChildByName("no_rank")

    self.no_rank:setString(TI18N("暂无"))
    self.no_rank:setVisible(false)
    self.my_score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 65), nil, nil, 300)
    my_container:addChild(self.my_score_info)

    self.prower_num_my  = CommonNum.new(101, self.power_bg , "", -2, cc.p(0, 0.5))
    self.prower_num_my:setPosition(40, 30)

    self.role_head = PlayerHead.new(PlayerHead.type.circle)
    self.role_head:setHeadLayerScale(0.95)
    self.role_head:setPosition(154, 65)
    self.role_head:setLev(99)
    my_container:addChild(self.role_head)

    self.my_container = my_container


    self.three_tab = {}
 
    self.three_container =self.root_wnd:getChildByName("three_container")
    for i =1,3 do 
         local tab =  self.three_container:getChildByName("item_"..i)
         tab.name = tab:getChildByName("name")
         tab.name:setString("")
         local _power_image =   tab:getChildByName("power_image")
         local prower_num  = CommonNum.new(101, _power_image , "", -2, cc.p(0, 0.5))
         prower_num:setPosition(40, 28)
         tab.prower_num = prower_num
         tab._power_image= _power_image
         tab._power_image:setVisible(false)

         local _head  = PlayerHead.new(PlayerHead.type.circle)
         _head:setHeadLayerScale(0.95)
         _head:setPosition(100, 105)
         tab:addChild(_head)
         tab.head = _head
         _head:setVisible(false)

         tab.no_label = tab:getChildByName("no_label")
         tab.no_label:setVisible(true)

         local label = createLabel(20,cc.c3b(239,212,174), nil,96 ,56,desc_label,tab, nil, cc.p(0.5,1))
         tab.max_label = label
         tab.max_label:setVisible(false)

         self.three_tab[i] = tab 

    end 


    self:registerEvent()
end

function EndlessRankPanel:registerEvent()
     EventManager:getInstance():Bind(RankEvent.RankEvent_Get_Rank_data,self, function(data) 
        print("==================RankEvent_Get_Rank_data========================")
            if self.type_rank and data.type == self.type_rank then
                self:updateRankList(data)
            end
        end)
end

function EndlessRankPanel:setNodeVisible(status)
    self:setVisible(status)
end

function EndlessRankPanel:addToParent()
    -- 窗体打开只请求一次，不是标签显示
    if self.is_init == true then
        local type_rank = RankConstant.RankType.endless
    
        if self.type == Endless_trailEvent.endless_type.water then
            type_rank = RankConstant.RankType.endless_water
        elseif self.type == Endless_trailEvent.endless_type.fire then
            type_rank = RankConstant.RankType.endless_fire
        elseif self.type == Endless_trailEvent.endless_type.wind then
            type_rank = RankConstant.RankType.endless_wind
        elseif self.type == Endless_trailEvent.endless_type.light_dark then
            type_rank = RankConstant.RankType.endless_lightdark
        elseif self.type == Endless_trailEvent.endless_type.singlemode then
            type_rank = RankConstant.RankType.endless_singlemode
        end
        self.type_rank = type_rank
        RankController:send_12900(type_rank)
        self.is_init = false
    end
end

--[[
    @desc:更新自己的信息，还是走这里把
    author:{author}
    time:2018-05-17 10:17:08
    --@is_event: 
    return
]]
function EndlessRankPanel:updatePanelInfo(is_event)

end

function EndlessRankPanel:updateRankList(data)
    local role_vo = RoleController:getInstance():getRoleVo()
    if data and role_vo then
        self.role_name:setString(role_vo.name)
        -- self.role_power:setString(role_vo.power)
        self.prower_num_my:setNum(role_vo.power)
        local width = self.role_power:getContentSize().width + 75
        local height = self.power_bg:getContentSize().height
        self.power_bg:setContentSize(cc.size(width, height))
        if data.my_idx and data.my_idx <= 3 then
            if self.rank_num ~= nil then
                self.setVisible(false)
            end
            if data.my_idx == 0 then
                self.rank_img:setVisible(false)
                self.no_rank:setVisible(true)

            else
                self.no_rank:setVisible(false)
                local res_id = PathTool.getResFrame("common", string.format("common_200%s", data.my_idx))
                if self.rank_res_id ~= res_id then
                    self.rank_res_id  = res_id
                    loadSpriteTexture(self.rank_img, res_id, LOADTEXT_TYPE_PLIST)
                end
                self.rank_img:setVisible(true)
            end
        else
            if self.rank_num == nil then
                self.rank_num = CommonNum.new(101, self.my_container, 1, -2, cc.p(0.5, 0.5))
                self.rank_num:setPosition(59,77)
            end
            self.rank_num:setVisible(true)
            self.rank_num:setNum(data.my_idx)
            self.rank_img:setVisible(false)
        end

        local msg = string.format(
            TI18N("<div>%s</div><div fontcolor=#249003 fontsize=22>%s</div>"),
            TI18N("最大通关数:"),
            data.my_val1 or 0
        )

        local line = math.modf( data.my_val1  / 5 )  -- 取整数
        local mod = math.fmod(  data.my_val1 , 5 )    -- 取余数
        local _str_my =  (line+1) .. "玄" .. mod .. "位"

        self.my_score_info:setString(_str_my)
        self.role_head:setHeadRes(role_vo.face_id, false, LOADTEXT_TYPE, role_vo.face_file, role_vo.face_update_time)
        self.role_head:setLev(role_vo.lev)
        local avatar_bid = role_vo.avatar_base_id
        local vo = Config.AvatarData.data_avatar[avatar_bid]
        if vo then
            local res_id = vo.res_id or 1
            local res = PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. res_id, false, false)
            self.role_head:showBg(res, nil, false, vo.offy)
        end

        -- 创建排行榜。。。。。这里做点击回到用于记录更新点赞数量
        local function click_callback(item)
            self:worshipOtherRole(item)
        end
        self.empty_bg:setVisible(false)

        if data.rank_list ~= nil and next(data.rank_list) ~= nil  then
            local _list = {}
            for i ,v in pairs(data.rank_list) do  
                if i > 3 then 
                    v._rank = i 
                    table.insert(_list,v )
                else
                    local item = self.three_tab[i]
                    item.name:setString(v.name)  
                    item.prower_num:setNum(v.val2)
                    item.head:setHeadRes(v.face_id, false, LOADTEXT_TYPE, v.face_file, v.face_update_time)
                    item.head:setLev(v.lev)
                    item.head:setVisible(true)

                    item._power_image:setVisible(true)
                    item.max_label:setVisible(true)
                    local _avatar_bid = v.avatar_id 
                    local _vo = Config.AvatarData.data_avatar[_avatar_bid]
                    if _vo then
                        local _res_id = _vo.res_id or 1
                        local _res = PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. _res_id, false, false)
                        self.role_head:showBg(_res, nil, false, _vo.offy)
                    end

                    local line = math.modf( v.val1 / 5 )  -- 取整数
                    local mod = math.fmod( v.val1, 5 )    -- 取余数
                    local _str =  (line+1) .. "玄" .. mod .. "位"
                    item.max_label:setString(_str)
                end 
            end 

            local num =1
            if #data.rank_list<3 then 
                 num =4
            else
                 num =#data.rank_list
            end 

            for i= num,100  do 
                local _v ={}
                _v._rank = i 
                _v.type = "no"
                table.insert(_list,_v )
            end 
            -- print("-----------_list------------------",num)
            -- printLuaTable(_list)
            self.scroll_view:setData(_list, click_callback)


        else
            local _list = {}

            for i= 4,100  do  
                local _v ={}
                _v._rank = i 
                _v.type = "no"
                table.insert(_list,_v )
            end 
            self.scroll_view:setData(_list, click_callback)

        end

        


    end
end

--[[
    @desc: 主要用于点击点赞按钮，在这做记录等返回成功之后做按钮的更新处理
    author:{author}
    time:2018-05-28 23:42:51
    --@item: 
    return
]]
function EndlessRankPanel:worshipOtherRole(item)
    if item.data ~= nil then
        self.select_item = item
    end
end

function EndlessRankPanel:DeleteMe()
    EventManager:getInstance():UnBind(self)
    if self.rank_num then
        self.rank_num:DeleteMe()
        self.rank_num = nil
    end
    if self.scroll_view then
        self.scroll_view:DeleteMe()
        self.scroll_view = nil
    end
end


-- --------------------------------------------------------------------
-- @description:
--      循环赛排行榜单元
--
-- --------------------------------------------------------------------
EndlessRankItem = class("EndlessRankItem",function()
    return ccui.Layout:create()
end)

function EndlessRankItem:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_rank_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)

    local container = self.root_wnd:getChildByName("container")
    self.rank_img = container:getChildByName("rank_img")
    self.role_name = container:getChildByName("role_name")
    self.role_name:setString("")
    self.role_power = container:getChildByName("role_power")
    self.role_power:setVisible(false)
    self.power_bg = container:getChildByName("Image_1")
    self.score_info = createRichLabel(20, 175, cc.p(0.5, 0.5), cc.p(520, 60), nil, nil, 300)
    container:addChild(self.score_info)

    self.prower_num  = CommonNum.new(101, self.power_bg , "", -2, cc.p(0, 0.5))
    self.prower_num:setPosition(40, 30)

    self.rank_num=  container:getChildByName("rank_num")

    self.role_head = PlayerHead.new(PlayerHead.type.circle)
    self.role_head:setHeadLayerScale(0.95)
    self.role_head:setPosition(150, 65)
    container:addChild(self.role_head)
    self.role_head:setLev(99)

    self.no_label = container:getChildByName("no_label")
    self.no_label:setVisible(false)

    self.container = container
    self.bg_image =    self.root_wnd:getChildByName("bg")

    self:registerEvent()
end

function EndlessRankItem:registerEvent()
    self.role_head:addCallBack( function()
        if self.data ~= nil then
            FriendController:getInstance():openFriendCheckPanel(true, {srv_id = self.data.srv_id, rid = self.data.rid})
        end
    end,false)
end

function EndlessRankItem:addCallBack(call_back)
    self.call_back = call_back
end
function EndlessRankItem:setData(data)
    if data._rank %2 == 1 then 
        self.bg_image:setVisible(false)
    else 
        self.bg_image:setVisible(true)
    end 

    if data.type =="no" then 
        self.power_bg:setVisible(false)
        self.role_head:setVisible(false) 
        self.rank_img:setVisible(false)
        self.rank_num:setVisible(true)
        self.rank_num:setString(data._rank)
        self.score_info:setString("")
        self.no_label:setVisible(true)
        return
    end 

    local role_vo = RoleController:getInstance():getRoleVo()
    if data and role_vo then
        self.data = data
        self.role_name:setString(data.name)
        self.role_power:setString(data.val2)
        self.prower_num:setNum(data.val2)
        local width = self.role_power:getContentSize().width + 75
        local height = self.power_bg:getContentSize().height
        self.power_bg:setContentSize(cc.size(width,height))
        self.role_head:setHeadRes(data.face_id, false, LOADTEXT_TYPE, data.face_file, data.face_update_time)
        self.role_head:setLev(data.lev)
        local avatar_bid = data.avatar_id 
        local vo = Config.AvatarData.data_avatar[avatar_bid]
        if vo then
            local res_id = vo.res_id or 1
            local res = PathTool.getTargetRes("headcircle", "txt_cn_headcircle_" .. res_id, false, false)
            self.role_head:showBg(res, nil, false, vo.offy)
        end

        if data.idx <= 3 then
            if self.rank_num ~= nil then
                self.rank_num:setVisible(false)
            end
            if data.idx == 0 then
                self.rank_img:setVisible(false)
            else
                local res_id = PathTool.getResFrame("common", string.format("common_200%s", data.idx))
                if self.rank_res_id ~= res_id then
                    self.rank_res_id = res_id
                    loadSpriteTexture(self.rank_img, res_id, LOADTEXT_TYPE_PLIST)
                end
                self.rank_img:setVisible(true)
            end
        else
            -- if self.rank_num == nil then
            --     self.rank_num = CommonNum.new(101, self.container, 1, -2, cc.p(0.5, 0.5))
            --     self.rank_num:setPosition(59, 77)
            -- end
            self.rank_num:setVisible(true)
            self.rank_num:setString(data.idx)
            self.rank_img:setVisible(false)
        end
        -- local msg = string.format(TI18N("<div>%s</div><div fontcolor=#249003 fontsize=22>%s</div>"), TI18N("最大通关数:"), data.val1 or 0)

        local line = math.modf(data.val1  / 5 )  -- 取整数
        local mod = math.fmod( data.val1 , 5 )    -- 取余数
        local _str =  (line+1) .. "玄" .. mod .. "位"
        self.score_info:setString(_str)
    end
end

function EndlessRankItem:DeleteMe()
    -- if self.rank_num ~= nil then
    --     self.rank_num:DeleteMe()
    --     self.rank_num = nil
    -- end
    self:removeAllChildren()
    self:removeFromParent()
end

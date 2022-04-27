-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      无尽试炼支援我的界面
-- --------------------------------------------------------------------
OrganizeTeamHelpMePanel = class("OrganizeTeamHelpMePanel", function()
    return ccui.Layout:create()
end)

local controller = OrganizeController:getInstance()
local model = OrganizeController:getInstance():getModel() 
local table_sort = table.sort
function OrganizeTeamHelpMePanel:ctor()
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("organizeteam/organizeteam_help_me_panel"))
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)
    self.is_select = false
    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5 - 10, self.size.height * 0.5 - 40)
    self:addChild(self.root_wnd)

    local container = self.root_wnd:getChildByName("container")
    local scroll_container = container:getChildByName("scroll_container")
    local desc_label = container:getChildByName("desc_label")
    desc_label:setString(TI18N("超出拥有武灵120%战力的支援武灵不可使用"))
    
    local scorll_size = scroll_container:getContentSize()
    local size = cc.size(scorll_size.width - 4, scorll_size.height - 10)
    local setting = {
        item_class = OrganizeTeamFriendHelpItem,
        start_x = 0,
        space_x = 0,
        start_y = 0,
        space_y = 0,
        item_width = 600,
        item_height = 138,
        row = 0,
        col = 1,
        need_dynamic = true
    }
    self.scroll_view = CommonScrollViewLayout.new(scroll_container, cc.p(4, 5), nil, nil, size, setting)
    self:registerEvent()
end

function OrganizeTeamHelpMePanel:registerEvent()
    EventManager:getInstance():Bind(OrganizeEvent.UPDATA_HIREPARNER_DATA,self,function(data)
            self:updateListData(data)
        end)
    
    EventManager:getInstance():Bind(OrganizeEvent.UPDATA_HASHIREPARNER_DATA,self,function(data)
            self:updateHasListData(self.hire_data,data.list)
        end)
    
end

function OrganizeTeamHelpMePanel:setNodeVisible(status)
	self:setVisible(status)
end 

function OrganizeTeamHelpMePanel:updateHasListData(data)
end

function OrganizeTeamHelpMePanel:updateListData(data,has_hire_list)
    if data then
        self.hire_data = data
        self.tmp_list = self.hire_data.list


        if self.tmp_list and #self.tmp_list <1 then 
            commonShowEmptyIcon(self.scroll_view, true, {font_size = 22,scale = 1, text = TI18N("暂无支援武灵")})
            return
        end



        local list_data = model:getHasHirePartnerData()
        local model_list = {}
        if list_data then
            model_list = list_data.list
        end
        local has_list = has_hire_list or model_list 
        local check_has_list = function(rid,srv_id,id)
            if has_list and next(has_list or {}) ~= nil then
                local is_has = false
                for i,v in ipairs(has_list) do
                    if v.id == id and v.rid == rid and v.srv_id == srv_id then
                        is_has = true
                        break
                    end
                end
                return is_has
            end
        end
        local role_vo = RoleController:getInstance():getRoleVo()
        local height_power = HeroController:getInstance():getModel():getMaxFight() * 1.2
        for i,v in ipairs(self.tmp_list) do
            v.index = i
            v.sort_index = 2
            v.select = false
            if check_has_list(v.rid,v.srv_id,v.id) == true then
                v.sort_index = 3
                v.select = true
            end
            v.is_lock = false
            if Config.PartnerData.data_partner_base[v.bid] then
                v.info_data = Config.PartnerData.data_partner_base[v.bid]
            end
            if v.power >= height_power then
                v.sort_index = 1
                v.is_lock = true
            end
        end

        local sort_func = SortTools.tableUpperSorter({"sort_index","power"})
        table_sort(self.tmp_list, sort_func )
        self:createList(self.tmp_list)
    
    end
end

function OrganizeTeamHelpMePanel:createList(list)
   local function callback(item, vo, index,is_select,is_start)
        if vo and next(vo) ~= nil then
            self:clickFun(item, vo, index,is_select,is_start)
        end
    end
    self.scroll_view:setData(list, callback)
    self.scroll_view:addEndCallBack(function (  )
        local list = self.scroll_view:getItemList()
        for k,v in pairs(list) do
            local data = v:getData()
            if data.select == true then
                self:clickFun(v, data, data._index, true, true)
            end
        end
    end)
end

function OrganizeTeamHelpMePanel:addToParent()
    controller:sender29702()
end

function OrganizeTeamHelpMePanel:updateBtnChoseStatus( index, is_select )
    -- if not self.tmp_list then return end
    -- for k,v in pairs(self.tmp_list) do
    --     local old_status = v.select
    --     if v._index and v._index == index then
    --         v.select = is_select
    --     else
    --         v.select = false
    --     end
    --     if old_status == true and v.select == false then
    --         controller:send23909(v.rid, v.srv_id, v.id, 0)
    --     elseif old_status == false and v.select == true then
    --         controller:send23909(v.rid, v.srv_id, v.id, 1)
    --     end
    -- end
end

-- 获取旧的item
function OrganizeTeamHelpMePanel:setAllItemBtnStatus(  )
    local list = self.scroll_view:getItemList()
    for k,item in pairs(list) do
        local data = item:getData()
        if data.select == true then
            item:updateBtnStatus(false)
        end
    end
end

function OrganizeTeamHelpMePanel:clickFun(item,vo,index,is_select,is_start)
    self:setAllItemBtnStatus()
    if self.select_item_index and self.select_item_index == index and self.select_item then
        --controller:send23909(self.select_vo.rid, self.select_vo.srv_id, self.select_vo.id, 0)
        --self.select_item:updateBtnStatus(false)
        self:updateBtnChoseStatus(self.select_item.index, false)
        self.select_item = nil
        self.is_select = false
        self.select_item_index = nil
        return
    end
    --[[if self.select_item then
        self.select_item:updateBtnStatus(false)
        controller:send23909(self.select_vo.rid, self.select_vo.srv_id, self.select_vo.id, 0)
    end--]]
    self.select_item = item
    self.select_vo = vo
    self.select_item:updateBtnStatus(true)
    self:updateBtnChoseStatus(index, true)
    self.select_item_index = index
    self.is_select = is_select
    --[[if not is_start then
        controller:send23909(self.select_vo.rid, self.select_vo.srv_id, self.select_vo.id, 1)
    end--]]
end


function OrganizeTeamHelpMePanel:DeleteMe()
    EventManager:getInstance():UnBind(self)
    if self.scroll_view then
        self.scroll_view:DeleteMe()
        self.scroll_view = nil
    end
end



-- --------------------------------------------------------------------
-- 竖版伙伴灵器列表选择界面
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
ArtifactListWindow = ArtifactListWindow or BaseClass(BaseView)

function ArtifactListWindow:__init()
    self.ctrl = HeroController:getInstance()
    
    self.win_type = WinType.Big
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.title_str = TI18N("灵魄列表")
    self.empty_res = PathTool.getSingleImgForDownLoad("bigbg","bigbg_3")
    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("hero", "hero"), type = ResourcesType.plist},
        { path = self.empty_res, type = ResourcesType.single }
    }

    self.win_type = WinType.Big    
    self.is_init = true

    self.base_attr = {}
    self.other_attr = {}
end

function ArtifactListWindow:open_callback()
    local csbPath = PathTool.getTargetCSB("hero/artifact_list_panel")
    local root = createCSBNote(csbPath)
    self.container:addChild(root,10)
    local size= self.container:getContentSize()
    root:setAnchorPoint(cc.p(0.5,0))
    root:setPosition(cc.p(size.width/2,0))

    self.main_panel = root:getChildByName("main_panel")

    self.source_btn = self.main_panel:getChildByName("source_btn")
    resetStudioButton(self.source_btn,ButtonType.red,TI18N("获取更多"))

    self.desc_label = createLabel(24,175,nil,310,920,TI18N("穿戴符文后武灵可获得符文携带的被动技能"),self.container)
    self.desc_label:setAnchorPoint(cc.p(0.5,0.5))

    if self.item_scrollview == nil then
        local scroll_view_size = cc.size(600,800)
        local setting = {
            start_x = 5,                     -- 第一个单元的X起点
            space_x = 0,                     -- x方向的间隔
            start_y = 0,                     -- 第一个单元的Y起点
            space_y = 3,                     -- y方向的间隔
            item_width = 600,                -- 单元的尺寸width
            item_height = 135,               -- 单元的尺寸height
            row = 1,                         -- 行数，作用于水平滚动类型
            col = 1,                         -- 列数，作用于垂直滚动类型
            delay = 4,                       -- 创建延迟时间
            once_num = 1,                    -- 每次创建的数量
        }
        self.item_scrollview = CommonScrollViewSingleLayout.new(self.main_panel, cc.p(0,100) , ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting, cc.p(0, 0))

        self.item_scrollview:registerScriptHandlerSingle(handler(self,self.createNewCell), ScrollViewFuncType.CreateNewCell) --创建cell
        self.item_scrollview:registerScriptHandlerSingle(handler(self,self.numberOfCells), ScrollViewFuncType.NumberOfCells) --获取数量
        self.item_scrollview:registerScriptHandlerSingle(handler(self,self.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex) --更新cell
    end
    self.item_scrollview:reloadData()
end

function ArtifactListWindow:register_event()
    self.source_btn:addTouchEventListener(function(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            local bid = 0
            if Config.PartnerArtifactData.data_artifact_const["main_shenqi"] then 
                bid = Config.PartnerArtifactData.data_artifact_const["main_shenqi"].val
            end
            local config = Config.ItemData.data_get_data(bid)
            if config then 
                BackpackController:getInstance():openTipsSource( true,config )
            end
        end
    end)
     EventManager:getInstance():Bind(BackpackEvent.ADD_GOODS,self, function(bag_code, data_list)
            if bag_code == BackPackConst.Bag_Code.BACKPACK then
                self:initData()
            end
        end)
     EventManager:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM,self, function(bag_code, data_list)
            if bag_code and bag_code == BackPackConst.Bag_Code.BACKPACK then
                self:initData()
            end
        end)
    
    self:addGlobalEvent(HeroEvent.Del_Hero_Event, function(list)
        if self.partner_id then
            for i,v in ipairs(list) do
                if self.partner_id == v.partner_id then
                    if self.close then
                        self:close()
                    end
                end
            end
        end
    end)
end



function ArtifactListWindow:openRootWnd(artifact_type,partner_id,select_vo)
    print("-------------artifact_type-------------", self.artifact_type)
    self.artifact_type = artifact_type or 1  -- 1-4 是灵格 5 灵魄
    self.partner_id = partner_id or 0
    self.select_vo = select_vo 

    self:initData()
end

--创建cell 
--@width 是setting.item_width
--@height 是setting.item_height
function ArtifactListWindow:createNewCell(width, height)
   local cell = ArtifactListItem.new()
    cell:addCallBack(function() self:onCellTouched(cell) end)
    return cell
end
--获取数据数量
function ArtifactListWindow:numberOfCells()
    if not self.item_list then return 0 end
    return #self.item_list
end
--更新cell(拖动的时候.刷新数据时候会执行次方法)
--cell :createNewCell的返回的对象
--index :数据的索引
function ArtifactListWindow:updateCellByIndex(cell, index)
    cell.index = index
    local cell_data = self.item_list[index]
    if not cell_data then return end
    local time_desc = cell:setData(cell_data)
    cell:setExtendData(self.partner_id)
end

--点击cell .需要在 createNewCell 设置点击事件
function ArtifactListWindow:onCellTouched(cell)
    print("------------onCellTouched-------------------")
    local vo = cell:getData()
    if vo and next(vo) ~=nil then 
        if self.partner_id and self.partner_id ~=0 then
            self.ctrl:sender11030(self.partner_id,self.artifact_type,vo.id,1)
        else
            EventManager:getInstance():Fire(HeroEvent.Artifact_Select_Event,vo)
        end
        self.ctrl:openArtifactListWindow(false)
    end
end

function ArtifactListWindow:initData()
    local tmp_data = BackpackController:getInstance():getModel():getAllBackPackArray(BackPackConst.item_tab_type.SPECIAL)    
    local data = DeepCopy(tmp_data)

    local empty_desc = "背包中暂无该类型灵格"
    if self.artifact_type < 5 then 
        self.desc_label:setString("穿戴灵格后武灵可获得灵格附属的属性")
        self:changeTitleName(TI18N("灵格列表"))
        empty_desc = "背包中暂无该类型灵格"
    else
        self.desc_label:setString("穿戴灵魄后武灵可获得灵魄携带的被动技能")
        self:changeTitleName(TI18N("灵魄列表"))
        empty_desc = "背包中暂无该类型灵魄"
    end 


    self.item_list = {}
    local index = 1
    self.select_id = 0
    if self.select_vo and self.select_vo.id then 
        self.select_id = self.select_vo.id or 0
    end

    self.sub_sub_type = BackPackConst.item_type.SPIRIT
   
    if self.artifact_type ==5 then 
        self.sub_sub_type = BackPackConst.item_type.SPIRIT
    else 
        self.sub_sub_type = BackPackConst.item_type.LINGE
    end
   
    for i,v in pairs(data) do 
        if v and v.config and v.config.type == self.sub_sub_type then 
            if self.select_id ~= v.id then --选中的就剔除掉
                self.item_list[index] = v
                index = index+1
                -- if self.artifact_type ==0 then --0是获取所有装备
                --     self.item_list[index] = v
                --     index = index+1
                -- elseif self.artifact_type ==5 and artifact_config.type == 2 then 
                --     -- if v.config.type ==
                --     self.item_list[index] = v
                --     index = index+1

                -- elseif self.artifact_type <5 and self.artifact_type >0  and artifact_config.type == 1 then 
                --     self.item_list[index] = v
                --     index = index+1
                -- end
            end
        end
    end

    if not self.item_list or next(self.item_list) ==nil then 
        commonShowEmptyIcon(self.item_scrollview, true, {font_size = 22,scale = 1, text = empty_desc})
        return
    end

    --判断该位置是否已穿戴了灵器
    local partner_vo = HeroController:getInstance():getModel():getHeroById(self.partner_id)
    self.is_cloth = false 
    if partner_vo and next(partner_vo) ~= nil then 
        local artifact_list = partner_vo.artifact_list or {}
        for i, v in pairs(artifact_list) do
            if v and v.id and v.id ~= 0 and v.artifact_pos and v.artifact_pos == self.artifact_type  then 
                self.is_cloth = true 
            end
        end
    end
    -- 排序，星数>品质
    local function sortFunc( objA, objB )
        if objA.enchant ~= objB.enchant then
            return objA.enchant > objB.enchant
        elseif objA.config and objB.config then
            return objA.config.quality > objB.config.quality
        else
            return false
        end
    end
    table.sort(self.item_list, sortFunc)
    self.item_scrollview:reloadData()
end

--显示空白
function ArtifactListWindow:showEmptyIcon(bool)
    if not self.empty_con and bool == false then return end
    if not self.empty_con then 
        local size = cc.size(200,200)
        self.empty_con = ccui.Widget:create()
        self.empty_con:setContentSize(size)
        self.empty_con:setPosition(cc.p(335,370))
        self.container:addChild(self.empty_con,100)

        local bg = createImage(self.empty_con, self.empty_res, size.width/2, size.height/2, cc.p(0.5,0.5), false)
        self.empty_label = createLabel(24,cc.c4b(0x76,0x45,0x19,0xff),nil,size.width/2,-10,"",self.empty_con,0, cc.p(0.5,0))
    end
    local str = TI18N("背包中暂无该类型符文")
    self.empty_label:setString(str)
    self.empty_con:setVisible(bool)
end

--[[
    @desc: 设置标签页面板数据内容
    author:{author}
    time:2018-05-03 21:57:09
    return
]]
function ArtifactListWindow:setPanelData()
end

function ArtifactListWindow:close_callback()
    if self.item_scrollview then 
        self.item_scrollview:DeleteMe()
        self.item_scrollview = nil
    end
    EventManager:getInstance():UnBind(self)
    self.ctrl:openArtifactListWindow(false)
end








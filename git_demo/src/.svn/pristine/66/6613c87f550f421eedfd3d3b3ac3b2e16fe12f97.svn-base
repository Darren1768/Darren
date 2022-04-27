-- --------------------------------------------------------------------
-- 
-- 
-- @description:
--      无尽试炼Buff界面
-- --------------------------------------------------------------------
EndlessTrailBuffView = EndlessTrailBuffView or BaseClass(BaseView)

local controller = Endless_trailController:getInstance()
function EndlessTrailBuffView:__init(...)
    
    self.layout_name = "endlesstrail/endlesstrail_buff_view"
    self.win_type = WinType.Tips
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.partner_list = {}
    self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("form", "form"), type = ResourcesType.plist}
    }

end

function EndlessTrailBuffView:open_callback(...)
    self.background = self.root_wnd:getChildByName("background")
    self.background:setScale(display.getMaxScale())
    self.main_container = self.root_wnd:getChildByName("main_container")
    self:playEnterAnimatianByObj(self.main_container, 2)
    self.main_panel = self.main_container:getChildByName("main_panel")
    -- self.win_title = self.main_panel:getChildByName("win_title")
    -- self.win_title:setString(TI18N("增益选择"))
    self.desc_label = self.main_panel:getChildByName("desc_label")
    self.desc_label:setString(TI18N("必须选择一个Buff才能继续挑战"))

    self.buff_container = self.main_panel:getChildByName("buff_container")
    -- self.partner_container = self.main_panel:getChildByName("partner_container")
    -- self.form_icon = self.partner_container:getChildByName("form_icon")
    -- self.form_label = self.partner_container:getChildByName("form_label")
    -- self.desc_label_1 = self.partner_container:getChildByName("desc_label_1")
    --self.close_btn = self.main_panel:getChildByName("close_btn")
    self.cur_num = createRichLabel(24,175,cc.p(0.5,0.5),cc.p(545,772),nil,nil,500)
 
    self.main_container:addChild(self.cur_num)

    self.ack_btn = self.main_panel:getChildByName("ack_btn")

    -- self.buff_scroll_size = self.buff_container:getContentSize()
    -- local setting = {
    --     item_class = EndlessTrailBuffItem,      -- 单元类
    --     start_x = 16,                  -- 第一个单元的X起点
    --     space_x = 36,                    -- x方向的间隔
    --     start_y = 160,                    -- 第一个单元的Y起点
    --     space_y = 60,                   -- y方向的间隔
    --     item_width = EndlessTrailBuffItem.Width,               -- 单元的尺寸width
    --     item_height = EndlessTrailBuffItem.Height,              -- 单元的尺寸height
    --     row = 1,                        -- 行数，作用于水平滚动类型
    --     col = 0                         -- 列数，作用于垂直滚动类型
    -- }
    -- self.buff_scrollview = CommonScrollViewLayout.new(self.buff_container, cc.p(2.5,0) , ScrollViewDir.horizontal, ScrollViewStartPos.top,self.buff_scroll_size, setting)
end

function EndlessTrailBuffView:openRootWnd(data)
    if data then
        self.buff_data = data
        self.show_data = data.list 
        
    
        -- self:updateBuffData(data)
        self:updateList(self.show_data)
        -- self:updatePartnerData(data)
    end
end



function EndlessTrailBuffView:updateList(data )
    if self.item_scrollview == nil then
            -- self.buff_scroll_size = self.buff_container:getContentSize()

        local scroll_view_size = self.buff_container:getContentSize()
        local setting = {
            start_x = 20,                     -- 第一个单元的X起点
            space_x = 32,                     -- x方向的间隔
            start_y = 140,                     -- 第一个单元的Y起点
            space_y = 60,                     -- y方向的间隔
            item_width = EndlessTrailBuffItem.Width,                 -- 单元的尺寸width
            item_height =  EndlessTrailBuffItem.Height,                 -- 单元的尺寸height
            row = 1,                         -- 行数，作用于水平滚动类型
            col = 1,                         -- 列数，作用于垂直滚动类型
            once_num = 1,                    -- 每次创建的数量
        }
        self.buff_scrollview = CommonScrollViewSingleLayout.new(self.buff_container, cc.p(0,0) , ScrollViewDir.horizontal, ScrollViewStartPos.top, scroll_view_size, setting, cc.p(0, 0))

        self.buff_scrollview:registerScriptHandlerSingle(handler(self,self.createNewCell), ScrollViewFuncType.CreateNewCell) --创建cell
        self.buff_scrollview:registerScriptHandlerSingle(handler(self,self.numberOfCells), ScrollViewFuncType.NumberOfCells) --获取数量
        self.buff_scrollview:registerScriptHandlerSingle(handler(self,self.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex) --更新cell
        self.buff_scrollview:registerScriptHandlerSingle(handler(self, self.onCellTouched), ScrollViewFuncType.OnCellTouched) --更新cell

    end
    table.sort(data,function(a,b)
        return a.buff_id < b.buff_id
    end)
    
    self.buff_scrollview:reloadData()
end



function EndlessTrailBuffView:createNewCell(width, height)
    local cell = EndlessTrailBuffItem.new()
     cell:addCallBack(function() self:onCellTouched(cell) end)

     return cell
 end

 function EndlessTrailBuffView:numberOfCells()
     if not self.show_data then return 0 end
     return #self.show_data
 end

 function EndlessTrailBuffView:updateCellByIndex(cell, index)
    cell.index = index
    local cell_data = self.show_data[index]
    if not cell_data then
        return
    end
   cell:setData(cell_data)

   
 end
 

-- --点击cell .需要在 createNewCell 设置点击事件
function EndlessTrailBuffView:onCellTouched(cell, index)
    if not cell.index then
        return
    end
    
    local cell_data = self.show_data[cell.index]
    if not cell_data then
        return
    end

    self.selcte_current_data = cell_data


    if self.select_cell then
        self.select_cell:setSelected(false)
    end

    self.select_cell=cell 
 

    if self.select_cell  then
        self.select_cell:setSelected(true)
    end
    
end

function EndlessTrailBuffView:getData(  )
    return self.buff_data
end


function EndlessTrailBuffView:register_event(...)
    registerButtonEventListener(self.ack_btn, function ( )
        if self.selcte_current_data then 
          controller:send23911(self.selcte_current_data.buff_id)
        else
            message("请选择一个增益")
        end 
	end, true, false, nil, nil, 0, true)

   
end
--[[
    @desc: 增益buff选择
    author:{author}
    time:2018-08-16 14:22:38
    --@args: 
    @return:
]]
function EndlessTrailBuffView:updateBuffData(data)
    if data then
        table.sort(data.list,function(a,b)
            return a.buff_id < b.buff_id
        end)
        self.buff_scrollview:setData(data.list)
    end
end

function EndlessTrailBuffView:updatePartnerData(data)
    if data then
        local pos_info = data.partner
        if pos_info then
            local temp = {}
            for k, v in pairs(pos_info) do
                v.rare_type = v.quality
                local vo = HeroVo.New()
                vo:updateHeroVo(v)
                table.insert(temp, vo)
            end

            for i, v in ipairs(temp) do
                delayRun(self.main_container, i*2 / display.DEFAULT_FPS, function (  )
                    if not self.partner_list[i] then
                        local item =  HeroExhibitionItem.new(0.8, true)
                        self.partner_list[i] = item
                        self.partner_container:addChild(item)
                    end
                    local temp_item = self.partner_list[i]
                    if temp_item then
                        temp_item:setExtendData({from_type=HeroConst.ExhibitionItemType.eEndLessHero})
                        temp_item:setData(v,true)
                        local width = HeroExhibitionItem.Width * 0.8 
                        temp_item:setPosition(width * 0.5 + 18 + (width + 25)* (i - 1), self.partner_container:getContentSize().height / 2 - 10)
                    end
                end)
            end
        end
    end
end

function EndlessTrailBuffView:close_callback(...)
    doStopAllActions(self.main_container)
    if self.partner_list then
        for k,v in pairs(self.partner_list) do
            if v.DeleteMe then
                v:DeleteMe()
            end
        end
        self.partner_list = nil
    end
    if self.buff_scrollview then
        self.buff_scrollview:DeleteMe()
        self.buff_scrollview = nil
    end
    controller:openEndlessBuffView(false)
end


---buff列表单项
EndlessTrailBuffItem = class("EndlessTrailBuffItem",function()
    return ccui.Layout:create()
end)

EndlessTrailBuffItem.Height = 577
EndlessTrailBuffItem.Width = 200

function EndlessTrailBuffItem:ctor()
    self:setContentSize(EndlessTrailBuffItem.Width,EndlessTrailBuffItem.Height)
    self:setAnchorPoint(cc.p(0,1))
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("endlesstrail/endlesstrail_buff_item"))
    self:addChild(self.root_wnd)
    self.root = self.root_wnd:getChildByName("main_container")
    self.buff_icon = self.root:getChildByName("buff_icon")
    self.select_image = self.root:getChildByName("select_image")
    self.Image_bg = self.root:getChildByName("Image_bg")

    self.select_image:setVisible(false)

    self.name_label = createRichLabel(24, cc.c3b(255,255,255), cc.p(0.5, 0.5), cc.p(96, self.root:getContentSize().height / 2), nil, nil, 170,TITLE_FONT)
    self.root:addChild(self.name_label)


    self.desc_label = createRichLabel(22, cc.c3b(255,255,255), cc.p(0, 1), cc.p(16, self.root:getContentSize().height / 2-40), nil, nil, 170,DEFAULT_FONT)
    self.root:addChild(self.desc_label)

    self.name_label:setColor(cc.c3b(239,212,174))
    self.desc_label:setColor(cc.c3b(168,168,168))
    self:registerEvent()
end

function EndlessTrailBuffItem:registerEvent( ... )
    -- if self.root then
    --     self.root:setTouchEnabled(true)
    --     self.root:addTouchEventListener(function(sender,event_type)
    --         if event_type == ccui.TouchEventType.ended then
    --              print("----------------------------")
    --             -- if self.data then
    --             --     controller:send23911(self.data.buff_id)
    --             -- end
    --         end
    --     end)
    -- end

    registerButtonEventListener(self.root, function ( )
		if self.callback then
			self.callback(self, self.data)
		end
	end, true, false, nil, nil, 0, true)
end

function EndlessTrailBuffItem:setData(data)
    print("--------------------------",data)
    if data then
        self.data = data
        if Config.EndlessData.data_buff_data then
            if Config.EndlessData.data_buff_data[data.group_id] then
                if Config.EndlessData.data_buff_data[data.group_id][data.buff_id] then
                     local config = Config.EndlessData.data_buff_data[data.group_id][data.buff_id] 
                     if config then
                        self.desc_label:setString(config.desc.."\n\n效果持续到下次增益效果选择")
                        self.name_label:setString(config.battle_desc)
                        if config.icon ~= "" then
                            self.buff_icon:setScale(2)
                            loadSpriteTexture(self.buff_icon,PathTool.getBuffRes(config.icon),LOADTEXT_TYPE)
                        end
                     end
                end
            end
        end
       
    end 
end



function EndlessTrailBuffItem:addCallBack( callback )
	self.callback=callback
end
function EndlessTrailBuffItem:setSelected(status)
    self.select_image:setVisible(status)

    local _res = PathTool.getResFrame("endless","hl_endless_14")
    -- self.name_label:setColor(cc.c3b(255,255,255))
    -- self.desc_label:setColor(cc.c3b(255,255,255))
    if status == true then 
        _res = PathTool.getResFrame("endless","hl_endless_17")
        self.name_label:setColor(cc.c3b(250,232,150))
        self.desc_label:setColor(cc.c3b(250,232,150))
    else
        self.name_label:setColor(cc.c3b(239,212,174))
        self.desc_label:setColor(cc.c3b(168,168,168))

    end 
    self.Image_bg:loadTexture(_res, LOADTEXT_TYPE_PLIST)

end

function EndlessTrailBuffItem:getData(...)
    return self.data
end

function EndlessTrailBuffItem:DeleteMe( ... )
    self:removeAllChildren()
    self:removeFromParent()
end

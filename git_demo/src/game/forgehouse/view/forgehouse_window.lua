ForgeHouseWindow = ForgeHouseWindow or BaseClass(BaseView)

local controller = ForgeHouseController:getInstance()
local model = controller:getModel()
local backpackModel = BackpackController:getInstance():getModel()
local partner_const = Config.PartnerEqmData.data_partner_const
local eqm_comp_list = Config.PartnerEqmData.data_eqm_compose_id
function ForgeHouseWindow:__init()
    
    self.layout_name = "forgehouse/forgehouse_window"
 	self.res_list = {
        {path = PathTool.getPlistImgForDownLoad("forgehouse", "forgehouse"), type = ResourcesType.plist},
        {path = PathTool.getPlistImgForDownLoad("artifact","artifact"), type = ResourcesType.plist },
        {path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_90",false), type = ResourcesType.single },
		{path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_91",false), type = ResourcesType.single },
    	{path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_37",false), type = ResourcesType.single },
    	{path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_36",false), type = ResourcesType.single }
    }
    self.tab_list = {}
	self.tab_redstatus ={}
    self.top_tab_list = {}
    self.cur_index = nil
    self.composite_number = 0
    self.compCoinNumber = 0 --合成需要的金币
    self.role_vo = RoleController:getInstance():getRoleVo()
    --点击合成
    self.touch_comp_base = 1
    self.is_selected = nil
    self.is_tab_touch = true
end

function ForgeHouseWindow:open_callback()
	local bg = self.root_wnd:getChildByName("bg")
	bg:ignoreContentAdaptWithSize(true)
	bg:loadTexture(PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_90",false), LOADTEXT_TYPE)
    bg:setScale(display.getMaxScale())

	self.main_container = self.root_wnd:getChildByName("main_container")
    self:playEnterAnimatianByObj(self.main_container, 1)
	-- 装备
	self.equip_container = self.main_container:getChildByName("equip_container")
	-- 符文
	self.artifact_container = self.main_container:getChildByName("artifact_container")

	local image_stage = self.equip_container:getChildByName("image_stage")
	local res = PathTool.getSingleImgForDownLoad("bigbg", "hl_bigbg_91")
    if not self.item_load then
        self.item_load = createResourcesLoad(res, ResourcesType.single, function()
            if not tolua.isnull(image_stage) then
                image_stage:loadTexture(res,LOADTEXT_TYPE)
            end
        end,self.item_load)
    end

	--顶部选择
	self.tab_btn =   self.equip_container:getChildByName("tab_btn")
    self.select_btn = self.equip_container:getChildByName("select_btn")
	self.tab_btn_title = self.tab_btn:getChildByName("Text_4")
	self.tab_btn:setTouchEnabled(false)
	-- 顶部标签页
	local tab_container = self.main_container:getChildByName("tab_container")

    -- local tab_name_list = {
    --     [1] = TI18N("装备锻造"),
    --     [2] = TI18N("符文锻造")
    -- }
    -- for i=1,2 do
    --     local tab_btn = tab_container:getChildByName("tab_btn_"..i)
    --     if tab_btn then
    --         local object = {}
    --         object.unselect_bg = tab_btn:getChildByName('unselect_bg')
    --         object.unselect_bg:setVisible(true)
    --         object.select_bg = tab_btn:getChildByName('select_bg')
    --         object.select_bg:setVisible(false)
    --         -- object.label:setTextColor(cc.c4b(0xcf, 0xb5, 0x93, 0xff))
    --         object.lable = tab_btn:getChildByName("title")
    --         object.lable:setString(tab_name_list[i])
    --         object.tab_btn = tab_btn
    --         object.index = i
    --         object.tips = tab_btn:getChildByName("tips")
    --         if object.index == 2 then
    --             local red_status = HeroController:getInstance():getModel():getArtifactLuckyRedStatus()
    --             object.tips:setVisible(red_status)
    --         else
    --             object.tips:setVisible(false)
    --         end
    --         self.top_tab_list[i] = object
    --     end
    -- end

	self.close_btn = self.main_container:getChildByName("btn_return")

	--预加载音效
	GlobalAudio:getInstance():preLoadEffect(GlobalAudio.AUDIO_TYPE.COMMON, 'c_equipment_forging')
end

-- 初始化装备锻造界面
function ForgeHouseWindow:initEquipLayout(  )
	-- self.bar = self.equip_container:getChildByName("bar")
	-- self.bar:setScale9Enabled(true)
	self.bar_num = self.equip_container:getChildByName("bar_num")
	self.bar_num:setString("")
	self.bar_num_up = self.equip_container:getChildByName("bar_num_up")
	self.bar_num_up:setString("")

	self.btn_composite = self.equip_container:getChildByName("btn_composite")
	self.btn_composite:getChildByName("Text_1"):setString(TI18N("合成"))
	self.btn_comp = self.equip_container:getChildByName("btn_comp")
	self.btn_comp:getChildByName("Text_1"):setString(TI18N("合成记录"))

	self.text_Field = self.equip_container:getChildByName("text_Field")
    local function textFieldEvent(sender, eventType)
        if eventType == ccui.TextFiledEventType.attach_with_ime then
        elseif eventType == ccui.TextFiledEventType.detach_with_ime then
        	local index = self.cur_index or 1
        	local eqm_list = eqm_comp_list[index][self.touch_comp_base].expend
        	local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS,eqm_list[1][1])
        	num = math.floor(num/eqm_list[1][2])
        	if self.text_Field:getString() == "" then
        		message(TI18N("需写入合成数量哦~~"))
        		self.composite_number = 0
        		return
        	else
	        	local input_num = tonumber(self.text_Field:getString())
	        	if type(input_num) and type(input_num) == "number" and type(num) and type(num) == "number" then
		        	if input_num > num then
		        		self.text_Field:setString(num)
						self.bar_num_up:setString(num)
		        		self.composite_number = num
		        	else
		        		self.text_Field:setString(input_num)
						self.bar_num_up:setString(input_num)

		        		self.composite_number = input_num
		        	end
		        else
		        	message("只能输入数字哦")
		        end
	        end
	        self.gold_num:setString(MoneyTool.GetMoneyString(eqm_list[2][2]*self.composite_number))
	        self.compCoinNumber = eqm_list[2][2]*self.composite_number
        elseif eventType == ccui.TextFiledEventType.insert_text then
        elseif eventType == ccui.TextFiledEventType.delete_backward then
        end
    end
    self.text_Field:setTextColor(cc.c4b(0xff,0xff,0xff,0xff))
    self.text_Field:setPlaceHolderColor(cc.c4b(0xff,0xff,0xff,0xff))
    self.text_Field:setTextHorizontalAlignment(cc.TEXT_ALIGNMENT_CENTER)
    self.text_Field:addEventListener(textFieldEvent)

	self.btn_all_composite = self.equip_container:getChildByName("btn_all_composite")
	self.btn_all_composite_label = self.btn_all_composite:getChildByName("Text_1")
	self.btn_all_composite_label:setString(TI18N("一键合成"))
	self.btn_all_composite:setVisible(false)

	if self.role_vo.vip_lev > partner_const.synthesis_vip_lev.val and self.role_vo.lev > partner_const.synthesis_character_lev.val then
		-- setChildUnEnabled(true, self.btn_all_composite)
		-- self.btn_all_composite_label:disableEffect(cc.LabelEffect.OUTLINE)
		self.btn_all_composite:setVisible(true)
		self.btn_all_composite:setPosition(cc.p(290+120,182))
		self.btn_composite:setPosition(cc.p(290-120,182))
	end
	-- local roleVo = RoleController:getInstance():getRoleVo()
	-- if roleVo.lev > 30 then 
	-- 	self.btn_all_composite:setVisible(true)
	-- 	self.btn_all_composite:setPosition(cc.p(290+120,182))
	-- 	self.btn_composite:setPosition(cc.p(290-120,182))
	-- end 

	-- local tab_container = self.equip_container:getChildByName("tab_container")
	-- local title_list = {TI18N("武器"),TI18N("衣服"),TI18N("头盔"),TI18N("鞋子")}
	for i=1,4 do
		-- local tab = tab_container:getChildByName('tab_btn_'..i)
		-- tab.title = tab:getChildByName("title")
		-- tab.title:setString(title_list[i])
		-- tab.title:setTextColor(cc.c4b(0xEE, 0xD1, 0xAF, 0xff))
        -- tab.title:enableOutline(cc.c4b(0x53, 0x3D, 0x32, 0xff), 2)
		-- tab.normal = tab:getChildByName("normal")
		-- tab.select = tab:getChildByName("select")
		-- tab.select:setVisible(false)
		-- tab.redpoint = tab:getChildByName("redpoint")
		-- tab.redpoint:setVisible(false)
		-- tab.index = i
		-- self.tab_list[i] = tab
		self.tab_redstatus[i]=false
	end


	self.scroll = self.equip_container:getChildByName("goods_con")
	local scroll_view_size = self.scroll:getContentSize()
    local setting = {
        item_class = BackPackItem,      -- 单元类
        start_x = 40,                    -- 第一个单元的X起点
        space_x = 7,                    -- x方向的间隔
        start_y = 0,                    -- 第一个单元的Y起点
        space_y = 60,                   -- y方向的间隔
		-- end_y = 50,
        item_width = BackPackItem.Width,               -- 单元的尺寸width
        item_height = BackPackItem.Height,              -- 单元的尺寸height
        row =0,                        -- 行数，作用于水平滚动类型
        col =1,                         -- 列数，作用于垂直滚动类型
    }
	self.item_scrollview = CommonScrollViewLayout.new(self.scroll, cc.p(0, 0), ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting)
	-- self.item_scrollview = CommonScrollViewSingleLayout.new(self.scroll, cc.p(0, 0) , ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting, cc.p(0,0))
	-- self.item_scrollview:registerScriptHandlerSingle(handler(self,self.createNewCell), ScrollViewFuncType.CreateNewCell) --创建cell
	-- self.item_scrollview:registerScriptHandlerSingle(handler(self,self.numberOfCells), ScrollViewFuncType.NumberOfCells) --获取数量
	-- self.item_scrollview:registerScriptHandlerSingle(handler(self,self.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex) --更新cell
	--下
	local sprite_down =  self.equip_container:getChildByName("Sprite_down")
    self.last_item = BackPackItem.new(nil,true,nil,1)
    sprite_down:addChild(self.last_item)
    self.last_item:setPosition(cc.p(sprite_down:getContentSize().width/2+1, sprite_down:getContentSize().height/2+5))
    self.last_item:setDefaultTip()
	self.last_item:setVisible(false)

	local sprite_up =  self.equip_container:getChildByName("Sprite_up")
    self.cur_item = BackPackItem.new(nil,true,nil,1)
    sprite_up:addChild(self.cur_item)
    self.cur_item:setPosition(cc.p(sprite_up:getContentSize().width/2+1, sprite_up:getContentSize().height/2+5))
    self.cur_item:setDefaultTip()
	self.cur_item:setVisible(false)

    self.spriteGold = self.equip_container:getChildByName("spriteGold")
    self.btn_add = self.equip_container:getChildByName("btn_add")
	self.btn_max = self.equip_container:getChildByName("btn_max")

    self.btn_redu = self.equip_container:getChildByName("btn_redu")
    self.gold_bg = self.equip_container:getChildByName("gold_bg")
    self.gold_num = self.equip_container:getChildByName("gold_num")
    self.gold_num:setString("")
   

    self:register_equip_event()

    self:tabChangeView(1)
	self:initRedPoint()
end

function ForgeHouseWindow:tabChangeView(index)
	if self.is_tab_touch == nil then return end
	if self.cur_index == index then return end
	-- if self.cur_tab ~= nil then
	-- 	self.cur_tab.select:setVisible(false)
	-- 	self.cur_tab.title:setTextColor(cc.c4b(0xEE, 0xD1, 0xAF, 0xff))
	-- 	self.cur_tab.title:enableOutline(cc.c4b(0x53, 0x3D, 0x32, 0xff), 2)
	-- 	self.cur_tab.title:setFontSize(24)
	-- end
	self.cur_index = index
	-- self.cur_tab = self.tab_list[self.cur_index]
	-- if self.cur_tab ~= nil then
	-- 	self.cur_tab.select:setVisible(true)
	-- 	self.cur_tab.title:disableEffect(cc.LabelEffect.OUTLINE)
	-- 	self.cur_tab.title:setTextColor(cc.c4b(0x60, 0x35, 0x1a, 0xff))
	-- 	self.cur_tab.title:setFontSize(26)
	-- end
	local combox_list = {
        [1] = {combox_type = 1, desc = TI18N("武器")},
        [2] = {combox_type = 2, desc = TI18N("衣服")},
        [3] = {combox_type = 3, desc = TI18N("头盔")},
        [4] = {combox_type = 4, desc = TI18N("鞋子")},
    } 

	self.tab_btn_title:setString(combox_list[index].desc)

	self.touch_comp_base = 1
	self:setTouchEnable_Add(false)
	self:setTouchEnable_Redu(false)
	self:setTouchEnable_Max(false)

	local list = eqm_comp_list[self.cur_index]

	if index == 0 then 
		list ={}
		for i =1,4 do  
             local _config = Config.PartnerEqmData.data_eqm_compose_id[i]
			 for k, v in pairs(_config) do 
                 table.insert(list,v)
			 end
		end 
	end 
  
	local item_config = Config.ItemData.data_get_data(list[1].expend[2][1])
    local res = PathTool.getItemRes(item_config.icon)
    loadSpriteTexture(self.spriteGold, res, LOADTEXT_TYPE)

	-- self.last_item:setBaseData(list[self.touch_comp_base].expend[1][1])
	-- self.cur_item:setBaseData(list[self.touch_comp_base].id)

	local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, list[self.touch_comp_base].expend[1][1])
    self.bar_num:setString(num.."/"..list[self.touch_comp_base].expend[1][2])
    -- self.bar:setPercent(math.floor(num/list[self.touch_comp_base].expend[1][2]*100))
    self.composite_number = math.floor(num/list[self.touch_comp_base].expend[1][2])
    self.text_Field:setString(self.composite_number)
	self.bar_num_up:setString(self.composite_number)
    self.gold_num:setString(MoneyTool.GetMoneyString(list[self.touch_comp_base].expend[2][2]*self.composite_number))

    self.compCoinNumber = list[1].expend[2][2]*self.composite_number
    self:getGoldBGSize()
    
    self:setTouchEnable_Add(true)
	self:setTouchEnable_Max(true)
    if self.composite_number <= 1 then
    	self:setTouchEnable_Redu(true)
    end


	self.show_list = list 


	self.item_scrollview:setData(list, function(cell)
		if not self.is_selected then return end
		local data = cell:getData()
		local list_item = self.item_scrollview:getItemList()
		for k, v in pairs(list_item) do
			if v then
				if data and v:getData() and v:getData().id == data.id then
					v:setMaskVisible(true)
					self.touch_comp_base = v:getData()._index
				else
					v:setMaskVisible(false)
				end
			end
		end
		self.last_item:setVisible(true)
		self.cur_item:setVisible(true)
		self.last_item:setBaseData(data.expend[1][1])
		self.cur_item:setBaseData(data.id)

		local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS,data.expend[1][1])
	    self.bar_num:setString(num.."/"..data.expend[1][2])
	    -- self.bar:setPercent(math.floor(num/data.expend[1][2] *100))
	    self.composite_number = math.floor(num/list[1].expend[1][2])
    	self.text_Field:setString(self.composite_number)
		self.bar_num_up:setString(self.composite_number)

	    self.gold_num:setString(MoneyTool.GetMoneyString(data.expend[2][2]*self.composite_number))
	    self.compCoinNumber = data.expend[2][2]*self.composite_number
	    self:getGoldBGSize()
	    
	    self:setTouchEnable_Add(true)
		self:setTouchEnable_Max(true)
	    self:setTouchEnable_Redu(false)
    	if self.composite_number <= 1 then
    		self:setTouchEnable_Redu(true)
    	end
	end)

	self.item_scrollview:addEndCallBack(function()
		local list = self.item_scrollview:getItemList()
		local status = false
		for k, v in pairs(list) do
			if v then
				v:createSpriteMask()
				v:createSpriteRedPoint1()
				if k == self.touch_comp_base then
					v:setMaskVisible(true)
				else
					v:setMaskVisible(false)
				end

				local data = v:getData()
				if data then
					local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS,data.expend[1][1])
					if num and data.expend[1][2] then
						if num >= data.expend[1][2] then
							v:setVisibleResPoint1(true)
							status = true
						else
							v:setVisibleResPoint1(false)
						end
					end
				end
				local _config = Config.ItemData.data_get_data(data.id)
			   	v:setLocalZOrder( 999-k ) 
				   local x,y = v:getPosition()
			        --  -- 底图1 
			        local res_1 = PathTool.getResFrame("common2","hl_common_0104")
			        v.lineNode2 = createSprite(res_1,0,0,self.item_scrollview.container,cc.p(0.5,1),LOADTEXT_TYPE_PLIST,99)
			        v.lineNode2:setPosition(cc.p(x,y + 64))
					--  -- 底图2
					local res_2 = PathTool.getResFrame("common","hl_common_203")
					v.lineNode2 = createSprite(res_2,0,0,self.item_scrollview.container,cc.p(0.5,1),LOADTEXT_TYPE_PLIST,999)
					v.lineNode2:setPosition(cc.p(x+10 ,y -70))
					v.lineNode2:setScaleX(2)

					-- -- 名字
					
					v.name_label = createLabel(22,cc.c3b(255,252,220), nil,x,y-70 ,"", self.item_scrollview.container, nil, cc.p(0.5,1))
					v.name_label:setLocalZOrder(999) 
					if _config then 
						v.name_label:setString(_config.name )
					end 
			end
		end
		self.is_selected = true
		self.tab_redstatus[self.cur_index]=status
		self:setTabListStatus()
	end)


end

function ForgeHouseWindow:setTabListStatus()

	local _redstatus = false
	for i =1,4 do 
		if self.tab_redstatus[i] then
			_redstatus = true 
			break
		end 
	end 
	addRedPointToNodeByStatusLeft(self.tab_btn,_redstatus,2,-1) 
	
end


function ForgeHouseWindow:setTouchEnable_Add(bool)
	setChildUnEnabled(bool,self.btn_add)
	self.btn_add:setTouchEnabled(not bool)
end
function ForgeHouseWindow:setTouchEnable_Redu(bool)
	setChildUnEnabled(bool,self.btn_redu)
	self.btn_redu:setTouchEnabled(not bool)
end
function ForgeHouseWindow:setTouchEnable_Max(bool)
	setChildUnEnabled(bool,self.btn_max)
	self.btn_max:setTouchEnabled(not bool)
end

function ForgeHouseWindow:getGoldBGSize()
	local size = self.gold_num:getContentSize()
	local width = size.width
	if width < 100 then
		width = 120
	end	
end

-- 注册装备界面相关的点击事件
function ForgeHouseWindow:register_equip_event(  )
	for i,tab_btn in pairs(self.tab_list) do
    	registerButtonEventListener(tab_btn, function()
	        self:tabChangeView(tab_btn.index)
	    end,false, 3)
    end
    if self.role_vo ~= nil then
        if self.role_assets_event == nil then
            self.role_assets_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value)
                if key == "lev" or key == "vip_lev" then
                    if self.role_vo.vip_lev >= partner_const.synthesis_vip_lev.val or 
                    	self.role_vo.lev >= partner_const.synthesis_character_lev.val then
                    	setChildUnEnabled(false, self.btn_all_composite)
                    	self.btn_all_composite_label:enableOutline(Config.ColorData.data_color4[264], 2)
                    end
                end
            end)
        end
    end

    registerButtonEventListener(self.btn_comp, function()
 		controller:openEquipmentCompRecordWindow(true)
    end,true,1)

    registerButtonEventListener(self.btn_all_composite, function()
    	if self.role_vo.vip_lev < partner_const.synthesis_vip_lev.val and self.role_vo.lev < partner_const.synthesis_character_lev.val then
	    	local str = string.format(TI18N("人物%d级或VIP达到%d级开启"),partner_const.synthesis_character_lev.val,partner_const.synthesis_vip_lev.val)
	    	message(str)
	    	return
    	end
   
    	local base_id = eqm_comp_list[self.cur_index][#eqm_comp_list[self.cur_index]].id
    	if base_id then
	    	controller:getModel():setCompSendID(base_id)
	    	controller:send11079(base_id)
	    end
    end,true,1)
    registerButtonEventListener(self.btn_composite, function()
    	if self.text_Field:getString() == "" then
    		message(TI18N("需写入合成数量哦~~"))
    		return
    	end

    	self.cur_index = self.cur_index or 1
    	if self.touch_comp_base and self.cur_index then
    		if self.role_vo.coin <= self.compCoinNumber then
    			message(TI18N("金币不足"))
    			return
			end
			local base_id = eqm_comp_list[self.cur_index][self.touch_comp_base].id
			if self.composite_number<= 0 then
				self.is_selected = true
				message(TI18N("合成材料不足"))
			else
				local function func()
	        		controller:send11080(base_id,self.composite_number)
		    	end
		    	self.is_selected = nil
				self.is_tab_touch = nil
				self:releaseCompositeEffect()
				GlobalAudio:getInstance():playEffect(GlobalAudio.AUDIO_TYPE.COMMON, "c_equipment_forging")

				controller:send11080(base_id,self.composite_number)
				--[[ self.composite_effect = GlobalTimeTicket:getInstance():add(function()
		            playEffectOnce(PathTool.getEffectRes(269), self.last_item:getPositionX()+165, self.last_item:getPositionY()-5, self.equip_container,func, nil, nil, nil, PlayerAction.action, 1)
				end,0.4,1) ]]
				-- playEffectOnce(PathTool.getEffectRes(269), self.last_item:getPositionX()+165, self.last_item:getPositionY()-5, self.equip_container,func, nil, nil, nil, PlayerAction.action, 1)
			end
			if self.send_comp_ticket == nil then
                self.send_comp_ticket = GlobalTimeTicket:getInstance():add(function()
                    self.is_tab_touch = true
					self.is_selected = true
                    if self.send_comp_ticket ~= nil then
                        GlobalTimeTicket:getInstance():remove(self.send_comp_ticket)
                        self.send_comp_ticket = nil
                    end
                end,1)
            end
    	end
    end,true, 1)

    registerButtonEventListener(self.btn_add, function()
    	self.composite_number = self.composite_number + 1
    	self.text_Field:setString(self.composite_number)
		self.bar_num_up:setString(self.composite_number)

    	local list = eqm_comp_list[self.cur_index][self.touch_comp_base].expend
	    local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS,list[1][1])
		self.gold_num:setString(MoneyTool.GetMoneyString(list[2][2]*self.composite_number))
		self.compCoinNumber = list[2][2]*self.composite_number
	    self:getGoldBGSize()
	  	local composite = math.floor(num/list[1][2])
    	if self.composite_number >= composite then
    		self:setTouchEnable_Add(true)
			self:setTouchEnable_Max(true)
    		self:setTouchEnable_Redu(false)
    	end
    end,true, 1)

	registerButtonEventListener(self.btn_max, function()
		local list = eqm_comp_list[self.cur_index][self.touch_comp_base].expend
	    local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS,list[1][1])
		local composite = math.floor(num/list[1][2])

    	self.composite_number = composite
    	self.text_Field:setString(self.composite_number)
		self.bar_num_up:setString(self.composite_number)

  
		self.gold_num:setString(MoneyTool.GetMoneyString(list[2][2]*self.composite_number))
		self.compCoinNumber = list[2][2]*self.composite_number
	    self:getGoldBGSize()

		self:setTouchEnable_Add(true)
			self:setTouchEnable_Max(true)
    		self:setTouchEnable_Redu(false)
    	
    end,true, 1)

    registerButtonEventListener(self.btn_redu, function()
    	self.composite_number = self.composite_number - 1
		self.text_Field:setString(self.composite_number)
		self.bar_num_up:setString(self.composite_number)

		local list = eqm_comp_list[self.cur_index][self.touch_comp_base].expend

		self.gold_num:setString(MoneyTool.GetMoneyString(list[2][2]*self.composite_number))
		self.compCoinNumber = list[2][2]*self.composite_number
	    self:getGoldBGSize()

	    local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS,list[1][1])
	    local composite = math.floor(num/list[1][2])
	    if self.composite_number < composite then
	    	self:setTouchEnable_Add(false)
			self:setTouchEnable_Max(false)
    		self:setTouchEnable_Redu(false)
	    end
    	if self.composite_number <= 1 then
    		self:setTouchEnable_Add(false)
			self:setTouchEnable_Max(false)
    		self:setTouchEnable_Redu(true)
    	end
    end,true, 1)
end

function ForgeHouseWindow:releaseCompositeEffect()
	if self.composite_effect ~= nil then
        GlobalTimeTicket:getInstance():remove(self.composite_effect)
        self.composite_effect = nil
    end
end

function ForgeHouseWindow:register_event()
	self:addGlobalEvent(ForgeHouseEvent.Composite_Result, function()
		self.is_tab_touch = true
		self.is_selected = true
		self.cur_index = self.cur_index or 1
		local eqm_list = eqm_comp_list[self.cur_index][self.touch_comp_base].expend
		local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS, eqm_list[1][1])
		self.composite_number = math.floor(num/eqm_list[1][2])
		self.gold_num:setString(MoneyTool.GetMoneyString(eqm_list[2][2]*self.composite_number))
		self.compCoinNumber = eqm_list[2][2]*self.composite_number
		self.bar_num:setString(num.."/"..eqm_list[1][2])
		-- self.bar:setPercent(math.floor(num/eqm_list[1][2]*100))
		self.text_Field:setString(self.composite_number)
		self.bar_num_up:setString(self.composite_number)

		self:getGoldBGSize()

		local composite = math.floor(num/eqm_list[1][2])
		if self.composite_number >= composite then
			if self.composite_number <= 1 then
				self:setTouchEnable_Add(true)
	    		self:setTouchEnable_Redu(true)
				self:setTouchEnable_Max(true)
			else
	    		self:setTouchEnable_Add(true)
	    		self:setTouchEnable_Redu(false)
				self:setTouchEnable_Max(true)
	    	end
    	end

    	local list = self.item_scrollview:getItemList()
    	local status = false
		for k, v in pairs(list) do
			local data = v:getData()
			if data and v then
		    	local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS,data.expend[1][1])
		    	if num and data.expend[1][2] then
					if num >= data.expend[1][2] then
						v:setVisibleResPoint1(true)
						status = true
					else
						v:setVisibleResPoint1(false)
					end
				end
			end
		end
		-- self.tab_list[self.cur_index].redpoint:setVisible(status)
		self.tab_redstatus[self.cur_index]=status

    end)

    -- 符文祝福红点
    -- self:addGlobalEvent(HeroEvent.Artifact_Lucky_Red_Event, function ( )
    -- 	local object = self.top_tab_list[ForgeHouseConst.Tab_Index.Artifact]
    -- 	if object then
    -- 		local red_status = HeroController:getInstance():getModel():getArtifactLuckyRedStatus()
    -- 		object.tips:setVisible(red_status)
    -- 	end
    -- end)

    registerButtonEventListener(self.close_btn, function()
        controller:openForgeHouseView(false)
    end,true, 2)

	registerButtonEventListener(self.select_btn, function(sender)
		-- local point = sender:getTouchEndPosition()
		local point =cc.p(self.select_btn:getPositionX(),self.select_btn:getPositionY()) 
        controller:openForgehouseSelectPanel("",point,nil,nil,self.cur_index,self.tab_redstatus)
    end,true, 2)

    -- for k, object in pairs(self.top_tab_list) do
	-- 	if object.tab_btn then
	-- 		object.tab_btn:addTouchEventListener(function(sender, event_type)
	-- 			if event_type == ccui.TouchEventType.ended then
	-- 				playTabButtonSound()
	-- 				self:changeSelectedTab(object.index)
	-- 			end
	-- 		end)
	-- 	end
    -- end
end

-- 切换顶部标签页
function ForgeHouseWindow:changeSelectedTab( index,sub_sub_type )
	if self.tab_object ~= nil and self.tab_object.index == index then return end

    -- if self.tab_object then
    --     self.tab_object.select_bg:setVisible(false)
    --     self.tab_object = nil
    -- end
    -- self.tab_object = self.top_tab_list[index]
    -- if self.tab_object then
    --     self.tab_object.select_bg:setVisible(true)
    -- end


	if index == ForgeHouseConst.Tab_Index.Equip then
		self.equip_container:setVisible(true)
		self.artifact_container:setVisible(false)
		if not self.init_equip then
			self:initEquipLayout()
			self.init_equip = true
		end
	elseif index == ForgeHouseConst.Tab_Index.Artifact then
		self.equip_container:setVisible(false)
		self.artifact_container:setVisible(true)
		if not self.init_artifact then
			self.init_artifact = true
			self.artifact_layout = ForgeArtifactPanel.new(sub_sub_type)
			self.artifact_container:addChild(self.artifact_layout)
		end
	end
end

function ForgeHouseWindow:openRootWnd(index,sub_sub_type)
	index = index or ForgeHouseConst.Tab_Index.Equip
	self:changeSelectedTab(index,sub_sub_type)
end

--红点
function ForgeHouseWindow:initRedPoint()
	for i=1,4 do
		local list = eqm_comp_list[i]
		local status = false
		for k,data in pairs(list) do
			if data then
				local num = backpackModel:getPackItemNumByBid(BackPackConst.Bag_Code.EQUIPS,data.expend[1][1])
				if num and data.expend[1][2] then
					if num >= data.expend[1][2] then
						status = true
						break
					end
				end
			end
		end
		print("------status----2-------------",status)
		print("------status---cur_index-------------",self.cur_index)

		-- self.tab_list[i].redpoint:setVisible(status)
		self.tab_redstatus[i]=status
	end
	self:setTabListStatus()

end

function ForgeHouseWindow:close_callback()
	self:releaseCompositeEffect()
	if self.send_comp_ticket ~= nil then
        GlobalTimeTicket:getInstance():remove(self.send_comp_ticket)
        self.send_comp_ticket = nil
    end
    
	if self.item_scrollview then 
       self.item_scrollview:DeleteMe()
       self.item_scrollview = nil
    end
    if self.artifact_layout then
    	self.artifact_layout:DeleteMe()
    	self.artifact_layout = nil
    end
    if self.cur_item then 
       self.cur_item:DeleteMe()
       self.cur_item = nil
    end
    if self.last_item then 
       self.last_item:DeleteMe()
       self.last_item = nil
    end
    if self.item_load then 
        self.item_load:DeleteMe()
        self.item_load = nil
    end
    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
    end

    controller:openForgeHouseView(false)
end

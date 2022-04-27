-- --------------------------------------------------------------------
-- Vip主界面
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
VipMainWindow = VipMainWindow or BaseClass(BaseView)

function VipMainWindow:__init()
    self.ctrl = VipController:getInstance()
    self.model = self.ctrl:getModel()
    self.role_vo = RoleController:getInstance():getRoleVo()

    self.win_type = WinType.Full    
    self.layout_name = "vip/vip_main_window"       	

    self.res_list = {
        { path = PathTool.getSingleImgForDownLoad("bigbg","bigbg_24"), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg","bigbg_23",true), type = ResourcesType.single },
        { path = PathTool.getPlistImgForDownLoad("vip","vip"), type = ResourcesType.plist },
        { path = PathTool.getSingleImgForDownLoad("bigbg","txt_cn_bigbg_23"), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg","txt_cn_bigbg_24"), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg/vip","hl_vip_1000",false), type = ResourcesType.single },
        { path = PathTool.getSingleImgForDownLoad("bigbg/vip","hl_vip_1001",false), type = ResourcesType.single },
    }

    self.tab_array = {
        {label=TI18N("充值"), index=VIPTABCONST.CHARGE, status=true,notice=""},
        --{label=TI18N("累充返利"), index=VIPTABCONST.ACC_CHARGE, status=true,notice=""},
        --{label=TI18N("VIP"), index=VIPTABCONST.VIP, status=true,notice=""},
        --{label=TI18N("每日礼包"), index=VIPTABCONST.DAILY_GIFT, status=true,notice=""},
        --{label=TI18N("特权商城"), index=VIPTABCONST.PRIVILEGE, status=true,notice=""}
    }
    self.tab_btn_list = {}
    self.view_list = {}
    self.pre_panel = nil

    self.cur_index = nil
    self.cur_tab = nil
    self.init_vip_lev = self.role_vo.vip_lev --初始化VIP
end

function VipMainWindow:open_callback()
    self.background = self.root_wnd:getChildByName("background")
    self.background:loadTexture(PathTool.getSingleImgForDownLoad("bigbg","bigbg_23",true), LOADTEXT_TYPE)
    self.background:setScale(display.getMaxScale())
    self.mainContainer = self.root_wnd:getChildByName("main_container")
    self:playEnterAnimatianByObj(self.mainContainer, 1)
    self.main_panel = self.mainContainer:getChildByName("main_panel")

    self.tableContainer = self.mainContainer:getChildByName("tab_container")
    local con_size = self.tableContainer:getContentSize()
    self.tab_scrollView = createScrollView(con_size.width, con_size.height, 0, 0, self.tableContainer, ccui.ScrollViewDir.horizontal)
    local max_width = math.max(con_size.width, #self.tab_array*155)
    self.tab_scrollView:setInnerContainerSize(cc.size(max_width, con_size.height))
    for i=1, #self.tab_array do
        local tab_data = self.tab_array[i]
        local tab_btn = self.tab_btn_list[tab_data.index]
        if tab_btn == nil then
            tab_btn = VipMainTabBtn.new(handler(self, self.changeTabView))
            self.tab_scrollView:addChild(tab_btn)
            self.tab_btn_list[tab_data.index] = tab_btn
            if MAKELIFEBETTER == true then
                tab_btn:setVisible(false)
            end
        end
        tab_btn:setPosition(cc.p(98+(i-1)*160, 89))
        tab_btn:setData(tab_data)
    end

    local list = Config.VipData.data_get_reward
    for i,v in ipairs(list) do
        local status = VipController:getInstance():getPrivilegeRedpoint(v.lev)
        if status == nil and v.lev <= self.role_vo.vip_lev then
            VipController:getInstance():setPrivilegeRedpoint(v.lev, true)
        end
    end

    self.titleCon = self.mainContainer:getChildByName("titleCon")
    self.loadingbar = self.titleCon:getChildByName("loadingbar")
    self.loadingbar:setScale9Enabled(true)
    self.loadingbar:setPercent(0)
    self.exp = self.titleCon:getChildByName("exp")
    self.exp:setString("0/0")

    self.now_vip = CommonNum.new(22, self.titleCon, 1, -2, cc.p(0.5, 0.5))
    self.now_vip:setPosition(36, 130)

    self.next_vip = CommonNum.new(22, self.titleCon, 1, -2, cc.p(0, 0.5))
    self.next_vip:setPosition(480, 194)

    self.charge_num = CommonNum.new(21, self.titleCon, 1, -2, cc.p(0, 0.5))
    self.charge_num:setPosition(95, 192)

    self.yuan = self.titleCon:getChildByName("yuan")
    self.Sprite_6 = self.titleCon:getChildByName("Sprite_6")
    self.Sprite_6_0 = self.titleCon:getChildByName("Sprite_6_0")

    self.banner_image = self.mainContainer:getChildByName("banner_image")
    self.banner_image:ignoreContentAdaptWithSize(true)

    self.container_1 = self.main_panel:getChildByName("container_1")
    self.container = self.main_panel:getChildByName("container")

    self.close_btn = self.main_panel:getChildByName("close_btn")

    self:updateBar()
    -- self:updateRed()
    self:setVisibleVIPTabRedPoint()

    self:resetTitlePos()

    self:setTabRedStatus(self.model:getIsGetAcc(),VIPTABCONST.ACC_CHARGE)
    self:updateDailyAwardRed()
    self:updatePrivilegeTabRedPoint()

    -- 提审服隐藏掉一些显示
    if MAKELIFEBETTER == true then
        local childer_list = self.titleCon:getChildren()
        for k,v in pairs(childer_list) do
            v:setVisible(false)
        end
        self.banner_image:setVisible(false)
    end
end

function VipMainWindow:updateBar()
    local config = Config.VipData.data_get_reward[self.role_vo.vip_lev]
    local max_lev = Config.VipData.data_get_reward_length-1
    local next_config = Config.VipData.data_get_reward[self.role_vo.vip_lev+1]
    if config then
        if next_config then
            self.loadingbar:setPercent(self.role_vo.vip_exp/next_config.gold*100)
            self.exp:setString(self.role_vo.vip_exp.."/"..next_config.gold)
            self.next_vip:setNum(self.role_vo.vip_lev+1)
            self.charge_num:setNum(next_config.gold-self.role_vo.vip_exp)
        else
            self.loadingbar:setPercent(100)
            self.exp:setString(config.gold.."/"..config.gold)
            self.next_vip:setNum(self.role_vo.vip_lev)
            self.charge_num:setNum(0)
        end
    else
        self.loadingbar:setPercent(100)
        self.exp:setString(Config.VipData.data_get_reward[max_lev].gold.."/"..Config.VipData.data_get_reward[max_lev].gold)
        self.charge_num:setNum(0)
        self.next_vip:setNum(self.role_vo.vip_lev)
    end
    self.charge_num:setCallBack(function()
            self:resetTitlePos()
        end)
    if self.charge_num:getContentSize().width>0 then
        self.yuan:setPositionX(self.charge_num:getPositionX()+self.charge_num:getContentSize().width+10)
    end

    self.now_vip:setNum(self.role_vo.vip_lev)

    local num = 1
    if self.role_vo.vip_lev+1 >= max_lev then
        num = max_lev
    else
        num = self.role_vo.vip_lev+1
    end
    if MAKELIFEBETTER == true then 
        return
    end
    if not self.next_vip_desc then
        self.next_vip_desc = createSprite(nil, 295, 123, self.titleCon, cc.p(0.5, 0.5))
    end
    local cur_res = PathTool.getSingleImgForDownLoad("bigbg/vip", string.format("txt_cn_vip_lev_%d",num))
    if self.next_res ~= cur_res then
        self.next_res = cur_res
        if not self.vip_desc_load then
            self.vip_desc_load = createResourcesLoad(cur_res, ResourcesType.single, function()
                    if self.next_vip_desc then
                        loadSpriteTexture(self.next_vip_desc, cur_res, LOADTEXT_TYPE)
                    end
                end, self.vip_desc_load)
        else
            local res_id = PathTool.getSingleImgForDownLoad("bigbg/vip", string.format("txt_cn_vip_lev_%d",num))
            if self.next_vip_desc then
                loadSpriteTexture(self.next_vip_desc, res_id, LOADTEXT_TYPE)
            end
        end
    end
end

function VipMainWindow:resetTitlePos()
    self.yuan:setPositionX(self.charge_num:getPositionX()+self.charge_num:getContentSize().width+10)
    self.Sprite_6:setPositionX(self.yuan:getPositionX()+self.yuan:getContentSize().width+5)
    self.Sprite_6_0:setPositionX(self.Sprite_6:getPositionX()+self.Sprite_6:getContentSize().width+10)
    self.next_vip:setPositionX(self.Sprite_6_0:getPositionX()+self.Sprite_6_0:getContentSize().width+5)
end

function VipMainWindow:openRootWnd(index,sub_type)
    index = index or 1
    self.sub_type = sub_type
    -- 提审服始终是第一个
    if MAKELIFEBETTER == true then
        index = 1
    end
    self:changeTabView(index)
end

function VipMainWindow:changeTabView( index )
    if self.cur_index == index then return end
    if self.cur_tab ~= nil then
        self.cur_tab:setSelect(false)
    end
    if self.pre_panel ~= nil then
        if self.pre_panel.setVisibleStatus then
            self.pre_panel:setVisibleStatus(false)
        end
    end
    self.cur_index = index
    self.cur_tab = self.tab_btn_list[index]
    if self.cur_tab == nil then return end

    self.cur_tab:setSelect(true)
    self.pre_panel = self:createSubPanel(self.cur_tab.tab_type)
    if self.pre_panel ~= nil then
        if self.pre_panel.setVisibleStatus then
            self.pre_panel:setVisibleStatus(true)
        end

        if index == VIPTABCONST.VIP then
            callFunc("enter_store")
        end
    end

    -- 特权礼包红点点击则消失
    if index == VIPTABCONST.PRIVILEGE and self.cur_tab:getRedTipsStatus() then
        self:updatePrivilegeTabRedPoint()
        -- 这里不知道为啥会有俩个红点控制
        self.ctrl:setTipsVIPStstus(VIPREDPOINT.PRIVILEGE, false)
        self.ctrl:setTipsGiftStatus(VIPREDPOINT.PRIVILEGE, false)
    end
end

function VipMainWindow:createSubPanel( index )
    local panel = self.view_list[index]
    self.container_1:setVisible(index == VIPTABCONST.ACC_CHARGE or index == VIPTABCONST.CHARGE or index == VIPTABCONST.DAILY_GIFT or index == VIPTABCONST.PRIVILEGE)
    self.container:setVisible(index == VIPTABCONST.VIP)
    self.banner_image:setVisible((not MAKELIFEBETTER) and (index == VIPTABCONST.DAILY_GIFT or index == VIPTABCONST.PRIVILEGE))
    self.titleCon:setVisible(index == VIPTABCONST.VIP or index == VIPTABCONST.ACC_CHARGE or index == VIPTABCONST.CHARGE)

    local banner_res 
    if index == VIPTABCONST.DAILY_GIFT then
        banner_res = PathTool.getSingleImgForDownLoad("bigbg", "txt_cn_bigbg_24",false)
    elseif index == VIPTABCONST.PRIVILEGE then
        banner_res = PathTool.getSingleImgForDownLoad("bigbg", "txt_cn_bigbg_23",false)
    end
    if banner_res then
        self.banner_image:loadTexture(banner_res, LOADTEXT_TYPE)
    end

    if panel == nil then
        if index == VIPTABCONST.VIP then --vip特权
            panel = VipPanel.new()
            panel:setData(self.sub_type)
            self:addChild(panel)
            
        elseif index == VIPTABCONST.ACC_CHARGE then --累冲
            panel = AccChargePanel.new()
            self.container_1:addChild(panel)
        elseif index == VIPTABCONST.CHARGE then --充值 
            panel = ChargePanel.new()
            self.container_1:addChild(panel)
            self.view_list[index] = panel
        elseif index == VIPTABCONST.DAILY_GIFT then -- 每日礼包
            panel = DailyGiftPanel.new()
            self.container_1:addChild(panel)
        elseif index == VIPTABCONST.PRIVILEGE then -- 特权商城
            panel = PrivilegePanel.new()
            self.container_1:addChild(panel)
        end

    end
    return panel
end

function VipMainWindow:register_event()
    
    registerButtonEventListener(self.titleCon, function()
            local panel = VipPanel.new()
            panel:setData(self.sub_type)
            self:addChild(panel)
        end ,false)
    
    registerButtonEventListener(self.close_btn, function()
            self.ctrl:openVipMainWindow(false)
        end ,true, 2)

    EventManager:getInstance():Bind(VipEvent.UPDATE_GET_LIST,self,function ()
            -- self:updateRed()
        end)


    if self.role_vo then
        if self.role_update_event == nil then
            self.role_update_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE,function(key,value)
                    if key == "vip_lev" then    
                        self:updateBar()    
                        -- self:updateRed()
                    elseif key == "vip_exp" then
                        self:updateBar()
                    end
                end)
        end
    end
    --更新累充的红点
    EventManager:getInstance():Bind(VipEvent.ACC_RECHARGE_INFO,self,function ()
            self:setTabRedStatus(self.model:getIsGetAcc(),VIPTABCONST.ACC_CHARGE) 
        end)


    --vip自选哪个红点
    EventManager:getInstance():Bind(VipEvent.UPDATA_ITEM_REDPOINT,self,function ()
        end)

    -- VIP..tab红点
    EventManager:getInstance():Bind(VipEvent.SUPRE_CARD_GET,self,function(data)
            self:setVisibleVIPTabRedPoint()
        end)


    -- 每日礼红点
    self:addGlobalEvent(WelfareEvent.Update_Daily_Awawd_Data, function ( )
            self:updateDailyAwardRed()
        end)
    -- 每日礼包新礼包产生红点
    self:addGlobalEvent(WelfareEvent.Update_Daily_Gift_Red_Data, function (  )
            self:updateDailyAwardRed()
        end)

    -- VIP特权礼包
    self:addGlobalEvent(VipEvent.PRIVILEGE_INFO, function ( )
            self:updatePrivilegeTabRedPoint()
        end)
end

function VipMainWindow:setVisibleVIPTabRedPoint()
    local status = self.model:getMonthCard()
    local get_list = self.model:getGetGiftList()
    local item_status = (get_list[self.role_vo.vip_lev]==nil) and self.ctrl:getIsFirst()
    local tab_status = status or item_status
    self:setTabRedStatus(tab_status, VIPTABCONST.VIP) 
end

function VipMainWindow:updatePrivilegeTabRedPoint(  )
    local status = self.model:getPrivilegeRedStatus()
    self:setTabRedStatus(status, VIPTABCONST.PRIVILEGE)
end

-- function VipMainWindow:updateRed()
--     local get_list = self.model:getGetGiftList()
--     local len = tableLen(get_list)
--     -- local status = (get_list[self.role_vo.vip_lev]==nil) and self.ctrl:getIsFirst()
--     -- self:setTabRedStatus(status,VIPTABCONST.VIP)  
-- end

-- 每日礼包按钮红点更新
function VipMainWindow:updateDailyAwardRed(  )
    local red_status = WelfareController:getInstance():getModel():getDailyGiftRedStatus()
    self:setTabRedStatus(red_status, VIPTABCONST.DAILY_GIFT)
end

function VipMainWindow:setTabRedStatus(status, index, num)
    local tab_btn = self.tab_btn_list[index]
    if tab_btn then
        tab_btn:showRedTips(status, num)
    end
end

function VipMainWindow:close_callback()
    for i,v in pairs(self.view_list) do 
        v:DeleteMe()
    end
    self.view_list = nil

    for k,v in pairs(self.tab_btn_list) do
        v:DeleteMe()
        v = nil
    end

    if self.now_vip then
        self.now_vip:DeleteMe()
        self.now_vip = nil
    end

    if self.next_vip then
        self.next_vip:DeleteMe()
        self.next_vip = nil
    end

    if self.charge_num then
        self.charge_num:DeleteMe()
        self.charge_num = nil
    end
    if self.vip_desc_load then
        self.vip_desc_load:DeleteMe()
        self.vip_desc_load = nil
    end

    EventManager:getInstance():UnBind(self)

    if self.role_vo then
        if self.role_update_event ~= nil then
            self.role_vo:UnBind(self.role_update_event)
            self.role_update_event = nil
        end
        self.role_vo = nil
    end

    self.ctrl:openVipMainWindow(false)
end


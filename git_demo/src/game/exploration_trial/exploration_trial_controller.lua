-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
ExplorationTrialController = ExplorationTrialController or BaseClass(BaseController)

function ExplorationTrialController:config()
    self.dispather = EventManager:getInstance()
    self.allRedDatas = {}
end

function ExplorationTrialController:registerEvents()
end

function ExplorationTrialController:registerProtocals()
end

----------- @ 界面相关
-- 打开区场景
function ExplorationTrialController:openMainScene(status, data)
    if status == true then
        if not self.area_scene_wnd then
            self.area_scene_wnd = ExplorationTrialMainWindow.New(data)
        end
        if self.area_scene_wnd:isOpen() == false then
            self.area_scene_wnd:open()
        end
    else
        if self.area_scene_wnd then
            self.area_scene_wnd:close()
            self.area_scene_wnd = nil
        end
    end
end

-- 引导需要
function ExplorationTrialController:getGhostdomSceneRoot(  )
    if self.area_scene_wnd then
        return self.area_scene_wnd.root_wnd
    end
end

--点击区场景建筑(bid对应Config.city_data中的bid)
-- function ExplorationTrialController:onClickGhostdomBuildById(area_type, bid)
--     if area_type == GhostdomConst.Ghostdom_Type then 
--         if bid == 1 then        -- 积分商店
--             MallController:getInstance():openScoreShopWindow(true)
--         elseif bid == 2 then    -- 精灵商店
--             MallController:getInstance():openVarietyStoreWindows(true)
--         elseif bid == 3 then    -- 礼包商店
--             MallController:getInstance():openChargeShopWindow(true)
--         elseif bid == 4 then    -- 皮肤商店
--             MallController:getInstance():openSkinShopWindow(true)
--         elseif bid == 5 then    -- 圣羽商店
--             MallController:getInstance():openPlumeShopWindow(true)
--         elseif bid == 6 then    -- 杂货店
--             MallController:getInstance():openMallPanel(true)
--         end
--     end
-- end

function ExplorationTrialController:onClickGhostdomBuildById(area_type, bid)
    local build_type = GhostdomConst.Build_Type
    if area_type == GhostdomConst.Ghostdom_Type then 
        if bid == build_type.ghostdom then        -- 灵界
            PlanesafkController:getInstance():sender28601()
        elseif bid == build_type.shop then    -- 商店
            MallController:getInstance():openMallPanel(true)
        elseif bid == build_type.reward then    -- 悬赏
            local lev_config = Config.ShippingData.data_const["guild_lev"]
            local role_vo = RoleController:getInstance():getRoleVo()
            if lev_config and role_vo and lev_config.val <= role_vo.lev then
                VoyageController:getInstance():openVoyageMainWindow(true)
            elseif lev_config then
                message(lev_config.desc)
            end
        elseif bid == build_type.spirit then    -- 灵修卷
            SpiritController:getInstance():openMainView(true)
        elseif bid == build_type.battle then    -- 竞技场
            CrossgroundController:getInstance():openCrossGroundMainWindow(true)
        elseif bid == build_type.guild then    -- 公会管理员
            GuildController:getInstance():checkOpenGuildWindow()
            -- 清楚主界面上面的红点
            GuildskillController:getInstance():getModel():clearGuildSkillIconRed()
        elseif bid == build_type.temper then    -- 灵魂阁
            MainuiController:getInstance():requestOpenBattleRelevanceWindow(BattleConst.Fight_Type.Endless)
        end
    end
end

--红点数据保存住，

function ExplorationTrialController:setBuildRedStatus( build_id, red_data )

    local selfRedData = self.allRedDatas[build_id]
    if red_data then
        selfRedData = selfRedData or {}
        local is_have = false

        if red_data.bid ~= nil then
            for _,n in pairs(selfRedData) do
                if n.bid == red_data.bid then
                    n.status = red_data.status
                    is_have = true
                    break
                end
            end
        else
            for i,data in pairs(red_data) do
                for _,n in pairs(selfRedData) do
                    if n.bid == data.bid then
                        n.status = data.status
                        is_have = true
                        break
                    end
                end
            end
        end
        if not is_have then
            table.insert( selfRedData, red_data )
        end
    else
        selfRedData = {}
    end

    self.allRedDatas[build_id] = selfRedData

    if self.area_scene_wnd then
        self.area_scene_wnd:setBuildRedStatus(build_id)
    end

    for i,v in pairs(self.allRedDatas) do
        local is_lock,desc = RoleController:getInstance():checkEnterIsLock(i)
        if not is_lock then
            for j,data in pairs(v) do
                if data.status == true then
                    MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.ghostdom, true)
                    return
                end
            end
        end
    end


    MainuiController:getInstance():setBtnRedPoint(MainuiConst.btn_index.ghostdom, false)           
end

function ExplorationTrialController:updateRedData( build_id, red_data )
    self.allRedDatas[build_id] = red_data
end

function ExplorationTrialController:getRedData( build_id )
    return self.allRedDatas[build_id]
end



function ExplorationTrialController:__delete()
    self.allRedDatas = {}
end
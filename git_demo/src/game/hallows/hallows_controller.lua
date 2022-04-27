-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
HallowsController = HallowsController or BaseClass(BaseController)

function HallowsController:config()
    self.model = HallowsModel.New(self)
    self.dispather = EventManager:getInstance()

    self.is_self_handle = false
end

function HallowsController:getModel()
    return self.model
end

function HallowsController:registerEvents()
    EventManager:getInstance():Bind(BackpackEvent.GET_ALL_DATA,self, function(bag_code)

        end)


    self.init_role_event = EventManager:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS,self, function()
            EventManager:getInstance():UnBindEvent(self.init_role_event)
            self.init_role_event = nil

            self.role_vo = RoleController:getInstance():getRoleVo()
            -- 监听金币更新，计算红点
            if not self.role_lev_event and self.role_vo then
                self.role_lev_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value) 
                        if key == "coin" or key =="hallow_refine" or key == "lev" then
                            self.model:checkHallowsRedStatus()
                        end
                    end)
            end

            -- 上线时请求
            --[[self:send24125()
            self:send24128()--]]
        end)


    self.battle_drama_event =EventManager:getInstance():Bind(Battle_dramaEvent.BattleDrama_Update_Max_Id,self, function(max_id)
            self:requestInitProtocals(max_id)
        end)


    EventManager:getInstance():Bind(BackpackEvent.ADD_GOODS,self, function(bag_code, item_list) 
            if bag_code ~= BackPackConst.Bag_Code.BACKPACK then return end
            self:checkNeedUpdateRedStatus(item_list)
        end)


    EventManager:getInstance():Bind(BackpackEvent.MODIFY_GOODS_NUM,self, function(bag_code, item_list) 
            if bag_code ~= BackPackConst.Bag_Code.BACKPACK then return end
            self:checkNeedUpdateRedStatus(item_list)
        end)


    EventManager:getInstance():Bind(BackpackEvent.DELETE_GOODS,self, function(bag_code, item_list) 
            if bag_code ~= BackPackConst.Bag_Code.BACKPACK then return end
            self:checkNeedUpdateRedStatus(item_list)
        end)


    EventManager:getInstance():Bind(LoginEvent.RE_LINK_GAME,self, function()
            self.resonate_data = nil
            self:requestInitProtocals()
            --self:openHallowsMainWindow(false)
        end)

end

--==============================--
--desc:物品变化的时候做处理,如果是自己操作引起的不需要这里判断的,因为那属于自身更新
--@item_list:
--@return 
--==============================--
function HallowsController:checkNeedUpdateRedStatus(item_list)
    if self.is_self_handle == true then
        self.is_self_handle = false
        return
    end
    if item_list == nil or next(item_list) == nil then return end
    for k,v in pairs(item_list) do
        if v.config then
            if v.config.id == 72001 or v.config.id == 72002 or v.config.id == 72003 then
                self.model:checkHallowsRedStatus()
            end
        end
    end
end

function HallowsController:registerProtocals()
    self:RegisterProtocal(24100, "handle24100") -- 圣器基础属性
    self:RegisterProtocal(24101, "handle24101") -- 圣器进阶
    self:RegisterProtocal(24102, "handle24102") -- 圣灵穿戴
    self:RegisterProtocal(24103, "handle24103") -- 圣技升级
    self:RegisterProtocal(24104, "handle24104") -- 使用圣印
    self:RegisterProtocal(24105, "handle24105") -- 共鸣变化
    self:RegisterProtocal(24107, "handle24107") -- 更新圣器
    self:RegisterProtocal(24108, "handle24108") -- 新增圣器,这个时候播放激活特效
    self:RegisterProtocal(24109, "handle24109") -- 新神器激活请求的回调，没啥数据主要根据24108推送过来的数据

    self:RegisterProtocal(24120, "handle24120") -- 圣器任务列表
    self:RegisterProtocal(24121, "handle24121") -- 圣器任务列表
    self:RegisterProtocal(24122, "handle24122") -- 圣器任务列表
    self:RegisterProtocal(24123, "handle24123") -- 神器重铸
    self:RegisterProtocal(24124, "handle24124") -- 是否打开过神器界面

    self:RegisterProtocal(24125, "handle24125") -- 神器幻化数据
    self:RegisterProtocal(24126, "handle24126") -- 更新幻化数据
    self:RegisterProtocal(24127, "handle24127") -- 激活幻化
    self:RegisterProtocal(24128, "handle24128") -- 幻化任务数据
    self:RegisterProtocal(24129, "handle24129") -- 幻化任务数据更新
    self:RegisterProtocal(24130, "handle24130") -- 幻化任务提交
    self:RegisterProtocal(24131, "handle24131") -- 解锁幻化
    self:RegisterProtocal(24132, "handle24132") -- 幻化/取消幻化神器
    self:RegisterProtocal(24133, "handle24133") -- 幻化过期了
    self:RegisterProtocal(24135, "handle24135") -- 神器精炼
end

--==============================--
--desc:监测圣器系统是否解锁
--@return 
--==============================--
function HallowsController:checkIsOpen(show_desc)
    local open_config = Config.FunctionData.data_base[MainuiConst.btn_index.hallows]
    if open_config == nil then return false end

    local is_open = MainuiController:getInstance():checkIsOpenByActivate(open_config.activate)
    if show_desc == true and is_open == false then
        message(open_config.desc)
    end
    return is_open
end

--==============================--
--desc:初始登记请求的一些数据
--@return 
--==============================--
function HallowsController:requestInitProtocals()
    local can_request = self:checkIsOpen()
    if can_request == true then
        if can_request then
            if self.battle_drama_event then
                EventManager:getInstance():UnBind(self.battle_drama_event)
                self.battle_drama_event = nil
            end
        end
        self:requestHallowsInfo()
    end
end

--==============================--
--desc:引导需要
--@return 
--==============================--
function HallowsController:getHallowsRoot()
    if self.hallows_window then
        return self.hallows_window.root_wnd
    end
end

--==============================--
--desc:引导需要
--@return 
--==============================--
function HallowsController:getHallowsActivityRoot()
    if self.activity_window then
        return self.activity_window.root_wnd
    end
end

-- 引导需要
function HallowsController:getHallowsPreviewRoot(  )
    if self.hallows_preview then
        return self.hallows_preview.root_wnd
    end
end


--[[
    @desc: 打开新的神器主界面
]]
function HallowsController:openNewHallowsMainWindow(status)
    if not status then
        if self.new_hallows_window then
            self.new_hallows_window:close()
            self.new_hallows_window = nil
        end
        return
    end

    self.new_hallows_window = NewHallowsMainWindow:New()
    self.new_hallows_window:open()
end
--==============================--
--desc:打开圣器主界面
--@status:
--@return 
--==============================--
function HallowsController:openHallowsMainWindow(status, hallows_id, index, magic_id)
    if not status then
        if self.hallows_window then
            self.hallows_window:close()
            self.hallows_window = nil
        end
    else
        -- 判断开启
        if self:checkIsOpen(true) == false then
            return
        end
        -- 是否打开过神器界面，第一次打开时要打开失落神器界面（引导需要）
        local open_flag = self.model:getHallowsOpenFlag()
        if open_flag == 0 then
            self:requestSignOpenHallows()
            self.model:setOpenHallowsFlag(1)
            self:openHallowsPreviewWindow(true)
            return
        end
        if self.hallows_window == nil then
            -- 如果已经全部激活，则打开神器主界面（包含升级和技能）;否则打开神器任务界面
            if self.model:checkIsHaveAllHallows() then
                self.hallows_window = HallowsMainWindow.New()
            else
                self.hallows_window = HallowsTaskWindow.New()
            end
        end
        self.hallows_window:open(hallows_id, index, magic_id)
    end
end

-- 打开所有神器预览界面
function HallowsController:openHallowsPreviewWindow( status )
    if status == true then
        if self.hallows_preview == nil then
            self.hallows_preview = HallowsPreviewWindow.New()
        end
        self.hallows_preview:open()
    else
        if self.hallows_preview then
            self.hallows_preview:close()
            self.hallows_preview = nil
        end
    end
end

--==============================--
--desc:打开圣器的圣印界面
--@status:
--@data:
--@return 
--==============================--
function HallowsController:openHallowsTraceWindow(status, data)
    if not status then
        if self.trace_window then
            self.trace_window:close()
            self.trace_window = nil
        end
    else
        if data == nil then return end
        if self.trace_window == nil then
            self.trace_window = HallowsTraceWindow.New()
        end
        self.trace_window:open(data)
    end
end

--==============================--
--desc:圣器装备的tips
--@status:
--@data:
--@return 
--==============================--
function HallowsController:openHallowsTips(status, data)
    if not status then
        if self.hallows_tips then
            self.hallows_tips:close()
            self.hallows_tips = nil
        end
    else
        if data == nil then return end
        if self.hallows_tips == nil then
            self.hallows_tips = HallowsTips.New()
        end
        self.hallows_tips:open(data)
    end
end

--==============================--
--desc:圣器激活界面
--@status:
--@data:
--@return 
--==============================--
function HallowsController:openHallowsActivityWindow(status, data, open_type)
    if not status then
        if self.activity_window then
            self.activity_window:close()
            self.activity_window = nil
        end
    else
        if data == nil then return end
        if self.activity_window == nil then
            self.activity_window = HallowsActivityWindow.New()
        end
        self.activity_window:open(data, open_type)
    end
end

--==============================--
--desc:进阶界面
--@status:
--@data:
--@return 
--==============================--
function HallowsController:openHallowsStepUpWindow(status, data)
    if not status then
        if self.step_up_window then
            self.step_up_window:close()
            self.step_up_window = nil
        end

        -- 关闭升阶面板之后,弹出共鸣面板
        if self.resonate_data then
            self:openHallowsResonateUpWindow(true, self.resonate_data)
            self.resonate_data = nil
        end
    else
        if data == nil then return end
        if self.step_up_window == nil then
            self.step_up_window = HallowsStepUpWindow.New()
        end
        self.step_up_window:open(data)
    end
end

-- 打开神器幻化界面
function HallowsController:openHallowsMagicWindow( status, data, id )
    if status == true then
        if self.hallows_magic_view == nil then
            self.hallows_magic_view = HallowsMagicWindow.New()
        end
        if self.hallows_magic_view:isOpen() == false then
            self.hallows_magic_view:open(data, id)
        end
    else
        if self.hallows_magic_view then
            self.hallows_magic_view:close()
            self.hallows_magic_view = nil
        end
    end
end



---------------------------------------------新的神器界面--start------------------------------
---------------------------------------------新的神器界面--start------------------------------
--[[
    点击未解锁弹出的激活弹窗
]]
function HallowsController:openUnlockDialogWindow(status,params)
    if not status then
        if self.hallows_dialog_window then
            self.hallows_dialog_window:close()
            self.hallows_dialog_window = nil
        end
        return
    end
    self.hallows_dialog_window = NewHallowsDialogWindow:New()
    self.hallows_dialog_window:open(params)
end

--通过品质获得图片名字
local quality_list={[1] = "hl_common_509",[2] = "hl_common_509_1",[3] = "hl_common_506",[4] = "hl_common_507",[5] = "hl_common_508"}
local bg_list = {[1] = "hl_artifact_0009",[2] = "hl_artifact_00010",[3] = "hl_artifact_0008",[4] = "hl_artifact_0011",[5] = "hl_artifact_0012"}
local bg_list_2 = {[1] = "hl_common_301",[2] = "hl_common_302",[3] = "hl_common_303",[4] = "hl_common_304",[5] = "hl_common_305"}
local bg_skill = {["active_skill"] = "hl_common_4_26",["passive_skill"] = "hl_common_4_25"}
local name_skill = {["active_skill"] = TI18N("上阵技能"),["passive_skill"] = TI18N("庇护技能")}
function HallowsController:getImageNameByQuality(quality,is_bg)
    if is_bg then return bg_list[quality] end
    return quality_list[quality]
end

function HallowsController:getImageNameByQuality2(quality)
    return bg_list_2[quality]
end

--技能描述里上阵技能底图
function HallowsController:getImageSkillBgBySkillType(skill_type)
    return bg_skill[skill_type],name_skill[skill_type]
end

--打开关闭神器研究界面（详情，强化，升星）
function HallowsController:openHallowsStudyWindow(status,data)
    if not status then
        if self.hallows_study_window then
            self.hallows_study_window:close()
            self.hallows_study_window = nil
        end
        return
    end
    self.hallows_study_window = NewHallowsStudyWindow:New()
    self.hallows_study_window:open(data)
end
---------------------------------------------新的神器界面--end------------------------------
---------------------------------------------新的神器界面--end------------------------------




--==============================--
--desc:共鸣
--@status:
--@data:
--@return 
--==============================--
--[[function HallowsController:openHallowsResonateUpWindow(status, data)
if not status then
    if self.resonate_up_window then
        self.resonate_up_window:close()
        self.resonate_up_window = nil
    end
else
    if self.resonate_up_window == nil then
        self.resonate_up_window = HallowsResonateUpWindow.New()
    end
    self.resonate_up_window:open(data)
end
end --]]

--==============================--
--desc:
--@return 
--==============================--

-----------------新神器-start-----------------
--激活神器
function HallowsController:requestJiHuoHallows(hallows_id)
    local protcal = {}
    protcal.hallows_id = hallows_id
    self:SendProtocal(24109,protcal)
end

--强化 type  1 一键强化 2 升几级
function HallowsController:requestStrengData(type,hallows_id)
    local requst_id = 0
    local protcal = {}
    requst_id = type ==1 and 0 or 0   --
    protcal.hallows_id = hallows_id
    self:SendProtocal(requst_id,protcal)
end



--------------------新神器--end----------------


function HallowsController:requestHallowsInfo()
    self:SendProtocal(24100, {})
    self:SendProtocal(24120, {})
end
function HallowsController:handle24100(data)
    print("+++++========handle24100===神器初始化数据==========+++++++++++")
    self.model:updateHallowsInfo(data)
    EventManager:getInstance():Fire(HallowsEvent.HallowsInitDataEvent)
end

--==============================--
--desc:更新圣器
--@data:
--@return 
--==============================--
function HallowsController:handle24107(data)
    self.model:updateHallowsData(data)

    EventManager:getInstance():Fire(HallowsEvent.HallowsUpdateEvent, data.id)
end

--==============================--
--desc:激活圣器
--@data:
--@return 
--==============================--
function HallowsController:handle24108(data)
    print("=====================handle24108==============")
    self.model:updateHallowsData(data)

    -- 如果是激活了最后一个神器，且神器任务界面正在显示，则切换为神器升级界面
    if self.model:checkIsHaveAllHallows() and self.hallows_window then
        self:openHallowsMainWindow(false)
        self:openHallowsMainWindow(true)
    end
    
    -- 通知面板更新数据
    EventManager:getInstance():Fire(HallowsEvent.HallowsActivityEvent, data.id)

    -- 播放激活特效
    self:openHallowsActivityWindow(true,data)
end

function HallowsController:handle24109(data)
    print("=====================handle24109==============")
    message(data.msg)
    --------------------------新神器新加---------------------
    self:openUnlockDialogWindow(false) --关闭激活弹窗
end

--==============================--
--desc:圣器进阶
--@id:
--@step
--@is_auto:
--@return 
--==============================--
function HallowsController:requestHallowsAdvance(id,step,is_auto)
    self.is_self_handle  = true
    -- local auto_type = 0
    -- if is_auto == true then
    --     auto_type = 1
    -- end
    local protocal = {}
    protocal.id = id
    protocal.step = step
    -- protocal.is_auto = auto_type
    self:SendProtocal(24101, protocal)
end

function HallowsController:handle24101(data)
    message(data.msg)
    -- -- 升阶了   (之前的神器强化逻辑暂时屏蔽)
    -- if data.result == 1 then
    --     self:openHallowsStepUpWindow(true, data.id)
    -- else
    --     self.is_self_handle = false
    -- end 
    self:SendProtocal(24100, {})  --新神器暂时初始化刷新数据，可以让服务器返回单个神器数据替换本地神器数据  就不用再请求初始化了
    EventManager:getInstance():Fire(HallowsEvent.HallowsAdvanceEvent, data.id, data.result)
end

--==============================--
--desc:升级圣器技能
--@id:
--@pos:
--@return 
--==============================--
function HallowsController:requestHallowsSkillUpgrade(hallows_id)
    self.is_self_handle = true
    local protocal = {}
    protocal.hallows_id = hallows_id
    self:SendProtocal(24103, protocal)
end

function HallowsController:handle24103(data)
    message(data.msg)
    if data.result == 1 then
        self:SendProtocal(24100, {}) --请求初始化刷新数据
        --EventManager:getInstance():Fire(HallowsEvent.HallowsSkillUpgradeEvent, data.hallows_id, data.id)
    else
        self.is_self_handle = false
    end
end

--==============================--
--desc:穿戴一件装备
--@hallows_id:
--@item_id:
--@pos:
--@return 
--==============================--
function HallowsController:requestHallowsEquip(hallows_id, item_id, pos)
    self.is_self_handle = true
    hallows_id = hallows_id or 0
    item_id = item_id or 1
    pos = pos or 1
    local protocal = {}
    protocal.hallows_id = hallows_id
    protocal.id = item_id
    protocal.pos = pos
    self:SendProtocal(24102, protocal)
end

function HallowsController:handle24102(data)
    message(data.msg)
    if data.result == 1 then
        EventManager:getInstance():Fire(HallowsEvent.HallowsEqupUpEvent , data.id, data.pos)
    else
        self.is_self_handle = false
    end
end

--==============================--
--desc:使用圣印物品
--@hallows_id:
--@num:
--@return 
--==============================--
function HallowsController:requestUseTraceItem(hallows_id, num)
    self.is_self_handle = true
    hallows_id = hallows_id or 0
    num = num or 1
    local protocal = {}
    protocal.hallows_id = hallows_id
    protocal.num = num
    self:SendProtocal(24104, protocal)
end

function HallowsController:handle24104(data)
    message(data.msg)
    if data.result == 1 then
        self:openHallowsTraceWindow(false)
    else
        self.is_self_handle = false
    end
end

-- 初始化圣器任务列表
function HallowsController:handle24120(data)
    self.model:updateHallowsTask(data.list)
end

-- 圣器任务更新信息
function HallowsController:handle24121(data)
    self.model:updateHallowsTask(data.list)
end

function HallowsController:requestSubmitHallowsTask(id)
    local protocal = {}
    protocal.id = id
    self:SendProtocal(24122, protocal)
end

function HallowsController:handle24122(data)
    message(data.msg)
end

--==============================--
--desc:共鸣变化
--@data:
--@return 
--==============================--
function HallowsController:handle24105(data)
    self.resonate_data = data
    -- self:openHallowsResonateUpWindow(true, data)
end

-- 请求神器重铸
function HallowsController:requestHallowsReset( id )
    local protocal = {}
    protocal.id = id
    self:SendProtocal(24123, protocal)
end

function HallowsController:handle24123( data )
    message(data.msg)
end

-- 请求标记打开神器界面
function HallowsController:requestSignOpenHallows(  )
    self:SendProtocal(24124, {})
end

function HallowsController:handle24124( data )
    if data.is_first then
        self.model:setOpenHallowsFlag(data.is_first)
    end
end

-- 请求神器幻化数据
function HallowsController:send24125(  )
    local protocal = {}
    self:SendProtocal(24125, protocal)
end

function HallowsController:handle24125( data )
    if data then
        self.model:setHallowsMagicData(data.hallows_looks)
    end
end

-- 更新幻化数据
function HallowsController:handle24126( data )
    if data then
        self.model:updateHallowsMagicData(data)
        EventManager:getInstance():Fire(HallowsEvent.UpdateHallowsMagicDataEvent, data.id)
    end
end

-- 幻化激活
function HallowsController:handle24127( data )
    if data then
        self:openHallowsActivityWindow(true, data, HallowsConst.Activity_Type.Magic)
        EventManager:getInstance():Fire(HallowsEvent.HallowsMagicActivityEvent)
    end
end

-- 请求幻化任务数据
function HallowsController:send24128(  )
    local protocal = {}
    self:SendProtocal(24128, protocal)
end

-- 幻化任务数据
function HallowsController:handle24128( data )
    if data then
        self.model:setHallowsMagicTaskData(data.list)
    end
end

-- 幻化任务数据更新
function HallowsController:handle24129( data )
    if data then
        self.model:updateHallowsMagicTaskData(data.list)
        EventManager:getInstance():Fire(HallowsEvent.UpdateHallowsMagicTaskEvent)
    end
end

-- 提交幻化任务
function HallowsController:send24130( id )
    local protocal = {}
    protocal.id = id
    self:SendProtocal(24130, protocal)
end

function HallowsController:handle24130( data )
    if data then
        message(data.msg)
    end
end

-- 解锁幻化
function HallowsController:send24131( id )
    local protocal = {}
    protocal.id = id
    self:SendProtocal(24131, protocal)
end

function HallowsController:handle24131( data )
    if data then
        message(data.msg)
    end
end

-- 幻化/取消幻化神器
function HallowsController:send24132( id, hallows_id, flag )
    local protocal = {}
    protocal.id = id
    protocal.hallows_id = hallows_id
    protocal.flag = flag
    self:SendProtocal(24132, protocal)
end

function HallowsController:handle24132( data )
    if data then
        message(data.msg)
    end
end

-- 幻化过期
function HallowsController:handle24133( data )
    if data then
        self.model:deleteHallowsMagicById(data.id)
        EventManager:getInstance():Fire(HallowsEvent.UpdateHallowsMagicDataEvent, data.id)
    end
end

-- 请求神器精炼
function HallowsController:send24135( hallows_id )
    local protocal = {}
    protocal.hallows_id = hallows_id
    self:SendProtocal(24135, protocal)
end

function HallowsController:handle24135( data )
    if data.msg then
        message(data.msg)
    end
    if data.code == TRUE then
        local new_data = {}
        new_data.id = data.hallows_id
        new_data.refine_lev = data.refine_lev
        self.model:updateHallowsData(new_data)
        EventManager:getInstance():Fire(HallowsEvent.HallowsUpdateEvent, data.hallows_id, true)
    end
end

function HallowsController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
end

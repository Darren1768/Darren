-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
UnionController = UnionController or BaseClass(BaseController)

function UnionController:config()
    self.model = UnionModel.New(self)
    self.dispather = EventManager:getInstance()
end

function UnionController:getModel()
    return self.model
end

function UnionController:registerEvents()
   self.init_role_event = EventManager:getInstance():Bind(EventId.ROLE_CREATE_SUCCESS,self, function()
            EventManager:getInstance():UnBindEvent(self.init_role_event)
            self.init_role_event = nil

            self.role_vo = RoleController:getInstance():getRoleVo()
            if self.role_vo ~= nil then
                self:requestInitProtocal()
                if self.role_assets_event == nil then
                    self.role_assets_event = self.role_vo:Bind(RoleEvent.UPDATE_ROLE_ATTRIBUTE, function(key, value)
                        print("===========lid==================",lid )
                        if key == "lid" then
                            if value == 0 then -- 这个时候表示退帮。或者被提出联盟，或者解散联盟
                                self:openUnionMainWindow(false)             -- 关闭主界面
                                self:openUnionMemberWindow(false)           -- 关闭成员面板
                                self:openUnionDonateWindow(false)           -- 关闭捐献面板
                                HeroController:getInstance():getModel():clearHeroVoDetailedInfo()
                            else
                                -- 有联盟的时候，如果处于初始窗体的时候，就标识申请加入或者创建，这个时候直接打开主ui
                                if self.init_window then
                                    self.request_open_main_window = true
                                    HeroController:getInstance():getModel():clearHeroVoDetailedInfo()
                                end
                                self:openUnionInitWindow(false)             -- 关闭潜在打开的初始窗体
                            end
                            self:requestInitProtocal()
                        elseif key == "position" then
                            self.model:updateMemberByPosition(value)
                        end
                    end)
                end 
            end
        end)
    

    EventManager:getInstance():Bind(LoginEvent.RE_LINK_GAME,self, function()
            self:requestInitProtocal()
        end)
     

    EventManager:getInstance():Bind(RoleEvent.UPDATE_RED_POINT,self, function()
            self:updateSkillFirstRedPoint()
        end)
     
    
end

--==============================--
--desc:登录成功或者断线重连需要请求的一些数据
--@return 
--==============================--
function UnionController:requestInitProtocal()
    if self.role_vo ~= nil then
        if self.role_vo.lid == 0 then       -- 这边自己清理掉本地缓存中的自己联盟信息
            self.model:clearMyUnionInfo()
        else
            -- self:requestUnionDonateProtocal()
            
            self:SendProtocal(29218, {})                -- 本联盟信息
            self:SendProtocal(16900, {})
            if self.role_vo.position ~= UnionConst.post_type.member then
                self:SendProtocal(29273, {})                -- 联盟申请红点
            end

        end
    end 
end

function UnionController:requestUnionDonateProtocal()
    self:SendProtocal(29223, {})                -- 捐献情况
end

function UnionController:registerProtocals()
    self:RegisterProtocal(29200, "handle29200")         -- 创建联盟
    self:RegisterProtocal(29201, "handle29201")         -- 联盟列表
    self:RegisterProtocal(29203, "handle29203")         -- 申请加入联盟
    self:RegisterProtocal(29205, "handle29205")         -- 操作申请成员的列表
    self:RegisterProtocal(29207, "handle29207")         -- 更新申请加入列表
    self:RegisterProtocal(29213, "handle29213")         -- 从联盟中踢人
    self:RegisterProtocal(29214, "handle29214")         -- 退帮
    self:RegisterProtocal(29216, "handle29216")         -- 解散联盟
    self:RegisterProtocal(29218, "handle29218")         -- 本联盟基础信息
    self:RegisterProtocal(29219, "handle29219")         -- 本联盟成员列表
    self:RegisterProtocal(29220, "handle29220")         -- 职位设置
    self:RegisterProtocal(29221, "handle29221")         -- 修改宣言
    self:RegisterProtocal(29222, "handle29222")         -- 设置申请
    self:RegisterProtocal(29223, "handle29223")         -- 玩家基础捐献信息
    self:RegisterProtocal(29224, "handle29224")         -- 捐献返回
    self:RegisterProtocal(29242, "hander29242")         -- 增删更新成员
    self:RegisterProtocal(29258, "handle29258")         -- 联盟招募广告

    self:RegisterProtocal(29265, "handle29265")         -- 弹劾

    self:RegisterProtocal(29268, "handle29268")         -- 修改联盟名字
    self:RegisterProtocal(29273, "handle29273")         -- 联盟申请列表红点

    self:RegisterProtocal(29274, "handle29274")         -- 领取捐献宝箱情况
    self:RegisterProtocal(29275, "handle29275")         -- 更新当前捐献进度值

    self:RegisterProtocal(29276, "handle29276")         -- 欢迎新人

    self:RegisterProtocal(16900, "handle16900")
    self:RegisterProtocal(16901, "handle16901")
    self:RegisterProtocal(16902, "handle16902")
    self:RegisterProtocal(16903, "handle16903")
    self:RegisterProtocal(16904, "handle16904")
    
    self:RegisterProtocal(29277, "handle29277")         -- 联盟日志列表
    self:RegisterProtocal(29278, "handle29278")         -- 新增联盟日志
    self:RegisterProtocal(29279, "handle29279")         -- 联盟一键提醒
    self:RegisterProtocal(29280, "handle29280")         -- 联盟发送邮件

end

--=================buff界面===============----------
function UnionController:openUnionBuffWindow(enable)
    if not enable then
        if self.buff_window ~= nil then
            self.buff_window:close()
            self.buff_window = nil
        end
    else
        if self.buff_window == nil then
            self.buff_window = UnionBuffWindow.New()
        end
        self.buff_window:open()
    end
end
--==============================--
--desc:打开联盟的外部接口，主要是场景图标点击使用的，这里面会判断有没有联盟，从而判断打开窗体
--@index:
--@return 
--==============================--
function UnionController:checkOpenUnionWindow(index)
    print("--------------self.role_vo.lid-------",self.role_vo.lid)
    if self.role_vo  == nil or self.role_vo.lid == 0 then
        self:openUnionInitWindow(true, index)
    else
        self:openUnionMainWindow(true, index)
    end
end

--==============================--
--desc:打开联盟的初始窗体，这个在没有联盟的时候默认打开
--@status:
--@index:
--@return 
--==============================--
function UnionController:openUnionInitWindow(status, index)
    if not status then
        if self.init_window ~= nil then
            self.init_window:close()
            self.init_window = nil
        end
    else
        if self.init_window == nil then
            self.init_window = UnionInitWindow.New()
        end
        self.init_window:open(index)
    end
end

--==============================--
--desc:引导需要
--@return 
--==============================--
function UnionController:getUnionInitRoot()
    if self.init_window then
        return self.init_window.root_wnd
    end
end

--==============================--
--desc:打开联盟的主窗体，这个是有联盟的时候默认打开的
--@status:
--@index:
--@return 
--==============================--
function UnionController:openUnionMainWindow(status, index)
    if not status then
        if self.main_window ~= nil then
            self.main_window:close()
            self.main_window = nil
        end
    else
        if self.main_window == nil then
            self.main_window = UnionNewMainWindow.New()
        end
        self.main_window:open(index) 
    end
end

--==============================--
--desc:创建联盟
--@status:
--@return 
--==============================--
function UnionController:openUnionCreatWindow(status)
    if not status then
        if self.create_window ~= nil then
            self.create_window:close()
            self.create_window = nil
        end
    else
        if self.create_window == nil then
            self.create_window = UnionCreateWindow.New()
        end
        self.create_window:open()
    end 
end
--==============================--
--desc:打开或者关闭成员列表
--@status:
--@return 
--==============================--
function UnionController:openUnionMemberWindow(status, index)
    if not status then
        if self.member_window ~= nil then
            self.member_window:close()
            self.member_window = nil
        end
    else
        if self.member_window == nil then
            self.member_window = UnionMemberWindow.New()
        end
        if self.member_window:isOpen() == false then
            self.member_window:open(index)
        end
    end 
end

--==============================--
--desc:联盟捐献面板
--@status:
--@return 
--==============================--
function UnionController:openUnionDonateWindow(status)
    if not status then
        if self.donate_window ~= nil then
            self.donate_window:close()
            self.donate_window = nil
        end
    else
        if self.role_vo == nil or not self.role_vo:isHasUnion() then
            message(TI18N("您暂时还没有加入联盟"))
            return
        end
        local bool, desc = RoleController:getInstance():checkEnterIsLock(GhostdomConst.Build_Type.union)
        if bool == true then
            message(desc)
            return
        end

        if self.donate_window == nil then
            self.donate_window = UnionDonateWindow.New()
        end 
        self.donate_window:open() 
    end
end

--==============================--
--desc:打开联盟申请界面
--@status:
--@return 
--==============================--
function UnionController:openUnionApplyWindow(status)
    if not status then
        if self.apply_window ~= nil then
            self.apply_window:close()
            self.apply_window = nil
        end
    else
        if self.apply_window == nil then
            self.apply_window = UnionApplyWindow.New()
        end
        self.apply_window:open()
    end 
end

--打开联盟活跃面板
function UnionController:openUnionActionGoalWindow(status)
    if not status then
        if self.goal_window ~= nil then
            self.goal_window:close()
            self.goal_window = nil
        end
    else
        if self.goal_window == nil then
            self.goal_window = UnionActionGoalWindow.New()
        end
        self.goal_window:open()
    end 
end

-- 打开联盟活跃图标选择界面
function UnionController:openUnionActiveIconWindow( status )
    if status == true then
        if not self.active_icon_wnd then
            self.active_icon_wnd = UnionActiveIconWindow.New()
        end
        if self.active_icon_wnd:isOpen() == false then
            self.active_icon_wnd:open()
        end
    else
        if self.active_icon_wnd then
            self.active_icon_wnd:close()
            self.active_icon_wnd = nil
        end
    end
end

--打开联盟活跃奖励预览面板
function UnionController:openUnionRewardWindow(status)
    if not status then
        if self.reward_window ~= nil then
            self.reward_window:close()
            self.reward_window = nil
        end
    else
        if self.reward_window == nil then
            self.reward_window = UnionRewardWindow.New()
        end
        self.reward_window:open()
    end 
end
--==============================--
--desc:联盟申请设置面板
--@status:
--@return 
--==============================--
function UnionController:openUnionApplySetWindow(status)
    if not status then
        if self.apply_set_window ~= nil then
            self.apply_set_window:close()
            self.apply_set_window = nil
        end
    else
        if self.apply_set_window == nil then
            self.apply_set_window = UnionApplySetWindow.New()
        end
        self.apply_set_window:open()
    end 
end

--==============================--
--desc:职位任免和踢人面板
--@status:
--@list:
--@return 
--==============================--
function UnionController:openUnionOperationPostWindow(status, data)
    if not status then
        if self.operation_post_window ~= nil then
            self.operation_post_window:close()
            self.operation_post_window = nil
        end
    else
        if data == nil then return end
        if self.operation_post_window == nil then
            self.operation_post_window = UnionOperationPostWindow.New()
        end
        if self.operation_post_window:isOpen() == false then
            self.operation_post_window:open(data)
        end
    end 
end

--弹劾帮主
function UnionController:openUnionImpeachPostWindow(status)
    if status == true then
        if self.impeach_post_window == nil then
            self.impeach_post_window = UnionImpeachPostWindow.New()
        end
        self.impeach_post_window:open()
    else
        if self.impeach_post_window ~= nil then
            self.impeach_post_window:close()
            self.impeach_post_window = nil
        end
    end 
end

--==============================--
--desc:联盟改名面板
--@status:
--@return 
--==============================--
function UnionController:openUnionChangeNameWindow(status)
    if not status then

        if self.change_name_window ~= nil then
            self.change_name_window:close()
            self.change_name_window = nil
        end
    else
        if isQingmingShield and isQingmingShield() then
            return
        end
        if self.change_name_window == nil then
            self.change_name_window = UnionChangeNameWindow.New()
        end
        self.change_name_window:open()
    end 
end

--==============================--
--desc:联盟宣言修改
--@status:
--@return 
--==============================--
function UnionController:openUnionChangeSignWindow(status)
    if not status then
        if self.change_sign_window ~= nil then
            self.change_sign_window:close()
            self.change_sign_window = nil
        end
    else
        if self.change_sign_window == nil then
            self.change_sign_window = UnionChangeSignWindow.New()
        end
        self.change_sign_window:open()
    end 
end

--==============================--
--desc:联盟发送邮件
--@status:
--@return 
--==============================--
function UnionController:openUnionSendMailWindow(status)
    if not status then
        if self.send_mail_window ~= nil then
            self.send_mail_window:close()
            self.send_mail_window = nil
        end
    else
        if self.send_mail_window == nil then
            self.send_mail_window = UnionSendMailWindow.New()
        end
        self.send_mail_window:open()
    end 
end

--==============================--
--desc:联盟公告
--@status:
--@return 
--==============================--
function UnionController:openUnionNoticeWindow(status)
    if not status then
        if self.notice_window ~= nil then
            self.notice_window:close()
            self.notice_window = nil
        end
    else
        if self.notice_window == nil then
            self.notice_window = UnionNoticeWindow.New()
        end
        self.notice_window:open()
    end 
end

--==============================--
--desc:请求创建联盟
--@name:联盟名字
--@sign:宣言
--@apply_type:申请类型(0:自动审批 1:手动审批 2:不允许申请)
--@apply_lev:最小等级要求
--@return 
--==============================--
function UnionController:requestCreateUnion(name, sign, apply_type, apply_lev, power)
    apply_type = apply_type or 0
    apply_lev = apply_lev or 1
    local protocal = {}
    protocal.name = name
    protocal.sign = sign
    protocal.apply_type = apply_type 
    protocal.apply_lev = apply_lev
    protocal.apply_power = power
    print("++++++++++=requestCreateUnion============")
    printLuaTable(protocal)
    self:SendProtocal(29200, protocal) 
end

--==============================--
--desc:创建联盟返回
--@data:
--@return 
--==============================--
function UnionController:handle29200(data)
    print("++++++++++=handle29200============")
    printLuaTable(data)
    message(data.msg)
    if data.code == TRUE then
    end
end

--==============================--
--desc:请求联盟列表
--@page:页码
--@flag:是否显示满人的联盟 0:不显示 1:显示
--@num:每页显示条数
--@name:如果不为“”表示是搜索
--@return 
--==============================--
function UnionController:requestUnionList(page, flag, num, name)
    page = page or 0
    flag = flag or 1
    num = num or 0
    name = name or ""
    local protocal = {}
    protocal.page = page
    protocal.flag = flag
    protocal.num = num
    protocal.name = name
    print("===============requestUnionList=====29201=============")
    printLuaTable(protocal)

    self:SendProtocal(29201, protocal) 
end

--==============================--
--desc:获取联盟列表
--@data:
--@return 
--==============================--
function UnionController:handle29201(data)
    print("--------handle29201----------------------")
    printLuaTable(data)
    self.model:updateUnionList(data.name, data.guilds)
end

--==============================--
--desc:申请加入联盟
--@lid:
--@lsrv_id:
--@type:
--@return 
--==============================--
function UnionController:requestJoinUnion(lid, lsrv_id, type)
    if lid == nil or lsrv_id == nil then return end
    local protocal = {}
    type = type or 1
    protocal.lid = lid
    protocal.lsrv_id = lsrv_id
    protocal.type = type
    print("--------requestJoinUnion----------------------")
    printLuaTable(protocal)
    self:SendProtocal(29203, protocal) 
end

--==============================--
--desc:请求加入联盟返回
--@data:
--@return 
--==============================--
function UnionController:handle29203(data)
    print("--------handle29203----------------------")
    printLuaTable(data)
    message(data.msg)
    if data.code == TRUE then
        self.model:updateUnionApplyStatus(data.lid, data.lsrv_id, data.is_apply)
    end
end

--==============================--
--desc:更新自己联盟的信息
--@data:
--@return 
--==============================--
function UnionController:handle29218(data)
    print("============handle29218=====================")
    self.model:updateMyUnionInfo(data)

    -- 新申请立马进帮，或者创建联盟的时候，直接打开主界面
    if self.request_open_main_window == true then
        self.request_open_main_window = false
        self:openUnionMainWindow(true)
    end
end

--弹劾帮主
function UnionController:send29265()
    self:SendProtocal(29265, {})
end
function UnionController:handle29265(data)
    -- dump(data)
    message(data.msg)
end

--==============================--
--desc:请求联盟成员列表
--@return 
--==============================--
function UnionController:requestUnionMemberList()
    self:SendProtocal(29219, {})
end

--==============================--
--desc:更新整个联盟成员列表
--@data:
--@return 
--==============================--
function UnionController:handle29219(data)
    self.model:updateMyUnionMemberList(data.members, 1)
end

function UnionController:handle29223(data)
    self.model:updateDonateInfo(data.donate_list)

    -- 更新捐献宝箱情况
    self.model:updateDonateBoxInfo(data.boxes, data.donate_exp)
    RedbagController:getInstance():getModel():updateRedBagNum(data.day_send_num,data.day_recv_num)
end

--==============================--
--desc:请求联盟捐献
--@type:
--@return 
--==============================--
function UnionController:requestUnionDonate(type)
    local protocal = {}
    protocal.type = type
    self:SendProtocal(29224, protocal)
end

--==============================--
--desc:联盟捐献返回
--@data:
--@return 
--==============================--
function UnionController:handle29224(data)
    message(data.msg)
    if data.code == TRUE then
        self.model:setUnionDonateStatus()
    end
end

--==============================--
--desc:更新，增加或者删除成员
--@data:
--@return 
--==============================--
function UnionController:hander29242(data)
    self.model:updateMyUnionMemberList(data.members, data.type)
end

--==============================--
--desc:会长或者副会长处理操作申请列表
--@type:
--@rid:
--@srv_id:
--@return 
--==============================--
function UnionController:requestOperationApply(type, rid, srv_id) 
    local protocal = {}
    protocal.type = type
    protocal.rid = rid
    protocal.srv_id = srv_id
    self:SendProtocal(29205, protocal)
end

--==============================--
--desc:操作申请玩家列表返回
--@data:
--@return 
--==============================--
function UnionController:handle29205(data)
    message(data.msg)
    if data.code == TRUE then
        self.model:deleteApplyInfo(data.rid, data.srv_id)
    end
end

--==============================--
--desc:请求当前申请加入的联盟列表
--@page:
--@num:
--@return 
--==============================--
function UnionController:requestUnionApplyList(page, num)
    page = page or 0
    num = num or 0
    local protocal = {}
    protocal.page = page
    protocal.num = num
    self:SendProtocal(29207, protocal)
end

--==============================--
--desc:更新申请列表
--@data:
--@return 
--==============================--
function UnionController:handle29207(data)
    self.model:updateUnionApplyList(data.guids)
end

--==============================--
--desc:请求退帮
--@return 
--==============================--
function UnionController:requestExitUnion()
    local role_vo = RoleController:getInstance():getRoleVo()
    if role_vo == nil then return end
    if role_vo.league_position == UnionConst.post_type.leader then         -- 自己是帮主，则是解散联盟
        local msg = string.format(TI18N("是否确定解散联盟[%s]？"), role_vo.gname)
        local extend_msg = ""
        if role_vo.union_quit_time ~= 0 then
            extend_msg = TI18N("(解散联盟后，12小时内无法加入其他联盟，24小时内\n无法创建联盟)")
        else
            extend_msg = TI18N("(首次解散联盟后，可立即加入其他联盟，24小时内\n无法创建联盟。)") 
        end
        CommonAlert.show(msg,TI18N("确定"),function() 
            self:SendProtocal(29216, {})
        end,TI18N("取消"),nil,nil,nil,{timer=3, timer_for=true, off_y = 43, title = TI18N("解散联盟"), extend_str = extend_msg, extend_offy = -5, extend_aligment = cc.TEXT_ALIGNMENT_CENTER },nil,nil)
    else
        local msg = string.format(TI18N("是否确定退出联盟[%s]？"), role_vo.gname)
        local extend_msg = "" 
        if role_vo.union_quit_time ~= 0 then
            extend_msg = TI18N("(退出联盟后12小时内无法创建联盟、加入其他联盟)")
        else
            extend_msg = TI18N("(首次退出后可立即加入其他联盟，12小时内无法创建联盟)")
        end 
        CommonAlert.show(msg, TI18N("确定"), function()
            self:SendProtocal(29214, {})
        end, TI18N("取消"), nil, nil, nil, {timer = 3, timer_for = true, off_y = 43, title = TI18N("退出联盟"), extend_str = extend_msg, extend_offy = -5, extend_aligment = cc.TEXT_ALIGNMENT_CENTER }, nil, nil) 
    end
end

--==============================--
--desc:退帮
--@data:
--@return 
--==============================--
function UnionController:handle29214(data)
    print("================handle29214=============")
    printLuaTable(data)
    message(data.msg)
end

--==============================--
--desc:解散
--@data:
--@return 
--==============================--
function UnionController:handle29216(data)

    message(data.msg)
end

--==============================--
--desc:设置修改申请条件
--@apply_type:
--@apply_lev:
--@return 
--==============================--
function UnionController:requestChangeApplySet(apply_type, apply_lev, apply_power)
    local protocal = {}
    protocal.apply_type = apply_type
    protocal.apply_lev = apply_lev
    protocal.apply_power = apply_power
    self:SendProtocal(29222, protocal)
end

--==============================--
--desc:设置权限返回
--@data:
--@return 
--==============================--
function UnionController:handle29222(data)
    message(data.msg)
    if data.code == TRUE then
        self:openUnionApplySetWindow(false)
    end
end

--==============================--
--desc:请求修改联盟宣言
--@sign:
--@return 
--==============================--
function UnionController:requestChangeUnionSign(sign)
    local protocal = {}
    protocal.sign = sign 
    self:SendProtocal(29221, protocal)
end

--==============================--
--desc:联盟宣言修改
--@data:
--@return 
--==============================--
function UnionController:handle29221(data)
    message(data.msg)
    if data.code == TRUE then
        self:openUnionChangeSignWindow(false)
    end
end

--==============================--
--desc:从联盟中踢人
--@rid:
--@srv_id:
--@return 
--==============================--
function UnionController:requestKickoutMember(rid, srv_id, name)
    local function call_back()
        local protocal = {}
        protocal.rid = rid
        protocal.srv_id = srv_id
        print("--------------requestKickoutMember-----------------",rid,srv_id)
        self:SendProtocal(29213, protocal)
    end
    local msg = string.format(TI18N("是否确认将[%s]玩家移除出联盟？"), name)
    CommonAlert.show(msg, TI18N("确定"), function()
        call_back()
    end, TI18N("取消"))
end

--==============================--
--desc:踢人返回
--@data:
--@return 
--==============================--
function UnionController:handle29213(data)
    message(data.msg)
    if data.code == TRUE then
        self:openUnionOperationPostWindow(false)
    end
end

--==============================--
--desc:职位任命
--@rid:
--@srv_id:
--@position:
--@return 
--==============================--
function UnionController:requestOperationPost(rid, srv_id, position)
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id = srv_id
    protocal.position = position
    print("-----------requestOperationPost----------------")
    printLuaTable(protocal )
    self:SendProtocal(29220, protocal)
end

--==============================--
--desc:职位任命
--@data:
--@return 
--==============================--
function UnionController:handle29220(data)
    print("-----------handle29220----------------")
    printLuaTable(data)
	message(data.msg)
	if data.code == TRUE then
		self:openUnionOperationPostWindow(false)
	end
end 

--==============================--
--desc:请求改名
--@name:
--@return 
--==============================--
function UnionController:requestChangUnionName(name)
    local protocal = {}
    protocal.name = name
    self:SendProtocal(29268, protocal)
end

--==============================--
--desc:联盟改名
--@data:
--@return 
--==============================--
function UnionController:handle29268(data)
    message(data.msg)
    if data.code == TRUE then
        self:openUnionChangeNameWindow(false)
    end
end

--==============================--
--desc:发送联盟招募广告
--@return 
--==============================--
function UnionController:requestUnionRecruit()
    local my_info = self.model:getMyUnionInfo()
    if my_info ~= nil then
        local list = {}

        local config = Config.UnionData.data_const.recruit_limit
        local limit_count = 5
        if config then
            limit_count = config.val
        end
        local count = limit_count - my_info.recruit_num
        if count <= 0 then
            message(TI18N("当天招募次数已用完"))
            return
        end
        local extend_msg2= string.format(TI18N("<div fontcolor=#68452a>剩余次数：%s</div>"), count)
        list[2] = {extend_type = CommonAlert.type.rich, extend_size = 24, extend_str = extend_msg2, extend_offy = - 55, extend_aligment = cc.TEXT_ALIGNMENT_CENTER }

        if my_info.recruit_num == 0 then
            local msg = TI18N("是否确定发布招募公告？")
            local extend_msg = TI18N("（每日首次发布公告免费）")

            list[1] = {extend_str = extend_msg, extend_offy = - 5, extend_aligment = cc.TEXT_ALIGNMENT_CENTER }
            

            CommonAlert.show(msg, TI18N("确定"), function()
                self:SendProtocal(29258, {})
            end, TI18N("取消"), nil, nil, nil, {off_y = 43, extend_list = list}, nil, nil)
        else
            local config = Config.UnionData.data_const.recruit_cost
            local role_vo = RoleController:getInstance():getRoleVo()
            if config and role_vo then
                local total = role_vo.gold + role_vo.red_gold
                local msg = string.format(TI18N("是否确定花费<img src=%s visible=true scale=0.35 />%s发布招募广告？"), PathTool.getItemRes(15), config.val)
                local extend_msg = string.format("%s<img src=%s visible=true scale=0.35 />%s/%s", TI18N("发布消耗："), PathTool.getItemRes(15),  MoneyTool.GetMoneyString(total), config.val)

                list[1] = {extend_type = CommonAlert.type.rich, extend_str = extend_msg, extend_offy = - 5, extend_aligment = cc.TEXT_ALIGNMENT_CENTER}
                CommonAlert.show(msg, TI18N("确定"), function()
                    self:SendProtocal(29258, {})
                end, TI18N("取消"), nil, CommonAlert.type.rich, nil, {off_y = 43, extend_list = list}, nil, nil)
            end
        end
    end
end

--==============================--
--desc:招募广告返回
--@data:
--@return 
--==============================--
function UnionController:handle29258(data)
    message(data.msg)
end

--==============================--
--desc:联盟申请红点
--@data:
--@return 
--==============================--
function UnionController:handle29273(data)
    self.model:updateUnionRedStatus(UnionConst.red_index.apply, (data.code == TRUE))
end

--==============================--
--desc:有玩家申请加入的提示，
--@data:
--@return 
--==============================--
function UnionController:setApplyListStatus(data)
    self.model:updateUnionRedStatus(UnionConst.red_index.apply, true) 
end

--==============================--
--desc:请求领取指定捐献宝箱
--@box_id:
--@return 
--==============================--
function UnionController:requestDonateBoxRewards(box_id)
    local protocal = {}
    protocal.box_id = box_id
    self:SendProtocal(29274, protocal)
end

--==============================--
--desc:领取捐献宝箱返回
--@data:
--@return 
--==============================--
function UnionController:handle29274(data)
    message(data.msg)
    if data.code == TRUE then
        self.model:setDonateBoxStatus(data.box_id)
    end
end

--==============================--
--desc:更新捐献进度值
--@data:
--@return 
--==============================--
function UnionController:handle29275(data)
    self.model:updateDonateActivity(data.donate_exp)
end 

function UnionController:__delete()
    if self.model ~= nil then
        self.model:DeleteMe()
        self.model = nil
    end
    if self.role_vo ~= nil then
        if self.role_assets_event ~= nil then
            self.role_vo:UnBind(self.role_assets_event)
            self.role_assets_event = nil
        end
        self.role_vo = nil
    end
end

function UnionController:welcomeNewMember(rid, srv_id)
    local protocal = {}
    protocal.rid = rid
    protocal.srv_id = srv_id
    self:SendProtocal(29276, protocal)
end

function UnionController:handle29276(data)
    message(data.msg)
end

--********联盟活跃

--基本信息
function UnionController:send16900()
    self:SendProtocal(16900, {})
end
function UnionController:handle16900(data)
    self.model:updataUnionActionRedStatus(data)
    EventManager:getInstance():Fire(UnionEvent.UpdataUnionGoalBasicData, data)
end

--任务信息
function UnionController:send16901()
    self:SendProtocal(16901, {})
end
function UnionController:handle16901(data)
    EventManager:getInstance():Fire(UnionEvent.UpdataUnionGoalTaskData, data)
end

--单条任务信息
function UnionController:handle16902(data)
    EventManager:getInstance():Fire(UnionEvent.UpdataUnionGoalSingleTaskData, data)
end

--提交任务
function UnionController:send16903(id)
    local protocal = {}
    protocal.id = id
    self:SendProtocal(16903, protocal)
end
function UnionController:handle16903(data)
    message(data.msg)
end

function UnionController:send16904()
    self:SendProtocal(16904, {})
end
function UnionController:handle16904(data)
    message(data.msg)
end

-------------------联盟日志和邮件--------------------
--获取联盟日志列表
function UnionController:send29277()
    self:SendProtocal(29277, {})
end
function UnionController:handle29277(data)
    self.model:initUnionNoticeList(data.union_log_info_list)
end

--新增日志
function UnionController:handle29278(data)
    self.model:addUnionNoticeItem(data.union_log_info_list)
    self.model:updateUnionRedStatus(UnionConst.red_index.notice, true)
end

--联盟一键提醒
function UnionController:send29279(type, id_list)
    local protocal = {}
    protocal.type = type
    protocal.id_list = id_list
    self:SendProtocal(29279, protocal)
end
function UnionController:handle29279(data)
    message(data.msg)
end

--联盟发送邮件
function UnionController:send29280(content)
    local protocal = {}
    protocal.content = content
    self:SendProtocal(29280, protocal)
end
function UnionController:handle29280(data)
    message(data.msg)
end
----------------------------------------------------

--==============================--
--desc:更新技能首次红点
--@data:
--@return 
--==============================--
function UnionController:updateSkillFirstRedPoint()
    if self.role_vo and self.role_vo.lid ~= 0 and self.role_vo.lsrv_id ~= "" then --表示有联盟
        local red_status = RoleController:getInstance():getModel():getRedPointStatus(RoleConst.red_point.red_point_2)
        self.model:updateUnionRedStatus(UnionConst.red_index.all_skill, red_status) 
    end
end

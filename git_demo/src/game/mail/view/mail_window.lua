-- --------------------------------------------------------------------
-- 竖版邮件
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
MailWindow = MailWindow or BaseClass(BaseView)

local controller = MailController:getInstance()
local model = MailController:getInstance():getModel()

function MailWindow:__init()

    self.win_type = WinType.Full              	
    self.title_str = TI18N("邮箱")
    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("mail","mail"), type = ResourcesType.plist },
    }


end

function MailWindow:open_callback()
    self.mail_root = createCSBNote(PathTool.getTargetCSB("mail/mail_window"))
    self.mail_root:setPosition(10,0)

    self.container:addChild(self.mail_root)

    self.main_container = self.mail_root:getChildByName("main_container")
    self.del_btn = self.main_container:getChildByName("del_btn")
    resetStudioButton(self.del_btn,ButtonType.red,TI18N("删除已读"))


    local btn_width=138*1.5
    local btn_height=50*1.2
    -- local url='hl_common_4_9.png'
    -- self.del_btn:loadTextures(url,url,url,1)
    -- self.del_btn:setContentSize(btn_width,btn_height)
    
    self.get_btn = self.main_container:getChildByName("get_btn")
    resetStudioButton(self.get_btn,ButtonType.yellow,TI18N("一键领取"))
    -- local url='hl_common_4_10.png'
    -- self.get_btn:loadTextures(url,url,url,1)
    -- self.get_btn:setContentSize(btn_width,btn_height)

    self.scrollCon = self.main_container:getChildByName("scrollCon")
    local scroll_view_size = self.scrollCon:getContentSize()
    self.good_cons = self.main_container:getChildByName("good_cons")
   
    local setting = {
        item_class = MailCell,      -- 单元类
        start_x =5,                  -- 第一个单元的X起点
        space_x = 0,                    -- x方向的间隔
        start_y = 0,                    -- 第一个单元的Y起点
        space_y = -5,                   -- y方向的间隔
        item_width = 627,               -- 单元的尺寸width
        item_height = 139,              -- 单元的尺寸height
        row = 0,                        -- 行数，作用于水平滚动类型
        col = 1                        -- 列数，作用于垂直滚动类型
    }
    self.item_scrollview = CommonScrollViewLayout.new(self.good_cons, cc.p(0,0) , ScrollViewDir.vertical, ScrollViewStartPos.top, self.good_cons:getContentSize(), setting)
end

function MailWindow:register_event()
    if self.get_btn then
        self.get_btn:addTouchEventListener(function ( sender,event_type )
                if event_type == ccui.TouchEventType.ended then
                    controller:getAllGoods()
                end
            end)
    end

    if self.del_btn then
        self.del_btn:addTouchEventListener(function ( sender,event_type )
                if event_type == ccui.TouchEventType.ended then
                    local list = model:getHasReadNonRewardList()
                    controller:deletMailSend(list)
                end
            end)
    end

    -- 更新邮件
    self:addGlobalEvent(MailEvent.UPDATE_ITEM, function()

            self:selectedTabCallBack()

        end)



    -- 读取一封邮件的返回
    self:addGlobalEvent(MailEvent.READ_MAIL_INFO, function(key) 
            if self.select_cellitem then
                local data = self.select_cellitem:getData()
                if data then
                    local item_key = getNorKey(data.id or 0, data.srv_id or "")
                    if item_key == key then
                        self.select_cellitem:updateIconStatus()
                    end
                end
            end
        end)

    --读取一封公告
    self:addGlobalEvent(MailEvent.READ_INFO_NOTICE, function(id)
            local notice_msg = model:getNoticeMessage(id)
            if notice_msg then
                controller:openMailInfo(true, notice_msg)
            end
        end)
    --更新公告
    self:addGlobalEvent(MailEvent.UPDATE_NOTICE, function()

            self:selectedTabCallBack()

        end)

end

function MailWindow:openRootWnd()
    self:selectedTabCallBack()
end



function MailWindow:selectedTabCallBack()

    local list = {}

    list = MailController:getData():getAllMailArray()
    self.get_btn:setVisible(true)
    self.del_btn:setVisible(true)
    --self.scrollCon:setContentSize(cc.size(622,711))
    --self.good_cons:setContentSize(cc.size(615,696))
    self.item_scrollview:resetSize(self.good_cons:getContentSize())
    commonShowEmptyIcon(self.main_container,#list == 0,{text = TI18N("暂时没有邮件")})

    if #list > 0 then
        if self.item_scrollview then
            self.item_scrollview:setVisible(true)
        end
        self.item_scrollview:setData(list, function(cell)

                self:selectMailItem(cell)

            end) 
    else
        if self.item_scrollview then
            self.item_scrollview:setVisible(false)
        end
    end
end

--==============================--
--desc:点击cellitem 邮件的
--@cell:
--@return 
--==============================--
function MailWindow:selectMailItem(cell)
    self.select_cellitem = cell
    local data = cell:getData()
    if data then
        controller:requireMailItem(data.id, data.srv_id)
    end
end

--点击公告的
function MailWindow:selectNoticeItem(cell)
    self.select_cellitem = cell
    local data = cell:getData()
    if data then
        controller:readNotice(data.id)
    end
end

function MailWindow:close_callback()
    if self.item_scrollview then
        self.item_scrollview:DeleteMe()
        self.item_scrollview = nil
    end
    controller:openMailPanel(false)
end
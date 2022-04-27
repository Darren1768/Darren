-- --------------------------------------------------------------------
-- 图鉴伙伴评论
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------
PartnerCommentWindow = PartnerCommentWindow or BaseClass(BaseView)

local table_sort = table.sort
function PartnerCommentWindow:__init(data)
    self.ctrl = PokedexController:getInstance()


    self.win_type = WinType.Mini  
    self.view_tag = ViewMgrTag.DIALOGUE_TAG 
    self.layout_name = "pokedex/pokedex_comment"

    self.hero_data = data or {}

    self.res_list = {
        { path = PathTool.getPlistImgForDownLoad("pokedex", "pokedex"), type = ResourcesType.plist },
    }
    self.default_msg = TI18N("请输入评论内容")
end

function PartnerCommentWindow:open_callback()

    self.background = self.root_wnd:getChildByName("background")
	if self.background then
		self.background:setScale(display.getMaxScale())
	end


    self.main_panel = self.root_wnd:getChildByName("main_panel")
    self:playEnterAnimatianByObj(self.main_panel , 2)

    local _face  = self.main_panel:getChildByName("face")
    _face:setVisible(false)
    -- face 边
    self.Sprite_11 = self.main_panel:getChildByName("Sprite_11")
    self.Sprite_11:setZOrder(90)
    
    --品质底
    self.Sprite_12 = self.main_panel:getChildByName("Sprite_12")
    self.Sprite_12:setZOrder(91)

    -- a b  等级
    self.Sprite_13 = self.main_panel:getChildByName("Sprite_13")
    self.Sprite_13:setZOrder(92)

    self.like_num = self.main_panel:getChildByName("like_num")
    self.comment_num= self.main_panel:getChildByName("comment_num")
    self.hero_name= self.main_panel:getChildByName("hero_name")
    self.hero_name:setZOrder(93)

    --喜欢按钮
    self.like_btn = self.main_panel:getChildByName("like_btn")

    self.like_btn:setVisible(true)
    self.nomal_like = self.like_btn:getChildByName("nomal_like")
    self.select_like = self.like_btn:getChildByName("select_like")
    self.text_like =   self.like_btn:getChildByName("Text_1")
    self.nomal_like:setVisible(true)
    self.select_like:setVisible(false)

    self.send_btn = self.main_panel:getChildByName("send_btn")
    resetStudioButton(self.send_btn,ButtonType.red,TI18N("发送"))

    local Image_1 =  self.main_panel:getChildByName("Image_1")
    Image_1:setZOrder(99)
    Image_1:setPosition(cc.p(375,54))
    --评论输入
    local size = cc.size(352,45)
    self.edit_box = createEditBox(self.main_panel, PathTool.getResFrame("common2", "hl_common_0140"),size, cc.c4b(223,214,199,0xff), 26,  cc.c4b(223,214,199,0xff), 26, self.default_msg, nil, nil, LOADTEXT_TYPE_PLIST)
    self.edit_box:setAnchorPoint(cc.p(0,0))
    self.edit_box:setPosition(45,32)
    self.edit_box:setMaxLength(40)

    self.edit_box:setPlaceholderFontColor(cc.c4b(223,214,199,0xff))
    self.edit_box:setFontColor(cc.c4b(223,214,199,0xff))

    self.bg = self.main_panel:getChildByName("bg")

    -- self:updateCommentList()
    self:createHeroMessage()
end

function PartnerCommentWindow:register_event()
    --请求整个评论列表
    EventManager:getInstance():Bind(PokedexEvent.Comment_List_Event,self,function(data)
            self.data = data
            self:updateCommentList()
        end)
       
    --评论返回
     EventManager:getInstance():Bind(PokedexEvent.Comment_Say_Event,self,function()
            self.ctrl:sender11041(self.hero_data.bid,1,100)
            self.edit_box:setText("")
        end)
    --点击喜欢返回
    EventManager:getInstance():Bind(PokedexEvent.Comment_Like_Event,self,function()
            if not self.data then return end
            local res = PathTool.getResFrame("common","hl_common_127")
            local like_num = self.data.like_num or 0
            local str = like_num+1
            self.like_num:setString("喜欢："..str)
            -- self.like_btn:setVisible(false)
            self.like_btn:setTouchEnabled(false)
            self.nomal_like:setVisible(false)
            self.select_like:setVisible(true)
            self.text_like:setTextColor(cc.c3b(219,145,38))

        end)
       
    --点击点赞或踩返回
    EventManager:getInstance():Bind(PokedexEvent.Comment_Zan_Event,self,function(data)
            if self.select_item then 
                self.select_item:updateCommentNum(data)
            end
            self.select_item = nil
        end)
       
    self.background:addTouchEventListener(function(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            self.ctrl:openCommentWindow(false)
        end
    end)
  
    self.like_btn:addTouchEventListener(function(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            if self.data and self.data.like and self.data.like ==1 then 
                message(TI18N("你已设置为喜欢"))
                return
            end
            if not self.hero_data then return end
            self.ctrl:sender11042(self.hero_data.bid)
        end
    end)
    self.send_btn:addTouchEventListener(function(sender, event_type) 
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            if isQingmingShield and isQingmingShield() then
                return
            end
            if not self.hero_data then return end
            local msg = self.edit_box:getText() or ""
            if string.len(msg) <=0 then
                message(TI18N("请输入评论内容"))
                return
            end
            self.ctrl:sender11043(self.hero_data.bid,msg)
        end
    end)
end

function PartnerCommentWindow:createHeroMessage()
   
  
    local star = self.hero_data.star or self.hero_data.init_star or 1

    local key = getNorKey(self.hero_data.bid, star)
    local star_config = Config.PartnerData.data_partner_star(key)
    local res = PathTool.getHeadIcon(star_config.head_id)

    

    self.vSize = cc.size(138,138)
    local bgRes  = PathTool.getResFrame("pokedex", "hl_pokedex_0002")
    self:buildLayout(self.vSize,bgRes)

    self.face:loadTexture(res, LOADTEXT_TYPE)

    

    local _res3 = self:geHerofacebg(self.hero_data.quality) 
    loadSpriteTexture(self.Sprite_11, _res3, LOADTEXT_TYPE_PLIST)

    
    --品质底 quality
    local _res1 = PathTool.getFromQualityBg(self.hero_data.quality) 
    local _res2 = PathTool.geHeroS(self.hero_data.quality) 

    loadSpriteTexture(self.Sprite_12, _res1, LOADTEXT_TYPE_PLIST)
    loadSpriteTexture(self.Sprite_13, _res2, LOADTEXT_TYPE_PLIST)


    self.hero_name:setString(self.hero_data.name)
end

function PartnerCommentWindow:openRootWnd()
    if not self.hero_data  then return end
    self.ctrl:sender11041(self.hero_data.bid,1,100)


    
end


-- 裁剪 切割
function PartnerCommentWindow:buildLayout(size, bgRes)
	self.head_panel = ccui.Widget:create()
	self.head_panel:setAnchorPoint(cc.p(0.5,0.5))
	self.head_panel:setContentSize(self.vSize)
	self.head_panel:setPosition(293, 564)
	self.head_panel:setCascadeOpacityEnabled(true)
	self.main_panel:addChild(self.head_panel)
	-- self:setContentSize(self.vSize)
	-- self:setCascadeOpacityEnabled(true)

    self.mask = createSprite(bgRes, self.vSize.width/2, self.vSize.height/2, nil, cc.p(0.5, 0.5))
    self.clipNode = cc.ClippingNode:create(self.mask)
    self.clipNode:setAnchorPoint(cc.p(0.5,0.5))
    self.clipNode:setContentSize(self.vSize)
    self.clipNode:setCascadeOpacityEnabled(true)
    self.clipNode:setPosition(self.vSize.width/2,self.vSize.height/2 )
    self.clipNode:setAlphaThreshold(0)
    self.head_panel:addChild(self.clipNode,2)

    self.face  = ccui.ImageView:create()
    self.face:setCascadeOpacityEnabled(true)
    self.face:setAnchorPoint(0.5,0.5)
    self.face:setPosition(self.vSize.width/2,self.vSize.height/2+2)
    self.clipNode:addChild(self.face,3)

end

function PartnerCommentWindow:updateCommentList()
    if not self.data then return end
    
    local like_num = self.data.like_num or 0
    local str = like_num
    self.like_num:setString("喜欢："..str)

    if self.data.partner_comments then
        local num = #self.data.partner_comments or 0
        self.comment_num:setString(TI18N("评论数：").. num)
    end

    if self.data.like and self.data.like == 1 then 
        self.nomal_like:setVisible(false)
        self.select_like:setVisible(true)
        self.text_like:setTextColor(cc.c3b(219,145,38))
        self.text_like:enableOutline(cc.c3b(249,241,229))
    end
    -- self.like_btn:setVisible(bool)

 


    local scroll_view_size = self.bg:getContentSize()
    if not self.list_view then
        local setting = {
            item_class = PokedexCommentItem,      -- 单元类
            start_x = 0,                  -- 第一个单元的X起点
            space_x = 0,                    -- x方向的间隔
            start_y = 0,                    -- 第一个单元的Y起点
            space_y = 0,                   -- y方向的间隔
            item_width = 559,               -- 单元的尺寸width
            item_height = 92,              -- 单元的尺寸height
            row = 1,                        -- 行数，作用于水平滚动类型
            col = 1,                         -- 列数，作用于垂直滚动类型
            need_dynamic = true
        }
        self.list_view = CommonScrollViewLayout.new(self.main_panel, cc.p(self.bg:getPosition() ), ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting)
    end
    local list =self.data.partner_comments or {}
    local function callback(item,vo,index)
        if vo and next(vo)~=nil then
            self.select_item = item
            local partner_id = self.hero_data.bid or 0
            local comment_id = vo.comment_id or 0
            index =index or 1
            self.ctrl:sender11044(partner_id,comment_id,index)
		end
    end
    self.list_view:setData(list, callback)
end

--[[
    @desc: 设置标签页面板数据内容
    author:{author}
    time:2018-05-03 21:57:09
    return
]]
function PartnerCommentWindow:setPanelData()
end




function PartnerCommentWindow:geHerofacebg(quality)
    local quality = quality or 1
    if quality > 5 then
        quality = 13
    end
    if quality == 1 then
        quality = 13
    elseif quality == 2 then
        quality = 11
    elseif quality == 3 then
        quality = 10
    elseif quality == 4 then
        quality = 14
    elseif quality == 5 then
        quality = 12
    else
        quality = 13
    end

    local res_id = "hl_pokedex_00" .. quality
    return PathTool.getResFrame("pokedex", res_id)

end


function PartnerCommentWindow:close_callback()
    self.ctrl:openCommentWindow(false)
    if self.hero_item then
        self.hero_item:DeleteMe()
    end
    self.hero_item = nil

    if self.list_view then 
        self.list_view:DeleteMe()
        self.list_view = nil
    end
    EventManager:getInstance():UnBind(self)
end


-- --------------------------------------------------------------------
-- 竖版奖励子项
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------
PokedexCommentItem = class("PokedexCommentItem", function()
    return ccui.Widget:create()
end)

function PokedexCommentItem:ctor(open_type)  
    self.open_type = open_type or 1
    self:config()
    self:layoutUI()
    self:registerEvents()
end
function PokedexCommentItem:config()
    self.ctrl = SpiritController:getInstance()
    
    self.attr_list = {}
    self.star_list = {}
end
function PokedexCommentItem:layoutUI()
    local csbPath = PathTool.getTargetCSB("pokedex/pokedex_comment_item")
    self.root_wnd = createCSBNote(csbPath)
    
    self.size = self.root_wnd:getContentSize()
    self:setContentSize(self.size)
    
    self:addChild(self.root_wnd)
    
    self.main_panel = self.root_wnd:getChildByName("main_panel")
    self.bg = self.main_panel:getChildByName("bg")
   
    --热度图标
    self.hot_bg =self.main_panel:getChildByName("hot") 
    self.hot_bg:setVisible(false)
    --踩按钮
    self.btn1 = self.main_panel:getChildByName("btn1") 
    local title = self.btn1:getChildByName("title") 
    self.btn1.title = title
    self.btn1:setCascadeOpacityEnabled(true)
    self.btn1:setCascadeOpacityEnabled(true)
    self.btn1_select = self.btn1:getChildByName("bg_select")
    self.btn1_unselect = self.btn1:getChildByName("bg_unselect")
    self.btn1_select:setVisible(false)
    self.btn1_unselect:setVisible(true)


    --点赞按钮
    self.btn2 = self.main_panel:getChildByName("btn2") 
    local title1 = self.btn2:getChildByName("title") 
    self.btn2.title = title1
    self.btn2:setCascadeOpacityEnabled(true)
    self.btn2:setCascadeOpacityEnabled(true)
    self.btn2_select = self.btn2:getChildByName("bg_select")
    self.btn2_unselect = self.btn2:getChildByName("bg_unselect")
    self.btn2_select:setVisible(false)
    self.btn2_unselect:setVisible(true)

    -- self.btn1.title:setColor(cc.c3b(157,141,121))
    -- self.btn2.title:setColor(cc.c3b(157,141,121))

    --评论者名字
    self.goods_name = createLabel(22,cc.c3b(132, 82, 76),nil,20,self.hot_bg:getPositionY()-4,"",self.main_panel,0, cc.p(0,0.5))
    --评论内容
    self.comment_label =createRichLabel(20, cc.c4b(112,97,74,255), cc.p(0,1), cc.p(20,38), 0, 0, 520)
    self.main_panel:addChild(self.comment_label)
 
end



function PokedexCommentItem:setData(data)
    if not data then return end

    if data._index % 2 == 1 then 
        self.bg:setVisible(true)
    else
        self.bg:setVisible(false)
    end

    self.data = data
    local name = data.name or ""
    self.goods_name:setString(name)

    self.hot_bg:setPositionX( self.goods_name:getPositionX() + self.goods_name:getContentSize().width + 20)

    local num = data.no_like_num
    self.btn1.title:setString(num)

    local num = data.like_num
    self.btn2.title:setString(num)

    local str = data.msg or ""
    self.comment_label:setString(str)
 
    if data._index and data._index <=3 then 
        self.hot_bg:setVisible(true)
    end
    if data.is_like then 
        if data.is_like == 0 then 
            self.btn1_unselect:setVisible(false)
            self.btn1_select:setVisible(true)
            self.btn2_unselect:setVisible(true)
            self.btn2_select:setVisible(false)

            self.btn1.title:setTextColor(cc.c3b(219,145,98))
        elseif data.is_like == 1 then
            self.btn2_unselect:setVisible(false)
            self.btn2_select:setVisible(true)
            self.btn1_unselect:setVisible(true)
            self.btn1_select:setVisible(false)
            self.btn2.title:setTextColor(cc.c3b(219,145,98))
        else
            self.btn1_select:setVisible(false)
            self.btn1_unselect:setVisible(true)
            self.btn2_select:setVisible(false)
            self.btn2_unselect:setVisible(true)
            self.btn1.title:setTextColor(cc.c3b(157,141,121))
            self.btn2.title:setTextColor(cc.c3b(157,141,121))
        end
    end

end
--事件
function PokedexCommentItem:registerEvents()
     self.btn1:addTouchEventListener(function(sender, event_type) 
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            if self.call_fun then 
                self:call_fun(self.data,0)
            end
        end
    end)
    self.btn2:addTouchEventListener(function(sender, event_type) 
        customClickAction(sender, event_type)
        if event_type == ccui.TouchEventType.ended then
            playCommonButtonSound()
            if self.call_fun then 
                self:call_fun(self.data,1)
            end
        end
    end)
end
function PokedexCommentItem:updateCommentNum(vo)
    if not vo then return end
    if not self.data then return end
    local click_type = vo.type or 0 
    if click_type == 0 then 
        self.data.is_like = 0
        local num = self.data.no_like_num
        self.btn1.title:setString(num+1)
        self.btn1_unselect:setVisible(false)
        self.btn1_select:setVisible(true)
        self.btn2_unselect:setVisible(true)
        self.btn2_select:setVisible(false)
    else
        self.data.is_like = 1
        local num = self.data.like_num
        self.btn2.title:setString(num+1)
        self.btn2_unselect:setVisible(false)
        self.btn2_select:setVisible(true)
        self.btn1_unselect:setVisible(true)
        self.btn1_select:setVisible(false)
    end
end
function PokedexCommentItem:clickHandler()
    if self.call_fun then 
        self:call_fun(self.data)
    end
end
function PokedexCommentItem:addCallBack(call_fun)
    self.call_fun =call_fun
end

function PokedexCommentItem:DeleteMe()
    self.data = nil
    self:removeFromParent()
end





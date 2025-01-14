-- --------------------------------------------------------------------
-- 剧情对话面板,出于一些设定,现在只要进剧情都会打开这个面板,只是状态不同 
-- 
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
-- --------------------------------------------------------------------

StoryDrameTalk = StoryDrameTalk or BaseClass(BaseView)

local controller = StoryController:getInstance()
local model = controller:getModel()
local story_view = controller:getView()
local table_insert = table.insert
local string_format = string.format

function StoryDrameTalk:__init(is_skip)
    self.is_skip            = is_skip
	self.win_type           = WinType.Big
	self.is_full_screen     = true
	self.view_tag			= ViewMgrTag.MSG_TAG        	-- 父级层次

    self.max_height         = 0
    self.item_info_list     = {}                                -- 数据对象
    self.item_height        = 162
    self.item_show_list     = {}
    self.can_click          = false

	self.layout_name = "drama/drama_talk_view_new"
	self.res_list = {
		{path = PathTool.getPlistImgForDownLoad("drama", "drama"), type = ResourcesType.plist},
	}
end

function StoryDrameTalk:open_callback()
    local background = self.root_wnd:getChildByName("background")
    background:setScale(display.getMaxScale())
    -- background:setOpacity(100)
    self.background = background

    self.bg = self.root_wnd:getChildByName("bg")
    self.bg:setScale(display.getMaxScale())

    local container = self.root_wnd:getChildByName("container")
    local offset_y = display.getBottom(self.root_wnd)
    container:setPositionY(offset_y)

    self.scroll_view = container:getChildByName("scroll_view")
    self.scroll_view:setScrollBarEnabled(false)
    self.scroll_size = self.scroll_view:getContentSize()

    self.item = self.root_wnd:getChildByName("item")
    self.item:setVisible(false) -- left_role right_role

    self.container = container
end

function StoryDrameTalk:register_event()
    self.background:addTouchEventListener(function(sender,event_type)
        if event_type == ccui.TouchEventType.ended then
            self:playNextAcrt()	
        end
    end)

    self.scroll_view:addTouchEventListener(function(sender,event_type)
		if event_type == ccui.TouchEventType.ended then	
            self.touch_end = sender:getTouchEndPosition()
			local is_click = true
			if self.touch_began ~= nil then
				is_click = math.abs( self.touch_end.x - self.touch_began.x ) <= 20 and math.abs( self.touch_end.y - self.touch_began.y ) <= 20
			end
			if is_click == true then
                self:playNextAcrt()			
			end
		elseif event_type == ccui.TouchEventType.began then			
            self.touch_began = sender:getTouchBeganPosition()
		end
    end)

    self.container:addTouchEventListener(function(sender,event_type)
        if event_type == ccui.TouchEventType.ended then
            self:playNextAcrt()
        end
    end)
end

function StoryDrameTalk:playNextAcrt()
    if self.can_click == true then
        EventManager:getInstance():Fire(StoryEvent.PLAY_NEXT_ACT)
    else
    end
end

function StoryDrameTalk:openRootWnd(type, bid, actiontype, name, msg, res_type, res_rid, action_name ,left_right,quilty_type,offset_x,offest_y)
    self:setData(type, bid, actiontype, name, msg ,res_type, res_rid, action_name ,left_right,quilty_type,offset_x,offest_y)

    self:updatabg()
end

function StoryDrameTalk:updatabg()

   local  battle_res_id = BattleController:getInstance():curBattleResId(BattleConst.Fight_Type.Darma) or 10001
   if battle_res_id== nil or  self.battle_res_id == battle_res_id then 
       return
   end
   self.battle_res_id = battle_res_id
   local res = PathTool.getBattleSceneRes(string.format("%s/b_bg", self.battle_res_id), false)
   loadSpriteTexture(self.bg, res, LOADTEXT_TYPE)


end 

--==============================--
--desc:设置剧情对白
--@type:0:头像出现在左侧, 1:头像出现在右侧
--@bid:
--@msg:
--@return 
--==============================--
function StoryDrameTalk:setData(type, bid, actiontype, name, msg, res_type, res_rid, action_name ,left_right,quilty_type,offset_x,offest_y)
    if not self.scroll_size then return end
    self.can_click = false
    delayRun(self.container, 0.5, function() 
        self.can_click = true
    end) 
    self.item_info_list={}
    local item_info = {type=type or 1, bid=bid, actiontype=actiontype or 1, name=name, msg=msg}
    table_insert(self.item_info_list, 1, item_info)


    local size = #self.item_info_list
    local space_y = -18
    self.max_height = size * self.item_height + (size - 1) * space_y + 40
    self.max_height = math.max(self.max_height, self.scroll_size.height )
    self.scroll_view:setInnerContainerSize(cc.size(self.scroll_size.width, self.max_height))

    -- 显示骨骼动画
    print("-----------------res_type-------1-----",res_type,offest_y,offset_x)
    if res_type ~=nil then 
        print("-----------------res_rid-------2-----",res_rid)
        if res_type == 1 then 
            -- 半身
            self:showRoleSpine1(left_right, res_rid, action_name,offset_x,offest_y)
        else
            -- 全身图片
            self:showRoleSprine(left_right,res_rid,offset_x,offest_y)
        end 
    end 

    self:refreshTopItem(item_info,res_type,left_right,quilty_type)
end


-- 刷新顶部固定的对话框
function StoryDrameTalk:refreshTopItem( data,res_type,left_right,quilty_type)
    if tolua.isnull(self.item) then return end

    
    -- 名称
    local _res_name_bg = PathTool.getResFrame("common","hl_common_3062") --半身
    local _name_color = cc.c3b(250,232,150)
    local _item_pos = cc.p(356,255)
    local _name_bg_pos = cc.p(356,255)
    local _name_pos = cc.p(134,20)
    local name_str = data.name or ""
    local name_offset_x = 0
    local name_offset_y =0
    local scale = 1 
    if res_type ~=nil then 
        if res_type == 1 then 
            -- 半身
            _res_name_bg = PathTool.getResFrame("common","hl_common_3062") --半身
            _name_color = cc.c3b(250,232,150)
            _item_pos = cc.p(360,472)

            if left_right ==0 then --左边
                _name_bg_pos = cc.p(298,160)
                _name_pos = cc.p(134,20)

            else
                _name_bg_pos = cc.p(422,160)
                _name_pos = cc.p(720-134,20)
                scale=-1

            end 
            name_offset_x =70

        else
            -- 全身图片
           
            name_str =  StringUtil.branchStr(name_str)
           print("---------------------quilty_type------------",quilty_type)
            if quilty_type ==0 then 
                _res_name_bg = PathTool.getResFrame("common","hl_common_3060") --低品质
                _name_color = cc.c3b(239,212,174) -- 低品质
                name_offset_x =-2
                name_offset_y =44
            else
                _res_name_bg = PathTool.getResFrame("common","hl_common_3061") --高品质
                _name_color = cc.c3b(250,232,150) -- 高品质
                name_offset_x =4
            end 
          
            _item_pos = cc.p(360,255)
            if left_right ==0 then --左边
                _name_bg_pos = cc.p(720-108,700)
            else
                _name_bg_pos = cc.p(108,700)
            end 
          

            -- _name_pos = cc.p(70,730)

        end 
    end  
    
    if not self.topItem then

        self.topItem = self.item:clone()
        self.topItem:setVisible(true)
        self.topItem:setPosition(_item_pos)

        local itemBg = self.topItem:getChildByName("Image_4")
        local bgSize = itemBg:getContentSize()

        local nameBg = createImage(itemBg, _res_name_bg , 10, bgSize.height-8, cc.p(0.5, 0.5), true)
        nameBg:setPosition(_name_bg_pos)
        nameBg:setScaleX(scale)

        local nameBgSize = nameBg:getContentSize()
        local name_txt = createLabel(22,_name_color,nil,nameBgSize.width/2-name_offset_x ,nameBgSize.height/2+3 -name_offset_y,name_str,nameBg,nil, cc.p(0.5, 0.5))
        name_txt:setScaleX(scale)
        -- 对话内容
        local item_msg = createRichLabel(20, cc.c3b(239, 212, 174), cc.p(0, 1), cc.p(120, bgSize.height-50), 10, nil, 460)
        item_msg:setString(WordCensor:getInstance():relapceFaceIconTag(data.msg or "")[2] or "")
        itemBg:addChild(item_msg)

        -- 箭头
        local arrow = createImage(itemBg, PathTool.getResFrame("common","hl_common_3059"), bgSize.width-70, 40, cc.p(0.5, 0.5), true)
        arrow:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.FadeTo:create(1.0, 100), cc.FadeTo:create(1.0, 255))))

        self.scroll_view:addChild(self.topItem, 10)

        self.topItem.name_txt = name_txt
        self.topItem.msg_txt = item_msg
        self.topItem.nameBg = nameBg

        self.topItem:setOpacity(0)
        -- local _x = self.scroll_size.width * 0.5
        self.topItem:setPosition(cc.p(self.scroll_size.width * 0.5, self.max_height))

        local fadein = cc.FadeIn:create(0.3)
        local move_to = cc.MoveTo:create(0.3, _item_pos)
        self.topItem:runAction(cc.Spawn:create(fadein, move_to))
    else
        self.topItem:setPosition(_item_pos)
        self.topItem.name_txt:setTextColor(_name_color)
        self.topItem.nameBg:setPosition(_name_bg_pos)
        self.topItem.nameBg:setScaleX(scale)

        self.topItem.nameBg:loadTexture(_res_name_bg,LOADTEXT_TYPE_PLIST)
        local nameBgSize = self.topItem.nameBg:getContentSize()
        self.topItem.name_txt:setPosition(nameBgSize.width/2-name_offset_x ,nameBgSize.height/2+3-name_offset_y)

        self.topItem.name_txt:setString(name_str)
        self.topItem.name_txt:setScaleX(scale)

        self.topItem.msg_txt:setString(WordCensor:getInstance():relapceFaceIconTag(data.msg or "")[2] or "")
        self.topItem:setPosition(cc.p(self.scroll_size.width * 0.5, self.max_height))
        self.topItem:setOpacity(0)
        local fadein = cc.FadeIn:create(0.3)
        local move_to = cc.MoveTo:create(0.3, _item_pos)
        self.topItem:runAction(cc.Spawn:create(fadein, move_to))
    end

    self.topDataCache = data
end


-- 显示骨骼动画 dirType: 0为左边 1为右边
function StoryDrameTalk:showRoleSpine1( dirType, effid, actionName,offset_x,offest_y)
    local action = actionName 
    print("---------------dirType----------effid---------",effid,actionName)
    local pos_left = self.root_wnd:getChildByName("pos_left"):getChildByName("Panel_2")
    local pos_right = self.root_wnd:getChildByName("pos_right"):getChildByName("Panel_2")
    pos_left:setPosition(cc.p(720,600))
    pos_right:setPosition(cc.p(720,600))

    local _x =   offset_x
    local _y =   offest_y  -190

    if self.leftSprite  then
        self.leftSprite:setOpacity(0)
    end
    if self.rightSprite  then 
        self.rightSprite:setOpacity(0)
    end
    if dirType == 0 then
       
        pos_right:removeAllChildren()
        -- pos_left:removeAllChildren()
        if self.leftSpine and self.leftSpine.effid ~= effid then 
            pos_left:removeAllChildren()
            self.leftSpine = nil
        end
       
        self.rightSpine = nil
        if self.leftSpine == nil then
            self.leftSpine = createSpineByName(effid,actionName,nil,nil,nil,nil,true)
            self.leftSpine.effid = effid
            self.leftSpine:setAnchorPoint(cc.p(0.5,0.5))
            pos_left:addChild(self.leftSpine)
            self.leftSpine:setAnimation(1,actionName,true)
            self.leftSpine:setOpacity(0)
        elseif not self.lastDirType or self.lastDirType ~= dirType or self.lastActionType ~= actionType then
            self.leftSpine:setAnimation(1,actionName,true)
        end
        pos_left:setPosition(cc.p(_x - 88,_y))
        delayRun(self.leftSpine,1/60,function()
            local _size = self.leftSpine:getBoundingBox()
            self.leftSpine:setPosition(cc.p(360,-_size.height*(2/5)))
            self.leftSpine:setOpacity(255)

        end)
        self.leftSpine:setScale(1.5)
    elseif dirType == 1 then
        -- setClippingType
        self.leftSpine = nil
        -- self.rightSpine = nil
        -- pos_right:removeAllChildren()
        pos_left:removeAllChildren()

        if self.rightSpine and self.rightSpine.effid ~= effid then 
            pos_right:removeAllChildren()
            self.rightSpine = nil
        end

        pos_right:setScaleX(-1)
        if self.rightSpine == nil then
            self.rightSpine = createSpineByName(effid,actionName,nil,nil,nil,nil,true)
            self.rightSpine.effid = effid
           
            self.rightSpine:setAnchorPoint(cc.p(0.5,0.5))
            pos_right:addChild(self.rightSpine)
            self.rightSpine:setAnimation(1,actionName,true)
            self.rightSpine:setOpacity(0)

        elseif not self.lastDirType or self.lastDirType ~= dirType or self.lastActionType ~= actionType then
            self.rightSpine:setAnimation(1,actionName,true)

        end
        pos_right:setPosition(cc.p(_x + 88,_y))
        delayRun(self.rightSpine,1/60,function()
            local _size = self.rightSpine:getBoundingBox()
            self.rightSpine:setPosition(cc.p(360,-_size.height*(2/5)))
            self.rightSpine:setOpacity(255)

        end)
        self.rightSpine:setScale(1.5)

    end
    -- 记录最后一次的播放状态
    self.lastDirType = dirType
    self.lastActionType = actionType
end

-- 显示立绘 dirType: 0为左边 1为右边
function StoryDrameTalk:showRoleSprine( dirType, effid,offset_x,offest_y)
    local action = actionName 
    print("---------------dirType-------------------",dirType)

    if self.rightSpine  then --
        self.rightSpine:setOpacity(0)
    end
    if self.leftSpine then -- 
        self.leftSpine:setOpacity(0)
    end
    
    local _x =  offset_x
    local _y =  offest_y
    if dirType == 0 then
      
        self.leftSprite = nil
        local pos_left = self.root_wnd:getChildByName("pos_left")
        local pos_right = self.root_wnd:getChildByName("pos_right")
        -- pos_right:removeAllChildren()
        -- pos_left:removeAllChildren()
        if self.leftSprite and self.leftSprite.effid ~= effid then -- 如果换了新的spine则删除旧的
            self.leftSprite:removeFromParent()
            self.leftSprite = nil
        end
        if self.rightSprite  then -- 如果换了新的spine则删除旧的
            self.rightSprite:setOpacity(0)
        end
        if self.leftSprite == nil then

            local size = self.container:getContentSize()
            local icon_res= "resource/herodraw/herodrawres/".. effid ..".png" 
            self.leftSprite = createSprite(icon_res, 25, 0, pos_left , cc.p(0.5, 0.5), LOADTEXT_TYPE )
            self.leftSprite.effid = effid
            self.leftSprite:setOpacity(0)
            self.leftSprite:runAction(cc.FadeIn:create(0.2))

        elseif not self.lastDirType or self.lastDirType ~= dirType or self.lastActionType ~= actionType then
            self.leftSprite:setOpacity(100)
            self.leftSprite:setToSetupPose()
            self.leftSprite:runAction(cc.FadeIn:create(0.2))
        end
        self.leftSprite:setPosition(cc.p(_x,_y))

    elseif dirType == 1 then
        self.rightSprite = nil

        local pos_left = self.root_wnd:getChildByName("pos_left")
        local pos_right = self.root_wnd:getChildByName("pos_right")
        -- pos_right:removeAllChildren()
        -- pos_left:removeAllChildren()
        if self.rightSprite and self.rightSprite.effid ~= effid then -- 如果换了新的spine则删除旧的
            self.rightSprite:removeFromParent()
            self.rightSprite = nil
        end
        if self.leftSprite  then -- 如果换了新的spine则删除旧的
            self.leftSprite:setOpacity(0)
        end

        if self.rightSprite == nil then

            local size = self.container:getContentSize()

            local icon_res= "resource/herodraw/herodrawres/".. effid ..".png" 
            self.rightSprite = createSprite(icon_res, 25, 0, pos_right , cc.p(0.5, 0.5), LOADTEXT_TYPE )
            self.rightSprite.effid = effid
            self.rightSprite:setOpacity(0)
            self.rightSprite:runAction(cc.FadeIn:create(0.2))
            -- self.rightSprite:setScale(2)
            -- pos_right:setScaleX(-pos_right.scale_x)
        elseif not self.lastDirType or self.lastDirType ~= dirType or self.lastActionType ~= actionType then
            self.rightSprite:setOpacity(100)
            self.rightSprite:setToSetupPose()
            self.rightSprite:runAction(cc.FadeIn:create(0.2))

        end
        self.rightSprite:setPosition(cc.p(_x,_y))

    end
    -- 记录最后一次的播放状态
    self.lastDirType = dirType
    self.lastActionType = actionType
end


function StoryDrameTalk:close_callback()
    doStopAllActions(self.container)
    doStopAllActions(self.leftSpine)
    doStopAllActions(self.rightSpine)
    for i, object in ipairs(self.item_show_list) do
        doStopAllActions(object.item)
    end
    if self.leftSpine then
      
        self.leftSpine = nil
    end
    if self.rightSpine then
       
        self.rightSpine = nil
    end

    if self.rightSprite  then --
        self.rightSprite=nil 
    end 
    if self.leftSprite  then -- 
        self.leftSprite=nil 
    end
    self.item_show_list = nil
    story_view:hideTalk()
end
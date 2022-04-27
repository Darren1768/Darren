-- --------------------------------------------------------------------
--
--
-- @description:
--      主界面小地图
-- --------------------------------------------------------------------
BattleDramaDropItem =
    class(
    'BattleDramaDropItem',
    function()
        return ccui.Layout:create()
    end
)
local hero_model = HeroController:getInstance():getModel()
BattleDramaDropItem.WIDTH = 512
BattleDramaDropItem.HEIGHT = 162
function BattleDramaDropItem:ctor(is_bool, is_bools, size)
    self:retain()
    self.size = size or cc.size(BattleDramaDropItem.WIDTH, BattleDramaDropItem.HEIGHT)
    self:setContentSize(self.size)
    self.root_wnd = createCSBNote(PathTool.getTargetCSB('battledrama/battle_drama_drop_item'))
   
    self:addChild(self.root_wnd)
    self.container = self.root_wnd:getChildByName('root')
    self.bg = self.container:getChildByName('Image_bg')
    self.des = createRichLabel(20,cc.c3b(98,53,43),cc.p(0.5,0.5),cc.p(200,90),nil,nil,400)
    self.container:addChild(self.des)
    self.name_label = self.container:getChildByName("name_label")
    self.item_scrollview = self.container:getChildByName("item_scrollview")
    self.item_scrollview:setScrollBarEnabled(false)
    self.item_scrollview:setSwallowTouches(false)
    self.item_list = {}
    self:registerEvent()
end

function BattleDramaDropItem:registerEvent()
end
function BattleDramaDropItem:setSize(height)
    self.size = cc.size(BattleDramaDropItem.WIDTH,height)
    self:setContentSize(self.size)
    self.bg:setContentSize(BattleDramaDropItem.WIDTH,height)
end
function BattleDramaDropItem:setData(is_single,data,str,type  )
    self.des:setString("")
    self.item_scrollview:setVisible(true)
    self:setSize(BattleDramaDropItem.HEIGHT)
    if is_single == true then
        self:updateItem(data)
        self.name_label:setString(TI18N("当前关卡"))
        self:setSize(168)
        return
    end
      if str then
        local _lev =OrganizeController:getInstance():getModel():getMyTeamLev() or 1
        local _lev_show = {[1]="C",[2]="B",[3]="A",[4]="S",[5]="SS"}
        self.name_label:setString(TI18N("挂机收益等级：".._lev_show[_lev]))  

        self.des:setString(str)
        self:setSize(102)
        self.item_scrollview:setVisible(false)
        return
      end
    if type ==1 then 
        self:setSize(240)
    end
end
function BattleDramaDropItem:updateSprites(data)
    if not data then
        return
    end

    self.name_label:setString(data.name.."的队伍")  

    self.item_list={}
    local scale = 1
    local item = nil
    local item_width = HeroExhibitionItem.Width * scale * #data.members 
    local hero_array = hero_model:getAllHeroArray()
    local total_width = #data.members  * HeroExhibitionItem.Width * scale + #data.members  * 10
    local max_width = math.max(self.item_scrollview:getContentSize().width, total_width)
    self.item_scrollview:setContentSize(cc.size(470,200))
    self.item_scrollview:setPositionY(-80)
    self.item_scrollview:setInnerContainerSize(cc.size(max_width, self.item_scrollview:getContentSize().height))
    self.start_x = 70
    local list = data.members 
	local show_list = {}
    if #list == 0  then
        commonShowEmptyIcon(self.item_scrollview, true, {font_size = 22,scale = 0.7, text = TI18N("还没有队伍,快去\n创建队伍吧")})
        return 
    end
    local cnt=1
    for i,v in pairs(list) do
        if not self.item_list[i] then
            item = PlayerHead.new(PlayerHead.type.circle)
            item:setHeadLayerScale(1)
            item:setPosition(150, 60)

            item.name_label = createLabel(20, cc.c3b(98,53,43), nil,0, 0, "", item, nil, cc.p(0.5, 0.5))

            item.power_sprite = createSprite(PathTool.getResFrame("common","hl_common_28"), 0, 0, item, cc.p(1, 0.5))
            item.power_num  = CommonNum.new(101, item, 99999, -1, cc.p(0.5, 0.5))

            item.time_sprite = createScale9Sprite(PathTool.getResFrame("common2","hl_common_2124"), 94, 24)
            item:addChild(item.time_sprite)
            item.time_sprite:setCapInsets(cc.rect(13, 10, 1, 1))
            item.time_sprite:setContentSize(cc.size(94,24))

            item.time_label = createLabel(20, cc.c3b(99,79,48), nil,0, 0, "", item, nil, cc.p(0.5, 0.5))


            self.item_scrollview:addChild(item)
            self.item_list[i] = item
        end
        item = self.item_list[i]
        if item then
            local _x = self.start_x + (cnt - 1) * (HeroExhibitionItem.Width * scale +44) 
            item:setPosition(_x, 145)
       
            item:setHeadRes(v.face, false, LOADTEXT_TYPE, v.face_file, v.face_update_time)
            item:setLev(v.lev)
            item:setVIP(v.vip_lev) 
        
            item.name_label:setPosition(item:getContentSize().width/2,-15)
            item.name_label:setString(v.name)

            item.power_sprite:setOpacity(0)
            item.power_num:setOpacity(0)
            item.power_num:setNum(v.power)
            item.power_num:setPosition(item:getContentSize().width/2+10,-34)
            
            delayRun(item,i/60, function ()
                self.item_list[i].power_sprite:setOpacity(255)
                self.item_list[i].power_num:setOpacity(254)
                self.item_list[i].power_sprite:setPosition(self.item_list[i]:getContentSize().width/2-self.item_list[i].power_num:getContentSize().width/2+10,-44)
            end)
           

            item.time_sprite:setPosition(item:getContentSize().width/2,-74)
            item.time_label:setPosition(item:getContentSize().width/2,-75)
          
            -- 最后一次登录时间 或者在线
            if v.online == 1 then 
                item.time_label:setString("在线")
            else 
                local last_time = v.login_time  or 0
                local less_time = GameNet:getInstance():getTime() - last_time
                item.time_label:setString(TimeTool.GetTimeFormatFriendShowTime(less_time))
            end 

            cnt=cnt+1
        end
        

    end

end

function BattleDramaDropItem:updateItem(data)
    if not data then
        return
    end
    local scale = 0.9
    local item = nil
    local item_width = BackPackItem.Width * scale * #data
    local _lev =OrganizeController:getInstance():getModel():getMyTeamLev() or 1

    local total_width = #data * BackPackItem.Width * scale + #data * 10
    local max_width = math.max(self.item_scrollview:getContentSize().width, total_width)
    self.item_scrollview:setInnerContainerSize(cc.size(max_width, self.item_scrollview:getContentSize().height))
    --self.start_x = (self.item_scrollview:getContentSize().width - total_width) * 0.5
    self.start_x = 0
    for i, v in ipairs(data) do
        delayRun(self.item_scrollview,i / display.DEFAULT_FPS,function ()
            if not self.item_list[i] then
                item = BackPackItem.new(true, true)
                item:setAnchorPoint(0, 0.5)
                item:setScale(scale)
                self.item_scrollview:addChild(item)
                self.item_list[i] = item
            end
            item = self.item_list[i]
            if item then
                local _x = self.start_x + (i - 1) * (BackPackItem.Width * scale + 2)-2 
                item:setPosition(_x, self.item_scrollview:getContentSize().height / 2 -4)
                local data = {bid = v[1], num = v[2]}
                item:setBaseData(v[1], v[2] *_lev,true)
                item:setDefaultTip()
            end

        end)

    end

end

function BattleDramaDropItem:DeleteMe()
    if self.item_list and next(self.item_list or {}) ~= nil then
        for i, v in ipairs(self.item_list) do
            if v.DeleteMe then
                v:DeleteMe()
            end
        end
    end
    self:removeAllChildren()
    self:removeFromParent()
    self:release()
end

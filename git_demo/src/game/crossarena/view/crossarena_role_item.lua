--------------------------------------------
-- @description    : 
		-- 跨服竞技场 英雄 item
---------------------------------
local _controller = CrossarenaController:getInstance()
local _model = _controller:getModel()
local _string_format = string.format

CrossareanRoleItem = class("CrossareanRoleItem", function() 
        return ccui.Layout:create()
    end)

function CrossareanRoleItem:ctor(parent,index)
    if not parent then return end
    parent:addChild(self)
    self.index = index
    self:createRoorWnd()
    self:registerEvent()
end

function CrossareanRoleItem:createRoorWnd(  )
	self.size = cc.size(200, 442)
	self.root_wnd = createCSBNote(PathTool.getTargetCSB("crossarena/crossarena_role_item"))
    self:addChild(self.root_wnd)

    self.container = self.root_wnd:getChildByName("container")

    
    self.challenge_btn = self.container:getChildByName("challenge_btn")
    self.role_pic = self.challenge_btn:getChildByName("role_pic")
    local btn_size = self.challenge_btn:getContentSize()
    self.challenge_btn_label = createRichLabel(22, 1, cc.p(0.5, 0.5), cc.p(btn_size.width/2, 25))
    self.challenge_btn_label:setString(TI18N("挑战"))
    
    local image_stage = self.challenge_btn:getChildByName("image_stage")
    image_stage:addChild(self.challenge_btn_label)

    self.ticket_bid = Config.ArenaClusterData.data_const["arena_ticket"].val
    local item_config = Config.ItemData.data_get_data(self.ticket_bid) 
    if item_config then
        self.challenge_btn_label:setString(_string_format(TI18N("<img src='%s' scale=0.3 /><div fontcolor=#fbf0d9>3 挑战</div>"), PathTool.getItemRes(item_config.icon)))
    end

    self.txt_role_name = self.challenge_btn:getChildByName("txt_role_name")
    self.txt_score = self.challenge_btn:getChildByName("txt_score")
    self.txt_atk = self.challenge_btn:getChildByName("txt_atk")
    
    if self.index == 1 or self.index ==3 then
        self.container:setContentSize(cc.size(SCREEN_WIDTH, display.height))
    end
end

function CrossareanRoleItem:registerEvent(  )
    registerButtonEventListener(self.challenge_btn, handler(self, self.onClickRoleItem), false)

    EventManager:getInstance():Bind(CrossarenaEvent.Update_Single_Challenge_Role_Event,self, function ( data )
            if data and data.idx and self.data and self.data.idx == data.idx then
                self:setData(data)
            end
        end)
    
end

function CrossareanRoleItem:onClickRoleItem(  )
    if self.data and _model:checkCrossarenaIsOpen() then
        if self.data.rid == 0 then
            message(TI18N("新赛季已开启，请刷新对手"))
            return
        end
        _controller:sender25602( self.data.rid, self.data.srv_id )
    end
end

-- 挑战
function CrossareanRoleItem:onClickChallengeBtn(  )
    if self.data and _model:checkCrossarenaIsOpen() then
        if self.data.rid == 0 then
            message(TI18N("新赛季已开启，请刷新对手"))
            return
        end
        HeroController:getInstance():openFormGoFightPanel(true, PartnerConst.Fun_Form.CrossArena, {rid = self.data.rid, srv_id = self.data.srv_id}, HeroConst.FormShowType.eFormFight)
    end
end

function CrossareanRoleItem:setData( data, index )
	if not data then return end

	self.data = data

    -- 名称
    self.txt_role_name:setString(transformNameByServ(data.name or "", data.srv_id))

    -- 积分
    self.txt_score:setString(_string_format(TI18N("积分:%d"), data.score or 0))

    -- 战力
    self.txt_atk:setString(data.power or 0)

    -- 模型
    -- if self.role_spine then
    --     self.role_spine:DeleteMe()
    --     self.role_spine = nil
    -- end
    -- if data.look then
    --     self.role_spine = BaseRole.new(BaseRole.type.role, data.look)
    --     self.role_spine:setCascade(true)
    --     self.role_spine:setAnchorPoint(cc.p(0.5, 0))
    --     self.role_spine:setAnimation(0,PlayerAction.show,true)
    --     self.parent:addChild(self.role_spine, 1)

    --     local pos_x = 15 + (index-1)*(15+self.size.width)
    --     self.role_spine:setPosition(cc.p(pos_x+self.size.width*0.5, 480+225))
    --     if index and index == 2 then
    --         self.role_spine:setLocalZOrder(2)
    --     end
    -- end
    self:updateHeroInfo(data)
end

function CrossareanRoleItem:updateHeroInfo(data)
    
    
    if data.look then
        local bid = 10101
        local look_config  = Config.LooksData.data_data[data.look]
        if look_config then
            bid = look_config.partner_id
        end
        local res_id = PathTool.getPlistImgForDownLoad("bigbg/partnercard", "partnercard_" .. bid)
        self.item_load = loadSpriteTextureFromCDN(self.role_pic, res_id, ResourcesType.single, self.item_load) 
        self.role_pic:setScale(188/320)

    end
end



function CrossareanRoleItem:DeleteMe()
    -- if self.role_spine then
    --     self.role_spine:DeleteMe()
    --     self.role_spine = nil
    -- end
    EventManager:getInstance():UnBind(self)
end
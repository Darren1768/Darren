--------------------------------------------
-- @description    : 
		-- 宅室商店 item
---------------------------------
local _controller = HomeworldController:getInstance()
local _model = _controller:getModel()
local _string_format = string.format

HeroMainInfoHeroItem = class("HeroMainInfoHeroItem", function()
    return ccui.Widget:create()
end)

function HeroMainInfoHeroItem:ctor()
	self:configUI()
	self:registerEvent()

	self.is_can_buy = true
end

function HeroMainInfoHeroItem:configUI(  )
	self.size = cc.size(190, 200)
	self:setTouchEnabled(false)
    self:setContentSize(self.size)

	local csbPath = PathTool.getTargetCSB("hero/hero_main_info_hero_item")
    self.root_wnd = createCSBNote(csbPath)
    self:addChild(self.root_wnd)

    self.container = self.root_wnd:getChildByName("main_panel")
    self.container:setSwallowTouches(false)

    self.nomal_bg = self.container:getChildByName("nomal_bg")

    self.select_bg = self.container:getChildByName("select_bg")
   
	self.hero_icon = self.container:getChildByName("hero_icon")

	self.camp_bg = self.container:getChildByName("camp_bg")
    self.introduce_label =  self.container:getChildByName("introduce_label")

	self.camp_icon = self.container:getChildByName("camp_icon")

	self.camp_label = self.container:getChildByName("camp_label")


	self.name_bg = self.container:getChildByName("name_bg")

	self.name = self.container:getChildByName("name")
	self.quality_sprite = self.container:getChildByName("quality_sprite")
	self.quality_sprite:setScale(0.5)

	self.head_item = PlayerHead.new(PlayerHead.type.circle)
    self.hero_icon:addChild(self.head_item)

  
end

function HeroMainInfoHeroItem:registerEvent(  )
	registerButtonEventListener(self.container, function (  )
		if not self.data then return end
		if self.callback then
			self.callback()
		end
	end, true, nil, nil, nil, nil, true)

end

-- shop_type:1家具商城 2:出行商城 3:随机商城
function HeroMainInfoHeroItem:setData( data )
	if not data  then return end
	self.data = data
	local _config =  Config.PartnerData.data_partner_base[self.data.bid]
	if _config then 

		local use_skin = self:findUseSkin(data)
		if use_skin and use_skin ~= 0 then
			local skin_config = Config.PartnerSkinData.data_skin_info[use_skin]
			if skin_config then
				-- self:setHeadImg(skin_config.head_id)
				self.head_item:setHeadRes(skin_config.head_id, false, LOADTEXT_TYPE)

			end
		else
			local star = data.star or data.init_star or 1
			local key = getNorKey(data.bid, star)
			local star_config = Config.PartnerData.data_partner_star(key)
			if star_config then
				-- self:setHeadImg(star_config.head_id)
				self.head_item:setHeadRes(star_config.head_id, false, LOADTEXT_TYPE)

			end
		end

	end 

	 -- 类型 2-5
	 local _type_list_data ={
		[2]={name ="法" ,res = "hl_common_262"},
		[3]={name ="战" ,res = "hl_common_258"}, --红 
		[4]={name ="坦" ,res = "hl_common_261"},
		[5]={name ="辅" ,res = "hl_common_260"}}
	local _type_data  = _type_list_data[ self.data.type]  
	local type_res = PathTool.getResFrame("common",  _type_data.res)
	loadSpriteTexture( self.camp_icon, type_res)
	self.camp_label:setString(_type_data.name )

	loadSpriteTexture(self.quality_sprite, PathTool.geHeroS(self.data.quality), LOADTEXT_TYPE_PLIST)
	self.name:setString(StringUtil.branchStr(self.data.name ))

	if self.data.hero_pos then 
		self.introduce_label:setString(StringUtil.branchStr(self.data.hero_pos))

	end 
	
    self:setSelected(self.data.info_select)
end

function HeroMainInfoHeroItem:findUseSkin(info)
    if info.ext_data then
        local ext = info.ext_data or {}
        for i, v in ipairs(ext) do
            if v.key == 5 then
                return v.val
            end
        end
    end

    if info.ext then
        local ext = info.ext or {}
        for i, v in ipairs(ext) do
            if v.key == 5 then
                return v.val
            end
        end
    end

    if info.use_skin then
        return info.use_skin
    end
    return 0
end

-- shop_type:1家具商城 2:出行商城 3:随机商城
function HeroMainInfoHeroItem:setSelected(status)
	 if status then 
		self.hero_icon:setScale(1)
		self.hero_icon:setPositionY(133)
	 else
		self.hero_icon:setScale(0.68)
		self.hero_icon:setPositionY(152)
	 end

	self.nomal_bg:setVisible(not status)
	self.select_bg:setVisible(status)
	self.camp_bg:setVisible(status)
	self.camp_icon:setVisible(status)
	self.camp_label:setVisible(status)
	self.name_bg:setVisible(status)
	self.name:setVisible(status)
	self.quality_sprite:setVisible(status)
	self.introduce_label:setVisible(status)
end


function HeroMainInfoHeroItem:addCallBack(callback)
    self.callback = callback
end
function HeroMainInfoHeroItem:DeleteMe(  )
    EventManager:getInstance():UnBind(self)
	self:removeAllChildren()
	self:removeFromParent()
end
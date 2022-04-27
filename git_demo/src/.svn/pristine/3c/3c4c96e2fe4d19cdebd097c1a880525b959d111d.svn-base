---------------------------------
-- @description: 区场景建筑
---------------------------------
local _leagueexplore_ctrl = OrganizeController:getInstance()
local model = OrganizeController:getInstance():getModel()

local _string_format = string.format

OrganizeNoticePanel = OrganizeNoticePanel or BaseClass()

function OrganizeNoticePanel:__init(data)
	self.data = data or {}

	self:createRootwnd()
end

function OrganizeNoticePanel:createRootwnd()
    self.size = cc.size(579, 118)
	self.root = ccui.Widget:create()
	self.root:setAnchorPoint(0.5, 0.5)
	self.root:setContentSize(self.size)


	self.scrollview = createScrollView(self.size.width, self.size.height, 0, 118, self.root)
	self.scrollview:setAnchorPoint(0,1)
	
end


function OrganizeNoticePanel:setParentWnd(parent)
	if tolua.isnull(parent) then return end
	self.parent_wnd = parent
	if self.data ~= nil then
		self.parent_wnd:addChild(self.root, 0)
	end
end

function OrganizeNoticePanel:setBaseData(data)
	if not data then 
		-- self.scrollview:setVisible(false)
		return
	end 
	self.scrollview:setVisible(true)
	local _data = data.hook_team_log_info_list
	-- local _data =  {{"sdfasflsdlalsdflsalfasdlfals;dfa;sdfkas;dfdlfllkd"},{"sdfasflsdlalsdflsalfasdlfals;dfa;sdfkas;dfdlfllkd"},{"sdfasflsdlalsdflsalfasdlkas;dfdlfllkd"}}
	
	printLuaTable(_data)

	self.scrollview:setInnerContainerSize(cc.size(self.size.width, #_data * 68-5))
	for i=1,#_data do
		local item =self:createItem()
        item.image_bg:setPosition(cc.p(0,65*(i-1) +86))
		-- local _str ="<div fontcolor=#70AF49>"+ item. +"</div>" +"马上开始！谁将登上冠军宝座，参与比赛和趣味竞猜可活动丰厚奖励哦~"
		item.label:setString(_data[#_data-i+1].msg)
		-- item.label:setString("马上开始！谁将登上冠军宝座，参与比赛和趣味竞猜可活动丰厚奖励哦~马上开始！谁将登上冠军宝座")

    end

end

function OrganizeNoticePanel:createItem()
	local _item = {}
	 local res = PathTool.getResFrame("common2", "hl_common_2128")
	 local image_bg  =createImage(self.scrollview,res, 0, 0, cc.p(0, 1), true, 9, true) --createScale9Sprite(res, 0, 0, LOADTEXT_TYPE_PLIST, self.scrollview)-- 
	 image_bg:setContentSize(cc.size(579, 58))
	--  image_bg:setCapInsets(cc.rect(3, 4, 1, 1))



	 local rich_label = createRichLabel(22, cc.c3b(129,104,65), cc.p(0,0.5), cc.p(8,28),nil ,nil ,564)
	 image_bg:addChild(rich_label)
	 rich_label:setString("")
	 _item.image_bg = image_bg
	 _item.label = rich_label
	 return _item
end 

function OrganizeNoticePanel:getData()
	return self.data
end

function OrganizeNoticePanel:getRoot()
	return self.root
end

function OrganizeNoticePanel:isPanelStatus(status )
	self.scrollview:setVisible(status)
	self.root:setVisible(status)
end

function OrganizeNoticePanel:__delete()
    if self.build_load then
        self.build_load:DeleteMe()
        self.build_load = nil
	end
	if self.effect then
		self.effect:setVisible(false)
		self.effect:clearTracks()
		self.effect:runAction(cc.RemoveSelf:create(true))
	end
	if self.root:getParent() then
		self.root:removeAllChildren()
		self.root:removeFromParent()
	end
end
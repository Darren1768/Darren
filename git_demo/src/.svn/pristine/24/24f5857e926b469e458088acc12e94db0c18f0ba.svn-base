--
-- Date: 
--
BattleBorderSpineRenderer = BattleBorderSpineRenderer or BaseClass()
local size = cc.Director:getInstance():getVisibleSize()
local table_insert = table.insert
local table_remove = table.remove

--@ spine_scale2 仅模型的缩放比例 (替换大资源时间段用) 
function BattleBorderSpineRenderer:__init(screen_pos, spine_name,anima_name, scale, career, group, spine_type, spine_scale2)
	print("=============spine_name=======anima_name============",spine_name,anima_name)
	local spine_scale =1
	self.scale = scale or spine_scale or 1
    self.spine_scale2 = spine_scale2 or 1
	self.is_ScaleX = 1
	self.spine_type = spine_type
	self.active = true
	self.id = autoId()
	self.screen_pos = screen_pos

	self.is_in_action = false
	self.cache_act_list = {}
	-- 根节点
	self.root = cc.NodeGrid:create()
	self.root:setCascadeOpacityEnabled(true)
	self.root:setPosition(screen_pos)
	self.root:setAnchorPoint(0.5, 0.5)

	-- 模型节点
	self.spine_root = ccui.Widget:create()
	self.spine_root:setCascadeOpacityEnabled(true)
	self.spine_root:setAnchorPoint(0.5, 0.5)
    self.spine_root:setScale(self.spine_scale2)

	self.up_root = ccui.Widget:create()
	self.up_root:setCascadeOpacityEnabled(true)

	self.career = career
	self.height = 0
	self.isRun = false
	self.is_call_ready = false
	self.body_spine_name = spine_name		-- 当前资源名
	self.base_action_name = anima_name		-- 初始化动作名
	self.group = group

	-- print("------- math.random(0,1) ----------------------", math.random(0,1) )
    if math.random(0,1) > 0.5 then 
	    self.dir_x =1 
	else
		self.dir_x =-1 
    end 
	if math.random(0,1) > 0.5 then 
	    self.dir_y =1 
	else
		self.dir_y =-1 
    end 

	self.role_num = 0
	self.is_move = false

	self.speed = math.random(1,3)


	if spine_name ~= nil then
		self:removeBody()
        self.spine = createSpineByName(spine_name, action_name)
		self.spine:setAnchorPoint(0.5, 0)
		self.spine:setAnimation(0, anima_name, true)
		self.spine_root:addChild(self.spine)
	
	end
	self.root:addChild(self.spine_root, 2)
	self.root:addChild(self.up_root,3)
	
	self.root:setScale(self.scale)
	self.role_height = 120 * self.scale       -- 身高180
	self.is_init = false

	-- delayOnce(self.root,1/60 ,function() 
	-- 	local _box = self.spine:getBoundingBox()
	-- 	self.up_root:setPosition(cc.p(_box.width/2,_box.height))
	-- end )
	
	delayRun(self.up_root,1/60,function() 
		local _box = self.spine:getBoundingBox()
		self.up_root:setPosition(cc.p(0,_box.height))
		self:createXiuLing()
		
	end)
	
end

function BattleBorderSpineRenderer:showSpineModel(visible)
	self.spine_root:setVisible(visible)
	self.up_root:setVisible(visible)
	self.top_effect_root:setVisible(visible)
	self.bottom_effect_root:setVisible(visible)
end

function BattleBorderSpineRenderer:hideSpineModel()
	-- self.spine_root:setVisible(visible)

	self.spine_root:runAction(cc.FadeOut:create(0.1))
	self.up_root:setVisible(false)
	self.top_effect_root:setVisible(false)
	self.bottom_effect_root:setVisible(false)
end
function BattleBorderSpineRenderer:setVisible(visible)
	self.root:setVisible(visible)
end


function BattleBorderSpineRenderer:setPosByGrid(pos)
	local pos = pos
	if not tolua.isnull(self.root) then
		self.root:setPosition(pos)
	end
end

function BattleBorderSpineRenderer:getPosition()

	return cc.p(self.root:getPosition())
end

function BattleBorderSpineRenderer:doRun()
	if self.isRun then return end
	self.isRun = true
	self:playActionOnce(PlayerAction.run)
end


--统一创建模型了,方便做管理
function BattleBorderSpineRenderer:createSpine(spine_name,action_name,is_loop)
	if action_name == "stand" then 
		is_loop=true
	end 
	local spine = createArmature(spine_name,action_name)
	if not tolua.isnull(spine) then
		spine:setAnimation(0, action_name, is_loop)
		spine:setToSetupPose()
	end
	return  spine
end

-- 创建头顶修灵
function BattleBorderSpineRenderer:createXiuLing()
	    
		local res = PathTool.getResFrame('common2', 'hl_common_0029')
		if not self.name_bg then 
			self.name_bg = createSprite(res,-18,8, self.up_root, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST)
			self.name_bg:setCascadeOpacityEnabled(true)

			self.xiuling_label = createWithSystemFont(lev,DEFAULT_FONT, 14)			
			self.xiuling_label:setPosition(80, 20)
			self.xiuling_label:enableOutline(Config.ColorData.data_color4[2], 1)
			self.xiuling_label:setAnchorPoint(cc.p(0.5, 0.5))
			self.name_bg:addChild(self.xiuling_label, 1)


            -- 修灵特效
			self.xiuling_effect = createEffectSpine("E20000", cc.p(self.name_bg:getPositionX()/2, self.name_bg:getPositionY()+50), cc.p(0.5, 0.5), true, "action")
			self.xiuling_effect:setAnimation(0, "action", true)
			self.xiuling_effect:setAnchorPoint(cc.p(0.5,0.5))
			self.up_root:addChild(self.xiuling_effect)
			
            -- 交战标识
			self.battle_node = createSprite(PathTool.getResFrame("common2", "hl_common_0041") , self.name_bg:getPositionX()-60,self.name_bg:getPositionY()+40,self.up_root, cc.p(0, 0),LOADTEXT_TYPE_PLIST,11)

		end
		
	
		self.xiuling_label:setString("名字")

end 

function BattleBorderSpineRenderer:createrSpineBtn(callback)

	 if self.spine then 
        if not self.spine_btn then 
             local size_bound = self.spine:getBoundingBox()
			 self.spine_btn  = ccui.Layout:create()
			 self.spine_btn:setPosition(cc.p(0,0))
			 self.spine_btn:setTouchEnabled(true)
			 self.spine_btn:setContentSize(size_bound)
			 self.spine_btn:setAnchorPoint(0.5,0)
			 self.spine:addChild( self.spine_btn)
			
		end 
		self.spine_btn:addTouchEventListener(function(sender,event_type)
			if event_type == ccui.TouchEventType.ended then
				if callback then  
					callback()
				end
			end  
		end)

	 end

end





function BattleBorderSpineRenderer:removeBody()
	if not tolua.isnull(self.spine) then
		self.spine:setVisible(false)
		self.spine:clearTracks()
		self.spine:removeFromParent()
	end

	

	self.up_root:removeAllChildren()
	self.spine = nil
	self.body_action_name = nil
	self.spine_body_name = nil
end

function BattleBorderSpineRenderer:addToLayer(layer, zOrder)
	if tolua.isnull(layer) or tolua.isnull(self.root) then return end
	local size = cc.Director:getInstance():getWinSize()
	if zOrder == nil then
		local screen_pos = cc.p(self.root:getPosition())
		layer:addChild(self.root, size.height - screen_pos.y)
	else
		layer:addChild(self.root, zOrder)
	end
end


--scale 放大倍数
--time1,2 放大和缩回所用时间，单位秒数
function BattleBorderSpineRenderer:setScale(scale, time1, time2, time3)
	-- body
	local scale_act = cc.ScaleTo:create(time1 / 2, scale)
	local delay = cc.DelayTime:create(time2)
	local scale_back = cc.ScaleTo:create(time3 / 2, self.scale)
	self:runAction(cc.Sequence:create(scale_act, delay, scale_back))
end

function BattleBorderSpineRenderer:release(bool, type)
	local time = (type == 0) and 0.1 or 0.5
	local fadeout
	if bool then
		fadeout = cc.Sequence:create(cc.CallFunc:create(function()
			if self.spine then
				self.spine:runAction(cc.FadeOut:create(time))
			end
		end),cc.DelayTime:create(time))
	end

	if not tolua.isnull(self.root) then
		self.root:runAction(cc.Sequence:create(fadeout,cc.CallFunc:create(function()
			if self.spine then
				self.spine:setVisible(false)
				self.spine:clearTracks()
				self.spine:removeFromParent()
			end
			self.spine_root:setVisible(false)
			self.spine_root:removeAllChildren()
			self.root:setVisible(false)
			if self.root:getParent() then
				self.root:removeFromParent()
			end
			self.root:removeAllChildren()
		end)))
	end
end

function BattleBorderSpineRenderer:realrelease(bool)
	if bool then
		if not tolua.isnull(self.spine_root) then
			self.spine_root:runAction(cc.FadeOut:create(0.5))
		end
	end
end


-- 设灰度
function BattleBorderSpineRenderer:setBlack(enable)
	if not BattleController:getInstance():isInFight() then return end
	if self.is_die then return end
	local color1 = color1 or cc.c3b(128, 128, 128)
	local color2 = color2 or cc.c3b(255, 255, 255)
	if enable then
		self.black_type = "setBlack"
		for _, v in pairs(self.spine_root:getChildren()) do
			v:setColor(color1)
		end
	else
		self.black_type = nil
		for _, v in pairs(self.spine_root:getChildren()) do
			v:setColor(color2)
		end
	end	
end


function BattleBorderSpineRenderer:getSpineName()
	return self.spine_name
end

function BattleBorderSpineRenderer:addChild(...)
	if not tolua.isnull(self.spine_root) and self.spine_root then
		self.spine_root:addChild(...)
	end
end

function BattleBorderSpineRenderer:setActionName(action_name, action_res)
	self.action_name = action_name
	self.action_res = (action_res == nil) and action_name or action_res;
end

function BattleBorderSpineRenderer:getActionName()
	return self.action_name
end 

function BattleBorderSpineRenderer:getActionRes()
	return self.action_res
end

--==============================--
--desc:播放动作的统一入口
--@act:
--@return 
--==============================--
function BattleBorderSpineRenderer:runAction(act)
	if act == nil then return end
	print("-----------BattleBorderSpineRenderer:runAction------------------------",act )
	if not tolua.isnull(self.root) then
		self.root:runAction(act) 
	end
end

function BattleBorderSpineRenderer:__delete()
	for i,v in ipairs(self.passive_skill_list) do
		doStopAllActions(v)
	end
	self.passive_skill_list = nil
	for i,v in ipairs(self.passive_skill_pool) do
		doStopAllActions(v)
	end
	self.passive_skill_pool = nil
	doStopAllActions(self.root)

	if  not tolua.isnull(self.shadow) then
		self.shadow:removeFromParent()
		self.shadow = nil
	end
	if not tolua.isnull(self.role_effect) then
		self.role_effect:removeFromParent()
		self.role_effect = nil
	end
	if not tolua.isnull(self.boss_effect) then
		self.boss_effect:removeFromParent()
		self.boss_effect = nil
	end
	if not tolua.isnull(self.spine) then
		self.spine:setVisible(false)
		self.spine:clearTracks()
		self.spine:removeFromParent()
	end
   
	self.spine = nil

	self.buff_list_item = nil
	if not tolua.isnull(self.spine_root) then
		self.spine_root:removeAllChildren()
	end
	if not tolua.isnull(self.root) then
		self.root:removeAllChildren()
	end
	if self.root:getParent() then
		self.root:removeFromParent()
	end
end
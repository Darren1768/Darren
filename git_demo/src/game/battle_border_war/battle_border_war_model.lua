-- --------------------------------------------------------------------
-- 这里填写简要说明(必填),
--
-- @description:
--      转盘活动
-- --------------------------------------------------------------------
BattleBorderWarModel = BattleBorderWarModel or BaseClass()
local _tolua_isnull = tolua.isnull
function BattleBorderWarModel:__init(ctrl)
    self.ctrl = ctrl
    self:config()
end

function BattleBorderWarModel:config()
	self.all_object = {}
	self.battle_border_scene = nil 
	

end




--创建战斗人物
--@param data:战斗人物列表
function BattleBorderWarModel:createBattleRole(data)
	data ={}
	data.objects ={}
	for i=1,4 do 
		data.objects[i] ={}
		data.objects[i].index = i
		if i <2 then 
		data.objects[i].group = 1  -- 1 我方 2 敌方
        else
			data.objects[i].group=2
		end 
	end 

	--创建角色
	self.roleCnt=0
	self.all_object={}
	self.isStartUpdate=false
	local _render = RenderMgr:getInstance()
	self:unSpineMovescheduleUpdate()

	for i, v in ipairs(data.objects or {}) do
		_render:doNextFrame(function() 
			self:addBattleRole(v,#data.objects)
		end)
		
	end

end


--添加/复活角色
--param data:角色信息数据
function BattleBorderWarModel:addBattleRole(data,count)
	    local  screen_pos =cc.p(100,100)
		local  spine_name = "H103030"
		local  anima_name = "stand"
		local role = BattleBorderSpineRenderer.New(screen_pos,spine_name,anima_name)

		self.battle_border_scene = self.ctrl:getCurrentScene()

		if self.battle_border_scene then 
			self.battle_border_scene:addRoleToLayer1(role)
		end 
		if self.all_object then
			self.all_object[data.index] = role
		end
		self.roleCnt=self.roleCnt+1 

		if count and count ==self.roleCnt  then
			print("-------------------------addRoleToLayer-----------------",self.battle_border_scene._layer_index)
			self:spineMovescheduleUpdate()
		end


end


--定时器开启
function BattleBorderWarModel:spineMovescheduleUpdate()
    if self.isStartUpdate then return end
    self.isStartUpdate = true
	local num =0
	local all_num  =0
    local function su(dt)
		num = num + 1
		all_num =all_num +1
		if num >= 2 then
			num = 0
            self:spineUpdate(dt)
		end 
		if all_num > 600 then 
			self:unSpineMovescheduleUpdate()
		end 
    end
    if self.battle_border_scene.map_layer and not _tolua_isnull(self.battle_border_scene.map_layer) then
        self.battle_border_scene.map_layer:scheduleUpdateWithPriorityLua(su, 0)
    end
end

--定时器关闭
function BattleBorderWarModel:unSpineMovescheduleUpdate()
    if not self.isStartUpdate then return end
    self.isStartUpdate = false
	print("-------------unscheduleUpdate----1--------")
    if  self.battle_border_scene.map_layer and not _tolua_isnull( self.battle_border_scene.map_layer) then
		print("-------------unscheduleUpdate------2------")
		self.battle_border_scene.map_layer:unscheduleUpdate()
    end
end

--每一帧更新
function BattleBorderWarModel:spineUpdate()
	if  not  self.isStartUpdate then return end 

	for i, spine_render in ipairs(self.all_object or {}) do
		if not spine_render then 
			return
		end
		local _pos =spine_render:getPosition()
	    -- --方向
		if spine_render.dir_x  < 0 then  
			spine_render.spine:setScaleX(-1)
		else
			spine_render.spine:setScaleX(1)
		end

	
		print("----------spine_render---------------",spine_render.speed)
		--范围
		if _pos.x > 1000 or _pos.x <100 then 
			spine_render.dir_x = -spine_render.dir_x
		end

		if _pos.y > 300 or _pos.y < 50 then 
			spine_render.dir_y = -spine_render.dir_y 
	    end 

        local _x = _pos.x + spine_render.speed * spine_render.dir_x 
	    local _y = _pos.y + spine_render.dir_y  * spine_render.speed 
		--层级
		spine_render.root:setZOrder(1200- math.floor(_y))
		spine_render:setPosByGrid(cc.p(_x , _y))
	end
end




------名字--------


--创建战斗人物
--@param data:战斗人物列表
function BattleBorderWarModel:createName(data)
	data ={}
	data.objects ={}
	for i=1,9 do 
		data[1]={"名字"}
		
	end 

   
end



function BattleBorderWarModel:__delete()
end
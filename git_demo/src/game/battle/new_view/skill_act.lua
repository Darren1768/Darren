-- --------------------------------------------------------------------
-- 
-- 
-- @description:
-- [文件功能:技能动作基础类具体实现]
-- --------------------------------------------------------------------
-- BATTLE_SCREENWIDTH = 720
-- BATTLE_SCREENHEIGHT = 460
GIRD_POS_OFFSET = 9  -- 0.21  -- 9  1/43
-- 左边的站位格子
-- Pos2GridLeft = {
-- 	{x = 27, y = 0}, {x = 28, y =6}, {x = 29, y = 12}
-- 	,{x = 17, y = 0}, {x = 18, y = 6}, {x = 19, y = 12}
-- 	,{x = 7, y = 0}, {x = 8, y = 6}, {x = 9, y = 12}
--     ,{x = 15, y = 28}
--     ,{x = 11, y = 24}
-- }
-- -- 右边的站位格子
-- Pos2GridRight = {
-- 	 {x = 53, y = 0},{x = 52, y = 6},{x = 51, y = 12}
-- 	, {x = 63, y = 0}, {x = 62, y = 6}, {x = 61, y = 12}
-- 	, {x = 73, y = 0}, {x = 72, y = 6}, {x = 71, y = 12}
--     , {x = 65, y = 28}
--     , {x = 69, y = 24}
-- }

-- -- 90 距离
-- Pos2GridLeft = {
-- 	{x = 28.1, y = 0}, {x = 28.1, y =17.8}, {x = 28.1, y = 35.6}
-- 	,{x = 16.8, y = 0}, {x = 16.8, y = 17.8}, {x = 16.8, y = 35.6}
-- 	,{x = 5.6, y = 0}, {x = 5.6, y = 17.8}, {x = 5.6, y = 35.6}
--     ,{x = 15, y = 28}
--     ,{x = 11, y = 24}
-- }
-- -- 右边的站位格子
-- Pos2GridRight = {
-- 	 {x = 61.9, y = 0},{x = 61.9, y = 17.8},{x = 61.9, y = 35.6}
-- 	, {x = 73.1, y = 0}, {x = 73.1, y = 17.8}, {x = 73.1, y = 35.6}
-- 	, {x = 84.4, y = 0}, {x = 84.4, y = 17.8}, {x = 84.4, y = 35.6}
--     , {x = 65, y = 28}
--     , {x = 69, y = 24}
-- }



-- -- 7个格子 距离
-- Pos2GridLeft = {
-- 	{x =37.1, y = 0}, {x = 37.1, y =17.8}, {x = 37.1, y = 35.6}
-- 	,{x = 22.2, y = 0}, {x = 22.2, y = 17.8}, {x = 22.2, y = 35.6}
-- 	,{x = 7.6, y = 0}, {x = 7.6, y = 17.8}, {x = 7.6, y = 35.6}
--     ,{x = 15, y = 28}
--     ,{x = 11, y = 24}
-- }
-- -- 右边的站位格子
-- Pos2GridRight = {
-- 	 {x = 66, y = 0},{x = 66, y = 17.8},{x = 66, y = 35.6}
-- 	, {x =80.7, y = 0}, {x = 80.7, y = 17.8}, {x =80.7, y = 35.6}
-- 	, {x = 95, y = 0}, {x = 95, y = 17.8}, {x =95, y = 35.6}
--     , {x = 65, y = 28}
--     , {x = 69, y = 24}
-- }

-- -- 29个格子 距离
-- Pos2GridLeft = {
-- 	{x =8.58, y = 0}, {x = 8.58, y =17.8}, {x = 8.58, y = 35.6}
-- 	,{x = 5.25, y = 0}, {x = 5.25, y = 17.8}, {x =5.25, y = 35.6}
-- 	,{x = 1.77, y = 0}, {x = 1.77, y = 17.8}, {x =  1.77, y = 35.6}
--     ,{x = 15, y = 28}
--     ,{x = 11, y = 24}
-- }
-- -- 右边的站位格子
-- Pos2GridRight = {
-- 	 {x = 16.17, y = 0},{x =16.17, y = 17.8},{x = 16.17, y = 35.6}
-- 	, {x =19.58, y = 0}, {x = 19.58, y = 17.8}, {x =19.58, y = 35.6}
-- 	, {x = 22.99, y = 0}, {x = 22.99, y = 17.8}, {x =22.99, y = 35.6}
--     , {x = 65, y = 28}
--     , {x = 69, y = 24}
-- }

-- 43个格子 距离
-- Pos2GridLeft = {
-- 	{x =5.88, y = 0}, {x = 5.88, y =17.8}, {x = 5.88, y = 35.6}
-- 	,{x = 3.56, y = 0}, {x = 3.56, y = 17.8}, {x =3.56, y = 35.6}
-- 	,{x = 1.19, y = 0}, {x = 1.19, y = 17.8}, {x =  1.19, y = 35.6}
--     ,{x = 15, y = 28}
--     ,{x = 11, y = 24}
-- }
-- -- 右边的站位格子
-- Pos2GridRight = {
-- 	 {x = 10.62, y = 0},{x =10.62, y = 17.8},{x =10.62, y = 35.6}
-- 	, {x =13.16, y = 0}, {x = 13.16, y = 17.8}, {x =13.16, y = 35.6}
-- 	, {x = 15.51, y = 0}, {x = 15.51, y = 17.8}, {x =15.51, y = 35.6}
--     , {x = 65, y = 28}
--     , {x = 69, y = 24}
-- }


-- GIRD_POS_OFFSET = 1/43
-- 43个格子 距离
Pos2GridLeft = {
	{x =5.86, y = 0}, {x = 6.07, y =17.8}, {x = 6.28, y = 35.6}
	,{x = 3.53, y = 0}, {x = 3.74, y = 17.8}, {x =3.95, y = 35.6}
	,{x = 1.21, y = 0}, {x = 1.42, y = 17.8}, {x =  1.63, y = 35.6}
    ,{x = 15, y = 28}
    ,{x = 11, y = 24}
}
-- 右边的站位格子
Pos2GridRight = {
	 {x = 10.88, y = 0},{x =10.67, y = 17.8},{x =10.46, y = 35.6}
	, {x =13.2, y = 0}, {x = 12.99, y = 17.8}, {x =12.78, y = 35.6}
	, {x = 15.53, y = 0}, {x = 15.32, y = 17.8}, {x =15.11, y = 35.6}
    , {x = 65, y = 28}
    , {x = 69, y = 24}
}

NormalPosGridRight ={
	{ x = 42, y = 0 }, { x = 42, y = 6 }, { x = 42, y = 12 }
	, { x = 42, y = 0 }, { x = 42, y = 6 }, { x = 42, y = 12 }
	, { x = 42, y = 0 }, { x = 42, y = 6 }, { x = 42, y = 12 }
    , {x = 42, y = 28}
}

--战斗人物层级
BattleRoleZorder = {
	[1] = {
		998,995,992,999,996,993,997,994,991,990,989
	},
	[2] = {
		998,995,992,999,996,993,997,994,991,990,989
	}
}

pos_to_col = {
	[1]=1,
	[2]=2,
	[3]=3,
	[4]=1,
	[5]=2,
	[6]=3,
	[7]=1,
	[8]=2,
	[9]=3
}

SkillAct = SkillAct or {}

function SkillAct.newPos2Gird(type, pos, is_left, group)

	
	if pos == 0 then
		message(TI18N("位置不能为0"))
	end
    if pos == 31 or pos == 32 then
        pos = 10
    elseif pos == 41 or pos == 42 then
    	pos = 11
	elseif group == 2 then --如果是敌方阵型，这里需要减掉5
		pos =(pos - GIRD_POS_OFFSET) or 1
	else
		pos = pos or 1
	end
	pos = math.max(1, pos)
	if is_left then
		return Pos2GridLeft[pos]
	else
		if BattleController:getInstance():getIsNoramalBattle() then
			return NormalPosGridRight[pos]
		else
			return Pos2GridRight[pos]
		end
	end
end

function gridSizeX()  -- 9
	-- local max_grid = 90  --8
	-- return SCREEN_WIDTH / max_grid --* display.getMaxScale()

	-- local max_grid = 102.3  --7
	-- local max_grid = 24.69  --29
	local max_grid = 16.65  --43
	-- return (SCREEN_WIDTH-4)/display.getMaxScale() / max_grid --* display.getMaxScale()
	return (SCREEN_WIDTH-4)/display.getMaxScale() / max_grid --* display.getMaxScale()
end
function gridSizeY()  -- 16 
	local max_grid = 151  -- 8.47 
	return SCREEN_HEIGHT / max_grid --* display.getMaxScale()
end

function gridPosToScreenPos(pos)
	return cc.p(pos.x * gridSizeX(), pos.y * gridSizeY())
end
function screenPosToGridPos(pos)
	return cc.p(pos.x / gridSizeX(), pos.y / gridSizeY())
end
--普通结束回调
function SkillAct.normalFinish(attacker)
	return cc.CallFunc:create(function()
		BattleController:getInstance():getModel():actFinish(attacker)
	end)
end
--普通开始回调
function SkillAct.normalStart(attacker)
	return cc.CallFunc:create(function()
		BattleController:getInstance():getModel():actStart(attacker)
	end)
end
--添加延迟
function SkillAct.addDelay(attacker, delay_time, act, next_delay_time)
	if delay_time == 0 or delay_time == nil then
		if next_delay_time == 0 or next_delay_time == nil then
			return cc.Sequence:create(SkillAct.normalStart(attacker), act, SkillAct.normalFinish(attacker)) 
		else
			return cc.Sequence:create(SkillAct.normalStart(attacker), act, cc.DelayTime:create(next_delay_time / 30), SkillAct.normalFinish(attacker)) 
		end
	else
		if next_delay_time == 0 or next_delay_time == nil then
			return cc.Sequence:create(SkillAct.normalStart(attacker), cc.DelayTime:create(delay_time / 30), act, SkillAct.normalFinish(attacker))
		else
			return cc.Sequence:create(SkillAct.normalStart(attacker), cc.DelayTime:create(delay_time / 30), act, cc.DelayTime:create(next_delay_time / 30), SkillAct.normalFinish(attacker))
		end
	end
end
--通用延迟
function SkillAct.dt(time)
	return cc.DelayTime:create(time / display.DEFAULT_FPS * 2)
end
--偏移角度
function SkillAct.changeRotation(target, pos)
	local selfpos = cc.p(target:getPosition())
	local p = {}
	p.x = selfpos.x - pos.x
	p.y = selfpos.y - pos.y
	local radian = math.atan(p.y / p.x)
	local degree = -(radian *(180 / math.pi))
	target:setRotation(degree)
end
--移动
function SkillAct.move(attacker, spine_renderer, action_name, target_pos, move_time, direct, is_reverse, is_jump, is_jump_delay)
	local start_fun = cc.CallFunc:create(function()
	end)

	local end_fun = cc.CallFunc:create(function()
	end)

	if not spine_renderer.is_die and BattleController:getInstance():getModel():getBuffTag(attacker.pos) then --由于受伤动作独立,这里在跑动之前先暂停可能在播放的受击后移动作，防止移动位移不对
    	doStopAllActions(spine_renderer.root)
	end

	local move = cc.MoveTo:create(move_time / display.DEFAULT_FPS, target_pos)
	local act = cc.EaseExponentialOut:create(move)
	if is_jump then
		return cc.Sequence:create(start_fun, cc.DelayTime:create(is_jump_delay / display.DEFAULT_FPS), act, end_fun)
	else
		return cc.Sequence:create(start_fun,cc.Spawn:create(act, start_fun), end_fun)
	end
end

--移动过去
function SkillAct.MoveTo(attacker, spine_renderer, action_name, direct, target_pos, delay_time, move_time, is_reverse, is_jump, is_jump_delay)
	-- 如果这个时候处于受击,则不要马上移动,会出现乱跑
	-- if attacker.play_hurt_ing == true then
	-- 	if delay_time == nil or delay_time == 0 then		-- 还在受击中的时候 延迟才做动作 要不又问题
	-- 		delay_time = 20
	-- 	else
	-- 		delay_time = delay_time * 2
	-- 	end
	-- end
	return SkillAct.addDelay(attacker, delay_time, SkillAct.move(attacker, spine_renderer, action_name, target_pos, move_time, direct, is_reverse, is_jump, is_jump_delay))
end

-- 移动回来
function SkillAct.moveBack(attacker, spine_renderer, action_name, direct, target_pos, delay_time, move_time, is_reverse, is_jump, is_jump_delay)
	return SkillAct.addDelay(attacker, delay_time, SkillAct.move(attacker, spine_renderer, action_name, target_pos, move_time, direct, is_reverse, is_jump, is_jump_delay))
end

-- 抖屏
function SkillAct.shakeScreen(attacker, delay_time, shake_bid)
	return SkillAct.addDelay(attacker, delay_time, cc.CallFunc:create(
	function()
		BattleController:getInstance():getModel():getBattleScene():shakeScreen(shake_bid)
	end
	))
end

--普通动作攻击
function SkillAct.attack(attacker, delay_time, anima_name, hit_callback, start_callback, is_reverse, attack_func, anima_res)
	print("---------SkillAct.attack------anima_name-------------",anima_name,startfun,hit_callback)
	local startfun = start_callback and cc.CallFunc:create(start_callback) or nil
	
	BattleController:getInstance():getModel():actStart(attacker)
	attacker.spine_renderer.is_attack = anima_name

	local sound_id = attacker.shout_trick
	if sound_id ~= nil and sound_id ~= "" then
		if not BattleController:getInstance():getIsNoramalBattle() then
			GlobalAudio:getInstance():playEffect(GlobalAudio.AUDIO_TYPE.BATTLE, sound_id, false)
		end
	end
	if startfun == nil then
		return SkillAct.addDelay(attacker, delay_time, cc.Sequence:create(SkillAct.setAnimationWithEvent(attacker, anima_name, hit_callback, attacker.spine_renderer, false, is_reverse, attack_func, anima_res)))
	else
		return SkillAct.addDelay(attacker, delay_time, cc.Sequence:create(startfun, SkillAct.setAnimationWithEvent(attacker, anima_name, hit_callback, attacker.spine_renderer, false, is_reverse, attack_func, anima_res)))
	end
end

--没动作的攻击  return SkillAct.noActAttack(attacker, delay_time, hit_callback, start_callback, is_reverse) 
function SkillAct.noActAttack(attacker, delay_time, hit_callback, start_callback, next_delay_time)
	local startfun = start_callback and cc.CallFunc:create(start_callback) or nil

	BattleController:getInstance():getModel():actStart(attacker)
	attacker.spine_renderer.is_no_attack = TRUE

	if startfun == nil then
		return SkillAct.addDelay(attacker, delay_time, cc.Sequence:create(SkillAct.setNotAnimationWithEvent(attacker, hit_callback, attacker.spine_renderer)), next_delay_time) 
	else
		return SkillAct.addDelay(attacker, delay_time, cc.Sequence:create(startfun, SkillAct.setNotAnimationWithEvent(attacker, hit_callback, attacker.spine_renderer)), next_delay_time)
	end
end

--设置动作伴随事件监听
function SkillAct.setNotAnimationWithEvent(attacker, hit_callback, spine_renderer)
	return cc.CallFunc:create(function()
		if hit_callback then
			hit_callback()
			spine_renderer.is_no_attack = nil
			BattleController:getInstance():getModel():actFinish(attacker)        -- 通知动作事件结束
		end
	end)
end 

--准备动作函数
function SkillAct.ready(attacker, spine_renderer, action_name, direct)
	print("------------------SkillAct.ready-----------------------------------------",action_name)
	-- local startfun = cc.CallFunc:create(function()
	-- 	if action_name ~= "" and action_name ~= nil and not spine_renderer.in_animation then
	-- 		SkillAct.setAnimation(spine_renderer, action_name)
	-- 	end
	-- end)
	-- return SkillAct.addDelay(attacker, 0, cc.Sequence:create(startfun, SkillAct.setAnimationWithEvent(attacker, nil, nil, attacker.spine_renderer, false, false)))
end

--添加动作计时受击
function SkillAct.aid_hurt(attacker, spine_renderer, target, hurt_action)
    local callback = function(spine_tmp)
        spine_renderer:runAction(cc.Sequence:create(
            cc.DelayTime:create(0.3),
			cc.CallFunc:create(function()
				if not spine_renderer.is_die then
					SkillAct.setAnimation(spine_renderer, spine_renderer.stand, true)
				end
				spine_renderer.in_act = false
				spine_renderer:reverse(spine_renderer.obj_type)
				spine_renderer:setPosByGrid(spine_renderer.grid_pos_back)

				-- 援护
				BattleController:getInstance():getModel():actFinish(attacker) 
			end))) 
    end
    spine_renderer:runAction(
        cc.Sequence:create(
            cc.CallFunc:create(function()
                SkillAct.setAnimation(spine_renderer, hurt_action, false, callback)
            end)
        )
    )
end

-- 黑幕
function SkillAct.blackScreen(attacker, delay_time, time, begin_fun, end_fun)
	local act = cc.Sequence:create(cc.CallFunc:create(begin_fun), cc.DelayTime:create(time / display.DEFAULT_FPS), cc.CallFunc:create(end_fun))
	return cc.Sequence:create(SkillAct.dt(delay_time), act)
end

function SkillAct.shadow(attacker, delay_time, time, begin_fun, end_fun)
	local act = cc.Sequence:create(cc.CallFunc:create(begin_fun), cc.DelayTime:create(time / display.DEFAULT_FPS), cc.CallFunc:create(end_fun))
	return SkillAct.addDelay(attacker, delay_time, act)
end


-- 隐身
function SkillAct.hide(attacker, delay_time)
	return SkillAct.addDelay(attacker, delay_time, cc.Hide:create())
end
-- 显示
function SkillAct.show(attacker, delay_time)
	return SkillAct.addDelay(attacker, delay_time, cc.Show:create())
end

function SkillAct.showUI(attacker, delay_time)
	local start_fun = cc.CallFunc:create(function()
		attacker.spine_renderer:showHpRoot(true)
	end)
	return SkillAct.addDelay(attacker, delay_time, cc.Sequence:create(start_fun))
end

function SkillAct.hideUI(attacker, delay_time)
	local start_fun = cc.CallFunc:create(function()
		attacker.spine_renderer:showHpRoot(false)
	end)
	return SkillAct.addDelay(attacker, delay_time, cc.Sequence:create(start_fun))
end

-- 跳回来
function SkillAct.jump(attacker, delay_time, jump_time, target_pos, height, times)	
	return SkillAct.addDelay(attacker, delay_time, cc.JumpTo:create(jump_time * 2 / display.DEFAULT_FPS, target_pos, height, times))
end

-- 清除所有持续特效
function SkillAct.clearAllEffect(spine_renderer)
	if spine_renderer then
		if not 	spine_renderer.clear_count then
			spine_renderer.clear_count = 0
		end
		if spine_renderer.effect_list then
			if (spine_renderer.effect_list or {}) ~= nil then
				for k, v in pairs(spine_renderer.effect_list or {}) do
					if v then
						spine_renderer.clear_count = spine_renderer.clear_count + 1
						for i,effect in pairs(v) do
							if effect.object then
								effect.object:release(true)
							end
						end
					end
				end 
				if 	spine_renderer.clear_count >= tableLen(spine_renderer.effect_list or {}) then
					spine_renderer.effect_list = nil
					spine_renderer.clear_count = 0
				end
			end
		end
	end
end
--删除身上特效
function SkillAct.clearEffect(target, buff_id)
	local spine_renderer = target.spine_renderer
	local config = Config.SkillData.data_get_buff[buff_id]
	if spine_renderer == nil or config == nil then return end

	local effect_config = Config.SkillData.data_get_effect_data[config.res]
	if effect_config == nil then return end

	-- 要根据当前时装做转换
	local fashion_id = target:getFashionId()
	if fashion_id ~= 0 then
		local buff_skin_config = Config.PartnerSkinData.data_bufftospine[getNorKey(fashion_id, buff_id)]
		if buff_skin_config and buff_skin_config.effect_bid and buff_skin_config.effect_bid ~= 0 then
			effect_config = Config.SkillData.data_get_effect_data[buff_skin_config.effect_bid]
		end
	end

	if next(spine_renderer.effect_list or {}) ~= nil then
		if next(spine_renderer.effect_list[effect_config.res_up] or {}) ~= nil and spine_renderer.effect_list[effect_config.res_up] then
			local action_name = PlayerAction.action
			if effect_config.up_action_name ~= "" then
				action_name = effect_config.up_action_name
			else
				action_name = PlayerAction.action
			end 

			if spine_renderer.effect_list[effect_config.res_up][action_name] ~= nil then
				spine_renderer.effect_list[effect_config.res_up][action_name].num = spine_renderer.effect_list[effect_config.res_up][action_name].num - 1
				local res_up_need_clear = true
				for k, v in pairs(spine_renderer.effect_list[effect_config.res_up]) do
					if v.num ~= 0 then
						res_up_need_clear = false
						break
					end
				end
				if res_up_need_clear == true then
					for k, v in pairs(spine_renderer.effect_list[effect_config.res_up]) do
						if v.object then
							v.object:release(true)
						end
					end
					spine_renderer.effect_list[effect_config.res_up] = nil
				end 
			end
		end
	end
	if next(spine_renderer.effect_list or {}) ~= nil then
		if next(spine_renderer.effect_list[effect_config.res_down] or {}) ~= nil and spine_renderer.effect_list[effect_config.res_down] then
			local action_name = PlayerAction.action
			if  effect_config.down_action_name ~= "" then
				action_name = effect_config.down_action_name
			else
				action_name = PlayerAction.action
			end 
			if spine_renderer.effect_list[effect_config.res_down][action_name] ~= nil then
				spine_renderer.effect_list[effect_config.res_down][action_name].num = spine_renderer.effect_list[effect_config.res_down][action_name].num - 1
				local down_need_clear = true
				for k, v in pairs(spine_renderer.effect_list[effect_config.res_down]) do
					if v.num ~= 0 then
						down_need_clear = false
						break
					end
				end
				if down_need_clear == true then
					for k, v in pairs(spine_renderer.effect_list[effect_config.res_down]) do
						if v.object then
							v.object:release(true)
						end
					end
					spine_renderer.effect_list[effect_config.res_down] = nil
				end 
			end
		end
	end
end

--人物受击特效播放
function SkillAct.effectHitUser(attacker, delay_time, spine_renderer, effect_name, reverse, is_release, height, x_fix, scale_, alpha, h_scale, callback, bid, is_spec)	
	local zoredr_offset = {99, -99}
	local effect = {}
	if not spine_renderer.effect_list then
		spine_renderer.effect_list = {}
	end
	local effect_config = Config.SkillData.data_get_effect_data[bid]
	for i, v in ipairs(effect_name) do
		if effect_name[i] and effect_name[i] ~= "" then
			if spine_renderer.effect_list[effect_name[i]] == nil then
				spine_renderer.effect_list[effect_name[i]] = {}
			end
			local action_name = PlayerAction.action
			if effect_config then
				if i == 1 then 		-- 上层特效
					if effect_config.up_action_name and effect_config.up_action_name ~= "" then
						action_name = effect_config.up_action_name
					end
				elseif i == 2 then 	-- 下层特效
					if effect_config.down_action_name and effect_config.down_action_name ~= "" then
						action_name = effect_config.down_action_name
					end
				end
			end

			if spine_renderer.effect_list[effect_name[i]][action_name] == nil then
				spine_renderer.effect_list[effect_name[i]][action_name] = {num = 1 ,object = nil}
				local pos
				local parent = spine_renderer.bottom_effect_root
				if i == 1 then		-- 上层特效
					pos = cc.p(x_fix, height)
					parent = spine_renderer.top_effect_root
				else				-- 下层特效
					pos = cc.p(x_fix, 0)
				end
				local start_fun = cc.CallFunc:create(function()
					if callback then
						callback()
					end
				end)
				if tolua.isnull(spine_renderer.root) then return end
				-- local parent = spine_renderer.bottom_effect_root
				-- local effect_zorder = spine_renderer.spine_root:getLocalZOrder() + zoredr_offset[i]
				local scale = scale_

				if action_name ~= "" then
					effect[i] = SpineRenderer.New(pos, effect_name[i], scale, false, action_name)
					effect[i]:reverse(reverse)
					effect[i].spine_root:setAnchorPoint(cc.p(1, 0))
					effect[i].bid = bid
					effect[i]:addToLayer(parent, 1)
					spine_renderer.effect_list[effect_name[i]][action_name].object = effect[i]
					local finish_callback = function()
						if is_release == TRUE then
							if next(spine_renderer.effect_list or  {}) ~= nil then
								if spine_renderer.effect_list[effect_name[i]] then
									if spine_renderer.effect_list[effect_name[i]][action_name] ~= nil then
										spine_renderer.effect_list[effect_name[i]][action_name].num = spine_renderer.effect_list[effect_name[i]][action_name].num - 1
										if spine_renderer.effect_list[effect_name[i]][action_name].num == 0 then
											spine_renderer.effect_list[effect_name[i]][action_name].object:release(true)
											spine_renderer.effect_list[effect_name[i]][action_name] = nil
										end
									end
								end
							end
						end
					end
					local act = SkillAct.setAnimaWithEventFinish(attacker, action_name, nil, finish_callback, effect[i], is_release ~= TRUE)
					effect[i]:runAction(cc.Sequence:create(cc.DelayTime:create(delay_time / display.DEFAULT_FPS * 2), start_fun, act))
				end 
			else
				spine_renderer.effect_list[effect_name[i]][action_name].num = spine_renderer.effect_list[effect_name[i]][action_name].num + 1 
			end
		end
	end 
end

--挂在人物身上的特效
function SkillAct.effectSpineUser(attacker, delay_time, spine_renderer, effect_name, reverse, is_release, height, x_fix, scale_, alpha, h_scale, callback, buff_bid, effect_bid)
	local zoredr_offset = {99, -999}
	local effect = {}
	local temp_bid = buff_bid 
	if effect_bid ~= nil and effect_bid ~= 0 then
		temp_bid = effect_bid
	end
	if not attacker or not attacker.spine_renderer or not attacker.spine_renderer.root or tolua.isnull(attacker.spine_renderer.root) then
		return 
	end
	if not spine_renderer.effect_list then
		spine_renderer.effect_list = {}
	end
	local is_fornt = false
	for i, v in pairs(effect_name) do
		if effect_name[i] and effect_name[i] ~= "" then
			if spine_renderer.effect_list[effect_name[i]] == nil then
				spine_renderer.effect_list[effect_name[i]] = {}
			end
			local action_name = PlayerAction.action
			local temp_config = Config.SkillData.data_get_effect_data[temp_bid]
			if temp_config then
				if i == 1 then
					if temp_config.up_action_name and temp_config.up_action_name ~= "" then
						action_name = temp_config.up_action_name
					end
				elseif i == 2 then
					if temp_config.down_action_name and temp_config.down_action_name ~= "" then
						action_name = temp_config.down_action_name
					end
				end
			end
			if spine_renderer.effect_list[effect_name[i]][action_name] == nil then
				spine_renderer.effect_list[effect_name[i]][action_name] = {num = 1 ,object = nil}
				local pos
				local parent = spine_renderer.bottom_effect_root
				if i == 1 then
					pos = cc.p(x_fix, height)
					parent = spine_renderer.top_effect_root
				else    -- 下层特效不改变高度
					pos = cc.p(x_fix, 0)
					is_fornt = true
				end
				local start_fun = cc.CallFunc:create(function()
					if callback then
						callback()
					end
				end)
				if tolua.isnull(spine_renderer.root) then return end
				-- local parent = spine_renderer.effect_root
				-- local effect_zorder = spine_renderer.spine_root:getLocalZOrder() + zoredr_offset[i]
				local scale = scale_

				-- 设置单位的层级
				if attacker and attacker.object_type ~= BattleObjectType.Elfin and attacker.spine_renderer and not tolua.isnull(attacker.spine_renderer.root) then
					local spine_zorder = spine_renderer.root:getLocalZOrder() + zoredr_offset[i]
					if temp_config and temp_config.is_fornt == TRUE then
						spine_zorder = attacker.spine_renderer.root:getLocalZOrder() - 999
						is_fornt = true
					end
					if is_fornt == false then
						attacker.spine_renderer.root:setLocalZOrder(spine_zorder)
					end
				end
				
				effect[i] = SpineRenderer.New(pos, effect_name[i], scale, false, action_name)
				effect[i]:reverse(reverse)
				effect[i].spine_root:setAnchorPoint(cc.p(1, 0))
				effect[i]:addToLayer(parent, 1)

				spine_renderer.effect_list[effect_name[i]][action_name].object = effect[i]
				local finish_callback = function()
					if is_release == TRUE then
						if next(spine_renderer.effect_list or  {}) ~= nil then
							if spine_renderer.effect_list[effect_name[i]] ~= nil then
								if spine_renderer.effect_list[effect_name[i]][action_name] ~= nil then
									spine_renderer.effect_list[effect_name[i]][action_name].num  = spine_renderer.effect_list[effect_name[i]][action_name].num - 1
									if spine_renderer.effect_list[effect_name[i]][action_name].num == 0 then
										spine_renderer.effect_list[effect_name[i]][action_name].object:release(true)
										spine_renderer.effect_list[effect_name[i]][action_name] = nil
									end
								end
							end
						end
					end
				end
				local act = SkillAct.setAnimaWithEventFinish(attacker, action_name, nil, finish_callback, effect[i],is_release ~= TRUE)--
				effect[i]:runAction(cc.Sequence:create(cc.DelayTime:create(delay_time / display.DEFAULT_FPS * 2), start_fun, act))
			else
				spine_renderer.effect_list[effect_name[i]][action_name].num = spine_renderer.effect_list[effect_name[i]][action_name].num + 1 
			end
		end
	end 
end

-- 范围特效
function SkillAct.effectArea(attacker, effect_name, reverse, is_release, pos, hit_callback, bid, is_effect_play, group)
	if is_effect_play == nil then
		is_effect_play = true
	end
	local layer = {BattleController:getInstance():getCtrlBattleScene().effect_layer_1,BattleController:getInstance():getCtrlBattleScene().effect_layer_2}
	local zoredr_offset = {2, - 2}
	local effect = {}
	local action_name_list = {}
	local is_play_effect = false
	local effect_config = Config.SkillData.data_get_effect_data[bid]
	print("---------------------SkillAct.effectArea--------------------------------------",bid,effect_config) --10
	for i,v in ipairs(effect_name) do
		if effect_name[i] and effect_name[i] ~= "" then
			local action_name = PlayerAction.action
			if effect_config then
				if i == 1 then
					if effect_config.up_action_name ~= "" then
						action_name = effect_config.up_action_name
					end
				elseif i == 2 then
					if effect_config.down_action_name ~= "" then
						action_name = effect_config.down_action_name
					end
				end
			end
			effect[i] = SpineRenderer.New(pos, effect_name[i], 1, false, action_name)
			effect[i]:reverse(reverse)
			effect[i]:addToLayer(layer[i], zoredr_offset[i])
			
			-- 现在这种情况之后存在场景buff特效的
			if is_release == FALSE then
				group = group or attacker.group
				BattleController:getInstance():getModel():addSceneBuffEffect(group, bid, effect_name[i], effect[i], action_name)
			end

			local finish_callback = function(renderer)
				if is_release == TRUE then
					effect[i]:release(true, attacker.play_stand)
					attacker.in_area_effect = nil
				end
				if is_effect_play == true then
					BattleController:getInstance():getModel():actFinish(attacker)
				end
			end
			if is_effect_play == true then
				BattleController:getInstance():getModel():actStart(attacker)
			end
			local start_fun
			if not is_play_effect then
				start_fun = function()
					if hit_callback then
						hit_callback()
					end
				end
			else
				start_fun = nil
			end
			local act = SkillAct.setAnimaWithEventFinish(attacker, action_name, start_fun, finish_callback, effect[i], is_release == FALSE)
			is_play_effect = true
			effect[i]:runAction(act)
			if is_effect_play == true then
				attacker.in_area_effect = true
			end
		end
	end
end

--躲闪,暂时没有用了
function SkillAct.miss(attacker, spine_renderer, target_pos)
	if spine_renderer.in_act then return end
	BattleController:getInstance():getModel():actStart(attacker)
	spine_renderer.in_act = true
	local now_position = cc.p(spine_renderer.root:getPosition())
	local back_time = 0.3
	local return_time = 0.3
	local delay_time = 0
	spine_renderer:runAction(cc.Sequence:create(
	cc.Spawn:create(SkillAct.fadeOut(attacker, spine_renderer, 0, back_time * display.DEFAULT_FPS / 2), cc.MoveTo:create(back_time, target_pos)),
	cc.DelayTime:create(delay_time),
	cc.Spawn:create(SkillAct.fadeIn(attacker, spine_renderer, 0, return_time * display.DEFAULT_FPS / 2), cc.MoveTo:create(return_time, now_position)),
	cc.CallFunc:create(function()
		SkillAct.setAnimation(spine_renderer, spine_renderer.stand, true)
		spine_renderer.in_act = false
		BattleController:getInstance():getModel():actFinish(attacker)
	end)))
end

--播放护盾吸收
function SkillAct.playBuffAbsorbHurt(attacker, absorb_val)
	print("--------------护盾吸收--------------------------")
	if attacker == nil or attacker.spine_renderer == nil or tolua.isnull(attacker.spine_renderer.root) then return end
	local role_height = attacker.spine_renderer.role_height / 2
	local parent_layer = ViewManager:getInstance():getLayerByTag(ViewMgrTag.EFFECT_TAG) 
    -- local sp = createSprite(PathTool.getResFrame("hl_battle_num", "hl_type225_xishou"), 0, 0, parent_layer, cc.p(0.5, 0.5), LOADTEXT_TYPE_PLIST,99)
    -- sp:setCascadeOpacityEnabled(true)

	local sp = createEffectSpine("E10004", cc.p(0, 0), cc.p(0.5, 0.5), false, "action")
	parent_layer:addChild(sp)

    -- 做一个延迟飘
    if attacker.absorb_hurt_delay == nil then
    	attacker.absorb_hurt_delay = 0
    end
	local delay_time = (attacker.absorb_hurt_delay % 3) * 0.3
	local delay = cc.DelayTime:create(delay_time)
	attacker.absorb_hurt_delay = attacker.absorb_hurt_delay + 1

	local tips  = SkillAct.getBmpFont(absorb_val, 225)
	tips:setAnchorPoint(cc.p(0, 0.5))
	tips:setPosition(cc.p(50, 20))
	sp:addChild(tips)
    sp:setOpacity(100)
    sp:setVisible(false)

	local world_pos = attacker.spine_renderer.root:convertToWorldSpace(cc.p(0, 0))
	local node_pos = parent_layer:convertToNodeSpace(world_pos) 
	sp:setPosition(node_pos.x,node_pos.y + role_height)
    sp:runAction(cc.Sequence:create(
        cc.DelayTime:create(0.3),
        cc.CallFunc:create(function()
        	sp:setVisible(true)
    	end),
    	delay,
        cc.Spawn:create(cc.MoveTo:create(0.4, cc.p(node_pos.x, sp:getPositionY() + 50)), cc.FadeIn:create(0.4)),
        cc.Spawn:create(cc.FadeTo:create(1.1, 100), cc.MoveTo:create(1.1, cc.p(node_pos.x, sp:getPositionY()+ 75))),
        cc.FadeOut:create(0.2),
        cc.CallFunc:create(function ()
			if tips then
				tips:DeleteMe()
				tips = nil
			end
		end),
		cc.RemoveSelf:create()
    ))
end

--播放伤害数字
function SkillAct.playDmgMessage(attacker, chg, dmg_type, is_buff, camp_restrain)
	if not attacker or not attacker.spine_renderer then return end
	if attacker.hurt_delay == nil then
		attacker.hurt_delay = 0
	end
	local hit_num = attacker.hurt_delay % 3
	local delay_time = hit_num == 0 and attacker.hurt_delay % 3 / 6 or 0
	-- local delay_time = (attacker.hurt_delay % 3) * 0.1
	local delay = cc.DelayTime:create(delay_time)
	attacker.hurt_delay = attacker.hurt_delay + 1

	if chg == 0 or chg == nil then return end     -- 不扣血不处理
	local ui_dmg_num = nil
	local num = nil
	local function deleteDmgNum()
		if ui_dmg_num ~= nil then
			if ui_dmg_num.num ~= nil then
				ui_dmg_num.num:setVisible(false)
				ui_dmg_num.num:DeleteMe()
			end
			ui_dmg_num:setVisible(false)
			ui_dmg_num:removeAllChildren()
			ui_dmg_num:removeFromParent()
			ui_dmg_num = nil
		end
		if attacker.last_msg == ui_dmg_num then
			attacker.last_msg = nil
		end
	end
	if tolua.isnull(attacker.spine_renderer.root) then return end
	local role_pos_x = cc.p(attacker.spine_renderer.root:getPosition())

	local final_scale = 1
	if dmg_type == 2 then
		ui_dmg_num = ccui.Widget:create()
		-- local baoji = createSprite(PathTool.getResFrame("hl_battle_num", "txt_cn_battle_baoji"), 100, 10, ui_dmg_num, cc.p(1, 0.5))
		-- baoji:setPosition(60, 70)
		-- local baojisize = baoji:getContentSize()
		local baoji = createEffectSpine("E10003", cc.p(50, 70), cc.p(0.5, 0.5), false, "action")
		ui_dmg_num:addChild(baoji)
		local baojisize = cc.size(348,191)
		num = SkillAct.getBmpFont(chg, 207)
		num:setAnchorPoint(cc.p(0, 0))
		num:setPosition(cc.p(60, 70))
		ui_dmg_num:addChild(num)
		ui_dmg_num.num = num
		ui_dmg_num.scale = 0.5
		ui_dmg_num.width = baojisize.width + num:getContentSize().width / 4
		if attacker.group == BattleGroupTypeConf.TYPE_GROUP_ROLE then
			ui_dmg_num.x_fix = 30
		end
		final_scale = 1
	elseif chg < 0 and dmg_type ~= 2 then
		ui_dmg_num = ccui.Widget:create()
		if is_buff == true then								-- debuff类的
			num = SkillAct.getBmpFont(chg, 224)
			num:setAnchorPoint(cc.p(0.5, 0))
			num:setPosition(cc.p(105, 45))
			ui_dmg_num:addChild(num)
			ui_dmg_num.num = num
		elseif camp_restrain and camp_restrain == 1 then	-- 阵营克制
			local kezhi  = createSprite(PathTool.getResFrame("hl_battle_num", "hl_type227_kezhi"), 100, 0, ui_dmg_num, cc.p(1, 0.5))
			kezhi:setPosition(90, 50)
			local kezhisize = kezhi:getContentSize()
			num = SkillAct.getBmpFont(chg, 227)

			num:setAnchorPoint(cc.p(0, 0))
			num:setPosition(cc.p(105, 45))
			ui_dmg_num:addChild(num)
			ui_dmg_num.num = num
			ui_dmg_num.width = kezhisize.width + num:getContentSize().width / 4
			-- if attacker.group == BattleGroupTypeConf.TYPE_GROUP_ROLE then
			-- 	ui_dmg_num.x_fix = 30
			-- end
		else
			num = SkillAct.getBmpFont(chg, 204)				-- 普通伤害
			num:setAnchorPoint(cc.p(0.5, 0))
			num:setPosition(cc.p(105, 45))
			ui_dmg_num:addChild(num)
			ui_dmg_num.num = num
		end
	
	else													-- 治疗
		ui_dmg_num = ccui.Widget:create()
		num = SkillAct.getBmpFont(chg, 202)
		num:setAnchorPoint(cc.p(0.5,0))
		num:setPosition(cc.p(105, 45))
		ui_dmg_num:addChild(num)
		ui_dmg_num.num = num
	end
	
	if ui_dmg_num then
		ui_dmg_num.x_fix = ui_dmg_num.x_fix or 0
		local parent_layer = ViewManager:getInstance():getLayerByTag(ViewMgrTag.EFFECT_TAG) 
		local world_pos = attacker.spine_renderer.root:convertToWorldSpace(cc.p(0,0))
		local node_pos = parent_layer:convertToNodeSpace(world_pos)
		local _x = node_pos.x + ui_dmg_num.x_fix - 90
		local _y = node_pos.y + attacker.spine_renderer.role_height + (attacker.dmg_index or 0) * 15 + (attacker.dmg_aid_y_offset or 0) 
		ui_dmg_num:setPosition(_x, _y)
		parent_layer:addChild(ui_dmg_num, 10)
		ui_dmg_num:setVisible(false)
		
		local ctrl = BattleController:getInstance()
		local hide = cc.FadeOut:create(ctrl:getActTime("hurt_num_hide_time") / display.DEFAULT_FPS)
		local show = cc.Show:create()
		local move = cc.MoveBy:create(ctrl:getActTime("hurt_num_move_time") / display.DEFAULT_FPS, cc.p(0, ctrl:getActTime("hurt_num_move_distance")))
		local scale_all = ui_dmg_num.num.scale
		local bigger = cc.ScaleTo:create(ctrl:getActTime("hurt_num_scale_time1") / display.DEFAULT_FPS, ctrl:getActTime("hurt_num_bigger") * scale_all)
		local bigger2 = cc.ScaleTo:create(ctrl:getActTime("hurt_num_scale_time2") / display.DEFAULT_FPS, ctrl:getActTime("hurt_num_bigger2"))
		local smaller = cc.ScaleTo:create(ctrl:getActTime("hurt_num_scale_time3") / display.DEFAULT_FPS, ctrl:getActTime("hurt_num_smaller"))
		local bigger3 = cc.ScaleTo:create(ctrl:getActTime("hurt_num_scale_time4") / display.DEFAULT_FPS, ctrl:getActTime("hurt_num_bigger3"))
		local delay2 = cc.DelayTime:create(ctrl:getActTime("hurt_num_delay_time") / display.DEFAULT_FPS)
		local change = cc.Sequence:create(bigger, bigger2, smaller, bigger3, delay2, cc.Spawn:create(move,hide))
		ui_dmg_num:runAction(cc.Sequence:create(delay, show, change, cc.CallFunc:create(deleteDmgNum))) --
	end
end

function SkillAct.fadeOut(attacker, spine_renderer, delay_time, time)
	time = time * 2 / display.DEFAULT_FPS  
	local act = cc.CallFunc:create(function()
		spine_renderer:runAction(cc.FadeOut:create(time))
	end)
	return SkillAct.addDelay(attacker, delay_time, act)
end

function SkillAct.fadeIn(attacker, spine_renderer, delay_time, time)
	time = time * 2 / display.DEFAULT_FPS 
	local act = cc.CallFunc:create(function()
		spine_renderer:runAction(cc.FadeIn:create(time))
	end)
	return SkillAct.addDelay(attacker, delay_time, act)
end

function SkillAct.leftRight(time, times, distance)
	time = time or 1
	times = times or 1
	distance = distance or 10
	local one_time = time / times
	local act_list = {}
	for i = 1, times do
		table.insert(act_list, cc.Sequence:create(cc.MoveBy:create(one_time / 2, cc.p(distance / 2, 0)), cc.MoveBy:create(one_time / 2, cc.p(- distance / 2, 0))))
	end
	return cc.Sequence:create(unpack(act_list))
end

-- 受伤动作
function SkillAct.hurt(attacker, spine_renderer, target, hurt_action, play_effect)
	if target and target.play_hurt_ing == true then return end		-- 如果在受击中 就不要继续播放受击动作了,避免混乱
	target.play_hurt_ing = true
	print("-----------------playBattleRoleHurt---------8------------",hurt_action)

	if play_effect == nil then
		play_effect = true
	end
	if not tolua.isnull(attacker.spine_renderer.root) and not tolua.isnull(spine_renderer.root) then
		local back_time = 0.02 					--过去时间
		local return_time = 0.05 				--回来时间
		local delay_time = 0.2  				--保持时间
		local off_width = 18 * target.obj_type 	-- X方向的偏移

		spine_renderer.in_hurt_act = true
		if spine_renderer.res then --and not spine_renderer.is_change_status
			local res = spine_renderer.res
			if spine_renderer.is_change_status == true and spine_renderer.buff_spine then
				res = spine_renderer.buff_spine
			end
			if not tolua.isnull(spine_renderer.spine) then
				spine_renderer.spine:runAction(cc.RemoveSelf:create(true))
			end
			local spine_tmp = nil
			print("-----------------playBattleRoleHurt---------7------------",hurt_action)

			spine_tmp = createSpineByName(res, hurt_action)
			spine_renderer.spine = spine_tmp
			spine_renderer:setActionName(hurt_action)
			spine_renderer:reverse(spine_renderer.obj_type)
			spine_renderer:addChild(spine_tmp)
		end
		--播放受击音效
		if play_effect == true then
			local sound_id = attacker.hit_sound or ""
			if sound_id ~= "" then
				if not BattleController:getInstance():getIsNoramalBattle() then
					GlobalAudio:getInstance():playEffect(GlobalAudio.AUDIO_TYPE.BATTLE, sound_id, false)
				end
			end
		end

		local function animationCompleteFunc(event)
			-- 受击之后马上设置站立有问题.因为可能存在受击的过程中,触发了反击...
			if not BattleController:getInstance():getIsNoramalBattle() then
				SkillAct.setAnimation(spine_renderer, spine_renderer.stand, true, nil, nil, target)
			end
			spine_renderer.in_hurt_act = false
		end
		spine_renderer.spine:registerSpineEventHandler(animationCompleteFunc, sp.EventType.ANIMATION_COMPLETE)
		spine_renderer:runAction(cc.Sequence:create(cc.CallFunc:create(function()
			if spine_renderer.in_hurt_act == true then
				if spine_renderer.spine then
					print("-----------------playBattleRoleHurt---------6------------",hurt_action)

					spine_renderer.spine:setAnimation(0, hurt_action, false)
					spine_renderer.spine:setToSetupPose()
				end
			end
		end),
		cc.MoveBy:create(back_time, cc.p(-off_width, 0)),
		cc.DelayTime:create(delay_time),
		cc.MoveBy:create(return_time, cc.p(off_width, 0)),
		cc.CallFunc:create(function()
			target.is_hurt_play = false
			target.play_hurt_ing = false
		end)))
	end
end

--设置动作伴随事件监听
function SkillAct.setAnimationWithEvent(attacker, anima_name, hit_callback, spine_renderer, is_loop, is_reverse, attack_func, anima_res)
	print("-------------设置动作伴随事件监听--------eventName--------11---------------",anima_name)

	return cc.CallFunc:create(function()
		local function animationEventFunc(event)
			local eventName=nill
			if event then
			eventName=event.eventData.name
			print("---------------------eventName-----------------------",eventName)
			else
				return
				--eventName = "move"
			end

			if(eventName == "hit" or eventName == "Hit" or eventName == "HIT") and spine_renderer.hit_time < spine_renderer.hit_num and hit_callback ~= nil then
				print("-------------------hit----hit--------------------------")
				hit_callback()
				spine_renderer.hit_time = spine_renderer.hit_time + 1
			elseif spine_renderer.is_attack == anima_name and (eventName == "back" or eventName == "Back" or eventName == "BACK" ) then
				local is_move_map = attacker.is_move_map or 0
				local play_order_anime_res = attacker.anime_res
				if is_move_map == FALSE then
					local spine_res = attacker.spine_renderer.res
					if attacker.spine_renderer.buff_spine then  -- 如果变身了,就用变身的动作
						spine_res = attacker.spine_renderer.buff_spine
					end
					local config = Config.BattleActData.data_info[spine_res] or Config.BattleActData.data_info[0]
					if config then
						local anima_res_config = config[play_order_anime_res] or Config.BattleActData.data_info[0]["action1"]
						if anima_res_config then
							local temp_config = anima_res_config[attacker.spine_renderer.anima_name] or anima_res_config["action1"]
							if temp_config == nil  then
								temp_config = Config.BattleActData.data_info[0]["action1"]["action1"]
							end
							if temp_config then
								BattleController:getInstance():getModel():moveBack(attacker, temp_config.back_delay_time, temp_config.back_move_time, temp_config.back_model_x, nil, nil, nil, nil, temp_config.is_move_map)
							end
						end
					end
				end
				spine_renderer.is_attack = nil
			elseif eventName == "attack" then
				print("--------------------attacker.in_area_effect--------------------",attacker.in_area_effect)
				if attacker.in_area_effect then
					spine_renderer.is_area_attack = true
					spine_renderer.hit_time = spine_renderer.hit_time + 1
					-- 这里理论上不可能存在,看遍了所有的都是一样的spine_renderer ~= attacker.spine_renderer 
					 if attacker.in_area_effect and spine_renderer ~= attacker.spine_renderer then
						attacker.area_hit_time = spine_renderer.hit_time
					end
					BattleController:getInstance():getModel():areaHurt(attacker)
				else
					if attack_func then
						attack_func()
					end
				end
				BattleController:getInstance():getModel():attackPoint(attacker, anima_name)
			elseif eventName == "hit_none" then --无瓢字有受击动作
				BattleController:getInstance():getModel():actHurt(attacker)
			elseif eventName == "hit_big" then --无动作有受击特效
				BattleController:getInstance():getModel():actHurt(attacker,true)
			 elseif eventName == "ready" then --准备动作
				BattleController:getInstance():getModel():attackReady(attacker)
			elseif eventName == "shake_point" then --震屏
				if attacker.shake_id ~= 0 and attacker.shake_id ~= nil then
					BattleController:getInstance():getModel():playShakeScreen(attacker.shake_id)
				end
			elseif eventName == "closeup_s" or  eventName == "closeup_e" then -- 特写
				if attacker.closeup_id ~= 0 and attacker.closeup_id ~= nil then
				   BattleController:getInstance():getModel():playCloseup(attacker.closeup_id,attacker.group,attacker)
				end 
			elseif eventName == "move" then
				local is_move_map = attacker.is_move_map or FALSE 
				local play_order_anime_res = attacker.anime_res
				if is_move_map == FALSE then
					local spine_res = attacker.spine_renderer.res
					if attacker.spine_renderer.buff_spine then
						spine_res = attacker.spine_renderer.buff_spine
					end
					local config = Config.BattleActData.data_info[spine_res] or Config.BattleActData.data_info[0]
					if config then
						local anima_res_config = config[play_order_anime_res] or Config.BattleActData.data_info[0]["action1"]
						if anima_res_config then
							local temp_config = anima_res_config[attacker.spine_renderer.anima_name] or anima_res_config["action1"]
							if temp_config == nil  then
								 temp_config = Config.BattleActData.data_info[0]["action1"]["action1"]
							end
							print("_----------------temp_config-temp_config-----------------",temp_config)
							printLuaTable(temp_config)
							if temp_config then
								if temp_config.shadow_time ~= 0 and  temp_config.shadow_time ~= nil then
									BattleController:getInstance():getModel():shadow2(attacker,temp_config.shadow_time,play_order_anime_res,attacker.spine_renderer.anima_name)
								end
								if temp_config.is_move_area == TRUE then --是否移动到区域
									BattleController:getInstance():getModel():moveToArea(attacker, temp_config.move_delay_time, temp_config.move_time, temp_config.move_model_x, temp_config.move_model_y,nil,nil,nil,temp_config.is_move_map,temp_config.is_reverse)
								else
									BattleController:getInstance():getModel():moveTo(attacker, temp_config.move_delay_time, temp_config.move_time, temp_config.move_model_x,temp_config.move_model_y, nil, nil, nil, nil, temp_config.is_move_map,temp_config.is_reverse, temp_config.is_col_act)
								end
							end
						end
					end
				end
			elseif string.find(eventName, "hit_num") then
				local hit_num = tonumber(string.sub(eventName, 8))
				if hit_num and hit_num > 1 then
					spine_renderer.hit_num = hit_num
					if attacker.in_area_effect and spine_renderer ~= attacker.spine_renderer then
						attacker.area_hit_num = hit_num
					end
					BattleController:getInstance():getModel():calcMagicHurt(attacker)        -- 计算伤害
				end
			elseif string.find(eventName, "die_e") then
			       spine_renderer:hideSpineModel()
			end
		end
		local function animationCompleteFunc(event)
			print(attacker.object_name.."com---------------------")
			if event.animation == anima_name then
				if spine_renderer.hit_time < spine_renderer.hit_num and hit_callback ~= nil then
					hit_callback()
					spine_renderer.hit_time = spine_renderer.hit_time + 1
					if attacker.in_area_effect and spine_renderer ~= attacker.spine_renderer then
						attacker.area_hit_time = spine_renderer.hit_time
					end
				end
				-- if (spine_renderer.is_area_attack and attacker.play_stand == 1) then --目前只是群攻动作播放完回到站立动作
				if attacker.play_stand == 1 then
					-- SkillAct.setAnimation(spine_renderer, spine_renderer.stand, true) 
				end
				spine_renderer.is_area_attack = nil
				-- 这里延迟一下因为可能存在moveback 这个时候要是还没出发moveback,直接结束会造成播报错乱
				delayOnce(function()
					BattleController:getInstance():getModel():actFinish(attacker)        -- 通知动作事件结束
				end, 0.1)

                attacker.spine_renderer:showHallowsState(true)
				spine_renderer.in_animation = false
				attacker:reTryChangeSpine()
			end
		end
		local callback = function(spine)
			spine_renderer.hit_time = 0
            spine_renderer.hit_num = math.max(1, attacker.split_hurt or 1)
            spine_renderer.split_hurt = math.max(1, attacker.split_hurt or 1)
			
			spine_renderer.current_anime = anima_name
			spine_renderer.in_animation = true
			if is_reverse then
			    spine_renderer:reverse(-spine_renderer.obj_type)
			end
			spine:registerSpineEventHandler(animationEventFunc, sp.EventType.ANIMATION_EVENT)
			spine:registerSpineEventHandler(animationCompleteFunc, sp.EventType.ANIMATION_COMPLETE)
			print(attacker.object_name)
			print(anima_name)
			if attacker.res=="H80001" then
			--	animationEventFunc(nill)
			--	spine:registerSpineEventHandler(animationEventFunc, sp.EventType.ANIMATION_START)
			end
		end
		print(anima_name)
		SkillAct.setAnimation(spine_renderer, anima_name, is_loop, callback, anima_res, attacker)
	end)
end

-- 设置动作
function SkillAct.setAnimation(spine_renderer, anima_name, is_loop, callback, anima_res, attacker)
	print("-----------设置动作-----------------------------------",anima_name,is_loop)
	local last_action_name = spine_renderer:getActionName()
	local last_action_res = spine_renderer:getActionRes()
	if anima_name and string.find(anima_name, "E") == nil and last_action_res ~= anima_res then
		print("-----------设置动作---------------1-------anima_name-------------",anima_name)
		if spine_renderer.res and spine_renderer.res ~= "" then
			if spine_renderer and spine_renderer.res=="H80001" then
				spine_renderer:setActionName(anima_name, anima_res)
				spine_renderer:reverse(spine_renderer.obj_type)
			else
	
			local res = spine_renderer.res
			if spine_renderer.is_change_status and spine_renderer.buff_spine then	-- 这个是变身buff
				res = spine_renderer.buff_spine 
			end
			local spine_tmp = nil
			spine_tmp = createArmature(res, (anima_res or anima_name))
			if not tolua.isnull(spine_renderer.spine) then
				spine_renderer.spine:runAction(cc.RemoveSelf:create(true))
			end
			spine_renderer.spine = spine_tmp
			spine_renderer:setActionName(anima_name, anima_res)
			spine_renderer:reverse(spine_renderer.obj_type)
			if not tolua.isnull(spine_tmp) ~= nil and spine_tmp then
				spine_renderer:addChild(spine_tmp)
			end
		end
		end
	end

	spine_renderer.anima_name = anima_name
	if spine_renderer.spine then
		spine_renderer.spine:setAnimation(0, anima_name, is_loop)
		spine_renderer.spine:setToSetupPose()
	end

	if callback then
		callback(spine_renderer.spine)
	end
end


function SkillAct.flyEffect(attacker,spine_renderer,bid,effect_name,target_pos,move_time,delay_time,start_height)
	return cc.Sequence:create(
		SkillAct.dt(delay_time / display.DEFAULT_FPS), cc.CallFunc:create(function()
			BattleController:getInstance():getModel():actStart(attacker)
			local action_name = PlayerAction.action
			local effect_config = Config.SkillData.data_get_effect_data[bid]
			if effect_config and effect_config.up_action_name ~= "" then
				action_name = effect_config.up_action_name
			end
			local item = SpineRenderer.New(cc.p(0, 0), effect_name, nil, false, action_name)
			item:reverse(attacker.obj_type)
			local parent, zorder = spine_renderer.root:getParent(), spine_renderer.root:getLocalZOrder()
			item:addToLayer(parent, zorder)
			--if shadow_data then
				local is_shadow = FALSE
				local shadow_num =4      -- 影子个数
				local speed_cut = 0.07     -- 影子速度削减
				local shadow_opacity =  40--影子透明度消减
				local shadow_offset = 40
				item.shadow_data = {num = shadow_num, speed = speed_cut, shadow_opacity = shadow_opacity, shadow_offset = shadow_offset}
			--end
			
			local start_fun = cc.CallFunc:create(function()
				local pos_start = cc.p(spine_renderer.root:getPosition())
				pos_start.y = pos_start.y + start_height
				pos_start.x = pos_start.x
				item.root:setPosition(pos_start)
				if is_shadow == TRUE then
					SkillAct.createItemShadow(item, effect_name, action_name,zorder)
				end
			end)
			local finish_fun = cc.CallFunc:create(function()
				item:release()
				BattleController:getInstance():getModel():actFinish(attacker)
			end)
			SkillAct.setAnimation(item, action_name, true)
			local move_time = move_time
			local move_to = cc.MoveTo:create(move_time / display.DEFAULT_FPS, target_pos)
			local setZorder = cc.CallFunc:create(function()
				item.root:setLocalZOrder(SCREEN_HEIGHT + target_pos.y + 999)
			end) 
			local act_move = cc.Sequence:create(setZorder, move_to)
			item:runAction(cc.Sequence:create(start_fun,act_move,finish_fun))
	end))
end

function SkillAct.flyItem(attacker, spine_renderer, reverse, target_pos, time_arg, effect_name, is_back, hit_callback, start_height, tail_effect, scale, is_offset_angle, bid, x_fix, y_fix, is_shadow, shadow_data)	
	return cc.Sequence:create(
		SkillAct.dt(time_arg.delay_time / display.DEFAULT_FPS), cc.CallFunc:create(function()
		BattleController:getInstance():getModel():actStart(attacker)
		print("----------------SkillAct.flyItem--------------bid------------effect_name--------",effect_name)

		if effect_name ~= "" then
			local action_name = PlayerAction.action
			local effect_config = Config.SkillData.data_get_effect_data[bid]
			if effect_config and effect_config.up_action_name ~= "" then
				action_name = effect_config.up_action_name
			end

			print("----------------SkillAct.flyItem--------------bid--------------------",bid)

			--local  item_effect = nil
			local item = SpineRenderer.New(cc.p(0, 0), effect_name, scale, false, action_name)
			item:reverse(reverse)
			local parent, zorder = spine_renderer.root:getParent(), spine_renderer.root:getLocalZOrder()
			item:addToLayer(parent, zorder)
			if shadow_data then
				local is_shadow = is_shadow or FALSE
				local shadow_num = shadow_data.shadow_num or 4      -- 影子个数
				local speed_cut = shadow_data.speed_cut or 0.07     -- 影子速度削减
				local shadow_opacity = shadow_data.opacity or 40--影子透明度消减
				local shadow_offset =(shadow_data.shadow_offset or 40)
				item.shadow_data = {num = shadow_num, speed = speed_cut, shadow_opacity = shadow_opacity, shadow_offset = shadow_offset}
			end			
			local start_fun = cc.CallFunc:create(function()
				local pos_start = cc.p(spine_renderer.root:getPosition())
				pos_start.y = pos_start.y + start_height
				pos_start.x = pos_start.x
				item.root:setPosition(pos_start)
				attacker.in_area_effect = true
				if is_shadow == TRUE then
					SkillAct.createItemShadow(item, effect_name, action_name,zorder,reverse)
				end
			end)
			local hit_fun = hit_callback and cc.CallFunc:create(hit_callback) or nil
			local finish_fun = cc.CallFunc:create(function()
				item:release()
				BattleController:getInstance():getModel():actFinish(attacker)
				attacker.in_area_effect = nil
			end)
			SkillAct.setAnimation(item, action_name, true)
			local move_act, move_particle
			local act_list = {}
			local temp_x_fix = x_fix or 0 
			local temp_y_fix = y_fix or 0
			for key, pos in pairs(target_pos) do
				local temp_pos_start = cc.p(spine_renderer.root:getPosition())
				temp_pos_start.y = temp_pos_start.y + temp_y_fix
				local y_offset =(pos.y - temp_pos_start.y) * math.abs(temp_x_fix) /(pos.x - temp_pos_start.x) * attacker.obj_type
				
				local pos_temp = cc.p(pos.x + temp_x_fix, pos.y - y_offset)
				local move_time = time_arg.time_all * time_arg.time_list[key + 1] / time_arg.time_list[1]
				local move_to = cc.MoveTo:create(move_time / display.DEFAULT_FPS, pos_temp)

				local setZorder = cc.CallFunc:create(function()
					item.root:setLocalZOrder(SCREEN_HEIGHT + pos.y + 999)
					SkillAct.changeRotation(item.root, pos_temp, reverse)
				end)
				table.insert(act_list, cc.Sequence:create(setZorder, move_to, hit_fun))
			end
			
			if #act_list ~= 0 then
				move_act = cc.Sequence:create(unpack(act_list))
			end
			local move_back
			if is_back == TRUE then
				local pos_back = cc.p(spine_renderer.root:getPosition())
				local move_time = time_arg.time_all * time_arg.time_list[#target_pos + 2] / time_arg.time_list[1]
				pos_back.y = pos_back.y + start_height
				move_back = cc.MoveTo:create(move_time / display.DEFAULT_FPS, pos_back)
			end
			item:runAction(cc.Sequence:create(start_fun, move_act, move_back, finish_fun))
		end
	end))
end


-- 创建残影
function SkillAct.createItemShadow(spine_renderer, res, action_name, zorder, obj_type)
	if not spine_renderer.shadow_data then return end
	if spine_renderer.shadow_list == nil then
		spine_renderer.shadow_list = {}
		for i = 1, spine_renderer.shadow_data.num do
			local spine_widght = ccui.Widget:create()
			spine_widght:setContentSize(cc.size(200,100))
			spine_widght:setAnchorPoint(cc.p(0,0))
			local one_shadow = createSpineByName(res)
			one_shadow:setTimeScale(1 - i * spine_renderer.shadow_data.speed)
			one_shadow:setAnchorPoint(cc.p(0, 0.5))
			one_shadow:setScaleX(obj_type)
			one_shadow:setOpacity(255 - i * spine_renderer.shadow_data.shadow_opacity)
		
			one_shadow:setAnimation(0, action_name, true)
			one_shadow:setToSetupPose()
			spine_widght:addChild(one_shadow)
			spine_widght:setScale((1 -((i - 1) * 0.1)))
			spine_widght:setPositionX(- (i-1) * spine_renderer.shadow_data.shadow_offset * obj_type)
			spine_renderer:addChild(spine_widght, zorder - i)
			table.insert(spine_renderer.shadow_list, one_shadow)
		end
	else    -- 已经有残影
		for _, one_shadow in pairs(spine_renderer.shadow_list) do
			one_shadow:setVisible(true)
			one_shadow:setAnimation(0, action_name, true)
			one_shadow:setToSetupPose()
		end
	end
end


-- 创建残影
function SkillAct.createShadow(spine_renderer, anima_name, action_name)
	if not spine_renderer.role_shadow_data then return end
	if spine_renderer.role_shadow_list == nil then
		spine_renderer.role_shadow_list = {}
		for i = 1, spine_renderer.role_shadow_data.num do
			local spine_widght = ccui.Widget:create()
			spine_widght:setContentSize(cc.size(200,100))
			spine_widght:setAnchorPoint(cc.p(0,0))
			local one_shadow = createSpineByName(spine_renderer.res, anima_name)
			setChildUnEnabled(true,one_shadow,Config.ColorData.data_color4[1])
			one_shadow:setAnchorPoint(cc.p(0, 0.5))
			one_shadow:setScaleX(spine_renderer.obj_type)
			local alpha = 0 
			if type(spine_renderer.role_shadow_data.alpha) == "table" then
				alpha = spine_renderer.role_shadow_data.alpha[i]
			else
				alpha = 255 - i * spine_renderer.role_shadow_data.alpha
			end
			one_shadow:setOpacity(alpha)
			one_shadow:setAnimation(0, action_name, true)
			one_shadow:setToSetupPose()
			spine_widght:addChild(one_shadow)
			if spine_renderer.role_shadow_data.is_stand == TRUE then				
				spine_widght:setPosition(spine_renderer.root:getPosition())
			else
				local is_fix_temp = 0
				if type(spine_renderer.role_shadow_data.is_fix) == "table" then
					is_fix_temp = spine_renderer.role_shadow_data.is_fix[i]
				else
					is_fix_temp = spine_renderer.role_shadow_data.is_fix 
				end
				
				spine_widght:setPositionX(-is_fix_temp * spine_renderer.obj_type)
			end
			spine_renderer.root:addChild(spine_widght,spine_renderer.root:getLocalZOrder() - 999)
			table.insert(spine_renderer.role_shadow_list, one_shadow)
		end
	else    -- 已经有残影
		for _, one_shadow in pairs(spine_renderer.role_shadow_list) do
			one_shadow:setVisible(true)
			one_shadow:setAnimation(0, action_name, true)
			one_shadow:setToSetupPose()
		end
	end
end

function SkillAct.setAnimaWithEventFinish(attacker, anima_name, hit_callback, finish_callback, spine_renderer, is_loop)
	return cc.CallFunc:create(function()
		local function animationCompleteFunc(event)
			if spine_renderer.hit_time < spine_renderer.hit_num and hit_callback ~= nil then
				hit_callback()
				spine_renderer.hit_time = spine_renderer.hit_time + 1
				if attacker.in_area_effect and spine_renderer ~= attacker.spine_renderer then
					attacker.area_hit_time = spine_renderer.hit_time
				end
			end
			if event.animation == anima_name then
				if finish_callback ~= nil then
					finish_callback(spine_renderer)
				end
			end
		end
		spine_renderer.spine:registerSpineEventHandler(animationCompleteFunc, sp.EventType.ANIMATION_COMPLETE)
		if hit_callback then
			local function animationEventFunc(event)
				if(event.eventData.name == "hit" or event.eventData.name == "Hit" or event.eventData.name == "HIT") and spine_renderer.hit_time < spine_renderer.hit_num and hit_callback ~= nil then
					hit_callback()
					spine_renderer.hit_time = spine_renderer.hit_time + 1
					if attacker.in_area_effect and spine_renderer ~= attacker.spine_renderer then
						attacker.area_hit_time = spine_renderer.hit_time
					end
				elseif string.find(event.eventData.name, "hit_num") then
					local hit_num = tonumber(string.sub(event.eventData.name, 8))
					if hit_num and hit_num > 1 then
						spine_renderer.hit_num = hit_num
					      
						BattleController:getInstance():getModel():calcMagicHurt(attacker)        -- 计算伤害
					end
				elseif event.eventData.name == "hit_none" then
					BattleController:getInstance():getModel():actHurt(attacker)
				elseif event.eventData.name == "hit_big" then --提示播放受击特效
					BattleController:getInstance():getModel():actHurt(attacker,true)
				end
			end
			spine_renderer.spine:registerSpineEventHandler(animationEventFunc, sp.EventType.ANIMATION_EVENT)
		end
		spine_renderer.hit_time = 0
		spine_renderer.hit_num = 1
		spine_renderer.spine:setAnimation(0, anima_name, is_loop)
	end)
end

-- bool 标示是否要加上 + 或者 -
function SkillAct.getBmpFont(num, type_,is_round)
	print("----------------getBmpFont--------------------------------------------",num)
	print("----------------getBmpFont--------------------type_------------------------",type_)
	type_ = type_ or 1
	local scale = 0.5
	local chg_view = math.abs(num)
	local font = CommonNum.new(type_, nil, 0, 1, cc.p(0, 0))
	-- -- --把减号置换成/
	if type_ ~= 7 and not is_round  then
		if num < 0 then
			font:setNum(chg_view, false)
		else
			font:setNum(chg_view, true)
		end
	else
		font:setNum(chg_view)
	end
	font.scale = scale
	return font
end

--==============================--
--desc:预加载模型和动作
--@spine_name:
--@action_name:
--@return 
--==============================--
function SkillAct.addSpine(spine_name, action_name)
	if type(spine_name) == "string" and spine_name ~= "" then
		local battle_model = BattleController:getInstance():getModel() 
		local json_path, atlas_path, png, prefix = PathTool.getSpineByName(spine_name, action_name)
		local is_load = battle_model:resLoadStart(png)
		if display.isPrefixExist(prefix) then
			battle_model:setRes(png)
		elseif is_load then
			QueueManager:getInstance():add(spine_name, "SkillAct", function()
				local pixelformal = getPixelFormat(spine_name) 
				cc.Director:getInstance():getTextureCache():addImageAsync(png, function()
					battle_model:resLoadFinish(png)
				end, pixelformal)
			end)
		end
	elseif type(spine_name) == "table" then
		for _, name in pairs(spine_name) do
			SkillAct.addSpine(name)
		end
	end
end

function SkillAct.clearSpine()
	QueueManager:getInstance():remove("SkillAct") 
end

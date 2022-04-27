----------------------------------------------------
-- 此文件由数据工具生成
-- 无尽试炼--privilege_data.xml
--------------------------------------

Config = Config or {} 
Config.PrivilegeData = Config.PrivilegeData or {}

-- -------------------const_start-------------------
Config.PrivilegeData.data_const_length = 0
Config.PrivilegeData.data_const = {

}
Config.PrivilegeData.data_const_fun = function(key)
	local data=Config.PrivilegeData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PrivilegeData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------fast_combat_cost_start-------------------
Config.PrivilegeData.data_fast_combat_cost_length = 8
Config.PrivilegeData.data_fast_combat_cost = {
	[1] = {cost=200},
	[2] = {cost=200},
	[3] = {cost=200},
	[4] = {cost=200},
	[5] = {cost=200},
	[6] = {cost=200},
	[7] = {cost=200},
	[8] = {cost=200}
}
Config.PrivilegeData.data_fast_combat_cost_fun = function(key)
	local data=Config.PrivilegeData.data_fast_combat_cost[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PrivilegeData.data_fast_combat_cost['..key..'])not found') return
	end
	return data
end
-- -------------------fast_combat_cost_end---------------------


-- -------------------privilege_data_start-------------------
Config.PrivilegeData.data_privilege_data_length = 6
Config.PrivilegeData.data_privilege_data = {
	[101] = {id=101, name="先知水晶礼包", pay_type=1, charge_id=304, loss=30, limit_type=1, limit_day=7, title_type=1, desc="召唤强力英雄必购礼包！超值优惠，每周限购一次！", icon_id="10", limit_lev=0, sort_id=1},
	[102] = {id=102, name="快速作战特权", pay_type=1, charge_id=305, loss=68, limit_type=1, limit_day=30, title_type=1, desc="搜集资源特权！每天三次免费快速作战，再送召唤福利！", icon_id="10", limit_lev=0, sort_id=3},
	[103] = {id=103, name="远航高级特权", pay_type=2, charge_id=0, loss=980, limit_type=0, limit_day=0, title_type=2, desc="远航高级特权，每天首次远航刷新必出紫色任务！", icon_id="11", limit_lev=0, sort_id=5},
	[104] = {id=104, name="远航豪华特权", pay_type=2, charge_id=0, loss=1980, limit_type=0, limit_day=0, title_type=2, desc="远航豪华特权，每天第3次远航刷新必出橙色任务！", icon_id="11", limit_lev=0, sort_id=6},
	[105] = {id=105, name="元素神殿特权", pay_type=1, charge_id=307, loss=30, limit_type=1, limit_day=30, title_type=3, desc="元素圣殿特权！每天两次额外免费次数，六次购买次数！", icon_id="12", limit_lev=90, sort_id=4},
	[106] = {id=106, name="精灵孵化特权", pay_type=1, charge_id=310, loss=30, limit_type=1, limit_day=7, title_type=0, desc="精灵孵化特权！专属灵窝，再送极品精灵蛋和孵化道具！", icon_id="12", limit_lev=80, sort_id=2}
}
Config.PrivilegeData.data_privilege_data_fun = function(key)
	local data=Config.PrivilegeData.data_privilege_data[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PrivilegeData.data_privilege_data['..key..'])not found') return
	end
	return data
end
-- -------------------privilege_data_end---------------------


-- -------------------privilege_award_start-------------------
Config.PrivilegeData.data_privilege_award_length = 6
Config.PrivilegeData.data_privilege_award = {
	[106] = {{min=80, max=300, reward={{30057,1},{10603,3},{10040,10}}}
	},
	[105] = {{min=1, max=300, reward={{30056,1},{14001,2},{10001,1000}}}
	},
	[104] = {{min=1, max=300, reward={{30055,1},{14001,1},{10403,10}}}
	},
	[103] = {{min=1, max=300, reward={{30054,1},{10403,5},{10001,200}}}
	},
	[102] = {{min=1, max=70, reward={{30053,1},{10403,10},{10001,1000}}},
		{min=71, max=300, reward={{30053,1},{10403,10},{10001,1000}}}
	},
	[101] = {{min=1, max=70, reward={{14001,3},{10001,1000},{1,100000}}},
		{min=71, max=300, reward={{14001,3},{10001,1000},{1,100000}}}
	},
}
-- -------------------privilege_award_end---------------------

----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--cross_ground_data.xml
--------------------------------------

Config = Config or {} 
Config.CrossGroundData = Config.CrossGroundData or {}

-- -------------------base_start-------------------
Config.CrossGroundData.data_base_length = 4
Config.CrossGroundData.data_base = {
	[1] = {{index=2, id=1004, name="周冠军赛", open_limit={{'lev',55}}, award={72109,10453}, desc="每周日12点-13点开启", res_id=4, groud=1}, {index=1, id=1001, name="跨服天梯", open_limit={{'lev',55}}, award={50801,38101}, desc="每周六0点-周日23点开启", res_id=1, groud=1}},
	[3] = {{index=4, id=1002, name="超凡段位赛", open_limit={{'world_lev',100},{'lev',100}}, award={51001,72111,10454,27,3}, desc="每日0点-23点30分开启", res_id=2, groud=3}},
	[4] = {{index=6, id=1006, name="巅峰冠军赛", open_limit={{'world_lev',120},{'lev',115}}, award={72112,50024,10603}, desc="每日一场 / 20点30分开战", res_id=6, groud=4}, {index=5, id=1003, name="跨服竞技场", open_limit={{'world_lev',120},{'lev',115}}, award={51101,29961}, desc="每周二、四、六全天开启", res_id=3, groud=4}},
	[2] = {{index=3, id=1005, name="组队竞技场", open_limit={{'lev',70}}, award={51201,30,3,29961}, desc="每周五12点-周日23点开启", res_id=5, groud=2}}
}
-- -------------------base_end---------------------


-- -------------------adventure_activity_start-------------------
Config.CrossGroundData.data_adventure_activity_length = 3
Config.CrossGroundData.data_adventure_activity = {
	[1] = {id=1, activate={{'lev',50}}, activate_2={}, award={{1,1},{72001,1},{10450,1}}, desc="50级开启", desc2="", res_id=1, retrue_id=1, item_desc="神界冒险每2天重置1次"},
	[3] = {id=3, activate={{'lev',90}}, activate_2={}, award={{17011,1},{17001,1},{17002,1},{17003,1},{17004,1},{17005,1}}, desc="90级开启", desc2="", res_id=2, retrue_id=2, item_desc="周一到周五轮流开启，周末全部开启"},
	[4] = {id=4, activate={{'world_lev',110},{'lev',105}}, activate_2={{'lev',120}}, award={{17193,1},{28,1},{10030,1},{3,1}}, desc="105级 且 世界等级110级 开启", desc2="或 只需个人达120级开启", res_id=3, retrue_id=3, item_desc="全天开放，参与获英雄神装"}
}
Config.CrossGroundData.data_adventure_activity_fun = function(key)
	local data=Config.CrossGroundData.data_adventure_activity[key]
	if DATA_DEBUG and data == nil then
		print('(Config.CrossGroundData.data_adventure_activity['..key..'])not found') return
	end
	return data
end
-- -------------------adventure_activity_end---------------------

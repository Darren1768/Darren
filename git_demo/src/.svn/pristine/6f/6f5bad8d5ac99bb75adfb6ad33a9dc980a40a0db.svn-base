----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--misc_data.xml
--------------------------------------

Config = Config or {} 
Config.MiscData = Config.MiscData or {}

-- -------------------const_start-------------------
Config.MiscData.data_const_length = 5
Config.MiscData.data_const = {
	["cross_level"] = {val=50, desc="跨服聊天等级限制"},
	["province_level"] = {val=35, desc="同省聊天等级限制"},
	["touch_gold_tips"] = {val=1, desc="1、每日点金会刷新3次，每次刷新都会重置点金的剩余次数\n2、点金每日刷新时间：0:00，9:00，19:00\n3、提升VIP等级可增加点金的金币获取量\n4、三档点金奖励分别对应玩家当前挂机1、2、5小时的金币收益"},
	["auth_award"] = {val={{3,100},{10403,1},{10001,100}}, desc="实名活动奖励"},
	["hero_store_sign_time"] = {val=1581562800, desc="英魂商店时间戳改动？"}
}
Config.MiscData.data_const_fun = function(key)
	local data=Config.MiscData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.MiscData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------get_time_items_start-------------------
Config.MiscData.data_get_time_items_length = 12
Config.MiscData.data_get_time_items = {
	[1] = {index=1, time=60, items={{3,50}}},
	[2] = {index=2, time=150, items={{1,50000}}},
	[3] = {index=3, time=210, items={{22,50000}}},
	[4] = {index=4, time=530, items={{26301,1}}},
	[5] = {index=5, time=840, items={{3,100}}},
	[6] = {index=6, time=1680, items={{1,150000}}},
	[7] = {index=7, time=2400, items={{22,150000}}},
	[8] = {index=8, time=3600, items={{27300,1}}},
	[9] = {index=9, time=5400, items={{3,200}}},
	[10] = {index=10, time=7200, items={{1,300000}}},
	[11] = {index=11, time=10800, items={{22,300000}}},
	[12] = {index=12, time=14400, items={{10403,5}}}
}
Config.MiscData.data_get_time_items_fun = function(key)
	local data=Config.MiscData.data_get_time_items[key]
	if DATA_DEBUG and data == nil then
		print('(Config.MiscData.data_get_time_items['..key..'])not found') return
	end
	return data
end
-- -------------------get_time_items_end---------------------


-- -------------------cycle_gift_info_start-------------------
Config.MiscData.data_cycle_gift_info_length = 2
Config.MiscData.data_cycle_gift_info = {
	[1] = {
		[401] = {charge_id=401, gift_name="每周福利", gift_type=1, val=30, limit_count=3, sort_id=1},
		[402] = {charge_id=402, gift_name="每周福利", gift_type=1, val=68, limit_count=3, sort_id=2},
		[403] = {charge_id=403, gift_name="每周福利", gift_type=1, val=128, limit_count=3, sort_id=3},
		[404] = {charge_id=404, gift_name="每周福利", gift_type=1, val=328, limit_count=3, sort_id=4},
		[405] = {charge_id=405, gift_name="每周福利", gift_type=1, val=448, limit_count=3, sort_id=5},
		[406] = {charge_id=406, gift_name="每周福利", gift_type=1, val=648, limit_count=1, sort_id=6},
		[407] = {charge_id=407, gift_name="每周福利", gift_type=1, val=648, limit_count=1, sort_id=7},
	},
	[2] = {
		[411] = {charge_id=411, gift_name="月度礼包", gift_type=2, val=30, limit_count=1, sort_id=1},
		[412] = {charge_id=412, gift_name="月度礼包", gift_type=2, val=68, limit_count=1, sort_id=2},
		[413] = {charge_id=413, gift_name="月度礼包", gift_type=2, val=128, limit_count=2, sort_id=3},
		[414] = {charge_id=414, gift_name="月度礼包", gift_type=2, val=328, limit_count=3, sort_id=4},
		[415] = {charge_id=415, gift_name="月度礼包", gift_type=2, val=448, limit_count=3, sort_id=5},
		[416] = {charge_id=416, gift_name="月度礼包", gift_type=2, val=648, limit_count=3, sort_id=6},
		[417] = {charge_id=417, gift_name="月度礼包", gift_type=2, val=648, limit_count=3, sort_id=7},
	},
}
-- -------------------cycle_gift_info_end---------------------


-- -------------------cycle_gift_reward_start-------------------
Config.MiscData.data_cycle_gift_reward_length = 14
Config.MiscData.data_cycle_gift_reward = {
	[401] = {
		[1] = {charge_id=401, min=1, max=7, reward={{3,300},{60305,2},{10002,5},{10403,3}}, sort_id=1, res_id="30", reg_max=1581562799, reg_min=0},
		[2] = {charge_id=401, min=1, max=7, reward={{3,300},{39006,1},{10002,5},{10403,3}}, sort_id=2, res_id="30", reg_max=2000000000, reg_min=1581562800},
		[3] = {charge_id=401, min=8, max=28, reward={{3,300},{60305,2},{10002,5},{10403,3}}, sort_id=3, res_id="30", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=401, min=29, max=56, reward={{3,300},{60305,2},{10002,5},{10403,4}}, sort_id=4, res_id="30", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=401, min=57, max=84, reward={{3,300},{60305,2},{10002,5},{10403,5}}, sort_id=5, res_id="30", reg_max=2000000000, reg_min=0},
		[6] = {charge_id=401, min=85, max=112, reward={{3,300},{60305,2},{10002,5},{10403,5}}, sort_id=6, res_id="30", reg_max=2000000000, reg_min=0},
		[7] = {charge_id=401, min=113, max=9999, reward={{3,300},{60305,2},{10002,5},{10403,5}}, sort_id=7, res_id="30", reg_max=2000000000, reg_min=0},
	},
	[402] = {
		[1] = {charge_id=402, min=1, max=7, reward={{3,680},{60305,5},{72001,50},{10403,6}}, sort_id=1, res_id="31", reg_max=1581562799, reg_min=0},
		[2] = {charge_id=402, min=1, max=7, reward={{3,680},{39006,1},{72001,50},{10403,6}}, sort_id=2, res_id="31", reg_max=2000000000, reg_min=1581562800},
		[3] = {charge_id=402, min=8, max=28, reward={{3,680},{60305,5},{10450,500},{10403,6}}, sort_id=3, res_id="31", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=402, min=29, max=56, reward={{3,680},{60305,5},{10450,500},{10403,7}}, sort_id=4, res_id="31", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=402, min=57, max=84, reward={{3,680},{60305,5},{10450,500},{10403,8}}, sort_id=5, res_id="31", reg_max=2000000000, reg_min=0},
		[6] = {charge_id=402, min=85, max=112, reward={{3,680},{60305,5},{10450,500},{10403,8}}, sort_id=6, res_id="31", reg_max=2000000000, reg_min=0},
		[7] = {charge_id=402, min=113, max=9999, reward={{3,680},{60305,5},{10450,500},{10403,8}}, sort_id=7, res_id="31", reg_max=2000000000, reg_min=0},
	},
	[403] = {
		[1] = {charge_id=403, min=1, max=7, reward={{3,1280},{39002,1},{10,2000},{10403,11}}, sort_id=1, res_id="32", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=403, min=8, max=28, reward={{3,1280},{39002,1},{10450,1200},{10403,12}}, sort_id=2, res_id="32", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=403, min=29, max=35, reward={{3,1280},{39002,1},{10450,1200},{10403,13}}, sort_id=3, res_id="32", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=403, min=36, max=56, reward={{3,1280},{39022,1},{10450,1200},{10403,13}}, sort_id=4, res_id="37", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=403, min=57, max=84, reward={{3,1280},{39022,1},{10450,1200},{10403,15}}, sort_id=5, res_id="37", reg_max=2000000000, reg_min=0},
		[6] = {charge_id=403, min=85, max=112, reward={{3,1280},{39022,1},{10450,1200},{10403,15}}, sort_id=6, res_id="37", reg_max=2000000000, reg_min=0},
		[7] = {charge_id=403, min=113, max=9999, reward={{3,1280},{39022,1},{10450,1200},{10403,15}}, sort_id=7, res_id="37", reg_max=2000000000, reg_min=0},
	},
	[404] = {
		[1] = {charge_id=404, min=1, max=7, reward={{3,3280},{39079,1},{1,3800000},{10403,18}}, sort_id=1, res_id="33", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=404, min=8, max=28, reward={{3,3280},{39079,1},{1,5500000},{10403,18}}, sort_id=2, res_id="33", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=404, min=29, max=56, reward={{3,3280},{39081,1},{1,8000000},{10403,20}}, sort_id=3, res_id="33", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=404, min=57, max=84, reward={{3,3280},{39081,1},{1,8000000},{10403,22}}, sort_id=4, res_id="33", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=404, min=85, max=112, reward={{3,3280},{39081,1},{1,8000000},{10403,22}}, sort_id=5, res_id="33", reg_max=2000000000, reg_min=0},
		[6] = {charge_id=404, min=113, max=9999, reward={{3,3280},{39081,1},{1,8000000},{10403,22}}, sort_id=6, res_id="33", reg_max=2000000000, reg_min=0},
	},
	[405] = {
		[1] = {charge_id=405, min=1, max=28, reward={{3,4480},{10450,10000},{1,5000000},{10403,26}}, sort_id=1, res_id="34", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=405, min=29, max=56, reward={{3,4480},{10450,10000},{1,7000000},{10403,30}}, sort_id=2, res_id="34", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=405, min=57, max=60, reward={{3,4480},{10450,10000},{1,10000000},{10403,31}}, sort_id=3, res_id="34", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=405, min=61, max=84, reward={{3,4480},{10450,10000},{10470,1},{10403,31}}, sort_id=4, res_id="34", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=405, min=85, max=112, reward={{3,4480},{10450,10000},{10470,1},{10403,31}}, sort_id=5, res_id="34", reg_max=2000000000, reg_min=0},
		[6] = {charge_id=405, min=113, max=9999, reward={{3,4480},{10450,10000},{10470,1},{10403,31}}, sort_id=6, res_id="34", reg_max=2000000000, reg_min=0},
	},
	[406] = {
		[1] = {charge_id=406, min=1, max=28, reward={{3,6480},{10454,1},{29905,50},{10403,35}}, sort_id=1, res_id="35", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=406, min=29, max=56, reward={{3,6480},{10454,1},{29905,50},{10403,40}}, sort_id=2, res_id="35", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=406, min=57, max=84, reward={{3,6480},{10454,1},{29905,50},{10403,42}}, sort_id=3, res_id="35", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=406, min=85, max=112, reward={{3,6480},{10454,1},{29905,50},{10403,42}}, sort_id=4, res_id="35", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=406, min=113, max=9999, reward={{3,6480},{10454,1},{29905,50},{10403,42}}, sort_id=5, res_id="35", reg_max=2000000000, reg_min=0},
	},
	[407] = {
		[1] = {charge_id=407, min=8, max=28, reward={{3,6480},{39056,1},{10040,600},{1,10000000}}, sort_id=1, res_id="36", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=407, min=29, max=56, reward={{3,6480},{39056,1},{10040,600},{1,10000000}}, sort_id=2, res_id="36", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=407, min=57, max=84, reward={{3,6480},{39056,1},{10040,600},{1,10000000}}, sort_id=3, res_id="36", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=407, min=85, max=112, reward={{3,6480},{39056,1},{10040,600},{1,10000000}}, sort_id=4, res_id="36", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=407, min=113, max=9999, reward={{3,6480},{39056,1},{10040,600},{1,10000000}}, sort_id=5, res_id="36", reg_max=2000000000, reg_min=0},
	},
	[411] = {
		[1] = {charge_id=411, min=1, max=30, reward={{3,300},{39001,1},{10403,6},{37001,5}}, sort_id=1, res_id="25", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=411, min=31, max=60, reward={{3,300},{39001,1},{10403,7},{37001,5}}, sort_id=2, res_id="25", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=411, min=61, max=90, reward={{3,300},{39001,1},{10403,8},{37001,5}}, sort_id=3, res_id="25", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=411, min=91, max=120, reward={{3,300},{39001,1},{10403,8},{37001,5}}, sort_id=4, res_id="25", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=411, min=121, max=9999, reward={{3,300},{39001,1},{10403,8},{37001,5}}, sort_id=5, res_id="25", reg_max=2000000000, reg_min=0},
	},
	[412] = {
		[1] = {charge_id=412, min=1, max=30, reward={{3,680},{39006,1},{10403,8},{37001,10}}, sort_id=1, res_id="26", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=412, min=31, max=60, reward={{3,680},{39006,1},{10403,9},{37001,10}}, sort_id=2, res_id="26", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=412, min=61, max=90, reward={{3,680},{39006,1},{10403,10},{37001,10}}, sort_id=3, res_id="26", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=412, min=91, max=120, reward={{3,680},{39006,1},{10403,10},{37001,10}}, sort_id=4, res_id="26", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=412, min=121, max=9999, reward={{3,680},{39006,1},{10403,10},{37001,10}}, sort_id=5, res_id="26", reg_max=2000000000, reg_min=0},
	},
	[413] = {
		[1] = {charge_id=413, min=1, max=30, reward={{3,1280},{14001,2},{10403,11},{10450,2000}}, sort_id=1, res_id="22", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=413, min=31, max=60, reward={{3,1280},{14001,2},{10403,13},{10450,2000}}, sort_id=2, res_id="22", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=413, min=61, max=90, reward={{3,1280},{14001,3},{10403,15},{10450,2000}}, sort_id=3, res_id="22", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=413, min=91, max=120, reward={{3,1280},{14001,3},{10403,15},{10450,2000}}, sort_id=4, res_id="22", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=413, min=121, max=9999, reward={{3,1280},{14001,3},{10403,15},{10450,2000}}, sort_id=5, res_id="22", reg_max=2000000000, reg_min=0},
	},
	[414] = {
		[1] = {charge_id=414, min=1, max=30, reward={{3,3280},{14001,4},{10403,20},{1,20000000}}, sort_id=1, res_id="23", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=414, min=31, max=60, reward={{3,3280},{14001,6},{10403,22},{1,20000000}}, sort_id=2, res_id="23", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=414, min=61, max=90, reward={{3,3280},{14001,7},{10403,24},{1,20000000}}, sort_id=3, res_id="23", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=414, min=91, max=120, reward={{3,3280},{14001,7},{10403,24},{1,20000000}}, sort_id=4, res_id="23", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=414, min=121, max=9999, reward={{3,3280},{14001,7},{10403,24},{1,20000000}}, sort_id=5, res_id="23", reg_max=2000000000, reg_min=0},
	},
	[415] = {
		[1] = {charge_id=415, min=1, max=30, reward={{3,4480},{14001,7},{10403,26},{1,30000000}}, sort_id=1, res_id="24", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=415, min=31, max=60, reward={{3,4480},{14001,8},{10403,30},{1,30000000}}, sort_id=2, res_id="24", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=415, min=61, max=90, reward={{3,4480},{14001,9},{10403,31},{1,30000000}}, sort_id=3, res_id="24", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=415, min=91, max=120, reward={{3,4480},{14001,9},{10403,31},{1,30000000}}, sort_id=4, res_id="24", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=415, min=121, max=9999, reward={{3,4480},{14001,9},{10403,31},{1,30000000}}, sort_id=5, res_id="24", reg_max=2000000000, reg_min=0},
	},
	[416] = {
		[1] = {charge_id=416, min=1, max=30, reward={{3,6480},{14001,11},{10403,35},{29405,50}}, sort_id=1, res_id="27", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=416, min=31, max=60, reward={{3,6480},{14001,12},{10403,40},{29405,50}}, sort_id=2, res_id="27", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=416, min=61, max=90, reward={{3,6480},{14001,13},{10403,42},{29405,50}}, sort_id=3, res_id="27", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=416, min=91, max=120, reward={{3,6480},{14001,13},{10403,42},{29405,50}}, sort_id=4, res_id="27", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=416, min=121, max=9999, reward={{3,6480},{14001,13},{10403,42},{29405,50}}, sort_id=5, res_id="27", reg_max=2000000000, reg_min=0},
	},
	[417] = {
		[1] = {charge_id=417, min=1, max=30, reward={{3,6480},{14001,11},{10403,35},{29505,50}}, sort_id=1, res_id="28", reg_max=2000000000, reg_min=0},
		[2] = {charge_id=417, min=31, max=60, reward={{3,6480},{14001,12},{10403,40},{29505,50}}, sort_id=2, res_id="28", reg_max=2000000000, reg_min=0},
		[3] = {charge_id=417, min=61, max=90, reward={{3,6480},{14001,13},{10403,42},{29505,50}}, sort_id=3, res_id="28", reg_max=2000000000, reg_min=0},
		[4] = {charge_id=417, min=91, max=120, reward={{3,6480},{14001,13},{10403,42},{29505,50}}, sort_id=4, res_id="28", reg_max=2000000000, reg_min=0},
		[5] = {charge_id=417, min=121, max=9999, reward={{3,6480},{14001,13},{10403,42},{29505,50}}, sort_id=5, res_id="28", reg_max=2000000000, reg_min=0},
	},
}
-- -------------------cycle_gift_reward_end---------------------

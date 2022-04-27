----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--holiday_exchange_data.xml
--------------------------------------

Config = Config or {} 
Config.HolidayExchangeData = Config.HolidayExchangeData or {}

-- -------------------constant_start-------------------
Config.HolidayExchangeData.data_constant_length = 1
Config.HolidayExchangeData.data_constant = {
	["consume_id"] = {label='consume_id', val=80268, desc="消耗物品id"}
}
Config.HolidayExchangeData.data_constant_fun = function(key)
	local data=Config.HolidayExchangeData.data_constant[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidayExchangeData.data_constant['..key..'])not found') return
	end
	return data
end
-- -------------------constant_end---------------------


-- -------------------get_config_const_start-------------------
Config.HolidayExchangeData.data_get_config_const_length = 26
Config.HolidayExchangeData.data_get_config_const = {
	[1] = {id=1, expend={{80268,1600}}, award={{27906,50}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[2] = {id=2, expend={{80268,1600}}, award={{28906,50}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[3] = {id=3, expend={{80268,1600}}, award={{28908,50}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[4] = {id=4, expend={{80268,1200}}, award={{26908,50}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[5] = {id=5, expend={{80268,1200}}, award={{24910,50}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[6] = {id=6, expend={{80268,1200}}, award={{25909,50}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[7] = {id=7, expend={{80268,1400}}, award={{113006,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[8] = {id=8, expend={{80268,1400}}, award={{113004,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[9] = {id=9, expend={{80268,1400}}, award={{113003,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[10] = {id=10, expend={{80268,1400}}, award={{5050204,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[11] = {id=11, expend={{80268,1400}}, award={{5050203,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[12] = {id=12, expend={{80268,1400}}, award={{5050201,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[13] = {id=13, expend={{80268,1400}}, award={{5050202,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[14] = {id=14, expend={{80268,1600}}, award={{10454,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[15] = {id=15, expend={{80268,500}}, award={{39082,1}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[16] = {id=16, expend={{80268,1000}}, award={{29906,50}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[17] = {id=17, expend={{80268,600}}, award={{29905,50}}, r_limit_day=0, r_limit_all=1, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[18] = {id=18, expend={{80268,150}}, award={{10403,10}}, r_limit_day=0, r_limit_all=3, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[19] = {id=19, expend={{80268,150}}, award={{10415,10}}, r_limit_day=0, r_limit_all=3, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[20] = {id=20, expend={{80268,100}}, award={{10460,1}}, r_limit_day=0, r_limit_all=5, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[21] = {id=21, expend={{80268,100}}, award={{10040,35}}, r_limit_day=0, r_limit_all=30, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[22] = {id=22, expend={{80268,100}}, award={{10030,20}}, r_limit_day=0, r_limit_all=30, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[23] = {id=23, expend={{80268,100}}, award={{10450,1000}}, r_limit_day=0, r_limit_all=30, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[24] = {id=24, expend={{80268,100}}, award={{32,50000}}, r_limit_day=0, r_limit_all=30, s_limit_day=0, s_limit_all=0, title="活动限兑", sub_type=3},
	[25] = {id=25, expend={{80268,10}}, award={{10001,100}}, r_limit_day=50, r_limit_all=0, s_limit_day=0, s_limit_all=0, title="每日限兑", sub_type=1},
	[26] = {id=26, expend={{80268,1}}, award={{1,50000}}, r_limit_day=100, r_limit_all=0, s_limit_day=0, s_limit_all=0, title="每日限兑", sub_type=1}
}
Config.HolidayExchangeData.data_get_config_const_fun = function(key)
	local data=Config.HolidayExchangeData.data_get_config_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidayExchangeData.data_get_config_const['..key..'])not found') return
	end
	return data
end
-- -------------------get_config_const_end---------------------

----------------------------------------------------
-- 此文件由数据工具生成
-- 新七日登录配置数据--login_days_new_data.xml
--------------------------------------

Config = Config or {} 
Config.LoginDaysNewData = Config.LoginDaysNewData or {}

-- -------------------day_start-------------------
Config.LoginDaysNewData.data_day_length = 8
Config.LoginDaysNewData.data_day = {
	[1] = {day=1, name="第一天", desc="大量钻石", rewards={{3,200}}, reward_desc="强力坦克，反击连击", action=5, pos={{281,104}}, is_spe_day=0, icon=505, spec_reward={4}, day_desc="领大量钻石", next_desc="明日领影刹"},
	[2] = {day=2, name="第二天", desc="5星影刹", rewards={{26901,50}}, reward_desc="强力坦克，反击连击", action=4, pos={{318,102}}, is_spe_day=1, icon=5051, spec_reward={26016}, day_desc="领五星影刹", next_desc="明日十连抽"},
	[3] = {day=3, name="第三天", desc="十连召唤", rewards={{10403,10}}, reward_desc="欧气满满，助力成长", action=6, pos={{294,102}}, is_spe_day=1, icon=505, spec_reward={10402}, day_desc="领十连抽", next_desc="明日领橙武"},
	[4] = {day=4, name="第四天", desc="全套橙武", rewards={{38093,1}}, reward_desc="群攻冰盾，巨蟒之力", action=7, pos={{301,104}}, is_spe_day=0, icon=505, spec_reward={44105}, day_desc="领橙武", next_desc="明日高级券"},
	[5] = {day=5, name="第五天", desc="高级寻宝", rewards={{37002,1}}, reward_desc="群攻冰盾，巨蟒之力", action=2, pos={{257,103}}, is_spe_day=0, icon=505, spec_reward={60033}, day_desc="领寻宝券", next_desc="明日领符文"},
	[6] = {day=6, name="第六天", desc="太阳符文", rewards={{10453,1}}, reward_desc="群攻冰盾，巨蟒之力", action=3, pos={{293,104}}, is_spe_day=0, icon=505, spec_reward={35113}, day_desc="领太阳符文", next_desc="明日先知水晶"},
	[7] = {day=7, name="第七天", desc="先知水晶", rewards={{14001,1}}, reward_desc="群攻冰盾，巨蟒之力", action=9, pos={{275,71}}, is_spe_day=0, icon=5052, spec_reward={26055}, day_desc="领先知水晶", next_desc="明日领耶梦"},
	[8] = {day=8, name="第八天", desc="5星耶梦", rewards={{24909,50}}, reward_desc="群攻冰盾，巨蟒之力", action=9, pos={{275,71}}, is_spe_day=1, icon=5052, spec_reward={26055}, day_desc="领耶梦加得", next_desc="领耶梦加得"}
}
Config.LoginDaysNewData.data_day_fun = function(key)
	local data=Config.LoginDaysNewData.data_day[key]
	if DATA_DEBUG and data == nil then
		print('(Config.LoginDaysNewData.data_day['..key..'])not found') return
	end
	return data
end
-- -------------------day_end---------------------

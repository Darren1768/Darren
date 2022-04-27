----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--exchange_data.xml
--------------------------------------

Config = Config or {} 
Config.ExchangeData = Config.ExchangeData or {}

-- -------------------shop_exchage_cost_start-------------------
Config.ExchangeData.data_shop_exchage_cost_length = 38
Config.ExchangeData.data_shop_exchage_cost = {
	["open_gold_lev"] = {key="open_gold_lev", val=1, desc="尚未解锁道具商城"},
	["open_guild_lev"] = {key="open_guild_lev", val=1, desc="尚未加入公会"},
	["open_point_lev"] = {key="open_point_lev", val=1, desc="尚未解锁积分商城"},
	["open_secret_lev"] = {key="open_secret_lev", val=1, desc="尚未解锁杂货店"},
	["open_arena_cent_lev"] = {key="open_arena_cent_lev", val=1, desc="尚未解锁竞技场"},
	["open_god_point_lev"] = {key="open_god_point_lev", val=1, desc="20关开启Boss"},
	["open_hero_soul_lev"] = {key="open_hero_soul_lev", val=1, desc="尚未解锁神格商城"},
	["open_guess_point_lev"] = {key="open_guess_point_lev", val=1, desc="尚未解锁竞技场"},
	["mall_def"] = {key="mall_def", val=6, desc="杂货店格子数"},
	["cost_item"] = {key="cost_item", val=10101, desc="神秘刷新券"},
	["exchange_limit_lev"] = {key="exchange_limit_lev", val=1, desc="商城等级限制"},
	["soul_def"] = {key="soul_def", val=11, desc="英雄商城"},
	["treasure_time"] = {key="treasure_time", val={{0,0,0}}, desc="探宝商城刷新时间"},
	["hero_soul_instruction"] = {key="hero_soul_instruction", val=0, desc="当前所有商品买完后将会自动刷新"},
	["star_instruction"] = {key="star_instruction", val=0, desc="当前所有商品买完后将会自动刷新"},
	["secret_instruction"] = {key="secret_instruction", val=0, desc="当前所有商品买完后将会自动刷新"},
	["guess_instruction"] = {key="guess_instruction", val=0, desc="当前所有商品买完后将会自动刷新"},
	["soul_reset_cost"] = {key="soul_reset_cost", val={{11,5000}}, desc="神格商店充值消耗"},
	["max_free_times"] = {key="max_free_times", val=5, desc="杂货店免费次数上限"},
	["number_recovery"] = {key="number_recovery", val=7200, desc="杂货店单次恢复时间（秒）"},
	["maximum_number"] = {key="maximum_number", val=100, desc="杂货店刷新次数上限"},
	["treasure_plaid"] = {key="treasure_plaid", val=8, desc="探宝格子数"},
	["skill_refresh_number"] = {key="skill_refresh_number", val=20, desc="技能商店刷新次数上限"},
	["skill_refresh_time"] = {key="skill_refresh_time", val={{0,0,0}}, desc="技能商店免费次数刷新时间"},
	["skill_refresh_free"] = {key="skill_refresh_free", val=3, desc="技能商店每日免费刷新次数"},
	["open_skill_lev"] = {key="open_skill_lev", val=1, desc="尚未解锁技能商城"},
	["skill_recovery"] = {key="skill_recovery", val=28800, desc="技能商店免费次数恢复时间"},
	["cluster_refresh_free"] = {key="cluster_refresh_free", val=1, desc="跨服竞技场商店每日免费刷新次数"},
	["cluster_recovery"] = {key="cluster_recovery", val=86400, desc="跨服竞技场商店免费次数恢复时间"},
	["cluster_refresh_number"] = {key="cluster_refresh_number", val=20, desc="跨服竞技场商店刷新次数上限"},
	["cluster_refresh_time"] = {key="cluster_refresh_time", val={{0,0,0}}, desc="跨服竞技场商店免费次数刷新时间"},
	["cluster_commodity_num"] = {key="cluster_commodity_num", val=9, desc="跨服竞技场商店商品个数限制"},
	["furniture_refresh_free"] = {key="furniture_refresh_free", val=3, desc="家具随机商店免费刷新次数上限"},
	["furniture_refresh_number"] = {key="furniture_refresh_number", val=10, desc="家具随机商店刷新次数上限"},
	["furniture_refresh_time"] = {key="furniture_refresh_time", val={{0,0,0}}, desc="家具随机商店免费次数刷新时间（弃用字段）"},
	["furniture_recovery"] = {key="furniture_recovery", val=28800, desc="家具随机商店免费次数回复时间（秒）"},
	["open_furniture_lev"] = {key="open_furniture_lev", val=70, desc="尚未解锁宅室商店"},
	["furniture_spend"] = {key="furniture_spend", val=300, desc="家具随机商店刷新所需花费（家园币）"}
}
Config.ExchangeData.data_shop_exchage_cost_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_cost[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_cost['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_cost_end---------------------


-- -------------------shop_list_start-------------------
Config.ExchangeData.data_shop_list_length = 26
Config.ExchangeData.data_shop_list = {
	[1] = {id=1, name="道具", subtype={}, cost_list={}, item_bid=3, login_red={}, limit={}, sort=1},
	[2] = {id=2, name="英雄", subtype={}, cost_list={{11,5000}}, item_bid=11, login_red={}, limit={}, sort=2},
	[4] = {id=4, name="杂货店", subtype={}, cost_list={{3,20}}, item_bid=3, login_red={}, limit={}, sort=10},
	[5] = {id=5, name="公会", subtype={}, cost_list={}, item_bid=10, login_red={}, limit={}, sort=5},
	[6] = {id=6, name="竞技", subtype={}, cost_list={}, item_bid=8, login_red={}, limit={}, sort=4},
	[8] = {id=8, name="征战", subtype={}, cost_list={}, item_bid=25, login_red={}, limit={{'lev',30}}, sort=3},
	[9] = {id=9, name="技能", subtype={}, cost_list={{10450,200}}, item_bid=10450, login_red={}, limit={}, sort=8},
	[16] = {id=16, name="探宝", subtype={}, cost_list={{18,50}}, item_bid=18, login_red={}, limit={{'lev',10}}, sort=6},
	[17] = {id=17, name="段位", subtype={}, cost_list={}, item_bid=27, login_red={}, limit={{'lev',100}}, sort=7},
	[18] = {id=18, name="皮肤", subtype={}, cost_list={}, item_bid=29, login_red={}, limit={{'lev',35}}, sort=9},
	[30] = {id=30, name="跨服天梯", subtype={}, cost_list={}, item_bid=21, login_red={}, limit={{'lev',55}}, sort=11},
	[31] = {id=31, name="先知商店", subtype={}, cost_list={}, item_bid=24, login_red={}, limit={}, sort=12},
	[28] = {id=28, name="神装商店", subtype={}, cost_list={}, item_bid=28, login_red={}, limit={}, sort=13},
	[34] = {id=34, name="跨服竞技", subtype={}, cost_list={{30,100}}, item_bid=30, login_red={}, limit={{'lev',70}}, sort=14},
	[36] = {id=36, name="冠军商店", subtype={}, cost_list={}, item_bid=34, login_red={}, limit={{'lev',55}}, sort=15},
	[37] = {id=37, name="巅峰商店", subtype={}, cost_list={}, item_bid=38, login_red={}, limit={{'lev',55}}, sort=16},
	[40] = {id=40, name="宅室", subtype={41,42,43}, cost_list={}, item_bid=0, login_red={}, limit={}, sort=0},
	[41] = {id=41, name="家具", subtype={}, cost_list={}, item_bid=31, login_red={}, limit={}, sort=0},
	[42] = {id=42, name="出行", subtype={}, cost_list={}, item_bid=31, login_red={}, limit={}, sort=0},
	[43] = {id=43, name="随机商店", subtype={}, cost_list={{31,300}}, item_bid=3, login_red={}, limit={}, sort=0},
	[50] = {id=50, name="圣羽", subtype={51,52}, cost_list={}, item_bid=0, login_red={}, limit={{'lev',10},{'open_day',7}}, sort=0},
	[51] = {id=51, name="英雄", subtype={}, cost_list={}, item_bid=35, login_red={}, limit={{'lev',10},{'open_day',7}}, sort=0},
	[52] = {id=52, name="神装", subtype={}, cost_list={}, item_bid=35, login_red={}, limit={{'lev',120},{'open_day',7}}, sort=0},
	[53] = {id=53, name="英魂商店", subtype={}, cost_list={}, item_bid=10005, login_red={}, limit={{'lev',6}}, sort=0},
	[80] = {id=80, name="圣夜奇境商店", subtype={}, cost_list={}, item_bid=0, login_red={}, limit={{'lev',10},{'open_day',7}}, sort=0},
	[90] = {id=90, name="联盟商店", subtype={}, cost_list={}, item_bid=40, login_red={}, limit={{'lev',1}}, sort=17}
}
Config.ExchangeData.data_shop_list_fun = function(key)
	local data=Config.ExchangeData.data_shop_list[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_list['..key..'])not found') return
	end
	return data
end
-- -------------------shop_list_end---------------------


-- -------------------shop_exchage_gold_start-------------------
Config.ExchangeData.data_shop_exchage_gold_length = 10
Config.ExchangeData.data_shop_exchage_gold = {
	[1] = {type=1, id=1001, order=1, item_bid=10103, item_name="竞技挑战券", item_num=1, bind=1, pay_type="gold", price=20, limit_vip=0, limit_day=5, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=7, discount=14, open_srv_timestamp=0},
	[2] = {type=1, id=1002, order=2, item_bid=14002, item_name="先知精华", item_num=20, bind=1, pay_type="gold", price=200, limit_vip=0, limit_day=5, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=7, discount=140, open_srv_timestamp=0},
	[3] = {type=1, id=1003, order=3, item_bid=14002, item_name="先知精华", item_num=100, bind=1, pay_type="gold", price=1000, limit_vip=0, limit_day=1, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=8, discount=800, open_srv_timestamp=0},
	[4] = {type=1, id=1004, order=4, item_bid=29905, item_name="5星随机碎片", item_num=1, bind=1, pay_type="gold", price=100, limit_vip=0, limit_day=5, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=6, discount=60, open_srv_timestamp=0},
	[5] = {type=1, id=1005, order=5, item_bid=10403, item_name="高级召唤卷", item_num=1, bind=1, pay_type="gold", price=250, limit_vip=2, limit_day=1, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=1, discount=25, open_srv_timestamp=0},
	[6] = {type=1, id=1006, order=6, item_bid=14001, item_name="先知水晶", item_num=1, bind=1, pay_type="gold", price=2500, limit_vip=0, limit_day=2, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=4, discount=1000, open_srv_timestamp=0},
	[7] = {type=1, id=1007, order=7, item_bid=10450, item_name="符文精华", item_num=1000, bind=1, pay_type="gold", price=1000, limit_vip=0, limit_day=1, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=8, discount=800, open_srv_timestamp=0},
	[8] = {type=1, id=1008, order=8, item_bid=37002, item_name="高级寻宝券", item_num=1, bind=1, pay_type="gold", price=1000, limit_vip=0, limit_day=1, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=6, discount=600, open_srv_timestamp=0},
	[9] = {type=1, id=1009, order=9, item_bid=10041, item_name="圣露", item_num=1, bind=1, pay_type="gold", price=1000, limit_vip=0, limit_day=10, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=5, discount=500, open_srv_timestamp=0},
	[10] = {type=1, id=1010, order=10, item_bid=10034, item_name="永恒晶石", item_num=1, bind=1, pay_type="gold", price=500, limit_vip=0, limit_day=0, limit_week=1, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=6, discount=300, open_srv_timestamp=0}
}
Config.ExchangeData.data_shop_exchage_gold_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_gold[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_gold['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_gold_end---------------------


-- -------------------shop_exchage_skin_start-------------------
Config.ExchangeData.data_shop_exchage_skin_length = 13
Config.ExchangeData.data_shop_exchage_skin = {
	[1] = {type=18, id=18001, order=1, item_bid=23002, item_name="水色悠梦(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[2] = {type=18, id=18002, order=2, item_bid=23005, item_name="如梦令(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[3] = {type=18, id=18003, order=3, item_bid=23008, item_name="赤羽火舞(7天)", item_num=1, bind=1, pay_type="skin_debris", price=20, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[4] = {type=18, id=18004, order=4, item_bid=23011, item_name="御龙金甲(7天)", item_num=1, bind=1, pay_type="skin_debris", price=20, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[5] = {type=18, id=18005, order=5, item_bid=23014, item_name="赤魅海盗(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[6] = {type=18, id=18006, order=6, item_bid=23017, item_name="甜心女仆(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[7] = {type=18, id=18007, order=7, item_bid=23020, item_name="暗影暴君(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[8] = {type=18, id=18008, order=8, item_bid=23023, item_name="竹韵清风(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[9] = {type=18, id=18009, order=9, item_bid=23026, item_name="暴走青春(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[10] = {type=18, id=18010, order=10, item_bid=23029, item_name="绽放的誓约(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[11] = {type=18, id=18011, order=11, item_bid=23032, item_name="魅夜男爵(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[12] = {type=18, id=18012, order=12, item_bid=23035, item_name="冰雪圆舞曲(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[13] = {type=18, id=18015, order=13, item_bid=23044, item_name="一战封神(7天)", item_num=1, bind=1, pay_type="skin_debris", price=40, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0}
}
Config.ExchangeData.data_shop_exchage_skin_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_skin[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_skin['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_skin_end---------------------


-- -------------------shop_exchage_guild_start-------------------
Config.ExchangeData.data_shop_exchage_guild_length = 16
Config.ExchangeData.data_shop_exchage_guild = {
	[1] = {type=5, id=5001, order=1, item_bid=26801, item_name="亡灵收割者碎片", item_num=30, bind=1, pay_type="guild", price=1500, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[2] = {type=5, id=5002, order=2, item_bid=24802, item_name="水元素碎片", item_num=30, bind=1, pay_type="guild", price=1500, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[3] = {type=5, id=5003, order=3, item_bid=25804, item_name="翼女碎片", item_num=30, bind=1, pay_type="guild", price=1500, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[4] = {type=5, id=5004, order=4, item_bid=27800, item_name="光明牧师碎片", item_num=30, bind=1, pay_type="guild", price=2000, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[5] = {type=5, id=5005, order=5, item_bid=28801, item_name="死亡骑士碎片", item_num=30, bind=1, pay_type="guild", price=2000, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[6] = {type=5, id=5006, order=6, item_bid=24904, item_name="波塞冬碎片", item_num=50, bind=1, pay_type="guild", price=15000, limit_day=0, limit_week=1, limit_month=0, lev=3, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[7] = {type=5, id=5007, order=7, item_bid=25904, item_name="阿波罗碎片", item_num=50, bind=1, pay_type="guild", price=15000, limit_day=0, limit_week=1, limit_month=0, lev=3, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[8] = {type=5, id=5008, order=8, item_bid=26904, item_name="美杜莎碎片", item_num=50, bind=1, pay_type="guild", price=15000, limit_day=0, limit_week=1, limit_month=0, lev=3, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[9] = {type=5, id=5009, order=9, item_bid=29905, item_name="5星随机英雄碎片", item_num=10, bind=1, pay_type="guild", price=2500, limit_day=0, limit_week=1, limit_month=0, lev=4, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[10] = {type=5, id=5010, order=10, item_bid=40114, item_name="灵犀短刃", item_num=1, bind=1, pay_type="guild", price=20000, limit_day=0, limit_week=1, limit_month=0, lev=5, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[11] = {type=5, id=5011, order=11, item_bid=40214, item_name="灵犀护甲", item_num=1, bind=1, pay_type="guild", price=20000, limit_day=0, limit_week=1, limit_month=0, lev=5, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[12] = {type=5, id=5012, order=12, item_bid=40314, item_name="灵犀头盔", item_num=1, bind=1, pay_type="guild", price=20000, limit_day=0, limit_week=1, limit_month=0, lev=5, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[13] = {type=5, id=5013, order=13, item_bid=40414, item_name="灵犀战靴", item_num=1, bind=1, pay_type="guild", price=20000, limit_day=0, limit_week=1, limit_month=0, lev=5, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[14] = {type=5, id=5014, order=14, item_bid=10452, item_name="月亮符文", item_num=1, bind=1, pay_type="guild", price=2500, limit_day=0, limit_week=2, limit_month=0, lev=6, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[15] = {type=5, id=5015, order=15, item_bid=10451, item_name="星辰符文", item_num=1, bind=1, pay_type="guild", price=500, limit_day=0, limit_week=5, limit_month=0, lev=4, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[16] = {type=5, id=5016, order=16, item_bid=10401, item_name="普通召唤卷", item_num=1, bind=1, pay_type="guild", price=50, limit_day=0, limit_week=5, limit_month=0, lev=4, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0}
}
Config.ExchangeData.data_shop_exchage_guild_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_guild[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_guild['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_guild_end---------------------


-- -------------------shop_exchage_league_start-------------------
Config.ExchangeData.data_shop_exchage_league_length = 4
Config.ExchangeData.data_shop_exchage_league = {
	[1] = {type=90, id=90001, order=1, item_bid=26801, item_name="亡灵收割者碎片", item_num=30, bind=1, pay_type="union_coin", price=1500, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[2] = {type=90, id=90002, order=2, item_bid=24802, item_name="水元素碎片", item_num=30, bind=1, pay_type="union_coin", price=1500, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[3] = {type=90, id=90003, order=3, item_bid=25804, item_name="翼女碎片", item_num=30, bind=1, pay_type="union_coin", price=1500, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[4] = {type=90, id=90004, order=4, item_bid=27800, item_name="光明牧师碎片", item_num=30, bind=1, pay_type="union_coin", price=2000, limit_day=0, limit_week=2, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0}
}
Config.ExchangeData.data_shop_exchage_league_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_league[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_league['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_league_end---------------------


-- -------------------shop_exchage_arena_start-------------------
Config.ExchangeData.data_shop_exchage_arena_length = 11
Config.ExchangeData.data_shop_exchage_arena = {
	[1] = {type=6, id=6001, order=1, item_bid=29404, item_name="4星光明英雄碎片", item_num=10, bind=1, pay_type="arena_cent", price=1000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[2] = {type=6, id=6002, order=2, item_bid=29504, item_name="4星黑暗英雄碎片", item_num=10, bind=1, pay_type="arena_cent", price=1000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[3] = {type=6, id=6003, order=3, item_bid=29105, item_name="5星水系英雄碎片", item_num=10, bind=1, pay_type="arena_cent", price=3500, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[4] = {type=6, id=6004, order=4, item_bid=29205, item_name="5星火系英雄碎片", item_num=10, bind=1, pay_type="arena_cent", price=3500, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[5] = {type=6, id=6005, order=5, item_bid=29305, item_name="5星自然英雄碎片", item_num=10, bind=1, pay_type="arena_cent", price=3500, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[6] = {type=6, id=6006, order=6, item_bid=29905, item_name="5星随机英雄碎片", item_num=10, bind=1, pay_type="arena_cent", price=3500, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[7] = {type=6, id=6007, order=7, item_bid=14001, item_name="先知水晶", item_num=1, bind=1, pay_type="arena_cent", price=2000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[8] = {type=6, id=6011, order=8, item_bid=10034, item_name="永恒晶石", item_num=1, bind=1, pay_type="arena_cent", price=1000, limit_vip=0, limit_day=0, limit_week=1, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=1519003689},
	[9] = {type=6, id=6008, order=9, item_bid=14002, item_name="先知精华", item_num=10, bind=1, pay_type="arena_cent", price=250, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[10] = {type=6, id=6009, order=10, item_bid=27903, item_name="雷神碎片", item_num=10, bind=1, pay_type="arena_cent", price=5000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[11] = {type=6, id=6010, order=11, item_bid=28906, item_name="潘多拉碎片", item_num=10, bind=1, pay_type="arena_cent", price=5000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0}
}
Config.ExchangeData.data_shop_exchage_arena_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_arena[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_arena['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_arena_end---------------------


-- -------------------shop_exchage_boss_start-------------------
Config.ExchangeData.data_shop_exchage_boss_length = 0
Config.ExchangeData.data_shop_exchage_boss = {
}
-- -------------------shop_exchage_boss_end---------------------


-- -------------------shop_exchage_friend_start-------------------
Config.ExchangeData.data_shop_exchage_friend_length = 0
Config.ExchangeData.data_shop_exchage_friend = {

}
Config.ExchangeData.data_shop_exchage_friend_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_friend[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_friend['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_friend_end---------------------


-- -------------------shop_exchage_boss_type_start-------------------
Config.ExchangeData.data_shop_exchage_boss_type_length = 0
Config.ExchangeData.data_shop_exchage_boss_type = {

}
-- -------------------shop_exchage_boss_type_end---------------------


-- -------------------shop_star_start-------------------
Config.ExchangeData.data_shop_star_length = 0
Config.ExchangeData.data_shop_star = {
}
-- -------------------shop_star_end---------------------


-- -------------------shop_exchage_ladder_start-------------------
Config.ExchangeData.data_shop_exchage_ladder_length = 11
Config.ExchangeData.data_shop_exchage_ladder = {
	[1] = {type=30, id=30001, order=1, item_bid=27906, item_name="神灵大祭司碎片", item_num=50, bind=1, pay_type="sky_coin", price=50000, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[2] = {type=30, id=30002, order=2, item_bid=28906, item_name="潘多拉碎片", item_num=50, bind=1, pay_type="sky_coin", price=50000, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[3] = {type=30, id=30003, order=3, item_bid=26907, item_name="斯芬克斯碎片", item_num=50, bind=1, pay_type="sky_coin", price=37500, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[4] = {type=30, id=30004, order=4, item_bid=25907, item_name="瓦尔基里碎片", item_num=50, bind=1, pay_type="sky_coin", price=37500, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[5] = {type=30, id=30005, order=5, item_bid=24901, item_name="冰雪女王碎片", item_num=50, bind=1, pay_type="sky_coin", price=37500, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[6] = {type=30, id=30006, order=6, item_bid=40113, item_name="圣光之刃", item_num=1, bind=1, pay_type="sky_coin", price=29000, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[7] = {type=30, id=30007, order=7, item_bid=40213, item_name="圣光护甲", item_num=1, bind=1, pay_type="sky_coin", price=29000, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[8] = {type=30, id=30008, order=8, item_bid=40313, item_name="圣光头盔", item_num=1, bind=1, pay_type="sky_coin", price=29000, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[9] = {type=30, id=30009, order=9, item_bid=40413, item_name="圣光戒指", item_num=1, bind=1, pay_type="sky_coin", price=29000, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[10] = {type=30, id=30010, order=10, item_bid=10450, item_name="符文精华", item_num=500, bind=1, pay_type="sky_coin", price=1250, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[11] = {type=30, id=30011, order=11, item_bid=29, item_name="皮肤碎片", item_num=1, bind=1, pay_type="sky_coin", price=250, limit_day=0, limit_week=10, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
}
-- -------------------shop_exchage_ladder_end---------------------


-- -------------------shop_exchage_seer_start-------------------
Config.ExchangeData.data_shop_exchage_seer_length = 79
Config.ExchangeData.data_shop_exchage_seer = {
	[1] = {type=31, id=31001, order=1, item_bid=24900, item_name="5星娜迦公主碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[2] = {type=31, id=31002, order=2, item_bid=24902, item_name="5星冰霜巨龙碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[3] = {type=31, id=31003, order=3, item_bid=24903, item_name="5星泰坦碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[4] = {type=31, id=31004, order=4, item_bid=24904, item_name="5星波塞冬碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[5] = {type=31, id=31005, order=5, item_bid=24905, item_name="5星派西斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[6] = {type=31, id=31006, order=6, item_bid=24906, item_name="5星少年梅林碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[7] = {type=31, id=31007, order=7, item_bid=24907, item_name="5星海宁芙碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[8] = {type=31, id=31008, order=8, item_bid=24908, item_name="5星阿瑞斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[9] = {type=31, id=31009, order=9, item_bid=24901, item_name="5星冰雪女王碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[10] = {type=31, id=31064, order=10, item_bid=24909, item_name="5星耶梦加得碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[11] = {type=31, id=31069, order=11, item_bid=24910, item_name="5星酒神碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[12] = {type=31, id=31077, order=12, item_bid=24911, item_name="5星利维坦碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[13] = {type=31, id=31010, order=13, item_bid=25900, item_name="5星炽天使碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[14] = {type=31, id=31011, order=14, item_bid=25901, item_name="5星炎魔之王碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[15] = {type=31, id=31012, order=15, item_bid=25902, item_name="5星剑豪卡赞碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[16] = {type=31, id=31013, order=16, item_bid=25903, item_name="5星菲尼克斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[17] = {type=31, id=31014, order=17, item_bid=25904, item_name="5星阿波罗碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[18] = {type=31, id=31015, order=18, item_bid=25905, item_name="5星吸血伯爵碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[19] = {type=31, id=31063, order=19, item_bid=25908, item_name="5星洛基碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[20] = {type=31, id=31016, order=20, item_bid=25906, item_name="5星普罗米修斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[21] = {type=31, id=31017, order=21, item_bid=25907, item_name="瓦尔基里碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[22] = {type=31, id=31071, order=22, item_bid=25909, item_name="哪吒碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[23] = {type=31, id=31074, order=23, item_bid=25910, item_name="海姆达尔碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[24] = {type=31, id=31078, order=24, item_bid=25911, item_name="阿奇丽碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[25] = {type=31, id=31018, order=25, item_bid=26900, item_name="5星奥丁碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[26] = {type=31, id=31019, order=26, item_bid=26901, item_name="5星影刹碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[27] = {type=31, id=31020, order=27, item_bid=26902, item_name="5星凯兰崔尔碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[28] = {type=31, id=31021, order=28, item_bid=26903, item_name="5星魅魔女王碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[29] = {type=31, id=31022, order=29, item_bid=26904, item_name="5星美杜莎碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[30] = {type=31, id=31023, order=30, item_bid=26905, item_name="5星雅典娜碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=20, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[31] = {type=31, id=31024, order=31, item_bid=26906, item_name="5星潘碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[32] = {type=31, id=31025, order=32, item_bid=26907, item_name="斯芬克斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[33] = {type=31, id=31066, order=33, item_bid=26908, item_name="芬尼尔碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[34] = {type=31, id=31068, order=34, item_bid=26909, item_name="拉塔托斯克碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[35] = {type=31, id=31073, order=35, item_bid=26910, item_name="辛西娅碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[36] = {type=31, id=31079, order=36, item_bid=26911, item_name="塞莎特碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[37] = {type=31, id=31026, order=37, item_bid=27900, item_name="4星伊西斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=25, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[38] = {type=31, id=31027, order=38, item_bid=27902, item_name="5星赫拉碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[39] = {type=31, id=31028, order=39, item_bid=27903, item_name="5星雷神碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[40] = {type=31, id=31029, order=40, item_bid=27904, item_name="5星盖亚碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=25, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[41] = {type=31, id=31030, order=41, item_bid=27905, item_name="5星艾蕾莉亚碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[42] = {type=31, id=31031, order=42, item_bid=27906, item_name="5星神灵大祭司碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[43] = {type=31, id=31032, order=43, item_bid=27901, item_name="宙斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[44] = {type=31, id=31065, order=44, item_bid=27907, item_name="拉斐尔碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[45] = {type=31, id=31070, order=45, item_bid=27908, item_name="维纳斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[46] = {type=31, id=31076, order=46, item_bid=27909, item_name="加百列碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[47] = {type=31, id=31033, order=47, item_bid=28900, item_name="4星蛇女墨莎碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=25, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[48] = {type=31, id=31034, order=48, item_bid=28901, item_name="5星哈迪斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[49] = {type=31, id=31035, order=49, item_bid=28902, item_name="5星亚巴顿碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[50] = {type=31, id=31036, order=50, item_bid=28904, item_name="5星阿努比斯碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=35, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[51] = {type=31, id=31037, order=51, item_bid=28905, item_name="5星路西法碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=25, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[52] = {type=31, id=31038, order=52, item_bid=28906, item_name="5星潘多拉碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[53] = {type=31, id=31039, order=53, item_bid=28903, item_name="黑暗之主碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[54] = {type=31, id=31067, order=54, item_bid=28907, item_name="海拉碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[55] = {type=31, id=31072, order=55, item_bid=28908, item_name="尼德霍格碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[56] = {type=31, id=31075, order=56, item_bid=28909, item_name="阿蒙碎片", item_num=50, bind=1, pay_type="recruithigh_hero", price=45, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[57] = {type=31, id=31040, order=57, item_bid=24800, item_name="亚瑟碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[58] = {type=31, id=31041, order=58, item_bid=24801, item_name="竖琴海妖碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[59] = {type=31, id=31042, order=59, item_bid=24802, item_name="水元素碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[60] = {type=31, id=31043, order=60, item_bid=24803, item_name="冰晶女巫碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[61] = {type=31, id=31044, order=61, item_bid=24804, item_name="娜迦侍女碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[62] = {type=31, id=31045, order=62, item_bid=25800, item_name="火枪艾克碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[63] = {type=31, id=31046, order=63, item_bid=25801, item_name="凯瑟琳碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[64] = {type=31, id=31047, order=64, item_bid=25802, item_name="阿伽门农碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[65] = {type=31, id=31048, order=65, item_bid=25803, item_name="雷诺蛮锤碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[66] = {type=31, id=31049, order=66, item_bid=25804, item_name="翼女碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[67] = {type=31, id=31050, order=67, item_bid=26800, item_name="吟游诗人碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[68] = {type=31, id=31051, order=68, item_bid=26801, item_name="亡灵收割者碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[69] = {type=31, id=31052, order=69, item_bid=26802, item_name="圣锤提尔碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[70] = {type=31, id=31053, order=70, item_bid=26803, item_name="甘道夫碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[71] = {type=31, id=31054, order=71, item_bid=26804, item_name="德鲁伊碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=3, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[72] = {type=31, id=31055, order=72, item_bid=27800, item_name="光明牧师碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=5, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[73] = {type=31, id=31056, order=73, item_bid=27801, item_name="月之祭司碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=5, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[74] = {type=31, id=31057, order=74, item_bid=27802, item_name="精灵王子碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=5, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[75] = {type=31, id=31058, order=75, item_bid=27803, item_name="丘比特碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=5, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[76] = {type=31, id=31059, order=76, item_bid=28800, item_name="毒咒女巫碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=5, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[77] = {type=31, id=31060, order=77, item_bid=28801, item_name="死亡骑士碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=5, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[78] = {type=31, id=31061, order=78, item_bid=28802, item_name="阿喀琉斯碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=5, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
	[79] = {type=31, id=31062, order=79, item_bid=28803, item_name="黑精灵密言碎片", item_num=30, bind=1, pay_type="recruithigh_hero", price=5, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0},
}
-- -------------------shop_exchage_seer_end---------------------


-- -------------------shop_exchage_expediton_start-------------------
Config.ExchangeData.data_shop_exchage_expediton_length = 14
Config.ExchangeData.data_shop_exchage_expediton = {
	[1] = {type=8, id=8012, order=1, item_bid=10040, item_name="奥术之尘", item_num=50, bind=1, pay_type="expedition_medal", price=3750, limit_vip=0, limit_day=0, limit_week=1, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[2] = {type=8, id=8001, order=2, item_bid=72002, item_name="神器符石", item_num=5, bind=1, pay_type="expedition_medal", price=1250, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[3] = {type=8, id=8002, order=3, item_bid=72001, item_name="炼神石", item_num=50, bind=1, pay_type="expedition_medal", price=1875, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[4] = {type=8, id=8013, order=4, item_bid=32, item_name="烈阳晶石", item_num=10000, bind=1, pay_type="expedition_medal", price=1000, limit_vip=0, limit_day=0, limit_week=5, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[5] = {type=8, id=8003, order=5, item_bid=29905, item_name="5星英雄碎片", item_num=10, bind=1, pay_type="expedition_medal", price=5000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[6] = {type=8, id=8004, order=6, item_bid=29104, item_name="4星水系碎片", item_num=10, bind=1, pay_type="expedition_medal", price=1000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[7] = {type=8, id=8005, order=7, item_bid=29204, item_name="4星火系碎片", item_num=10, bind=1, pay_type="expedition_medal", price=1000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[8] = {type=8, id=8006, order=8, item_bid=29304, item_name="4星自然碎片", item_num=10, bind=1, pay_type="expedition_medal", price=1000, limit_vip=0, limit_day=0, limit_week=0, limit_month=0, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[9] = {type=8, id=8007, order=9, item_bid=26907, item_name="斯芬克斯碎片", item_num=50, bind=1, pay_type="expedition_medal", price=45000, limit_vip=0, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[10] = {type=8, id=8008, order=10, item_bid=25907, item_name="瓦尔基里碎片", item_num=50, bind=1, pay_type="expedition_medal", price=45000, limit_vip=0, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[11] = {type=8, id=8014, order=11, item_bid=25909, item_name="哪吒碎片", item_num=50, bind=1, pay_type="expedition_medal", price=55000, limit_vip=0, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[12] = {type=8, id=8011, order=12, item_bid=24909, item_name="耶梦加得碎片", item_num=50, bind=1, pay_type="expedition_medal", price=45000, limit_vip=0, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[13] = {type=8, id=8009, order=13, item_bid=27903, item_name="雷神碎片", item_num=50, bind=1, pay_type="expedition_medal", price=55000, limit_vip=0, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
	[14] = {type=8, id=8010, order=14, item_bid=28905, item_name="路西法碎片", item_num=50, bind=1, pay_type="expedition_medal", price=50000, limit_vip=0, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, is_partner=0, icon=0, label=0, discount=0, open_srv_timestamp=0},
}
-- -------------------shop_exchage_expediton_end---------------------


-- -------------------shop_exchage_elite_start-------------------
Config.ExchangeData.data_shop_exchage_elite_length = 10
Config.ExchangeData.data_shop_exchage_elite = {
	[1] = {type=17, id=17001, order=1, item_bid=25908, item_name="洛基碎片", item_num=50, bind=1, pay_type="elite_coin", price=40000, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[2] = {type=17, id=17002, order=2, item_bid=26901, item_name="影刹碎片", item_num=50, bind=1, pay_type="elite_coin", price=37500, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[3] = {type=17, id=17003, order=3, item_bid=24903, item_name="泰坦碎片", item_num=50, bind=1, pay_type="elite_coin", price=37500, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[4] = {type=17, id=17004, order=4, item_bid=27905, item_name="艾蕾莉亚碎片", item_num=50, bind=1, pay_type="elite_coin", price=40000, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[5] = {type=17, id=17005, order=5, item_bid=28902, item_name="亚巴顿碎片", item_num=50, bind=1, pay_type="elite_coin", price=40000, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[6] = {type=17, id=17006, order=6, item_bid=72001, item_name="炼神石", item_num=100, bind=1, pay_type="elite_coin", price=3750, limit_day=1, limit_week=0, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[7] = {type=17, id=17007, order=7, item_bid=10450, item_name="符文精华", item_num=1000, bind=1, pay_type="elite_coin", price=2500, limit_day=0, limit_week=5, limit_month=0, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[8] = {type=17, id=17008, order=8, item_bid=10096, item_name="赋能遗物", item_num=1, bind=1, pay_type="elite_coin", price=5000, limit_day=0, limit_week=0, limit_month=1, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=0},
	[9] = {type=17, id=17009, order=9, item_bid=10460, item_name="觉醒石", item_num=5, bind=1, pay_type="elite_coin", price=12500, limit_day=0, limit_week=1, limit_month=0, lev={160,999}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={{'lv',160}}, arena_elite_lev=0},
	[10] = {type=17, id=17010, order=10, item_bid=10006, item_name="天赋秘典", item_num=10, bind=1, pay_type="elite_coin", price=5000, limit_day=0, limit_week=0, limit_month=4, lev={0,0}, glev=0, is_partner=0, icon=0, label=0, discount=0, role_lev={}, arena_elite_lev=7},
}
-- -------------------shop_exchage_elite_end---------------------


-- -------------------shop_exchage_suit_start-------------------
Config.ExchangeData.data_shop_exchage_suit_length = 14
Config.ExchangeData.data_shop_exchage_suit = {
	[1] = {
		[10030] = {type=28, id=10030, order=999, item_bid=10030, item_name="天界神石", item_num=1, bind=1, pay_type="holy_eqm_coin", price=5, limit_count=0, limit_day=100, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10030, show_star=0, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010101] = {type=28, id=99010101, order=1, item_bid=99010101, item_name="1星勇气耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1010001, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010201] = {type=28, id=99010201, order=2, item_bid=99010201, item_name="2星勇气耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1020001, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010301] = {type=28, id=99010301, order=3, item_bid=99010301, item_name="3星勇气耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1030001, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010401] = {type=28, id=99010401, order=4, item_bid=99010401, item_name="4星勇气耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1040001, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=1, star=0},
		[99010501] = {type=28, id=99010501, order=5, item_bid=99010501, item_name="5星勇气耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1050001, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=1, star=0},
		[99010102] = {type=28, id=99010102, order=1, item_bid=99010102, item_name="1星勇气项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1010002, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010202] = {type=28, id=99010202, order=2, item_bid=99010202, item_name="2星勇气项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1020002, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010302] = {type=28, id=99010302, order=3, item_bid=99010302, item_name="3星勇气项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1030002, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010402] = {type=28, id=99010402, order=4, item_bid=99010402, item_name="4星勇气项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1040002, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=1, star=0},
		[99010502] = {type=28, id=99010502, order=5, item_bid=99010502, item_name="5星勇气项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1050002, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=1, star=0},
		[99010103] = {type=28, id=99010103, order=1, item_bid=99010103, item_name="1星勇气戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1010003, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010203] = {type=28, id=99010203, order=2, item_bid=99010203, item_name="2星勇气戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1020003, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010303] = {type=28, id=99010303, order=3, item_bid=99010303, item_name="3星勇气戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1030003, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010403] = {type=28, id=99010403, order=4, item_bid=99010403, item_name="4星勇气戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1040003, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=1, star=0},
		[99010503] = {type=28, id=99010503, order=5, item_bid=99010503, item_name="5星勇气戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1050003, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=1, star=0},
		[99010104] = {type=28, id=99010104, order=1, item_bid=99010104, item_name="1星勇气手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1010004, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010204] = {type=28, id=99010204, order=2, item_bid=99010204, item_name="2星勇气手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1020004, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010304] = {type=28, id=99010304, order=3, item_bid=99010304, item_name="3星勇气手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1030004, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=1, star=0},
		[99010404] = {type=28, id=99010404, order=4, item_bid=99010404, item_name="4星勇气手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1040004, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=1, star=0},
		[99010504] = {type=28, id=99010504, order=5, item_bid=99010504, item_name="5星勇气手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=1050004, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=1, star=0},
	},
	[2] = {
		[99020101] = {type=28, id=99020101, order=1, item_bid=99020101, item_name="1星狂怒耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2010001, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020201] = {type=28, id=99020201, order=2, item_bid=99020201, item_name="2星狂怒耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2020001, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020301] = {type=28, id=99020301, order=3, item_bid=99020301, item_name="3星狂怒耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2030001, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020401] = {type=28, id=99020401, order=4, item_bid=99020401, item_name="4星狂怒耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2040001, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=2, star=0},
		[99020501] = {type=28, id=99020501, order=5, item_bid=99020501, item_name="5星狂怒耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2050001, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=2, star=0},
		[99020102] = {type=28, id=99020102, order=1, item_bid=99020102, item_name="1星狂怒项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2010002, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020202] = {type=28, id=99020202, order=2, item_bid=99020202, item_name="2星狂怒项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2020002, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020302] = {type=28, id=99020302, order=3, item_bid=99020302, item_name="3星狂怒项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2030002, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020402] = {type=28, id=99020402, order=4, item_bid=99020402, item_name="4星狂怒项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2040002, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=2, star=0},
		[99020502] = {type=28, id=99020502, order=5, item_bid=99020502, item_name="5星狂怒项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2050002, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=2, star=0},
		[99020103] = {type=28, id=99020103, order=1, item_bid=99020103, item_name="1星狂怒戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2010003, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020203] = {type=28, id=99020203, order=2, item_bid=99020203, item_name="2星狂怒戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2020003, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020303] = {type=28, id=99020303, order=3, item_bid=99020303, item_name="3星狂怒戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2030003, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020403] = {type=28, id=99020403, order=4, item_bid=99020403, item_name="4星狂怒戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2040003, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=2, star=0},
		[99020503] = {type=28, id=99020503, order=5, item_bid=99020503, item_name="5星狂怒戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2050003, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=2, star=0},
		[99020104] = {type=28, id=99020104, order=1, item_bid=99020104, item_name="1星狂怒手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2010004, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020204] = {type=28, id=99020204, order=2, item_bid=99020204, item_name="2星狂怒手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2020004, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020304] = {type=28, id=99020304, order=3, item_bid=99020304, item_name="3星狂怒手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2030004, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=2, star=0},
		[99020404] = {type=28, id=99020404, order=4, item_bid=99020404, item_name="4星狂怒手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2040004, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=2, star=0},
		[99020504] = {type=28, id=99020504, order=5, item_bid=99020504, item_name="5星狂怒手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=2050004, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=2, star=0},
	},
	[3] = {
		[99030101] = {type=28, id=99030101, order=1, item_bid=99030101, item_name="1星斗志耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3010001, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030201] = {type=28, id=99030201, order=2, item_bid=99030201, item_name="2星斗志耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3020001, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030301] = {type=28, id=99030301, order=3, item_bid=99030301, item_name="3星斗志耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3030001, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030401] = {type=28, id=99030401, order=4, item_bid=99030401, item_name="4星斗志耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3040001, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=3, star=0},
		[99030501] = {type=28, id=99030501, order=5, item_bid=99030501, item_name="5星斗志耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3050001, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=3, star=0},
		[99030102] = {type=28, id=99030102, order=1, item_bid=99030102, item_name="1星斗志项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3010002, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030202] = {type=28, id=99030202, order=2, item_bid=99030202, item_name="2星斗志项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3020002, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030302] = {type=28, id=99030302, order=3, item_bid=99030302, item_name="3星斗志项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3030002, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030402] = {type=28, id=99030402, order=4, item_bid=99030402, item_name="4星斗志项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3040002, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=3, star=0},
		[99030502] = {type=28, id=99030502, order=5, item_bid=99030502, item_name="5星斗志项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3050002, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=3, star=0},
		[99030103] = {type=28, id=99030103, order=1, item_bid=99030103, item_name="1星斗志戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3010003, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030203] = {type=28, id=99030203, order=2, item_bid=99030203, item_name="2星斗志戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3020003, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030303] = {type=28, id=99030303, order=3, item_bid=99030303, item_name="3星斗志戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3030003, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030403] = {type=28, id=99030403, order=4, item_bid=99030403, item_name="4星斗志戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3040003, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=3, star=0},
		[99030503] = {type=28, id=99030503, order=5, item_bid=99030503, item_name="5星斗志戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3050003, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=3, star=0},
		[99030104] = {type=28, id=99030104, order=1, item_bid=99030104, item_name="1星斗志手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3010004, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030204] = {type=28, id=99030204, order=2, item_bid=99030204, item_name="2星斗志手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3020004, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030304] = {type=28, id=99030304, order=3, item_bid=99030304, item_name="3星斗志手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3030004, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=3, star=0},
		[99030404] = {type=28, id=99030404, order=4, item_bid=99030404, item_name="4星斗志手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3040004, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=3, star=0},
		[99030504] = {type=28, id=99030504, order=5, item_bid=99030504, item_name="5星斗志手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=3050004, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=3, star=0},
	},
	[4] = {
		[99040101] = {type=28, id=99040101, order=1, item_bid=99040101, item_name="1星灵咏耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4010001, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040201] = {type=28, id=99040201, order=2, item_bid=99040201, item_name="2星灵咏耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4020001, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040301] = {type=28, id=99040301, order=3, item_bid=99040301, item_name="3星灵咏耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4030001, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040401] = {type=28, id=99040401, order=4, item_bid=99040401, item_name="4星灵咏耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4040001, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=4, star=0},
		[99040501] = {type=28, id=99040501, order=5, item_bid=99040501, item_name="5星灵咏耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4050001, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=4, star=0},
		[99040102] = {type=28, id=99040102, order=1, item_bid=99040102, item_name="1星灵咏项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4010002, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040202] = {type=28, id=99040202, order=2, item_bid=99040202, item_name="2星灵咏项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4020002, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040302] = {type=28, id=99040302, order=3, item_bid=99040302, item_name="3星灵咏项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4030002, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040402] = {type=28, id=99040402, order=4, item_bid=99040402, item_name="4星灵咏项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4040002, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=4, star=0},
		[99040502] = {type=28, id=99040502, order=5, item_bid=99040502, item_name="5星灵咏项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4050002, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=4, star=0},
		[99040103] = {type=28, id=99040103, order=1, item_bid=99040103, item_name="1星灵咏戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4010003, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040203] = {type=28, id=99040203, order=2, item_bid=99040203, item_name="2星灵咏戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4020003, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040303] = {type=28, id=99040303, order=3, item_bid=99040303, item_name="3星灵咏戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4030003, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040403] = {type=28, id=99040403, order=4, item_bid=99040403, item_name="4星灵咏戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4040003, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=4, star=0},
		[99040503] = {type=28, id=99040503, order=5, item_bid=99040503, item_name="5星灵咏戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4050003, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=4, star=0},
		[99040104] = {type=28, id=99040104, order=1, item_bid=99040104, item_name="1星灵咏手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=40, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4010004, show_star=1, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040204] = {type=28, id=99040204, order=2, item_bid=99040204, item_name="2星灵咏手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=70, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4020004, show_star=2, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040304] = {type=28, id=99040304, order=3, item_bid=99040304, item_name="3星灵咏手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4030004, show_star=3, buy_condit=0, show_condit=0, pass_name="", label=0, discount=0, tag=4, star=0},
		[99040404] = {type=28, id=99040404, order=4, item_bid=99040404, item_name="4星灵咏手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=160, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4040004, show_star=4, buy_condit=15000, show_condit=7500, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=4, star=0},
		[99040504] = {type=28, id=99040504, order=5, item_bid=99040504, item_name="5星灵咏手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=4050004, show_star=5, buy_condit=24000, show_condit=19500, pass_name="战力前五英雄神装\n总评分达24000", label=0, discount=0, tag=4, star=0},
	},
	[5] = {
		[99050101] = {type=28, id=99050101, order=1, item_bid=99050101, item_name="1星穿甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5010001, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050201] = {type=28, id=99050201, order=2, item_bid=99050201, item_name="2星穿甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5020001, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050301] = {type=28, id=99050301, order=3, item_bid=99050301, item_name="3星穿甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5030001, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050401] = {type=28, id=99050401, order=4, item_bid=99050401, item_name="4星穿甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5040001, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=5, star=0},
		[99050501] = {type=28, id=99050501, order=5, item_bid=99050501, item_name="5星穿甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5050001, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=5, star=0},
		[99050102] = {type=28, id=99050102, order=1, item_bid=99050102, item_name="1星穿甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5010002, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050202] = {type=28, id=99050202, order=2, item_bid=99050202, item_name="2星穿甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5020002, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050302] = {type=28, id=99050302, order=3, item_bid=99050302, item_name="3星穿甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5030002, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050402] = {type=28, id=99050402, order=4, item_bid=99050402, item_name="4星穿甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5040002, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=5, star=0},
		[99050502] = {type=28, id=99050502, order=5, item_bid=99050502, item_name="5星穿甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5050002, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=5, star=0},
		[99050103] = {type=28, id=99050103, order=1, item_bid=99050103, item_name="1星穿甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5010003, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050203] = {type=28, id=99050203, order=2, item_bid=99050203, item_name="2星穿甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5020003, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050303] = {type=28, id=99050303, order=3, item_bid=99050303, item_name="3星穿甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5030003, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050403] = {type=28, id=99050403, order=4, item_bid=99050403, item_name="4星穿甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5040003, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=5, star=0},
		[99050503] = {type=28, id=99050503, order=5, item_bid=99050503, item_name="5星穿甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5050003, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=5, star=0},
		[99050104] = {type=28, id=99050104, order=1, item_bid=99050104, item_name="1星穿甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5010004, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050204] = {type=28, id=99050204, order=2, item_bid=99050204, item_name="2星穿甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5020004, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050304] = {type=28, id=99050304, order=3, item_bid=99050304, item_name="3星穿甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5030004, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=5, star=0},
		[99050404] = {type=28, id=99050404, order=4, item_bid=99050404, item_name="4星穿甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5040004, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=5, star=0},
		[99050504] = {type=28, id=99050504, order=5, item_bid=99050504, item_name="5星穿甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=5050004, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=5, star=0},
	},
	[6] = {
		[99060101] = {type=28, id=99060101, order=1, item_bid=99060101, item_name="1星破法耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6010001, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060201] = {type=28, id=99060201, order=2, item_bid=99060201, item_name="2星破法耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6020001, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060301] = {type=28, id=99060301, order=3, item_bid=99060301, item_name="3星破法耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6030001, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060401] = {type=28, id=99060401, order=4, item_bid=99060401, item_name="4星破法耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6040001, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=6, star=0},
		[99060501] = {type=28, id=99060501, order=5, item_bid=99060501, item_name="5星破法耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6050001, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=6, star=0},
		[99060102] = {type=28, id=99060102, order=1, item_bid=99060102, item_name="1星破法项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6010002, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060202] = {type=28, id=99060202, order=2, item_bid=99060202, item_name="2星破法项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6020002, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060302] = {type=28, id=99060302, order=3, item_bid=99060302, item_name="3星破法项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6030002, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060402] = {type=28, id=99060402, order=4, item_bid=99060402, item_name="4星破法项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6040002, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=6, star=0},
		[99060502] = {type=28, id=99060502, order=5, item_bid=99060502, item_name="5星破法项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6050002, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=6, star=0},
		[99060103] = {type=28, id=99060103, order=1, item_bid=99060103, item_name="1星破法戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6010003, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060203] = {type=28, id=99060203, order=2, item_bid=99060203, item_name="2星破法戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6020003, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060303] = {type=28, id=99060303, order=3, item_bid=99060303, item_name="3星破法戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6030003, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060403] = {type=28, id=99060403, order=4, item_bid=99060403, item_name="4星破法戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6040003, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=6, star=0},
		[99060503] = {type=28, id=99060503, order=5, item_bid=99060503, item_name="5星破法戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6050003, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=6, star=0},
		[99060104] = {type=28, id=99060104, order=1, item_bid=99060104, item_name="1星破法手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6010004, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060204] = {type=28, id=99060204, order=2, item_bid=99060204, item_name="2星破法手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6020004, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060304] = {type=28, id=99060304, order=3, item_bid=99060304, item_name="3星破法手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6030004, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=6, star=0},
		[99060404] = {type=28, id=99060404, order=4, item_bid=99060404, item_name="4星破法手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6040004, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=6, star=0},
		[99060504] = {type=28, id=99060504, order=5, item_bid=99060504, item_name="5星破法手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=6050004, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=6, star=0},
	},
	[7] = {
		[99070101] = {type=28, id=99070101, order=1, item_bid=99070101, item_name="1星斗战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7010001, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070201] = {type=28, id=99070201, order=2, item_bid=99070201, item_name="2星斗战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7020001, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070301] = {type=28, id=99070301, order=3, item_bid=99070301, item_name="3星斗战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7030001, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070401] = {type=28, id=99070401, order=4, item_bid=99070401, item_name="4星斗战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7040001, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=7, star=0},
		[99070501] = {type=28, id=99070501, order=5, item_bid=99070501, item_name="5星斗战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7050001, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=7, star=0},
		[99070102] = {type=28, id=99070102, order=1, item_bid=99070102, item_name="1星斗战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7010002, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070202] = {type=28, id=99070202, order=2, item_bid=99070202, item_name="2星斗战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7020002, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070302] = {type=28, id=99070302, order=3, item_bid=99070302, item_name="3星斗战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7030002, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070402] = {type=28, id=99070402, order=4, item_bid=99070402, item_name="4星斗战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7040002, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=7, star=0},
		[99070502] = {type=28, id=99070502, order=5, item_bid=99070502, item_name="5星斗战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7050002, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=7, star=0},
		[99070103] = {type=28, id=99070103, order=1, item_bid=99070103, item_name="1星斗战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7010003, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070203] = {type=28, id=99070203, order=2, item_bid=99070203, item_name="2星斗战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7020003, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070303] = {type=28, id=99070303, order=3, item_bid=99070303, item_name="3星斗战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7030003, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070403] = {type=28, id=99070403, order=4, item_bid=99070403, item_name="4星斗战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7040003, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=7, star=0},
		[99070503] = {type=28, id=99070503, order=5, item_bid=99070503, item_name="5星斗战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7050003, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=7, star=0},
		[99070104] = {type=28, id=99070104, order=1, item_bid=99070104, item_name="1星斗战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7010004, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070204] = {type=28, id=99070204, order=2, item_bid=99070204, item_name="2星斗战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7020004, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070304] = {type=28, id=99070304, order=3, item_bid=99070304, item_name="3星斗战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7030004, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=7, star=0},
		[99070404] = {type=28, id=99070404, order=4, item_bid=99070404, item_name="4星斗战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7040004, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=7, star=0},
		[99070504] = {type=28, id=99070504, order=5, item_bid=99070504, item_name="5星斗战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=7050004, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=7, star=0},
	},
	[8] = {
		[99080101] = {type=28, id=99080101, order=1, item_bid=99080101, item_name="1星镇灵耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8010001, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080201] = {type=28, id=99080201, order=2, item_bid=99080201, item_name="2星镇灵耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8020001, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080301] = {type=28, id=99080301, order=3, item_bid=99080301, item_name="3星镇灵耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8030001, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080401] = {type=28, id=99080401, order=4, item_bid=99080401, item_name="4星镇灵耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8040001, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=8, star=0},
		[99080501] = {type=28, id=99080501, order=5, item_bid=99080501, item_name="5星镇灵耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8050001, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=8, star=0},
		[99080102] = {type=28, id=99080102, order=1, item_bid=99080102, item_name="1星镇灵项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8010002, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080202] = {type=28, id=99080202, order=2, item_bid=99080202, item_name="2星镇灵项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8020002, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080302] = {type=28, id=99080302, order=3, item_bid=99080302, item_name="3星镇灵项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8030002, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080402] = {type=28, id=99080402, order=4, item_bid=99080402, item_name="4星镇灵项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8040002, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=8, star=0},
		[99080502] = {type=28, id=99080502, order=5, item_bid=99080502, item_name="5星镇灵项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8050002, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=8, star=0},
		[99080103] = {type=28, id=99080103, order=1, item_bid=99080103, item_name="1星镇灵戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8010003, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080203] = {type=28, id=99080203, order=2, item_bid=99080203, item_name="2星镇灵戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8020003, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080303] = {type=28, id=99080303, order=3, item_bid=99080303, item_name="3星镇灵戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8030003, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080403] = {type=28, id=99080403, order=4, item_bid=99080403, item_name="4星镇灵戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8040003, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=8, star=0},
		[99080503] = {type=28, id=99080503, order=5, item_bid=99080503, item_name="5星镇灵戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8050003, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=8, star=0},
		[99080104] = {type=28, id=99080104, order=1, item_bid=99080104, item_name="1星镇灵手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=50, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8010004, show_star=1, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080204] = {type=28, id=99080204, order=2, item_bid=99080204, item_name="2星镇灵手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=90, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8020004, show_star=2, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080304] = {type=28, id=99080304, order=3, item_bid=99080304, item_name="3星镇灵手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=130, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8030004, show_star=3, buy_condit=15000, show_condit=15000, pass_name="战力前五英雄神装\n总评分达15000", label=0, discount=0, tag=8, star=0},
		[99080404] = {type=28, id=99080404, order=4, item_bid=99080404, item_name="4星镇灵手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=200, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8040004, show_star=4, buy_condit=18000, show_condit=16500, pass_name="战力前五英雄神装\n总评分达18000", label=0, discount=0, tag=8, star=0},
		[99080504] = {type=28, id=99080504, order=5, item_bid=99080504, item_name="5星镇灵手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=290, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=8050004, show_star=5, buy_condit=27000, show_condit=22500, pass_name="战力前五英雄神装\n总评分达27000", label=0, discount=0, tag=8, star=0},
	},
	[9] = {
		[99090101] = {type=28, id=99090101, order=1, item_bid=99090101, item_name="1星魔甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9010001, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090201] = {type=28, id=99090201, order=2, item_bid=99090201, item_name="2星魔甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9020001, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090301] = {type=28, id=99090301, order=3, item_bid=99090301, item_name="3星魔甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9030001, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090401] = {type=28, id=99090401, order=4, item_bid=99090401, item_name="4星魔甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9040001, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090501] = {type=28, id=99090501, order=5, item_bid=99090501, item_name="5星魔甲耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9050001, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=9, star=0},
		[99090102] = {type=28, id=99090102, order=1, item_bid=99090102, item_name="1星魔甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9010002, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090202] = {type=28, id=99090202, order=2, item_bid=99090202, item_name="2星魔甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9020002, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090302] = {type=28, id=99090302, order=3, item_bid=99090302, item_name="3星魔甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9030002, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090402] = {type=28, id=99090402, order=4, item_bid=99090402, item_name="4星魔甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9040002, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090502] = {type=28, id=99090502, order=5, item_bid=99090502, item_name="5星魔甲项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9050002, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=9, star=0},
		[99090103] = {type=28, id=99090103, order=1, item_bid=99090103, item_name="1星魔甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9010003, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090203] = {type=28, id=99090203, order=2, item_bid=99090203, item_name="2星魔甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9020003, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090303] = {type=28, id=99090303, order=3, item_bid=99090303, item_name="3星魔甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9030003, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090403] = {type=28, id=99090403, order=4, item_bid=99090403, item_name="4星魔甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9040003, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090503] = {type=28, id=99090503, order=5, item_bid=99090503, item_name="5星魔甲戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9050003, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=9, star=0},
		[99090104] = {type=28, id=99090104, order=1, item_bid=99090104, item_name="1星魔甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9010004, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090204] = {type=28, id=99090204, order=2, item_bid=99090204, item_name="2星魔甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9020004, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090304] = {type=28, id=99090304, order=3, item_bid=99090304, item_name="3星魔甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9030004, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090404] = {type=28, id=99090404, order=4, item_bid=99090404, item_name="4星魔甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9040004, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=9, star=0},
		[99090504] = {type=28, id=99090504, order=5, item_bid=99090504, item_name="5星魔甲手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=9050004, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=9, star=0},
	},
	[10] = {
		[99100101] = {type=28, id=99100101, order=1, item_bid=99100101, item_name="1星神战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10010001, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100201] = {type=28, id=99100201, order=2, item_bid=99100201, item_name="2星神战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10020001, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100301] = {type=28, id=99100301, order=3, item_bid=99100301, item_name="3星神战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10030001, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100401] = {type=28, id=99100401, order=4, item_bid=99100401, item_name="4星神战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10040001, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100501] = {type=28, id=99100501, order=5, item_bid=99100501, item_name="5星神战耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10050001, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=10, star=0},
		[99100102] = {type=28, id=99100102, order=1, item_bid=99100102, item_name="1星神战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10010002, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100202] = {type=28, id=99100202, order=2, item_bid=99100202, item_name="2星神战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10020002, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100302] = {type=28, id=99100302, order=3, item_bid=99100302, item_name="3星神战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10030002, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100402] = {type=28, id=99100402, order=4, item_bid=99100402, item_name="4星神战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10040002, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100502] = {type=28, id=99100502, order=5, item_bid=99100502, item_name="5星神战项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10050002, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=10, star=0},
		[99100103] = {type=28, id=99100103, order=1, item_bid=99100103, item_name="1星神战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10010003, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100203] = {type=28, id=99100203, order=2, item_bid=99100203, item_name="2星神战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10020003, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100303] = {type=28, id=99100303, order=3, item_bid=99100303, item_name="3星神战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10030003, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100403] = {type=28, id=99100403, order=4, item_bid=99100403, item_name="4星神战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10040003, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100503] = {type=28, id=99100503, order=5, item_bid=99100503, item_name="5星神战戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10050003, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=10, star=0},
		[99100104] = {type=28, id=99100104, order=1, item_bid=99100104, item_name="1星神战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10010004, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100204] = {type=28, id=99100204, order=2, item_bid=99100204, item_name="2星神战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10020004, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100304] = {type=28, id=99100304, order=3, item_bid=99100304, item_name="3星神战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10030004, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100404] = {type=28, id=99100404, order=4, item_bid=99100404, item_name="4星神战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10040004, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=10, star=0},
		[99100504] = {type=28, id=99100504, order=5, item_bid=99100504, item_name="5星神战手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=10050004, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=10, star=0},
	},
	[11] = {
		[99110101] = {type=28, id=99110101, order=1, item_bid=99110101, item_name="1星龙威耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11010001, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110201] = {type=28, id=99110201, order=2, item_bid=99110201, item_name="2星龙威耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11020001, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110301] = {type=28, id=99110301, order=3, item_bid=99110301, item_name="3星龙威耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11030001, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110401] = {type=28, id=99110401, order=4, item_bid=99110401, item_name="4星龙威耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11040001, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110501] = {type=28, id=99110501, order=5, item_bid=99110501, item_name="5星龙威耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11050001, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=11, star=0},
		[99110102] = {type=28, id=99110102, order=1, item_bid=99110102, item_name="1星龙威项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11010002, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110202] = {type=28, id=99110202, order=2, item_bid=99110202, item_name="2星龙威项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11020002, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110302] = {type=28, id=99110302, order=3, item_bid=99110302, item_name="3星龙威项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11030002, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110402] = {type=28, id=99110402, order=4, item_bid=99110402, item_name="4星龙威项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11040002, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110502] = {type=28, id=99110502, order=5, item_bid=99110502, item_name="5星龙威项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11050002, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=11, star=0},
		[99110103] = {type=28, id=99110103, order=1, item_bid=99110103, item_name="1星龙威戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11010003, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110203] = {type=28, id=99110203, order=2, item_bid=99110203, item_name="2星龙威戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11020003, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110303] = {type=28, id=99110303, order=3, item_bid=99110303, item_name="3星龙威戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11030003, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110403] = {type=28, id=99110403, order=4, item_bid=99110403, item_name="4星龙威戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11040003, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110503] = {type=28, id=99110503, order=5, item_bid=99110503, item_name="5星龙威戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11050003, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=11, star=0},
		[99110104] = {type=28, id=99110104, order=1, item_bid=99110104, item_name="1星龙威手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11010004, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110204] = {type=28, id=99110204, order=2, item_bid=99110204, item_name="2星龙威手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11020004, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110304] = {type=28, id=99110304, order=3, item_bid=99110304, item_name="3星龙威手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11030004, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110404] = {type=28, id=99110404, order=4, item_bid=99110404, item_name="4星龙威手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11040004, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=11, star=0},
		[99110504] = {type=28, id=99110504, order=5, item_bid=99110504, item_name="5星龙威手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=11050004, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=11, star=0},
	},
	[12] = {
		[99120101] = {type=28, id=99120101, order=1, item_bid=99120101, item_name="1星神愈耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12010001, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120201] = {type=28, id=99120201, order=2, item_bid=99120201, item_name="2星神愈耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12020001, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120301] = {type=28, id=99120301, order=3, item_bid=99120301, item_name="3星神愈耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12030001, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120401] = {type=28, id=99120401, order=4, item_bid=99120401, item_name="4星神愈耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12040001, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120501] = {type=28, id=99120501, order=5, item_bid=99120501, item_name="5星神愈耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12050001, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=12, star=0},
		[99120102] = {type=28, id=99120102, order=1, item_bid=99120102, item_name="1星神愈项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12010002, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120202] = {type=28, id=99120202, order=2, item_bid=99120202, item_name="2星神愈项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12020002, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120302] = {type=28, id=99120302, order=3, item_bid=99120302, item_name="3星神愈项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12030002, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120402] = {type=28, id=99120402, order=4, item_bid=99120402, item_name="4星神愈项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12040002, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120502] = {type=28, id=99120502, order=5, item_bid=99120502, item_name="5星神愈项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12050002, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=12, star=0},
		[99120103] = {type=28, id=99120103, order=1, item_bid=99120103, item_name="1星神愈戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12010003, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120203] = {type=28, id=99120203, order=2, item_bid=99120203, item_name="2星神愈戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12020003, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120303] = {type=28, id=99120303, order=3, item_bid=99120303, item_name="3星神愈戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12030003, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120403] = {type=28, id=99120403, order=4, item_bid=99120403, item_name="4星神愈戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12040003, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120503] = {type=28, id=99120503, order=5, item_bid=99120503, item_name="5星神愈戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12050003, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=12, star=0},
		[99120104] = {type=28, id=99120104, order=1, item_bid=99120104, item_name="1星神愈手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12010004, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120204] = {type=28, id=99120204, order=2, item_bid=99120204, item_name="2星神愈手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12020004, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120304] = {type=28, id=99120304, order=3, item_bid=99120304, item_name="3星神愈手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12030004, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120404] = {type=28, id=99120404, order=4, item_bid=99120404, item_name="4星神愈手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12040004, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=12, star=0},
		[99120504] = {type=28, id=99120504, order=5, item_bid=99120504, item_name="5星神愈手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=12050004, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=12, star=0},
	},
	[13] = {
		[99130101] = {type=28, id=99130101, order=1, item_bid=99130101, item_name="1星极速耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13010001, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130201] = {type=28, id=99130201, order=2, item_bid=99130201, item_name="2星极速耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13020001, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130301] = {type=28, id=99130301, order=3, item_bid=99130301, item_name="3星极速耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13030001, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130401] = {type=28, id=99130401, order=4, item_bid=99130401, item_name="4星极速耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13040001, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130501] = {type=28, id=99130501, order=5, item_bid=99130501, item_name="5星极速耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13050001, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=13, star=0},
		[99130102] = {type=28, id=99130102, order=1, item_bid=99130102, item_name="1星极速项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13010002, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130202] = {type=28, id=99130202, order=2, item_bid=99130202, item_name="2星极速项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13020002, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130302] = {type=28, id=99130302, order=3, item_bid=99130302, item_name="3星极速项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13030002, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130402] = {type=28, id=99130402, order=4, item_bid=99130402, item_name="4星极速项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13040002, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130502] = {type=28, id=99130502, order=5, item_bid=99130502, item_name="5星极速项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13050002, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=13, star=0},
		[99130103] = {type=28, id=99130103, order=1, item_bid=99130103, item_name="1星极速戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13010003, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130203] = {type=28, id=99130203, order=2, item_bid=99130203, item_name="2星极速戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13020003, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130303] = {type=28, id=99130303, order=3, item_bid=99130303, item_name="3星极速戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13030003, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130403] = {type=28, id=99130403, order=4, item_bid=99130403, item_name="4星极速戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13040003, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130503] = {type=28, id=99130503, order=5, item_bid=99130503, item_name="5星极速戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13050003, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=13, star=0},
		[99130104] = {type=28, id=99130104, order=1, item_bid=99130104, item_name="1星极速手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13010004, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130204] = {type=28, id=99130204, order=2, item_bid=99130204, item_name="2星极速手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13020004, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130304] = {type=28, id=99130304, order=3, item_bid=99130304, item_name="3星极速手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13030004, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130404] = {type=28, id=99130404, order=4, item_bid=99130404, item_name="4星极速手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13040004, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=13, star=0},
		[99130504] = {type=28, id=99130504, order=5, item_bid=99130504, item_name="5星极速手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=13050004, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=13, star=0},
	},
	[14] = {
		[99140101] = {type=28, id=99140101, order=1, item_bid=99140101, item_name="1星玄护耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14010001, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140201] = {type=28, id=99140201, order=2, item_bid=99140201, item_name="2星玄护耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14020001, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140301] = {type=28, id=99140301, order=3, item_bid=99140301, item_name="3星玄护耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14030001, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140401] = {type=28, id=99140401, order=4, item_bid=99140401, item_name="4星玄护耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14040001, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140501] = {type=28, id=99140501, order=5, item_bid=99140501, item_name="5星玄护耳环", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14050001, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=14, star=0},
		[99140102] = {type=28, id=99140102, order=1, item_bid=99140102, item_name="1星玄护项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14010002, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140202] = {type=28, id=99140202, order=2, item_bid=99140202, item_name="2星玄护项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14020002, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140302] = {type=28, id=99140302, order=3, item_bid=99140302, item_name="3星玄护项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14030002, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140402] = {type=28, id=99140402, order=4, item_bid=99140402, item_name="4星玄护项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14040002, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140502] = {type=28, id=99140502, order=5, item_bid=99140502, item_name="5星玄护项链", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14050002, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=14, star=0},
		[99140103] = {type=28, id=99140103, order=1, item_bid=99140103, item_name="1星玄护戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14010003, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140203] = {type=28, id=99140203, order=2, item_bid=99140203, item_name="2星玄护戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14020003, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140303] = {type=28, id=99140303, order=3, item_bid=99140303, item_name="3星玄护戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14030003, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140403] = {type=28, id=99140403, order=4, item_bid=99140403, item_name="4星玄护戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14040003, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140503] = {type=28, id=99140503, order=5, item_bid=99140503, item_name="5星玄护戒指", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14050003, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=14, star=0},
		[99140104] = {type=28, id=99140104, order=1, item_bid=99140104, item_name="1星玄护手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=60, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14010004, show_star=1, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140204] = {type=28, id=99140204, order=2, item_bid=99140204, item_name="2星玄护手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=110, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14020004, show_star=2, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140304] = {type=28, id=99140304, order=3, item_bid=99140304, item_name="3星玄护手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=170, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14030004, show_star=3, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140404] = {type=28, id=99140404, order=4, item_bid=99140404, item_name="4星玄护手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=240, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14040004, show_star=4, buy_condit=20000, show_condit=20000, pass_name="战力前五英雄神装\n总评分达20000", label=0, discount=0, tag=14, star=0},
		[99140504] = {type=28, id=99140504, order=5, item_bid=99140504, item_name="5星玄护手镯", item_num=1, bind=1, pay_type="holy_eqm_coin", price=360, limit_count=0, limit_day=0, limit_week=0, limit_month=0, lev=105, is_partner=0, icon=14050004, show_star=5, buy_condit=30000, show_condit=25000, pass_name="战力前五英雄神装\n总评分达30000", label=0, discount=0, tag=14, star=0},
	},
}
-- -------------------shop_exchage_suit_end---------------------


-- -------------------shop_exchage_furniture_start-------------------
Config.ExchangeData.data_shop_exchage_furniture_length = 32
Config.ExchangeData.data_shop_exchage_furniture = {
	[1] = {type=41, id=41001, order=1, item_bid=200102, item_name="芬芳花瓶", item_type=4, item_desc="舒适度+30", item_num=1, pay_type="home_coin", price=1500, limit_day=0, limit_week=0, limit_month=0},
	[2] = {type=41, id=41002, order=2, item_bid=200103, item_name="舒适木凳", item_type=4, item_desc="舒适度+30", item_num=1, pay_type="home_coin", price=1500, limit_day=0, limit_week=0, limit_month=0},
	[3] = {type=41, id=41003, order=3, item_bid=200104, item_name="花布小圆桌", item_type=4, item_desc="舒适度+30", item_num=1, pay_type="home_coin", price=1500, limit_day=0, limit_week=0, limit_month=0},
	[4] = {type=41, id=41004, order=4, item_bid=200151, item_name="温馨小屋地板", item_type=2, item_desc="舒适度+100", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[5] = {type=41, id=41005, order=5, item_bid=200152, item_name="温馨小屋墙壁", item_type=1, item_desc="舒适度+100", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[6] = {type=41, id=41006, order=6, item_bid=200101, item_name="小挂画", item_type=3, item_desc="舒适度+60", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[7] = {type=41, id=41007, order=7, item_bid=200105, item_name="舒适单人沙发", item_type=4, item_desc="舒适度+60", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[8] = {type=41, id=41008, order=8, item_bid=200106, item_name="木制书架", item_type=4, item_desc="舒适度+80", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[9] = {type=41, id=41009, order=9, item_bid=200107, item_name="木制床头柜", item_type=4, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[10] = {type=41, id=41010, order=10, item_bid=200108, item_name="木制挂钟", item_type=3, item_desc="舒适度+120", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[11] = {type=41, id=41011, order=11, item_bid=200204, item_name="皇室钢琴椅", item_type=4, item_desc="舒适度+35", item_num=1, pay_type="home_coin", price=1500, limit_day=0, limit_week=0, limit_month=0},
	[12] = {type=41, id=41012, order=12, item_bid=200208, item_name="皇室壁灯", item_type=3, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[13] = {type=41, id=41013, order=13, item_bid=200209, item_name="黄金圆镜", item_type=3, item_desc="舒适度+90", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[14] = {type=41, id=41014, order=14, item_bid=200201, item_name="皇室茶桌", item_type=4, item_desc="舒适度+60", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[15] = {type=41, id=41015, order=15, item_bid=200202, item_name="皇室挂画", item_type=3, item_desc="舒适度+90", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[16] = {type=41, id=41016, order=16, item_bid=200203, item_name="红酒小圆桌", item_type=4, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[17] = {type=41, id=41017, order=17, item_bid=200205, item_name="皇室尊贵沙发", item_type=4, item_desc="舒适度+60", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[18] = {type=41, id=41018, order=18, item_bid=200251, item_name="皇室贵族地板", item_type=2, item_desc="舒适度+120", item_num=1, pay_type="home_coin", price=5000, limit_day=0, limit_week=0, limit_month=0},
	[19] = {type=41, id=41019, order=19, item_bid=200252, item_name="皇室贵族墙壁", item_type=1, item_desc="舒适度+120", item_num=1, pay_type="home_coin", price=5000, limit_day=0, limit_week=0, limit_month=0},
	[20] = {type=41, id=41020, order=20, item_bid=200301, item_name="翠绿星座骰子", item_type=4, item_desc="舒适度+35", item_num=1, pay_type="home_coin", price=1500, limit_day=0, limit_week=0, limit_month=0},
	[21] = {type=41, id=41021, order=21, item_bid=200302, item_name="深紫星座骰子", item_type=4, item_desc="舒适度+35", item_num=1, pay_type="home_coin", price=1500, limit_day=0, limit_week=0, limit_month=0},
	[22] = {type=41, id=41022, order=22, item_bid=200303, item_name="湛蓝星座骰子", item_type=4, item_desc="舒适度+35", item_num=1, pay_type="home_coin", price=1500, limit_day=0, limit_week=0, limit_month=0},
	[23] = {type=41, id=41023, order=23, item_bid=200309, item_name="星月屏风", item_type=4, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[24] = {type=41, id=41024, order=24, item_bid=200304, item_name="占星师靠椅", item_type=4, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[25] = {type=41, id=41025, order=25, item_bid=200305, item_name="占星师小圆桌", item_type=4, item_desc="舒适度+90", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[26] = {type=41, id=41026, order=26, item_bid=200351, item_name="占星密室地板", item_type=2, item_desc="舒适度+120", item_num=1, pay_type="home_coin", price=5000, limit_day=0, limit_week=0, limit_month=0},
	[27] = {type=41, id=41027, order=27, item_bid=200352, item_name="占星密室墙壁", item_type=1, item_desc="舒适度+120", item_num=1, pay_type="home_coin", price=5000, limit_day=0, limit_week=0, limit_month=0},
	[28] = {type=41, id=41028, order=28, item_bid=200110, item_name="绒毛圆毯", item_type=5, item_desc="舒适度+340", item_num=1, pay_type="home_coin", price=8000, limit_day=0, limit_week=0, limit_month=0},
	[29] = {type=41, id=41029, order=29, item_bid=200410, item_name="心意绵绵纸鹤", item_type=4, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[30] = {type=41, id=41030, order=30, item_bid=200412, item_name="浓情七夕圆凳", item_type=4, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[31] = {type=41, id=41031, order=31, item_bid=200503, item_name="逝者墓碑", item_type=4, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0},
	[32] = {type=41, id=41032, order=32, item_bid=200504, item_name="鬼面树干", item_type=4, item_desc="舒适度+40", item_num=1, pay_type="home_coin", price=3000, limit_day=0, limit_week=0, limit_month=0}
}
Config.ExchangeData.data_shop_exchage_furniture_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_furniture[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_furniture['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_furniture_end---------------------


-- -------------------shop_exchage_pet_start-------------------
Config.ExchangeData.data_shop_exchage_pet_length = 18
Config.ExchangeData.data_shop_exchage_pet = {
	[1] = {type=42, id=42101, order=1, item_bid=100101, item_name="压缩饼干", item_type=1, item_desc="适合短途旅行", item_num=1, pay_type="home_coin", price=200, limit_soft=200, limit_day=0, limit_week=0, limit_month=0},
	[2] = {type=42, id=42102, order=2, item_bid=100102, item_name="饭团", item_type=1, item_desc="适合短途旅行", item_num=1, pay_type="home_coin", price=280, limit_soft=600, limit_day=0, limit_week=0, limit_month=0},
	[3] = {type=42, id=42103, order=3, item_bid=100103, item_name="蛋糕", item_type=1, item_desc="适合中程旅行", item_num=1, pay_type="home_coin", price=360, limit_soft=1000, limit_day=0, limit_week=0, limit_month=0},
	[4] = {type=42, id=42104, order=4, item_bid=100104, item_name="法式面包", item_type=1, item_desc="适合中程旅行", item_num=1, pay_type="home_coin", price=480, limit_soft=1400, limit_day=0, limit_week=0, limit_month=0},
	[5] = {type=42, id=42105, order=5, item_bid=100105, item_name="三明治", item_type=1, item_desc="适合长途旅行", item_num=1, pay_type="home_coin", price=600, limit_soft=1800, limit_day=0, limit_week=0, limit_month=0},
	[6] = {type=42, id=42106, order=6, item_bid=100106, item_name="汉堡", item_type=1, item_desc="适合长途旅行", item_num=1, pay_type="home_coin", price=680, limit_soft=2300, limit_day=0, limit_week=0, limit_month=0},
	[7] = {type=42, id=42107, order=7, item_bid=100107, item_name="披萨", item_type=1, item_desc="适合超远地区旅行", item_num=1, pay_type="home_coin", price=760, limit_soft=2900, limit_day=0, limit_week=0, limit_month=0},
	[8] = {type=42, id=42108, order=8, item_bid=100108, item_name="豪华寿司组", item_type=1, item_desc="适合超远地区旅行", item_num=1, pay_type="home_coin", price=880, limit_soft=3500, limit_day=0, limit_week=0, limit_month=0},
	[9] = {type=42, id=42201, order=9, item_bid=100201, item_name="小礼盒", item_type=2, item_desc="英雄碎片概率+5%", item_num=1, pay_type="home_coin", price=80, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[10] = {type=42, id=42202, order=10, item_bid=100202, item_name="玻璃瓶", item_type=2, item_desc="符文精华概率+5%", item_num=1, pay_type="home_coin", price=80, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[11] = {type=42, id=42203, order=11, item_bid=100203, item_name="毛笔", item_type=2, item_desc="日记概率+2%", item_num=1, pay_type="home_coin", price=80, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[12] = {type=42, id=42204, order=12, item_bid=100204, item_name="傻瓜机", item_type=2, item_desc="明信片概率+2%", item_num=1, pay_type="home_coin", price=80, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[13] = {type=42, id=42205, order=13, item_bid=100205, item_name="手持式探测器", item_type=2, item_desc="金币、钻石概率+5%", item_num=1, pay_type="home_coin", price=80, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[14] = {type=42, id=42241, order=14, item_bid=100241, item_name="宝箱", item_type=2, item_desc="英雄碎片概率+10%", item_num=1, pay_type="home_coin", price=160, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[15] = {type=42, id=42242, order=15, item_bid=100242, item_name="水晶瓶", item_type=2, item_desc="符文精华概率+10%", item_num=1, pay_type="home_coin", price=160, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[16] = {type=42, id=42243, order=16, item_bid=100243, item_name="贵重的钢笔", item_type=2, item_desc="日记概率+5%", item_num=1, pay_type="home_coin", price=160, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[17] = {type=42, id=42244, order=17, item_bid=100244, item_name="智能相机", item_type=2, item_desc="明信片概率+5%", item_num=1, pay_type="home_coin", price=160, limit_soft=0, limit_day=2, limit_week=0, limit_month=0},
	[18] = {type=42, id=42245, order=18, item_bid=100245, item_name="精密的探测仪", item_type=2, item_desc="金币钻石概率+10%", item_num=1, pay_type="home_coin", price=160, limit_soft=0, limit_day=2, limit_week=0, limit_month=0}
}
Config.ExchangeData.data_shop_exchage_pet_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_pet[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_pet['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_pet_end---------------------


-- -------------------shop_exchage_crosschampion_start-------------------
Config.ExchangeData.data_shop_exchage_crosschampion_length = 8
Config.ExchangeData.data_shop_exchage_crosschampion = {
	[1] = {type=36, id=36001, order=1, item_bid=40113, item_name="圣光之刃", item_num=1, bind=1, pay_type="cluster_guess_cent", price=14500, limit_day=0, limit_week=1, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[2] = {type=36, id=36002, order=2, item_bid=40213, item_name="圣光护甲", item_num=1, bind=1, pay_type="cluster_guess_cent", price=14500, limit_day=0, limit_week=1, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[3] = {type=36, id=36003, order=3, item_bid=40313, item_name="圣光头盔", item_num=1, bind=1, pay_type="cluster_guess_cent", price=14500, limit_day=0, limit_week=1, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[4] = {type=36, id=36004, order=4, item_bid=40413, item_name="圣光戒指", item_num=1, bind=1, pay_type="cluster_guess_cent", price=14500, limit_day=0, limit_week=1, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[5] = {type=36, id=36005, order=5, item_bid=10450, item_name="符文精华", item_num=1000, bind=1, pay_type="cluster_guess_cent", price=1250, limit_day=0, limit_week=5, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[6] = {type=36, id=36006, order=6, item_bid=10301, item_name="冠军之心", item_num=1, bind=1, pay_type="cluster_guess_cent", price=2500, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[7] = {type=36, id=36007, order=7, item_bid=10095, item_name="天晶魔液", item_num=200, bind=1, pay_type="cluster_guess_cent", price=5000, limit_day=0, limit_week=1, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[8] = {type=36, id=36008, order=8, item_bid=10602, item_name="玄魔蛋", item_num=1, bind=1, pay_type="cluster_guess_cent", price=750, limit_day=0, limit_week=1, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}}
}
Config.ExchangeData.data_shop_exchage_crosschampion_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_crosschampion[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_crosschampion['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_crosschampion_end---------------------


-- -------------------shop_exchage_peakchampion_start-------------------
Config.ExchangeData.data_shop_exchage_peakchampion_length = 12
Config.ExchangeData.data_shop_exchage_peakchampion = {
	[1] = {type=37, id=37001, order=1, item_bid=32, item_name="烈阳晶石", item_num=10000, bind=1, pay_type="peak_guess_cent", price=1000, limit_day=0, limit_week=0, limit_month=0, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[2] = {type=37, id=37002, order=2, item_bid=10040, item_name="奥术之尘", item_num=100, bind=1, pay_type="peak_guess_cent", price=7500, limit_day=0, limit_week=1, limit_month=0, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[3] = {type=37, id=37003, order=3, item_bid=10603, item_name="圣灵蛋", item_num=1, bind=1, pay_type="peak_guess_cent", price=3600, limit_day=0, limit_week=0, limit_month=2, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[8] = {type=37, id=37004, order=8, item_bid=27907, item_name="拉斐尔碎片", item_num=5, bind=1, pay_type="peak_guess_cent", price=5000, limit_day=0, limit_week=0, limit_month=10, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[9] = {type=37, id=37005, order=9, item_bid=28901, item_name="哈迪斯碎片", item_num=5, bind=1, pay_type="peak_guess_cent", price=5000, limit_day=0, limit_week=0, limit_month=10, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[10] = {type=37, id=37006, order=10, item_bid=24910, item_name="酒神碎片", item_num=5, bind=1, pay_type="peak_guess_cent", price=3750, limit_day=0, limit_week=0, limit_month=10, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[11] = {type=37, id=37007, order=11, item_bid=25910, item_name="海姆达尔碎片", item_num=5, bind=1, pay_type="peak_guess_cent", price=3750, limit_day=0, limit_week=0, limit_month=10, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[12] = {type=37, id=37008, order=12, item_bid=26910, item_name="辛西娅碎片", item_num=5, bind=1, pay_type="peak_guess_cent", price=3750, limit_day=0, limit_week=0, limit_month=10, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[4] = {type=37, id=37009, order=4, item_bid=14001, item_name="先知水晶", item_num=1, bind=1, pay_type="peak_guess_cent", price=5000, limit_day=0, limit_week=1, limit_month=0, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[5] = {type=37, id=37010, order=5, item_bid=16201, item_name="随机觉醒符石", item_num=1, bind=1, pay_type="peak_guess_cent", price=10000, limit_day=0, limit_week=1, limit_month=0, lev={160,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={{'lv',160}}},
	[6] = {type=37, id=37011, order=6, item_bid=10460, item_name="觉醒石", item_num=5, bind=1, pay_type="peak_guess_cent", price=12500, limit_day=0, limit_week=2, limit_month=0, lev={160,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={{'lv',160}}},
	[7] = {type=37, id=37012, order=7, item_bid=10470, item_name="好运宝珠", item_num=1, bind=1, pay_type="peak_guess_cent", price=15000, limit_day=0, limit_week=0, limit_month=2, lev={55,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}}
}
Config.ExchangeData.data_shop_exchage_peakchampion_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_peakchampion[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_peakchampion['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_peakchampion_end---------------------


-- -------------------shop_exchage_herosoul_start-------------------
Config.ExchangeData.data_shop_exchage_herosoul_length = 19
Config.ExchangeData.data_shop_exchage_herosoul = {
	[1] = {type=53, id=53001, order=1, item_bid=24901, item_name="冰雪女王碎片", item_num=50, bind=1, pay_type=10005, price=30, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[2] = {type=53, id=53002, order=2, item_bid=25903, item_name="菲尼克斯碎片", item_num=50, bind=1, pay_type=10005, price=30, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[3] = {type=53, id=53003, order=3, item_bid=26901, item_name="影刹碎片", item_num=50, bind=1, pay_type=10005, price=30, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[4] = {type=53, id=53004, order=4, item_bid=24902, item_name="冰霜巨龙碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[5] = {type=53, id=53005, order=5, item_bid=24905, item_name="派西斯碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[6] = {type=53, id=53006, order=6, item_bid=24906, item_name="少年梅林碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[7] = {type=53, id=53007, order=7, item_bid=24907, item_name="海宁芙碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[8] = {type=53, id=53008, order=8, item_bid=24908, item_name="阿瑞斯碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[9] = {type=53, id=53009, order=9, item_bid=25900, item_name="炽天使碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[10] = {type=53, id=53010, order=10, item_bid=25901, item_name="炎魔之王碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[11] = {type=53, id=53011, order=11, item_bid=25902, item_name="剑豪卡赞碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[12] = {type=53, id=53012, order=12, item_bid=25904, item_name="阿波罗碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[13] = {type=53, id=53013, order=13, item_bid=25905, item_name="吸血伯爵碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[14] = {type=53, id=53014, order=14, item_bid=26900, item_name="奥丁碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[15] = {type=53, id=53015, order=15, item_bid=26902, item_name="凯兰崔尔碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[16] = {type=53, id=53016, order=16, item_bid=26903, item_name="魅魔女王碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[17] = {type=53, id=53017, order=17, item_bid=26904, item_name="美杜莎碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[18] = {type=53, id=53018, order=18, item_bid=26905, item_name="雅典娜碎片", item_num=50, bind=1, pay_type=10005, price=20, limit_day=0, limit_week=0, limit_month=1, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}},
	[19] = {type=53, id=53019, order=19, item_bid=10403, item_name="高级召唤卷", item_num=10, bind=1, pay_type=10005, price=15, limit_day=0, limit_week=0, limit_month=0, lev={1,999}, is_partner=0, icon=0, label=0, discount=0, limit_count=0, limit_rank=0, role_lev={}}
}
Config.ExchangeData.data_shop_exchage_herosoul_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_herosoul[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_herosoul['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_herosoul_end---------------------


-- -------------------shop_exchage_hero_start-------------------
Config.ExchangeData.data_shop_exchage_hero_length = 28
Config.ExchangeData.data_shop_exchage_hero = {
	[1] = {type=51, id=51001, order=1, item_bid=24901, item_name="冰雪女王碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[2] = {type=51, id=51002, order=2, item_bid=24903, item_name="泰坦碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[3] = {type=51, id=51003, order=3, item_bid=24904, item_name="波塞冬碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[4] = {type=51, id=51004, order=4, item_bid=24909, item_name="耶梦加得碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[5] = {type=51, id=51005, order=5, item_bid=24910, item_name="酒神碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[6] = {type=51, id=51006, order=6, item_bid=25906, item_name="普罗米修斯碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[7] = {type=51, id=51007, order=7, item_bid=25907, item_name="瓦尔基里碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[8] = {type=51, id=51008, order=8, item_bid=25908, item_name="洛基碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[11] = {type=51, id=51009, order=11, item_bid=26901, item_name="影刹碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[12] = {type=51, id=51010, order=12, item_bid=26906, item_name="潘碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[13] = {type=51, id=51011, order=13, item_bid=26907, item_name="斯芬克斯碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[14] = {type=51, id=51012, order=14, item_bid=26908, item_name="芬尼尔碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[15] = {type=51, id=51013, order=15, item_bid=26909, item_name="拉塔托斯克碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[17] = {type=51, id=51014, order=17, item_bid=27901, item_name="宙斯碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[18] = {type=51, id=51015, order=18, item_bid=27903, item_name="雷神碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[19] = {type=51, id=51016, order=19, item_bid=27906, item_name="神灵大祭司碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[20] = {type=51, id=51017, order=20, item_bid=27907, item_name="拉斐尔碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[21] = {type=51, id=51018, order=21, item_bid=27908, item_name="维纳斯碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[22] = {type=51, id=51019, order=22, item_bid=28901, item_name="哈迪斯碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[23] = {type=51, id=51020, order=23, item_bid=28902, item_name="亚巴顿碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[24] = {type=51, id=51021, order=24, item_bid=28903, item_name="黑暗之主碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[25] = {type=51, id=51022, order=25, item_bid=28905, item_name="路西法碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[26] = {type=51, id=51023, order=26, item_bid=28906, item_name="潘多拉碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[27] = {type=51, id=51024, order=27, item_bid=28907, item_name="海拉碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[9] = {type=51, id=51025, order=9, item_bid=25909, item_name="哪吒碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[28] = {type=51, id=51026, order=28, item_bid=28908, item_name="尼德霍格碎片", item_num=50, pay_type="feather_exchange", price=80, limit_day=0, limit_week=0, limit_month=0},
	[10] = {type=51, id=51027, order=10, item_bid=25910, item_name="海姆达尔碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0},
	[16] = {type=51, id=51028, order=16, item_bid=26910, item_name="辛西娅碎片", item_num=50, pay_type="feather_exchange", price=60, limit_day=0, limit_week=0, limit_month=0}
}
Config.ExchangeData.data_shop_exchage_hero_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_hero[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_hero['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_hero_end---------------------


-- -------------------shop_exchage_cloth_start-------------------
Config.ExchangeData.data_shop_exchage_cloth_length = 120
Config.ExchangeData.data_shop_exchage_cloth = {
	[1] = {type=52, id=52001, order=1, item_bid=5030201, item_name="[极品]3星穿甲耳环", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[2] = {type=52, id=52002, order=2, item_bid=5030202, item_name="[极品]3星穿甲项链", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[3] = {type=52, id=52003, order=3, item_bid=5030203, item_name="[极品]3星穿甲戒指", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[4] = {type=52, id=52004, order=4, item_bid=5030204, item_name="[极品]3星穿甲手镯", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[5] = {type=52, id=52005, order=5, item_bid=6030201, item_name="[极品]3星破法耳环", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[6] = {type=52, id=52006, order=6, item_bid=6030202, item_name="[极品]3星破法项链", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[7] = {type=52, id=52007, order=7, item_bid=6030203, item_name="[极品]3星破法戒指", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[8] = {type=52, id=52008, order=8, item_bid=6030204, item_name="[极品]3星破法手镯", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[9] = {type=52, id=52009, order=9, item_bid=7030201, item_name="[极品]3星斗战耳环", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[10] = {type=52, id=52010, order=10, item_bid=7030202, item_name="[极品]3星斗战项链", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[11] = {type=52, id=52011, order=11, item_bid=7030203, item_name="[极品]3星斗战戒指", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[12] = {type=52, id=52012, order=12, item_bid=7030204, item_name="[极品]3星斗战手镯", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[13] = {type=52, id=52013, order=13, item_bid=8030201, item_name="[极品]3星镇灵耳环", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[14] = {type=52, id=52014, order=14, item_bid=8030202, item_name="[极品]3星镇灵项链", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[15] = {type=52, id=52015, order=15, item_bid=8030203, item_name="[极品]3星镇灵戒指", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[16] = {type=52, id=52016, order=16, item_bid=8030204, item_name="[极品]3星镇灵手镯", item_num=1, pay_type="feather_exchange", price=25, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[17] = {type=52, id=52017, order=17, item_bid=9030201, item_name="[极品]3星魔甲耳环", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[18] = {type=52, id=52018, order=18, item_bid=9030202, item_name="[极品]3星魔甲项链", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[19] = {type=52, id=52019, order=19, item_bid=9030203, item_name="[极品]3星魔甲戒指", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[20] = {type=52, id=52020, order=20, item_bid=9030204, item_name="[极品]3星魔甲手镯", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[21] = {type=52, id=52021, order=21, item_bid=10030201, item_name="[极品]3星神战耳环", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[22] = {type=52, id=52022, order=22, item_bid=10030202, item_name="[极品]3星神战项链", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[23] = {type=52, id=52023, order=23, item_bid=10030203, item_name="[极品]3星神战戒指", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[24] = {type=52, id=52024, order=24, item_bid=10030204, item_name="[极品]3星神战手镯", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[25] = {type=52, id=52025, order=25, item_bid=11030201, item_name="[极品]3星龙威耳环", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[26] = {type=52, id=52026, order=26, item_bid=11030202, item_name="[极品]3星龙威项链", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[27] = {type=52, id=52027, order=27, item_bid=11030203, item_name="[极品]3星龙威戒指", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[28] = {type=52, id=52028, order=28, item_bid=11030204, item_name="[极品]3星龙威手镯", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[29] = {type=52, id=52029, order=29, item_bid=12030201, item_name="[极品]3星神愈耳环", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[30] = {type=52, id=52030, order=30, item_bid=12030202, item_name="[极品]3星神愈项链", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[31] = {type=52, id=52031, order=31, item_bid=12030203, item_name="[极品]3星神愈戒指", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[32] = {type=52, id=52032, order=32, item_bid=12030204, item_name="[极品]3星神愈手镯", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[33] = {type=52, id=52097, order=33, item_bid=13030201, item_name="[极品]3星极速耳环", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[34] = {type=52, id=52098, order=34, item_bid=13030202, item_name="[极品]3星极速项链", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[35] = {type=52, id=52099, order=35, item_bid=13030203, item_name="[极品]3星极速戒指", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[36] = {type=52, id=52100, order=36, item_bid=13030204, item_name="[极品]3星极速手镯", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[37] = {type=52, id=52101, order=37, item_bid=14030201, item_name="[极品]3星玄护耳环", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[38] = {type=52, id=52102, order=38, item_bid=14030202, item_name="[极品]3星玄护项链", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[39] = {type=52, id=52103, order=39, item_bid=14030203, item_name="[极品]3星玄护戒指", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[40] = {type=52, id=52104, order=40, item_bid=14030204, item_name="[极品]3星玄护手镯", item_num=1, pay_type="feather_exchange", price=30, buy_condit=0, pass_name="", limit_day=0, limit_week=0, limit_month=0},
	[41] = {type=52, id=52033, order=41, item_bid=5040201, item_name="[极品]4星穿甲耳环", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[42] = {type=52, id=52034, order=42, item_bid=5040202, item_name="[极品]4星穿甲项链", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[43] = {type=52, id=52035, order=43, item_bid=5040203, item_name="[极品]4星穿甲戒指", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[44] = {type=52, id=52036, order=44, item_bid=5040204, item_name="[极品]4星穿甲手镯", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[45] = {type=52, id=52037, order=45, item_bid=6040201, item_name="[极品]4星破法耳环", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[46] = {type=52, id=52038, order=46, item_bid=6040202, item_name="[极品]4星破法项链", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[47] = {type=52, id=52039, order=47, item_bid=6040203, item_name="[极品]4星破法戒指", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[48] = {type=52, id=52040, order=48, item_bid=6040204, item_name="[极品]4星破法手镯", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[49] = {type=52, id=52041, order=49, item_bid=7040201, item_name="[极品]4星斗战耳环", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[50] = {type=52, id=52042, order=50, item_bid=7040202, item_name="[极品]4星斗战项链", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[51] = {type=52, id=52043, order=51, item_bid=7040203, item_name="[极品]4星斗战戒指", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[52] = {type=52, id=52044, order=52, item_bid=7040204, item_name="[极品]4星斗战手镯", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[53] = {type=52, id=52045, order=53, item_bid=8040201, item_name="[极品]4星镇灵耳环", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[54] = {type=52, id=52046, order=54, item_bid=8040202, item_name="[极品]4星镇灵项链", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[55] = {type=52, id=52047, order=55, item_bid=8040203, item_name="[极品]4星镇灵戒指", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[56] = {type=52, id=52048, order=56, item_bid=8040204, item_name="[极品]4星镇灵手镯", item_num=1, pay_type="feather_exchange", price=40, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[57] = {type=52, id=52049, order=57, item_bid=9040201, item_name="[极品]4星魔甲耳环", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[58] = {type=52, id=52050, order=58, item_bid=9040202, item_name="[极品]4星魔甲项链", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[59] = {type=52, id=52051, order=59, item_bid=9040203, item_name="[极品]4星魔甲戒指", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[60] = {type=52, id=52052, order=60, item_bid=9040204, item_name="[极品]4星魔甲手镯", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[61] = {type=52, id=52053, order=61, item_bid=10040201, item_name="[极品]4星神战耳环", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[62] = {type=52, id=52054, order=62, item_bid=10040202, item_name="[极品]4星神战项链", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[63] = {type=52, id=52055, order=63, item_bid=10040203, item_name="[极品]4星神战戒指", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[64] = {type=52, id=52056, order=64, item_bid=10040204, item_name="[极品]4星神战手镯", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[65] = {type=52, id=52057, order=65, item_bid=11040201, item_name="[极品]4星龙威耳环", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[66] = {type=52, id=52058, order=66, item_bid=11040202, item_name="[极品]4星龙威项链", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[67] = {type=52, id=52059, order=67, item_bid=11040203, item_name="[极品]4星龙威戒指", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[68] = {type=52, id=52060, order=68, item_bid=11040204, item_name="[极品]4星龙威手镯", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[69] = {type=52, id=52061, order=69, item_bid=12040201, item_name="[极品]4星神愈耳环", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[70] = {type=52, id=52062, order=70, item_bid=12040202, item_name="[极品]4星神愈项链", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[71] = {type=52, id=52063, order=71, item_bid=12040203, item_name="[极品]4星神愈戒指", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[72] = {type=52, id=52064, order=72, item_bid=12040204, item_name="[极品]4星神愈手镯", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[73] = {type=52, id=52105, order=73, item_bid=13040201, item_name="[极品]4星极速耳环", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[74] = {type=52, id=52106, order=74, item_bid=13040202, item_name="[极品]4星极速项链", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[75] = {type=52, id=52107, order=75, item_bid=13040203, item_name="[极品]4星极速戒指", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[76] = {type=52, id=52108, order=76, item_bid=13040204, item_name="[极品]4星极速手镯", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[77] = {type=52, id=52109, order=77, item_bid=14040201, item_name="[极品]4星玄护耳环", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[78] = {type=52, id=52110, order=78, item_bid=14040202, item_name="[极品]4星玄护项链", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[79] = {type=52, id=52111, order=79, item_bid=14040203, item_name="[极品]4星玄护戒指", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[80] = {type=52, id=52112, order=80, item_bid=14040204, item_name="[极品]4星玄护手镯", item_num=1, pay_type="feather_exchange", price=50, buy_condit=15000, pass_name="需要战力前五英雄的神装总评分达15000", limit_day=0, limit_week=0, limit_month=0},
	[81] = {type=52, id=52065, order=81, item_bid=5050201, item_name="[极品]5星穿甲耳环", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[82] = {type=52, id=52066, order=82, item_bid=5050202, item_name="[极品]5星穿甲项链", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[83] = {type=52, id=52067, order=83, item_bid=5050203, item_name="[极品]5星穿甲戒指", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[84] = {type=52, id=52068, order=84, item_bid=5050204, item_name="[极品]5星穿甲手镯", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[85] = {type=52, id=52069, order=85, item_bid=6050201, item_name="[极品]5星破法耳环", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[86] = {type=52, id=52070, order=86, item_bid=6050202, item_name="[极品]5星破法项链", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[87] = {type=52, id=52071, order=87, item_bid=6050203, item_name="[极品]5星破法戒指", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[88] = {type=52, id=52072, order=88, item_bid=6050204, item_name="[极品]5星破法手镯", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[89] = {type=52, id=52073, order=89, item_bid=7050201, item_name="[极品]5星斗战耳环", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[90] = {type=52, id=52074, order=90, item_bid=7050202, item_name="[极品]5星斗战项链", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[91] = {type=52, id=52075, order=91, item_bid=7050203, item_name="[极品]5星斗战戒指", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[92] = {type=52, id=52076, order=92, item_bid=7050204, item_name="[极品]5星斗战手镯", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[93] = {type=52, id=52077, order=93, item_bid=8050201, item_name="[极品]5星镇灵耳环", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[94] = {type=52, id=52078, order=94, item_bid=8050202, item_name="[极品]5星镇灵项链", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[95] = {type=52, id=52079, order=95, item_bid=8050203, item_name="[极品]5星镇灵戒指", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[96] = {type=52, id=52080, order=96, item_bid=8050204, item_name="[极品]5星镇灵手镯", item_num=1, pay_type="feather_exchange", price=60, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[97] = {type=52, id=52081, order=97, item_bid=9050201, item_name="[极品]5星魔甲耳环", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[98] = {type=52, id=52082, order=98, item_bid=9050202, item_name="[极品]5星魔甲项链", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[99] = {type=52, id=52083, order=99, item_bid=9050203, item_name="[极品]5星魔甲戒指", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[100] = {type=52, id=52084, order=100, item_bid=9050204, item_name="[极品]5星魔甲手镯", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[101] = {type=52, id=52085, order=101, item_bid=10050201, item_name="[极品]5星神战耳环", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[102] = {type=52, id=52086, order=102, item_bid=10050202, item_name="[极品]5星神战项链", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[103] = {type=52, id=52087, order=103, item_bid=10050203, item_name="[极品]5星神战戒指", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[104] = {type=52, id=52088, order=104, item_bid=10050204, item_name="[极品]5星神战手镯", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[105] = {type=52, id=52089, order=105, item_bid=11050201, item_name="[极品]5星龙威耳环", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[106] = {type=52, id=52090, order=106, item_bid=11050202, item_name="[极品]5星龙威项链", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[107] = {type=52, id=52091, order=107, item_bid=11050203, item_name="[极品]5星龙威戒指", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[108] = {type=52, id=52092, order=108, item_bid=11050204, item_name="[极品]5星龙威手镯", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[109] = {type=52, id=52093, order=109, item_bid=12050201, item_name="[极品]5星神愈耳环", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[110] = {type=52, id=52094, order=110, item_bid=12050202, item_name="[极品]5星神愈项链", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[111] = {type=52, id=52095, order=111, item_bid=12050203, item_name="[极品]5星神愈戒指", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[112] = {type=52, id=52096, order=112, item_bid=12050204, item_name="[极品]5星神愈手镯", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[113] = {type=52, id=52113, order=113, item_bid=13050201, item_name="[极品]5星极速耳环", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[114] = {type=52, id=52114, order=114, item_bid=13050202, item_name="[极品]5星极速项链", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[115] = {type=52, id=52115, order=115, item_bid=13050203, item_name="[极品]5星极速戒指", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[116] = {type=52, id=52116, order=116, item_bid=13050204, item_name="[极品]5星极速手镯", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[117] = {type=52, id=52117, order=117, item_bid=14050201, item_name="[极品]5星玄护耳环", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[118] = {type=52, id=52118, order=118, item_bid=14050202, item_name="[极品]5星玄护项链", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[119] = {type=52, id=52119, order=119, item_bid=14050203, item_name="[极品]5星玄护戒指", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0},
	[120] = {type=52, id=52120, order=120, item_bid=14050204, item_name="[极品]5星玄护手镯", item_num=1, pay_type="feather_exchange", price=100, buy_condit=24000, pass_name="需要战力前五英雄的神装总评分达24000", limit_day=0, limit_week=0, limit_month=0}
}
Config.ExchangeData.data_shop_exchage_cloth_fun = function(key)
	local data=Config.ExchangeData.data_shop_exchage_cloth[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ExchangeData.data_shop_exchage_cloth['..key..'])not found') return
	end
	return data
end
-- -------------------shop_exchage_cloth_end---------------------

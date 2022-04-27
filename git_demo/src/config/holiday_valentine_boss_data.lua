----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--holiday_valentine_boss_data.xml
--------------------------------------

Config = Config or {} 
Config.HolidayValentineBossData = Config.HolidayValentineBossData or {}

-- -------------------constant_start-------------------
Config.HolidayValentineBossData.data_constant_length = 2
Config.HolidayValentineBossData.data_constant = {
	["holiday_valentine_boss_buy_loss1"] = {val={{3,200}}, desc="购买第一次所需资产"},
	["holiday_valentine_boss_buy_loss2"] = {val={{3,200}}, desc="购买第二次所需资产"}
}
Config.HolidayValentineBossData.data_constant_fun = function(key)
	local data=Config.HolidayValentineBossData.data_constant[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidayValentineBossData.data_constant['..key..'])not found') return
	end
	return data
end
-- -------------------constant_end---------------------


-- -------------------boss_list_start-------------------
Config.HolidayValentineBossData.data_boss_list_length = 4
Config.HolidayValentineBossData.data_boss_list = {
	[49971] = {
		[1] = {id=1, camp_id=49971, start_time={{2020,3,12},{0,0,0}}, end_time={{2020,3,18},{23,59,59}}, boss_id=97101, time=2, buy_time=0, boss_skill_id={918101,918201,918301,918401}, reward={{37011,1},{29905,1},{10603,1},{10403,1}}, draw_id=1, title_name="玫瑰之恋", head_icon=2017, rules="1、活动期间，参与海拉玫瑰之恋boss挑战，单场战斗内造成越多伤害，可获得更多奖励，奖励必得<div fontcolor=#c23f35>【玫瑰之钥】</div>，更有机会掉落金羽蛋、高级召唤卷、5星随机碎片、符文精华等珍稀材料！\n2、每日挑战机会<div fontcolor=#c23f35>2次</div>，挑战机会0点重置哦", act_time="3月12日-3月18日"},
	},
	[49995] = {
		[2] = {id=2, camp_id=49995, start_time={{2020,3,19},{0,0,0}}, end_time={{2020,3,25},{23,59,59}}, boss_id=97201, time=2, buy_time=2, boss_skill_id={917101,917201,917301,917401}, reward={{80266,1},{29905,1},{10408,1},{10450,1}}, draw_id=2, title_name="风灵之力", head_icon=30512, rules="1、活动期间，参与风灵之力塞莎特boss挑战，单场战斗内造成越多伤害，可获得更多奖励，奖励必得积分<div fontcolor=#c23f35>【魔法之书】</div>！\n2、<div fontcolor=#c23f35>【魔法之书】</div>可以在兑换杂货店中兑换冒险者大人喜欢的各种珍稀道具，活动限时，请抓紧时间兑换哦！\n3、每日免费挑战机会<div fontcolor=#c23f35>2次</div>，可以额外钻石购买2次挑战机会（200钻/次），挑战机会0点重置哦", act_time="3月19日-3月25日"},
	},
	[50038] = {
		[3] = {id=3, camp_id=50038, start_time={{2020,4,9},{0,0,0}}, end_time={{2020,4,15},{23,59,59}}, boss_id=97202, time=2, buy_time=0, boss_skill_id={916101,916201,916301,916401}, reward={{37012,1},{29905,1},{10408,1},{10450,1}}, draw_id=3, title_name="活力大作战", head_icon=2019, rules="1、活动期间，参与拉斐尔拉拉队boss挑战，单场战斗内造成越多伤害，可获得更多奖励，奖励必得道具<div fontcolor=#c23f35>【哨子】</div>！更有机会掉落精英召唤卷、5星随机碎片、符文精华等珍稀材料！\n2、<div fontcolor=#c23f35>【哨子】</div>可以在抽奖活动中挖取各种珍稀道具，活动限时，请抓紧时间参与哦！\n3、每日免费挑战机会<div fontcolor=#c23f35>2次</div>，挑战机会0点重置哦", act_time="4月9日-4月15日"},
	},
	[50050] = {
		[4] = {id=4, camp_id=50050, start_time={{2020,4,13},{0,0,0}}, end_time={{2020,4,22},{23,59,59}}, boss_id=97203, time=2, buy_time=2, boss_skill_id={915101,915201,915301}, reward={{80268,1},{29905,1},{10408,1},{10450,1}}, draw_id=4, title_name="火灵庇佑", head_icon=20512, rules="1、活动期间，参与火灵庇佑阿奇丽boss挑战，单场战斗内造成越多伤害，可获得更多奖励，奖励必得道具<div fontcolor=#c23f35>【火灵环】</div>！\n2、<div fontcolor=#c23f35>【火灵环】</div>可以在兑换杂货店中兑换冒险者大人喜欢的各种珍稀道具，活动限时，请抓紧时间兑换哦！\n3、每日免费挑战机会<div fontcolor=#c23f35>2次</div>，可以额外钻石购买2次挑战机会（200钻/次），挑战机会0点重置哦", act_time="4月16日-4月22日"},
	},
}
-- -------------------boss_list_end---------------------


-- -------------------award_list_start-------------------
Config.HolidayValentineBossData.data_award_list_length = 4
Config.HolidayValentineBossData.data_award_list = {
	[1] = {
		[1] = {id=1, min=75000001, max=95000000, box_count=24},
			{id=1, min=61610001, max=75000000, box_count=23},
			{id=1, min=50610001, max=61610000, box_count=22},
			{id=1, min=40610001, max=50610000, box_count=21},
			{id=1, min=31610001, max=40610000, box_count=20},
			{id=1, min=24610001, max=31610000, box_count=19},
			{id=1, min=18610001, max=24610000, box_count=18},
			{id=1, min=13610001, max=18610000, box_count=17},
			{id=1, min=9610001, max=13610000, box_count=16},
			{id=1, min=6610001, max=9610000, box_count=15},
			{id=1, min=4610001, max=6610000, box_count=14},
			{id=1, min=3110001, max=4610000, box_count=13},
			{id=1, min=2110001, max=3110000, box_count=12},
			{id=1, min=1410001, max=2110000, box_count=11},
			{id=1, min=910001, max=1410000, box_count=10},
			{id=1, min=560001, max=910000, box_count=9},
			{id=1, min=310001, max=560000, box_count=8},
			{id=1, min=190001, max=310000, box_count=7},
			{id=1, min=110001, max=190000, box_count=6},
			{id=1, min=60001, max=110000, box_count=5},
			{id=1, min=30001, max=60000, box_count=4},
			{id=1, min=15001, max=30000, box_count=3},
			{id=1, min=5001, max=15000, box_count=2},
			{id=1, min=1, max=5000, box_count=1},
	},
	[2] = {
		[2] = {id=2, min=75000001, max=950000000, box_count=22},
			{id=2, min=61610001, max=75000000, box_count=21},
			{id=2, min=50610001, max=61610000, box_count=20},
			{id=2, min=40610001, max=50610000, box_count=19},
			{id=2, min=31610001, max=40610000, box_count=18},
			{id=2, min=24610001, max=31610000, box_count=17},
			{id=2, min=18610001, max=24610000, box_count=16},
			{id=2, min=13610001, max=18610000, box_count=15},
			{id=2, min=9610001, max=13610000, box_count=14},
			{id=2, min=6610001, max=9610000, box_count=13},
			{id=2, min=4610001, max=6610000, box_count=12},
			{id=2, min=3110001, max=4610000, box_count=11},
			{id=2, min=2110001, max=3110000, box_count=10},
			{id=2, min=1410001, max=2110000, box_count=9},
			{id=2, min=910001, max=1410000, box_count=8},
			{id=2, min=560001, max=910000, box_count=7},
			{id=2, min=310001, max=560000, box_count=6},
			{id=2, min=200001, max=310000, box_count=5},
			{id=2, min=140001, max=200000, box_count=4},
			{id=2, min=80001, max=140000, box_count=3},
			{id=2, min=30001, max=80000, box_count=2},
			{id=2, min=1, max=30000, box_count=1},
	},
	[3] = {
		[3] = {id=3, min=75000001, max=950000000, box_count=22},
			{id=3, min=61610001, max=75000000, box_count=21},
			{id=3, min=50610001, max=61610000, box_count=20},
			{id=3, min=40610001, max=50610000, box_count=19},
			{id=3, min=31610001, max=40610000, box_count=18},
			{id=3, min=24610001, max=31610000, box_count=17},
			{id=3, min=18610001, max=24610000, box_count=16},
			{id=3, min=13610001, max=18610000, box_count=15},
			{id=3, min=9610001, max=13610000, box_count=14},
			{id=3, min=6610001, max=9610000, box_count=13},
			{id=3, min=4610001, max=6610000, box_count=12},
			{id=3, min=3110001, max=4610000, box_count=11},
			{id=3, min=2110001, max=3110000, box_count=10},
			{id=3, min=1410001, max=2110000, box_count=9},
			{id=3, min=910001, max=1410000, box_count=8},
			{id=3, min=560001, max=910000, box_count=7},
			{id=3, min=310001, max=560000, box_count=6},
			{id=3, min=200001, max=310000, box_count=5},
			{id=3, min=140001, max=200000, box_count=4},
			{id=3, min=80001, max=140000, box_count=3},
			{id=3, min=30001, max=80000, box_count=2},
			{id=3, min=1, max=30000, box_count=1},
	},
	[4] = {
		[4] = {id=4, min=75000001, max=950000000, box_count=22},
			{id=4, min=61610001, max=75000000, box_count=21},
			{id=4, min=50610001, max=61610000, box_count=20},
			{id=4, min=40610001, max=50610000, box_count=19},
			{id=4, min=31610001, max=40610000, box_count=18},
			{id=4, min=24610001, max=31610000, box_count=17},
			{id=4, min=18610001, max=24610000, box_count=16},
			{id=4, min=13610001, max=18610000, box_count=15},
			{id=4, min=9610001, max=13610000, box_count=14},
			{id=4, min=6610001, max=9610000, box_count=13},
			{id=4, min=4610001, max=6610000, box_count=12},
			{id=4, min=3110001, max=4610000, box_count=11},
			{id=4, min=2110001, max=3110000, box_count=10},
			{id=4, min=1410001, max=2110000, box_count=9},
			{id=4, min=910001, max=1410000, box_count=8},
			{id=4, min=560001, max=910000, box_count=7},
			{id=4, min=310001, max=560000, box_count=6},
			{id=4, min=200001, max=310000, box_count=5},
			{id=4, min=140001, max=200000, box_count=4},
			{id=4, min=80001, max=140000, box_count=3},
			{id=4, min=30001, max=80000, box_count=2},
			{id=4, min=1, max=30000, box_count=1},
	},
}
-- -------------------award_list_end---------------------

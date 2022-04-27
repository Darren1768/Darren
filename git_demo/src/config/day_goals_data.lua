----------------------------------------------------
-- 此文件由数据工具生成
-- 章节副本配置数据--day_goals_data.xml
--------------------------------------

Config = Config or {} 
Config.DayGoalsData = Config.DayGoalsData or {}

-- -------------------constant_start-------------------
Config.DayGoalsData.data_constant_length = 8
Config.DayGoalsData.data_constant = {
	["over_time"] = {label='over_time', val=7, desc="结束时间"},
	["task_total"] = {label='task_total', val=119, desc="全目标总任务数量"},
	["rule_desc"] = {label='rule_desc', val=1, desc="1、快速作战可直接收益"},
	["day_item"] = {label='day_item', val={10001,10403,8,10002,25,37001,40307}, desc="七日目标图标展示"},
	["day_item1"] = {label='day_item1', val={10152,17,25,10002,10403,37002,40105}, desc="第二期七日目标图标展示"},
	["day_item2"] = {label='day_item2', val={8,17,25,10002,40106,17,10450}, desc="第三期七日目标图标展示"},
	["day_item3"] = {label='day_item3', val={40112,17,10403,10002,9,37001,72001}, desc="第四期七日目标图标展示"},
	["limit_day_goals_charge_date"] = {label='limit_day_goals_charge_date', val={{2020,4,2},{9,59,0}}, desc="限制该时间后开启的新服周期1的七日目标不再出现累充活动（2020年4月1日版本）"}
}
Config.DayGoalsData.data_constant_fun = function(key)
	local data=Config.DayGoalsData.data_constant[key]
	if DATA_DEBUG and data == nil then
		print('(Config.DayGoalsData.data_constant['..key..'])not found') return
	end
	return data
end
-- -------------------constant_end---------------------


-- -------------------welfarecollection_start-------------------
Config.DayGoalsData.data_welfarecollection_length = 3
Config.DayGoalsData.data_welfarecollection = {
	[7] = {
		[7] = {{period=7, goal_id=87000, day=7, desc="登陆1次", condition={{'login',7}}, show_icon=401, award1={{3,100},{37002,1}}, id=1, extend={}},
			{period=7, goal_id=87001, day=7, desc="累充5000元", condition={{'charge_rmb',5000}}, show_icon=131, award1={{3,8000},{27905,50}}, id=2, extend={}}
		},
		[6] = {{period=7, goal_id=77000, day=6, desc="登陆1次", condition={{'login',6}}, show_icon=401, award1={{3,100},{38081,1}}, id=1, extend={}},
			{period=7, goal_id=77001, day=6, desc="累充3000元", condition={{'charge_rmb',3000}}, show_icon=131, award1={{3,5000},{38061,1}}, id=2, extend={}}
		},
		[5] = {{period=7, goal_id=67000, day=5, desc="登陆1次", condition={{'login',5}}, show_icon=401, award1={{3,100},{38080,1}}, id=1, extend={}},
			{period=7, goal_id=67001, day=5, desc="累充2000元", condition={{'charge_rmb',2000}}, show_icon=131, award1={{3,3000},{10450,5000}}, id=2, extend={}}
		},
		[4] = {{period=7, goal_id=57000, day=4, desc="登陆1次", condition={{'login',4}}, show_icon=401, award1={{3,100},{10403,1}}, id=1, extend={}},
			{period=7, goal_id=57001, day=4, desc="累充1000元", condition={{'charge_rmb',1000}}, show_icon=131, award1={{3,2000},{14001,1}}, id=2, extend={}}
		},
		[3] = {{period=7, goal_id=47000, day=3, desc="登陆1次", condition={{'login',3}}, show_icon=401, award1={{3,100},{37001,5}}, id=1, extend={}},
			{period=7, goal_id=47001, day=3, desc="累充500元", condition={{'charge_rmb',500}}, show_icon=131, award1={{3,1000},{37002,1}}, id=2, extend={}}
		},
		[2] = {{period=7, goal_id=37000, day=2, desc="登陆1次", condition={{'login',2}}, show_icon=401, award1={{3,100},{10002,5}}, id=1, extend={}},
			{period=7, goal_id=37001, day=2, desc="累充200元", condition={{'charge_rmb',200}}, show_icon=131, award1={{3,400},{10403,3}}, id=2, extend={}}
		},
		[1] = {{period=7, goal_id=27000, day=1, desc="登陆1次", condition={{'login',1}}, show_icon=401, award1={{3,100},{10450,100}}, id=1, extend={}},
			{period=7, goal_id=27001, day=1, desc="累充100元", condition={{'charge_rmb',100}}, show_icon=131, award1={{3,200},{10450,500}}, id=2, extend={}}
		},
	},
	[4] = {
		[7] = {{period=4, goal_id=83000, day=7, desc="登陆1次", condition={{'login',7}}, show_icon=401, award1={{3,400},{14001,1}}, id=1, extend={}},
			{period=4, goal_id=83001, day=7, desc="累充5000元", condition={{'charge_rmb',5000}}, show_icon=131, award1={{3,15000},{28903,50}}, id=2, extend={}}
		},
		[6] = {{period=4, goal_id=73000, day=6, desc="登陆1次", condition={{'login',6}}, show_icon=401, award1={{3,350},{37001,5}}, id=1, extend={}},
			{period=4, goal_id=73001, day=6, desc="累充3000元", condition={{'charge_rmb',3000}}, show_icon=131, award1={{3,7000},{38051,1}}, id=2, extend={}}
		},
		[5] = {{period=4, goal_id=63000, day=5, desc="登陆1次", condition={{'login',5}}, show_icon=401, award1={{3,300},{40108,1}}, id=1, extend={}},
			{period=4, goal_id=63001, day=5, desc="累充2000元", condition={{'charge_rmb',2000}}, show_icon=131, award1={{3,5000},{10450,5000}}, id=2, extend={}}
		},
		[4] = {{period=4, goal_id=53000, day=4, desc="登陆1次", condition={{'login',4}}, show_icon=401, award1={{3,250},{10002,5}}, id=1, extend={}},
			{period=4, goal_id=53001, day=4, desc="累充1000元", condition={{'charge_rmb',1000}}, show_icon=131, award1={{3,2000},{14001,1}}, id=2, extend={}}
		},
		[3] = {{period=4, goal_id=43000, day=3, desc="登陆1次", condition={{'login',3}}, show_icon=401, award1={{3,200},{10103,5}}, id=1, extend={}},
			{period=4, goal_id=43001, day=3, desc="累充500元", condition={{'charge_rmb',500}}, show_icon=131, award1={{3,1500},{37002,1}}, id=2, extend={}}
		},
		[2] = {{period=4, goal_id=33000, day=2, desc="登陆1次", condition={{'login',2}}, show_icon=401, award1={{3,150},{10403,1}}, id=1, extend={}},
			{period=4, goal_id=33001, day=2, desc="累充200元", condition={{'charge_rmb',200}}, show_icon=131, award1={{3,1000},{10403,3}}, id=2, extend={}}
		},
		[1] = {{period=4, goal_id=23000, day=1, desc="登陆1次", condition={{'login',1}}, show_icon=401, award1={{3,100},{10001,100}}, id=1, extend={}},
			{period=4, goal_id=23001, day=1, desc="累充100元", condition={{'charge_rmb',100}}, show_icon=131, award1={{3,500},{10001,500}}, id=2, extend={}}
		},
	},
	[1] = {
		[7] = {{period=1, goal_id=80000, day=7, desc="登陆1次", condition={{'login',7}}, show_icon=401, award1={{3,400},{27306,1}}, id=1, extend={}},
			{period=1, goal_id=80001, day=7, desc="开服累充5000元", condition={{'charge_rmb',5000}}, show_icon=131, award1={{3,15000},{27906,50}}, id=2, extend={}}
		},
		[6] = {{period=1, goal_id=70000, day=6, desc="登陆1次", condition={{'login',6}}, show_icon=401, award1={{3,350},{37001,5}}, id=1, extend={}},
			{period=1, goal_id=70001, day=6, desc="开服累充3000元", condition={{'charge_rmb',3000}}, show_icon=131, award1={{3,7000},{14002,500}}, id=2, extend={}}
		},
		[5] = {{period=1, goal_id=60000, day=5, desc="登陆1次", condition={{'login',5}}, show_icon=401, award1={{3,300},{40108,1}}, id=1, extend={}},
			{period=1, goal_id=60001, day=5, desc="开服累充2000元", condition={{'charge_rmb',2000}}, show_icon=131, award1={{3,5000},{10450,5000}}, id=2, extend={}}
		},
		[4] = {{period=1, goal_id=50000, day=4, desc="登陆1次", condition={{'login',4}}, show_icon=401, award1={{3,250},{10002,1}}, id=1, extend={}},
			{period=1, goal_id=50001, day=4, desc="开服累充1000元", condition={{'charge_rmb',1000}}, show_icon=131, award1={{3,2000},{14001,1}}, id=2, extend={}}
		},
		[3] = {{period=1, goal_id=40000, day=3, desc="登陆1次", condition={{'login',3}}, show_icon=401, award1={{3,200},{10103,5}}, id=1, extend={}},
			{period=1, goal_id=40001, day=3, desc="开服累充500元", condition={{'charge_rmb',500}}, show_icon=131, award1={{3,1500},{37002,1}}, id=2, extend={}},
			{period=1, goal_id=40011, day=3, desc="开服累充500元", condition={{'charge_rmb',500}}, show_icon=131, award1={{3,1500},{26907,50}}, id=2, extend={}},
			{period=1, goal_id=40021, day=3, desc="开服累充500元", condition={{'charge_rmb',500}}, show_icon=131, award1={{3,1500},{37002,1}}, id=2, extend={}}
		},
		[2] = {{period=1, goal_id=30000, day=2, desc="登陆1次", condition={{'login',2}}, show_icon=401, award1={{3,150},{10403,1}}, id=1, extend={}},
			{period=1, goal_id=30001, day=2, desc="开服累充200元", condition={{'charge_rmb',200}}, show_icon=131, award1={{3,1000},{10450,1000}}, id=2, extend={}}
		},
		[1] = {{period=1, goal_id=20000, day=1, desc="登陆1次", condition={{'login',1}}, show_icon=401, award1={{3,100},{10001,100}}, id=1, extend={}},
			{period=1, goal_id=20001, day=1, desc="开服累充100元", condition={{'charge_rmb',100}}, show_icon=131, award1={{3,500},{10001,500}}, id=2, extend={}}
		},
	},
}
-- -------------------welfarecollection_end---------------------


-- -------------------growthtarget_start-------------------
Config.DayGoalsData.data_growthtarget_length = 3
Config.DayGoalsData.data_growthtarget = {
	[7] = {
		[7] = {{period=7, goal_id=74210, day=7, target_type=1, type_name="搏击高手", desc="竞技场段位积分达到1100", progress={{cli_label="evt_arena_score2",target=1100,target_val=1,param={}}}, show_icon=158, award1={{1,10000},{3,50}}, lev=1, id=1, extend={}},
			{period=7, goal_id=74220, day=7, target_type=1, type_name="搏击高手", desc="竞技场段位积分达到1200", progress={{cli_label="evt_arena_score2",target=1200,target_val=1,param={}}}, show_icon=158, award1={{1,20000},{3,50}}, lev=1, id=2, extend={}},
			{period=7, goal_id=74230, day=7, target_type=1, type_name="搏击高手", desc="竞技场段位积分达到1300", progress={{cli_label="evt_arena_score2",target=1300,target_val=1,param={}}}, show_icon=158, award1={{1,30000},{3,50}}, lev=1, id=3, extend={}},
			{period=7, goal_id=74240, day=7, target_type=1, type_name="搏击高手", desc="竞技场段位积分达到1400", progress={{cli_label="evt_arena_score2",target=1400,target_val=1,param={}}}, show_icon=158, award1={{1,40000},{3,50}}, lev=1, id=4, extend={}},
			{period=7, goal_id=74250, day=7, target_type=1, type_name="搏击高手", desc="竞技场段位积分达到1500", progress={{cli_label="evt_arena_score2",target=1500,target_val=1,param={}}}, show_icon=158, award1={{1,50000},{3,50}}, lev=1, id=5, extend={}},
			{period=7, goal_id=74260, day=7, target_type=1, type_name="搏击高手", desc="竞技场段位积分达到1700", progress={{cli_label="evt_arena_score2",target=1700,target_val=1,param={}}}, show_icon=158, award1={{1,60000},{3,50}}, lev=1, id=6, extend={}},
			{period=7, goal_id=79210, day=7, target_type=2, type_name="符文重铸", desc="符文重铸1次", progress={{cli_label="evt_artifact_recast",target=0,target_val=1,param={}}}, show_icon=404, award1={{1,10000},{26900,1}}, lev=1, id=7, extend={}},
			{period=7, goal_id=79220, day=7, target_type=2, type_name="符文重铸", desc="符文重铸2次", progress={{cli_label="evt_artifact_recast",target=0,target_val=2,param={}}}, show_icon=404, award1={{1,20000},{26900,1}}, lev=1, id=8, extend={}},
			{period=7, goal_id=79230, day=7, target_type=2, type_name="符文重铸", desc="符文重铸3次", progress={{cli_label="evt_artifact_recast",target=0,target_val=3,param={}}}, show_icon=404, award1={{1,30000},{26900,1}}, lev=1, id=9, extend={}},
			{period=7, goal_id=79240, day=7, target_type=2, type_name="符文重铸", desc="符文重铸5次", progress={{cli_label="evt_artifact_recast",target=0,target_val=5,param={}}}, show_icon=404, award1={{1,40000},{26900,1}}, lev=1, id=10, extend={}},
			{period=7, goal_id=79250, day=7, target_type=2, type_name="符文重铸", desc="符文重铸7次", progress={{cli_label="evt_artifact_recast",target=0,target_val=7,param={}}}, show_icon=404, award1={{1,50000},{26900,1}}, lev=1, id=11, extend={}},
			{period=7, goal_id=79260, day=7, target_type=2, type_name="符文重铸", desc="符文重铸10次", progress={{cli_label="evt_artifact_recast",target=0,target_val=10,param={}}}, show_icon=404, award1={{1,60000},{26900,2}}, lev=1, id=12, extend={}}
		},
		[6] = {{period=7, goal_id=79010, day=6, target_type=1, type_name="宝物猎人", desc="开启1个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=1,param={}}}, show_icon=407, award1={{1,10000},{3,50}}, lev=1, id=1, extend={}},
			{period=7, goal_id=79020, day=6, target_type=1, type_name="宝物猎人", desc="开启5个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=5,param={}}}, show_icon=407, award1={{1,20000},{3,50}}, lev=1, id=2, extend={}},
			{period=7, goal_id=79030, day=6, target_type=1, type_name="宝物猎人", desc="开启10个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=10,param={}}}, show_icon=407, award1={{1,30000},{3,50}}, lev=1, id=3, extend={}},
			{period=7, goal_id=79040, day=6, target_type=1, type_name="宝物猎人", desc="开启15个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=15,param={}}}, show_icon=407, award1={{1,40000},{3,50}}, lev=1, id=4, extend={}},
			{period=7, goal_id=79050, day=6, target_type=1, type_name="宝物猎人", desc="开启20个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=20,param={}}}, show_icon=407, award1={{1,50000},{3,50}}, lev=1, id=5, extend={}},
			{period=7, goal_id=79060, day=6, target_type=1, type_name="宝物猎人", desc="开启25个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=25,param={}}}, show_icon=407, award1={{1,60000},{3,50}}, lev=1, id=6, extend={}},
			{period=7, goal_id=79110, day=6, target_type=2, type_name="幸运召唤", desc="高级召唤5次", progress={{cli_label="evt_recruit",target=300,target_val=5,param={}}}, show_icon=120, award1={{1,10000},{26900,1}}, lev=1, id=7, extend={}},
			{period=7, goal_id=79120, day=6, target_type=2, type_name="幸运召唤", desc="高级召唤10次", progress={{cli_label="evt_recruit",target=300,target_val=10,param={}}}, show_icon=120, award1={{1,20000},{26900,1}}, lev=1, id=8, extend={}},
			{period=7, goal_id=79130, day=6, target_type=2, type_name="幸运召唤", desc="高级召唤15次", progress={{cli_label="evt_recruit",target=300,target_val=15,param={}}}, show_icon=120, award1={{1,30000},{26900,1}}, lev=1, id=9, extend={}},
			{period=7, goal_id=79140, day=6, target_type=2, type_name="幸运召唤", desc="高级召唤20次", progress={{cli_label="evt_recruit",target=300,target_val=20,param={}}}, show_icon=120, award1={{1,40000},{26900,1}}, lev=1, id=10, extend={}},
			{period=7, goal_id=79150, day=6, target_type=2, type_name="幸运召唤", desc="高级召唤25次", progress={{cli_label="evt_recruit",target=300,target_val=25,param={}}}, show_icon=120, award1={{1,50000},{26900,1}}, lev=1, id=11, extend={}},
			{period=7, goal_id=79160, day=6, target_type=2, type_name="幸运召唤", desc="高级召唤30次", progress={{cli_label="evt_recruit",target=300,target_val=30,param={}}}, show_icon=120, award1={{1,60000},{26900,2}}, lev=1, id=12, extend={}}
		},
		[5] = {{period=7, goal_id=77010, day=5, target_type=1, type_name="神之祝福", desc="冒险使用神之祝福2次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=2,param={}}}, show_icon=407, award1={{1,10000},{3,50}}, lev=1, id=1, extend={}},
			{period=7, goal_id=77020, day=5, target_type=1, type_name="神之祝福", desc="冒险使用神之祝福5次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=5,param={}}}, show_icon=407, award1={{1,20000},{3,50}}, lev=1, id=2, extend={}},
			{period=7, goal_id=77030, day=5, target_type=1, type_name="神之祝福", desc="冒险使用神之祝福8次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=8,param={}}}, show_icon=407, award1={{1,30000},{3,50}}, lev=1, id=3, extend={}},
			{period=7, goal_id=77040, day=5, target_type=1, type_name="神之祝福", desc="冒险使用神之祝福12次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=12,param={}}}, show_icon=407, award1={{1,40000},{3,50}}, lev=1, id=4, extend={}},
			{period=7, goal_id=77050, day=5, target_type=1, type_name="神之祝福", desc="冒险使用神之祝福16次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=16,param={}}}, show_icon=407, award1={{1,50000},{3,50}}, lev=1, id=5, extend={}},
			{period=7, goal_id=77060, day=5, target_type=1, type_name="神之祝福", desc="冒险使用神之祝福20次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=20,param={}}}, show_icon=407, award1={{1,60000},{3,50}}, lev=1, id=6, extend={}},
			{period=7, goal_id=78010, day=5, target_type=2, type_name="勇者征召", desc="活动期间获取1个5星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=1,param={{'bind_star',5}}}}, show_icon=155, award1={{1,10000},{26900,1}}, lev=1, id=7, extend={}},
			{period=7, goal_id=78020, day=5, target_type=2, type_name="勇者征召", desc="活动期间获取2个5星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=2,param={{'bind_star',5}}}}, show_icon=155, award1={{1,20000},{26900,1}}, lev=1, id=8, extend={}},
			{period=7, goal_id=78030, day=5, target_type=2, type_name="勇者征召", desc="活动期间获取3个5星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=3,param={{'bind_star',5}}}}, show_icon=155, award1={{1,30000},{26900,1}}, lev=1, id=9, extend={}},
			{period=7, goal_id=78040, day=5, target_type=2, type_name="勇者征召", desc="活动期间获取5个5星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=5,param={{'bind_star',5}}}}, show_icon=155, award1={{1,40000},{26900,1}}, lev=1, id=10, extend={}},
			{period=7, goal_id=78050, day=5, target_type=2, type_name="勇者征召", desc="活动期间获取1个6星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=1,param={{'bind_star',6}}}}, show_icon=155, award1={{1,50000},{26900,1}}, lev=1, id=11, extend={}},
			{period=7, goal_id=78060, day=5, target_type=2, type_name="勇者征召", desc="活动期间获取2个6星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=2,param={{'bind_star',6}}}}, show_icon=155, award1={{1,60000},{26900,2}}, lev=1, id=12, extend={}}
		},
		[4] = {{period=7, goal_id=76010, day=4, target_type=1, type_name="远航之路", desc="完成10个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=10,param={}}}, show_icon=126, award1={{1,10000},{3,50}}, lev=1, id=1, extend={}},
			{period=7, goal_id=76020, day=4, target_type=1, type_name="远航之路", desc="完成20个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=20,param={}}}, show_icon=126, award1={{1,20000},{3,50}}, lev=1, id=2, extend={}},
			{period=7, goal_id=76030, day=4, target_type=1, type_name="远航之路", desc="完成30个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=30,param={}}}, show_icon=126, award1={{1,30000},{3,50}}, lev=1, id=3, extend={}},
			{period=7, goal_id=76040, day=4, target_type=1, type_name="远航之路", desc="完成50个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=50,param={}}}, show_icon=126, award1={{1,40000},{3,50}}, lev=1, id=4, extend={}},
			{period=7, goal_id=76050, day=4, target_type=1, type_name="远航之路", desc="完成5个紫色品质以上远航任务", progress={{cli_label="evt_shipping",target=0,target_val=5,param={3}}}, show_icon=126, award1={{1,50000},{3,50}}, lev=1, id=5, extend={}},
			{period=7, goal_id=76060, day=4, target_type=1, type_name="远航之路", desc="完成10个紫色品质以上远航任务", progress={{cli_label="evt_shipping",target=0,target_val=10,param={3}}}, show_icon=126, award1={{1,60000},{3,50}}, lev=1, id=6, extend={}},
			{period=7, goal_id=76110, day=4, target_type=2, type_name="远航任务", desc="刷新5次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=5,param={}}}, show_icon=126, award1={{1,10000},{26900,1}}, lev=1, id=7, extend={}},
			{period=7, goal_id=76120, day=4, target_type=2, type_name="远航任务", desc="刷新10次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=10,param={}}}, show_icon=126, award1={{1,20000},{26900,1}}, lev=1, id=8, extend={}},
			{period=7, goal_id=76130, day=4, target_type=2, type_name="远航任务", desc="刷新15次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=15,param={}}}, show_icon=126, award1={{1,30000},{26900,1}}, lev=1, id=9, extend={}},
			{period=7, goal_id=76140, day=4, target_type=2, type_name="远航任务", desc="刷新20次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=20,param={}}}, show_icon=126, award1={{1,40000},{26900,1}}, lev=1, id=10, extend={}},
			{period=7, goal_id=76150, day=4, target_type=2, type_name="远航任务", desc="刷新30次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=30,param={}}}, show_icon=126, award1={{1,50000},{26900,1}}, lev=1, id=11, extend={}},
			{period=7, goal_id=76160, day=4, target_type=2, type_name="远航任务", desc="刷新40次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=40,param={}}}, show_icon=126, award1={{1,60000},{26900,2}}, lev=1, id=12, extend={}}
		},
		[3] = {{period=7, goal_id=74310, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫2个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=2,param={}}}, show_icon=151, award1={{1,10000},{3,50}}, lev=1, id=1, extend={71110}},
			{period=7, goal_id=74320, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫10个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=10,param={}}}, show_icon=151, award1={{1,20000},{3,50}}, lev=1, id=2, extend={71120}},
			{period=7, goal_id=74330, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫15个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=15,param={}}}, show_icon=151, award1={{1,30000},{3,50}}, lev=1, id=3, extend={}},
			{period=7, goal_id=74340, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫20个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=20,param={}}}, show_icon=151, award1={{1,40000},{3,50}}, lev=1, id=4, extend={}},
			{period=7, goal_id=74350, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫25个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=25,param={}}}, show_icon=151, award1={{1,50000},{3,50}}, lev=1, id=5, extend={}},
			{period=7, goal_id=74360, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫30个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=30,param={}}}, show_icon=151, award1={{1,60000},{3,50}}, lev=1, id=6, extend={}},
			{period=7, goal_id=74110, day=3, target_type=2, type_name="符文熔炼", desc="合成符文1次", progress={{cli_label="evt_artifact_compose_quality",target=0,target_val=1,param={}}}, show_icon=408, award1={{1,10000},{26900,1}}, lev=1, id=7, extend={}},
			{period=7, goal_id=74120, day=3, target_type=2, type_name="符文熔炼", desc="合成符文3次", progress={{cli_label="evt_artifact_compose_quality",target=0,target_val=3,param={}}}, show_icon=408, award1={{1,20000},{26900,1}}, lev=1, id=8, extend={}},
			{period=7, goal_id=74130, day=3, target_type=2, type_name="符文熔炼", desc="合成符文5次", progress={{cli_label="evt_artifact_compose_quality",target=0,target_val=5,param={}}}, show_icon=408, award1={{1,30000},{26900,1}}, lev=1, id=9, extend={}},
			{period=7, goal_id=74140, day=3, target_type=2, type_name="符文熔炼", desc="合成符文7次", progress={{cli_label="evt_artifact_compose_quality",target=0,target_val=7,param={}}}, show_icon=408, award1={{1,40000},{26900,1}}, lev=1, id=10, extend={}},
			{period=7, goal_id=74150, day=3, target_type=2, type_name="符文熔炼", desc="合成符文9次", progress={{cli_label="evt_artifact_compose_quality",target=0,target_val=9,param={}}}, show_icon=408, award1={{1,50000},{26900,1}}, lev=1, id=11, extend={}},
			{period=7, goal_id=74160, day=3, target_type=2, type_name="符文熔炼", desc="合成紫色符文1次", progress={{cli_label="evt_artifact_compose_quality",target=0,target_val=1,param={10453}}}, show_icon=408, award1={{1,60000},{26900,2}}, lev=1, id=12, extend={}}
		},
		[2] = {{period=7, goal_id=73010, day=2, target_type=1, type_name="副本之主", desc="完成日常副本10次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=10,param={}}}, show_icon=152, award1={{1,10000},{3,50}}, lev=1, id=1, extend={}},
			{period=7, goal_id=73020, day=2, target_type=1, type_name="副本之主", desc="完成日常副本20次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=20,param={}}}, show_icon=152, award1={{1,20000},{3,50}}, lev=1, id=2, extend={}},
			{period=7, goal_id=73030, day=2, target_type=1, type_name="副本之主", desc="完成日常副本30次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=30,param={}}}, show_icon=152, award1={{1,30000},{3,50}}, lev=1, id=3, extend={}},
			{period=7, goal_id=73040, day=2, target_type=1, type_name="副本之主", desc="完成日常副本40次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=40,param={}}}, show_icon=152, award1={{1,40000},{3,50}}, lev=1, id=4, extend={}},
			{period=7, goal_id=73050, day=2, target_type=1, type_name="副本之主", desc="完成日常副本50次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=50,param={}}}, show_icon=152, award1={{1,50000},{3,50}}, lev=1, id=5, extend={}},
			{period=7, goal_id=73060, day=2, target_type=1, type_name="副本之主", desc="完成日常副本60次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=60,param={}}}, show_icon=152, award1={{1,60000},{3,50}}, lev=1, id=6, extend={}},
			{period=7, goal_id=74010, day=2, target_type=2, type_name="试炼之塔", desc="试练塔通关1次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=1,param={}}}, show_icon=160, award1={{1,10000},{26900,1}}, lev=1, id=7, extend={}},
			{period=7, goal_id=74020, day=2, target_type=2, type_name="试炼之塔", desc="试练塔通关5次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=5,param={}}}, show_icon=160, award1={{1,20000},{26900,1}}, lev=1, id=8, extend={}},
			{period=7, goal_id=74030, day=2, target_type=2, type_name="试炼之塔", desc="试练塔通关10次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=10,param={}}}, show_icon=160, award1={{1,30000},{26900,1}}, lev=1, id=9, extend={}},
			{period=7, goal_id=74040, day=2, target_type=2, type_name="试炼之塔", desc="试练塔通关15次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=15,param={}}}, show_icon=160, award1={{1,40000},{26900,1}}, lev=1, id=10, extend={}},
			{period=7, goal_id=74050, day=2, target_type=2, type_name="试炼之塔", desc="试练塔通关20次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=20,param={}}}, show_icon=160, award1={{1,50000},{26900,1}}, lev=1, id=11, extend={}},
			{period=7, goal_id=74060, day=2, target_type=2, type_name="试炼之塔", desc="试练塔通关25次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=25,param={}}}, show_icon=160, award1={{1,60000},{26900,2}}, lev=1, id=12, extend={}}
		},
		[1] = {{period=7, goal_id=71010, day=1, target_type=1, type_name="竞技风云", desc="挑战10次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=10,param={}}}, show_icon=158, award1={{1,10000},{3,50}}, lev=1, id=1, extend={}},
			{period=7, goal_id=71020, day=1, target_type=1, type_name="竞技风云", desc="挑战20次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=20,param={}}}, show_icon=158, award1={{1,20000},{3,50}}, lev=1, id=2, extend={}},
			{period=7, goal_id=71030, day=1, target_type=1, type_name="竞技风云", desc="挑战40次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=40,param={}}}, show_icon=158, award1={{1,30000},{3,50}}, lev=1, id=3, extend={}},
			{period=7, goal_id=71040, day=1, target_type=1, type_name="竞技风云", desc="挑战60次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=60,param={}}}, show_icon=158, award1={{1,40000},{3,50}}, lev=1, id=4, extend={}},
			{period=7, goal_id=71050, day=1, target_type=1, type_name="竞技风云", desc="挑战80次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=80,param={}}}, show_icon=158, award1={{1,50000},{3,50}}, lev=1, id=5, extend={}},
			{period=7, goal_id=71060, day=1, target_type=1, type_name="竞技风云", desc="挑战100次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=100,param={}}}, show_icon=158, award1={{1,60000},{3,50}}, lev=1, id=6, extend={}},
			{period=7, goal_id=72010, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战5次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=5,param={}}}, show_icon=146, award1={{1,10000},{26900,1}}, lev=1, id=7, extend={}},
			{period=7, goal_id=72020, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战10次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=10,param={}}}, show_icon=146, award1={{1,20000},{26900,1}}, lev=1, id=8, extend={}},
			{period=7, goal_id=72030, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战15次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=15,param={}}}, show_icon=146, award1={{1,30000},{26900,1}}, lev=1, id=9, extend={}},
			{period=7, goal_id=72040, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战20次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=20,param={}}}, show_icon=146, award1={{1,40000},{26900,1}}, lev=1, id=10, extend={}},
			{period=7, goal_id=72050, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战25次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=25,param={}}}, show_icon=146, award1={{1,50000},{26900,2}}, lev=1, id=11, extend={}},
			{period=7, goal_id=72060, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战32次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=32,param={}}}, show_icon=146, award1={{1,60000},{26900,2}}, lev=1, id=12, extend={}}
		},
	},
	[4] = {
		[7] = {{period=4, goal_id=44210, day=7, target_type=1, type_name="竞技风云", desc="挑战10次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=10,param={}}}, show_icon=158, award1={{1,20000},{3,50}}, lev=1, id=1, extend={}},
			{period=4, goal_id=44220, day=7, target_type=1, type_name="竞技风云", desc="挑战20次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=20,param={}}}, show_icon=158, award1={{1,30000},{3,50}}, lev=1, id=2, extend={}},
			{period=4, goal_id=44230, day=7, target_type=1, type_name="竞技风云", desc="挑战40次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=40,param={}}}, show_icon=158, award1={{1,50000},{3,50}}, lev=1, id=3, extend={}},
			{period=4, goal_id=44240, day=7, target_type=1, type_name="竞技风云", desc="挑战60次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=60,param={}}}, show_icon=158, award1={{1,80000},{3,50}}, lev=1, id=4, extend={}},
			{period=4, goal_id=44250, day=7, target_type=1, type_name="竞技风云", desc="挑战80次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=80,param={}}}, show_icon=158, award1={{1,100000},{3,50}}, lev=1, id=5, extend={}},
			{period=4, goal_id=44260, day=7, target_type=1, type_name="竞技风云", desc="挑战100次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=100,param={}}}, show_icon=158, award1={{1,100000},{3,50}}, lev=1, id=6, extend={}},
			{period=4, goal_id=49210, day=7, target_type=2, type_name="神器强化", desc="神器强化1次", progress={{cli_label="evt_hallows_step_intensify",target=0,target_val=1,param={}}}, show_icon=409, award1={{1,20000},{26905,1}}, lev=1, id=7, extend={}},
			{period=4, goal_id=49220, day=7, target_type=2, type_name="神器强化", desc="神器强化5次", progress={{cli_label="evt_hallows_step_intensify",target=0,target_val=5,param={}}}, show_icon=409, award1={{1,30000},{26905,1}}, lev=1, id=8, extend={}},
			{period=4, goal_id=49230, day=7, target_type=2, type_name="神器强化", desc="神器强化10次", progress={{cli_label="evt_hallows_step_intensify",target=0,target_val=10,param={}}}, show_icon=409, award1={{1,50000},{26905,1}}, lev=1, id=9, extend={}},
			{period=4, goal_id=49240, day=7, target_type=2, type_name="神器强化", desc="神器强化15次", progress={{cli_label="evt_hallows_step_intensify",target=0,target_val=15,param={}}}, show_icon=409, award1={{1,80000},{26905,1}}, lev=1, id=10, extend={}},
			{period=4, goal_id=49250, day=7, target_type=2, type_name="神器强化", desc="神器强化20次", progress={{cli_label="evt_hallows_step_intensify",target=0,target_val=20,param={}}}, show_icon=409, award1={{1,100000},{26905,1}}, lev=1, id=11, extend={}},
			{period=4, goal_id=49260, day=7, target_type=2, type_name="神器强化", desc="神器强化25次", progress={{cli_label="evt_hallows_step_intensify",target=0,target_val=25,param={}}}, show_icon=409, award1={{1,100000},{26905,2}}, lev=1, id=12, extend={}}
		},
		[6] = {{period=4, goal_id=49010, day=6, target_type=1, type_name="副本之主", desc="完成日常副本10次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=10,param={}}}, show_icon=152, award1={{1,20000},{3,50}}, lev=1, id=1, extend={}},
			{period=4, goal_id=49020, day=6, target_type=1, type_name="副本之主", desc="完成日常副本20次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=20,param={}}}, show_icon=152, award1={{1,30000},{3,50}}, lev=1, id=2, extend={}},
			{period=4, goal_id=49030, day=6, target_type=1, type_name="副本之主", desc="完成日常副本30次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=30,param={}}}, show_icon=152, award1={{1,50000},{3,50}}, lev=1, id=3, extend={}},
			{period=4, goal_id=49040, day=6, target_type=1, type_name="副本之主", desc="完成日常副本40次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=40,param={}}}, show_icon=152, award1={{1,80000},{3,50}}, lev=1, id=4, extend={}},
			{period=4, goal_id=49050, day=6, target_type=1, type_name="副本之主", desc="完成日常副本50次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=50,param={}}}, show_icon=152, award1={{1,100000},{3,50}}, lev=1, id=5, extend={}},
			{period=4, goal_id=49060, day=6, target_type=1, type_name="副本之主", desc="完成日常副本60次", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=60,param={}}}, show_icon=152, award1={{1,100000},{3,50}}, lev=1, id=6, extend={}},
			{period=4, goal_id=49110, day=6, target_type=2, type_name="幸运达人", desc="寻宝10次", progress={{cli_label="evt_dial",target=0,target_val=10,param={}}}, show_icon=405, award1={{1,20000},{26905,1}}, lev=1, id=7, extend={}},
			{period=4, goal_id=49120, day=6, target_type=2, type_name="幸运达人", desc="寻宝20次", progress={{cli_label="evt_dial",target=0,target_val=20,param={}}}, show_icon=405, award1={{1,30000},{26905,1}}, lev=1, id=8, extend={}},
			{period=4, goal_id=49130, day=6, target_type=2, type_name="幸运达人", desc="寻宝40次", progress={{cli_label="evt_dial",target=0,target_val=40,param={}}}, show_icon=405, award1={{1,50000},{26905,1}}, lev=1, id=9, extend={}},
			{period=4, goal_id=49140, day=6, target_type=2, type_name="幸运达人", desc="寻宝60次", progress={{cli_label="evt_dial",target=0,target_val=60,param={}}}, show_icon=405, award1={{1,80000},{26905,1}}, lev=1, id=10, extend={}},
			{period=4, goal_id=49150, day=6, target_type=2, type_name="幸运达人", desc="寻宝80次", progress={{cli_label="evt_dial",target=0,target_val=80,param={}}}, show_icon=405, award1={{1,100000},{26905,1}}, lev=1, id=11, extend={}},
			{period=4, goal_id=49160, day=6, target_type=2, type_name="幸运达人", desc="寻宝100次", progress={{cli_label="evt_dial",target=0,target_val=100,param={}}}, show_icon=405, award1={{1,100000},{26905,2}}, lev=1, id=12, extend={}}
		},
		[5] = {{period=4, goal_id=47010, day=5, target_type=1, type_name="试炼之塔", desc="试练塔通关5次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=5,param={}}}, show_icon=160, award1={{1,20000},{3,50}}, lev=1, id=1, extend={}},
			{period=4, goal_id=47020, day=5, target_type=1, type_name="试炼之塔", desc="试练塔通关10次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=10,param={}}}, show_icon=160, award1={{1,30000},{3,50}}, lev=1, id=2, extend={}},
			{period=4, goal_id=47030, day=5, target_type=1, type_name="试炼之塔", desc="试练塔通关15次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=15,param={}}}, show_icon=160, award1={{1,50000},{3,50}}, lev=1, id=3, extend={}},
			{period=4, goal_id=47040, day=5, target_type=1, type_name="试炼之塔", desc="试练塔通关20次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=20,param={}}}, show_icon=160, award1={{1,80000},{3,50}}, lev=1, id=4, extend={}},
			{period=4, goal_id=47050, day=5, target_type=1, type_name="试炼之塔", desc="试练塔通关25次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=25,param={}}}, show_icon=160, award1={{1,100000},{3,50}}, lev=1, id=5, extend={}},
			{period=4, goal_id=47060, day=5, target_type=1, type_name="试炼之塔", desc="试练塔通关30次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=30,param={}}}, show_icon=160, award1={{1,100000},{3,50}}, lev=1, id=6, extend={}},
			{period=4, goal_id=48010, day=5, target_type=2, type_name="勇者征召", desc="获取1个5星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=1,param={{'bind_star',5}}}}, show_icon=155, award1={{1,20000},{26905,1}}, lev=1, id=7, extend={}},
			{period=4, goal_id=48020, day=5, target_type=2, type_name="勇者征召", desc="获取2个5星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=2,param={{'bind_star',5}}}}, show_icon=155, award1={{1,30000},{26905,1}}, lev=1, id=8, extend={}},
			{period=4, goal_id=48030, day=5, target_type=2, type_name="勇者征召", desc="获取3个5星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=3,param={{'bind_star',5}}}}, show_icon=155, award1={{1,50000},{26905,1}}, lev=1, id=9, extend={}},
			{period=4, goal_id=48040, day=5, target_type=2, type_name="勇者征召", desc="获取5个5星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=5,param={{'bind_star',5}}}}, show_icon=155, award1={{1,80000},{26905,1}}, lev=1, id=10, extend={}},
			{period=4, goal_id=48050, day=5, target_type=2, type_name="勇者征召", desc="获取1个6星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=1,param={{'bind_star',6}}}}, show_icon=155, award1={{1,100000},{26905,1}}, lev=1, id=11, extend={}},
			{period=4, goal_id=48060, day=5, target_type=2, type_name="勇者征召", desc="获取2个6星英雄", progress={{cli_label="evt_partner_add_new",target=0,target_val=2,param={{'bind_star',6}}}}, show_icon=155, award1={{1,100000},{26905,2}}, lev=1, id=12, extend={}}
		},
		[4] = {{period=4, goal_id=46010, day=4, target_type=1, type_name="远航之路", desc="完成10个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=10,param={}}}, show_icon=126, award1={{1,20000},{3,50}}, lev=1, id=1, extend={}},
			{period=4, goal_id=46020, day=4, target_type=1, type_name="远航之路", desc="完成20个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=20,param={}}}, show_icon=126, award1={{1,30000},{3,50}}, lev=1, id=2, extend={}},
			{period=4, goal_id=46030, day=4, target_type=1, type_name="远航之路", desc="完成30个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=30,param={}}}, show_icon=126, award1={{1,50000},{3,50}}, lev=1, id=3, extend={}},
			{period=4, goal_id=46040, day=4, target_type=1, type_name="远航之路", desc="完成50个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=50,param={}}}, show_icon=126, award1={{1,80000},{3,50}}, lev=1, id=4, extend={}},
			{period=4, goal_id=46050, day=4, target_type=1, type_name="远航之路", desc="完成5个紫色品质以上远航任务", progress={{cli_label="evt_shipping",target=0,target_val=5,param={3}}}, show_icon=126, award1={{1,100000},{3,50}}, lev=1, id=5, extend={}},
			{period=4, goal_id=46060, day=4, target_type=1, type_name="远航之路", desc="完成10个紫色品质以上远航任务", progress={{cli_label="evt_shipping",target=0,target_val=10,param={3}}}, show_icon=126, award1={{1,100000},{3,50}}, lev=1, id=6, extend={}},
			{period=4, goal_id=46110, day=4, target_type=2, type_name="远航任务", desc="刷新5次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=5,param={}}}, show_icon=126, award1={{1,20000},{26905,1}}, lev=1, id=7, extend={}},
			{period=4, goal_id=46120, day=4, target_type=2, type_name="远航任务", desc="刷新10次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=10,param={}}}, show_icon=126, award1={{1,30000},{26905,1}}, lev=1, id=8, extend={}},
			{period=4, goal_id=46130, day=4, target_type=2, type_name="远航任务", desc="刷新15次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=15,param={}}}, show_icon=126, award1={{1,50000},{26905,1}}, lev=1, id=9, extend={}},
			{period=4, goal_id=46140, day=4, target_type=2, type_name="远航任务", desc="刷新20次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=20,param={}}}, show_icon=126, award1={{1,80000},{26905,1}}, lev=1, id=10, extend={}},
			{period=4, goal_id=46150, day=4, target_type=2, type_name="远航任务", desc="刷新30次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=30,param={}}}, show_icon=126, award1={{1,100000},{26905,1}}, lev=1, id=11, extend={}},
			{period=4, goal_id=46160, day=4, target_type=2, type_name="远航任务", desc="刷新40次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=40,param={}}}, show_icon=126, award1={{1,100000},{26905,2}}, lev=1, id=12, extend={}}
		},
		[3] = {{period=4, goal_id=44310, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫2个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=2,param={}}}, show_icon=151, award1={{1,20000},{3,50}}, lev=1, id=1, extend={41110}},
			{period=4, goal_id=44320, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫10个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=10,param={}}}, show_icon=151, award1={{1,30000},{3,50}}, lev=1, id=2, extend={41120}},
			{period=4, goal_id=44330, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫15个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=15,param={}}}, show_icon=151, award1={{1,50000},{3,50}}, lev=1, id=3, extend={41130}},
			{period=4, goal_id=44340, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫20个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=20,param={}}}, show_icon=151, award1={{1,80000},{3,50}}, lev=1, id=4, extend={41140}},
			{period=4, goal_id=44350, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫25个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=25,param={}}}, show_icon=151, award1={{1,100000},{3,50}}, lev=1, id=5, extend={41150}},
			{period=4, goal_id=44360, day=3, target_type=1, type_name="位面探险", desc="位面战胜守卫30个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=30,param={}}}, show_icon=151, award1={{1,100000},{3,50}}, lev=1, id=6, extend={41160}},
			{period=4, goal_id=44110, day=3, target_type=2, type_name="幸运召唤", desc="高级召唤5次", progress={{cli_label="evt_recruit",target=300,target_val=5,param={}}}, show_icon=120, award1={{1,20000},{26905,1}}, lev=1, id=7, extend={}},
			{period=4, goal_id=44120, day=3, target_type=2, type_name="幸运召唤", desc="高级召唤10次", progress={{cli_label="evt_recruit",target=300,target_val=10,param={}}}, show_icon=120, award1={{1,30000},{26905,1}}, lev=1, id=8, extend={}},
			{period=4, goal_id=44130, day=3, target_type=2, type_name="幸运召唤", desc="高级召唤15次", progress={{cli_label="evt_recruit",target=300,target_val=15,param={}}}, show_icon=120, award1={{1,50000},{26905,1}}, lev=1, id=9, extend={}},
			{period=4, goal_id=44140, day=3, target_type=2, type_name="幸运召唤", desc="高级召唤20次", progress={{cli_label="evt_recruit",target=300,target_val=20,param={}}}, show_icon=120, award1={{1,80000},{26905,1}}, lev=1, id=10, extend={}},
			{period=4, goal_id=44150, day=3, target_type=2, type_name="幸运召唤", desc="高级召唤25次", progress={{cli_label="evt_recruit",target=300,target_val=25,param={}}}, show_icon=120, award1={{1,100000},{26905,1}}, lev=1, id=11, extend={}},
			{period=4, goal_id=44160, day=3, target_type=2, type_name="幸运召唤", desc="高级召唤30次", progress={{cli_label="evt_recruit",target=300,target_val=30,param={}}}, show_icon=120, award1={{1,100000},{26905,2}}, lev=1, id=12, extend={}}
		},
		[2] = {{period=4, goal_id=43010, day=2, target_type=1, type_name="宝物猎人", desc="开启1个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=1,param={}}}, show_icon=407, award1={{1,20000},{3,50}}, lev=1, id=1, extend={}},
			{period=4, goal_id=43020, day=2, target_type=1, type_name="宝物猎人", desc="开启5个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=5,param={}}}, show_icon=407, award1={{1,30000},{3,50}}, lev=1, id=2, extend={}},
			{period=4, goal_id=43030, day=2, target_type=1, type_name="宝物猎人", desc="开启10个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=10,param={}}}, show_icon=407, award1={{1,50000},{3,50}}, lev=1, id=3, extend={}},
			{period=4, goal_id=43040, day=2, target_type=1, type_name="宝物猎人", desc="开启15个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=15,param={}}}, show_icon=407, award1={{1,80000},{3,50}}, lev=1, id=4, extend={}},
			{period=4, goal_id=43050, day=2, target_type=1, type_name="宝物猎人", desc="开启20个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=20,param={}}}, show_icon=407, award1={{1,100000},{3,50}}, lev=1, id=5, extend={}},
			{period=4, goal_id=43060, day=2, target_type=1, type_name="宝物猎人", desc="开启25个冒险银宝箱", progress={{cli_label="evt_adventure_treasure_open",target=0,target_val=25,param={}}}, show_icon=407, award1={{1,100000},{3,50}}, lev=1, id=6, extend={}},
			{period=4, goal_id=44010, day=2, target_type=2, type_name="公会发展", desc="公会副本挑战5次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=5,param={}}}, show_icon=146, award1={{1,20000},{26905,1}}, lev=1, id=7, extend={}},
			{period=4, goal_id=44020, day=2, target_type=2, type_name="公会发展", desc="公会副本挑战10次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=10,param={}}}, show_icon=146, award1={{1,30000},{26905,1}}, lev=1, id=8, extend={}},
			{period=4, goal_id=44030, day=2, target_type=2, type_name="公会发展", desc="公会副本挑战15次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=15,param={}}}, show_icon=146, award1={{1,50000},{26905,1}}, lev=1, id=9, extend={}},
			{period=4, goal_id=44040, day=2, target_type=2, type_name="公会发展", desc="公会副本挑战20次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=20,param={}}}, show_icon=146, award1={{1,80000},{26905,1}}, lev=1, id=10, extend={}},
			{period=4, goal_id=44050, day=2, target_type=2, type_name="公会发展", desc="公会副本挑战25次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=25,param={}}}, show_icon=146, award1={{1,100000},{26905,1}}, lev=1, id=11, extend={}},
			{period=4, goal_id=44060, day=2, target_type=2, type_name="公会发展", desc="公会副本挑战35次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=35,param={}}}, show_icon=146, award1={{1,100000},{26905,2}}, lev=1, id=12, extend={}}
		},
		[1] = {{period=4, goal_id=41010, day=1, target_type=1, type_name="冒险猎手", desc="击败冒险怪物10次", progress={{cli_label="evt_adventure_boss_fight_count",target=0,target_val=10,param={}}}, show_icon=407, award1={{1,20000},{3,50}}, lev=1, id=1, extend={}},
			{period=4, goal_id=41020, day=1, target_type=1, type_name="冒险猎手", desc="击败冒险怪物20次", progress={{cli_label="evt_adventure_boss_fight_count",target=0,target_val=20,param={}}}, show_icon=407, award1={{1,30000},{3,50}}, lev=1, id=2, extend={}},
			{period=4, goal_id=41030, day=1, target_type=1, type_name="冒险猎手", desc="击败冒险怪物30次", progress={{cli_label="evt_adventure_boss_fight_count",target=0,target_val=30,param={}}}, show_icon=407, award1={{1,50000},{3,50}}, lev=1, id=3, extend={}},
			{period=4, goal_id=41040, day=1, target_type=1, type_name="冒险猎手", desc="击败冒险怪物40次", progress={{cli_label="evt_adventure_boss_fight_count",target=0,target_val=40,param={}}}, show_icon=407, award1={{1,80000},{3,50}}, lev=1, id=4, extend={}},
			{period=4, goal_id=41050, day=1, target_type=1, type_name="冒险猎手", desc="击败冒险怪物50次", progress={{cli_label="evt_adventure_boss_fight_count",target=0,target_val=50,param={}}}, show_icon=407, award1={{1,100000},{3,50}}, lev=1, id=5, extend={}},
			{period=4, goal_id=41060, day=1, target_type=1, type_name="冒险猎手", desc="击败冒险怪物60次", progress={{cli_label="evt_adventure_boss_fight_count",target=0,target_val=60,param={}}}, show_icon=407, award1={{1,100000},{3,50}}, lev=1, id=6, extend={}},
			{period=4, goal_id=42010, day=1, target_type=2, type_name="神之祝福", desc="冒险使用神之祝福2次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=2,param={}}}, show_icon=407, award1={{1,20000},{26905,1}}, lev=1, id=7, extend={}},
			{period=4, goal_id=42020, day=1, target_type=2, type_name="神之祝福", desc="冒险使用神之祝福5次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=5,param={}}}, show_icon=407, award1={{1,30000},{26905,1}}, lev=1, id=8, extend={}},
			{period=4, goal_id=42030, day=1, target_type=2, type_name="神之祝福", desc="冒险使用神之祝福8次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=8,param={}}}, show_icon=407, award1={{1,50000},{26905,1}}, lev=1, id=9, extend={}},
			{period=4, goal_id=42040, day=1, target_type=2, type_name="神之祝福", desc="冒险使用神之祝福12次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=12,param={}}}, show_icon=407, award1={{1,80000},{26905,1}}, lev=1, id=10, extend={}},
			{period=4, goal_id=42050, day=1, target_type=2, type_name="神之祝福", desc="冒险使用神之祝福16次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=16,param={}}}, show_icon=407, award1={{1,100000},{26905,2}}, lev=1, id=11, extend={}},
			{period=4, goal_id=42060, day=1, target_type=2, type_name="神之祝福", desc="冒险使用神之祝福20次", progress={{cli_label="evt_adventure_item_expend_count",target=0,target_val=20,param={}}}, show_icon=407, award1={{1,100000},{26905,2}}, lev=1, id=12, extend={}}
		},
	},
	[1] = {
		[7] = {{period=1, goal_id=14310, day=7, target_type=1, type_name="位面探险", desc="位面战胜守卫2个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=2,param={}}}, show_icon=151, award1={{1,20000},{14002,10}}, lev=1, id=1, extend={}},
			{period=1, goal_id=14320, day=7, target_type=1, type_name="位面探险", desc="位面战胜守卫10个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=10,param={}}}, show_icon=151, award1={{1,30000},{14002,10}}, lev=1, id=2, extend={}},
			{period=1, goal_id=14330, day=7, target_type=1, type_name="位面探险", desc="位面战胜守卫15个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=15,param={}}}, show_icon=151, award1={{1,50000},{14002,15}}, lev=1, id=3, extend={}},
			{period=1, goal_id=14340, day=7, target_type=1, type_name="位面探险", desc="位面战胜守卫20个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=20,param={}}}, show_icon=151, award1={{1,80000},{14002,15}}, lev=1, id=4, extend={}},
			{period=1, goal_id=14350, day=7, target_type=1, type_name="位面探险", desc="位面战胜守卫25个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=25,param={}}}, show_icon=151, award1={{1,100000},{14002,20}}, lev=1, id=5, extend={}},
			{period=1, goal_id=14360, day=7, target_type=1, type_name="位面探险", desc="位面战胜守卫30个", progress={{cli_label="evt_planes_kill_guard",target=0,target_val=30,param={}}}, show_icon=151, award1={{1,100000},{14002,20}}, lev=1, id=6, extend={}},
			{period=1, goal_id=19210, day=7, target_type=2, type_name="英雄荣耀", desc="拥有5个等级30以上的英雄", progress={{cli_label="evt_partner",target=0,target_val=5,param={{'lev',30}}}}, show_icon=120, award1={{1,20000},{29904,5}}, lev=1, id=7, extend={}},
			{period=1, goal_id=19220, day=7, target_type=2, type_name="英雄荣耀", desc="拥有1个等级99以上的英雄", progress={{cli_label="evt_partner",target=0,target_val=1,param={{'lev',99}}}}, show_icon=120, award1={{1,30000},{29904,5}}, lev=1, id=8, extend={}},
			{period=1, goal_id=19230, day=7, target_type=2, type_name="英雄荣耀", desc="拥有1个等级120以上的英雄", progress={{cli_label="evt_partner",target=0,target_val=1,param={{'lev',120}}}}, show_icon=120, award1={{1,50000},{14002,10}}, lev=1, id=9, extend={}},
			{period=1, goal_id=19240, day=7, target_type=2, type_name="英雄荣耀", desc="拥有5个5星英雄", progress={{cli_label="evt_partner",target=0,target_val=5,param={{'star',5}}}}, show_icon=120, award1={{1,80000},{29904,10}}, lev=1, id=10, extend={}},
			{period=1, goal_id=19250, day=7, target_type=2, type_name="英雄荣耀", desc="拥有1个6星的英雄", progress={{cli_label="evt_partner",target=0,target_val=1,param={{'star',6}}}}, show_icon=120, award1={{1,100000},{14002,20}}, lev=1, id=11, extend={}},
			{period=1, goal_id=19260, day=7, target_type=2, type_name="英雄荣耀", desc="拥有2个6星英雄", progress={{cli_label="evt_partner",target=0,target_val=2,param={{'star',6}}}}, show_icon=120, award1={{1,100000},{14002,20}}, lev=1, id=12, extend={}}
		},
		[6] = {{period=1, goal_id=19010, day=6, target_type=1, type_name="无尽试炼", desc="无尽试炼通关10关", progress={{cli_label="evt_endless_pass",target=0,target_val=10,param={}}}, show_icon=153, award1={{1,20000},{37001,2}}, lev=1, id=1, extend={}},
			{period=1, goal_id=19020, day=6, target_type=1, type_name="无尽试炼", desc="无尽试炼通关20关", progress={{cli_label="evt_endless_pass",target=0,target_val=20,param={}}}, show_icon=153, award1={{1,30000},{37001,2}}, lev=1, id=2, extend={}},
			{period=1, goal_id=19030, day=6, target_type=1, type_name="无尽试炼", desc="无尽试炼通关30关", progress={{cli_label="evt_endless_pass",target=0,target_val=30,param={}}}, show_icon=153, award1={{1,50000},{37001,2}}, lev=1, id=3, extend={}},
			{period=1, goal_id=19040, day=6, target_type=1, type_name="无尽试炼", desc="无尽试炼通关40关", progress={{cli_label="evt_endless_pass",target=0,target_val=40,param={}}}, show_icon=153, award1={{1,80000},{37001,3}}, lev=1, id=4, extend={}},
			{period=1, goal_id=19050, day=6, target_type=1, type_name="无尽试炼", desc="无尽试炼通关50关", progress={{cli_label="evt_endless_pass",target=0,target_val=50,param={}}}, show_icon=153, award1={{1,100000},{37001,3}}, lev=1, id=5, extend={}},
			{period=1, goal_id=19060, day=6, target_type=1, type_name="无尽试炼", desc="无尽试炼派出英雄1次", progress={{cli_label="evt_endless_appoint",target=0,target_val=1,param={}}}, show_icon=153, award1={{1,100000},{37001,3}}, lev=1, id=6, extend={}},
			{period=1, goal_id=19110, day=6, target_type=2, type_name="幸运达人", desc="寻宝10次", progress={{cli_label="evt_dial",target=0,target_val=10,param={}}}, show_icon=405, award1={{1,20000},{37001,1}}, lev=1, id=7, extend={}},
			{period=1, goal_id=19120, day=6, target_type=2, type_name="幸运达人", desc="寻宝20次", progress={{cli_label="evt_dial",target=0,target_val=20,param={}}}, show_icon=405, award1={{1,30000},{10401,3}}, lev=1, id=8, extend={}},
			{period=1, goal_id=19130, day=6, target_type=2, type_name="幸运达人", desc="寻宝30次", progress={{cli_label="evt_dial",target=0,target_val=30,param={}}}, show_icon=405, award1={{1,50000},{37001,2}}, lev=1, id=9, extend={}},
			{period=1, goal_id=19140, day=6, target_type=2, type_name="幸运达人", desc="寻宝40次", progress={{cli_label="evt_dial",target=0,target_val=40,param={}}}, show_icon=405, award1={{1,80000},{10401,3}}, lev=1, id=10, extend={}},
			{period=1, goal_id=19150, day=6, target_type=2, type_name="幸运达人", desc="寻宝60次", progress={{cli_label="evt_dial",target=0,target_val=60,param={}}}, show_icon=405, award1={{1,100000},{10403,1}}, lev=1, id=11, extend={}},
			{period=1, goal_id=19160, day=6, target_type=2, type_name="幸运达人", desc="寻宝80次", progress={{cli_label="evt_dial",target=0,target_val=80,param={}}}, show_icon=405, award1={{1,100000},{10403,2}}, lev=1, id=12, extend={}}
		},
		[5] = {{period=1, goal_id=17010, day=5, target_type=1, type_name="失落神器", desc="解锁3件神器", progress={{cli_label="evt_hallows_activate",target=0,target_val=3,param={'num'}}}, show_icon=201, award1={{1,20000},{72001,10}}, lev=1, id=1, extend={}},
			{period=1, goal_id=17020, day=5, target_type=1, type_name="失落神器", desc="解锁5件神器", progress={{cli_label="evt_hallows_activate",target=0,target_val=5,param={'num'}}}, show_icon=201, award1={{1,30000},{72001,10}}, lev=1, id=2, extend={}},
			{period=1, goal_id=17030, day=5, target_type=1, type_name="失落神器", desc="神器等级达到1级", progress={{cli_label="evt_hallows_step",target=0,target_val=1,param={}}}, show_icon=201, award1={{1,50000},{72001,15}}, lev=1, id=3, extend={}},
			{period=1, goal_id=17040, day=5, target_type=1, type_name="失落神器", desc="神器等级达到2级", progress={{cli_label="evt_hallows_step",target=0,target_val=2,param={}}}, show_icon=201, award1={{1,80000},{72001,15}}, lev=1, id=4, extend={}},
			{period=1, goal_id=17050, day=5, target_type=1, type_name="失落神器", desc="神器等级达到3级", progress={{cli_label="evt_hallows_step",target=0,target_val=3,param={}}}, show_icon=201, award1={{1,100000},{29904,10}}, lev=1, id=5, extend={}},
			{period=1, goal_id=17060, day=5, target_type=1, type_name="失落神器", desc="神器等级达到4级", progress={{cli_label="evt_hallows_step",target=0,target_val=4,param={}}}, show_icon=201, award1={{1,100000},{29904,10}}, lev=1, id=6, extend={}},
			{period=1, goal_id=18010, day=5, target_type=2, type_name="级级攀升", desc="玩家等级达到10级", progress={{cli_label="evt_levup",target=0,target_val=10,param={}}}, show_icon=157, award1={{1,20000},{29904,5}}, lev=1, id=7, extend={}},
			{period=1, goal_id=18020, day=5, target_type=2, type_name="级级攀升", desc="玩家等级达到20级", progress={{cli_label="evt_levup",target=0,target_val=20,param={}}}, show_icon=157, award1={{1,30000},{29904,5}}, lev=1, id=8, extend={}},
			{period=1, goal_id=18030, day=5, target_type=2, type_name="级级攀升", desc="玩家等级达到30级", progress={{cli_label="evt_levup",target=0,target_val=30,param={}}}, show_icon=157, award1={{1,50000},{29904,10}}, lev=1, id=9, extend={}},
			{period=1, goal_id=18040, day=5, target_type=2, type_name="级级攀升", desc="玩家等级达到40级", progress={{cli_label="evt_levup",target=0,target_val=40,param={}}}, show_icon=157, award1={{1,80000},{29904,10}}, lev=1, id=10, extend={}},
			{period=1, goal_id=18050, day=5, target_type=2, type_name="级级攀升", desc="玩家等级达到45级", progress={{cli_label="evt_levup",target=0,target_val=45,param={}}}, show_icon=157, award1={{1,100000},{29904,15}}, lev=1, id=11, extend={}},
			{period=1, goal_id=18060, day=5, target_type=2, type_name="级级攀升", desc="玩家等级达到55级", progress={{cli_label="evt_levup",target=0,target_val=55,param={}}}, show_icon=157, award1={{1,100000},{29904,15}}, lev=1, id=12, extend={}}
		},
		[4] = {{period=1, goal_id=16010, day=4, target_type=1, type_name="远航之路", desc="完成10个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=10,param={}}}, show_icon=126, award1={{1,20000},{10002,2}}, lev=1, id=1, extend={}},
			{period=1, goal_id=16020, day=4, target_type=1, type_name="远航之路", desc="完成20个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=20,param={}}}, show_icon=126, award1={{1,30000},{10002,2}}, lev=1, id=2, extend={}},
			{period=1, goal_id=16030, day=4, target_type=1, type_name="远航之路", desc="完成30个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=30,param={}}}, show_icon=126, award1={{1,50000},{10002,2}}, lev=1, id=3, extend={}},
			{period=1, goal_id=16040, day=4, target_type=1, type_name="远航之路", desc="完成40个远航任务", progress={{cli_label="evt_shipping",target=0,target_val=40,param={}}}, show_icon=126, award1={{1,80000},{10002,4}}, lev=1, id=4, extend={}},
			{period=1, goal_id=16050, day=4, target_type=1, type_name="远航之路", desc="完成5个紫色品质以上远航任务", progress={{cli_label="evt_shipping",target=0,target_val=5,param={3}}}, show_icon=126, award1={{1,100000},{10002,4}}, lev=1, id=5, extend={}},
			{period=1, goal_id=16060, day=4, target_type=1, type_name="远航之路", desc="完成10个紫色品质以上远航任务", progress={{cli_label="evt_shipping",target=0,target_val=10,param={3}}}, show_icon=126, award1={{1,100000},{10002,4}}, lev=1, id=6, extend={}},
			{period=1, goal_id=16110, day=4, target_type=2, type_name="远航任务", desc="刷新5次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=5,param={}}}, show_icon=126, award1={{1,20000},{72001,5}}, lev=1, id=7, extend={}},
			{period=1, goal_id=16120, day=4, target_type=2, type_name="远航任务", desc="刷新10次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=10,param={}}}, show_icon=126, award1={{1,30000},{72001,10}}, lev=1, id=8, extend={}},
			{period=1, goal_id=16130, day=4, target_type=2, type_name="远航任务", desc="刷新15次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=15,param={}}}, show_icon=126, award1={{1,50000},{72001,10}}, lev=1, id=9, extend={}},
			{period=1, goal_id=16140, day=4, target_type=2, type_name="远航任务", desc="刷新20次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=20,param={}}}, show_icon=126, award1={{1,80000},{72001,10}}, lev=1, id=10, extend={}},
			{period=1, goal_id=16150, day=4, target_type=2, type_name="远航任务", desc="刷新30次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=30,param={}}}, show_icon=126, award1={{1,100000},{72001,15}}, lev=1, id=11, extend={}},
			{period=1, goal_id=16160, day=4, target_type=2, type_name="远航任务", desc="刷新40次远航任务", progress={{cli_label="evt_shipping_refresh",target=0,target_val=40,param={}}}, show_icon=126, award1={{1,100000},{72001,15}}, lev=1, id=12, extend={}}
		},
		[3] = {{period=1, goal_id=15010, day=3, target_type=1, type_name="竞技风云", desc="挑战5次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=5,param={}}}, show_icon=158, award1={{1,20000},{10103,2}}, lev=1, id=1, extend={}},
			{period=1, goal_id=15020, day=3, target_type=1, type_name="竞技风云", desc="挑战10次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=10,param={}}}, show_icon=158, award1={{1,30000},{37001,1}}, lev=1, id=2, extend={}},
			{period=1, goal_id=15030, day=3, target_type=1, type_name="竞技风云", desc="挑战15次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=15,param={}}}, show_icon=158, award1={{1,50000},{10103,3}}, lev=1, id=3, extend={}},
			{period=1, goal_id=15040, day=3, target_type=1, type_name="竞技风云", desc="挑战20次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=20,param={}}}, show_icon=158, award1={{1,80000},{37001,2}}, lev=1, id=4, extend={}},
			{period=1, goal_id=15050, day=3, target_type=1, type_name="竞技风云", desc="挑战30次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=30,param={}}}, show_icon=158, award1={{1,100000},{10103,5}}, lev=1, id=5, extend={}},
			{period=1, goal_id=15060, day=3, target_type=1, type_name="竞技风云", desc="挑战40次竞技场", progress={{cli_label="evt_arena_fight",target=0,target_val=40,param={}}}, show_icon=158, award1={{1,100000},{37001,2}}, lev=1, id=6, extend={}},
			{period=1, goal_id=14110, day=3, target_type=2, type_name="融合生辉", desc="融合神殿合成1个5星英雄", progress={{cli_label="evt_partner_star_up",target=5,target_val=1,param={}}}, show_icon=155, award1={{1,20000},{10002,2}}, lev=1, id=7, extend={}},
			{period=1, goal_id=14120, day=3, target_type=2, type_name="融合生辉", desc="融合神殿合成2个5星英雄", progress={{cli_label="evt_partner_star_up",target=5,target_val=2,param={}}}, show_icon=155, award1={{1,30000},{10002,3}}, lev=1, id=8, extend={}},
			{period=1, goal_id=14130, day=3, target_type=2, type_name="融合生辉", desc="融合神殿合成3个5星英雄", progress={{cli_label="evt_partner_star_up",target=5,target_val=3,param={}}}, show_icon=155, award1={{1,50000},{10002,4}}, lev=1, id=9, extend={}},
			{period=1, goal_id=14140, day=3, target_type=2, type_name="融合生辉", desc="融合神殿合成4个5星英雄", progress={{cli_label="evt_partner_star_up",target=5,target_val=4,param={}}}, show_icon=155, award1={{1,80000},{10002,5}}, lev=1, id=10, extend={}},
			{period=1, goal_id=14150, day=3, target_type=2, type_name="融合生辉", desc="融合神殿合成1个6星英雄", progress={{cli_label="evt_partner_star_up",target=6,target_val=1,param={}}}, show_icon=155, award1={{1,100000},{10002,6}}, lev=1, id=11, extend={}},
			{period=1, goal_id=14160, day=3, target_type=2, type_name="融合生辉", desc="融合神殿合成2个6星英雄", progress={{cli_label="evt_partner_star_up",target=6,target_val=2,param={}}}, show_icon=155, award1={{1,100000},{10002,8}}, lev=1, id=12, extend={}}
		},
		[2] = {{period=1, goal_id=13010, day=2, target_type=1, type_name="试炼冒险", desc="试练塔达到10层", progress={{cli_label="evt_star_tower_floor_pass",target=0,target_val=10,param={}}}, show_icon=160, award1={{1,20000},{10103,2}}, lev=1, id=1, extend={}},
			{period=1, goal_id=13020, day=2, target_type=1, type_name="试炼冒险", desc="试练塔达到15层", progress={{cli_label="evt_star_tower_floor_pass",target=0,target_val=15,param={}}}, show_icon=160, award1={{1,30000},{10103,2}}, lev=1, id=2, extend={}},
			{period=1, goal_id=13030, day=2, target_type=1, type_name="试炼冒险", desc="试练塔达到20层", progress={{cli_label="evt_star_tower_floor_pass",target=0,target_val=20,param={}}}, show_icon=160, award1={{1,50000},{10451,1}}, lev=1, id=3, extend={}},
			{period=1, goal_id=13040, day=2, target_type=1, type_name="试炼冒险", desc="试练塔达到30层", progress={{cli_label="evt_star_tower_floor_pass",target=0,target_val=30,param={}}}, show_icon=160, award1={{1,80000},{10103,2}}, lev=1, id=4, extend={}},
			{period=1, goal_id=13050, day=2, target_type=1, type_name="试炼冒险", desc="试练塔达到40层", progress={{cli_label="evt_star_tower_floor_pass",target=0,target_val=40,param={}}}, show_icon=160, award1={{1,100000},{10103,2}}, lev=1, id=5, extend={}},
			{period=1, goal_id=13060, day=2, target_type=1, type_name="试炼冒险", desc="试练塔达到50层", progress={{cli_label="evt_star_tower_floor_pass",target=0,target_val=50,param={}}}, show_icon=160, award1={{1,100000},{10452,1}}, lev=1, id=6, extend={}},
			{period=1, goal_id=14010, day=2, target_type=2, type_name="幸运召唤", desc="普通召唤10次", progress={{cli_label="evt_recruit",target=0,target_val=10,param={}}}, show_icon=120, award1={{1,20000},{10001,50}}, lev=1, id=7, extend={}},
			{period=1, goal_id=14020, day=2, target_type=2, type_name="幸运召唤", desc="普通召唤20次", progress={{cli_label="evt_recruit",target=0,target_val=20,param={}}}, show_icon=120, award1={{1,30000},{10450,80}}, lev=1, id=8, extend={}},
			{period=1, goal_id=14030, day=2, target_type=2, type_name="幸运召唤", desc="高级召唤5次", progress={{cli_label="evt_recruit",target=300,target_val=5,param={}}}, show_icon=120, award1={{1,50000},{10001,80}}, lev=1, id=9, extend={}},
			{period=1, goal_id=14040, day=2, target_type=2, type_name="幸运召唤", desc="高级召唤10次", progress={{cli_label="evt_recruit",target=300,target_val=10,param={}}}, show_icon=120, award1={{1,80000},{10450,100}}, lev=1, id=10, extend={}},
			{period=1, goal_id=14050, day=2, target_type=2, type_name="幸运召唤", desc="高级召唤20次", progress={{cli_label="evt_recruit",target=300,target_val=20,param={}}}, show_icon=120, award1={{1,100000},{10001,150}}, lev=1, id=11, extend={}},
			{period=1, goal_id=14060, day=2, target_type=2, type_name="幸运召唤", desc="高级召唤40次", progress={{cli_label="evt_recruit",target=300,target_val=40,param={}}}, show_icon=120, award1={{1,100000},{10450,200}}, lev=1, id=12, extend={}}
		},
		[1] = {{period=1, goal_id=11010, day=1, target_type=1, type_name="剧情探索", desc="通关剧情副本第20关", progress={{cli_label="evt_dungeon_pass",target=10200,target_val=1,param={'chapter'}}}, show_icon=157, award1={{1,20000},{10001,30}}, lev=1, id=1, extend={}},
			{period=1, goal_id=11020, day=1, target_type=1, type_name="剧情探索", desc="通关剧情副本第30关", progress={{cli_label="evt_dungeon_pass",target=10300,target_val=1,param={'chapter'}}}, show_icon=157, award1={{1,30000},{10001,30}}, lev=1, id=2, extend={}},
			{period=1, goal_id=11030, day=1, target_type=1, type_name="剧情探索", desc="通关剧情副本第40关", progress={{cli_label="evt_dungeon_pass",target=10400,target_val=1,param={'chapter'}}}, show_icon=157, award1={{1,50000},{10001,30}}, lev=1, id=3, extend={}},
			{period=1, goal_id=11040, day=1, target_type=1, type_name="剧情探索", desc="通关剧情副本第50关", progress={{cli_label="evt_dungeon_pass",target=20080,target_val=1,param={'chapter'}}}, show_icon=157, award1={{1,80000},{10001,50}}, lev=1, id=4, extend={}},
			{period=1, goal_id=11050, day=1, target_type=1, type_name="剧情探索", desc="通关剧情副本第60关", progress={{cli_label="evt_dungeon_pass",target=20200,target_val=1,param={'chapter'}}}, show_icon=157, award1={{1,100000},{10001,50}}, lev=1, id=5, extend={}},
			{period=1, goal_id=11060, day=1, target_type=1, type_name="剧情探索", desc="通关剧情副本第70关", progress={{cli_label="evt_dungeon_pass",target=20300,target_val=1,param={'chapter'}}}, show_icon=157, award1={{1,100000},{10001,100}}, lev=1, id=6, extend={}},
			{period=1, goal_id=12010, day=1, target_type=2, type_name="公会发展", desc="公会捐献1次", progress={{cli_label="evt_guild_donate",target=0,target_val=1,param={}}}, show_icon=145, award1={{1,20000},{26700,20}}, lev=1, id=7, extend={}},
			{period=1, goal_id=12020, day=1, target_type=2, type_name="公会发展", desc="公会捐献3次", progress={{cli_label="evt_guild_donate",target=0,target_val=3,param={}}}, show_icon=145, award1={{1,30000},{26701,20}}, lev=1, id=8, extend={}},
			{period=1, goal_id=12030, day=1, target_type=2, type_name="公会发展", desc="公会捐献5次", progress={{cli_label="evt_guild_donate",target=0,target_val=5,param={}}}, show_icon=145, award1={{1,50000},{26702,20}}, lev=1, id=9, extend={}},
			{period=1, goal_id=12040, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战2次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=2,param={}}}, show_icon=146, award1={{1,80000},{26703,20}}, lev=1, id=10, extend={}},
			{period=1, goal_id=12050, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战5次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=5,param={}}}, show_icon=146, award1={{1,100000},{26704,20}}, lev=1, id=11, extend={}},
			{period=1, goal_id=12060, day=1, target_type=2, type_name="公会发展", desc="公会副本挑战10次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=10,param={}}}, show_icon=146, award1={{1,100000},{26704,40}}, lev=1, id=12, extend={}}
		},
	},
}
-- -------------------growthtarget_end---------------------


-- -------------------halfdiscount_start-------------------
Config.DayGoalsData.data_halfdiscount_length = 3
Config.DayGoalsData.data_halfdiscount = {
	[7] = {
		[721] = {{period=7, id=721, day=7, vip=5, award1={{29105,50}}, desc="VIP5折扣礼包", price1=6000, price2=3000, disc=5}
		},
		[720] = {{period=7, id=720, day=6, vip=5, award1={{37002,5}}, desc="VIP5折扣礼包", price1=5000, price2=2500, disc=5}
		},
		[719] = {{period=7, id=719, day=5, vip=4, award1={{10453,1}}, desc="VIP4折扣礼包", price1=5000, price2=2500, disc=5}
		},
		[718] = {{period=7, id=718, day=4, vip=4, award1={{10403,10}}, desc="VIP4折扣礼包", price1=2500, price2=1500, disc=6}
		},
		[717] = {{period=7, id=717, day=3, vip=3, award1={{72001,150}}, desc="VIP3折扣礼包", price1=2250, price2=1350, disc=6}
		},
		[716] = {{period=7, id=716, day=2, vip=2, award1={{29905,50}}, desc="VIP2折扣礼包", price1=5000, price2=3000, disc=6}
		},
		[715] = {{period=7, id=715, day=1, vip=1, award1={{10450,500}}, desc="VIP1折扣礼包", price1=500, price2=250, disc=5}
		},
		[714] = {{period=7, id=714, day=7, vip=0, award1={{29305,50}}, desc="全民折扣礼包", price1=6000, price2=3000, disc=5}
		},
		[713] = {{period=7, id=713, day=6, vip=0, award1={{37001,40}}, desc="全民折扣礼包", price1=2000, price2=1200, disc=6}
		},
		[712] = {{period=7, id=712, day=5, vip=0, award1={{10403,5}}, desc="全民折扣礼包", price1=1250, price2=750, disc=6}
		},
		[711] = {{period=7, id=711, day=4, vip=0, award1={{10450,1000}}, desc="全民折扣礼包", price1=1000, price2=600, disc=6}
		},
		[710] = {{period=7, id=710, day=3, vip=0, award1={{10001,500}}, desc="全民折扣礼包", price1=500, price2=300, disc=6}
		},
		[709] = {{period=7, id=709, day=2, vip=0, award1={{72001,50}}, desc="全民折扣礼包", price1=750, price2=450, disc=6}
		},
		[708] = {{period=7, id=708, day=1, vip=0, award1={{10450,300}}, desc="全民折扣礼包", price1=300, price2=150, disc=6}
		},
		[707] = {{period=7, id=707, day=7, vip=0, award1={{10403,1}}, desc="全民福利礼包", price1=250, price2=0, disc=0}
		},
		[706] = {{period=7, id=706, day=6, vip=0, award1={{10450,100}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[705] = {{period=7, id=705, day=5, vip=0, award1={{37001,1}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[704] = {{period=7, id=704, day=4, vip=0, award1={{10002,2}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[703] = {{period=7, id=703, day=3, vip=0, award1={{10,200}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[702] = {{period=7, id=702, day=2, vip=0, award1={{10103,2}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[701] = {{period=7, id=701, day=1, vip=0, award1={{10001,50}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
	},
	[4] = {
		[321] = {{period=4, id=321, day=7, vip=6, award1={{28901,50}}, desc="VIP6半价礼包", price1=10000, price2=5000, disc=5}
		},
		[320] = {{period=4, id=320, day=6, vip=5, award1={{37002,5}}, desc="VIP5半价礼包", price1=5000, price2=2500, disc=5}
		},
		[319] = {{period=4, id=319, day=5, vip=4, award1={{10453,1}}, desc="VIP4半价礼包", price1=5000, price2=2500, disc=5}
		},
		[318] = {{period=4, id=318, day=4, vip=4, award1={{10403,10}}, desc="VIP4半价礼包", price1=2500, price2=1250, disc=5}
		},
		[317] = {{period=4, id=317, day=3, vip=3, award1={{72001,200}}, desc="VIP3半价礼包", price1=3000, price2=1500, disc=5}
		},
		[316] = {{period=4, id=316, day=2, vip=2, award1={{29205,50}}, desc="VIP2半价礼包", price1=6000, price2=3000, disc=5}
		},
		[315] = {{period=4, id=315, day=1, vip=1, award1={{10450,500}}, desc="VIP1半价礼包", price1=500, price2=250, disc=5}
		},
		[314] = {{period=4, id=314, day=7, vip=0, award1={{29305,50}}, desc="全民半价礼包", price1=5000, price2=2500, disc=5}
		},
		[313] = {{period=4, id=313, day=6, vip=0, award1={{37001,40}}, desc="全民半价礼包", price1=2000, price2=1000, disc=5}
		},
		[312] = {{period=4, id=312, day=5, vip=0, award1={{72001,150}}, desc="全民半价礼包", price1=2250, price2=1125, disc=5}
		},
		[311] = {{period=4, id=311, day=4, vip=0, award1={{10002,20}}, desc="全民半价礼包", price1=600, price2=300, disc=5}
		},
		[310] = {{period=4, id=310, day=3, vip=0, award1={{10,2500}}, desc="全民半价礼包", price1=1000, price2=500, disc=5}
		},
		[309] = {{period=4, id=309, day=2, vip=0, award1={{10403,4}}, desc="全民半价礼包", price1=1000, price2=500, disc=5}
		},
		[308] = {{period=4, id=308, day=1, vip=0, award1={{10450,300}}, desc="全民半价礼包", price1=300, price2=150, disc=5}
		},
		[307] = {{period=4, id=307, day=7, vip=0, award1={{10403,1}}, desc="全民福利礼包", price1=250, price2=0, disc=0}
		},
		[306] = {{period=4, id=306, day=6, vip=0, award1={{10450,100}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[305] = {{period=4, id=305, day=5, vip=0, award1={{37001,2}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[304] = {{period=4, id=304, day=4, vip=0, award1={{10002,2}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[303] = {{period=4, id=303, day=3, vip=0, award1={{10,250}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[302] = {{period=4, id=302, day=2, vip=0, award1={{10103,2}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
		[301] = {{period=4, id=301, day=1, vip=0, award1={{10001,100}}, desc="全民福利礼包", price1=100, price2=0, disc=0}
		},
	},
	[1] = {
		[21] = {{period=1, id=21, day=7, vip=6, award1={{28903,50}}, desc="VIP6半价礼包", price1=10000, price2=5000, disc=5}
		},
		[20] = {{period=1, id=20, day=6, vip=5, award1={{37002,5}}, desc="VIP5半价礼包", price1=5000, price2=2500, disc=5}
		},
		[19] = {{period=1, id=19, day=5, vip=4, award1={{10453,1}}, desc="VIP4半价礼包", price1=5000, price2=2500, disc=5}
		},
		[18] = {{period=1, id=18, day=4, vip=4, award1={{10403,10}}, desc="VIP4半价礼包", price1=2500, price2=1250, disc=5}
		},
		[17] = {{period=1, id=17, day=3, vip=3, award1={{72002,40}}, desc="VIP3半价礼包", price1=4000, price2=2000, disc=5}
		},
		[16] = {{period=1, id=16, day=2, vip=2, award1={{29105,50}}, desc="VIP2半价礼包", price1=6000, price2=3000, disc=5}
		},
		[15] = {{period=1, id=15, day=1, vip=1, award1={{10001,300}}, desc="VIP1半价礼包", price1=300, price2=150, disc=5}
		},
		[14] = {{period=1, id=14, day=7, vip=0, award1={{27304,1}}, desc="全民半价礼包", price1=5000, price2=2500, disc=5}
		},
		[13] = {{period=1, id=13, day=6, vip=0, award1={{37001,40}}, desc="全民半价礼包", price1=2000, price2=1000, disc=5}
		},
		[12] = {{period=1, id=12, day=5, vip=0, award1={{72001,150}}, desc="全民半价礼包", price1=2250, price2=1000, disc=5}
		},
		[11] = {{period=1, id=11, day=4, vip=0, award1={{10002,20}}, desc="全民半价礼包", price1=600, price2=300, disc=5}
		},
		[10] = {{period=1, id=10, day=3, vip=0, award1={{29904,30}}, desc="全民半价礼包", price1=600, price2=300, disc=5}
		},
		[9] = {{period=1, id=9, day=2, vip=0, award1={{10403,4}}, desc="全民半价礼包", price1=1000, price2=500, disc=5}
		},
		[8] = {{period=1, id=8, day=1, vip=0, award1={{26801,30}}, desc="全民半价礼包", price1=600, price2=300, disc=5}
		},
		[7] = {{period=1, id=7, day=7, vip=0, award1={{10401,1}}, desc="全民福利礼包", price1=50, price2=0, disc=0}
		},
		[6] = {{period=1, id=6, day=6, vip=0, award1={{1,50000}}, desc="全民福利礼包", price1=50, price2=0, disc=0}
		},
		[5] = {{period=1, id=5, day=5, vip=0, award1={{37001,1}}, desc="全民福利礼包", price1=50, price2=0, disc=0}
		},
		[4] = {{period=1, id=4, day=4, vip=0, award1={{25,50}}, desc="全民福利礼包", price1=50, price2=0, disc=0}
		},
		[3] = {{period=1, id=3, day=3, vip=0, award1={{10002,1}}, desc="全民福利礼包", price1=50, price2=0, disc=0}
		},
		[2] = {{period=1, id=2, day=2, vip=0, award1={{10103,1}}, desc="全民福利礼包", price1=50, price2=0, disc=0}
		},
		[1] = {{period=1, id=1, day=1, vip=0, award1={{10001,20}}, desc="全民福利礼包", price1=50, price2=0, disc=0}
		},
	},
}
-- -------------------halfdiscount_end---------------------


-- -------------------all_target_start-------------------
Config.DayGoalsData.data_all_target_length = 3
Config.DayGoalsData.data_all_target = {
	[7] = {
		[407] = {{period=7, id=407, goal=100, award={{3,2000}}}
		},
		[307] = {{period=7, id=307, goal=70, award={{37002,1}}}
		},
		[207] = {{period=7, id=207, goal=50, award={{10403,1}}}
		},
		[107] = {{period=7, id=107, goal=20, award={{10403,1}}}
		},
	},
	[4] = {
		[403] = {{period=4, id=403, goal=100, award={{3,2000}}}
		},
		[303] = {{period=4, id=303, goal=70, award={{37002,1}}}
		},
		[203] = {{period=4, id=203, goal=50, award={{10403,2}}}
		},
		[103] = {{period=4, id=103, goal=20, award={{10403,1}}}
		},
	},
	[1] = {
		[4] = {{period=1, id=4, goal=100, award={{3,3000}}}
		},
		[3] = {{period=1, id=3, goal=70, award={{37002,2}}}
		},
		[2] = {{period=1, id=2, goal=50, award={{10403,1}}}
		},
		[1] = {{period=1, id=1, goal=20, award={{10002,5}}}
		},
	},
}
-- -------------------all_target_end---------------------


-- -------------------drama_explain_start-------------------
Config.DayGoalsData.data_drama_explain_length = 3
Config.DayGoalsData.data_drama_explain = {
	[1] = {id=1, title="目标挑战", desc="七日目标根据天数开放，玩家完成任务后，可根据完成进度领取对应大奖。活动8天后关闭，奖励只可领取一次，领取后继续完成任务不可补充领取奖励"},
	[2] = {id=2, title="每日福利", desc="每天有特别福利放送，快快领取奖励继续提升自己，完成目标挑战"},
	[3] = {id=3, title="五折特惠", desc="精选各种酷炫礼包，每日半价超值出售。走过路过不要错过！"}
}
Config.DayGoalsData.data_drama_explain_fun = function(key)
	local data=Config.DayGoalsData.data_drama_explain[key]
	if DATA_DEBUG and data == nil then
		print('(Config.DayGoalsData.data_drama_explain['..key..'])not found') return
	end
	return data
end
-- -------------------drama_explain_end---------------------

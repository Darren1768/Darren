----------------------------------------------------
-- 此文件由数据工具生成
-- 活动召唤数据--recruit_holiday_lucky_data.xml
--------------------------------------

Config = Config or {} 
Config.RecruitHolidayLuckyData = Config.RecruitHolidayLuckyData or {}

-- -------------------const_start-------------------
Config.RecruitHolidayLuckyData.data_const_length = 3
Config.RecruitHolidayLuckyData.data_const = {
	["common_s"] = {key="common_s", val=10408, desc="召唤道具ID"},
	["common_time"] = {key="common_time", val=1, desc="特殊召唤每天免费次数"},
	["c_interval"] = {key="c_interval", val=86400, desc="普通召唤免费次数间隔/s"}
}
Config.RecruitHolidayLuckyData.data_const_fun = function(key)
	local data=Config.RecruitHolidayLuckyData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RecruitHolidayLuckyData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------action_start-------------------
Config.RecruitHolidayLuckyData.data_action_length = 6
Config.RecruitHolidayLuckyData.data_action = {
	[49972] = {camp_id=49972, group_id=10001, desc="1、每期自选精英召唤共有<div fontcolor=#c23f35>5位【up英雄】</div>，玩家选定<div fontcolor=#c23f35>其中之一</div>后开启抽奖；抽奖途中可随意<div fontcolor=#c23f35>更换</div>选定英雄\n2、自选精英召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>选定的up英雄获取概率大幅提升！</div>\n3、自选精英召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获得选定的up英雄</div>。\n4、通过自选精英召唤获取到<div fontcolor=#c23f35>当前选定up英雄时</div>，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算；如果获取到非当前选定的up英雄，则不重置对应次数；\n5、如果在中途<div fontcolor=#c23f36>更换</div>up英雄，剩余招募次数将根据<div fontcolor=#c23f35>现有已累计招募次数切换为所选英雄对应的保底次数</div>（如当前选择的为风水火up英雄，剩余必出招募次数为10次，切换为光暗英雄后，则剩余必出招募次数变更为50次）；\n6、如果更换前累计招募次数大于或等于更换后保底次数，则切换后下一次招募必定获得up英雄；"},
	[49996] = {camp_id=49996, group_id=10002, desc="1、每期自选精英召唤共有<div fontcolor=#c23f35>5位【up英雄】</div>，玩家选定<div fontcolor=#c23f35>其中之一</div>后开启抽奖；抽奖途中可随意<div fontcolor=#c23f35>更换</div>选定英雄\n2、自选精英召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>选定的up英雄获取概率大幅提升！</div>\n3、自选精英召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获得选定的up英雄</div>。\n4、通过自选精英召唤获取到<div fontcolor=#c23f35>当前选定up英雄时</div>，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算；如果获取到非当前选定的up英雄，则不重置对应次数；\n5、如果在中途<div fontcolor=#c23f36>更换</div>up英雄，剩余招募次数将根据<div fontcolor=#c23f35>现有已累计招募次数切换为所选英雄对应的保底次数</div>（如当前选择的为风水火up英雄，剩余必出招募次数为10次，切换为光暗英雄后，则剩余必出招募次数变更为50次）；\n6、如果更换前累计招募次数大于或等于更换后保底次数，则切换后下一次招募必定获得up英雄；"},
	[50011] = {camp_id=50011, group_id=10003, desc="1、每期自选精英召唤共有<div fontcolor=#c23f35>5位【up英雄】</div>，玩家选定<div fontcolor=#c23f35>其中之一</div>后开启抽奖；抽奖途中可随意<div fontcolor=#c23f35>更换</div>选定英雄\n2、自选精英召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>选定的up英雄获取概率大幅提升！</div>\n3、自选精英召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获得选定的up英雄</div>。\n4、通过自选精英召唤获取到<div fontcolor=#c23f35>当前选定up英雄时</div>，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算；如果获取到非当前选定的up英雄，则不重置对应次数；\n5、如果在中途<div fontcolor=#c23f36>更换</div>up英雄，剩余招募次数将根据<div fontcolor=#c23f35>现有已累计招募次数切换为所选英雄对应的保底次数</div>（如当前选择的为风水火up英雄，剩余必出招募次数为10次，切换为光暗英雄后，则剩余必出招募次数变更为50次）；\n6、如果更换前累计招募次数大于或等于更换后保底次数，则切换后下一次招募必定获得up英雄；"},
	[50022] = {camp_id=50022, group_id=10004, desc="1、每期自选精英召唤共有<div fontcolor=#c23f35>5位【up英雄】</div>，玩家选定<div fontcolor=#c23f35>其中之一</div>后开启抽奖；抽奖途中可随意<div fontcolor=#c23f35>更换</div>选定英雄\n2、自选精英召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>选定的up英雄获取概率大幅提升！</div>\n3、自选精英召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获得选定的up英雄</div>。\n4、通过自选精英召唤获取到<div fontcolor=#c23f35>当前选定up英雄时</div>，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算；如果获取到非当前选定的up英雄，则不重置对应次数；\n5、如果在中途<div fontcolor=#c23f36>更换</div>up英雄，剩余招募次数将根据<div fontcolor=#c23f35>现有已累计招募次数切换为所选英雄对应的保底次数</div>（如当前选择的为风水火up英雄，剩余必出招募次数为10次，切换为光暗英雄后，则剩余必出招募次数变更为50次）；\n6、如果更换前累计招募次数大于或等于更换后保底次数，则切换后下一次招募必定获得up英雄；"},
	[50039] = {camp_id=50039, group_id=10005, desc="1、每期自选精英召唤共有<div fontcolor=#c23f35>5位【up英雄】</div>，玩家选定<div fontcolor=#c23f35>其中之一</div>后开启抽奖；抽奖途中可随意<div fontcolor=#c23f35>更换</div>选定英雄\n2、自选精英召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>选定的up英雄获取概率大幅提升！</div>\n3、自选精英召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获得选定的up英雄</div>。\n4、通过自选精英召唤获取到<div fontcolor=#c23f35>当前选定up英雄时</div>，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算；如果获取到非当前选定的up英雄，则不重置对应次数；\n5、如果在中途<div fontcolor=#c23f36>更换</div>up英雄，剩余招募次数将根据<div fontcolor=#c23f35>现有已累计招募次数切换为所选英雄对应的保底次数</div>（如当前选择的为风水火up英雄，剩余必出招募次数为10次，切换为光暗英雄后，则剩余必出招募次数变更为50次）；\n6、如果更换前累计招募次数大于或等于更换后保底次数，则切换后下一次招募必定获得up英雄；"},
	[50051] = {camp_id=50051, group_id=10006, desc="1、每期自选精英召唤共有<div fontcolor=#c23f35>5位【up英雄】</div>，玩家选定<div fontcolor=#c23f35>其中之一</div>后开启抽奖；抽奖途中可随意<div fontcolor=#c23f35>更换</div>选定英雄\n2、自选精英召唤可以抽取到高级召唤卡池中的所有英雄。同时，<div fontcolor=#c23f35>选定的up英雄获取概率大幅提升！</div>\n3、自选精英召唤中，风水火系每110次（光暗系150次）招募，<div fontcolor=#c23f35>必定获得选定的up英雄</div>。\n4、通过自选精英召唤获取到<div fontcolor=#c23f35>当前选定up英雄时</div>，最大剩余招募次数将<div fontcolor=#c23f36>重置为初始值</div>，并重新开始计算；如果获取到非当前选定的up英雄，则不重置对应次数；\n5、如果在中途<div fontcolor=#c23f36>更换</div>up英雄，剩余招募次数将根据<div fontcolor=#c23f35>现有已累计招募次数切换为所选英雄对应的保底次数</div>（如当前选择的为风水火up英雄，剩余必出招募次数为10次，切换为光暗英雄后，则剩余必出招募次数变更为50次）；\n6、如果更换前累计招募次数大于或等于更换后保底次数，则切换后下一次招募必定获得up英雄；"}
}
Config.RecruitHolidayLuckyData.data_action_fun = function(key)
	local data=Config.RecruitHolidayLuckyData.data_action[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RecruitHolidayLuckyData.data_action['..key..'])not found') return
	end
	return data
end
-- -------------------action_end---------------------


-- -------------------summon_start-------------------
Config.RecruitHolidayLuckyData.data_summon_length = 6
Config.RecruitHolidayLuckyData.data_summon = {
	[10001] = {group_id=10001, name="精英召唤_海拉", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10408,1}}, loss_item_ten={{10408,10}}, action_name="action", call_bg="partnersummon_call_bg_100", action_card_name="action2", call_bg_action=147, res_id=2, call_bg_card=""},
	[10002] = {group_id=10002, name="精英召唤_阿蒙", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10408,1}}, loss_item_ten={{10408,10}}, action_name="action", call_bg="partnersummon_call_bg_100", action_card_name="action2", call_bg_action=147, res_id=2, call_bg_card=""},
	[10003] = {group_id=10003, name="精英召唤_尼德霍格", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10408,1}}, loss_item_ten={{10408,10}}, action_name="action", call_bg="partnersummon_call_bg_100", action_card_name="action2", call_bg_action=147, res_id=2, call_bg_card=""},
	[10004] = {group_id=10004, name="精英召唤_黑暗之主", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10408,1}}, loss_item_ten={{10408,10}}, action_name="action", call_bg="partnersummon_call_bg_100", action_card_name="action2", call_bg_action=147, res_id=2, call_bg_card=""},
	[10005] = {group_id=10005, name="精英召唤_黑暗之主", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10408,1}}, loss_item_ten={{10408,10}}, action_name="action", call_bg="partnersummon_call_bg_100", action_card_name="action2", call_bg_action=147, res_id=2, call_bg_card=""},
	[10006] = {group_id=10006, name="精英召唤_阿蒙", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10408,1}}, loss_item_ten={{10408,10}}, action_name="action", call_bg="partnersummon_call_bg_100", action_card_name="action2", call_bg_action=147, res_id=2, call_bg_card=""}
}
Config.RecruitHolidayLuckyData.data_summon_fun = function(key)
	local data=Config.RecruitHolidayLuckyData.data_summon[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RecruitHolidayLuckyData.data_summon['..key..'])not found') return
	end
	return data
end
-- -------------------summon_end---------------------


-- -------------------award_start-------------------
Config.RecruitHolidayLuckyData.data_award_length = 6
Config.RecruitHolidayLuckyData.data_award = {
	[49972] = {
		[1] = {camp_id=49972, id=1, times=30, reward={{10408,3}}, self_reward={}},
		[2] = {camp_id=49972, id=2, times=50, reward={{29905,50}}, self_reward={}},
		[3] = {camp_id=49972, id=3, times=100, reward={{29906,50}}, self_reward={}},
		[4] = {camp_id=49972, id=4, times=200, reward={{29905,50}}, self_reward={}},
		[5] = {camp_id=49972, id=5, times=300, reward={{39090,1}}, self_reward={}},
	},
	[49996] = {
		[1] = {camp_id=49996, id=1, times=30, reward={{10408,3}}, self_reward={}},
		[2] = {camp_id=49996, id=2, times=50, reward={{29905,50}}, self_reward={}},
		[3] = {camp_id=49996, id=3, times=100, reward={{29906,50}}, self_reward={}},
		[4] = {camp_id=49996, id=4, times=200, reward={{29905,50}}, self_reward={}},
		[5] = {camp_id=49996, id=5, times=300, reward={}, self_reward={{28909,50},{27906,50},{26911,50},{24904,50},{25908,50}}},
	},
	[50011] = {
		[1] = {camp_id=50011, id=1, times=30, reward={{10408,3}}, self_reward={}},
		[2] = {camp_id=50011, id=2, times=50, reward={{29905,50}}, self_reward={}},
		[3] = {camp_id=50011, id=3, times=100, reward={{29906,50}}, self_reward={}},
		[4] = {camp_id=50011, id=4, times=200, reward={{29905,50}}, self_reward={}},
		[5] = {camp_id=50011, id=5, times=300, reward={}, self_reward={{28908,50},{27905,50},{26908,50},{24910,50},{25909,50}}},
	},
	[50022] = {
		[1] = {camp_id=50022, id=1, times=30, reward={{10408,3}}, self_reward={}},
		[2] = {camp_id=50022, id=2, times=50, reward={{29905,50}}, self_reward={}},
		[3] = {camp_id=50022, id=3, times=100, reward={{29906,50}}, self_reward={}},
		[4] = {camp_id=50022, id=4, times=200, reward={{29905,50}}, self_reward={}},
		[5] = {camp_id=50022, id=5, times=300, reward={}, self_reward={{28903,50},{27907,50},{26906,50},{24911,50},{25907,50}}},
	},
	[50039] = {
		[1] = {camp_id=50039, id=1, times=30, reward={{10408,3}}, self_reward={}},
		[2] = {camp_id=50039, id=2, times=50, reward={{29905,50}}, self_reward={}},
		[3] = {camp_id=50039, id=3, times=100, reward={{29906,50}}, self_reward={}},
		[4] = {camp_id=50039, id=4, times=200, reward={{29905,50}}, self_reward={}},
		[5] = {camp_id=50039, id=5, times=300, reward={}, self_reward={{28907,50},{28902,50},{27909,50},{26907,50},{24909,50},{25906,50}}},
	},
	[50051] = {
		[1] = {camp_id=50051, id=1, times=30, reward={{10408,3}}, self_reward={}},
		[2] = {camp_id=50051, id=2, times=50, reward={{29905,50}}, self_reward={}},
		[3] = {camp_id=50051, id=3, times=100, reward={{29906,50}}, self_reward={}},
		[4] = {camp_id=50051, id=4, times=200, reward={{29905,50}}, self_reward={}},
		[5] = {camp_id=50051, id=5, times=300, reward={}, self_reward={{25911,50},{28909,50},{27908,50},{26911,50},{24901,50}}},
	},
}
-- -------------------award_end---------------------


-- -------------------probability_start-------------------
Config.RecruitHolidayLuckyData.data_probability_length = 6
Config.RecruitHolidayLuckyData.data_probability = {
	[10001] = {
		[1] = {group_id=10001, index=1, id=0, num=0, is_up=1, star="5星", name="光暗英雄", is_chip=0, probability="0.76"},
		[2] = {group_id=10001, index=2, id=0, num=0, is_up=1, star="5星", name="风水火英雄", is_chip=0, probability="1"},
		[3] = {group_id=10001, index=3, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为光暗时）", is_chip=0, probability="4.24"},
		[4] = {group_id=10001, index=4, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为风水火时）", is_chip=0, probability="4"},
		[5] = {group_id=10001, index=5, id=0, num=0, is_up=0, star="4星", name="4星英雄", is_chip=0, probability="15"},
		[6] = {group_id=10001, index=6, id=0, num=0, is_up=0, star="3星", name="3星英雄", is_chip=0, probability="80"},
	},
	[10002] = {
		[1] = {group_id=10002, index=1, id=0, num=0, is_up=1, star="5星", name="光暗英雄", is_chip=0, probability="0.76"},
		[2] = {group_id=10002, index=2, id=0, num=0, is_up=1, star="5星", name="风水火英雄", is_chip=0, probability="1"},
		[3] = {group_id=10002, index=3, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为光暗时）", is_chip=0, probability="4.24"},
		[4] = {group_id=10002, index=4, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为风水火时）", is_chip=0, probability="4"},
		[5] = {group_id=10002, index=5, id=0, num=0, is_up=0, star="4星", name="4星英雄", is_chip=0, probability="15"},
		[6] = {group_id=10002, index=6, id=0, num=0, is_up=0, star="3星", name="3星英雄", is_chip=0, probability="80"},
	},
	[10003] = {
		[1] = {group_id=10003, index=1, id=0, num=0, is_up=1, star="5星", name="光暗英雄", is_chip=0, probability="0.76"},
		[2] = {group_id=10003, index=2, id=0, num=0, is_up=1, star="5星", name="风水火英雄", is_chip=0, probability="1"},
		[3] = {group_id=10003, index=3, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为光暗时）", is_chip=0, probability="4.24"},
		[4] = {group_id=10003, index=4, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为风水火时）", is_chip=0, probability="4"},
		[5] = {group_id=10003, index=5, id=0, num=0, is_up=0, star="4星", name="4星英雄", is_chip=0, probability="15"},
		[6] = {group_id=10003, index=6, id=0, num=0, is_up=0, star="3星", name="3星英雄", is_chip=0, probability="80"},
	},
	[10004] = {
		[1] = {group_id=10004, index=1, id=0, num=0, is_up=1, star="5星", name="光暗英雄", is_chip=0, probability="0.76"},
		[2] = {group_id=10004, index=2, id=0, num=0, is_up=1, star="5星", name="风水火英雄", is_chip=0, probability="1"},
		[3] = {group_id=10004, index=3, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为光暗时）", is_chip=0, probability="4.24"},
		[4] = {group_id=10004, index=4, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为风水火时）", is_chip=0, probability="4"},
		[5] = {group_id=10004, index=5, id=0, num=0, is_up=0, star="4星", name="4星英雄", is_chip=0, probability="15"},
		[6] = {group_id=10004, index=6, id=0, num=0, is_up=0, star="3星", name="3星英雄", is_chip=0, probability="80"},
	},
	[10005] = {
		[1] = {group_id=10005, index=1, id=0, num=0, is_up=1, star="5星", name="光暗英雄", is_chip=0, probability="0.76"},
		[2] = {group_id=10005, index=2, id=0, num=0, is_up=1, star="5星", name="风水火英雄", is_chip=0, probability="1"},
		[3] = {group_id=10005, index=3, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为光暗时）", is_chip=0, probability="4.24"},
		[4] = {group_id=10005, index=4, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为风水火时）", is_chip=0, probability="4"},
		[5] = {group_id=10005, index=5, id=0, num=0, is_up=0, star="4星", name="4星英雄", is_chip=0, probability="15"},
		[6] = {group_id=10005, index=6, id=0, num=0, is_up=0, star="3星", name="3星英雄", is_chip=0, probability="80"},
	},
	[10006] = {
		[1] = {group_id=10006, index=1, id=0, num=0, is_up=1, star="5星", name="光暗英雄", is_chip=0, probability="0.76"},
		[2] = {group_id=10006, index=2, id=0, num=0, is_up=1, star="5星", name="风水火英雄", is_chip=0, probability="1"},
		[3] = {group_id=10006, index=3, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为光暗时）", is_chip=0, probability="4.24"},
		[4] = {group_id=10006, index=4, id=0, num=0, is_up=0, star="5星", name="其他5星（up英雄为风水火时）", is_chip=0, probability="4"},
		[5] = {group_id=10006, index=5, id=0, num=0, is_up=0, star="4星", name="4星英雄", is_chip=0, probability="15"},
		[6] = {group_id=10006, index=6, id=0, num=0, is_up=0, star="3星", name="3星英雄", is_chip=0, probability="80"},
	},
}
-- -------------------probability_end---------------------


-- -------------------hero_show_start-------------------
Config.RecruitHolidayLuckyData.data_hero_show_length = 1
Config.RecruitHolidayLuckyData.data_hero_show = {
	[10001] = {
		[24400] = {group_id=10001, id=24400, num=1, name="娜迦公主", probability="0.037"},
		[24401] = {group_id=10001, id=24401, num=1, name="冰雪女王", probability="0.037"},
		[24402] = {group_id=10001, id=24402, num=1, name="冰霜巨龙", probability="0.037"},
		[24403] = {group_id=10001, id=24403, num=1, name="泰坦", probability="0.015"},
		[24404] = {group_id=10001, id=24404, num=1, name="波塞冬", probability="0.015"},
		[24405] = {group_id=10001, id=24405, num=1, name="派西斯", probability="0.185"},
		[24406] = {group_id=10001, id=24406, num=1, name="少年梅林", probability="0.037"},
		[24407] = {group_id=10001, id=24407, num=1, name="海宁芙", probability="0.085"},
		[24408] = {group_id=10001, id=24408, num=1, name="阿瑞斯", probability="0.185"},
		[24409] = {group_id=10001, id=24409, num=1, name="耶梦加得", probability="0.015"},
		[24410] = {group_id=10001, id=24410, num=1, name="酒神", probability="0.015"},
		[25400] = {group_id=10001, id=25400, num=1, name="炽天使", probability="0.037"},
		[25401] = {group_id=10001, id=25401, num=1, name="炎魔之王", probability="0.037"},
		[25402] = {group_id=10001, id=25402, num=1, name="剑豪卡赞", probability="0.185"},
		[25403] = {group_id=10001, id=25403, num=1, name="菲尼克斯", probability="0.037"},
		[25404] = {group_id=10001, id=25404, num=1, name="阿波罗", probability="0.037"},
		[25405] = {group_id=10001, id=25405, num=1, name="吸血伯爵", probability="0.185"},
		[25406] = {group_id=10001, id=25406, num=1, name="普罗米修斯", probability="0.78"},
		[25407] = {group_id=10001, id=25407, num=1, name="瓦尔基里", probability="0.015"},
		[25408] = {group_id=10001, id=25408, num=1, name="洛基", probability="0.015"},
		[25409] = {group_id=10001, id=25409, num=1, name="哪吒", probability="0.015"},
		[25410] = {group_id=10001, id=25410, num=1, name="海姆达尔", probability="0.015"},
		[26400] = {group_id=10001, id=26400, num=1, name="奥丁", probability="0.037"},
		[26401] = {group_id=10001, id=26401, num=1, name="影刹", probability="0.015"},
		[26402] = {group_id=10001, id=26402, num=1, name="凯兰崔尔", probability="0.185"},
		[26403] = {group_id=10001, id=26403, num=1, name="魅魔女王", probability="0.037"},
		[26404] = {group_id=10001, id=26404, num=1, name="美杜莎", probability="0.186"},
		[26405] = {group_id=10001, id=26405, num=1, name="雅典娜", probability="0.037"},
		[26406] = {group_id=10001, id=26406, num=1, name="潘", probability="0.015"},
		[26407] = {group_id=10001, id=26407, num=1, name="斯芬克斯", probability="0.78"},
		[26408] = {group_id=10001, id=26408, num=1, name="芬尼尔", probability="0.015"},
		[26409] = {group_id=10001, id=26409, num=1, name="拉塔托斯克", probability="0.015"},
		[26410] = {group_id=10001, id=26410, num=1, name="辛西娅", probability="0.015"},
		[27400] = {group_id=10001, id=27400, num=1, name="伊西斯", probability="0.075"},
		[27401] = {group_id=10001, id=27401, num=1, name="宙斯", probability="0.01"},
		[27402] = {group_id=10001, id=27402, num=1, name="赫拉", probability="0.058"},
		[27403] = {group_id=10001, id=27403, num=1, name="雷神", probability="0.058"},
		[27404] = {group_id=10001, id=27404, num=1, name="盖亚", probability="0.075"},
		[27405] = {group_id=10001, id=27405, num=1, name="艾蕾莉亚", probability="0.058"},
		[27406] = {group_id=10001, id=27406, num=1, name="神灵大祭司", probability="0.01"},
		[27407] = {group_id=10001, id=27407, num=1, name="拉斐尔", probability="0.01"},
		[27408] = {group_id=10001, id=27408, num=1, name="维纳斯", probability="0.01"},
		[27409] = {group_id=10001, id=27409, num=1, name="加百列", probability="0.94"},
		[28400] = {group_id=10001, id=28400, num=1, name="蛇女墨莎", probability="0.075"},
		[28401] = {group_id=10001, id=28401, num=1, name="哈迪斯", probability="0.01"},
		[28402] = {group_id=10001, id=28402, num=1, name="亚巴顿", probability="0.058"},
		[28403] = {group_id=10001, id=28403, num=1, name="黑暗之主", probability="0.01"},
		[28404] = {group_id=10001, id=28404, num=1, name="阿努比斯", probability="0.058"},
		[28405] = {group_id=10001, id=28405, num=1, name="路西法", probability="0.075"},
		[28406] = {group_id=10001, id=28406, num=1, name="潘多拉", probability="0.01"},
		[28407] = {group_id=10001, id=28407, num=1, name="海拉", probability="0.01"},
		[28408] = {group_id=10001, id=28408, num=1, name="尼德霍格", probability="0.01"},
		[28409] = {group_id=10001, id=28409, num=1, name="阿蒙", probability="0.01"},
		[24300] = {group_id=10001, id=24300, num=1, name="亚瑟", probability="0.66"},
		[24301] = {group_id=10001, id=24301, num=1, name="竖琴海妖", probability="0.67"},
		[24302] = {group_id=10001, id=24302, num=1, name="水元素", probability="0.67"},
		[24303] = {group_id=10001, id=24303, num=1, name="冰晶女巫", probability="0.67"},
		[24304] = {group_id=10001, id=24304, num=1, name="娜迦侍女", probability="0.67"},
		[25300] = {group_id=10001, id=25300, num=1, name="火枪艾克", probability="0.67"},
		[25301] = {group_id=10001, id=25301, num=1, name="凯瑟琳", probability="0.67"},
		[25302] = {group_id=10001, id=25302, num=1, name="阿伽门农", probability="0.67"},
		[25303] = {group_id=10001, id=25303, num=1, name="雷诺蛮锤", probability="0.67"},
		[25304] = {group_id=10001, id=25304, num=1, name="翼女", probability="0.67"},
		[26300] = {group_id=10001, id=26300, num=1, name="吟游诗人", probability="0.67"},
		[26301] = {group_id=10001, id=26301, num=1, name="亡灵收割者", probability="0.67"},
		[26302] = {group_id=10001, id=26302, num=1, name="圣锤提尔", probability="0.67"},
		[26303] = {group_id=10001, id=26303, num=1, name="甘道夫", probability="0.67"},
		[26304] = {group_id=10001, id=26304, num=1, name="德鲁伊", probability="0.67"},
		[27300] = {group_id=10001, id=27300, num=1, name="光明牧师", probability="0.62"},
		[27301] = {group_id=10001, id=27301, num=1, name="月之祭司", probability="0.62"},
		[27302] = {group_id=10001, id=27302, num=1, name="精灵王子", probability="0.62"},
		[27303] = {group_id=10001, id=27303, num=1, name="丘比特", probability="0.62"},
		[28300] = {group_id=10001, id=28300, num=1, name="毒咒女巫", probability="0.62"},
		[28301] = {group_id=10001, id=28301, num=1, name="死亡骑士", probability="0.62"},
		[28302] = {group_id=10001, id=28302, num=1, name="阿喀琉斯", probability="0.62"},
		[28303] = {group_id=10001, id=28303, num=1, name="黑精灵密言", probability="0.62"},
		[24200] = {group_id=10001, id=24200, num=1, name="魔法女学徒", probability="4.8"},
		[24201] = {group_id=10001, id=24201, num=1, name="美狄亚", probability="4.7"},
		[24202] = {group_id=10001, id=24202, num=1, name="破坏者", probability="4.7"},
		[24203] = {group_id=10001, id=24203, num=1, name="咒法师", probability="4.7"},
		[24204] = {group_id=10001, id=24204, num=1, name="月之骑士", probability="4.7"},
		[25200] = {group_id=10001, id=25200, num=1, name="邪狼·加鲁鲁", probability="4.7"},
		[25201] = {group_id=10001, id=25201, num=1, name="末日守卫", probability="4.7"},
		[25202] = {group_id=10001, id=25202, num=1, name="吉尔伽美什", probability="4.7"},
		[25203] = {group_id=10001, id=25203, num=1, name="地狱火", probability="4.7"},
		[25204] = {group_id=10001, id=25204, num=1, name="奥杜尔·铜须", probability="4.7"},
		[26200] = {group_id=10001, id=26200, num=1, name="树人", probability="4.7"},
		[26201] = {group_id=10001, id=26201, num=1, name="风暴猎手", probability="4.7"},
		[26202] = {group_id=10001, id=26202, num=1, name="雷霆狮鹫", probability="4.7"},
		[26203] = {group_id=10001, id=26203, num=1, name="岩灵", probability="4.7"},
		[26204] = {group_id=10001, id=26204, num=1, name="游侠射手", probability="4.7"},
		[28200] = {group_id=10001, id=28200, num=1, name="巨魔巫医", probability="4.7"},
		[27200] = {group_id=10001, id=27200, num=1, name="光之苏尔", probability="4.7"},
	},
}
-- -------------------hero_show_end---------------------


-- -------------------wish_start-------------------
Config.RecruitHolidayLuckyData.data_wish_length = 6
Config.RecruitHolidayLuckyData.data_wish = {
	[49972] = {
		[26410] = {camp_id=49972, id=26410, bg="selectsummon_call_bg_2", sort=3, sort_2=0},
		[24401] = {camp_id=49972, id=24401, bg="selectsummon_call_bg_4", sort=4, sort_2=0},
		[25410] = {camp_id=49972, id=25410, bg="selectsummon_call_bg_3", sort=5, sort_2=0},
		[27408] = {camp_id=49972, id=27408, bg="selectsummon_call_bg_1", sort=2, sort_2=0},
		[28407] = {camp_id=49972, id=28407, bg="selectsummon_call_bg_5", sort=1, sort_2=0},
	},
	[49996] = {
		[26411] = {camp_id=49996, id=26411, bg="selectsummon_call_bg_8", sort=3, sort_2=1},
		[24404] = {camp_id=49996, id=24404, bg="selectsummon_call_bg_6", sort=4, sort_2=4},
		[25408] = {camp_id=49996, id=25408, bg="selectsummon_call_bg_10", sort=5, sort_2=5},
		[28409] = {camp_id=49996, id=28409, bg="selectsummon_call_bg_9", sort=1, sort_2=2},
		[27406] = {camp_id=49996, id=27406, bg="selectsummon_call_bg_7", sort=2, sort_2=3},
	},
	[50011] = {
		[28408] = {camp_id=50011, id=28408, bg="selectsummon_call_bg_13", sort=1, sort_2=1},
		[27405] = {camp_id=50011, id=27405, bg="selectsummon_call_bg_11", sort=2, sort_2=2},
		[26408] = {camp_id=50011, id=26408, bg="selectsummon_call_bg_15", sort=3, sort_2=3},
		[24410] = {camp_id=50011, id=24410, bg="selectsummon_call_bg_12", sort=4, sort_2=4},
		[25409] = {camp_id=50011, id=25409, bg="selectsummon_call_bg_14", sort=5, sort_2=5},
	},
	[50022] = {
		[27407] = {camp_id=50022, id=27407, bg="selectsummon_call_bg_19", sort=1, sort_2=1},
		[28403] = {camp_id=50022, id=28403, bg="selectsummon_call_bg_16", sort=2, sort_2=2},
		[24411] = {camp_id=50022, id=24411, bg="selectsummon_call_bg_20", sort=3, sort_2=3},
		[25407] = {camp_id=50022, id=25407, bg="selectsummon_call_bg_18", sort=4, sort_2=4},
		[26406] = {camp_id=50022, id=26406, bg="selectsummon_call_bg_17", sort=5, sort_2=5},
	},
	[50039] = {
		[27409] = {camp_id=50039, id=27409, bg="selectsummon_call_bg_19", sort=1, sort_2=1},
		[28402] = {camp_id=50039, id=28402, bg="selectsummon_call_bg_16", sort=2, sort_2=2},
		[24409] = {camp_id=50039, id=24409, bg="selectsummon_call_bg_20", sort=4, sort_2=3},
		[25406] = {camp_id=50039, id=25406, bg="selectsummon_call_bg_18", sort=6, sort_2=4},
		[26407] = {camp_id=50039, id=26407, bg="selectsummon_call_bg_17", sort=5, sort_2=5},
		[28407] = {camp_id=50039, id=28407, bg="selectsummon_call_bg_5", sort=3, sort_2=6},
	},
	[50051] = {
		[25411] = {camp_id=50051, id=25411, bg="selectsummon_call_bg_26", sort=1, sort_2=1},
		[27408] = {camp_id=50051, id=27408, bg="selectsummon_call_bg_1", sort=2, sort_2=2},
		[28409] = {camp_id=50051, id=28409, bg="selectsummon_call_bg_9", sort=4, sort_2=3},
		[24401] = {camp_id=50051, id=24401, bg="selectsummon_call_bg_4", sort=6, sort_2=4},
		[26411] = {camp_id=50051, id=26411, bg="selectsummon_call_bg_8", sort=5, sort_2=5},
	},
}
-- -------------------wish_end---------------------

----------------------------------------------------
-- 此文件由数据工具生成
-- 精灵抽奖数据--holiday_sprite_lottery_data.xml
--------------------------------------

Config = Config or {} 
Config.HolidaySpriteLotteryData = Config.HolidaySpriteLotteryData or {}

-- -------------------const_start-------------------
Config.HolidaySpriteLotteryData.data_const_length = 9
Config.HolidaySpriteLotteryData.data_const = {
	["common_s"] = {key="common_s", val=10415, desc="召唤道具ID"},
	["common_time"] = {key="common_time", val=1, desc="特殊召唤每天免费次数"},
	["c_interval"] = {key="c_interval", val=86400, desc="普通召唤免费次数间隔/s"},
	["lucky_sprite_num"] = {key="lucky_sprite_num", val=1, desc="幸运精灵可设置上限"},
	["lucky_sprite_ids"] = {key="lucky_sprite_ids", val={113001,113002,113003,113004,113005,113006,113007,113008}, desc="幸运精灵可设置的BID"},
	["lucky_sprite_add_pro"] = {key="lucky_sprite_add_pro", val=2000, desc="幸运精灵增加权重（N倍）"},
	["sprite_lottery_daily_limit"] = {key="sprite_lottery_daily_limit", val=120, desc="单日抽奖次数上限"},
	["reward_desc"] = {key="reward_desc", val=1, desc="1.每次召唤可获得<div fontcolor=#32CD32>1点积分</div>\n2.累计积分可获得不同档次的奖励\n3.每获得120积分可获得<div fontcolor=#32CD32>橙色自选精灵礼盒</div>"},
	["sprite_lottery_rare_list"] = {key="sprite_lottery_rare_list", val={4}, desc="抽奖需要弹详情的精灵品质列表"}
}
Config.HolidaySpriteLotteryData.data_const_fun = function(key)
	local data=Config.HolidaySpriteLotteryData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidaySpriteLotteryData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------action_start-------------------
Config.HolidaySpriteLotteryData.data_action_length = 4
Config.HolidaySpriteLotteryData.data_action = {
	[0] = {camp_id=0, group_id=110, desc="1.许愿池可放入一个<div fontcolor=#c23f35>橙色精灵</div>\n2.精灵召唤抽到橙色精灵时，会有更高的几率获得许愿池中的英雄，但不会增加橙色品质精灵的总掉率\n3.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的精灵。</div>"},
	[48034] = {camp_id=48034, group_id=101, desc="1.活动期间，精灵召唤可抽取到不同品质的精灵和其他道具材料。召唤中获得的橙色精灵必为<div fontcolor=#c23f35>【漆黑魔魂】。</div>\n2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的精灵。</div>\n3.在精灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色精灵</div>。\n4.通过精灵召唤获取到本期直升主题的橙色精灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。\n5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。"},
	[49513] = {camp_id=49513, group_id=102, desc="1.活动期间，精灵召唤可抽取到不同品质的精灵和其他道具材料。召唤中获得的橙色精灵必为<div fontcolor=#c23f35>【神使】。</div>\n2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的精灵。</div>\n3.在精灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色精灵</div>。\n4.通过精灵召唤获取到本期直升主题的橙色精灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。\n5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。"},
	[49813] = {camp_id=49813, group_id=103, desc="1.活动期间，精灵召唤可抽取到不同品质的精灵和其他道具材料。召唤中获得的橙色精灵必为<div fontcolor=#c23f35>【幻界精灵】。</div>\n2.每次10连召唤必定获得<div fontcolor=#c23f35>紫色及以上品质的精灵。</div>\n3.在精灵召唤中，每50次召唤，<div fontcolor=#c23f35>必定获取当期直升主题的橙色精灵</div>。\n4.通过精灵召唤获取到本期直升主题的橙色精灵时，最大剩余召唤次数将<div fontcolor=#c23f35>重置为初始值</div>，并重新开始计算。\n5.扭蛋机10连召唤所展示的奖励，<div fontcolor=#c23f35>随机显示为10连获得奖励中品质最高的某个奖励</div>，三栏显示同样内容。"}
}
Config.HolidaySpriteLotteryData.data_action_fun = function(key)
	local data=Config.HolidaySpriteLotteryData.data_action[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidaySpriteLotteryData.data_action['..key..'])not found') return
	end
	return data
end
-- -------------------action_end---------------------


-- -------------------summon_start-------------------
Config.HolidaySpriteLotteryData.data_summon_length = 4
Config.HolidaySpriteLotteryData.data_summon = {
	[110] = {group_id=110, name="精灵抽奖常驻", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10415,1}}, loss_item_ten={{10415,10}}, action_name="", call_bg="2", action_card_name="", call_bg_action=0, res_id=3},
	[101] = {group_id=101, name="精灵抽奖_漆黑魔魂", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10415,1}}, loss_item_ten={{10415,10}}, action_name="", call_bg="1", action_card_name="", call_bg_action=0, res_id=1},
	[102] = {group_id=102, name="精灵抽奖_神使", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10415,1}}, loss_item_ten={{10415,10}}, action_name="", call_bg="2", action_card_name="", call_bg_action=0, res_id=2},
	[103] = {group_id=103, name="精灵抽奖_幻界精灵", gain_once={{22,5000}}, gain_ten={{22,50000}}, loss_gold_once={{3,220}}, loss_gold_ten={{3,2000}}, loss_item_once={{10415,1}}, loss_item_ten={{10415,10}}, action_name="", call_bg="2", action_card_name="", call_bg_action=0, res_id=3}
}
Config.HolidaySpriteLotteryData.data_summon_fun = function(key)
	local data=Config.HolidaySpriteLotteryData.data_summon[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidaySpriteLotteryData.data_summon['..key..'])not found') return
	end
	return data
end
-- -------------------summon_end---------------------


-- -------------------award_start-------------------
Config.HolidaySpriteLotteryData.data_award_length = 4
Config.HolidaySpriteLotteryData.data_award = {
	[0] = {
		[1] = {camp_id=0, id=1, times=30, reward={{10602,2}}},
		[2] = {camp_id=0, id=2, times=70, reward={{10603,1}}},
		[3] = {camp_id=0, id=3, times=120, reward={{39056,1}}},
	},
	[48034] = {
		[1] = {camp_id=48034, id=1, times=30, reward={{10415,3}}},
		[2] = {camp_id=48034, id=2, times=60, reward={{113006,1}}},
		[3] = {camp_id=48034, id=3, times=120, reward={{113006,1}}},
		[4] = {camp_id=48034, id=4, times=180, reward={{113006,1}}},
		[5] = {camp_id=48034, id=5, times=250, reward={{113006,2}}},
	},
	[49513] = {
		[1] = {camp_id=49513, id=1, times=30, reward={{10415,3}}},
		[2] = {camp_id=49513, id=2, times=60, reward={{113002,1}}},
		[3] = {camp_id=49513, id=3, times=120, reward={{113002,1}}},
		[4] = {camp_id=49513, id=4, times=180, reward={{113002,1}}},
		[5] = {camp_id=49513, id=5, times=250, reward={{113002,2}}},
	},
	[49813] = {
		[1] = {camp_id=49813, id=1, times=30, reward={{10415,3}}},
		[2] = {camp_id=49813, id=2, times=60, reward={{113001,1}}},
		[3] = {camp_id=49813, id=3, times=120, reward={{113001,1}}},
		[4] = {camp_id=49813, id=4, times=180, reward={{113001,1}}},
		[5] = {camp_id=49813, id=5, times=250, reward={{113001,2}}},
	},
}
-- -------------------award_end---------------------


-- -------------------probability_start-------------------
Config.HolidaySpriteLotteryData.data_probability_length = 4
Config.HolidaySpriteLotteryData.data_probability = {
	[110] = {
		[1] = {group_id=110, index=1, id=113001, num=1, is_up=1, star="", name="橙色精灵", is_chip=0, probability="1"},
		[2] = {group_id=110, index=2, id=0, num=0, is_up=0, star="", name="紫色精灵", is_chip=0, probability="12.4"},
		[3] = {group_id=110, index=3, id=0, num=0, is_up=0, star="", name="蓝色精灵", is_chip=0, probability="45"},
		[4] = {group_id=110, index=4, id=0, num=0, is_up=0, star="", name="其他道具", is_chip=0, probability="41.6"},
	},
	[101] = {
		[1] = {group_id=101, index=1, id=113006, num=1, is_up=1, star="", name="漆黑魔魂", is_chip=0, probability="2.5"},
		[2] = {group_id=101, index=2, id=0, num=0, is_up=0, star="", name="紫色精灵", is_chip=0, probability="15"},
		[3] = {group_id=101, index=3, id=0, num=0, is_up=0, star="", name="蓝色精灵", is_chip=0, probability="50"},
		[4] = {group_id=101, index=4, id=0, num=0, is_up=0, star="", name="其他道具", is_chip=0, probability="32.5"},
	},
	[102] = {
		[1] = {group_id=102, index=1, id=113002, num=1, is_up=1, star="", name="神使", is_chip=0, probability="2.5"},
		[2] = {group_id=102, index=2, id=0, num=0, is_up=0, star="", name="紫色精灵", is_chip=0, probability="15"},
		[3] = {group_id=102, index=3, id=0, num=0, is_up=0, star="", name="蓝色精灵", is_chip=0, probability="50"},
		[4] = {group_id=102, index=4, id=0, num=0, is_up=0, star="", name="其他道具", is_chip=0, probability="32.5"},
	},
	[103] = {
		[1] = {group_id=103, index=1, id=113001, num=1, is_up=1, star="", name="幻界精灵", is_chip=0, probability="2.5"},
		[2] = {group_id=103, index=2, id=0, num=0, is_up=0, star="", name="紫色精灵", is_chip=0, probability="15"},
		[3] = {group_id=103, index=3, id=0, num=0, is_up=0, star="", name="蓝色精灵", is_chip=0, probability="50"},
		[4] = {group_id=103, index=4, id=0, num=0, is_up=0, star="", name="其他道具", is_chip=0, probability="32.5"},
	},
}
-- -------------------probability_end---------------------


-- -------------------hero_show_start-------------------
Config.HolidaySpriteLotteryData.data_hero_show_length = 4
Config.HolidaySpriteLotteryData.data_hero_show = {
	[110] = {
		[113001] = {group_id=110, id=113001, num=1, name="幻界精灵", probability="0.18"},
		[113002] = {group_id=110, id=113002, num=1, name="神使", probability="0.18"},
		[113003] = {group_id=110, id=113003, num=1, name="烈焰之蹄", probability="0.18"},
		[113004] = {group_id=110, id=113004, num=1, name="圣林行者", probability="0.1"},
		[113005] = {group_id=110, id=113005, num=1, name="疾风之怒", probability="0.1"},
		[113006] = {group_id=110, id=113006, num=1, name="漆黑魔魂", probability="0.1"},
		[113007] = {group_id=110, id=113007, num=1, name="冰岩巨兽", probability="0.1"},
		[113008] = {group_id=110, id=113008, num=1, name="海灵儿", probability="0.05"},
		[112001] = {group_id=110, id=112001, num=1, name="暗夜精灵", probability="3.1"},
		[112002] = {group_id=110, id=112002, num=1, name="炎灵", probability="3.1"},
		[112003] = {group_id=110, id=112003, num=1, name="潮汐之灵", probability="3.1"},
		[112004] = {group_id=110, id=112004, num=1, name="花仙子", probability="3.1"},
		[111001] = {group_id=110, id=111001, num=1, name="滚滚岩", probability="9"},
		[111002] = {group_id=110, id=111002, num=1, name="皮皮", probability="9"},
		[111003] = {group_id=110, id=111003, num=1, name="火球", probability="9"},
		[111004] = {group_id=110, id=111004, num=1, name="小豆苗", probability="9"},
		[111005] = {group_id=110, id=111005, num=1, name="嗡嗡蜂", probability="9"},
		[10040] = {group_id=110, id=10040, num=3, name="奥术之尘", probability="41.6"},
	},
	[101] = {
		[113006] = {group_id=101, id=113006, num=1, name="漆黑魔魂", probability="2.5"},
		[112001] = {group_id=101, id=112001, num=1, name="暗夜精灵", probability="3.75"},
		[112002] = {group_id=101, id=112002, num=1, name="炎灵", probability="3.75"},
		[112003] = {group_id=101, id=112003, num=1, name="潮汐之灵", probability="3.25"},
		[112004] = {group_id=101, id=112004, num=1, name="花仙子", probability="4.25"},
		[111001] = {group_id=101, id=111001, num=1, name="滚滚岩", probability="10"},
		[111002] = {group_id=101, id=111002, num=1, name="皮皮", probability="10"},
		[111003] = {group_id=101, id=111003, num=1, name="火球", probability="8"},
		[111004] = {group_id=101, id=111004, num=1, name="小豆苗", probability="9"},
		[111005] = {group_id=101, id=111005, num=1, name="嗡嗡蜂", probability="13"},
		[10041] = {group_id=101, id=10041, num=1, name="圣露", probability="1.25"},
		[10040] = {group_id=101, id=10040, num=5, name="奥术之尘", probability="10.4"},
			{group_id=101, id=10040, num=8, name="奥术之尘", probability="9.49"},
			{group_id=101, id=10040, num=10, name="奥术之尘", probability="4.92"},
		[39052] = {group_id=101, id=39052, num=1, name="百万金币礼盒", probability="6.44"},
	},
	[102] = {
		[113002] = {group_id=102, id=113002, num=1, name="神使", probability="2.5"},
		[112001] = {group_id=102, id=112001, num=1, name="暗夜精灵", probability="3.75"},
		[112002] = {group_id=102, id=112002, num=1, name="炎灵", probability="3.75"},
		[112003] = {group_id=102, id=112003, num=1, name="潮汐之灵", probability="3.25"},
		[112004] = {group_id=102, id=112004, num=1, name="花仙子", probability="4.25"},
		[111001] = {group_id=102, id=111001, num=1, name="滚滚岩", probability="10"},
		[111002] = {group_id=102, id=111002, num=1, name="皮皮", probability="10"},
		[111003] = {group_id=102, id=111003, num=1, name="火球", probability="8"},
		[111004] = {group_id=102, id=111004, num=1, name="小豆苗", probability="9"},
		[111005] = {group_id=102, id=111005, num=1, name="嗡嗡蜂", probability="13"},
		[10041] = {group_id=102, id=10041, num=1, name="圣露", probability="1.25"},
		[10040] = {group_id=102, id=10040, num=5, name="奥术之尘", probability="10.4"},
			{group_id=102, id=10040, num=8, name="奥术之尘", probability="9.49"},
			{group_id=102, id=10040, num=10, name="奥术之尘", probability="4.92"},
		[39052] = {group_id=102, id=39052, num=1, name="百万金币礼盒", probability="6.44"},
	},
	[103] = {
		[113001] = {group_id=103, id=113001, num=1, name="幻界精灵", probability="2.5"},
		[112001] = {group_id=103, id=112001, num=1, name="暗夜精灵", probability="3.75"},
		[112002] = {group_id=103, id=112002, num=1, name="炎灵", probability="3.75"},
		[112003] = {group_id=103, id=112003, num=1, name="潮汐之灵", probability="3.25"},
		[112004] = {group_id=103, id=112004, num=1, name="花仙子", probability="4.25"},
		[111001] = {group_id=103, id=111001, num=1, name="滚滚岩", probability="10"},
		[111002] = {group_id=103, id=111002, num=1, name="皮皮", probability="10"},
		[111003] = {group_id=103, id=111003, num=1, name="火球", probability="8"},
		[111004] = {group_id=103, id=111004, num=1, name="小豆苗", probability="9"},
		[111005] = {group_id=103, id=111005, num=1, name="嗡嗡蜂", probability="13"},
		[10041] = {group_id=103, id=10041, num=1, name="圣露", probability="1.25"},
		[10040] = {group_id=103, id=10040, num=5, name="奥术之尘", probability="10.4"},
			{group_id=103, id=10040, num=8, name="奥术之尘", probability="9.49"},
			{group_id=103, id=10040, num=10, name="奥术之尘", probability="4.92"},
		[39052] = {group_id=103, id=39052, num=1, name="百万金币礼盒", probability="6.44"},
	},
}
-- -------------------hero_show_end---------------------

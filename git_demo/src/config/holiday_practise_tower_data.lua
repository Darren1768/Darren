----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--holiday_practise_tower_data.xml
--------------------------------------

Config = Config or {} 
Config.HolidayPractiseTowerData = Config.HolidayPractiseTowerData or {}

-- -------------------const_start-------------------
Config.HolidayPractiseTowerData.data_const_length = 9
Config.HolidayPractiseTowerData.data_const = {
	["holiday_practise_tower_free_time"] = {key="holiday_practise_tower_free_time", val=4, desc="每日免费次数"},
	["holiday_practise_tower_buy_time"] = {key="holiday_practise_tower_buy_time", val=4, desc="每日可购买次数"},
	["holiday_practise_tower_max_buy_time"] = {key="holiday_practise_tower_max_buy_time", val=8, desc="每日可购买次数最大值"},
	["holiday_practise_tower_reset_time"] = {key="holiday_practise_tower_reset_time", val=15, desc="每日重新挑战次数"},
	["rules"] = {key="rules", val=1, desc="<div fontcolor=#c23f35>活动规则：</div>\n1、活动期间，布阵英雄挑战武神殿，击杀每层Boss可领取丰厚奖励！\n2、每次挑战消耗1点挑战次数，每场战斗对Boss造成伤害将被继承，Boss生命值为0则视为成功击杀（非Boss的单位的生命值损失不会被继承）\n3、战斗结束后若对战斗结果不满意，可选择重新挑战，重新挑战不额外消耗挑战次数\n4、排行榜根据各位冒险者大人最大通关层数排名，最大通关层数相同则视较先到达成者排名靠前\n5、活动排行奖励将在活动结束后进行邮件发放，请注意查收\n6、活动在结束后仍会公示一天，期间无法进行挑战，请各位冒险大大努力通关吧！"},
	["holiday_practise_tower_buy_loss"] = {key="holiday_practise_tower_buy_loss", val={{3,100}}, desc="购买挑战次数消耗"},
	["item_show"] = {key="item_show", val={{25911,50},{24909,50},{50037,1},{3,3000}}, desc="奖励展示"},
	["special_floor"] = {key="special_floor", val={5,10,15,20,25,30,35,40}, desc="特殊楼层节点"},
	["holiday_practise_tower_max_rank"] = {key="holiday_practise_tower_max_rank", val=200, desc="排行榜最大数量"}
}
Config.HolidayPractiseTowerData.data_const_fun = function(key)
	local data=Config.HolidayPractiseTowerData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidayPractiseTowerData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------tower_start-------------------
Config.HolidayPractiseTowerData.data_tower_length = 40
Config.HolidayPractiseTowerData.data_tower = {
	[1] = {id=1, boss_id=97300, reward={{10403,1}}, power=30000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=5, face_id=20502, mode_id="97300"},
	[2] = {id=2, boss_id=97301, reward={{3,50}}, power=37000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=5, face_id=10505, mode_id="97301"},
	[3] = {id=3, boss_id=97302, reward={{3,50}}, power=44000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=5, face_id=20505, mode_id="97302"},
	[4] = {id=4, boss_id=97303, reward={{3,50}}, power=51000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=5, face_id=40503, mode_id="97303"},
	[5] = {id=5, boss_id=97304, reward={{10403,5}}, power=58000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=6, face_id=50505, mode_id="97304"},
	[6] = {id=6, boss_id=97305, reward={{3,50}}, power=65000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=6, face_id=40502, mode_id="97305"},
	[7] = {id=7, boss_id=97306, reward={{3,50}}, power=72000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=6, face_id=20502, mode_id="97306"},
	[8] = {id=8, boss_id=97307, reward={{3,50}}, power=79000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=6, face_id=10502, mode_id="97307"},
	[9] = {id=9, boss_id=97308, reward={{3,50}}, power=86000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=6, face_id=30402, mode_id="97308"},
	[10] = {id=10, boss_id=97309, reward={{3,200},{10403,10}}, power=93000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=6, face_id=10503, mode_id="97309"},
	[11] = {id=11, boss_id=97310, reward={{3,50}}, power=100000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=6, face_id=50505, mode_id="97310"},
	[12] = {id=12, boss_id=97311, reward={{3,50}}, power=107000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508}, star=6, face_id=30505, mode_id="97311"},
	[13] = {id=13, boss_id=97312, reward={{3,50}}, power=114000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=7, face_id=20502, mode_id="97312"},
	[14] = {id=14, boss_id=97313, reward={{3,50}}, power=121000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=7, face_id=10502, mode_id="97313"},
	[15] = {id=15, boss_id=97314, reward={{10403,5}}, power=128000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=7, face_id=30506, mode_id="97314"},
	[16] = {id=16, boss_id=97315, reward={{3,50}}, power=135000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=7, face_id=20505, mode_id="97315"},
	[17] = {id=17, boss_id=97316, reward={{3,50}}, power=142000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=7, face_id=10507, mode_id="97316"},
	[18] = {id=18, boss_id=97317, reward={{3,50}}, power=149000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=7, face_id=40504, mode_id="97317"},
	[19] = {id=19, boss_id=97318, reward={{3,50}}, power=156000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=7, face_id=30508, mode_id="97318"},
	[20] = {id=20, boss_id=97319, reward={{3,300},{29905,50}}, power=163000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=7, face_id=50501, mode_id="97319"},
	[21] = {id=21, boss_id=97320, reward={{3,50}}, power=170000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=8, face_id=20506, mode_id="97320"},
	[22] = {id=22, boss_id=97321, reward={{3,50}}, power=177000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=8, face_id=50501, mode_id="97321"},
	[23] = {id=23, boss_id=97322, reward={{3,50}}, power=184000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=8, face_id=10507, mode_id="97322"},
	[24] = {id=24, boss_id=97323, reward={{3,50}}, power=191000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=8, face_id=40504, mode_id="97323"},
	[25] = {id=25, boss_id=97324, reward={{10403,5}}, power=198000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=9, face_id=30506, mode_id="97324"},
	[26] = {id=26, boss_id=97325, reward={{3,50}}, power=205000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=9, face_id=50501, mode_id="97325"},
	[27] = {id=27, boss_id=97326, reward={{3,50}}, power=212000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=9, face_id=20505, mode_id="97326"},
	[28] = {id=28, boss_id=97327, reward={{3,50}}, power=219000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=9, face_id=50505, mode_id="97327"},
	[29] = {id=29, boss_id=97328, reward={{3,50}}, power=226000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=9, face_id=10505, mode_id="97328"},
	[30] = {id=30, boss_id=97329, reward={{3,400},{24909,50}}, power=233000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=9, face_id=40502, mode_id="97329"},
	[31] = {id=31, boss_id=97330, reward={{3,50}}, power=240000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=10, face_id=30506, mode_id="97330"},
	[32] = {id=32, boss_id=97331, reward={{3,50}}, power=247000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=10, face_id=50505, mode_id="97331"},
	[33] = {id=33, boss_id=97332, reward={{3,50}}, power=254000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=10, face_id=20505, mode_id="97332"},
	[34] = {id=34, boss_id=97333, reward={{3,50}}, power=261000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=10, face_id=50506, mode_id="97333"},
	[35] = {id=35, boss_id=97334, reward={{10403,5}}, power=268000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=10, face_id=10502, mode_id="97334"},
	[36] = {id=36, boss_id=97335, reward={{3,50}}, power=275000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=10, face_id=40502, mode_id="97335"},
	[37] = {id=37, boss_id=97336, reward={{3,50}}, power=282000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=11, face_id=30506, mode_id="97336"},
	[38] = {id=38, boss_id=97337, reward={{3,50}}, power=289000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=11, face_id=50505, mode_id="97337"},
	[39] = {id=39, boss_id=97338, reward={{3,50}}, power=296000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=11, face_id=20501, mode_id="97338"},
	[40] = {id=40, boss_id=97339, reward={{3,500},{25911,50}}, power=303000, attr_ext={{'atk_per',150}}, attr_bids={10512,30508,40503,50502}, star=11, face_id=50505, mode_id="97339"}
}
Config.HolidayPractiseTowerData.data_tower_fun = function(key)
	local data=Config.HolidayPractiseTowerData.data_tower[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidayPractiseTowerData.data_tower['..key..'])not found') return
	end
	return data
end
-- -------------------tower_end---------------------


-- -------------------rank_reward_start-------------------
Config.HolidayPractiseTowerData.data_rank_reward_length = 8
Config.HolidayPractiseTowerData.data_rank_reward = {
	[1] = {min=1, max=1, items={{3,2000},{10403,20},{50037,1}}},
	[2] = {min=2, max=2, items={{3,1500},{10403,15},{50037,1}}},
	[3] = {min=3, max=3, items={{3,1000},{10403,12},{50037,1}}},
	[4] = {min=4, max=10, items={{3,800},{10403,10}}},
	[11] = {min=11, max=20, items={{3,500},{10403,8}}},
	[21] = {min=21, max=50, items={{3,300},{10403,6}}},
	[51] = {min=51, max=100, items={{3,200},{10403,4}}},
	[101] = {min=101, max=200, items={{3,100},{10403,2}}}
}
Config.HolidayPractiseTowerData.data_rank_reward_fun = function(key)
	local data=Config.HolidayPractiseTowerData.data_rank_reward[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidayPractiseTowerData.data_rank_reward['..key..'])not found') return
	end
	return data
end
-- -------------------rank_reward_end---------------------

----------------------------------------------------
-- 此文件由数据工具生成
-- 神装抽奖--holy_eqm_lottery_data.xml
--------------------------------------

Config = Config or {} 
Config.HolyEqmLotteryData = Config.HolyEqmLotteryData or {}

-- -------------------const_start-------------------
Config.HolyEqmLotteryData.data_const_length = 7
Config.HolyEqmLotteryData.data_const = {
	["player_lev_condition"] = {val=105, desc="个人等级达到105级后开启"},
	["world_lev_condition"] = {val=110, desc="世界等级达到110级后开启"},
	["player_lev_second_condition"] = {val=120, desc="个人等级达到120级后开启"},
	["heaven_dun_condition"] = {val=0, desc="已开启"},
	["continuous_raffle_times"] = {val=10, desc="公共连抽次数"},
	["activity_tips_show_condiction"] = {val=17365, desc="tips显示对应的活动"},
	["pray_rule"] = {val=1, desc="1.对神像祈祷可获得<div fontcolor=65df74>神装碎片</div>、<div fontcolor=65df74>天界神石</div>、<div fontcolor=65df74>各类神装</div>\n2.每日首次祈祷免费，每20次祈祷必定获得一件<div fontcolor=65df74>良品</div>或以上的神装\n3.往<div fontcolor=65df74>心愿水晶</div>中放入心仪的神装，可大大提高该神装的祈祷获取概率；不同石像的心愿水晶互相独立\n4.每个石像累计一定祈祷次数后，玩家可领取对应<div fontcolor=65df74>进度奖励</div>；累计200次可获得<div fontcolor=65df74>【极品自选主题礼盒】</div>，能开启出指定主题的随机部位神装1个\n5.玩家战力前5名英雄的神装总评分达10000后开启<div fontcolor=65df74>【圣洁神像】</div>，抽取更高星级的神装！同时更高的评分可在神装商店中开启更多神装商品以供购买。"}
}
Config.HolyEqmLotteryData.data_const_fun = function(key)
	local data=Config.HolyEqmLotteryData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolyEqmLotteryData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------group_start-------------------
Config.HolyEqmLotteryData.data_group_length = 2
Config.HolyEqmLotteryData.data_group = {
	[1] = {group_id=1, name="大地神像", open_cond=0, open_desc="初始开启", loss_item_once={{17210,1}}, loss_gold_once=150, loss_item_ten={{17210,10}}, loss_gold_ten=1350, gain_once={{1,10000}}, award={{99110203,1},{99090201,1},{99120204,1},{99100202,1},{99130202,1},{99140202,1},{10030,1},{28,1}}, free_times=1, effect_id=1004, discount_res="txt_cn_heavendial_9", desc="【大地神像】祈祷奖励一览:\n\n神装碎片: 45.13%\n天界神石: 28.50%\n1星凡品: 5.70%\n2星凡品: 3.80%\n3星凡品: 2.38%\n1星良品: 4.42%\n2星良品: 3.48%\n3星良品: 2.23%\n1星极品: 2.02%\n2星极品: 1.36%\n3星极品: 1.00%\n", can_set_ids={101,102,103,104,201,202,203,204,301,302,303,304,401,402,403,404,501,502,503,504,601,602,603,604,701,702,703,704,801,802,803,804,901,902,903,904,1001,1002,1003,1004,1101,1102,1103,1104,1201,1202,1203,1204,1301,1302,1303,1304,1401,1402,1403,1404}, can_set_num=4, day_limit_count=200, shadow_res="shadow_1"},
	[2] = {group_id=2, name="圣洁神像", open_cond=10000, open_desc="战力值前5英雄的神装总评分达10000开启", loss_item_once={{17211,1}}, loss_gold_once=200, loss_item_ten={{17211,10}}, loss_gold_ten=1800, gain_once={{1,10000}}, award={{99110303,1},{99090301,1},{99120304,1},{99100302,1},{99130302,1},{99140302,1},{10030,1},{28,1}}, free_times=1, effect_id=1005, discount_res="txt_cn_heavendial_9", desc="【圣洁神像】祈祷奖励一览:\n\n神装碎片: 56.24%\n天界神石: 28.50%\n3星凡品: 2.38%\n4星凡品: 1.90%\n5星凡品: 1.43%\n3星良品: 2.43%\n4星良品: 2.34%\n5星良品: 1.66%\n3星极品: 1.48%\n4星极品: 0.98%\n5星极品: 0.69%\n", can_set_ids={101,102,103,104,201,202,203,204,301,302,303,304,401,402,403,404,501,502,503,504,601,602,603,604,701,702,703,704,801,802,803,804,901,902,903,904,1001,1002,1003,1004,1101,1102,1103,1104,1201,1202,1203,1204,1301,1302,1303,1304,1401,1402,1403,1404}, can_set_num=4, day_limit_count=200, shadow_res="shadow_2"}
}
Config.HolyEqmLotteryData.data_group_fun = function(key)
	local data=Config.HolyEqmLotteryData.data_group[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolyEqmLotteryData.data_group['..key..'])not found') return
	end
	return data
end
-- -------------------group_end---------------------


-- -------------------wish_show_start-------------------
Config.HolyEqmLotteryData.data_wish_show_length = 56
Config.HolyEqmLotteryData.data_wish_show = {
	[101] = {group_id=101, name="勇气耳环", icon=1010001, type=23, quality=4, type_desc="耳环", desc="战神阿瑞斯勇气的象征。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【防御】</div>。"},
	[102] = {group_id=102, name="勇气项链", icon=1010002, type=25, quality=4, type_desc="项链", desc="战神阿瑞斯勇气的象征。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【防御】</div>。"},
	[103] = {group_id=103, name="勇气戒指", icon=1010003, type=24, quality=4, type_desc="戒指", desc="战神阿瑞斯勇气的象征。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【防御】</div>。"},
	[104] = {group_id=104, name="勇气手镯", icon=1010004, type=26, quality=4, type_desc="手镯", desc="战神阿瑞斯勇气的象征。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【防御】</div>。"},
	[201] = {group_id=201, name="狂怒耳环", icon=2010001, type=23, quality=4, type_desc="耳环", desc="炎魔之王暴怒的意志。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>。"},
	[202] = {group_id=202, name="狂怒项链", icon=2010002, type=25, quality=4, type_desc="项链", desc="炎魔之王暴怒的意志。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>。"},
	[203] = {group_id=203, name="狂怒戒指", icon=2010003, type=24, quality=4, type_desc="戒指", desc="炎魔之王暴怒的意志。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>。"},
	[204] = {group_id=204, name="狂怒手镯", icon=2010004, type=26, quality=4, type_desc="手镯", desc="炎魔之王暴怒的意志。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>。"},
	[301] = {group_id=301, name="斗志耳环", icon=3010001, type=23, quality=4, type_desc="耳环", desc="剑豪卡赞高昂的斗志。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>。"},
	[302] = {group_id=302, name="斗志项链", icon=3010002, type=25, quality=4, type_desc="项链", desc="剑豪卡赞高昂的斗志。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>。"},
	[303] = {group_id=303, name="斗志戒指", icon=3010003, type=24, quality=4, type_desc="戒指", desc="剑豪卡赞高昂的斗志。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>。"},
	[304] = {group_id=304, name="斗志手镯", icon=3010004, type=26, quality=4, type_desc="手镯", desc="剑豪卡赞高昂的斗志。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>。"},
	[401] = {group_id=401, name="灵咏耳环", icon=4010001, type=23, quality=4, type_desc="耳环", desc="拉斐尔圣洁的歌咏。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【治疗】</div>。"},
	[402] = {group_id=402, name="灵咏项链", icon=4010002, type=25, quality=4, type_desc="项链", desc="拉斐尔圣洁的歌咏。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【治疗】</div>。"},
	[403] = {group_id=403, name="灵咏戒指", icon=4010003, type=24, quality=4, type_desc="戒指", desc="拉斐尔圣洁的歌咏。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【治疗】</div>。"},
	[404] = {group_id=404, name="灵咏手镯", icon=4010004, type=26, quality=4, type_desc="手镯", desc="拉斐尔圣洁的歌咏。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【治疗】</div>。"},
	[501] = {group_id=501, name="穿甲耳环", icon=5010001, type=23, quality=4, type_desc="耳环", desc="能够穿透最坚固【防御】的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>坦克职业</div>单位的伤害。"},
	[502] = {group_id=502, name="穿甲项链", icon=5010002, type=25, quality=4, type_desc="项链", desc="能够穿透最坚固【防御】的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>坦克职业</div>单位的伤害。"},
	[503] = {group_id=503, name="穿甲戒指", icon=5010003, type=24, quality=4, type_desc="戒指", desc="能够穿透最坚固【防御】的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>坦克职业</div>单位的伤害。"},
	[504] = {group_id=504, name="穿甲手镯", icon=5010004, type=26, quality=4, type_desc="手镯", desc="能够穿透最坚固【防御】的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>坦克职业</div>单位的伤害。"},
	[601] = {group_id=601, name="破法耳环", icon=6010001, type=23, quality=4, type_desc="耳环", desc="拥有破除魔法能力的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>法师职业</div>单位的伤害。"},
	[602] = {group_id=602, name="破法项链", icon=6010002, type=25, quality=4, type_desc="项链", desc="拥有破除魔法能力的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>法师职业</div>单位的伤害。"},
	[603] = {group_id=603, name="破法戒指", icon=6010003, type=24, quality=4, type_desc="戒指", desc="拥有破除魔法能力的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>法师职业</div>单位的伤害。"},
	[604] = {group_id=604, name="破法手镯", icon=6010004, type=26, quality=4, type_desc="手镯", desc="拥有破除魔法能力的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>法师职业</div>单位的伤害。"},
	[701] = {group_id=701, name="斗战耳环", icon=7010001, type=23, quality=4, type_desc="耳环", desc="能够媲美战士输出的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>战士职业</div>单位的伤害。"},
	[702] = {group_id=702, name="斗战项链", icon=7010002, type=25, quality=4, type_desc="项链", desc="能够媲美战士输出的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>战士职业</div>单位的伤害。"},
	[703] = {group_id=703, name="斗战戒指", icon=7010003, type=24, quality=4, type_desc="戒指", desc="能够媲美战士输出的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>战士职业</div>单位的伤害。"},
	[704] = {group_id=704, name="斗战手镯", icon=7010004, type=26, quality=4, type_desc="手镯", desc="能够媲美战士输出的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>战士职业</div>单位的伤害。"},
	[801] = {group_id=801, name="镇灵耳环", icon=8010001, type=23, quality=4, type_desc="耳环", desc="拥有镇压神灵能力的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>辅助职业</div>单位的伤害。"},
	[802] = {group_id=802, name="镇灵项链", icon=8010002, type=25, quality=4, type_desc="项链", desc="拥有镇压神灵能力的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>辅助职业</div>单位的伤害。"},
	[803] = {group_id=803, name="镇灵戒指", icon=8010003, type=24, quality=4, type_desc="戒指", desc="拥有镇压神灵能力的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>辅助职业</div>单位的伤害。"},
	[804] = {group_id=804, name="镇灵手镯", icon=8010004, type=26, quality=4, type_desc="手镯", desc="拥有镇压神灵能力的神装。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可提升英雄对<div fontcolor=#8bff8e>辅助职业</div>单位的伤害。"},
	[901] = {group_id=901, name="魔甲耳环", icon=9010001, type=23, quality=4, type_desc="耳环", desc="魔之护甲侵蚀灵魂。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【防御】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【魔甲】</div>（受击时对【攻击】者附加无视【防御】伤害）"},
	[902] = {group_id=902, name="魔甲项链", icon=9010002, type=25, quality=4, type_desc="项链", desc="魔之护甲侵蚀灵魂。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【防御】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【魔甲】</div>（受击时对【攻击】者附加无视【防御】伤害）"},
	[903] = {group_id=903, name="魔甲戒指", icon=9010003, type=24, quality=4, type_desc="戒指", desc="魔之护甲侵蚀灵魂。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【防御】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【魔甲】</div>（受击时对【攻击】者附加无视【防御】伤害）"},
	[904] = {group_id=904, name="魔甲手镯", icon=9010004, type=26, quality=4, type_desc="手镯", desc="魔之护甲侵蚀灵魂。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【防御】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【魔甲】</div>（受击时对【攻击】者附加无视【防御】伤害）"},
	[1001] = {group_id=1001, name="神战耳环", icon=10010001, type=23, quality=4, type_desc="耳环", desc="神之对决愈战愈勇。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【神战】</div>（每回合提升自身【攻击】）"},
	[1002] = {group_id=1002, name="神战项链", icon=10010002, type=25, quality=4, type_desc="项链", desc="神之对决愈战愈勇。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【神战】</div>（每回合提升自身【攻击】）"},
	[1003] = {group_id=1003, name="神战戒指", icon=10010003, type=24, quality=4, type_desc="戒指", desc="神之对决愈战愈勇。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【神战】</div>（每回合提升自身【攻击】）"},
	[1004] = {group_id=1004, name="神战手镯", icon=10010004, type=26, quality=4, type_desc="手镯", desc="神之对决愈战愈勇。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【攻击】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【神战】</div>（每回合提升自身【攻击】）"},
	[1101] = {group_id=1101, name="龙威耳环", icon=11010001, type=23, quality=4, type_desc="耳环", desc="巨龙之息不怒而威。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【龙威】</div>（暴击时额外附加无视【防御】伤害）"},
	[1102] = {group_id=1102, name="龙威项链", icon=11010002, type=25, quality=4, type_desc="项链", desc="巨龙之息不怒而威。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【龙威】</div>（暴击时额外附加无视【防御】伤害）"},
	[1103] = {group_id=1103, name="龙威戒指", icon=11010003, type=24, quality=4, type_desc="戒指", desc="巨龙之息不怒而威。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【龙威】</div>（暴击时额外附加无视【防御】伤害）"},
	[1104] = {group_id=1104, name="龙威手镯", icon=11010004, type=26, quality=4, type_desc="手镯", desc="巨龙之息不怒而威。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【暴击率】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【龙威】</div>（暴击时额外附加无视【防御】伤害）"},
	[1201] = {group_id=1201, name="神愈耳环", icon=12010001, type=23, quality=4, type_desc="耳环", desc="神愈之心庇护万物。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【治疗】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【神愈】</div>（【治疗】时为目标附加【护盾】）"},
	[1202] = {group_id=1202, name="神愈项链", icon=12010002, type=25, quality=4, type_desc="项链", desc="神愈之心庇护万物。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【治疗】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【神愈】</div>（【治疗】时为目标附加【护盾】）"},
	[1203] = {group_id=1203, name="神愈戒指", icon=12010003, type=24, quality=4, type_desc="戒指", desc="神愈之心庇护万物。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【治疗】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【神愈】</div>（【治疗】时为目标附加【护盾】）"},
	[1204] = {group_id=1204, name="神愈手镯", icon=12010004, type=26, quality=4, type_desc="手镯", desc="神愈之心庇护万物。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【治疗】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【神愈】</div>（【治疗】时为目标附加【护盾】）"},
	[1301] = {group_id=1301, name="极速耳环", icon=13010001, type=23, quality=4, type_desc="耳环", desc="如羽翼般轻盈。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【速度】</div>。"},
	[1302] = {group_id=1302, name="极速项链", icon=13010002, type=25, quality=4, type_desc="项链", desc="如羽翼般轻盈。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【速度】</div>。"},
	[1303] = {group_id=1303, name="极速戒指", icon=13010003, type=24, quality=4, type_desc="戒指", desc="如羽翼般轻盈。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【速度】</div>。"},
	[1304] = {group_id=1304, name="极速手镯", icon=13010004, type=26, quality=4, type_desc="手镯", desc="如羽翼般轻盈。\n\n集齐<div fontcolor=#8bff8e>2件套</div>和<div fontcolor=#8bff8e>4件套</div>并穿戴均可提升英雄的<div fontcolor=#8bff8e>【速度】</div>。"},
	[1401] = {group_id=1401, name="玄护耳环", icon=14010001, type=23, quality=4, type_desc="耳环", desc="玄护之力庇护万物。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【抗控】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【玄护】</div>（受控制时回复生命值）"},
	[1402] = {group_id=1402, name="玄护项链", icon=14010002, type=25, quality=4, type_desc="项链", desc="玄护之力庇护万物。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【抗控】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【玄护】</div>（受控制时回复生命值）"},
	[1403] = {group_id=1403, name="玄护戒指", icon=14010003, type=24, quality=4, type_desc="戒指", desc="玄护之力庇护万物。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【抗控】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【玄护】</div>（受控制时回复生命值）"},
	[1404] = {group_id=1404, name="玄护手镯", icon=14010004, type=26, quality=4, type_desc="手镯", desc="玄护之力庇护万物。\n\n集齐<div fontcolor=#8bff8e>2件套</div>并穿戴可提升英雄的<div fontcolor=#8bff8e>【抗控】</div>；\n<div fontcolor=#8bff8e>4件套</div>可激活技能<div fontcolor=#8bff8e>【玄护】</div>（受控制时回复生命值）"}
}
Config.HolyEqmLotteryData.data_wish_show_fun = function(key)
	local data=Config.HolyEqmLotteryData.data_wish_show[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolyEqmLotteryData.data_wish_show['..key..'])not found') return
	end
	return data
end
-- -------------------wish_show_end---------------------


-- -------------------wish_id_start-------------------
Config.HolyEqmLotteryData.data_wish_id_length = 4
Config.HolyEqmLotteryData.data_wish_id = {
	[23] = {
		[101] = {group_id=101},
		[201] = {group_id=201},
		[301] = {group_id=301},
		[401] = {group_id=401},
		[501] = {group_id=501},
		[601] = {group_id=601},
		[701] = {group_id=701},
		[801] = {group_id=801},
		[901] = {group_id=901},
		[1001] = {group_id=1001},
		[1101] = {group_id=1101},
		[1201] = {group_id=1201},
		[1301] = {group_id=1301},
		[1401] = {group_id=1401},
	},
	[25] = {
		[102] = {group_id=102},
		[202] = {group_id=202},
		[302] = {group_id=302},
		[402] = {group_id=402},
		[502] = {group_id=502},
		[602] = {group_id=602},
		[702] = {group_id=702},
		[802] = {group_id=802},
		[902] = {group_id=902},
		[1002] = {group_id=1002},
		[1102] = {group_id=1102},
		[1202] = {group_id=1202},
		[1302] = {group_id=1302},
		[1402] = {group_id=1402},
	},
	[24] = {
		[103] = {group_id=103},
		[203] = {group_id=203},
		[303] = {group_id=303},
		[403] = {group_id=403},
		[503] = {group_id=503},
		[603] = {group_id=603},
		[703] = {group_id=703},
		[803] = {group_id=803},
		[903] = {group_id=903},
		[1003] = {group_id=1003},
		[1103] = {group_id=1103},
		[1203] = {group_id=1203},
		[1303] = {group_id=1303},
		[1403] = {group_id=1403},
	},
	[26] = {
		[104] = {group_id=104},
		[204] = {group_id=204},
		[304] = {group_id=304},
		[404] = {group_id=404},
		[504] = {group_id=504},
		[604] = {group_id=604},
		[704] = {group_id=704},
		[804] = {group_id=804},
		[904] = {group_id=904},
		[1004] = {group_id=1004},
		[1104] = {group_id=1104},
		[1204] = {group_id=1204},
		[1304] = {group_id=1304},
		[1404] = {group_id=1404},
	},
}
-- -------------------wish_id_end---------------------


-- -------------------award_start-------------------
Config.HolyEqmLotteryData.data_award_length = 2
Config.HolyEqmLotteryData.data_award = {
	[1] = {
		[1] = {group_id=1, id=1, times=40, reward={{28,60}}},
		[2] = {group_id=1, id=2, times=80, reward={{28,60}}},
		[3] = {group_id=1, id=3, times=140, reward={{28,90}}},
		[4] = {group_id=1, id=4, times=200, reward={{39522,1}}},
	},
	[2] = {
		[1] = {group_id=2, id=1, times=40, reward={{28,80}}},
		[2] = {group_id=2, id=2, times=80, reward={{28,80}}},
		[3] = {group_id=2, id=3, times=140, reward={{28,120}}},
		[4] = {group_id=2, id=4, times=200, reward={{39523,1}}},
	},
}
-- -------------------award_end---------------------

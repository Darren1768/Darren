----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--training_camp_data.xml
--------------------------------------

Config = Config or {} 
Config.TrainingCampData = Config.TrainingCampData or {}

-- -------------------const_start-------------------
Config.TrainingCampData.data_const_length = 7
Config.TrainingCampData.data_const = {
	["training_camp_lev_limit"] = {key="training_camp_lev_limit", val=20, desc="开启条件"},
	["tips_rule"] = {key="tips_rule", val=1, desc="1.只有完成全部的初阶训练，才可以进入进阶训练！\n2.为了达到更好的训练效果，我们调整了部分英雄的属性，英雄实际属性请以游戏中实际数据为准！"},
	["city_tips_cd"] = {key="city_tips_cd", val=60, desc="主城小助手气泡CD（未完成全部初阶训练）"},
	["camp_tips_cd"] = {key="camp_tips_cd", val=10, desc="训练营看板娘气泡CD"},
	["city_complete_cd"] = {key="city_complete_cd", val=300, desc="主城小助手气泡CD（已完成全部初阶训练）"},
	["tips_title"] = {key="tips_title", val=1, desc="训练结束"},
	["tips_content"] = {key="tips_content", val=1, desc="冒险者大人您已完成全部训练，您已经是位成熟的冒险家了；教官需要去训练其他的新晋冒险者，今后的冒险之路要靠您自己从实战中总结经验教训，提升自身实力！&&img1"}
}
Config.TrainingCampData.data_const_fun = function(key)
	local data=Config.TrainingCampData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.TrainingCampData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------info_start-------------------
Config.TrainingCampData.data_info_length = 8
Config.TrainingCampData.data_info = {
	[1] = {id=1, target_id=96010, partner_id={96011,96012,96013}, required_partner={}, flag=0, formation=1, ban_pos={2,3,4,5}, unlock={}, reward={{3,50}}, name="种族克制教学", desc="种族属性之间相互克制，对应克制有伤害加成", message="种族克制效果：<div fontcolor=289b14>伤害+25% 命中+20%</div>&&img1&&例如：风种族的英雄对水种族的英雄造成的伤害有25%的加成，且有20%的命中加成&&img2&&img10", tips="风系能克制水系", type=1},
	[2] = {id=2, target_id=96020, partner_id={96021,96022,96023}, required_partner={{96029,4}}, flag=0, formation=1, ban_pos={2,3,5}, unlock={1}, reward={{3,50}}, name="控制教学", desc="冰冻能限制敌方某单位一定回合的行动，让其被动挨打", message="img3&&img4&&所有的控制技能都能限制敌方某单位的行动，控制技能包括冰冻、眩晕、石化等；冰冻是成功率最高的控制技能，但被冰冻的目标在受击3次后，将解除冰冻状态\n \n特别注意：若解除冰冻时，该回合已错过该英雄的出手时间（出手时间详情请看出手顺序关卡），则该回合该英雄不会出手&&img11", tips="耶梦加得能释放控制", type=1},
	[3] = {id=3, target_id=96030, partner_id={96031,96032,96033}, required_partner={{96039,4}}, flag=0, formation=1, ban_pos={2,3,5}, unlock={2}, reward={{3,50}}, name="减益buff教学", desc="减益buff能一定回合内降低某单位一定属性", message="img6&&减益buff能对目标造成一定的影响，比如降低防御、降低输出、受到持续伤害等等\n \n破甲技能能使敌方某目标一定回合内防御力削减，能让我方输出打出更高的伤害&&img12", tips="艾蕾莉亚能使对面防御降低", type=1},
	[4] = {id=4, target_id=96040, partner_id={96041,96042,96043}, required_partner={{96049,4}}, flag=0, formation=1, ban_pos={2,3,5}, unlock={3}, reward={{3,50}}, name="出手顺序教学", desc="角色的速度属性决定了其在战斗中的出手顺序", message="部分英雄的技能可以使对手降速，实现我方慢速的输出英雄能先手进攻。&&img5&&战斗每个回合开始时，将对双方全部英雄的速度进行排序，速度值越大，则排名越前；然后按照速度排名的先后双方英雄依次出手\n \n特别注意：若有多个英雄速度相同，则靠左边的英雄先出手；若靠左程度一样，则战力高的先出手&&img13", tips="冰雪女王能使对面减速", type=1},
	[5] = {id=5, target_id=96050, partner_id={96051,96052,96053}, required_partner={{96059,4}}, flag=0, formation=1, ban_pos={2,3,5}, unlock={4}, reward={{3,50}}, name="增益buff教学", desc="增益buff能一定程度提升我方单位的属性", message="img7&&增益buff的对象往往是我方英雄，能够根据技能效果，提升我方单位一定的属性，也能做到让我方英雄造成更多的伤害&&img14", tips="娜迦公主能提升己方属性", type=1},
	[6] = {id=6, target_id=96060, partner_id={96065}, required_partner={{96066,1}}, flag=0, formation=5, ban_pos={2,3}, unlock={5}, reward={{3,50}}, name="站位教学", desc="合理的站位能规避敌方的重火力进攻", message="img8&&一般而言，我们需要保护我方输出英雄，避开对方的直接攻击，让我方有反击的机会&&img15", tips="保护输出，避开黑龙（请拖动英雄变更站位）", type=1},
	[7] = {id=7, target_id=96070, partner_id={}, required_partner={{96075,3},{96076,2},{96077,1},{96078,4},{96079,5}}, flag=1, formation=0, ban_pos={}, unlock={6}, reward={{3,50}}, name="阵法教学", desc="特定的阵法能满足整体站位需求", message="img9&&某些特定的站位需求需要配合特定的阵法才能实现。例如上图，只有天攻阵能让我方三个英雄站在中间一列；同理，只有地绝阵能让我方三个英雄站在最后一列&&img16", tips="地绝阵，能让己方三个输出站后排", type=1},
	[8] = {id=8, target_id=96080, partner_id={96081,96082,96083}, required_partner={{96086,1},{96087,4},{96088,2},{96089,5}}, flag=0, formation=6, ban_pos={}, unlock={1,2,3,4,5,6,7}, reward={{3,100}}, name="阵容教学", desc="了解每个英雄的定位，合理搭配阵容，做到最强输出", message="合理的阵容搭配要兼顾治疗和输出，考虑英雄之间的协同能力，两位看起来很弱的英雄组合起来产生的化学反应会让人意想不到\n \n娜迦公主在我方一速出手可有效提升我方战士的输出；斯芬克斯和黑暗之主第一回合压低对方血量，第二回合大招爆发造成敌方减员；神灵大祭司提供了一定的回复能力\n \n那么你能补全这个阵容的最后一块拼图吗？提示，注意生存&&img17", tips="普罗米修斯能让己方暴击回血", type=2}
}
Config.TrainingCampData.data_info_fun = function(key)
	local data=Config.TrainingCampData.data_info[key]
	if DATA_DEBUG and data == nil then
		print('(Config.TrainingCampData.data_info['..key..'])not found') return
	end
	return data
end
-- -------------------info_end---------------------


-- -------------------city_tips_start-------------------
Config.TrainingCampData.data_city_tips_length = 13
Config.TrainingCampData.data_city_tips = {
	[1] = {id=1, desc="这儿有变强攻略哦~"},
	[2] = {id=2, desc="今天天气真好~"},
	[3] = {id=3, desc="ヾ(*´∀`)ﾉ 啦啦啦~♪"},
	[4] = {id=4, desc="良好的策略搭配是\n制胜的关键！"},
	[5] = {id=5, desc="哼哼~想我了吧？"},
	[6] = {id=6, desc="你是冒险大陆的希望！"},
	[7] = {id=7, desc="高输出类英雄往往\n很脆弱，需要坦克\n或辅助英雄保护！"},
	[8] = {id=8, desc="哼哼，精灵商店中可\n以刷到超便宜的道\n具呢~"},
	[9] = {id=9, desc="精灵商店和道具商\n城位于商业街中，\n多去逛逛哦！"},
	[10] = {id=10, desc="别忘了每周的竞技\n场挑战奖励哦~"},
	[11] = {id=11, desc="锻造屋可以助你打\n造更强力的装备和\n符文！"},
	[12] = {id=12, desc="精彩活动奖励多多，\n等着你来参与！~"},
	[13] = {id=13, desc="可从英雄图鉴页面中\n打开【图书馆】，\n浏览所有英雄神明~"}
}
Config.TrainingCampData.data_city_tips_fun = function(key)
	local data=Config.TrainingCampData.data_city_tips[key]
	if DATA_DEBUG and data == nil then
		print('(Config.TrainingCampData.data_city_tips['..key..'])not found') return
	end
	return data
end
-- -------------------city_tips_end---------------------


-- -------------------camp_tips_start-------------------
Config.TrainingCampData.data_camp_tips_length = 6
Config.TrainingCampData.data_camp_tips = {
	[1] = {id=1, desc="(。・`ω´・)ノ 认真训练！"},
	[2] = {id=2, desc="哼，今天可不会像昨天那样轻松！"},
	[3] = {id=3, desc="打起精神来！"},
	[4] = {id=4, desc="你好，冒险者！"},
	[5] = {id=5, desc="看，都很简单吧~"},
	[6] = {id=6, desc="要和我切磋？哈哈，有意思！"}
}
Config.TrainingCampData.data_camp_tips_fun = function(key)
	local data=Config.TrainingCampData.data_camp_tips[key]
	if DATA_DEBUG and data == nil then
		print('(Config.TrainingCampData.data_camp_tips['..key..'])not found') return
	end
	return data
end
-- -------------------camp_tips_end---------------------

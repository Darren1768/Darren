----------------------------------------------------
-- 此文件由数据工具生成
-- 我要变强数据配置--stronger_data.xml
--------------------------------------

Config = Config or {} 
Config.StrongerData = Config.StrongerData or {}

-- -------------------stronger_constant_start-------------------
Config.StrongerData.data_stronger_constant_length = 4
Config.StrongerData.data_stronger_constant = {
	["strong_level"] = {label="strong_level", val=10, desc="进入等级限制"},
	["guild_skill"] = {label="guild_skill", val=500, desc="联盟技能评分系数"},
	["artifact_skill"] = {label="artifact_skill", val=1000, desc="符文技能评分系数"},
	["partner_eqm1"] = {label="partner_eqm1", val=1000, desc="装备评分系数"}
}
Config.StrongerData.data_stronger_constant_fun = function(key)
	local data=Config.StrongerData.data_stronger_constant[key]
	if DATA_DEBUG and data == nil then
		print('(Config.StrongerData.data_stronger_constant['..key..'])not found') return
	end
	return data
end
-- -------------------stronger_constant_end---------------------


-- -------------------stronger_two_start-------------------
Config.StrongerData.data_stronger_two_length = 7
Config.StrongerData.data_stronger_two = {
	[1] = {id=1, name="英雄等级", sort=1, evt_type=203, icon=1001, limit={{[[lev]],1}}, desc="简单的培养，适合前期发展"},
	[2] = {id=2, name="装备穿戴", sort=2, evt_type=203, icon=1006, limit={{[[lev]],1}}, desc="穿戴装备可迅速提升实力"},
	[3] = {id=3, name="英雄星级", sort=3, evt_type=203, icon=1007, limit={{[[lev]],1}}, desc="大幅提升战力的关键"},
	[4] = {id=4, name="英雄进阶", sort=4, evt_type=203, icon=1005, limit={{[[lev]],1}}, desc="前期提升战力的关键"},
	[5] = {id=5, name="神器培养", sort=5, evt_type=201, icon=1004, limit={{[[lev]],1}}, desc="提升神器伤害和属性加成"},
	[6] = {id=6, name="公会技能", sort=6, evt_type=202, icon=1003, limit={{[[lev]],1}}, desc="后期最强属性增幅"},
	[7] = {id=7, name="符文培养", sort=7, evt_type=203, icon=1002, limit={{[[lev]],1}}, desc="英雄可获额外被动技能"}
}
Config.StrongerData.data_stronger_two_fun = function(key)
	local data=Config.StrongerData.data_stronger_two[key]
	if DATA_DEBUG and data == nil then
		print('(Config.StrongerData.data_stronger_two['..key..'])not found') return
	end
	return data
end
-- -------------------stronger_two_end---------------------


-- -------------------resource_one_start-------------------
Config.StrongerData.data_resource_one_length = 8
Config.StrongerData.data_resource_one = {
	[1] = {id=1, name="金币", sub_list={100,101,102,103,104,105,106,107,108,109}, desc="用于升级英雄/神器、商店购买等", evt_type=0, sort=1, icon=1},
	[2] = {id=2, name="钻石", sub_list={110,112,113,114,115,116}, desc="用于召唤、商城购买物品等", evt_type=0, sort=2, icon=3},
	[3] = {id=3, name="进阶石", sub_list={120,121,122,123,124}, desc="用于进阶英雄", evt_type=0, sort=3, icon=10001},
	[4] = {id=4, name="英雄碎片", sub_list={130,131,132,133,134,135,136,137}, desc="用于合成英雄", evt_type=0, sort=4, icon=29999},
	[5] = {id=5, name="英雄经验", sub_list={140,141,142,143,144,145,146}, desc="用于提升英雄等级", evt_type=0, sort=5, icon=22},
	[6] = {id=6, name="远航情报", sub_list={150,151}, desc="用于参与远航玩法", evt_type=0, sort=6, icon=7},
	[7] = {id=7, name="公会贡献", sub_list={170,171,172,173}, desc="用于升级公会技能、公会商店购买", evt_type=0, sort=7, icon=10},
	[8] = {id=8, name="神器材料", sub_list={180,181,182}, desc="用于升级神器及其技能", evt_type=0, sort=8, icon=72002}
}
Config.StrongerData.data_resource_one_fun = function(key)
	local data=Config.StrongerData.data_resource_one[key]
	if DATA_DEBUG and data == nil then
		print('(Config.StrongerData.data_resource_one['..key..'])not found') return
	end
	return data
end
-- -------------------resource_one_end---------------------


-- -------------------resource_two_start-------------------
Config.StrongerData.data_resource_two_length = 50
Config.StrongerData.data_resource_two = {
	[100] = {id=100, name="推图挂机", desc="通关越多，奖励越多~", evt_type=157, sort=100, icon=1},
	[101] = {id=101, name="试练塔", desc="参与试练塔获大量奖励", evt_type=160, sort=101, icon=1},
	[102] = {id=102, name="无尽试炼", desc="参与获大量金币", evt_type=153, sort=102, icon=1},
	[103] = {id=103, name="快速作战", desc="点击就送金币啦", evt_type=132, sort=103, icon=1},
	[104] = {id=104, name="每日点金", desc="参与获大量金币", evt_type=162, sort=104, icon=1},
	[105] = {id=105, name="日常副本", desc="点击就送金币啦", evt_type=152, sort=105, icon=1},
	[106] = {id=106, name="位面征战", desc="挑战获英雄碎片", evt_type=151, sort=106, icon=1},
	[107] = {id=107, name="神界冒险", desc="参与获大量金币", evt_type=407, sort=107, icon=1},
	[108] = {id=108, name="进阶历练", desc="完成进阶历练获金币奖励", evt_type=420, sort=108, icon=1},
	[109] = {id=109, name="家园", desc="参与家园玩法获大量金币", evt_type=418, sort=109, icon=1},
	[110] = {id=110, name="竞技场", desc="每日排名结算发钻石啦", evt_type=158, sort=110, icon=3},
	[111] = {id=111, name="日常成就", desc="完成成就获得钻石", evt_type=130, sort=111, icon=3},
	[112] = {id=112, name="远航悬赏", desc="你参与，我们就血亏", evt_type=126, sort=112, icon=3},
	[113] = {id=113, name="提升等级", desc="每次升级都能获钻石奖励", evt_type=157, sort=113, icon=3},
	[114] = {id=114, name="挂机收益", desc="挂机也能得钻石~", evt_type=157, sort=114, icon=3},
	[115] = {id=115, name="进阶历练", desc="完成进阶历练获大量钻石", evt_type=420, sort=115, icon=3},
	[116] = {id=116, name="家园", desc="参与家园玩法获钻石奖励", evt_type=418, sort=116, icon=3},
	[120] = {id=120, name="试练塔", desc="进阶石的主要来源之一", evt_type=160, sort=120, icon=10001},
	[121] = {id=121, name="精灵商店", desc="可直接购买进阶石", evt_type=134, sort=121, icon=10001},
	[122] = {id=122, name="推图挂机", desc="进阶石的主要来源之一", evt_type=157, sort=122, icon=10001},
	[123] = {id=123, name="日常副本", desc="参与副本获进阶石奖励", evt_type=152, sort=123, icon=10001},
	[124] = {id=124, name="神界冒险", desc="可直接购买进阶石", evt_type=407, sort=124, icon=10001},
	[130] = {id=130, name="推图挂机", desc="通关领取", evt_type=157, sort=130, icon=29999},
	[131] = {id=131, name="远航悬赏", desc="最高可获5星英雄碎片", evt_type=126, sort=131, icon=29999},
	[132] = {id=132, name="位面征战", desc="可在征战商店中兑换英雄碎片", evt_type=151, sort=132, icon=29999},
	[133] = {id=133, name="精灵商店", desc="可购买英雄碎片", evt_type=134, sort=133, icon=29999},
	[134] = {id=134, name="先知圣殿", desc="抽取4、5星英雄及其碎片", evt_type=204, sort=134, icon=29999},
	[135] = {id=135, name="竞技场", desc="可在竞技商店兑换英雄碎片", evt_type=158, sort=135, icon=29999},
	[136] = {id=136, name="神界冒险", desc="参与玩法获英雄碎片奖励", evt_type=407, sort=136, icon=29999},
	[137] = {id=137, name="家园", desc="参与玩法获英雄碎片", evt_type=418, sort=137, icon=29999},
	[140] = {id=140, name="推图挂机", desc="通关越多，奖励越多~", evt_type=157, sort=140, icon=22},
	[141] = {id=141, name="试练塔", desc="通关和扫荡都能获得英雄经验呢", evt_type=160, sort=141, icon=22},
	[142] = {id=142, name="无尽试炼", desc="参与可获英雄经验", evt_type=153, sort=142, icon=22},
	[143] = {id=143, name="日常副本", desc="每日挑战可获大量经验", evt_type=152, sort=143, icon=22},
	[144] = {id=144, name="快速作战", desc="点击就送经验", evt_type=132, sort=144, icon=22},
	[145] = {id=145, name="精灵商店", desc="可直接购买经验哦", evt_type=134, sort=145, icon=22},
	[146] = {id=146, name="神界冒险", desc="参与玩法获大量英雄经验", evt_type=407, sort=146, icon=22},
	[150] = {id=150, name="推图挂机", desc="通关越多，奖励越多~", evt_type=157, sort=150, icon=7},
	[151] = {id=151, name="快速作战", desc="点击就送啦", evt_type=132, sort=151, icon=7},
	[160] = {id=160, name="远航悬赏", desc="完成远航获取符文碎片", evt_type=126, sort=160, icon=10454},
	[161] = {id=161, name="冠军赛", desc="高级符文等你来拿", evt_type=159, sort=161, icon=10454},
	[162] = {id=162, name="符文合成", desc="低级符文合成高级符文", evt_type=161, sort=161, icon=10454},
	[163] = {id=163, name="挂机掉落", desc="掉落大量低级符文~", evt_type=157, sort=161, icon=10454},
	[170] = {id=170, name="公会捐献", desc="捐献可直接获得奖励哦", evt_type=145, sort=170, icon=10},
	[171] = {id=171, name="公会副本", desc="挑战Boss获贡献奖励~", evt_type=146, sort=171, icon=10},
	[172] = {id=172, name="公会活跃任务", desc="完成活跃任务获贡献奖励", evt_type=419, sort=172, icon=10},
	[173] = {id=173, name="公会战", desc="参与获大量贡献奖励", evt_type=419, sort=173, icon=10},
	[180] = {id=180, name="成就", desc="可获炼神石和神器符石", evt_type=130, sort=180, icon=72001},
	[181] = {id=181, name="位面征战", desc="可在征战商店中兑换炼神石", evt_type=151, sort=181, icon=72001},
	[182] = {id=182, name="神界冒险", desc="参与获炼神石奖励", evt_type=407, sort=182, icon=72001}
}
Config.StrongerData.data_resource_two_fun = function(key)
	local data=Config.StrongerData.data_resource_two[key]
	if DATA_DEBUG and data == nil then
		print('(Config.StrongerData.data_resource_two['..key..'])not found') return
	end
	return data
end
-- -------------------resource_two_end---------------------


-- -------------------recommand_start-------------------
Config.StrongerData.data_recommand_length = 15
Config.StrongerData.data_recommand = {
	[1] = {id=1, name="新手推荐", hero_list={{30402,30508,30501,20508,10501}}, sort=100, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>斯芬克斯、娜迦公主</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>锋矢阵。</div>奥丁负责嘲讽敌方前排英雄，娜迦公主可以提高我方输出的生存能力；斯芬克斯可以在压低敌方血线的同时有几率沉默对手，最后由我方其他战士英雄进行收割。"},
	[2] = {id=2, name="初级推荐1", hero_list={{20507,10505,30502,40506,50504}}, sort=101, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>黑暗之主、普罗米修斯</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>地绝阵。</div>普罗米修斯的[生命火种]使我方单位打出暴击时获得生命回复，艾蕾莉亚【破甲】提供增伤，影刹保护后排英雄，配合战士队伍能提供一定的生存同时又有较高的输出能力。"},
	[3] = {id=3, name="水系最强", hero_list={{10504,10505,10511,10510,10502}}, sort=110, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>酒神、耶梦加得、冰雪女王</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249004>地绝阵。</div>泰坦能为我方英雄提高保护，酒神用来提高我方的生存能力，再由冰雪女王的冰冻使对手无法行动，最后由耶梦加得与波塞冬担任主力输出。"},
	[4] = {id=4, name="火系最强", hero_list={{20508,20511,20507,20510,20504}}, sort=111, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>哪吒、普罗米修斯、菲尼克斯</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249005>地绝阵。</div>哪吒的四技能可以大幅提高【灼烧】伤害，菲尼克斯和瓦尔基里都可以为敌方附加【灼烧】状态，配合普罗米修斯的暴击回复可以产生极高的治疗量，菲尼克斯和海姆达尔都是优秀的坦克型英雄可以在前排承担伤害。"},
	[5] = {id=5, name="风系最强", hero_list={{30508,30502,30507,30511,30509}}, sort=112, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>斯芬克斯、潘、辛西娅</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249006>地绝阵。</div>斯芬克斯能有效对对手造成输出与控制效果，辛西娅提高我方整体输出，复活友军的特性可以提高我方的容错，影刹与潘能保护我方输出英雄，芬尼尔可作为我方输出主力。"},
	[6] = {id=6, name="暗系最强", hero_list={{50509,50507,50504,50510,50508}}, sort=113, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>尼德霍格、阿蒙、海拉</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249007>圣灵阵。</div>潘多拉负责为我方提供续航，同时降低对手的输出。阿蒙提供增益buff并随机转移一个debuff给敌方单位，尼德霍格变身后可以打出极高的爆发伤害，海拉压低敌方血线，最后配合黑暗之主点杀敌方单位。"},
	[7] = {id=7, name="光系最强", hero_list={{40507,40506,40503,40509,40508}}, sort=114, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>维纳斯、赫拉、拉斐尔</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249008>地绝阵。</div>维纳斯在纯光队伍中可以打出高额爆发，赫拉可清除对手的增益Buff并造成大量伤害，拉斐尔驱散负面状态提升我方伤害，配合艾蕾莉亚可在第二回合打出超高爆发，神灵大祭司优秀的回复，使队伍具有极高的续航和输出能力"},
	[8] = {id=8, name="初级推荐2", hero_list={{20511,30508,50504,40507,10501}}, sort=102, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>娜迦公主、海姆达尔</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>圣灵阵。</div>娜迦公主可以提升我方输出能力，神灵大祭司与娜迦公主的双复活保证续航和容错，海姆达尔作为坦克英雄保护我方中后排英雄，斯芬克斯黑暗之主都是优秀的输出英雄在增益buff的加持下打出高额伤害。"},
	[9] = {id=9, name="热门推荐1", hero_list={{20507,20510,30507,30508,30509}}, sort=105, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>芬尼尔、普罗米修斯、哪吒</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>地绝阵。</div>芬尼尔适合半肉半输出的符文配置，在第二回合打出超高伤害，哪吒变身后可以打出高额的爆发，配合斯芬克斯点杀残血单位，普罗米修斯和潘能为队伍提供不俗的回复能力。"},
	[10] = {id=10, name="热门推荐2", hero_list={{30507,30508,30509,40507,40508}}, sort=106, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>拉斐尔、芬尼尔、斯芬克斯</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>地绝阵。</div>拉斐尔能有效提升我方英雄整体输出，驱散负面状态，芬尼尔前中排积攒怒气第二回合打出高额爆发，配合斯芬克斯优秀的点杀能力造成减员。潘和神灵大祭司为队伍提供了可靠稳定的回复能力。"},
	[11] = {id=11, name="热门推荐3", hero_list={{40506,40508,50504,50508,50509}}, sort=107, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>拉斐尔、海拉、尼德霍格</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>地绝阵。</div>拉斐尔和艾蕾莉亚提升我方输出并提供一定的保护能力，海拉可在敌方英雄阵亡后可以提供可观的回复，黑暗之主压低血线，尼德霍格变身后打出巨额伤害，队伍有较高容错性。"},
	[12] = {id=12, name="初级推荐3", hero_list={{30508,30507,30502,10510,10512}}, sort=103, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>斯芬克斯、利维坦、耶梦加得</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>地绝阵。</div>斯芬克斯、利维坦、耶梦加得一回合压低对手血线，第二回合打出爆炸输出，利用利维坦追击的特性造成对方多人减员，影刹为我方后排提供庇护，潘为我方带来优秀的回复。"},
	[13] = {id=13, name="热门推荐4", hero_list={{30511,30509,40503,40507,40508}}, sort=108, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>辛西娅、芬尼尔、拉斐尔</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>地绝阵。</div>拉斐尔为全队增伤，提供庇护，赫拉驱散敌方增益buff，辛西娅为队友提供回复的同时又有不俗的输出，芬尼尔半肉半输出，可以在第二回合打出高额爆发。"},
	[14] = {id=14, name="热门推荐5", hero_list={{30509,30507,20507,20510,20511}}, sort=109, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>芬尼尔，哪吒，普罗米修斯</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>地绝阵。</div>普罗米修斯在友方暴击时能为我方提供高额的生命回复，海姆达尔保护我方后排英雄也能打出不俗的伤害，芬尼尔和哪吒是这套阵容的主力输出。"},
	[15] = {id=15, name="初级推荐4", hero_list={{10505,10502,10511,20510,20504}}, sort=104, limit=0, desc="<div fontcolor=#d95014>核心英雄：</div><div fontcolor=#249003>波塞冬、哪吒</div>\n<div fontcolor=#d95014>推荐阵法：</div><div fontcolor=#249003>地绝阵。</div>哪吒与菲尼克斯组成灼烧队伍，波塞冬和哪吒集火敌方前排，冰雪女王降低敌方速度，酒神提供续航，队伍输出方式多样，有优秀的续航能力。"}
}
Config.StrongerData.data_recommand_fun = function(key)
	local data=Config.StrongerData.data_recommand[key]
	if DATA_DEBUG and data == nil then
		print('(Config.StrongerData.data_recommand['..key..'])not found') return
	end
	return data
end
-- -------------------recommand_end---------------------


-- -------------------problem_start-------------------
Config.StrongerData.data_problem_length = 8
Config.StrongerData.data_problem = {
	[1] = {id=1, name="怎样选择上阵英雄？", desc="<div fontcolor=#249003>  →注意职业搭配：</div>\n一个完整的阵容一般可由<div fontcolor=#249003>坦克英雄</div>（负责保护控制）；<div fontcolor=#249003>战士、法师英雄</div>（负责制造伤害）；<div fontcolor=#249003>辅助英雄</div>（负责治疗增益）这三部分组成\n<div fontcolor=#249003>  →注意种族克制：</div>\n阵营克制效果会在战斗中带来可观的伤害加成，根据敌方种族合理选择其克制种族也是胜利的关键\n<div fontcolor=#249003>  →注意阵型搭配：</div>\n上阵指定种族的英雄也可在战斗中获得属性加成，根据自己已有的英雄合理搭配阵型也能大幅提高胜率呢；具体搭配可在[英雄出战]面板中点击阵营图标查看\n<div fontcolor=#249003>  →注意技能组合：</div>\n大部分英雄的技能是可以相互配合的。例如炎魔之王的[炎魔之怒]给敌方附加<div fontcolor=#249003>灼烧</div>状态，而瓦尔基里的[英灵斩]则必定<div fontcolor=#249003>对灼烧单位造成暴击伤害</div>。还有更多厉害的组合等你去发掘~", sort=1},
	[2] = {id=2, name="如何选择阵法？", desc="<div fontcolor=#249003>  →根据我方英雄职业：</div>\n可根据实际上阵的英雄职业决定。例如上阵了<div fontcolor=#249003>2个肉盾型英雄</div>，推荐使用<div fontcolor=#249003>圣灵阵</div>，从而加强对我方其他英雄的保护\n<div fontcolor=#249003>  →根据对手的阵容：</div>\n还可根据对手上阵的英雄来决定。对于某些特定的AOE伤害（如奥丁的舞动之刃：攻击敌方前两排所有英雄），通过<div fontcolor=#249003>调整站位</div>来规避此类控制技能\n<div fontcolor=#249003>  →更换阵法：</div>\n若遇到打不过的战斗，调整阵法再战可能会有奇效哦", sort=6},
	[3] = {id=3, name="如何给英雄升星？", desc="<div fontcolor=#249003>→升星的好处：</div>\n  升星能大幅提升英雄的属性；同时升星也是提升英雄技能等级的唯一途径\n<div fontcolor=#249003>→如何升星：</div>\n  前往主城界面中的[融合神殿]，选择你想升星的英雄，根据提示放入其他指定英雄就可以升星啦；6星英雄可在英雄培养界面中直接进行升星操作哦~\n<div fontcolor=#249003>→友情提示：</div>\n  因为一股神秘的力量，导致不是所有英雄都能升到最高星级呢，培养英雄的时候可要注意啦", sort=2},
	[4] = {id=4, name="如何让我的小伙伴快速成长？", desc="<div fontcolor=#249003>  →</div>每日免费的<div fontcolor=#249003>召唤、点金和快速作战</div>千万别错过啦\n<div fontcolor=#249003>  →</div>每日可在<div fontcolor=#249003>历练</div>中挑战日常副本、参与各种玩法可获得各种收益\n<div fontcolor=#249003>  →</div>每日在竞技场给排行榜中的玩家点赞也可获得金币哦\n<div fontcolor=#249003>  →</div>加入联盟，消耗贡献学习联盟技能也能让英雄获得极大的提升\n<div fontcolor=#249003>  →</div>最重要的[挂机收益]可别忘记每天上线领取哦~", sort=3},
	[5] = {id=5, name="英雄的各种技能效果有什么作用？", desc="1.灼烧、流血、诅咒、中毒\n   每回合受到固定伤害，叠加的层数越多，伤害越高\n2.眩晕、石化、冰冻、睡眠、麻痹\n   英雄无法行动\n3.封印\n   携带该状态的单位无法产生暴击，被动技能无法触发\n4.虚弱\n   携带该状态的单位停止行动1回合，该状态不可叠加\n5.沉默\n   携带该状态的单位无法使用技能\n6.嘲讽\n   携带该状态的单位将强制只用普攻攻击嘲讽者\n7.技能效果的命中率\n   技能效果的实际命中率=效果命中属性-效果抵抗属性\n8.Buff的叠加规则\n   同类Buff默认不叠加，可叠加的Buff将在Buff描述中特殊说明；\n   某些Buff在与其他同类Buff共存时只生效最强的1个（例如破甲），且预览中只显示其中1层（因此当英雄身上其中1层该类Buff被“驱散”或“嫁祸转移”后，依然会显示1层）", sort=7},
	[6] = {id=6, name="战斗中英雄的出手顺序是怎样的？", desc="<div fontcolor=#249003>→出手顺序</div>\n每回合开始时，根据场中单位<div fontcolor=#249003>速度高低</div>，决定本回合的出手顺序，过程中改变速度，会在下一回合开始时影响出手顺序\n（注：冰雪女王战斗开始时的减速，第一回合就会生效）", sort=8},
	[7] = {id=7, name="如何快速提升角色升级？", desc="<div fontcolor=#249003>→角色经验的获取：</div>\n  剧情战斗、剧情挂机和快速作战是获取角色经验的唯一途径，达到的关卡数越高，挂机获得的角色经验越多\n<div fontcolor=#249003>→快速作战相关：</div>\n  快速作战可<div fontcolor=#249003>直接获得120分钟的挂机收益</div>，是获得角色经验的捷径哦\n<div fontcolor=#249003>→特别提示：</div>\n  Vip等级越高，每次挂机获得的各项收益也就越高哦；购买<div fontcolor=#249003>快速作战特权</div>后每日可获得3次免费快速作战次数，还能额外购买11次作速作战，想要快速升级的冒险者大人千万不能错过啦", sort=4},
	[8] = {id=8, name="钻石如何使用性价比最高？", desc="<div fontcolor=#249003>→快速作战：</div>\n  每次快速作战都能直接获得120分钟的挂机收益，小助手建议每日都买满哦~\n<div fontcolor=#249003>→日常副本：</div>\n  使用钻石购买日常副本次数也是很划算的哦\n<div fontcolor=#249003>→远航订单：</div>\n  若遇到不想要远航订单，那就放心用钻石去刷新吧，更好的奖励等着你呢\n<div fontcolor=#249003>→公会副本：</div>\n  购买次数加速副本的推进，从而更快的获得公会贡献哦，另外自己的伤害排名越高，获得的公会贡献也越多呢\n<div fontcolor=#249003>→特别提示：</div>\n  特权商城的远航礼包一定要记得购买哦；达到VIP2后每日还能购买超值高级召唤卷1个~", sort=5}
}
Config.StrongerData.data_problem_fun = function(key)
	local data=Config.StrongerData.data_problem[key]
	if DATA_DEBUG and data == nil then
		print('(Config.StrongerData.data_problem['..key..'])not found') return
	end
	return data
end
-- -------------------problem_end---------------------

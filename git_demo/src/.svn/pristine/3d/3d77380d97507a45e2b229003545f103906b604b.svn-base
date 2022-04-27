----------------------------------------------------
-- 此文件由数据工具生成
-- 最强仙尊-神殿--primus_data.xml
--------------------------------------

Config = Config or {} 
Config.PrimusData = Config.PrimusData or {}

-- -------------------const_start-------------------
Config.PrimusData.data_const_length = 7
Config.PrimusData.data_const = {
	["open_lev"] = {val=35, desc="达到35级后开启"},
	["open_dun_id"] = {val=0, desc="副本开启"},
	["daily_challenge_limit"] = {val=1599, desc="每日挑战次数限制"},
	["evolution_limit"] = {val=1599, desc="进化次数上限"},
	["lose_challange_cd"] = {val=1200, desc="挑战失败后的冷却cd"},
	["game_rule"] = {val=1, desc="1.竞技场排名达到指定名次内可挑战神位，3类神位分别对应排名条件为<div fontcolor=289b14>前10名</div>、<div fontcolor=289b14>前20名</div>、<div fontcolor=289b14>前50名</div>\n2.挑战成功后，玩家会取代神位上的Boss，并且获得对应的<div fontcolor=289b14>神位称号</div>，装配称号可享受强大<div fontcolor=289b14>属性加成</div>\n3.若在位玩家被其他挑战者挑战成功，则挑战者则替换该玩家成为新的神位主人，同时丧失神位的玩家称号将失效\n4.每位挑战者只可占有一个神位，在位期间若挑战其他神位成功，将丧失原有的神位\n5.挑战失败将进入<div fontcolor=289b14>20分钟</div>的冷却时间，期间无法挑战任何神位"},
	["redpoint_close_condition"] = {val=60, desc="红点关闭的等级"}
}
Config.PrimusData.data_const_fun = function(key)
	local data=Config.PrimusData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PrimusData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------upgrade_start-------------------
Config.PrimusData.data_upgrade_length = 6
Config.PrimusData.data_upgrade = {
	[1] = {pos=1, name="万殿之巅", honor_id=90801, look_id=340502, arena_rank=10},
	[2] = {pos=2, name="泰坦神耀", honor_id=90802, look_id=320508, arena_rank=20},
	[3] = {pos=3, name="泰坦神耀", honor_id=90802, look_id=330506, arena_rank=20},
	[4] = {pos=4, name="瀚海星灵", honor_id=90803, look_id=310501, arena_rank=50},
	[5] = {pos=5, name="瀚海星灵", honor_id=90803, look_id=310501, arena_rank=50},
	[6] = {pos=6, name="瀚海星灵", honor_id=90803, look_id=310501, arena_rank=50}
}
Config.PrimusData.data_upgrade_fun = function(key)
	local data=Config.PrimusData.data_upgrade[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PrimusData.data_upgrade['..key..'])not found') return
	end
	return data
end
-- -------------------upgrade_end---------------------


-- -------------------unitdata_start-------------------
Config.PrimusData.data_unitdata_length = 48
Config.PrimusData.data_unitdata = {
	["1_0"] = {pos=1, min=0, max=99, unit_id=81011, attr={{'atk_per',12},{'def_per',6},{'hp_max_per',11},{'speed_per',6}}, act_skill={503101,503301}, passive_skill={503201,503401}, look_id=330508},
	["1_100"] = {pos=1, min=100, max=199, unit_id=81012, attr={{'atk_per',13},{'def_per',5},{'hp_max_per',14},{'speed_per',4}}, act_skill={513103,513302}, passive_skill={513202,513402,750000}, look_id=310510},
	["1_200"] = {pos=1, min=200, max=299, unit_id=81013, attr={{'atk_per',9},{'def_per',3},{'hp_max_per',10},{'speed_per',3}}, act_skill={506103,506302}, passive_skill={506202,506402,750200}, look_id=320508},
	["1_300"] = {pos=1, min=300, max=399, unit_id=81014, attr={{'atk_per',4},{'def_per',3},{'hp_max_per',7},{'speed_per',2}}, act_skill={521103}, passive_skill={521203,521302,521402,750201,750401}, look_id=350509},
	["1_400"] = {pos=1, min=400, max=499, unit_id=81015, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',3},{'speed_per',2}}, act_skill={520103}, passive_skill={520203,520303,520402,750201,750401}, look_id=320510},
	["1_500"] = {pos=1, min=500, max=799, unit_id=81016, attr={{'atk_per',2},{'def_per',2},{'hp_max_per',2},{'speed_per',1}}, act_skill={515103,515303}, passive_skill={515203,515403,750202,750402,700035,700015}, look_id=330509},
	["1_800"] = {pos=1, min=800, max=999, unit_id=81017, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',3},{'speed_per',1}}, act_skill={519103,519303}, passive_skill={519203,519403,750002,700145,700235,700005}, look_id=340509},
	["1_1000"] = {pos=1, min=1000, max=1599, unit_id=81018, attr={{'atk_per',1},{'def_per',0},{'hp_max_per',1},{'speed_per',0}}, act_skill={516103,516303}, passive_skill={516203,516403,750202,750402,700035,700015}, look_id=350508},
	["2_0"] = {pos=2, min=0, max=99, unit_id=81021, attr={{'atk_per',12},{'def_per',8},{'hp_max_per',13},{'speed_per',7}}, act_skill={153102,153302}, passive_skill={153202,153402,750200}, look_id=350504},
	["2_100"] = {pos=2, min=100, max=199, unit_id=81022, attr={{'atk_per',13},{'def_per',4},{'hp_max_per',13},{'speed_per',5}}, act_skill={526103,526302}, passive_skill={526202,526402,700221}, look_id=310512},
	["2_200"] = {pos=2, min=200, max=299, unit_id=81023, attr={{'atk_per',9},{'def_per',3},{'hp_max_per',10},{'speed_per',3}}, act_skill={520103}, passive_skill={520203,520302,520402,750201,750401}, look_id=320510},
	["2_300"] = {pos=2, min=300, max=399, unit_id=81024, attr={{'atk_per',6},{'def_per',3},{'hp_max_per',6},{'speed_per',2}}, act_skill={256103,256302}, passive_skill={256202,750001,700143}, look_id=340503},
	["2_400"] = {pos=2, min=400, max=499, unit_id=81025, attr={{'atk_per',2},{'def_per',2},{'hp_max_per',4},{'speed_per',1}}, act_skill={515103,515303}, passive_skill={515203,515403,750202,750402,700035,700015}, look_id=330509},
	["2_500"] = {pos=2, min=500, max=799, unit_id=81026, attr={{'atk_per',2},{'def_per',2},{'hp_max_per',2},{'speed_per',1}}, act_skill={521103}, passive_skill={521203,521303,521403,750202,750402,700035,700015}, look_id=350509},
	["2_800"] = {pos=2, min=800, max=999, unit_id=81027, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',3},{'speed_per',1}}, act_skill={503103,503303}, passive_skill={503203,503403,750202,750402,700035,700015}, look_id=330508},
	["2_1000"] = {pos=2, min=1000, max=1599, unit_id=81028, attr={{'atk_per',1},{'def_per',1},{'hp_max_per',1},{'speed_per',0}}, act_skill={519103,519303}, passive_skill={519203,519403,750002,700145,700235,700005}, look_id=340509},
	["3_0"] = {pos=3, min=0, max=99, unit_id=81091, attr={{'atk_per',12},{'def_per',8},{'hp_max_per',13},{'speed_per',7}}, act_skill={512102,512302}, passive_skill={512202,512402,750200}, look_id=320509},
	["3_100"] = {pos=3, min=100, max=199, unit_id=81092, attr={{'atk_per',13},{'def_per',4},{'hp_max_per',13},{'speed_per',5}}, act_skill={526103,526302}, passive_skill={526202,526402,700221}, look_id=310512},
	["3_200"] = {pos=3, min=200, max=299, unit_id=81093, attr={{'atk_per',9},{'def_per',3},{'hp_max_per',10},{'speed_per',3}}, act_skill={506103,506302}, passive_skill={506203,506402,750201,750401}, look_id=320508},
	["3_300"] = {pos=3, min=300, max=399, unit_id=81094, attr={{'atk_per',6},{'def_per',3},{'hp_max_per',6},{'speed_per',2}}, act_skill={515103,515303}, passive_skill={515203,515402,750201,750401}, look_id=330509},
	["3_400"] = {pos=3, min=400, max=499, unit_id=81095, attr={{'atk_per',2},{'def_per',2},{'hp_max_per',4},{'speed_per',1}}, act_skill={256103,256303}, passive_skill={256202,750001,700143}, look_id=340503},
	["3_500"] = {pos=3, min=500, max=799, unit_id=81096, attr={{'atk_per',2},{'def_per',2},{'hp_max_per',2},{'speed_per',1}}, act_skill={520103}, passive_skill={520203,520303,520403,750202,750402,700035,700015}, look_id=320510},
	["3_800"] = {pos=3, min=800, max=999, unit_id=81097, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',3},{'speed_per',1}}, act_skill={244103,244303}, passive_skill={244203,244403,750002,700145,700235,700005}, look_id=320505},
	["3_1000"] = {pos=3, min=1000, max=1599, unit_id=81098, attr={{'atk_per',1},{'def_per',1},{'hp_max_per',1},{'speed_per',0}}, act_skill={503103,503303}, passive_skill={503203,503403,750202,750402,700035,700015}, look_id=330508},
	["4_0"] = {pos=4, min=0, max=99, unit_id=81031, attr={{'atk_per',12},{'def_per',8},{'hp_max_per',13},{'speed_per',9}}, act_skill={516101,516301}, passive_skill={516201,516401}, look_id=350508},
	["4_100"] = {pos=4, min=100, max=199, unit_id=81032, attr={{'atk_per',13},{'def_per',5},{'hp_max_per',13},{'speed_per',4}}, act_skill={503102,503302}, passive_skill={503202,503402,750200}, look_id=330508},
	["4_200"] = {pos=4, min=200, max=299, unit_id=81033, attr={{'atk_per',9},{'def_per',4},{'hp_max_per',11},{'speed_per',3}}, act_skill={520103}, passive_skill={520202,520302,520402,750200}, look_id=320510},
	["4_300"] = {pos=4, min=300, max=399, unit_id=81034, attr={{'atk_per',6},{'def_per',3},{'hp_max_per',6},{'speed_per',2}}, act_skill={256103,256302}, passive_skill={256202,750001,700143}, look_id=340503},
	["4_400"] = {pos=4, min=400, max=499, unit_id=81035, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',4},{'speed_per',2}}, act_skill={515103,515303}, passive_skill={515203,515402,750201,750401}, look_id=330509},
	["4_500"] = {pos=4, min=500, max=799, unit_id=81036, attr={{'atk_per',2},{'def_per',2},{'hp_max_per',2},{'speed_per',1}}, act_skill={251103,251303}, passive_skill={251203,251403,750002,700145,700235,700005}, look_id=350505},
	["4_800"] = {pos=4, min=800, max=999, unit_id=81037, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',3},{'speed_per',1}}, act_skill={521103}, passive_skill={521203,521303,521403,750202,750402,700035,700015}, look_id=350509},
	["4_1000"] = {pos=4, min=1000, max=1599, unit_id=81038, attr={{'atk_per',1},{'def_per',1},{'hp_max_per',1},{'speed_per',0}}, act_skill={526103,526303}, passive_skill={526203,526403,700225,750102,700235,700175}, look_id=310512},
	["5_0"] = {pos=5, min=0, max=99, unit_id=81041, attr={{'atk_per',12},{'def_per',8},{'hp_max_per',13},{'speed_per',9}}, act_skill={503101,503301}, passive_skill={503201,503401}, look_id=330508},
	["5_100"] = {pos=5, min=100, max=199, unit_id=81042, attr={{'atk_per',13},{'def_per',5},{'hp_max_per',13},{'speed_per',4}}, act_skill={520102}, passive_skill={520202,520302,520402,750200}, look_id=320510},
	["5_200"] = {pos=5, min=200, max=299, unit_id=81043, attr={{'atk_per',9},{'def_per',4},{'hp_max_per',11},{'speed_per',3}}, act_skill={526103,526302}, passive_skill={526202,526402,700221}, look_id=310512},
	["5_300"] = {pos=5, min=300, max=399, unit_id=81044, attr={{'atk_per',6},{'def_per',3},{'hp_max_per',6},{'speed_per',2}}, act_skill={515103,515302}, passive_skill={515203,515402,750201,750401}, look_id=330509},
	["5_400"] = {pos=5, min=400, max=499, unit_id=81045, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',4},{'speed_per',2}}, act_skill={516103,516303}, passive_skill={516203,516402,750201,750401}, look_id=350508},
	["5_500"] = {pos=5, min=500, max=799, unit_id=81046, attr={{'atk_per',2},{'def_per',2},{'hp_max_per',2},{'speed_per',1}}, act_skill={521103}, passive_skill={521203,521303,521403,750202,750402,700035,700015}, look_id=350509},
	["5_800"] = {pos=5, min=800, max=999, unit_id=81047, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',3},{'speed_per',1}}, act_skill={503103,503303}, passive_skill={503203,503403,750202,750402,700035,700015}, look_id=330508},
	["5_1000"] = {pos=5, min=1000, max=1599, unit_id=81048, attr={{'atk_per',1},{'def_per',1},{'hp_max_per',1},{'speed_per',0}}, act_skill={519103,519303}, passive_skill={519203,519403,750002,700145,700235,700005}, look_id=340509},
	["6_0"] = {pos=6, min=0, max=99, unit_id=81051, attr={{'atk_per',12},{'def_per',8},{'hp_max_per',13},{'speed_per',9}}, act_skill={513101,513301}, passive_skill={513201,513401}, look_id=310510},
	["6_100"] = {pos=6, min=100, max=199, unit_id=81052, attr={{'atk_per',13},{'def_per',5},{'hp_max_per',13},{'speed_per',4}}, act_skill={214102,214302}, passive_skill={214202,214402,750000}, look_id=350502},
	["6_200"] = {pos=6, min=200, max=299, unit_id=81053, attr={{'atk_per',9},{'def_per',4},{'hp_max_per',11},{'speed_per',3}}, act_skill={503103,503302}, passive_skill={503202,503402,750200}, look_id=330508},
	["6_300"] = {pos=6, min=300, max=399, unit_id=81054, attr={{'atk_per',6},{'def_per',3},{'hp_max_per',6},{'speed_per',2}}, act_skill={256103,256302}, passive_skill={256202,750001,700143}, look_id=340503},
	["6_400"] = {pos=6, min=400, max=499, unit_id=81055, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',4},{'speed_per',2}}, act_skill={153103,153303}, passive_skill={153203,153403,750201,750401}, look_id=350504},
	["6_500"] = {pos=6, min=500, max=799, unit_id=81056, attr={{'atk_per',2},{'def_per',2},{'hp_max_per',2},{'speed_per',1}}, act_skill={510103}, passive_skill={510203,510403,750202,750402,700035,700015}, look_id=340504},
	["6_800"] = {pos=6, min=800, max=999, unit_id=81057, attr={{'atk_per',3},{'def_per',2},{'hp_max_per',3},{'speed_per',1}}, act_skill={515103,515303}, passive_skill={515203,515403,750202,750402,700035,700015}, look_id=330509},
	["6_1000"] = {pos=6, min=1000, max=1599, unit_id=81058, attr={{'atk_per',1},{'def_per',1},{'hp_max_per',1},{'speed_per',0}}, act_skill={520103}, passive_skill={520203,520303,520403,750202,750402,700035,700015}, look_id=320510}
}
Config.PrimusData.data_unitdata_fun = function(key)
	local data=Config.PrimusData.data_unitdata[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PrimusData.data_unitdata['..key..'])not found') return
	end
	return data
end
-- -------------------unitdata_end---------------------

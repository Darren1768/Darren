----------------------------------------------------
-- 此文件由数据工具生成
-- 联盟探索历练--league_explore_data.xml
--------------------------------------

Config = Config or {} 
Config.LeagueExploreData = Config.LeagueExploreData or {}

-- -------------------const_start-------------------
Config.LeagueExploreData.data_const_length = 13
Config.LeagueExploreData.data_const = {
	["win_award"] = {val={{10001,5}}, desc="胜利方奖励"},
	["loss_award"] = {val={{10001,2}}, desc="失败方奖励"},
	["join_award"] = {val={{10001,3}}, desc="上阵奖励"},
	["occupy_limit_num"] = {val=6, desc="本服占领资源点上限"},
	["cross_occupy_limit_num"] = {val=8, desc="跨服占领资源点上限"},
	["time_start"] = {val={12,0,0}, desc="报名时间"},
	["time_ready"] = {val={18,0,0}, desc="战斗准备"},
	["time_fight_start"] = {val={18,10,0}, desc="战斗开始"},
	["time_fight_end"] = {val={18,30,0}, desc="战斗完成"},
	["time_result_display"] = {val={21,0,0}, desc="战斗结果展示"},
	["open_world_lev_limit"] = {val=80, desc="世界80级开启"},
	["time_end_warning"] = {val={17,40,0}, desc="报名结束预警"},
	["time_end_notice"] = {val={17,50,0}, desc="报名已结束提示"}
}
Config.LeagueExploreData.data_const_fun = function(key)
	local data=Config.LeagueExploreData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.LeagueExploreData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------resource_data_start-------------------
Config.LeagueExploreData.data_resource_data_length = 41
Config.LeagueExploreData.data_resource_data = {
	[1] = {id=1, resource_name="神器碎片一", week=1, resource_num=1, apply_num=18, para_pos=1, day_award={{72001,5}}, week_award={{72002,20}}, is_cross=0},
	[2] = {id=2, resource_name="神器碎片一", week=1, resource_num=1, apply_num=18, para_pos=1, day_award={{72001,6}}, week_award={{72002,20}}, is_cross=0},
	[3] = {id=3, resource_name="神器碎片一", week=1, resource_num=1, apply_num=18, para_pos=1, day_award={{72001,7}}, week_award={{72002,20}}, is_cross=0},
	[4] = {id=4, resource_name="神器碎片二", week=2, resource_num=2, apply_num=18, para_pos=1, day_award={{72001,8}}, week_award={{72002,20}}, is_cross=0},
	[5] = {id=5, resource_name="神器碎片二", week=2, resource_num=2, apply_num=18, para_pos=1, day_award={{72001,9}}, week_award={{72002,20}}, is_cross=0},
	[6] = {id=6, resource_name="神器碎片二", week=2, resource_num=2, apply_num=18, para_pos=1, day_award={{72001,10}}, week_award={{72002,20}}, is_cross=0},
	[7] = {id=7, resource_name="神器碎片三", week=3, resource_num=3, apply_num=30, para_pos=2, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=0},
	[8] = {id=8, resource_name="神器碎片三", week=3, resource_num=3, apply_num=30, para_pos=2, day_award={{72001,12}}, week_award={{72002,20}}, is_cross=0},
	[9] = {id=9, resource_name="神器碎片四", week=4, resource_num=4, apply_num=30, para_pos=2, day_award={{72001,13}}, week_award={{72002,20}}, is_cross=0},
	[10] = {id=10, resource_name="神器碎片四", week=4, resource_num=4, apply_num=30, para_pos=2, day_award={{72001,14}}, week_award={{72002,20}}, is_cross=0},
	[11] = {id=11, resource_name="神器碎片五", week=5, resource_num=5, apply_num=54, para_pos=3, day_award={{72001,15}}, week_award={{72002,20}}, is_cross=0},
	[12] = {id=12, resource_name="神器碎片六", week=6, resource_num=6, apply_num=54, para_pos=3, day_award={{72001,15}}, week_award={{72002,20}}, is_cross=0},
	[13] = {id=13, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[14] = {id=14, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[15] = {id=15, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[16] = {id=16, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[17] = {id=17, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[18] = {id=18, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[19] = {id=19, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[20] = {id=20, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[21] = {id=21, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[22] = {id=22, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[23] = {id=23, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[24] = {id=24, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[25] = {id=25, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[26] = {id=26, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[27] = {id=27, resource_name="神器碎片七", week=7, resource_num=7, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[28] = {id=28, resource_name="神器碎片八", week=7, resource_num=8, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[29] = {id=29, resource_name="神器碎片八", week=7, resource_num=8, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[30] = {id=30, resource_name="神器碎片八", week=7, resource_num=8, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[31] = {id=31, resource_name="神器碎片八", week=7, resource_num=8, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[32] = {id=32, resource_name="神器碎片八", week=7, resource_num=8, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[33] = {id=33, resource_name="神器碎片八", week=7, resource_num=8, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[34] = {id=34, resource_name="神器碎片九", week=7, resource_num=9, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[35] = {id=35, resource_name="神器碎片九", week=7, resource_num=9, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[36] = {id=36, resource_name="神器碎片九", week=7, resource_num=9, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[37] = {id=37, resource_name="神器碎片九", week=7, resource_num=9, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[38] = {id=38, resource_name="神器碎片九", week=7, resource_num=9, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[39] = {id=39, resource_name="神器碎片十", week=7, resource_num=10, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[40] = {id=40, resource_name="神器碎片十", week=7, resource_num=10, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1},
	[41] = {id=41, resource_name="神器碎片十", week=7, resource_num=10, apply_num=78, para_pos=4, day_award={{72001,11}}, week_award={{72002,20}}, is_cross=1}
}
Config.LeagueExploreData.data_resource_data_fun = function(key)
	local data=Config.LeagueExploreData.data_resource_data[key]
	if DATA_DEBUG and data == nil then
		print('(Config.LeagueExploreData.data_resource_data['..key..'])not found') return
	end
	return data
end
-- -------------------resource_data_end---------------------


-- -------------------tier_data_start-------------------
Config.LeagueExploreData.data_tier_data_length = 4
Config.LeagueExploreData.data_tier_data = {
	[1] = {
		[1] = {tier=1, pos_num=0, opponent_pos={}},
		[2] = {tier=2, pos_num=12, opponent_pos={}},
		[3] = {tier=3, pos_num=5, opponent_pos={{1,1,3},{2,4,5},{3,6,7},{4,8,9},{5,10,12}}},
		[4] = {tier=4, pos_num=1, opponent_pos={{1,1,6}}},
	},
	[2] = {
		[5] = {tier=1, pos_num=20, opponent_pos={}},
		[6] = {tier=2, pos_num=12, opponent_pos={{1,1,1},{2,2,3},{3,4,4},{4,5,6},{5,7,8},{6,9,9},{7,10,11},{8,12,12},{9,13,14},{10,15,16},{11,17,18},{12,19,20}}},
		[7] = {tier=3, pos_num=5, opponent_pos={{1,1,3},{2,4,4},{3,5,6},{4,7,9},{5,10,12}}},
		[8] = {tier=4, pos_num=1, opponent_pos={{1,1,6}}},
	},
	[3] = {
		[9] = {tier=1, pos_num=36, opponent_pos={}},
		[10] = {tier=2, pos_num=12, opponent_pos={{1,1,1},{2,2,3},{3,4,4},{4,5,6},{5,7,8},{6,9,9},{7,10,11},{8,12,12},{9,13,14},{10,15,16},{11,17,18},{12,19,36}}},
		[11] = {tier=3, pos_num=5, opponent_pos={{1,1,3},{2,4,4},{3,5,6},{4,7,9},{5,10,10},{6,11,12}}},
		[12] = {tier=4, pos_num=1, opponent_pos={{1,1,6}}},
	},
	[4] = {
		[13] = {tier=1, pos_num=60, opponent_pos={}},
		[14] = {tier=2, pos_num=12, opponent_pos={{1,1,1},{2,2,3},{3,4,4},{4,5,6},{5,7,8},{6,9,9},{7,10,11},{8,12,12},{9,13,14},{10,15,16},{11,17,18},{12,19,60}}},
		[15] = {tier=3, pos_num=5, opponent_pos={{1,1,3},{2,4,4},{3,5,6},{4,7,9},{5,10,10},{6,11,12}}},
		[16] = {tier=4, pos_num=1, opponent_pos={{1,1,6}}},
	},
}
-- -------------------tier_data_end---------------------


-- -------------------result_score_start-------------------
Config.LeagueExploreData.data_result_score_length = 4
Config.LeagueExploreData.data_result_score = {
	[1] = {opponent_tier=1, win_score=5, loss_score=1},
	[2] = {opponent_tier=2, win_score=10, loss_score=2},
	[3] = {opponent_tier=3, win_score=20, loss_score=4},
	[4] = {opponent_tier=4, win_score=30, loss_score=6}
}
Config.LeagueExploreData.data_result_score_fun = function(key)
	local data=Config.LeagueExploreData.data_result_score[key]
	if DATA_DEBUG and data == nil then
		print('(Config.LeagueExploreData.data_result_score['..key..'])not found') return
	end
	return data
end
-- -------------------result_score_end---------------------

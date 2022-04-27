----------------------------------------------------
-- 此文件由数据工具生成
-- 跨服天梯--sky_ladder_data.xml
--------------------------------------

Config = Config or {} 
Config.SkyLadderData = Config.SkyLadderData or {}

-- -------------------const_start-------------------
Config.SkyLadderData.data_const_length = 18
Config.SkyLadderData.data_const = {
	["join_min_lev"] = {val=55, desc="55级开启跨服天梯"},
	["join_times"] = {val=10, desc="每日免费挑战"},
	["refresh_time"] = {val=5, desc="刷新冷却时间(秒）"},
	["win_reward"] = {val={{21,50},{1,30000}}, desc="胜利奖励"},
	["lose_reward"] = {val={{21,30},{1,18000}}, desc="失败奖励"},
	["swap_times"] = {val={{21,50},{1,30000}}, desc="一键挑战奖励"},
	["worship_reward"] = {val={{21,50}}, desc="每次膜拜奖励"},
	["watch_rank"] = {val=50, desc="战报选取排名前X的玩家"},
	["watch_time"] = {val=30, desc="战报更新时间（分钟）"},
	["watch_num"] = {val=6, desc="每次选取大神观战的最大场次"},
	["battle_cd"] = {val=0, desc="挑战冷却时间(秒）"},
	["role_box"] = {val={{1,20},{21,100},{101,250},{251,400}}, desc="角色模型底框显示"},
	["robot_body"] = {val={110401,110402,110403,110404,110405,110501,110502,110503,110504,110505,110506,110507,110508,110509,120401,120402,120403,120404,120405,120501,120502,120503,120504,120505,120506,120507,120508,130401,130402,130403,130404,130405,130499,130501,130502,130503,130504,130505,130506,130507,130508,140401,140402,140403,140404,140501,140502,140503,140504,140505,140506,140507,150401,150402,150403,150404,150501,150502,150503,150504,150505,150506,150507}, desc="机器人模型展示"},
	["robot_head"] = {val={10101,10201,10202,10301,10302,10303,10304,10305,10401,10402,10403,10404,10405,10501,10502,10503,10504,10505,10506,10507,10508,10509,20101,20201,20202,20301,20302,20303,20304,20305,20401,20402,20403,20404,20405,20501,20502,20503,20504,20505,20506,20507,20508,30101,30201,30202,30301,30302,30303,30304,30305,30401,30402,30403,30404,30405,30501,30502,30503,30504,30505,30506,30507,30508,40301,40401,40402,40403,40404,40501,40502,40503,40504,40505,40506,40507,50301,50401,50402,50403,50404,50501,50502,50503,50504,50505,50506,50507}, desc="机器人头像展示"},
	["battle_offcd"] = {val={{3,20}}, desc="去除冷却时间消耗"},
	["arena_rank"] = {val=100, desc="参加所需的竞技场最低排名"},
	["close_text"] = {val=1, desc="周六00:00开启"},
	["max_number"] = {val=1000, desc="最大排名数"}
}
Config.SkyLadderData.data_const_fun = function(key)
	local data=Config.SkyLadderData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.SkyLadderData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------award_start-------------------
Config.SkyLadderData.data_award_length = 12
Config.SkyLadderData.data_award = {
	[1] = {max=1, min=1, reward={{21,10000},{38101,12},{50801,1}}},
	[2] = {max=2, min=2, reward={{21,8500},{38101,10},{50802,1}}},
	[3] = {max=3, min=3, reward={{21,7000},{38101,9},{50803,1}}},
	[5] = {max=5, min=4, reward={{21,6000},{38101,8}}},
	[10] = {max=10, min=6, reward={{21,5000},{38101,7}}},
	[20] = {max=20, min=11, reward={{21,4500},{38101,6}}},
	[50] = {max=50, min=21, reward={{21,4000},{38101,5}}},
	[100] = {max=100, min=51, reward={{21,3500},{38101,4}}},
	[200] = {max=200, min=101, reward={{21,3000},{38101,3}}},
	[300] = {max=300, min=201, reward={{21,2500},{38101,2}}},
	[600] = {max=600, min=301, reward={{21,2000},{38101,1}}},
	[1000] = {max=1000, min=601, reward={{21,1500}}}
}
Config.SkyLadderData.data_award_fun = function(key)
	local data=Config.SkyLadderData.data_award[key]
	if DATA_DEBUG and data == nil then
		print('(Config.SkyLadderData.data_award['..key..'])not found') return
	end
	return data
end
-- -------------------award_end---------------------


-- -------------------buy_num_start-------------------
Config.SkyLadderData.data_buy_num_length = 20
Config.SkyLadderData.data_buy_num = {
	[1] = {vip=0, cost=20},
	[2] = {vip=0, cost=20},
	[3] = {vip=0, cost=30},
	[4] = {vip=0, cost=30},
	[5] = {vip=0, cost=40},
	[6] = {vip=1, cost=40},
	[7] = {vip=2, cost=50},
	[8] = {vip=3, cost=50},
	[9] = {vip=4, cost=60},
	[10] = {vip=5, cost=60},
	[11] = {vip=6, cost=70},
	[12] = {vip=7, cost=70},
	[13] = {vip=8, cost=80},
	[14] = {vip=9, cost=80},
	[15] = {vip=10, cost=90},
	[16] = {vip=11, cost=90},
	[17] = {vip=12, cost=100},
	[18] = {vip=13, cost=100},
	[19] = {vip=13, cost=110},
	[20] = {vip=13, cost=110}
}
Config.SkyLadderData.data_buy_num_fun = function(key)
	local data=Config.SkyLadderData.data_buy_num[key]
	if DATA_DEBUG and data == nil then
		print('(Config.SkyLadderData.data_buy_num['..key..'])not found') return
	end
	return data
end
-- -------------------buy_num_end---------------------


-- -------------------explain_start-------------------
Config.SkyLadderData.data_explain_length = 3
Config.SkyLadderData.data_explain = {
	[1] = {id=1, title="基础规则", desc="1.每周六00:00-周日23：00开启跨服天梯\n2本服竞技场<div fontcolor=#d95014>前100名</div>的玩家才能参与挑战.\n3.战胜排名更高的对手将与其调换排名，战斗失败排名不变 \n4.每次发起战斗都将消耗<div fontcolor=#d95014>一</div>次挑战次数，挑战次数将在每日<div fontcolor=#d95014>00:00</div>刷新"},
	[2] = {id=2, title="奖励相关", desc="1.周日<div fontcolor=#d95014>23:00</div>根据当日排名发放结算奖励，具体可在奖励界面中查看\n2.每日都可在英雄殿中膜拜前3名玩家获<div fontcolor=#d95014>天梯积分</div>奖励\n3.<div fontcolor=#d95014>天梯积分</div>可用于在积分商店中兑换<div fontcolor=#d95014>稀有道具</div>"},
	[3] = {id=3, title="其他", desc="1.若战斗超时则视为挑战失败\n2.可在战报中查看分享自己的战斗记录或观看他人的战斗录像，学习大神们的阵容搭配\n3.正在被挑战的对手无法被发起战斗，需等待他人挑战完毕"}
}
Config.SkyLadderData.data_explain_fun = function(key)
	local data=Config.SkyLadderData.data_explain[key]
	if DATA_DEBUG and data == nil then
		print('(Config.SkyLadderData.data_explain['..key..'])not found') return
	end
	return data
end
-- -------------------explain_end---------------------

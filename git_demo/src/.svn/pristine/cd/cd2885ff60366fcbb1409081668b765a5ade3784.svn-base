----------------------------------------------------
-- 此文件由数据工具生成
-- 跨服竞技场--arena_cluster_data.xml
--------------------------------------

Config = Config or {} 
Config.ArenaClusterData = Config.ArenaClusterData or {}

-- -------------------const_start-------------------
Config.ArenaClusterData.data_const_length = 25
Config.ArenaClusterData.data_const = {
	["season_time"] = {val={2,4,6}, desc="玩法开启时间（周2、4、6）"},
	["season_time_end"] = {val={7,0,0,0}, desc="赛季结算时间"},
	["init_score"] = {val=1000, desc="初始积分"},
	["protect_score"] = {val=800, desc="保护积分"},
	["protect_robot_num"] = {val=2, desc="保护积分机器人数量"},
	["refresh_score"] = {val=1000, desc="结算重置积分"},
	["world_lev_open"] = {val=120, desc="世界等级120级开启"},
	["lev_limt"] = {val=115, desc="玩家等级115级开启"},
	["robot_headicon"] = {val={10101,10201,10202,10301,10302,10303,10304,10305,10401,10402,10403,10404,10405,10501,10502,10503,10504,10505,10506,10507,10508,10509,20101,20201,20202,20301,20302,20303,20304,20305,20401,20402,20403,20404,20405,20501,20502,20503,20504,20505,20506,20507,20508,30101,30201,30202,30301,30302,30303,30304,30305,30401,30402,30403,30404,30405,30501,30502,30503,30504,30505,30506,30507,30508,40301,40401,40402,40403,40404,40501,40502,40503,40504,40505,40506,40507,50301,50401,50402,50403,50404,50501,50502,50503,50504,50505,50506,50507}, desc="机器人随机头像"},
	["robot_body"] = {val={110401,110402,110403,110404,110405,110501,110502,110503,110504,110505,110506,110507,110508,110509,120401,120402,120403,120404,120405,120501,120502,120503,120504,120505,120506,120507,120508,130401,130402,130403,130404,130405,130499,130501,130502,130503,130504,130505,130506,130507,130508,140401,140402,140403,140404,140501,140502,140503,140504,140505,140506,140507,150401,150402,150403,150404,150501,150502,150503,150504,150505,150506,150507}, desc="机器人模型展示"},
	["like_max"] = {val=3, desc="膜拜点赞最大次数"},
	["like_reward"] = {val={30,50}, desc="膜拜点赞奖励"},
	["ref_time"] = {val=3, desc="刷新列表CD时间"},
	["rank_number"] = {val=100, desc="排行榜最大人数"},
	["arena_ticketcost"] = {val={{10103,3}}, desc="挑战券消耗"},
	["ticket_price"] = {val={{3,20}}, desc="挑战券购买价格"},
	["arena_ticket"] = {val=10103, desc="挑战券ID"},
	["arena_skip_count"] = {val=10, desc="需要赛季挑战10次后才可以跳过战斗"},
	["card_first_cost"] = {val=0, desc="第一次翻牌消耗"},
	["card_second_cost"] = {val={3,50}, desc="第二次翻牌消耗"},
	["card_third_cost"] = {val={3,100}, desc="第三次翻牌消耗"},
	["in_rank_min_score"] = {val=801, desc="上榜最小积分要求"},
	["min_score"] = {val=800, desc="最小积分"},
	["close_attention"] = {val=1, desc="每周二、四、六开启玩法"},
	["second_hide_rank"] = {val=20, desc="隐藏2队所需达到的排名"}
}
Config.ArenaClusterData.data_const_fun = function(key)
	local data=Config.ArenaClusterData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaClusterData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------daily_award_start-------------------
Config.ArenaClusterData.data_daily_award_length = 3
Config.ArenaClusterData.data_daily_award = {
	[1] = {items={{30,100}}, effect_id=109},
	[3] = {items={{30,200}}, effect_id=108},
	[5] = {items={{30,200},{10403,1}}, effect_id=110}
}
Config.ArenaClusterData.data_daily_award_fun = function(key)
	local data=Config.ArenaClusterData.data_daily_award[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaClusterData.data_daily_award['..key..'])not found') return
	end
	return data
end
-- -------------------daily_award_end---------------------


-- -------------------rank_award_start-------------------
Config.ArenaClusterData.data_rank_award_length = 11
Config.ArenaClusterData.data_rank_award = {
	[1] = {max=1, min=1, items={{30,12000},{10450,2400},{51101,1}}},
	[2] = {max=2, min=2, items={{30,10000},{10450,2000},{51102,1}}},
	[3] = {max=3, min=3, items={{30,8500},{10450,1700},{51103,1}}},
	[5] = {max=5, min=4, items={{30,7000},{10450,1400}}},
	[10] = {max=10, min=6, items={{30,6000},{10450,1200}}},
	[20] = {max=20, min=11, items={{30,5000},{10450,1000}}},
	[50] = {max=50, min=21, items={{30,4500},{10450,900}}},
	[100] = {max=100, min=51, items={{30,4000},{10450,800}}},
	[200] = {max=200, min=101, items={{30,3500},{10450,700}}},
	[300] = {max=300, min=201, items={{30,3000},{10450,600}}},
	[99999] = {max=99999, min=301, items={{30,2500},{10450,500}}}
}
Config.ArenaClusterData.data_rank_award_fun = function(key)
	local data=Config.ArenaClusterData.data_rank_award[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaClusterData.data_rank_award['..key..'])not found') return
	end
	return data
end
-- -------------------rank_award_end---------------------


-- -------------------explain_start-------------------
Config.ArenaClusterData.data_explain_length = 3
Config.ArenaClusterData.data_explain = {
	[1] = {id=1, title="基础规则", desc="1、在跨服竞技场中，可以挑战<div fontcolor=#d95014>[跨服时空]</div>中其他服的玩家，提升自己的积分\n2、该玩法每<div fontcolor=#d95014>周二、周四、周六</div>开启，每周为一个赛季\n3、<div fontcolor=#d95014>每周六23:00</div>进行赛季结算，同时将积分重置为1000"},
	[2] = {id=2, title="挑战相关", desc="1、根据自身积分匹配对手，优先匹配和自己积分接近的其他玩家\n2、每场战斗为<div fontcolor=#d95014>3局2胜制</div>，己方的三支队伍分别与对手的三支队伍进行战斗，每次至少上阵2支队伍方可发起战斗\n3、可在防守阵容中对任意一队英雄进行隐藏，被隐藏的队伍信息无法被其他玩家看到\n4、战斗胜利获得积分，防守失败扣除积分，挑战失败不会扣除积分\n5、若战斗超时，则伤害量高的一方获胜；若双方都没有上阵英雄，则视为平局；若出现一平一胜一负的情况，则挑战方视为挑战失败\n6、每当新赛季开启后，需要发起一场挑战方可被计入排行榜中\n7、排名前20玩家的防守队伍将会被隐藏2支队伍"},
	[3] = {id=3, title="奖励相关", desc="1、周六<div fontcolor=#d95014>23:00</div>赛季结算后，根据当前排名发放赛季结算奖励，具体可在奖励界面中查看\n2、玩法开启期间，每日挑战满足指定次数后，可领取<div fontcolor=#d95014>每日宝箱</div>奖励\n3、每日都可膜拜前3名玩家获<div fontcolor=#d95014>勇者印记</div>奖励\n4、<div fontcolor=#d95014>勇者印记</div>可用于在专属商店中兑换皮肤碎片、稀有5星英雄碎片、置换精华等珍稀道具"}
}
Config.ArenaClusterData.data_explain_fun = function(key)
	local data=Config.ArenaClusterData.data_explain[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaClusterData.data_explain['..key..'])not found') return
	end
	return data
end
-- -------------------explain_end---------------------

----------------------------------------------------
-- 此文件由数据工具生成
-- 竞技场--arena_data.xml
--------------------------------------

Config = Config or {} 
Config.ArenaData = Config.ArenaData or {}

-- -------------------base_awards_start-------------------
Config.ArenaData.data_base_awards_length = 6
Config.ArenaData.data_base_awards = {
	[1] = {items={}},
	[2] = {items={}},
	[3] = {items={}},
	[11] = {items={}},
	[12] = {items={}},
	[13] = {items={}}
}
Config.ArenaData.data_base_awards_fun = function(key)
	local data=Config.ArenaData.data_base_awards[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaData.data_base_awards['..key..'])not found') return
	end
	return data
end
-- -------------------base_awards_end---------------------


-- -------------------cup_start-------------------
Config.ArenaData.data_cup_length = 5
Config.ArenaData.data_cup = {
{index=1, name="青铜", min_score=800, max_score=1099},
{index=2, name="白银", min_score=1100, max_score=1299},
{index=3, name="黄金", min_score=1300, max_score=1499},
{index=4, name="铂金", min_score=1500, max_score=1799},
{index=5, name="钻石", min_score=1800, max_score=9999}
}
-- -------------------cup_end---------------------


-- -------------------continue_start-------------------
Config.ArenaData.data_continue_length = 0
Config.ArenaData.data_continue = {

}
Config.ArenaData.data_continue_fun = function(key)
	local data=Config.ArenaData.data_continue[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaData.data_continue['..key..'])not found') return
	end
	return data
end
-- -------------------continue_end---------------------


-- -------------------continue_list_start-------------------
Config.ArenaData.data_continue_list_length = 0
Config.ArenaData.data_continue_list = {

}
-- -------------------continue_list_end---------------------


-- -------------------activity_start-------------------
Config.ArenaData.data_activity_length = 12
Config.ArenaData.data_activity = {
{min=1, max=1, items={{3,200},{8,500}}},
{min=2, max=2, items={{3,150},{8,400}}},
{min=3, max=3, items={{3,120},{8,300}}},
{min=4, max=5, items={{3,100},{8,250}}},
{min=6, max=10, items={{3,80},{8,220}}},
{min=11, max=20, items={{3,60},{8,200}}},
{min=21, max=50, items={{3,50},{8,180}}},
{min=51, max=100, items={{3,40},{8,160}}},
{min=101, max=200, items={{3,30},{8,140}}},
{min=201, max=500, items={{3,20},{8,120}}},
{min=501, max=1000, items={{3,10},{8,100}}},
{min=1001, max=99999, items={{3,5},{8,80}}}
}
-- -------------------activity_end---------------------


-- -------------------season_num_reward_start-------------------
Config.ArenaData.data_season_num_reward_length = 7
Config.ArenaData.data_season_num_reward = {
{num=10, items={{10002,5}}},
{num=20, items={{10403,1}}},
{num=35, items={{10403,1}}},
{num=50, items={{37002,1}}},
{num=70, items={{37002,1}}},
{num=90, items={{14001,1}}},
{num=120, items={{14001,1}}}
}
-- -------------------season_num_reward_end---------------------


-- -------------------awards_start-------------------
Config.ArenaData.data_awards_length = 12
Config.ArenaData.data_awards = {
{min=1, max=1, items={{50001,1},{3,600},{8,5000}}},
{min=2, max=2, items={{50002,1},{3,400},{8,4000}}},
{min=3, max=3, items={{50003,1},{3,300},{8,3000}}},
{min=4, max=5, items={{3,260},{8,2500}}},
{min=6, max=10, items={{3,200},{8,2000}}},
{min=11, max=20, items={{3,160},{8,1500}}},
{min=21, max=50, items={{3,140},{8,1000}}},
{min=51, max=100, items={{3,120},{8,750}}},
{min=101, max=200, items={{3,100},{8,500}}},
{min=201, max=500, items={{3,80},{8,400}}},
{min=501, max=1000, items={{3,60},{8,300}}},
{min=1001, max=99999, items={{3,40},{8,200}}}
}
-- -------------------awards_end---------------------


-- -------------------explain_start-------------------
Config.ArenaData.data_explain_length = 3
Config.ArenaData.data_explain = {
	[1] = {id=1, title="规则说明", desc="1、在竞技场中，可以挑战本服中的其他玩家，提升竞技分数\n2、每天有<div fontcolor=289b14>3</div>次免费挑战机会，可消耗钻石购买额外次数\n3、每<div fontcolor=289b14>7天</div>为一个赛季，每个赛季第7天<div fontcolor=289b14>21:00</div>结算排名奖励，<div fontcolor=289b14>23:59</div>结算后的竞技场积分为当前的<div fontcolor=289b14>70%，最低1000</div>4、每个赛季的比赛场次达到<div fontcolor=289b14>30</div>后，将开启<div fontcolor=289b14>战斗跳过</div>功能"},
	[2] = {id=2, title="玩法规则", desc="1、根据自身竞技积分匹配对手，优先匹配和自己竞技积分接近的其他玩家\n2、挑战其他玩家胜利，自己竞技积分增加，对方积分减少，进攻失败不会减少积分\n3、战胜的对手积分比自己高越多，胜利获得的积分就越高，相反则越低\n4、竞技场布阵的防守阵容，将作为他人的进攻的战斗对象\n\n5、每次进攻若超过<div fontcolor=289b14>20</div>回合没战胜对手，则本次进攻失败"},
	[3] = {id=3, title="奖励规则", desc="1、每次挑战对手后都可获得一份随机奖励，可获得进阶石、英雄经验、<div fontcolor=289b14>竞技声望</div>等，<div fontcolor=289b14>竞技声望</div>可用于在竞技商店中兑换道具\n2.每个赛季挑战达到指定次数即可领取对应的宝箱奖励，宝箱奖励赛季结算后重置\n3、每个赛季结束时，根据积分排名发放排名奖励，前三名拥有专属聊天头像框，可前往个人空间处进行设置\n4、在冠军赛开启前，排名前<div fontcolor=289b14>128</div>名的玩家可获得冠军赛参赛资格，赢取更高荣耀与奖励"}
}
Config.ArenaData.data_explain_fun = function(key)
	local data=Config.ArenaData.data_explain[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaData.data_explain['..key..'])not found') return
	end
	return data
end
-- -------------------explain_end---------------------


-- -------------------const_start-------------------
Config.ArenaData.data_const_length = 24
Config.ArenaData.data_const = {
	["season_time"] = {val={6,23,59,59}, desc="赛季持续时间"},
	["init_score"] = {val=1000, desc="初始积分"},
	["protect_score"] = {val=1100, desc="保护积分"},
	["limit_lev"] = {val=8, desc="开启等级"},
	["dun_id"] = {val=0, desc="通关卡达尔森林1开放竞技场"},
	["face_list"] = {val={10508,20401,20402,20403}, desc="机器人随机头像"},
	["combat_num"] = {val=5, desc="每天免费挑战次数"},
	["in_rank_min_score"] = {val=801, desc="上榜最小积分要求"},
	["like_max"] = {val=3, desc="膜拜点赞最大次数"},
	["ref_time"] = {val=3, desc="刷新列表CD时间"},
	["lose_item_ratio"] = {val=600, desc="战败可获得奖励（千分比）"},
	["min_score"] = {val=800, desc="最小积分"},
	["hide_rank"] = {val=20, desc="排行前X名为神秘人"},
	["score_iocn"] = {val=9999, desc="竞技积分图标ID"},
	["hide_min_score"] = {val=1100, desc="神秘人最低积分"},
	["reward_time"] = {val={6,20,59,59}, desc="赛季排名奖励结算时间"},
	["reset_score"] = {val=700, desc="赛季结算杯数保留系数（千分比）"},
	["daily_reward_time"] = {val={21,0,0}, desc="奖励每日21:00通过邮件发放"},
	["arena_ticketcost"] = {val={{10103,1}}, desc="挑战券消耗"},
	["ticket_price"] = {val={{3,20}}, desc="挑战券购买价格"},
	["arena_ticket"] = {val=10103, desc="挑战券ID"},
	["win_drop"] = {val=20002, desc="战斗胜利掉落"},
	["lose_drop"] = {val=20003, desc="战斗失败掉落"},
	["arena_skip_count"] = {val=30, desc="竞技场赛季可以跳过次数"}
}
Config.ArenaData.data_const_fun = function(key)
	local data=Config.ArenaData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------

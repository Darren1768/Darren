----------------------------------------------------
-- 此文件由数据工具生成
-- 精英赛配置数据--arena_elite_data.xml
--------------------------------------

Config = Config or {} 
Config.ArenaEliteData = Config.ArenaEliteData or {}

-- -------------------elite_const_start-------------------
Config.ArenaEliteData.data_elite_const_length = 51
Config.ArenaEliteData.data_elite_const = {
	["open_world_lev_limit"] = {code="open_world_lev_limit", val=100, desc="世界等级达到100级后开启"},
	["open_person_lev_limit"] = {code="open_person_lev_limit", val=100, desc="角色等级达到100级后开启"},
	["king_match_condition"] = {code="king_match_condition", val=18, desc="王者赛参与的段位条件，填王者段位ID"},
	["rank_reward_limit"] = {code="rank_reward_limit", val=100, desc="最大奖励排行（暂时用不到）"},
	["first_routine"] = {code="first_routine", val=9, desc="上半赛季常规赛持续天数"},
	["second_routine"] = {code="second_routine", val=9, desc="下半赛季常规赛持续天数"},
	["second_king"] = {code="second_king", val=3, desc="下半赛季王者赛持续天数"},
	["open_time"] = {code="open_time", val={0,1,0}, desc="精英赛开战时间"},
	["close_time"] = {code="close_time", val={23,30,0}, desc="精英赛关闭时间"},
	["open_times"] = {code="open_times", val=84600, desc="开战持续秒数（单位秒）"},
	["idle_time_limit"] = {code="idle_time_limit", val=180, desc="储存空闲时间上限（单位秒）"},
	["clear_opponent_time"] = {code="clear_opponent_time", val=600, desc="清空对手的等待时间"},
	["strength_var1"] = {code="strength_var1", val=0.70, desc="实力评分常量1"},
	["strength_var2"] = {code="strength_var2", val=0.00, desc="实力评分常量2"},
	["strength_var3"] = {code="strength_var3", val=58, desc="实力评分常量3"},
	["strength_var4"] = {code="strength_var4", val=65, desc="实力评分常量4（英雄总星数）"},
	["normal_win_base_exp_add"] = {code="normal_win_base_exp_add", val={30,0.20,0.01}, desc="常规赛胜利基础值"},
	["king_win_base_exp_add"] = {code="king_win_base_exp_add", val={40,0.20,0.01}, desc="王者赛胜利基础值"},
	["win_battle_num_correct"] = {code="win_battle_num_correct", val=0.00, desc="修正系数（暂时无用）"},
	["normal_lose_base_exp_down"] = {code="normal_lose_base_exp_down", val={15,0.20,0.00}, desc="常规赛失败基础值"},
	["king_lose_base_exp_down"] = {code="king_lose_base_exp_down", val={15,0.20,0.00}, desc="王者赛失败基础值"},
	["rank_show_limit"] = {code="rank_show_limit", val=100, desc="排行榜显示限制"},
	["hallows_skin_mail_condition"] = {code="hallows_skin_mail_condition", val=10, desc="前x名发带神器皮肤的邮件"},
	["match_count"] = {code="match_count", val=3, desc="每日免费挑战次数"},
	["buy_count"] = {code="buy_count", val=5, desc="每日可购买挑战次数上限"},
	["normal_win_coin_correct"] = {code="normal_win_coin_correct", val={{27,0}}, desc="常规赛中战斗胜利【精英徽章】加成值的修正系数"},
	["king_win_coin_correct"] = {code="king_win_coin_correct", val={{27,0}}, desc="王者赛中战斗胜利【精英徽章】加成值的修正系数"},
	["normal_lose_coin_correct"] = {code="normal_lose_coin_correct", val={{27,0}}, desc="常规赛中战斗失败【精英徽章】加成值的修正系数"},
	["king_lose_coin_correct"] = {code="king_lose_coin_correct", val={{27,0}}, desc="王者赛中战斗失败【精英徽章】加成值的修正系数"},
	["strong_record_num_limit"] = {code="strong_record_num_limit", val=50, desc="大神录像储存数量上限"},
	["self_record_num_limit"] = {code="self_record_num_limit", val=30, desc="个人录像储存数量上限"},
	["likes_limit"] = {code="likes_limit", val=3, desc="每天点赞上限"},
	["likes_reward"] = {code="likes_reward", val={{1,20000}}, desc="点赞奖励"},
	["hearsay_lev_condition"] = {code="hearsay_lev_condition", val=10, desc="升段传闻参数：所需达到段位"},
	["mail_rank_condition"] = {code="mail_rank_condition", val=10, desc="结算邮件参数：带神器幻化皮肤对应的最低排名"},
	["wins_time_condition"] = {code="wins_time_condition", val={6,10}, desc="升段传闻参数：所需连胜场次"},
	["toprank_mail_condition"] = {code="toprank_mail_condition", val={22}, desc="邮件文案1"},
	["secondrank_mail_condition"] = {code="secondrank_mail_condition", val={21,20}, desc="邮件文案2"},
	["default_win_rate"] = {code="default_win_rate", val=600, desc="初始胜率（千分比，用于0场次玩家匹配规则用）"},
	["non_count_winrate_battle"] = {code="non_count_winrate_battle", val=5, desc="固定胜率的前x场"},
	["initial_win_rate"] = {code="initial_win_rate", val=500, desc="固定胜率值"},
	["last_battle_num_select"] = {code="last_battle_num_select", val=10, desc="取最近x场的胜率"},
	["second_team_open_condition"] = {code="second_team_open_condition", val=2, desc="解锁神器幻化外观【烈焰之剑】后开启"},
	["update_mirror_battlenum_condition"] = {code="update_mirror_battlenum_condition", val=800, desc="更新镜像的战力的触发条件：不低于原来的x%"},
	["honor_shows"] = {code="honor_shows", val={91101,91102,91102,91103,91103,91103}, desc="填写1-6名的称号ID（前端显示）"},
	["default_declaration"] = {code="default_declaration", val={{1,3},{2,1},{3,4}}, desc="三个默认宣言"},
	["area_activityplayer_condition"] = {code="area_activityplayer_condition", val=6000, desc="战区人数条件"},
	["new_area_severnum_limit"] = {code="new_area_severnum_limit", val=70, desc="靠后战区的服务器数量限制"},
	["activity_player_condition"] = {code="activity_player_condition", val=3, desc="活跃玩家判定条件：离线时间小于等于x天"},
	["skip_after_time"] = {code="skip_after_time", val=5, desc="跳过战前布阵需等待的秒数"},
	["no_skip_after_time"] = {code="no_skip_after_time", val=60, desc="不跳过战前布阵需等待的秒数"}
}
Config.ArenaEliteData.data_elite_const_fun = function(key)
	local data=Config.ArenaEliteData.data_elite_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_elite_const['..key..'])not found') return
	end
	return data
end
-- -------------------elite_const_end---------------------


-- -------------------elite_level_start-------------------
Config.ArenaEliteData.data_elite_level_length = 22
Config.ArenaEliteData.data_elite_level = {
	[1] = {id=1, next_id=2, name="黑铁斗者 I", ico="E24171", name_ico="name_iron_1", little_ico="icon_iron", little_name_ico="num_1_1", need_promoted=1, all_exp=1000, need_exp=30, init_exp=0, add_exp=1, del_exp=15, macth_limit_match_power={{1,-100,-50},{2,-120,-30},{3,-150,-20},{4,-200,0},{5,-200,200},{6,-300,300},{7,-400,400},{8,-500,500},{9,-800,800},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={}, award={{27,250},{3,50}}, ref_lev=1, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,250},{3,50}}},
	[2] = {id=2, next_id=3, name="白银先锋 I", ico="E24172", name_ico="name_silver_1", little_ico="icon_silver", little_name_ico="num_2_1", need_promoted=1, all_exp=1030, need_exp=60, init_exp=18, add_exp=1, del_exp=15, macth_limit_match_power={{1,-100,-50},{2,-120,-30},{3,-150,-20},{4,-200,0},{5,-200,200},{6,-300,300},{7,-400,400},{8,-500,500},{9,-800,800},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{37001,3},{1,100000},{27,200}}, award={{27,500},{3,60}}, ref_lev=1, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,500},{3,60}}},
	[3] = {id=3, next_id=4, name="白银先锋 II", ico="E24172", name_ico="name_silver_2", little_ico="icon_silver", little_name_ico="num_2_2", need_promoted=1, all_exp=1090, need_exp=90, init_exp=27, add_exp=1, del_exp=15, macth_limit_match_power={{1,-100,-50},{2,-120,-30},{3,-150,-20},{4,-200,0},{5,-200,200},{6,-300,300},{7,-400,400},{8,-500,500},{9,-800,800},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{37001,5},{1,150000},{27,300}}, award={{27,750},{3,100}}, ref_lev=1, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,750},{3,100}}},
	[4] = {id=4, next_id=5, name="黄金勇卫 I", ico="E24173", name_ico="name_gold_1", little_ico="icon_gold", little_name_ico="num_3_1", need_promoted=1, all_exp=1180, need_exp=90, init_exp=27, add_exp=1, del_exp=15, macth_limit_match_power={{1,-80,-40},{2,-120,-30},{3,-150,-20},{4,-200,0},{5,-200,200},{6,-300,300},{7,-400,400},{8,-500,500},{9,-800,800},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{29904,30},{1,200000},{27,400}}, award={{27,1000},{3,125}}, ref_lev=1, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,1000},{3,125}}},
	[5] = {id=5, next_id=6, name="黄金勇卫 II", ico="E24173", name_ico="name_gold_2", little_ico="icon_gold", little_name_ico="num_3_2", need_promoted=1, all_exp=1270, need_exp=120, init_exp=36, add_exp=1, del_exp=15, macth_limit_match_power={{1,-60,-20},{2,-100,-20},{3,-150,-10},{4,-200,0},{5,-200,200},{6,-300,300},{7,-400,400},{8,-500,500},{9,-800,800},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{10403,1},{1,250000},{27,500}}, award={{27,1250},{3,150}}, ref_lev=1, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,1250},{3,150}}},
	[6] = {id=6, next_id=7, name="黄金勇卫 III", ico="E24173", name_ico="name_gold_3", little_ico="icon_gold", little_name_ico="num_3_3", need_promoted=1, all_exp=1390, need_exp=120, init_exp=36, add_exp=1, del_exp=15, macth_limit_match_power={{1,-30,0},{2,-80,10},{3,-150,20},{4,-200,40},{5,-200,200},{6,-300,300},{7,-400,400},{8,-500,500},{9,-800,800},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{10403,1},{1,300000},{27,600}}, award={{27,1500},{3,175}}, ref_lev=1, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,1500},{3,175}}},
	[7] = {id=7, next_id=8, name="铂金精英 I", ico="E24174", name_ico="name_platinum_1", little_ico="icon_platinum", little_name_ico="num_3_1", need_promoted=1, all_exp=1510, need_exp=150, init_exp=45, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{37002,1},{1,350000},{27,700}}, award={{27,1750},{3,200}}, ref_lev=2, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,1750},{3,200}}},
	[8] = {id=8, next_id=9, name="铂金精英 II", ico="E24174", name_ico="name_platinum_2", little_ico="icon_platinum", little_name_ico="num_3_2", need_promoted=1, all_exp=1660, need_exp=150, init_exp=45, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{10403,2},{1,400000},{27,800}}, award={{27,2000},{3,225}}, ref_lev=3, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,2000},{3,225}}},
	[9] = {id=9, next_id=10, name="铂金精英 III", ico="E24174", name_ico="name_platinum_3", little_ico="icon_platinum", little_name_ico="num_3_3", need_promoted=1, all_exp=1810, need_exp=180, init_exp=54, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{10403,2},{1,450000},{27,900}}, award={{27,2250},{3,250}}, ref_lev=3, promoted_info={1,1}, hallows_look_id=0, avatar_id=0, award_client={{27,2250},{3,250}}},
	[10] = {id=10, next_id=11, name="钻石大师 I", ico="E24175", name_ico="name_diamond_1", little_ico="icon_diamond", little_name_ico="num_3_1", need_promoted=1, all_exp=1990, need_exp=180, init_exp=54, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{37002,1},{1,500000},{27,1000}}, award={{27,2500},{3,300}}, ref_lev=4, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,2500},{3,300}}},
	[11] = {id=11, next_id=12, name="钻石大师 II", ico="E24175", name_ico="name_diamond_2", little_ico="icon_diamond", little_name_ico="num_3_2", need_promoted=1, all_exp=2170, need_exp=210, init_exp=63, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{14002,50},{1,600000},{27,1100}}, award={{27,2750},{3,350}}, ref_lev=5, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,2750},{3,350}}},
	[12] = {id=12, next_id=13, name="钻石大师 III", ico="E24175", name_ico="name_diamond_3", little_ico="icon_diamond", little_name_ico="num_3_3", need_promoted=1, all_exp=2380, need_exp=210, init_exp=63, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{14002,50},{1,700000},{27,1200}}, award={{27,3000},{3,400}}, ref_lev=6, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,3000},{3,400}}},
	[13] = {id=13, next_id=14, name="钻石大师 IV", ico="E24175", name_ico="name_diamond_4", little_ico="icon_diamond", little_name_ico="num_3_4", need_promoted=1, all_exp=2590, need_exp=240, init_exp=72, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{14002,100},{1,800000},{27,1300}}, award={{27,3250},{3,450}}, ref_lev=6, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,3250},{3,450}}},
	[14] = {id=14, next_id=15, name="闪耀尊师 I", ico="E24176", name_ico="name_master_1", little_ico="icon_master", little_name_ico="num_3_1", need_promoted=1, all_exp=2830, need_exp=240, init_exp=72, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{10453,1},{1,1000000},{27,1400}}, award={{27,3500},{3,500}}, ref_lev=7, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,3500},{3,500}}},
	[15] = {id=15, next_id=16, name="闪耀尊师 II", ico="E24176", name_ico="name_master_2", little_ico="icon_master", little_name_ico="num_3_2", need_promoted=1, all_exp=3070, need_exp=270, init_exp=81, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{29905,10},{1,1200000},{27,1500}}, award={{27,4000},{3,600}}, ref_lev=8, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,4000},{3,600}}},
	[16] = {id=16, next_id=17, name="闪耀尊师 III", ico="E24176", name_ico="name_master_3", little_ico="icon_master", little_name_ico="num_3_3", need_promoted=1, all_exp=3340, need_exp=270, init_exp=81, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{29905,20},{1,1400000},{27,1600}}, award={{27,4500},{3,700}}, ref_lev=9, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,4500},{3,700}}},
	[17] = {id=17, next_id=18, name="闪耀尊师 IV", ico="E24176", name_ico="name_master_4", little_ico="icon_master", little_name_ico="num_3_4", need_promoted=1, all_exp=3610, need_exp=300, init_exp=90, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{29905,20},{1,1600000},{27,1700}}, award={{27,5000},{3,800}}, ref_lev=9, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,5000},{3,800}}},
	[18] = {id=18, next_id=19, name="超凡王者 I", ico="E24177", name_ico="name_king_1", little_ico="icon_king", little_name_ico="num_3_1", need_promoted=1, all_exp=3910, need_exp=360, init_exp=108, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{10454,1},{1,2000000},{27,1800}}, award={{27,6000},{3,1000}}, ref_lev=10, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,6000},{3,1000}}},
	[19] = {id=19, next_id=20, name="超凡王者 II", ico="E24177", name_ico="name_king_2", little_ico="icon_king", little_name_ico="num_3_2", need_promoted=1, all_exp=4270, need_exp=420, init_exp=126, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{14001,1},{1,2400000},{27,1900}}, award={{27,7000},{3,1200}}, ref_lev=11, promoted_info={3,2}, hallows_look_id=0, avatar_id=0, award_client={{27,7000},{3,1200}}},
	[20] = {id=20, next_id=21, name="超凡王者 III", ico="E24177", name_ico="name_king_3", little_ico="icon_king", little_name_ico="num_3_3", need_promoted=1, all_exp=4690, need_exp=480, init_exp=144, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{14001,1},{1,2800000},{27,2000}}, award={{27,8000},{3,1400}}, ref_lev=12, promoted_info={3,2}, hallows_look_id=0, avatar_id=2500, award_client={{60120,1},{27,8000},{3,1400}}},
	[21] = {id=21, next_id=22, name="超凡王者 IV", ico="E24177", name_ico="name_king_4", little_ico="icon_king", little_name_ico="num_3_4", need_promoted=1, all_exp=5170, need_exp=540, init_exp=162, add_exp=1, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{14001,1},{1,3200000},{27,2100}}, award={{27,9000},{3,1600}}, ref_lev=13, promoted_info={3,2}, hallows_look_id=0, avatar_id=2500, award_client={{60120,1},{27,9000},{3,1600}}},
	[22] = {id=22, next_id=0, name="超凡王者 V", ico="E24177", name_ico="name_king_5", little_ico="icon_king", little_name_ico="num_3_5", need_promoted=0, all_exp=5710, need_exp=9999, init_exp=300, add_exp=0, del_exp=15, macth_limit_match_power={{1,-20,10},{2,-40,20},{3,-60,30},{4,-80,40},{5,-100,100},{6,-200,200},{7,-300,300},{8,-400,400},{9,-500,500},{10,-1000,1000}}, macth_limit_score={{1,-50,50},{2,-80,80},{3,-200,200},{4,-300,300},{5,-500,500},{6,-600,600},{7,-700,700},{8,-800,800},{9,-900,900},{10,-1000,1000}}, macth_limit_power={}, lev_award={{14001,1},{1,3600000},{27,2200}}, award={{27,10000},{3,1800}}, ref_lev=13, promoted_info={}, hallows_look_id=3, avatar_id=2500, award_client={{72111,1},{60120,1},{27,10000},{3,1800}}}
}
Config.ArenaEliteData.data_elite_level_fun = function(key)
	local data=Config.ArenaEliteData.data_elite_level[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_elite_level['..key..'])not found') return
	end
	return data
end
-- -------------------elite_level_end---------------------


-- -------------------elite_last_level_start-------------------
Config.ArenaEliteData.data_elite_last_level_length = 22
Config.ArenaEliteData.data_elite_last_level = {
	[2] = {id=1},
	[3] = {id=2},
	[4] = {id=3},
	[5] = {id=4},
	[6] = {id=5},
	[7] = {id=6},
	[8] = {id=7},
	[9] = {id=8},
	[10] = {id=9},
	[11] = {id=10},
	[12] = {id=11},
	[13] = {id=12},
	[14] = {id=13},
	[15] = {id=14},
	[16] = {id=15},
	[17] = {id=16},
	[18] = {id=17},
	[19] = {id=18},
	[20] = {id=19},
	[21] = {id=20},
	[22] = {id=21},
	[0] = {id=22}
}
Config.ArenaEliteData.data_elite_last_level_fun = function(key)
	local data=Config.ArenaEliteData.data_elite_last_level[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_elite_last_level['..key..'])not found') return
	end
	return data
end
-- -------------------elite_last_level_end---------------------


-- -------------------elite_rank_reward_start-------------------
Config.ArenaEliteData.data_elite_rank_reward_length = 8
Config.ArenaEliteData.data_elite_rank_reward = {
	[1] = {min_rank=1, max_rank=1, rank_award_limit=18, award={{27,10000},{72001,300}}, hallows_look_id=3, show_award={{27,10000},{72001,300},{72111,1}}},
	[2] = {min_rank=2, max_rank=2, rank_award_limit=18, award={{27,8500},{72001,260}}, hallows_look_id=3, show_award={{27,8500},{72001,260},{72111,1}}},
	[3] = {min_rank=3, max_rank=3, rank_award_limit=18, award={{27,7000},{72001,220}}, hallows_look_id=3, show_award={{27,7000},{72001,220},{72111,1}}},
	[4] = {min_rank=4, max_rank=5, rank_award_limit=18, award={{27,6000},{72001,180}}, hallows_look_id=1, show_award={{27,6000},{72001,180},{72109,1}}},
	[6] = {min_rank=6, max_rank=10, rank_award_limit=18, award={{27,5500},{72001,160}}, hallows_look_id=1, show_award={{27,5500},{72001,160},{72109,1}}},
	[11] = {min_rank=11, max_rank=20, rank_award_limit=18, award={{27,5000},{72001,140}}, hallows_look_id=0, show_award={{27,5000},{72001,140}}},
	[21] = {min_rank=21, max_rank=50, rank_award_limit=18, award={{27,4500},{72001,120}}, hallows_look_id=0, show_award={{27,4500},{72001,120}}},
	[51] = {min_rank=51, max_rank=100, rank_award_limit=18, award={{27,4000},{72001,100}}, hallows_look_id=0, show_award={{27,4000},{72001,100}}}
}
Config.ArenaEliteData.data_elite_rank_reward_fun = function(key)
	local data=Config.ArenaEliteData.data_elite_rank_reward[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_elite_rank_reward['..key..'])not found') return
	end
	return data
end
-- -------------------elite_rank_reward_end---------------------


-- -------------------elite_buy_start-------------------
Config.ArenaEliteData.data_elite_buy_length = 10
Config.ArenaEliteData.data_elite_buy = {
	[1] = {count=1, cost={{3,50}}, need_vip=0},
	[2] = {count=2, cost={{3,50}}, need_vip=2},
	[3] = {count=3, cost={{3,50}}, need_vip=3},
	[4] = {count=4, cost={{3,100}}, need_vip=4},
	[5] = {count=5, cost={{3,150}}, need_vip=5},
	[6] = {count=6, cost={{3,150}}, need_vip=5},
	[7] = {count=7, cost={{3,150}}, need_vip=5},
	[8] = {count=8, cost={{3,150}}, need_vip=5},
	[9] = {count=9, cost={{3,150}}, need_vip=5},
	[10] = {count=10, cost={{3,150}}, need_vip=5}
}
Config.ArenaEliteData.data_elite_buy_fun = function(key)
	local data=Config.ArenaEliteData.data_elite_buy[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_elite_buy['..key..'])not found') return
	end
	return data
end
-- -------------------elite_buy_end---------------------


-- -------------------explain_start-------------------
Config.ArenaEliteData.data_explain_length = 5
Config.ArenaEliteData.data_explain = {
	[1] = {id=1, title="超凡段位赛流程", desc="1.超凡段位赛为跨服PvP玩法，本服世界等级达到<div fontcolor=289b14>100级</div>开启，玩家角色必须达到<div fontcolor=289b14>100级</div>才可参与\n2.超凡段位赛在每日<div fontcolor=289b14>00:00-23:30</div>开启匹配挑战，在每日最后半小时不可挑战，请留意\n3.一个完整赛季周期为<div fontcolor=289b14>3周（21天） </div>，赛季结束后会立即结算并开启下赛季；每个赛季分为<div fontcolor=289b14>上半赛季</div>、<div fontcolor=289b14>下半赛季</div>两个阶段，上半赛季结束后立即开启下半赛季\n4.每个赛季开启时，系统会根据各个服务器情况划分若干赛区"},
	[2] = {id=2, title="匹配与战斗规则", desc="1.玩家每日拥有<div fontcolor=289b14>3次</div>免费匹配次数，匹配一次对手消耗1点次数，Vip玩家可额外购买每日匹配次数，最多<div fontcolor=289b14>购买5次</div>，均在0点重置\n2.匹配对手后会进入准备阶段，玩家在此期间可调整自己的阵容，再进入挑战\n3.战斗胜利后可获得<div fontcolor=289b14>段位经验</div>和战斗奖励，自身段位越高则获得的加成奖励越高；战斗失败则会扣除段位经验，同时也会获得少量奖励"},
	[3] = {id=3, title="王者赛相关", desc="1.王者赛在赛季的最后<div fontcolor=289b14>3天</div>开启，此时达到<div fontcolor=289b14>“超凡王者”</div>段位的玩家会进入王者赛阶段，王者赛进行期间达到“超凡王者”段位的玩家同样可参与王者赛\n2.参与王者赛的选手将自动开放<div fontcolor=289b14>第二队伍</div>的布阵，但玩家需要解锁神器幻化外观<div fontcolor=c26706>【烈焰之剑】</div>才可解锁王者赛第二队伍的使用权，未解锁该神器外观的玩家仅可使用单支队伍参与王者赛\n3.王者赛战斗会以双队伍的<div fontcolor=289b14>“车轮战”</div>的模式进行：第一队伍的战斗后，败方的第二队伍补上参与战斗，直到一方的两支队伍全部战败，决出胜者\n4.已进入王者赛的玩家在本赛季不得参与常规赛，王者赛的战斗奖励比常规赛更丰厚，请大家努力争取进入王者赛！"},
	[4] = {id=4, title="段位规则", desc="1.战斗胜利后可获得段位经验，对手战力和段位越高时，获得的经验值越高，段位经验满值时达到升段要求，接下来会“升段赛”阶段\n2.“升段赛”中玩家赢得指定场次后可提升段位，铂金段位以下（含铂金段位）获得<div fontcolor=289b14>“1场1胜”</div>即可提升，以上段位需要获得<div fontcolor=289b14>“3场2胜”</div>才可提升\n3.若玩家未达成指定胜场，则升段失败，段位不变并扣除一定段位经验值\n4.当在本赛季中首次提升到某个段位时，可获得<div fontcolor=289b14>首达段位奖励</div>；每个段位奖励只可领取一次，只可领取初始段位以上段位的奖励\n5.当段位经验值小于0时段位不会立即下降，会优先扣除缓冲经验，当缓冲经验不足时，则段位下降"},
	[5] = {id=5, title="赛季结算", desc="1.上半赛季、下半赛季结束时会发放<div fontcolor=289b14>【段位结算奖励】</div>，到达“超凡王者 III”或以上段位的玩家将获得<div fontcolor=289b14>【海神三叉戟】</div>神器幻化外观和激活<div fontcolor=289b14>专属头像框</div>，两者均持续到半赛季结束\n2.在整个赛季结束后，达到<div fontcolor=289b14>“超凡王者”</div>段位且排行在<div fontcolor=289b14>前6名</div>的玩家可获得<div fontcolor=289b14>强力称号</div>（排行榜根据段位和积分进行排名），称号激活后将持续整个赛季（21天）\n3.上半赛季结束结束不会重置段位和排名，下半赛季结束（即赛季结束）将会重置排名，并且将根据当前段位决定新赛季的<div fontcolor=289b14>继承段位</div>，可在【段位一览】中查看\n4.每个赛季结束后会记录排名前6的玩家，可前往【赛季传奇】中查看"}
}
Config.ArenaEliteData.data_explain_fun = function(key)
	local data=Config.ArenaEliteData.data_explain[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_explain['..key..'])not found') return
	end
	return data
end
-- -------------------explain_end---------------------


-- -------------------explain2_start-------------------
Config.ArenaEliteData.data_explain2_length = 2
Config.ArenaEliteData.data_explain2 = {
	[1] = {id=1, title="段位一览", desc="由低到高排列：\n黑铁段位：黑铁斗者 I\n白银段位：白银先锋 I、白银先锋 II\n黄金段位：黄金勇卫 I、黄金勇卫 II、黄金勇卫 III\n铂金段位：铂金精英 I、铂金精英 II、铂金精英 III\n钻石段位：钻石大师 I、钻石大师 II、钻石大师 III、钻石大师 IV\n闪耀段位：闪耀尊师 I、闪耀尊师 II、闪耀尊师 III、闪耀尊师 IV\n王者段位：超凡王者 I、超凡王者 II、超凡王者 III、超凡王者 IV、超凡王者 V"},
	[2] = {id=2, title="段位继承", desc="1.新赛季会以玩家上赛季的最终段位进行对应重置，对照如下：\n黑铁斗者 I   → 黑铁斗者 I\n白银先锋 I   → 黑铁斗者 I\n白银先锋 II  → 黑铁斗者 I\n黄金勇卫 I   → 黑铁斗者 I\n黄金勇卫 II  → 黑铁斗者 I\n黄金勇卫 III → 黑铁斗者 I\n铂金精英 I   → 白银先锋 I\n铂金精英 II  → 白银先锋 II\n铂金精英 III → 白银先锋 II\n钻石大师 I   → 黄金勇卫 I\n钻石大师 II  → 黄金勇卫 II\n钻石大师 III → 黄金勇卫 III\n钻石大师 IV  → 黄金勇卫 III\n闪耀尊师 I   → 铂金精英 I\n闪耀尊师 II  → 铂金精英II\n闪耀尊师 III → 铂金精英 III\n闪耀尊师 IV  → 铂金精英 III\n超凡王者 I   → 钻石大师 I\n超凡王者 II  → 钻石大师 II\n超凡王者 III → 钻石大师 III\n超凡王者 IV  → 钻石大师 IV\n超凡王者 V   → 钻石大师 IV"}
}
Config.ArenaEliteData.data_explain2_fun = function(key)
	local data=Config.ArenaEliteData.data_explain2[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_explain2['..key..'])not found') return
	end
	return data
end
-- -------------------explain2_end---------------------


-- -------------------face_start-------------------
Config.ArenaEliteData.data_face_length = 19
Config.ArenaEliteData.data_face = {
	[1] = {id=1, msg="E24191", name="赞许", text="新年大吉"},
	[2] = {id=2, msg="E24192", name="大笑", text="大吉大利"},
	[3] = {id=3, msg="E24193", name="流泪", text="利是逗来"},
	[4] = {id=4, msg="E24194", name="愤怒", text="红包拿来"},
	[5] = {id=5, msg="E24195", name="憨笑", text="恭喜发财"},
	[6] = {id=6, msg="E24196", name="比心", text="谢谢老板"},
	[7] = {id=7, msg="E24197", name="机智", text="五鼠闹春"},
	[8] = {id=8, msg="E24198", name="花心", text="春风得意"},
	[9] = {id=9, msg="E24199", name="认输", text="事业有成"},
	[10] = {id=10, msg="E24200", name="打脸", text="活该你发财"},
	[11] = {id=11, msg="E24201", name="惊慌", text="新年快乐"},
	[12] = {id=12, msg="E24202", name="迷人", text="恭贺新春"},
	[13] = {id=13, msg="E24203", name="晕晕", text="紫气东来"},
	[14] = {id=14, msg="E24204", name="捏脸", text="招财进宝"},
	[15] = {id=15, msg="E24205", name="伤心", text="万事如意"},
	[16] = {id=16, msg="E24206", name="怄气", text="红包拿来"},
	[17] = {id=17, msg="E24207", name="闭嘴", text="年年有余"},
	[18] = {id=18, msg="E24208", name="必胜", text="瑞鼠贺新春"},
	[19] = {id=19, msg="E24209", name="满足", text="心想事成"}
}
Config.ArenaEliteData.data_face_fun = function(key)
	local data=Config.ArenaEliteData.data_face[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_face['..key..'])not found') return
	end
	return data
end
-- -------------------face_end---------------------


-- -------------------zone_start-------------------
Config.ArenaEliteData.data_zone_length = 100
Config.ArenaEliteData.data_zone = {
	[1] = {id=1, name="星殒", icon="elitematch_zone_icon_09"},
	[2] = {id=2, name="月华", icon="elitematch_zone_icon_07"},
	[3] = {id=3, name="曜影", icon="elitematch_zone_icon_08"},
	[4] = {id=4, name="炽炎", icon="elitematch_zone_icon_06"},
	[5] = {id=5, name="天辉", icon="elitematch_zone_icon_11"},
	[6] = {id=6, name="霜月", icon="elitematch_zone_icon_12"},
	[7] = {id=7, name="辉耀", icon="elitematch_zone_icon_02"},
	[8] = {id=8, name="瀚灵", icon="elitematch_zone_icon_10"},
	[9] = {id=9, name="极光", icon="elitematch_zone_icon_03"},
	[10] = {id=10, name="森林", icon="elitematch_zone_icon_05"},
	[11] = {id=11, name="紫棘", icon="elitematch_zone_icon_04"},
	[12] = {id=12, name="红莲", icon="elitematch_zone_icon_01"},
	[13] = {id=13, name="魅魂", icon="elitematch_zone_icon_08"},
	[14] = {id=14, name="漩涡", icon="elitematch_zone_icon_06"},
	[15] = {id=15, name="神护", icon="elitematch_zone_icon_07"},
	[16] = {id=16, name="苍穹", icon="elitematch_zone_icon_09"},
	[17] = {id=17, name="玄镰", icon="elitematch_zone_icon_12"},
	[18] = {id=18, name="凰舞", icon="elitematch_zone_icon_01"},
	[19] = {id=19, name="雷霆", icon="elitematch_zone_icon_10"},
	[20] = {id=20, name="灵言", icon="elitematch_zone_icon_10"},
	[21] = {id=21, name="大地", icon="elitematch_zone_icon_05"},
	[22] = {id=22, name="云歌", icon="elitematch_zone_icon_11"},
	[23] = {id=23, name="圣堂", icon="elitematch_zone_icon_07"},
	[24] = {id=24, name="砂岚", icon="elitematch_zone_icon_04"},
	[25] = {id=25, name="白金", icon="elitematch_zone_icon_02"},
	[26] = {id=26, name="赤魅", icon="elitematch_zone_icon_09"},
	[27] = {id=27, name="琉璃", icon="elitematch_zone_icon_07"},
	[28] = {id=28, name="紫殿", icon="elitematch_zone_icon_08"},
	[29] = {id=29, name="辉月", icon="elitematch_zone_icon_06"},
	[30] = {id=30, name="狩魂", icon="elitematch_zone_icon_11"},
	[31] = {id=31, name="银夜", icon="elitematch_zone_icon_12"},
	[32] = {id=32, name="雷门", icon="elitematch_zone_icon_02"},
	[33] = {id=33, name="天怒", icon="elitematch_zone_icon_10"},
	[34] = {id=34, name="圣光", icon="elitematch_zone_icon_03"},
	[35] = {id=35, name="凝魂", icon="elitematch_zone_icon_05"},
	[36] = {id=36, name="天鹰", icon="elitematch_zone_icon_04"},
	[37] = {id=37, name="诡刃", icon="elitematch_zone_icon_01"},
	[38] = {id=38, name="雷神", icon="elitematch_zone_icon_08"},
	[39] = {id=39, name="烈阳", icon="elitematch_zone_icon_06"},
	[40] = {id=40, name="飓风", icon="elitematch_zone_icon_07"},
	[41] = {id=41, name="火绫", icon="elitematch_zone_icon_09"},
	[42] = {id=42, name="绚蝶", icon="elitematch_zone_icon_12"},
	[43] = {id=43, name="金殿", icon="elitematch_zone_icon_01"},
	[44] = {id=44, name="织叶", icon="elitematch_zone_icon_10"},
	[45] = {id=45, name="灵契", icon="elitematch_zone_icon_10"},
	[46] = {id=46, name="风暴", icon="elitematch_zone_icon_05"},
	[47] = {id=47, name="双星", icon="elitematch_zone_icon_11"},
	[48] = {id=48, name="霜焰", icon="elitematch_zone_icon_07"},
	[49] = {id=49, name="青叶", icon="elitematch_zone_icon_04"},
	[50] = {id=50, name="赤鳌", icon="elitematch_zone_icon_02"},
	[51] = {id=51, name="未知", icon="elitematch_zone_icon_09"},
	[52] = {id=52, name="未知", icon="elitematch_zone_icon_07"},
	[53] = {id=53, name="未知", icon="elitematch_zone_icon_08"},
	[54] = {id=54, name="未知", icon="elitematch_zone_icon_06"},
	[55] = {id=55, name="未知", icon="elitematch_zone_icon_11"},
	[56] = {id=56, name="未知", icon="elitematch_zone_icon_12"},
	[57] = {id=57, name="未知", icon="elitematch_zone_icon_02"},
	[58] = {id=58, name="未知", icon="elitematch_zone_icon_10"},
	[59] = {id=59, name="未知", icon="elitematch_zone_icon_03"},
	[60] = {id=60, name="未知", icon="elitematch_zone_icon_05"},
	[61] = {id=61, name="未知", icon="elitematch_zone_icon_04"},
	[62] = {id=62, name="未知", icon="elitematch_zone_icon_01"},
	[63] = {id=63, name="未知", icon="elitematch_zone_icon_08"},
	[64] = {id=64, name="未知", icon="elitematch_zone_icon_06"},
	[65] = {id=65, name="未知", icon="elitematch_zone_icon_07"},
	[66] = {id=66, name="未知", icon="elitematch_zone_icon_09"},
	[67] = {id=67, name="未知", icon="elitematch_zone_icon_12"},
	[68] = {id=68, name="未知", icon="elitematch_zone_icon_01"},
	[69] = {id=69, name="未知", icon="elitematch_zone_icon_10"},
	[70] = {id=70, name="未知", icon="elitematch_zone_icon_10"},
	[71] = {id=71, name="未知", icon="elitematch_zone_icon_05"},
	[72] = {id=72, name="未知", icon="elitematch_zone_icon_11"},
	[73] = {id=73, name="未知", icon="elitematch_zone_icon_07"},
	[74] = {id=74, name="未知", icon="elitematch_zone_icon_04"},
	[75] = {id=75, name="未知", icon="elitematch_zone_icon_02"},
	[76] = {id=76, name="未知", icon="elitematch_zone_icon_09"},
	[77] = {id=77, name="未知", icon="elitematch_zone_icon_07"},
	[78] = {id=78, name="未知", icon="elitematch_zone_icon_08"},
	[79] = {id=79, name="未知", icon="elitematch_zone_icon_06"},
	[80] = {id=80, name="未知", icon="elitematch_zone_icon_11"},
	[81] = {id=81, name="未知", icon="elitematch_zone_icon_12"},
	[82] = {id=82, name="未知", icon="elitematch_zone_icon_02"},
	[83] = {id=83, name="未知", icon="elitematch_zone_icon_10"},
	[84] = {id=84, name="未知", icon="elitematch_zone_icon_03"},
	[85] = {id=85, name="未知", icon="elitematch_zone_icon_05"},
	[86] = {id=86, name="未知", icon="elitematch_zone_icon_04"},
	[87] = {id=87, name="未知", icon="elitematch_zone_icon_01"},
	[88] = {id=88, name="未知", icon="elitematch_zone_icon_08"},
	[89] = {id=89, name="未知", icon="elitematch_zone_icon_06"},
	[90] = {id=90, name="未知", icon="elitematch_zone_icon_07"},
	[91] = {id=91, name="未知", icon="elitematch_zone_icon_09"},
	[92] = {id=92, name="未知", icon="elitematch_zone_icon_12"},
	[93] = {id=93, name="未知", icon="elitematch_zone_icon_01"},
	[94] = {id=94, name="未知", icon="elitematch_zone_icon_10"},
	[95] = {id=95, name="未知", icon="elitematch_zone_icon_10"},
	[96] = {id=96, name="未知", icon="elitematch_zone_icon_05"},
	[97] = {id=97, name="未知", icon="elitematch_zone_icon_11"},
	[98] = {id=98, name="未知", icon="elitematch_zone_icon_07"},
	[99] = {id=99, name="未知", icon="elitematch_zone_icon_04"},
	[100] = {id=100, name="未知", icon="elitematch_zone_icon_02"}
}
Config.ArenaEliteData.data_zone_fun = function(key)
	local data=Config.ArenaEliteData.data_zone[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ArenaEliteData.data_zone['..key..'])not found') return
	end
	return data
end
-- -------------------zone_end---------------------

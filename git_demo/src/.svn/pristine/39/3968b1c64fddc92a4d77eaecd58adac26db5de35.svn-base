----------------------------------------------------
-- 此文件由数据工具生成
-- 任务数据--quest_data.xml
--------------------------------------

Config = Config or {} 
Config.QuestData = Config.QuestData or {}

-- -------------------get_start-------------------
Config.QuestData.data_get_length = 13
Config.QuestData.data_get = {
	[90000] = {id=90000, name="日常登录", lev=3, desc="日常登录1次", progress={{cli_label="evt_cli_loaded",target=0,target_val=1,param={}}}, extra={}, commit_rewards={{3,20},{9,5}}, res="quest_item_zhaohuan"},
	[90001] = {id=90001, name="好友赠送", lev=5, desc="每天赠送好友友情点5次", progress={{cli_label="evt_friend_present",target=14,target_val=5,param={}}}, extra={}, commit_rewards={{14,100},{9,5}}, res="quest_item_haoyou"},
	[90003] = {id=90003, name="召唤", lev=1, desc="进行3次召唤", progress={{cli_label="evt_recruit",target=0,target_val=3,param={}}}, extra={}, commit_rewards={{3,20},{9,10}}, res="quest_item_yingxiong"},
	[90005] = {id=90005, name="竞技场", lev=8, desc="参与3次竞技场挑战", progress={{cli_label="evt_arena_fight",target=0,target_val=3,param={}}}, extra={}, commit_rewards={{10103,2},{9,15}}, res="quest_item_jianzhu"},
	[90007] = {id=90007, name="快速作战", lev=1, desc="快速作战5次", progress={{cli_label="evt_dungeon_fast_combat",target=0,target_val=5,param={}}}, extra={}, commit_rewards={{3,30},{9,15}}, res="quest_item_zhaohuan"},
	[90012] = {id=90012, name="试练塔挑战", lev=6, desc="挑战或扫荡试练塔任意层3次", progress={{cli_label="evt_star_tower_pass",target=0,target_val=3,param={}}}, extra={}, commit_rewards={{10001,20},{9,10}}, res="quest_item_heian"},
	[90013] = {id=90013, name="公会Boss", lev=6, desc="挑战任意公会Boss3次", progress={{cli_label="evt_guild_dun_fight",target=0,target_val=3,param={}}}, extra={}, commit_rewards={{10,50},{9,15}}, res="quest_item_guild"},
	[90014] = {id=90014, name="公会捐献", lev=6, desc="进行1次公会捐献", progress={{cli_label="evt_guild_donate",target=0,target_val=1,param={}}}, extra={}, commit_rewards={{10401,1},{9,10}}, res="quest_item_guild"},
	[90018] = {id=90018, name="无尽试炼", lev=25, desc="参与1次无尽试炼", progress={{cli_label="evt_endless_fight",target=0,target_val=1,param={}}}, extra={}, commit_rewards={{37001,1},{9,10}}, res="quest_item_dixia"},
	[90020] = {id=90020, name="悬赏任务", lev=6, desc="接取3次远航订单", progress={{cli_label="evt_shipping",target=0,target_val=3,param={}}}, extra={}, commit_rewards={{1,40000},{9,10}}, res="quest_item_guild"},
	[90023] = {id=90023, name="神器副本", lev=15, desc="参与2次日常副本", progress={{cli_label="evt_dungeon_stone_fight",target=0,target_val=2,param={}}}, extra={}, commit_rewards={{37001,1},{9,10}}, res="quest_item_heian"},
	[90024] = {id=90024, name="装备合成", lev=30, desc="在锻造屋合成1次装备", progress={{cli_label="evt_equipment_compound",target=0,target_val=1,param={}}}, extra={}, commit_rewards={{1,30000},{9,15}}, res="quest_item_heian"},
	[90025] = {id=90025, name="家园拜访", lev=70, desc="拜访并点赞他人家园3次", progress={{cli_label="evt_worship",target=5,target_val=3,param={}}}, extra={}, commit_rewards={{31,100},{9,5}}, res="quest_item_heian"}
}
Config.QuestData.data_get_fun = function(key)
	local data=Config.QuestData.data_get[key]
	if DATA_DEBUG and data == nil then
		print('(Config.QuestData.data_get['..key..'])not found') return
	end
	return data
end
-- -------------------get_end---------------------


-- -------------------progress_lable_start-------------------
Config.QuestData.data_progress_lable_length = 87
Config.QuestData.data_progress_lable = {
    evt_adventure_answer_all_right = "evt_adventure_answer_all_right",     --智力大乱斗答题全对累计x次,
    evt_adventure_box = "evt_adventure_box",     --1.开启宝箱xx次(宝箱总数)2.宝箱开出x次神器,
    evt_adventure_explore = "evt_adventure_explore",     --探险x间未探索的房间,
    evt_adventure_finger_guessing = "evt_adventure_finger_guessing",     --1.猜拳累计获胜x次2.猜拳累计失败x次,
    evt_adventure_goto_floor = "evt_adventure_goto_floor",     --进入神界冒险第x层,
    evt_adventure_kill_mon = "evt_adventure_kill_mon",     --累计击败小怪x次,
    evt_adventure_plunder = "evt_adventure_plunder",     --任意掠夺他人x次（无论成败）,
    evt_adventure_plunder_result = "evt_adventure_plunder_result",     --累计成功掠夺x次,
    evt_arena_fight = "evt_arena_fight",     --1.竞技场挑战x次（无论成败，日常用）2.竞技场累计挑战x次（成就用）,
    evt_arena_fight_result = "evt_arena_fight_result",     --1.竞技场挑战胜利x次（日常用）2.竞技场累计获胜x次（成就用）,
    evt_arena_rank = "evt_arena_rank",     --竞技场排行达到前x名,
    evt_boss_fight = "evt_boss_fight",     --挑战x次个人BOSS,
    evt_boss_fight_result = "evt_boss_fight_result",     --击败x级个人BOSS（指定类）,
    evt_cli_loaded = "evt_cli_loaded",     --1.每日登陆（日常）2.累计登陆游戏x天（成就）,
    evt_dungeon_auto = "evt_dungeon_auto",     --扫荡次剧情副本x次,
    evt_dungeon_enter = "evt_dungeon_enter",     --每日挑战x次地下城副本,
    evt_dungeon_fast_combat = "evt_dungeon_fast_combat",     --快速作战x次,
    evt_dungeon_pass = "evt_dungeon_pass",     --通过指定副本Id的副本,
    evt_eqm_sell = "evt_eqm_sell",     --熔炼装备x次,
    evt_formation_level_up = "evt_formation_level_up",     --x个阵法达到x级,
    evt_formation_open = "evt_formation_open",     --1.已学习的阵法达到x个,
    evt_friend = "evt_friend",     --拥有xx个好友,
    evt_friend_present = "evt_friend_present",     --1.向好友赠送2.每天赠送好友友情点5次,
    evt_friend_sns = "evt_friend_sns",     --与好友打招呼，发送任意消息,
    evt_gain_coin = "evt_gain_coin",     --拥有xx金币,
    evt_gain_gold = "evt_gain_gold",     --拥有xx蓝钻,
    evt_gain_guild = "evt_gain_guild",     --帮会贡献累计达到xx点,
    evt_gain_silver_coin = "evt_gain_silver_coin",     --拥有xx银币,
    evt_get_item = "evt_get_item",     --1.获得红色命格x个2.获得橙色命格x个（包括商店兑换）3.获得x个y品质的装备,
    evt_guild_donate = "evt_guild_donate",     --1.帮会任意种类捐献x次（日常用）2.帮会所以类型捐献累计达到x次（成就用）3.帮会指定类型捐献达到xx次,
    evt_guild_dun_fight = "evt_guild_dun_fight",     --1.挑战任意帮会bossx次（日常用）2.帮会副本boss挑战次数累计x次（成就用）,
    evt_guild_dun_fight_ko = "evt_guild_dun_fight_ko",     --帮会Boss的最后一击达到x次（成就用）,
    evt_guild_join = "evt_guild_join",     --加入一个帮会,
    evt_levup = "evt_levup",     --人物角色达到xx级,
    evt_loss_coin = "evt_loss_coin",     --累计消耗xx金币,
    evt_loss_guild = "evt_loss_guild",     --累计消耗xx帮会贡献点,
    evt_loss_red_gold_or_gold = "evt_loss_red_gold_or_gold",     --累计消耗xx红蓝钻,
    evt_loss_silver_coin = "evt_loss_silver_coin",     --累计消耗xx银币,
    evt_market_coin_sold = "evt_market_coin_sold",     --1..累计在市场赚取xx金币2.累计在金币市场卖出xx件金币物品,
    evt_market_gold_buy = "evt_market_gold_buy",     --1.在金币市场购买x次商品2.累计在市场消耗x金币,
    evt_market_silver_buy = "evt_market_silver_buy",     --累计在市场消耗xx银币,
    evt_market_silver_sold = "evt_market_silver_sold",     --1.累计在银币摆摊卖出xx件银币物品2.累计在银币摆摊中赚取xx银币,
    evt_partner = "evt_partner",     --1.图书馆x类英雄集齐2.获得x个英雄3.获得x个SS英雄（日常+成就通用）4.x个英雄突破到+x5.x个英雄升到x级6.x个英雄升到x星,
    evt_partner_artifact = "evt_partner_artifact",     --1.装备1件神器2.获得x件x星神器,
    evt_partner_enchant_eqm = "evt_partner_enchant_eqm",     --1.精炼装备x次（日常）2.全身装备精炼达到x级（成就）,
    evt_partner_eqm = "evt_partner_eqm",     --1.全身神装（全身橙色装备+主神器+副神器）2.装备X套橙色装备（即武器、衣服、头盔、鞋子都为橙色）,
    evt_partner_levelup = "evt_partner_levelup",     --升级英雄x次,
    evt_power = "evt_power",     --总战斗力达到xx点,
    evt_recruit = "evt_recruit",     --进行x次英雄召唤,
    evt_say = "evt_say",     --在世界频道发言x次(包括表情),
    evt_star_divination = "evt_star_divination",     --任意进行x次观星（日常）（普通观星和皇家观星）,
    evt_star_level_up = "evt_star_level_up",     --x套星命升到x级,
    evt_star_natal = "evt_star_natal",     --1.集齐x套紫色/橙色/红色命格2.集齐x套星命,
    evt_star_natal_level_up = "evt_star_natal_level_up",     --x个红色命格升星到x星,
    evt_star_tower_pass = "evt_star_tower_pass",     --1.星命塔全通2.扫荡或挑战星命塔任意一层x次（日常用）,
    evt_star_tower_floor_pass = "evt_star_tower_floor_pass",     --通关星命塔指定层数,
    evt_world_boss_fight = "evt_world_boss_fight",     --1.挑战x次世界BOSS（日常用）2.累计挑战xx次世界BOSS（成就用）,
    evt_world_boss_fight_ko = "evt_world_boss_fight_ko",     --完成一次任意世界BOSS的击杀（最后一击）,
    evt_dungeon_stone_fight = "evt_dungeon_stone_fight",     --1.参与x次宝石副本2.参与x次圣器副本3.参与x次日常副本,
    evt_escort_enter = "evt_escort_enter",     --参与x次萌兽夺宝,
    evt_escort_fight = "evt_escort_fight",     --参与x次萌兽夺宝掠夺,
    evt_endless_fight = "evt_endless_fight",     --参与x次无尽试炼,
    evt_eqm_compound = "evt_eqm_compound",     --进行x次橙装进阶,
    evt_mystery_buy = "evt_mystery_buy",     --英雄商城购买x次,
    evt_partner_stone_all_lv = "evt_partner_stone_all_lv",     --任意英雄宝石总等级x级,
    evt_partner_star = "evt_partner_star",     --x个英雄提升x星,
    evt_hallows_all_step = "evt_hallows_all_step",     --圣器总阶数x阶,
    evt_guild_war = "evt_guild_war",     --参与x次帮会战,
    evt_endless_pass = "evt_endless_pass",     --无尽试炼通关x关,
    evt_recruit_high = "evt_recruit_high",     --参与x次先知圣殿召唤,
    evt_arena_score = "evt_arena_score",     --竞技场达到x分,
    evt_partner_star_up = "evt_partner_star_up",     --融合祭坛合成x个x星英雄,
    evt_shipping = "evt_shipping",     --参与x次远航,
    evt_partner_decompose = "evt_partner_decompose",     --祭司小屋中分解x个英雄,
    evt_expedition_fight = "evt_expedition_fight",     --通过英雄远征第x关（成就用）,
    evt_artifact_compose = "evt_artifact_compose",     --进行x次符文合成（成就用）,
    evt_friend_present = "evt_friend_present",     --赠送x次友情点（成就用）,
    evt_primus_fight = "evt_primus_fight",     --参与x次星河神殿,
    evt_arena_elite_rank = "evt_arena_elite_rank",     --精英赛达到王者段位,
    evt_partner = "evt_partner",     --拥有x个x星英雄,
    evt_sky_ladder_rank = "evt_sky_ladder_rank",     --跨服天梯进入x名,
    evt_equipment_compound = "evt_equipment_compound",     --合成过x件装备,
    evt_worship = "evt_worship",     --点赞他人家园x次,
    evt_get_speciality = "evt_get_speciality",     --萌宠收藏中不同的珍品数达到x个,
    evt_travel_time = "evt_travel_time",     --萌宠出行时长累计达x小时,
    evt_get_furniture = "evt_get_furniture",     --萌宠出行累计带回红色家具x件,
    evt_planes_kill_guard = "evt_planes_kill_guard",     --位面征战击杀守卫x个
}
-- -------------------progress_lable_end---------------------

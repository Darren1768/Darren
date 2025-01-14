----------------------------------------------------
-- 此文件由数据工具生成
-- 公会配置数据--guild_data.xml
--------------------------------------

Config = Config or {} 
Config.GuildData = Config.GuildData or {}

-- -------------------position_start-------------------
Config.GuildData.data_position_length = 3
Config.GuildData.data_position = {
	[1] = {id=1, name="会长", limit={1,2,3,4,5,6,7,8,9,10,11,12,13}},
	[2] = {id=2, name="副会长", limit={2,3,4,5,6,7,8,9,10,11,12}},
	[3] = {id=3, name="成员", limit={}}
}
Config.GuildData.data_position_fun = function(key)
	local data=Config.GuildData.data_position[key]
	if DATA_DEBUG and data == nil then
		print('(Config.GuildData.data_position['..key..'])not found') return
	end
	return data
end
-- -------------------position_end---------------------


-- -------------------donate_start-------------------
Config.GuildData.data_donate_length = 3
Config.GuildData.data_donate = {
	[1] = {id=1, name="金币捐献", loss={{2,20000}}, gain={{10,100},{16,50}}, desc="滴水成川，聚沙成塔！"},
	[2] = {id=2, name="钻石捐献", loss={{15,100}}, gain={{10,250},{16,100}}, desc="愿神保佑我们！"},
	[3] = {id=3, name="至尊捐献", loss={{15,300}}, gain={{10,800},{16,200}}, desc="我们公会是不可战胜的！"}
}
Config.GuildData.data_donate_fun = function(key)
	local data=Config.GuildData.data_donate[key]
	if DATA_DEBUG and data == nil then
		print('(Config.GuildData.data_donate['..key..'])not found') return
	end
	return data
end
-- -------------------donate_end---------------------


-- -------------------post_start-------------------
Config.GuildData.data_post_length = 41
Config.GuildData.data_post = {
	["2_1"] = {num=2},
	["2_2"] = {num=2},
	["2_3"] = {num=2},
	["2_4"] = {num=2},
	["2_5"] = {num=2},
	["2_6"] = {num=3},
	["2_7"] = {num=3},
	["2_8"] = {num=3},
	["2_9"] = {num=3},
	["2_10"] = {num=3},
	["2_11"] = {num=4},
	["2_12"] = {num=4},
	["2_13"] = {num=4},
	["2_14"] = {num=4},
	["2_15"] = {num=4},
	["2_16"] = {num=5},
	["2_17"] = {num=5},
	["2_18"] = {num=5},
	["2_19"] = {num=5},
	["2_20"] = {num=5},
	["2_21"] = {num=5},
	["3_1"] = {num=999},
	["3_2"] = {num=999},
	["3_3"] = {num=999},
	["3_4"] = {num=999},
	["3_5"] = {num=999},
	["3_6"] = {num=999},
	["3_7"] = {num=999},
	["3_8"] = {num=999},
	["3_9"] = {num=999},
	["3_10"] = {num=999},
	["3_11"] = {num=999},
	["3_12"] = {num=999},
	["3_13"] = {num=999},
	["3_14"] = {num=999},
	["3_15"] = {num=999},
	["3_16"] = {num=999},
	["3_17"] = {num=999},
	["3_18"] = {num=999},
	["3_19"] = {num=999},
	["3_20"] = {num=999}
}
Config.GuildData.data_post_fun = function(key)
	local data=Config.GuildData.data_post[key]
	if DATA_DEBUG and data == nil then
		print('(Config.GuildData.data_post['..key..'])not found') return
	end
	return data
end
-- -------------------post_end---------------------


-- -------------------guild_lev_start-------------------
Config.GuildData.data_guild_lev_length = 20
Config.GuildData.data_guild_lev = {
	[1] = {lev=1, exp=750, num=15, desc="人数上限提升至<div color=#249003>15</div>人"},
	[2] = {lev=2, exp=1600, num=16, desc="人数上限提升至<div color=#249003>16</div>人"},
	[3] = {lev=3, exp=2560, num=16, desc="人数上限提升至<div color=#249003>16</div>人"},
	[4] = {lev=4, exp=4080, num=17, desc="人数上限提升至<div color=#249003>17</div>人"},
	[5] = {lev=5, exp=5780, num=17, desc="人数上限提升至<div color=#249003>17</div>人"},
	[6] = {lev=6, exp=8280, num=18, desc="人数上限提升至<div color=#249003>18</div>人"},
	[7] = {lev=7, exp=10800, num=18, desc="人数上限提升至<div color=#249003>18</div>人"},
	[8] = {lev=8, exp=14440, num=19, desc="人数上限提升至<div color=#249003>19</div>人"},
	[9] = {lev=9, exp=17860, num=19, desc="人数上限提升至<div color=#249003>19</div>人"},
	[10] = {lev=10, exp=22800, num=20, desc="人数上限提升至<div color=#249003>20</div>人"},
	[11] = {lev=11, exp=27200, num=20, desc="人数上限提升至<div color=#249003>20</div>人"},
	[12] = {lev=12, exp=33600, num=21, desc="人数上限提升至<div color=#249003>21</div>人"},
	[13] = {lev=13, exp=39060, num=21, desc="人数上限提升至<div color=#249003>21</div>人"},
	[14] = {lev=14, exp=47080, num=22, desc="人数上限提升至<div color=#249003>22</div>人"},
	[15] = {lev=15, exp=53680, num=22, desc="人数上限提升至<div color=#249003>22</div>人"},
	[16] = {lev=16, exp=63480, num=23, desc="人数上限提升至<div color=#249003>23</div>人"},
	[17] = {lev=17, exp=71300, num=23, desc="人数上限提升至<div color=#249003>23</div>人"},
	[18] = {lev=18, exp=83040, num=24, desc="人数上限提升至<div color=#249003>24</div>人"},
	[19] = {lev=19, exp=92160, num=24, desc="人数上限提升至<div color=#249003>24</div>人"},
	[20] = {lev=20, exp=106000, num=25, desc="人数上限提升至<div color=#249003>25</div>人"}
}
Config.GuildData.data_guild_lev_fun = function(key)
	local data=Config.GuildData.data_guild_lev[key]
	if DATA_DEBUG and data == nil then
		print('(Config.GuildData.data_guild_lev['..key..'])not found') return
	end
	return data
end
-- -------------------guild_lev_end---------------------


-- -------------------sign_start-------------------
Config.GuildData.data_sign_length = 3
Config.GuildData.data_sign = {
{sign="欢迎各位勇敢的冒险者加入！一起打造大陆第一公会！"},
{sign="欢迎菜鸟们加入一起玩耍！o(￣v￣)o~努力成长！携手搬砖！"},
{sign="魔物纵横，英雄辈出，匡扶乱世，携手前行！欢迎加入！"}
}
-- -------------------sign_end---------------------


-- -------------------const_start-------------------
Config.GuildData.data_const_length = 29
Config.GuildData.data_const = {
	["create_gold"] = {key="create_gold", val=100, desc="创建消耗钻石"},
	["day_exp_max"] = {key="day_exp_max", val=3000, desc="每日经验上限"},
	["ad_free"] = {key="ad_free", val=1, desc="每日免费广告次数"},
	["ad_cost"] = {key="ad_cost", val=20, desc="发布广告消耗"},
	["impeach_gold"] = {key="impeach_gold", val={{15,300}}, desc="弹劾会长所需费用/钻"},
	["impeach_offline_day1"] = {key="impeach_offline_day1", val=3, desc="会长X天不上线副会长可弹劾"},
	["impeach_offline_day2"] = {key="impeach_offline_day2", val=7, desc="会长X天不上线普通成员可弹劾"},
	["rename_gold"] = {key="rename_gold", val=500, desc="公会改名消耗钻石"},
	["rename_time"] = {key="rename_time", val=48, desc="公会改名冷却时间/小时"},
	["maintain_min_exp"] = {key="maintain_min_exp", val=0, desc="公会经验达到多少后自动解散"},
	["maintain_start_time"] = {key="maintain_start_time", val=21600, desc="创建公会后6小时后开启维护"},
	["guild_merge_lev"] = {key="guild_merge_lev", val=2, desc="公会等级达到X级后才可合并"},
	["merge_cost"] = {key="merge_cost", val=200, desc="合并消耗钻石"},
	["merge_time"] = {key="merge_time", val=86400, desc="合并发送请求持续时间（单位秒）"},
	["guild_min_lev"] = {key="guild_min_lev", val=18, desc="创建或加入公会所需等级"},
	["recruit_cost"] = {key="recruit_cost", val=20, desc="招募消耗钻石"},
	["recruit_limit"] = {key="recruit_limit", val=5, desc="每日招募限制次数"},
	["red_packet_send"] = {key="red_packet_send", val=10, desc="每日发红包次数"},
	["red_packet_get"] = {key="red_packet_get", val=10, desc="每日领取红包次数"},
	["guild_quit_cd"] = {key="guild_quit_cd", val=43200, desc="退会再入会时间（单位：秒）"},
	["game_rule"] = {key="game_rule", val=1, desc="1.会长拥有会内最高权限，拥有修改公会内部信息、管理成员、任命/罢免副会长等权限。\n2.公会可发布招募消息，发布后在世界聊天频道中显示。\n3.退出公会后，12小时内不可加入其他公会。\n4.捐献是提高公会经验的重要途径，提高公会经验可令公会升级，公会升级后会增加总人数上限和副会长职位上限，还可开启各种公会玩法。\n5.会长在离线3天时，副会长有权弹劾他成为新的会长；会长离线七天以上，所有成员可以弹劾他成为新的会长。\n6.每一类型公会红包每日只可发放10次，每日的00:00重置次数。"},
	["game_rule1"] = {key="game_rule1", val=2, desc="1.所有公会成员每天只可捐献1次（0点重置），从3种捐献中选择，不同捐献项带来的收益不一样，捐献时请留意\n2.捐献后可获得<div fontcolor=289b14>公会经验</div>和<div fontcolor=289b14>公会贡献</div>，捐献是提升公会等级的重要途径\n3.当天捐献后若更换公会，不可继续捐献"},
	["maintain_vip_condition"] = {key="maintain_vip_condition", val=2, desc="创建公会所需vip等级"},
	["remove_limit"] = {key="remove_limit", val=10, desc="联盟每日可踢人次数"},
	["transfer_time_condition"] = {key="transfer_time_condition", val=48, desc="转让会长需要联盟创建x小时"},
	["gold_donate_remove_limit"] = {key="gold_donate_remove_limit", val=3, desc="联盟每日可踢捐钻石的人次数"},
	["guild_limit_power_choice"] = {key="guild_limit_power_choice", val={0,50000,100000,200000,400000,800000,1500000,3000000}, desc="加入公会战力条件的分段"},
	["guild_leader_create_guild_cd"] = {key="guild_leader_create_guild_cd", val=24, desc="会长解散公会再建会CD(小时)"},
	["guild_mem_create_guild_cd"] = {key="guild_mem_create_guild_cd", val=12, desc="会员退会再建会CD(小时)"}
}
Config.GuildData.data_const_fun = function(key)
	local data=Config.GuildData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.GuildData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------donate_box_start-------------------
Config.GuildData.data_donate_box_length = 3
Config.GuildData.data_donate_box = {
	[1] = {box_val=1000, rewards={{10,50},{1,10000}}, effect_id=109},
	[2] = {box_val=2000, rewards={{10,100},{1,15000}}, effect_id=108},
	[3] = {box_val=3000, rewards={{10,200},{1,20000}}, effect_id=110}
}
Config.GuildData.data_donate_box_fun = function(key)
	local data=Config.GuildData.data_donate_box[key]
	if DATA_DEBUG and data == nil then
		print('(Config.GuildData.data_donate_box['..key..'])not found') return
	end
	return data
end
-- -------------------donate_box_end---------------------


-- -------------------guild_red_bag_start-------------------
Config.GuildData.data_guild_red_bag_length = 3
Config.GuildData.data_guild_red_bag = {
	[1] = {id=1, name="小清新红包", type=2, charge_id=501, loss_item={{10800,1}}, loss_assets={}, val=600000, num=10, assets="coin", price=12, desc="试问谁不喜欢金币？", msg="不问红包出处，大家开心就好！", res_name="redbag_4", limit=30, reward={{3,120},{10,550}}},
	[2] = {id=2, name="高端大气红包", type=2, charge_id=502, loss_item={{10801,1}}, loss_assets={}, val=500, num=10, assets="gold", price=50, desc="钻石代表我的心意", msg="美妙的一天，今天是值得庆祝的日子！", res_name="redbag_10", limit=20, reward={{3,500},{10,650},{10403,4}}},
	[3] = {id=3, name="至尊土豪红包", type=2, charge_id=503, loss_item={}, loss_assets={}, val=6480, num=15, assets="gold", price=648, desc="哗啦啦的钻石雨~", msg="红包发给最爱的你们，么么哒！", res_name="redbag_5", limit=10, reward={{3,6480},{10,10000},{14001,12}}}
}
Config.GuildData.data_guild_red_bag_fun = function(key)
	local data=Config.GuildData.data_guild_red_bag[key]
	if DATA_DEBUG and data == nil then
		print('(Config.GuildData.data_guild_red_bag['..key..'])not found') return
	end
	return data
end
-- -------------------guild_red_bag_end---------------------


-- -------------------guild_scene_icon_start-------------------
Config.GuildData.data_guild_scene_icon_length = 11
Config.GuildData.data_guild_scene_icon = {
	[1] = {name="公会宠物", type=1, icon="1", pos={{831,1030}}, res_type=1},
	[2] = {name="齐修堂", type=2, icon="2", pos={{597,895}}, res_type=1},
	[3] = {name="公会宝库", type=3, icon="3", pos={{263,265}}, res_type=1},
	[4] = {name="公会兑换", type=4, icon="4", pos={{1011,955}}, res_type=1},
	[5] = {name="公会赛事", type=5, icon="5", pos={{695,1171}}, res_type=1},
	[6] = {name="公会红包", type=6, icon="6", pos={{855,627}}, res_type=1},
	[7] = {name="限时兑换", type=7, icon="7", pos={{196,767}}, res_type=1},
	[8] = {name="公会使者", type=8, icon="8", pos={{219,1128}}, res_type=1},
	[9] = {name="公会名册", type=9, icon="9", pos={{953,428}}, res_type=1},
	[10] = {name="公会排名", type=10, icon="10", pos={{975,1172}}, res_type=1},
	[11] = {name="命运树", type=11, icon="11", pos={{468,1175}}, res_type=1}
}
Config.GuildData.data_guild_scene_icon_fun = function(key)
	local data=Config.GuildData.data_guild_scene_icon[key]
	if DATA_DEBUG and data == nil then
		print('(Config.GuildData.data_guild_scene_icon['..key..'])not found') return
	end
	return data
end
-- -------------------guild_scene_icon_end---------------------

----------------------------------------------------
-- 此文件由数据工具生成
-- 伙伴招募数据--recruit_data.xml
--------------------------------------

Config = Config or {} 
Config.RecruitData = Config.RecruitData or {}

----------------------partnersummon_action_params_start--------------
-----move_base_x  移动的倍数 负数表示向左移动几倍，正数表示向右移动的倍数
-----move_base_y  移动的倍数 负数表示向下移动几倍，正数表示向上移动的倍数
Config.RecruitData.data_partnersummon_action_params_length = 4
Config.RecruitData.data_partnersummon_action_params = {
	{hori_base_num = 16,portrait_base_num = 8},
	{{run_time = 10,move_base_x = -1,move_base_y = 0},{run_time = 20,move_base_x = 2,move_base_y = 0},{run_time = 10,move_base_x = -1,move_base_y = 0}},
	{{run_time = 20,move_base_x = -0.5,move_base_y = 0},{run_time = 40,move_base_x = 1,move_base_y = 0},{run_time = 20,move_base_x = -0.5,move_base_y = 0}},
	{{run_time = 30,move_base_x = 0,move_base_y = 0.25},{run_time = 60,move_base_x = 0,move_base_y = -0.5},{run_time = 30,move_base_x = 0,move_base_y = 0.25}},
}

----------------------partnersummon_action_parms_end--------------
-- -------------------partnersummon_data_start-------------------
Config.RecruitData.data_partnersummon_data_length = 4
Config.RecruitData.data_partnersummon_data = {
	[100] = {group_id=100, name="基础召唤", limit_id={}, draw_list={1,10}, item_once={{10401,1}}, item_five={{10401,10}}, ext_item_once={}, ext_item_five={}, exchange_once={}, exchange_once_gain={{22,1000}}, exchange_five={}, exchange_five_gain={{22,10000}}, month_card_dist_five=0, limit_dist_five_time=0, limit_dist_five_lose={}, limit_dist_five_count=0, card_bg_res="partnersummon_100", action_name="action", call_bg="partnersummon_call_bg_100", action_card_name="action2", call_bg_action=147, sort_id=1, recruit_hero_gain={{23,1}}, is_show=0},
	[200] = {group_id=200, name="友情召唤", limit_id={}, draw_list={1,10}, item_once={{14,100}}, item_five={{14,1000}}, ext_item_once={}, ext_item_five={}, exchange_once={}, exchange_once_gain={{22,2000}}, exchange_five={}, exchange_five_gain={{22,20000}}, month_card_dist_five=0, limit_dist_five_time=0, limit_dist_five_lose={}, limit_dist_five_count=0, card_bg_res="partnersummon_200", action_name="action2", call_bg="partnersummon_call_bg_200", action_card_name="action1", call_bg_action=158, sort_id=2, recruit_hero_gain={{23,2}}, is_show=0},
	[300] = {group_id=300, name="高级召唤", limit_id={{'dun',10020}}, draw_list={1,10}, item_once={{10403,1}}, item_five={{10403,10}}, ext_item_once={{10409,1}}, ext_item_five={{10409,10}}, exchange_once={{3,220}}, exchange_once_gain={{22,5000}}, exchange_five={{3,2000}}, exchange_five_gain={{22,50000}}, month_card_dist_five=0, limit_dist_five_time=0, limit_dist_five_lose={}, limit_dist_five_count=0, card_bg_res="partnersummon_300", action_name="action", call_bg="partnersummon_call_bg_100", action_card_name="action2", call_bg_action=147, sort_id=3, recruit_hero_gain={{23,20}}, is_show=0},
	[400] = {group_id=400, name="积分召唤", limit_id={}, draw_list={1}, item_once={}, item_five={}, ext_item_once={}, ext_item_five={}, exchange_once={{23,1000}}, exchange_once_gain={}, exchange_five={}, exchange_five_gain={}, month_card_dist_five=0, limit_dist_five_time=0, limit_dist_five_lose={}, limit_dist_five_count=0, card_bg_res="partnersummon_400", action_name="action2", call_bg="partnersummon_call_bg_200", action_card_name="action1", call_bg_action=158, sort_id=0, recruit_hero_gain={}, is_show=1}
}
Config.RecruitData.data_partnersummon_data_fun = function(key)
	local data=Config.RecruitData.data_partnersummon_data[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RecruitData.data_partnersummon_data['..key..'])not found') return
	end
	return data
end
-- -------------------partnersummon_data_end---------------------


-- -------------------partnersummon_const_start-------------------
Config.RecruitData.data_partnersummon_const_length = 8
Config.RecruitData.data_partnersummon_const = {
	["common_s"] = {key="common_s", val=10401, desc="单抽召唤道具ID"},
	["senior_s"] = {key="senior_s", val=10402, desc="5连抽召唤道具ID"},
	["common_time"] = {key="common_time", val=1, desc="普通召唤每天免费次数"},
	["c_interval"] = {key="c_interval", val=3600, desc="普通召唤免费次数间隔/s"},
	["common_gold"] = {key="common_gold", val=5, desc="金币召唤次数（每日）"},
	["share_role"] = {key="share_role", val=100, desc="角色首次分享获得红钻"},
	["share_day"] = {key="share_day", val=20, desc="每日首次分享获得红钻"},
	["recruit_vip"] = {key="recruit_vip", val=3, desc="积分召唤VIP等级限制"}
}
Config.RecruitData.data_partnersummon_const_fun = function(key)
	local data=Config.RecruitData.data_partnersummon_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RecruitData.data_partnersummon_const['..key..'])not found') return
	end
	return data
end
-- -------------------partnersummon_const_end---------------------


-- -------------------explain_start-------------------
Config.RecruitData.data_explain_length = 5
Config.RecruitData.data_explain = {
	[1] = {id=1, title="掉落概率", desc="应国家有关法律规定，对游戏内[召唤]的产出概率进行公布，这些“ 概率”均是在大样本（大量用户）下的统计数值，与单个玩家的少量测试数据之间可能存在一定差异，<div fontcolor=#a95f0f>希望广大玩家理性消费，健康游戏。</div>"},
	[2] = {id=2, title="基础召唤", desc="1星英雄                                                                             53.00%\n2星英雄                                                                             36.00%\n3星英雄                                                                              9.10%\n4星英雄                                                                             1.50%\n5星英雄                                                                              0.40%"},
	[3] = {id=3, title="友情召唤", desc="2星英雄                                                                             35.50%\n3星英雄                                                                             50.00%\n4星英雄                                                                             13.50%\n5星英雄                                                                             1.00%"},
	[4] = {id=4, title="高级召唤", desc="3星英雄                                                                             80.00%\n4星英雄                                                                             15.00%\n5星英雄                                                                              5.00%"},
	[5] = {id=5, title="积分召唤", desc="5星英雄                                                                             100.00%"}
}
Config.RecruitData.data_explain_fun = function(key)
	local data=Config.RecruitData.data_explain[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RecruitData.data_explain['..key..'])not found') return
	end
	return data
end
-- -------------------explain_end---------------------


-- -------------------summon_data_start-------------------
Config.RecruitData.data_summon_data_length = 4
Config.RecruitData.data_summon_data = {
	[100] = {
		[24200] = {id=100, base_id=24200, summon_desc="0.535294117647059"},
		[24201] = {id=100, base_id=24201, summon_desc="0.535294117647059"},
		[24202] = {id=100, base_id=24202, summon_desc="0.535294117647059"},
		[25200] = {id=100, base_id=25200, summon_desc="0.535294117647059"},
		[26200] = {id=100, base_id=26200, summon_desc="0.535294117647059"},
		[26201] = {id=100, base_id=26201, summon_desc="0.535294117647059"},
		[26202] = {id=100, base_id=26202, summon_desc="0.535294117647059"},
		[28200] = {id=100, base_id=28200, summon_desc="0.535294117647059"},
		[24300] = {id=100, base_id=24300, summon_desc="0.066"},
		[25300] = {id=100, base_id=25300, summon_desc="0.066"},
		[25301] = {id=100, base_id=25301, summon_desc="0.066"},
		[25302] = {id=100, base_id=25302, summon_desc="0.066"},
		[26300] = {id=100, base_id=26300, summon_desc="0.066"},
		[26301] = {id=100, base_id=26301, summon_desc="0.066"},
		[28300] = {id=100, base_id=28300, summon_desc="0.064"},
		[24400] = {id=100, base_id=24400, summon_desc="0.011"},
		[24401] = {id=100, base_id=24401, summon_desc="0.002"},
		[24402] = {id=100, base_id=24402, summon_desc="0.011"},
		[24403] = {id=100, base_id=24403, summon_desc="0.002"},
		[24404] = {id=100, base_id=24404, summon_desc="0.002"},
		[25400] = {id=100, base_id=25400, summon_desc="0.011"},
		[25401] = {id=100, base_id=25401, summon_desc="0.011"},
		[25402] = {id=100, base_id=25402, summon_desc="0.023"},
		[25403] = {id=100, base_id=25403, summon_desc="0.011"},
		[25409] = {id=100, base_id=25409, summon_desc="0.002"},
		[26400] = {id=100, base_id=26400, summon_desc="0.011"},
		[26401] = {id=100, base_id=26401, summon_desc="0.002"},
		[26402] = {id=100, base_id=26402, summon_desc="0.023"},
		[26403] = {id=100, base_id=26403, summon_desc="0.011"},
		[27400] = {id=100, base_id=27400, summon_desc="0.011"},
		[27401] = {id=100, base_id=27401, summon_desc="0.002"},
		[27402] = {id=100, base_id=27402, summon_desc="0.008"},
		[27403] = {id=100, base_id=27403, summon_desc="0.008"},
		[27404] = {id=100, base_id=27404, summon_desc="0.011"},
		[27405] = {id=100, base_id=27405, summon_desc="0.008"},
		[27406] = {id=100, base_id=27406, summon_desc="0.002"},
		[27407] = {id=100, base_id=27407, summon_desc="0.002"},
		[28400] = {id=100, base_id=28400, summon_desc="0.011"},
		[28401] = {id=100, base_id=28401, summon_desc="0.0017"},
		[28402] = {id=100, base_id=28402, summon_desc="0.008"},
		[28403] = {id=100, base_id=28403, summon_desc="0.0017"},
		[28404] = {id=100, base_id=28404, summon_desc="0.008"},
		[28405] = {id=100, base_id=28405, summon_desc="0.011"},
	},
	[200] = {
		[24200] = {id=200, base_id=24200, summon_desc="2.94117647058824"},
		[24201] = {id=200, base_id=24201, summon_desc="2.94117647058824"},
		[24202] = {id=200, base_id=24202, summon_desc="2.94117647058824"},
		[25200] = {id=200, base_id=25200, summon_desc="2.94117647058824"},
		[26200] = {id=200, base_id=26200, summon_desc="2.94117647058824"},
		[26201] = {id=200, base_id=26201, summon_desc="2.94117647058824"},
		[26202] = {id=200, base_id=26202, summon_desc="2.94117647058824"},
		[28200] = {id=200, base_id=28200, summon_desc="2.94117647058824"},
		[24300] = {id=200, base_id=24300, summon_desc="0.6"},
		[25300] = {id=200, base_id=25300, summon_desc="0.6"},
		[25301] = {id=200, base_id=25301, summon_desc="0.6"},
		[25302] = {id=200, base_id=25302, summon_desc="0.6"},
		[26300] = {id=200, base_id=26300, summon_desc="0.6"},
		[26301] = {id=200, base_id=26301, summon_desc="0.6"},
		[27300] = {id=200, base_id=27300, summon_desc="0.5625"},
		[28300] = {id=200, base_id=28300, summon_desc="0.5625"},
		[24400] = {id=200, base_id=24400, summon_desc="0.013"},
		[24401] = {id=200, base_id=24401, summon_desc="0.005"},
		[24402] = {id=200, base_id=24402, summon_desc="0.014"},
		[24403] = {id=200, base_id=24403, summon_desc="0.005"},
		[24404] = {id=200, base_id=24404, summon_desc="0.005"},
		[25400] = {id=200, base_id=25400, summon_desc="0.013"},
		[25401] = {id=200, base_id=25401, summon_desc="0.014"},
		[25402] = {id=200, base_id=25402, summon_desc="0.069"},
		[25403] = {id=200, base_id=25403, summon_desc="0.013"},
		[25409] = {id=200, base_id=25409, summon_desc="0.0043"},
		[26400] = {id=200, base_id=26400, summon_desc="0.013"},
		[26401] = {id=200, base_id=26401, summon_desc="0.0043"},
		[26402] = {id=200, base_id=26402, summon_desc="0.069"},
		[26403] = {id=200, base_id=26403, summon_desc="0.014"},
		[27400] = {id=200, base_id=27400, summon_desc="0.034"},
		[27401] = {id=200, base_id=27401, summon_desc="0.003"},
		[27402] = {id=200, base_id=27402, summon_desc="0.026"},
		[27403] = {id=200, base_id=27403, summon_desc="0.026"},
		[27404] = {id=200, base_id=27404, summon_desc="0.034"},
		[27405] = {id=200, base_id=27405, summon_desc="0.026"},
		[27406] = {id=200, base_id=27406, summon_desc="0.003"},
		[27407] = {id=200, base_id=27407, summon_desc="0.003"},
		[28400] = {id=200, base_id=28400, summon_desc="0.034"},
		[28401] = {id=200, base_id=28401, summon_desc="0.0033"},
		[28402] = {id=200, base_id=28402, summon_desc="0.025"},
		[28403] = {id=200, base_id=28403, summon_desc="0.0033"},
		[28404] = {id=200, base_id=28404, summon_desc="0.025"},
		[28405] = {id=200, base_id=28405, summon_desc="0.034"},
	},
	[300] = {
		[24200] = {id=300, base_id=24200, summon_desc="4.7"},
		[24201] = {id=300, base_id=24201, summon_desc="4.7"},
		[24202] = {id=300, base_id=24202, summon_desc="4.7"},
		[25200] = {id=300, base_id=25200, summon_desc="4.7"},
		[26200] = {id=300, base_id=26200, summon_desc="4.7"},
		[26201] = {id=300, base_id=26201, summon_desc="4.7"},
		[26202] = {id=300, base_id=26202, summon_desc="4.7"},
		[28200] = {id=300, base_id=28200, summon_desc="4.7"},
		[24300] = {id=300, base_id=24300, summon_desc="0.666666666666667"},
		[25300] = {id=300, base_id=25300, summon_desc="0.666666666666667"},
		[25301] = {id=300, base_id=25301, summon_desc="0.666666666666667"},
		[25302] = {id=300, base_id=25302, summon_desc="0.666666666666667"},
		[26300] = {id=300, base_id=26300, summon_desc="0.666666666666667"},
		[26301] = {id=300, base_id=26301, summon_desc="0.666666666666667"},
		[27300] = {id=300, base_id=27300, summon_desc="0.63"},
		[28300] = {id=300, base_id=28300, summon_desc="0.63"},
		[24400] = {id=300, base_id=24400, summon_desc="0.071"},
		[24401] = {id=300, base_id=24401, summon_desc="0.03"},
		[24402] = {id=300, base_id=24402, summon_desc="0.071"},
		[24403] = {id=300, base_id=24403, summon_desc="0.03"},
		[24404] = {id=300, base_id=24404, summon_desc="0.03"},
		[25400] = {id=300, base_id=25400, summon_desc="0.071"},
		[25401] = {id=300, base_id=25401, summon_desc="0.071"},
		[25402] = {id=300, base_id=25402, summon_desc="0.37"},
		[25403] = {id=300, base_id=25403, summon_desc="0.071"},
		[25409] = {id=300, base_id=25409, summon_desc="0.02"},
		[26400] = {id=300, base_id=26400, summon_desc="0.071"},
		[26401] = {id=300, base_id=26401, summon_desc="0.025"},
		[26402] = {id=300, base_id=26402, summon_desc="0.37"},
		[26403] = {id=300, base_id=26403, summon_desc="0.071"},
		[27400] = {id=300, base_id=27400, summon_desc="0.154"},
		[27401] = {id=300, base_id=27401, summon_desc="0.012"},
		[27402] = {id=300, base_id=27402, summon_desc="0.116"},
		[27403] = {id=300, base_id=27403, summon_desc="0.116"},
		[27404] = {id=300, base_id=27404, summon_desc="0.154"},
		[27405] = {id=300, base_id=27405, summon_desc="0.116"},
		[27406] = {id=300, base_id=27406, summon_desc="0.012"},
		[28400] = {id=300, base_id=28400, summon_desc="0.153"},
		[28401] = {id=300, base_id=28401, summon_desc="0.0125"},
		[28402] = {id=300, base_id=28402, summon_desc="0.116"},
		[28403] = {id=300, base_id=28403, summon_desc="0.0125"},
		[28404] = {id=300, base_id=28404, summon_desc="0.116"},
		[28405] = {id=300, base_id=28405, summon_desc="0.153"},
	},
	[400] = {
		[24400] = {id=400, base_id=24400, summon_desc="1.3"},
		[24401] = {id=400, base_id=24401, summon_desc="0.42"},
		[24402] = {id=400, base_id=24402, summon_desc="1.3"},
		[24403] = {id=400, base_id=24403, summon_desc="0.42"},
		[24404] = {id=400, base_id=24404, summon_desc="0.42"},
		[25400] = {id=400, base_id=25400, summon_desc="1.3"},
		[25401] = {id=400, base_id=25401, summon_desc="1.3"},
		[25402] = {id=400, base_id=25402, summon_desc="6.4"},
		[25403] = {id=400, base_id=25403, summon_desc="1.3"},
		[25409] = {id=400, base_id=25409, summon_desc="0.33"},
		[26400] = {id=400, base_id=26400, summon_desc="1.3"},
		[26401] = {id=400, base_id=26401, summon_desc="0.3"},
		[26402] = {id=400, base_id=26402, summon_desc="6.4"},
		[26403] = {id=400, base_id=26403, summon_desc="1.3"},
		[27400] = {id=400, base_id=27400, summon_desc="6.374"},
		[27401] = {id=400, base_id=27401, summon_desc="0.35"},
		[27402] = {id=400, base_id=27402, summon_desc="1.2"},
		[27403] = {id=400, base_id=27403, summon_desc="1.2"},
		[27404] = {id=400, base_id=27404, summon_desc="6.374"},
		[27405] = {id=400, base_id=27405, summon_desc="1.2"},
		[27406] = {id=400, base_id=27406, summon_desc="0.35"},
		[27407] = {id=400, base_id=27407, summon_desc="0.35"},
		[28400] = {id=400, base_id=28400, summon_desc="6.375"},
		[28401] = {id=400, base_id=28401, summon_desc="0.3"},
		[28402] = {id=400, base_id=28402, summon_desc="1.2"},
		[28403] = {id=400, base_id=28403, summon_desc="0.3"},
		[28404] = {id=400, base_id=28404, summon_desc="1.2"},
		[28405] = {id=400, base_id=28405, summon_desc="6.375"},
	},
}
-- -------------------summon_data_end---------------------

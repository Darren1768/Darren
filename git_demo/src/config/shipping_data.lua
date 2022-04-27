----------------------------------------------------
-- 此文件由数据工具生成
-- 联盟远航配置数据--shipping_data.xml
--------------------------------------

Config = Config or {} 
Config.ShippingData = Config.ShippingData or {}

-- -------------------const_start-------------------
Config.ShippingData.data_const_length = 9
Config.ShippingData.data_const = {
	["guild_lev"] = {key="guild_lev", val=12, desc="12级开启远航"},
	["refresh_cost"] = {key="refresh_cost", val={{10002,1}}, desc="道具刷新消耗"},
	["max_quest"] = {key="max_quest", val=6, desc="最大订单数"},
	["refresh_bless"] = {key="refresh_bless", val=0, desc="刷新保底次数"},
	["refresh_free_count"] = {key="refresh_free_count", val=2, desc="免费刷新次数"},
	["refresh_vip"] = {key="refresh_vip", val={103}, desc="初级远航刷新特权"},
	["refresh_highvip"] = {key="refresh_highvip", val={104}, desc="高级远航刷新特权"},
	["first_refresh"] = {key="first_refresh", val={10905,10701,11001}, desc="初次刷新必出"},
	["discount"] = {key="discount", val=900, desc="情报折扣"}
}
Config.ShippingData.data_const_fun = function(key)
	local data=Config.ShippingData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ShippingData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------order_start-------------------
Config.ShippingData.data_order_length = 86
Config.ShippingData.data_order = {
	[10001] = {id=10001, name="援助岛民", quality=0, limit_num=2, need_time=7200, award={{29903,20}}, condition={101,200}, expend={{7,2000}}},
	[10002] = {id=10002, name="邻岛交易", quality=0, limit_num=2, need_time=7200, award={{10401,2}}, condition={101,201}, expend={{7,2000}}},
	[10003] = {id=10003, name="渔民的感恩", quality=0, limit_num=2, need_time=7200, award={{3,15}}, condition={101,202}, expend={{7,2000}}},
	[10004] = {id=10004, name="狂欢水手节", quality=0, limit_num=2, need_time=7200, award={{10103,1}}, condition={101,200}, expend={{7,2000}}},
	[10005] = {id=10005, name="秘宝商人", quality=0, limit_num=2, need_time=7200, award={{37001,1}}, condition={101,200}, expend={{7,2000}}},
	[10101] = {id=10101, name="贵族的委托", quality=1, limit_num=2, need_time=14400, award={{3,30}}, condition={102,200}, expend={{7,2000}}},
	[10102] = {id=10102, name="秘密交易", quality=1, limit_num=2, need_time=14400, award={{29903,40}}, condition={102,201}, expend={{7,2000}}},
	[10103] = {id=10103, name="灾后重建", quality=1, limit_num=2, need_time=14400, award={{10103,2}}, condition={102,202}, expend={{7,2000}}},
	[10104] = {id=10104, name="冒险者的储备", quality=1, limit_num=2, need_time=14400, award={{10401,4}}, condition={102,200}, expend={{7,2000}}},
	[10105] = {id=10105, name="秘宝商人", quality=1, limit_num=2, need_time=14400, award={{37001,2}}, condition={102,200}, expend={{7,2000}}},
	[10201] = {id=10201, name="不明的财产", quality=2, limit_num=3, need_time=21600, award={{29904,10}}, condition={102,200,201}, expend={{7,2000}}},
	[10202] = {id=10202, name="王子地下恋情", quality=2, limit_num=3, need_time=21600, award={{29504,10}}, condition={102,200,202}, expend={{7,2000}}},
	[10203] = {id=10203, name="士兵的遗产", quality=2, limit_num=3, need_time=21600, award={{29404,10}}, condition={102,201,202}, expend={{7,2000}}},
	[10204] = {id=10204, name="祭奠英雄", quality=2, limit_num=3, need_time=21600, award={{10103,4}}, condition={102,200,201}, expend={{7,2000}}},
	[10205] = {id=10205, name="暴雨后的重建", quality=2, limit_num=3, need_time=21600, award={{3,60}}, condition={102,200,202}, expend={{7,2000}}},
	[10206] = {id=10206, name="岛屿建设", quality=2, limit_num=3, need_time=21600, award={{29104,10}}, condition={102,201,202}, expend={{7,2000}}},
	[10207] = {id=10207, name="特别食材护送", quality=2, limit_num=3, need_time=21600, award={{29204,10}}, condition={102,200,201}, expend={{7,2000}}},
	[10208] = {id=10208, name="国王的信件", quality=2, limit_num=3, need_time=21600, award={{29304,10}}, condition={102,200,202}, expend={{7,2000}}},
	[10209] = {id=10209, name="遗迹探索", quality=2, limit_num=3, need_time=21600, award={{10401,6}}, condition={102,201,202}, expend={{7,2000}}},
	[10210] = {id=10210, name="秘宝商人", quality=2, limit_num=3, need_time=21600, award={{37001,3}}, condition={102,201,202}, expend={{7,2000}}},
	[10301] = {id=10301, name="援助岛民", quality=3, limit_num=3, need_time=28800, award={{29904,30}}, condition={103,200,201}, expend={{7,2000}}},
	[10302] = {id=10302, name="邻岛交易", quality=3, limit_num=3, need_time=28800, award={{29504,30}}, condition={103,200,202}, expend={{7,2000}}},
	[10303] = {id=10303, name="渔民的感恩", quality=3, limit_num=3, need_time=28800, award={{29404,30}}, condition={103,201,202}, expend={{7,2000}}},
	[10304] = {id=10304, name="狂欢水手节", quality=3, limit_num=3, need_time=28800, award={{29104,30}}, condition={103,201,204}, expend={{7,2000}}},
	[10305] = {id=10305, name="护送古董", quality=3, limit_num=3, need_time=28800, award={{29204,30}}, condition={103,200,202}, expend={{7,2000}}},
	[10306] = {id=10306, name="贵族的委托", quality=3, limit_num=3, need_time=28800, award={{29304,30}}, condition={103,202,203}, expend={{7,2000}}},
	[10307] = {id=10307, name="秘密交易", quality=3, limit_num=3, need_time=28800, award={{10103,10}}, condition={103,200,201}, expend={{7,2000}}},
	[10308] = {id=10308, name="灾后重建", quality=3, limit_num=3, need_time=28800, award={{10403,1}}, condition={103,200,203}, expend={{7,2000}}},
	[10309] = {id=10309, name="冒险者的储备", quality=3, limit_num=3, need_time=28800, award={{10452,1}}, condition={103,201,202}, expend={{7,2000}}},
	[10310] = {id=10310, name="建国日", quality=3, limit_num=3, need_time=28800, award={{3,120}}, condition={103,200,201}, expend={{7,2000}}},
	[10311] = {id=10311, name="不明的财产", quality=3, limit_num=3, need_time=28800, award={{29905,10}}, condition={103,200,203}, expend={{7,2000}}},
	[10312] = {id=10312, name="王子地下恋情", quality=3, limit_num=3, need_time=28800, award={{29505,10}}, condition={103,201,204}, expend={{7,2000}}},
	[10313] = {id=10313, name="士兵的遗产", quality=3, limit_num=3, need_time=28800, award={{29405,10}}, condition={103,201,202}, expend={{7,2000}}},
	[10314] = {id=10314, name="祭奠英雄", quality=3, limit_num=3, need_time=28800, award={{29105,10}}, condition={103,200,201}, expend={{7,2000}}},
	[10315] = {id=10315, name="暴雨后的重建", quality=3, limit_num=3, need_time=28800, award={{29205,10}}, condition={103,201,204}, expend={{7,2000}}},
	[10316] = {id=10316, name="岛屿建设", quality=3, limit_num=3, need_time=28800, award={{29305,10}}, condition={103,202,203}, expend={{7,2000}}},
	[10317] = {id=10317, name="秘宝商人", quality=3, limit_num=3, need_time=28800, award={{37001,5}}, condition={103,202,203}, expend={{7,2000}}},
	[10318] = {id=10318, name="秘宝商人", quality=3, limit_num=3, need_time=28800, award={{37001,8}}, condition={103,202,203}, expend={{7,2000}}},
	[10319] = {id=10319, name="秘宝商人", quality=3, limit_num=3, need_time=28800, award={{37001,10}}, condition={103,202,203}, expend={{7,2000}}},
	[10401] = {id=10401, name="国王的信件", quality=4, limit_num=4, need_time=43200, award={{14001,1}}, condition={104,200,202,204}, expend={{7,2000}}},
	[10402] = {id=10402, name="遗迹探索", quality=4, limit_num=4, need_time=43200, award={{29905,20}}, condition={104,200,203,204}, expend={{7,2000}}},
	[10403] = {id=10403, name="孤岛搜救", quality=4, limit_num=4, need_time=43200, award={{29505,20}}, condition={104,201,202,203}, expend={{7,2000}}},
	[10404] = {id=10404, name="援助岛民", quality=4, limit_num=4, need_time=43200, award={{29405,20}}, condition={104,201,202,204}, expend={{7,2000}}},
	[10405] = {id=10405, name="邻岛交易", quality=4, limit_num=4, need_time=43200, award={{29105,20}}, condition={104,201,203,204}, expend={{7,2000}}},
	[10406] = {id=10406, name="渔民的感恩", quality=4, limit_num=4, need_time=43200, award={{29205,20}}, condition={104,202,203,204}, expend={{7,2000}}},
	[10407] = {id=10407, name="狂欢水手节", quality=4, limit_num=4, need_time=43200, award={{29305,20}}, condition={104,200,203,204}, expend={{7,2000}}},
	[10408] = {id=10408, name="护送古董", quality=4, limit_num=4, need_time=43200, award={{3,300}}, condition={104,201,202,203}, expend={{7,2000}}},
	[10409] = {id=10409, name="贵族的委托", quality=4, limit_num=4, need_time=43200, award={{10403,2}}, condition={104,201,202,204}, expend={{7,2000}}},
	[10410] = {id=10410, name="秘密交易", quality=4, limit_num=4, need_time=43200, award={{10453,1}}, condition={104,200,202,204}, expend={{7,2000}}},
	[10411] = {id=10411, name="灾后重建", quality=4, limit_num=4, need_time=43200, award={{14002,100}}, condition={104,200,203,204}, expend={{7,2000}}},
	[10412] = {id=10412, name="秘宝商人", quality=4, limit_num=4, need_time=43200, award={{37002,1}}, condition={104,200,203,204}, expend={{7,2000}}},
	[10501] = {id=10501, name="建国日", quality=5, limit_num=4, need_time=57600, award={{3,600}}, condition={105,200,201,202}, expend={{7,2000}}},
	[10502] = {id=10502, name="不明的财产", quality=5, limit_num=4, need_time=57600, award={{10403,5}}, condition={105,200,201,203}, expend={{7,2000}}},
	[10503] = {id=10503, name="王子地下恋情", quality=5, limit_num=4, need_time=57600, award={{14001,2}}, condition={105,200,201,204}, expend={{7,2000}}},
	[10504] = {id=10504, name="士兵的遗产", quality=5, limit_num=4, need_time=57600, award={{29905,40}}, condition={105,200,202,203}, expend={{7,2000}}},
	[10505] = {id=10505, name="祭奠英雄", quality=5, limit_num=4, need_time=57600, award={{29505,40}}, condition={105,200,202,204}, expend={{7,2000}}},
	[10506] = {id=10506, name="暴雨后的重建", quality=5, limit_num=4, need_time=57600, award={{29405,40}}, condition={105,200,203,204}, expend={{7,2000}}},
	[10507] = {id=10507, name="岛屿建设", quality=5, limit_num=4, need_time=57600, award={{29105,40}}, condition={105,201,202,203}, expend={{7,2000}}},
	[10508] = {id=10508, name="特别食材护送", quality=5, limit_num=4, need_time=57600, award={{29205,40}}, condition={105,201,202,204}, expend={{7,2000}}},
	[10509] = {id=10509, name="国王的信件", quality=5, limit_num=4, need_time=57600, award={{29305,40}}, condition={105,201,203,204}, expend={{7,2000}}},
	[10510] = {id=10510, name="遗迹探索", quality=5, limit_num=4, need_time=57600, award={{10453,2}}, condition={105,202,203,204}, expend={{7,2000}}},
	[10511] = {id=10511, name="孤岛搜救", quality=5, limit_num=4, need_time=57600, award={{14002,200}}, condition={105,202,203,204}, expend={{7,2000}}},
	[10512] = {id=10512, name="秘宝商人", quality=5, limit_num=4, need_time=57600, award={{37002,2}}, condition={105,202,203,204}, expend={{7,2000}}},
	[10601] = {id=10601, name="邻岛交易", quality=0, limit_num=2, need_time=7200, award={{29903,20}}, condition={101,200}, expend={{7,2000}}},
	[10602] = {id=10602, name="渔民的感恩", quality=0, limit_num=2, need_time=7200, award={{10401,2}}, condition={101,201}, expend={{7,2000}}},
	[10603] = {id=10603, name="狂欢水手节", quality=0, limit_num=2, need_time=7200, award={{3,10}}, condition={101,202}, expend={{7,2000}}},
	[10604] = {id=10604, name="护送古董", quality=0, limit_num=2, need_time=7200, award={{10103,1}}, condition={101,203}, expend={{7,2000}}},
	[10701] = {id=10701, name="秘密交易", quality=1, limit_num=2, need_time=14400, award={{3,20}}, condition={102,201}, expend={{7,2000}}},
	[10702] = {id=10702, name="灾后重建", quality=1, limit_num=2, need_time=14400, award={{29903,40}}, condition={102,202}, expend={{7,2000}}},
	[10703] = {id=10703, name="冒险者的储备", quality=1, limit_num=2, need_time=14400, award={{10103,2}}, condition={102,203}, expend={{7,2000}}},
	[10704] = {id=10704, name="建国日", quality=1, limit_num=2, need_time=14400, award={{10401,4}}, condition={102,200}, expend={{7,2000}}},
	[10801] = {id=10801, name="王子地下恋情", quality=2, limit_num=3, need_time=21600, award={{29904,10}}, condition={102,200,201}, expend={{7,2000}}},
	[10802] = {id=10802, name="士兵的遗产", quality=2, limit_num=3, need_time=21600, award={{29504,10}}, condition={102,200,202}, expend={{7,2000}}},
	[10803] = {id=10803, name="祭奠英雄", quality=2, limit_num=3, need_time=21600, award={{29404,10}}, condition={102,201,202}, expend={{7,2000}}},
	[10804] = {id=10804, name="暴雨后的重建", quality=2, limit_num=3, need_time=21600, award={{10103,4}}, condition={102,200,201}, expend={{7,2000}}},
	[10805] = {id=10805, name="岛屿建设", quality=2, limit_num=3, need_time=21600, award={{3,40}}, condition={102,200,202}, expend={{7,2000}}},
	[10806] = {id=10806, name="特别食材护送", quality=2, limit_num=3, need_time=21600, award={{29104,10}}, condition={102,201,202}, expend={{7,2000}}},
	[10807] = {id=10807, name="国王的信件", quality=2, limit_num=3, need_time=21600, award={{29204,10}}, condition={102,200,201}, expend={{7,2000}}},
	[10808] = {id=10808, name="遗迹探索", quality=2, limit_num=3, need_time=21600, award={{29304,10}}, condition={102,200,202}, expend={{7,2000}}},
	[10809] = {id=10809, name="孤岛搜救", quality=2, limit_num=3, need_time=21600, award={{10401,6}}, condition={102,201,202}, expend={{7,2000}}},
	[10901] = {id=10901, name="邻岛交易", quality=3, limit_num=3, need_time=28800, award={{10403,1}}, condition={103,200,203}, expend={{7,2000}}},
	[10902] = {id=10902, name="渔民的感恩", quality=3, limit_num=3, need_time=28800, award={{10403,1}}, condition={103,201,203}, expend={{7,2000}}},
	[10903] = {id=10903, name="狂欢水手节", quality=3, limit_num=3, need_time=28800, award={{10403,1}}, condition={103,201,203}, expend={{7,2000}}},
	[10904] = {id=10904, name="护送古董", quality=3, limit_num=3, need_time=28800, award={{10403,1}}, condition={103,202,203}, expend={{7,2000}}},
	[10905] = {id=10905, name="邻岛交易", quality=3, limit_num=3, need_time=28800, award={{10403,1}}, condition={103,202,200}, expend={{7,2000}}},
	[11001] = {id=11001, name="建国日", quality=3, limit_num=3, need_time=28800, award={{3,120}}, condition={103,200,201}, expend={{7,2000}}}
}
Config.ShippingData.data_order_fun = function(key)
	local data=Config.ShippingData.data_order[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ShippingData.data_order['..key..'])not found') return
	end
	return data
end
-- -------------------order_end---------------------


-- -------------------condition_start-------------------
Config.ShippingData.data_condition_length = 15
Config.ShippingData.data_condition = {
	[100] = {id=100, conition={{'partner_star',1,1}}, desc="存在1个1星或以上的伙伴"},
	[101] = {id=101, conition={{'partner_star',2,1}}, desc="存在1个2星或以上的伙伴"},
	[102] = {id=102, conition={{'partner_star',3,1}}, desc="存在1个3星或以上的伙伴"},
	[103] = {id=103, conition={{'partner_star',4,1}}, desc="存在1个4星或以上的伙伴"},
	[104] = {id=104, conition={{'partner_star',5,1}}, desc="存在1个5星或以上的伙伴"},
	[105] = {id=105, conition={{'partner_star',6,1}}, desc="存在1个6星或以上的伙伴"},
	[106] = {id=106, conition={{'partner_star',7,1}}, desc="存在1个7星或以上的伙伴"},
	[107] = {id=107, conition={{'partner_star',8,1}}, desc="存在1个8星或以上的伙伴"},
	[108] = {id=108, conition={{'partner_star',9,1}}, desc="存在1个9星或以上的伙伴"},
	[109] = {id=109, conition={{'partner_star',10,1}}, desc="存在1个10星或以上的伙伴"},
	[200] = {id=200, conition={{'partner_camp_type',1,1}}, desc="存在1个水阵营的伙伴"},
	[201] = {id=201, conition={{'partner_camp_type',2,1}}, desc="存在1个火阵营的伙伴"},
	[202] = {id=202, conition={{'partner_camp_type',3,1}}, desc="存在1个风阵营的伙伴"},
	[203] = {id=203, conition={{'partner_camp_type',4,1}}, desc="存在1个光阵营的伙伴"},
	[204] = {id=204, conition={{'partner_camp_type',5,1}}, desc="存在1个暗阵营的伙伴"}
}
Config.ShippingData.data_condition_fun = function(key)
	local data=Config.ShippingData.data_condition[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ShippingData.data_condition['..key..'])not found') return
	end
	return data
end
-- -------------------condition_end---------------------


-- -------------------quick_cost_start-------------------
Config.ShippingData.data_quick_cost_length = 6
Config.ShippingData.data_quick_cost = {
	[0] = {min=0, max=3600, gold=0},
	[3601] = {min=3601, max=7200, gold=20},
	[7201] = {min=7201, max=14400, gold=30},
	[14401] = {min=14401, max=21600, gold=40},
	[21601] = {min=21601, max=28800, gold=50},
	[28801] = {min=28801, max=999999, gold=60}
}
Config.ShippingData.data_quick_cost_fun = function(key)
	local data=Config.ShippingData.data_quick_cost[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ShippingData.data_quick_cost['..key..'])not found') return
	end
	return data
end
-- -------------------quick_cost_end---------------------


-- -------------------refresh_start-------------------
Config.ShippingData.data_refresh_length = 16
Config.ShippingData.data_refresh = {
	[0] = {vip_lev=0, all_times=9999, expend={{3,30}}, free_times=2},
	[1] = {vip_lev=1, all_times=9999, expend={{3,30}}, free_times=2},
	[2] = {vip_lev=2, all_times=9999, expend={{3,30}}, free_times=2},
	[3] = {vip_lev=3, all_times=9999, expend={{3,30}}, free_times=2},
	[4] = {vip_lev=4, all_times=9999, expend={{3,30}}, free_times=2},
	[5] = {vip_lev=5, all_times=9999, expend={{3,30}}, free_times=2},
	[6] = {vip_lev=6, all_times=9999, expend={{3,30}}, free_times=2},
	[7] = {vip_lev=7, all_times=9999, expend={{3,30}}, free_times=2},
	[8] = {vip_lev=8, all_times=9999, expend={{3,30}}, free_times=2},
	[9] = {vip_lev=9, all_times=9999, expend={{3,30}}, free_times=2},
	[10] = {vip_lev=10, all_times=9999, expend={{3,30}}, free_times=2},
	[11] = {vip_lev=11, all_times=9999, expend={{3,30}}, free_times=2},
	[12] = {vip_lev=12, all_times=9999, expend={{3,30}}, free_times=2},
	[13] = {vip_lev=13, all_times=9999, expend={{3,30}}, free_times=2},
	[14] = {vip_lev=14, all_times=9999, expend={{3,30}}, free_times=2},
	[15] = {vip_lev=15, all_times=9999, expend={{3,30}}, free_times=2}
}
Config.ShippingData.data_refresh_fun = function(key)
	local data=Config.ShippingData.data_refresh[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ShippingData.data_refresh['..key..'])not found') return
	end
	return data
end
-- -------------------refresh_end---------------------


-- -------------------explain_start-------------------
Config.ShippingData.data_explain_length = 3
Config.ShippingData.data_explain = {
	[1] = {id=1, desc="1、通过刷新可刷出高品质的远航订单，订单品质越高奖励越丰富\n2、每天有<div fontcolor=289b14>2</div>次免费刷新机会，也可消耗刷新券或蓝钻进行刷新\n3.在派遣界面中，下方最左边的图标表示英雄需要满足的<div fontcolor=289b14>星级</div>条件，其余为英雄需要满足的阵营条件\n4、当英雄满足指定派遣条件后，可消耗一定的远航情报接取对应订单\n5、每次接取订单后需进行一段时间，期间已派遣的英雄无法执行其他任务\n6、【已拥有情报值】与【累计可领取的远航情报值】<div fontcolor=289b14>之和</div>达到当前上限后，离线挂机将不再获得情报值，请及时使用哦"},
	[2] = {id=2, desc="<div fontcolor=289b14>【远航高级特权】\n</div><div fontcolor=#FFEED1>每天首次钻石、刷新券刷新必出紫色任务</div>"},
	[3] = {id=3, desc="<div fontcolor=289b14>【远航豪华特权】\n</div><div fontcolor=#FFEED1>每天第3次钻石、刷新券刷新必出橙色任务</div>"}
}
Config.ShippingData.data_explain_fun = function(key)
	local data=Config.ShippingData.data_explain[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ShippingData.data_explain['..key..'])not found') return
	end
	return data
end
-- -------------------explain_end---------------------

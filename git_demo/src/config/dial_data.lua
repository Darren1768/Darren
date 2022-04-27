----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--dial_data.xml
--------------------------------------

Config = Config or {} 
Config.DialData = Config.DialData or {}

-- -------------------const_start-------------------
Config.DialData.data_const_length = 11
Config.DialData.data_const = {
	["vip_start"] = {val=2, desc="VIP等级开启"},
	["treasure_num"] = {val={{1,15},{1,10}}, desc="探宝次数(幸运、高级)"},
	["refreash"] = {val={{3,30}}, desc="刷新消耗"},
	["changliang"] = {val=1, desc="奖励库版本"},
	["checkmore1"] = {val={{1,29,{{1,1.80},{22,0.11},{10450,0.11},{10401,0.14},{14002,0.14},{29104,0.30},{29204,0.14},{29304,0.06},{29404,28.50},{29504,9},{29903,0.47},{29904,0.47},{29905,6},{40105,2.25},{40108,2.25},{40205,0.44},{40206,2.25},{40207,5.40},{40305,0.69},{40307,0.69},{40405,0.69},{40407,0.45},{40408,9.66},{72001,28}}},{30,49,{{1,28.50},{22,28},{10450,9},{10401,5.40},{14002,3.30},{29104,2.20},{29204,4.60},{29304,0.11},{29404,0.11},{29504,0.11},{29903,0.20},{29904,0.20},{29905,0.92},{40105,0.06},{40108,2.25},{40205,1.89},{40206,0.51},{40207,2.25},{40305,1.89},{40307,0.73},{40405,0.73},{40407,1.02},{40408,6}}},{50,999,{{1,28.50},{22,28},{10450,9},{10401,5.40},{14002,1.98},{29104,3.52},{29204,4.60},{29304,0.03},{29404,0.03},{29504,0.03},{29903,0.18},{29904,0.18},{29905,1.41},{40105,0.04},{40108,2.02},{40205,0.73},{40206,0.06},{40207,2.02},{40305,0.73},{40307,2.02},{40405,0.73},{40407,2.02},{40408,0.73},{72001,6}}}}, desc=""},
	["checkmore2"] = {val={{1,49,{{1,28},{10452,28.50},{14001,15},{24902,0.11},{25901,0.11},{26905,0.11},{28903,0.10},{29404,2.34},{29405,0.12},{29504,2.34},{29505,0.12},{29904,3.96},{29905,0.69},{40110,0.72},{40111,0.12},{40112,1.10},{40210,0.72},{40212,1.32},{40213,0.66},{40310,0.72},{40312,1.10},{40410,0.72},{40412,1.32},{72002,7.75},{72003,2.25}}},{50,999,{{1,28},{10452,28.50},{14001,15},{24902,0.21},{25901,0.45},{26905,0.21},{28903,0.21},{29404,0.04},{29405,0.45},{29504,0.04},{29505,3.60},{29904,0.15},{29905,3.60},{40110,0.15},{40111,0.90},{40112,0.72},{40210,0.12},{40212,1.49},{40213,0.72},{40310,1.49},{40312,0.52},{40410,0.72},{40412,0.52},{72002,0.72},{72003,1.49},{72004,7.75},{72005,2.25}}}}, desc=""},
	["game_rule1"] = {val=1, desc="一、玩法说明\n 1.每探宝1次均可从中随机获取1种宝物；\n2.每天0点会重置转盘奖励；\n3.每次探宝均有机会获得：强力装备、五星强力英雄、随机四星英雄等；\n4.每次探宝都能获得10点幸运值，达到1000幸运值可得幸运大礼包；\n5.每次幸运探宝都将获得探宝积分，探宝积分可以在探宝商城兑换商品；\n6.探宝商店每天0点自动更新。"},
	["game_rule2"] = {val=2, desc="一、玩法说明\n 1.每探宝1次均可从中随机获取1种宝物；\n2.每天0点会重置转盘奖励；\n3.每次探宝均有机会获得：强力装备、五星强力英雄、随机四星英雄等；\n4.每次探宝都能获得10点幸运值，达到1000幸运值可得幸运大礼包；\n5.每次幸运探宝都将获得探宝积分，探宝积分可以在探宝商城兑换商品；\n6.探宝商店每天0点自动更新。"},
	["num_1"] = {val=8, desc="幸运探宝道具数量"},
	["num_2"] = {val=8, desc="高级探宝道具数量"},
	["free_time"] = {val=10800, desc="免费刷新等待时间"}
}
Config.DialData.data_const_fun = function(key)
	local data=Config.DialData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.DialData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------rewards_start-------------------
Config.DialData.data_rewards_length = 0
Config.DialData.data_rewards = {

}
Config.DialData.data_rewards_fun = function(key)
	local data=Config.DialData.data_rewards[key]
	if DATA_DEBUG and data == nil then
		print('(Config.DialData.data_rewards['..key..'])not found') return
	end
	return data
end
-- -------------------rewards_end---------------------


-- -------------------get_limit_open_start-------------------
Config.DialData.data_get_limit_open_length = 4
Config.DialData.data_get_limit_open = {
{type=1, type2=1, limit_open={{'lev',10}}, expend_item={{37001,1}}, expend_gold={}, add_item={{18,10}}, add_lucky=10, rand_id=2, count=1},
{type=1, type2=2, limit_open={{'lev',10},{'vip_lev',2}}, expend_item={{37001,12}}, expend_gold={}, add_item={{18,150}}, add_lucky=150, rand_id=2, count=15},
{type=2, type2=1, limit_open={{'lev',30}}, expend_item={{37002,1}}, expend_gold={}, add_item={{18,10}}, add_lucky=10, rand_id=4, count=1},
{type=2, type2=2, limit_open={{'lev',30}}, expend_item={{37002,10}}, expend_gold={}, add_item={{18,100}}, add_lucky=100, rand_id=4, count=10}
}
-- -------------------get_limit_open_end---------------------


-- -------------------get_lucky_award_start-------------------
Config.DialData.data_get_lucky_award_length = 10
Config.DialData.data_get_lucky_award = {
{type=1, id=1, lucky_val=100, award={{10103,2}}},
{type=1, id=2, lucky_val=300, award={{10002,3}}},
{type=1, id=3, lucky_val=500, award={{10403,1}}},
{type=1, id=4, lucky_val=700, award={{37002,1}}},
{type=1, id=5, lucky_val=1000, award={{38041,1}}},
{type=2, id=6, lucky_val=100, award={{37001,10}}},
{type=2, id=7, lucky_val=300, award={{14001,1}}},
{type=2, id=8, lucky_val=500, award={{14001,2}}},
{type=2, id=9, lucky_val=700, award={{14001,3}}},
{type=2, id=10, lucky_val=1000, award={{38042,1}}}
}
-- -------------------get_lucky_award_end---------------------


-- -------------------get_rand_list_start-------------------
Config.DialData.data_get_rand_list_length = 210
Config.DialData.data_get_rand_list = {
	[101] = {{type=1, pos=1, id=101, name="4星随机碎片", item_id=29904, item_num=30}},
	[102] = {{type=1, pos=1, id=102, name="4星光明碎片", item_id=29404, item_num=30}},
	[103] = {{type=1, pos=1, id=103, name="4星黑暗碎片", item_id=29504, item_num=30}},
	[104] = {{type=1, pos=1, id=104, name="4星水系碎片", item_id=29104, item_num=30}},
	[105] = {{type=1, pos=1, id=105, name="4星火系碎片", item_id=29204, item_num=30}},
	[106] = {{type=1, pos=1, id=106, name="4星自然碎片", item_id=29304, item_num=30}},
	[107] = {{type=1, pos=1, id=107, name="5星随机碎片", item_id=29905, item_num=25}},
	[108] = {{type=1, pos=2, id=108, name="先知精华", item_id=14002, item_num=5}},
	[109] = {{type=1, pos=2, id=109, name="先知精华", item_id=14002, item_num=5}},
	[110] = {{type=1, pos=2, id=110, name="普通召唤卷", item_id=10401, item_num=2}},
	[111] = {{type=1, pos=2, id=111, name="普通召唤卷", item_id=10401, item_num=2}},
	[112] = {{type=1, pos=2, id=112, name="普通召唤卷", item_id=10401, item_num=2}},
	[113] = {{type=1, pos=3, id=113, name="先知精华", item_id=14002, item_num=10}},
	[114] = {{type=1, pos=3, id=114, name="先知精华", item_id=14002, item_num=10}},
	[115] = {{type=1, pos=3, id=115, name="先知精华", item_id=14002, item_num=10}},
	[116] = {{type=1, pos=3, id=116, name="先知精华", item_id=14002, item_num=10}},
	[117] = {{type=1, pos=3, id=117, name="冒险头盔", item_id=40305, item_num=1}},
	[118] = {{type=1, pos=4, id=118, name="金币", item_id=1, item_num=40000}},
	[119] = {{type=1, pos=4, id=119, name="金币", item_id=1, item_num=40000}},
	[120] = {{type=1, pos=4, id=120, name="金币", item_id=1, item_num=50000}},
	[121] = {{type=1, pos=4, id=121, name="金币", item_id=1, item_num=60000}},
	[122] = {{type=1, pos=4, id=122, name="金币", item_id=1, item_num=80000}},
	[123] = {{type=1, pos=5, id=123, name="荣耀戒指", item_id=40407, item_num=1}},
	[124] = {{type=1, pos=5, id=124, name="荣耀头盔", item_id=40307, item_num=1}},
	[125] = {{type=1, pos=5, id=125, name="荣耀护甲", item_id=40207, item_num=1}},
	[126] = {{type=1, pos=5, id=126, name="雷霆戒指", item_id=40408, item_num=1}},
	[127] = {{type=1, pos=5, id=127, name="雷霆战刃", item_id=40108, item_num=1}},
	[128] = {{type=1, pos=6, id=128, name="英雄经验", item_id=22, item_num=10000}},
	[129] = {{type=1, pos=6, id=129, name="英雄经验", item_id=22, item_num=10000}},
	[130] = {{type=1, pos=6, id=130, name="英雄经验", item_id=22, item_num=12500}},
	[131] = {{type=1, pos=6, id=131, name="英雄经验", item_id=22, item_num=15000}},
	[132] = {{type=1, pos=6, id=132, name="英雄经验", item_id=22, item_num=20000}},
	[133] = {{type=1, pos=7, id=133, name="3星随机碎片", item_id=29903, item_num=20}},
	[134] = {{type=1, pos=7, id=134, name="冒险戒指", item_id=40405, item_num=1}},
	[135] = {{type=1, pos=7, id=135, name="冒险之刃", item_id=40105, item_num=1}},
	[136] = {{type=1, pos=7, id=136, name="胜利护甲", item_id=40206, item_num=1}},
	[137] = {{type=1, pos=7, id=137, name="冒险护甲", item_id=40205, item_num=1}},
	[138] = {{type=1, pos=8, id=138, name="炼神石", item_id=72001, item_num=2}},
	[139] = {{type=1, pos=8, id=139, name="炼神石", item_id=72001, item_num=2}},
	[140] = {{type=1, pos=8, id=140, name="符文精华", item_id=10450, item_num=25}},
	[141] = {{type=1, pos=8, id=141, name="符文精华", item_id=10450, item_num=25}},
	[142] = {{type=1, pos=8, id=142, name="符文精华", item_id=10450, item_num=25}},
	[143] = {{type=1, pos=1, id=143, name="4星随机碎片", item_id=29904, item_num=30}},
	[144] = {{type=1, pos=1, id=144, name="4星光明碎片", item_id=29404, item_num=30}},
	[145] = {{type=1, pos=1, id=145, name="4星黑暗碎片", item_id=29504, item_num=30}},
	[146] = {{type=1, pos=1, id=146, name="4星水系碎片", item_id=29104, item_num=30}},
	[147] = {{type=1, pos=1, id=147, name="4星火系碎片", item_id=29204, item_num=30}},
	[148] = {{type=1, pos=1, id=148, name="4星自然碎片", item_id=29304, item_num=30}},
	[149] = {{type=1, pos=1, id=149, name="5星随机碎片", item_id=29905, item_num=25}},
	[150] = {{type=1, pos=2, id=150, name="先知精华", item_id=14002, item_num=5}},
	[151] = {{type=1, pos=2, id=151, name="先知精华", item_id=14002, item_num=5}},
	[152] = {{type=1, pos=2, id=152, name="普通召唤卷", item_id=10401, item_num=2}},
	[153] = {{type=1, pos=2, id=153, name="普通召唤卷", item_id=10401, item_num=2}},
	[154] = {{type=1, pos=2, id=154, name="普通召唤卷", item_id=10401, item_num=2}},
	[155] = {{type=1, pos=3, id=155, name="星辰符文", item_id=10451, item_num=1}},
	[156] = {{type=1, pos=3, id=156, name="星辰符文", item_id=10451, item_num=1}},
	[157] = {{type=1, pos=3, id=157, name="符文精华", item_id=10450, item_num=100}},
	[158] = {{type=1, pos=3, id=158, name="符文精华", item_id=10450, item_num=100}},
	[159] = {{type=1, pos=3, id=159, name="符文精华", item_id=10450, item_num=100}},
	[160] = {{type=1, pos=4, id=160, name="金币", item_id=1, item_num=40000}},
	[161] = {{type=1, pos=4, id=161, name="金币", item_id=1, item_num=50000}},
	[162] = {{type=1, pos=4, id=162, name="金币", item_id=1, item_num=60000}},
	[163] = {{type=1, pos=4, id=163, name="金币", item_id=1, item_num=80000}},
	[164] = {{type=1, pos=4, id=164, name="金币", item_id=1, item_num=100000}},
	[165] = {{type=1, pos=5, id=165, name="荣耀戒指", item_id=40407, item_num=1}},
	[166] = {{type=1, pos=5, id=166, name="荣耀头盔", item_id=40307, item_num=1}},
	[167] = {{type=1, pos=5, id=167, name="雷霆戒指", item_id=40408, item_num=1}},
	[168] = {{type=1, pos=5, id=168, name="雷霆护甲", item_id=40408, item_num=1}},
	[169] = {{type=1, pos=5, id=169, name="雷霆战刃", item_id=40108, item_num=1}},
	[170] = {{type=1, pos=6, id=170, name="英雄经验", item_id=22, item_num=20000}},
	[171] = {{type=1, pos=6, id=171, name="英雄经验", item_id=22, item_num=25000}},
	[172] = {{type=1, pos=6, id=172, name="英雄经验", item_id=22, item_num=30000}},
	[173] = {{type=1, pos=6, id=173, name="英雄经验", item_id=22, item_num=35000}},
	[174] = {{type=1, pos=6, id=174, name="英雄经验", item_id=22, item_num=40000}},
	[175] = {{type=1, pos=7, id=175, name="4星随机碎片", item_id=29904, item_num=30}},
	[176] = {{type=1, pos=7, id=176, name="胜利战刃", item_id=40106, item_num=1}},
	[177] = {{type=1, pos=7, id=177, name="冒险之刃", item_id=40105, item_num=1}},
	[178] = {{type=1, pos=7, id=178, name="冒险护甲", item_id=40205, item_num=1}},
	[179] = {{type=1, pos=7, id=179, name="胜利护甲", item_id=40206, item_num=1}},
	[180] = {{type=1, pos=8, id=180, name="炼神石", item_id=72001, item_num=2}},
	[181] = {{type=1, pos=8, id=181, name="炼神石", item_id=72001, item_num=2}},
	[182] = {{type=1, pos=8, id=182, name="符文精华", item_id=10450, item_num=25}},
	[183] = {{type=1, pos=8, id=183, name="符文精华", item_id=10450, item_num=25}},
	[184] = {{type=1, pos=8, id=184, name="符文精华", item_id=10450, item_num=25}},
	[185] = {{type=1, pos=1, id=185, name="4星随机碎片", item_id=29904, item_num=30}},
	[186] = {{type=1, pos=1, id=186, name="4星光明碎片", item_id=29404, item_num=30}},
	[187] = {{type=1, pos=1, id=187, name="4星黑暗碎片", item_id=29504, item_num=30}},
	[188] = {{type=1, pos=1, id=188, name="5星随机碎片", item_id=29905, item_num=50}},
	[189] = {{type=1, pos=1, id=189, name="海宁芙碎片", item_id=24907, item_num=50}},
	[190] = {{type=1, pos=1, id=190, name="剑豪卡赞碎片", item_id=25902, item_num=50}},
	[191] = {{type=1, pos=1, id=191, name="美杜莎碎片", item_id=26904, item_num=50}},
	[192] = {{type=1, pos=2, id=192, name="先知精华", item_id=14002, item_num=5}},
	[193] = {{type=1, pos=2, id=193, name="先知精华", item_id=14002, item_num=5}},
	[194] = {{type=1, pos=2, id=194, name="普通召唤卷", item_id=10401, item_num=2}},
	[195] = {{type=1, pos=2, id=195, name="普通召唤卷", item_id=10401, item_num=2}},
	[196] = {{type=1, pos=2, id=196, name="普通召唤卷", item_id=10401, item_num=2}},
	[197] = {{type=1, pos=3, id=197, name="星辰符文", item_id=10451, item_num=1}},
	[198] = {{type=1, pos=3, id=198, name="星辰符文", item_id=10451, item_num=1}},
	[199] = {{type=1, pos=3, id=199, name="符文精华", item_id=10450, item_num=100}},
	[200] = {{type=1, pos=3, id=200, name="符文精华", item_id=10450, item_num=100}},
	[201] = {{type=1, pos=3, id=201, name="符文精华", item_id=10450, item_num=100}},
	[202] = {{type=1, pos=4, id=202, name="金币", item_id=1, item_num=40000}},
	[203] = {{type=1, pos=4, id=203, name="金币", item_id=1, item_num=50000}},
	[204] = {{type=1, pos=4, id=204, name="金币", item_id=1, item_num=60000}},
	[205] = {{type=1, pos=4, id=205, name="金币", item_id=1, item_num=80000}},
	[206] = {{type=1, pos=4, id=206, name="金币", item_id=1, item_num=100000}},
	[207] = {{type=1, pos=5, id=207, name="雷霆戒指", item_id=40408, item_num=1}},
	[208] = {{type=1, pos=5, id=208, name="雷霆头盔", item_id=40308, item_num=1}},
	[209] = {{type=1, pos=5, id=209, name="雷霆战刃", item_id=40108, item_num=1}},
	[210] = {{type=1, pos=5, id=210, name="雷霆护甲", item_id=40208, item_num=1}},
	[211] = {{type=1, pos=5, id=211, name="魔灵战刃", item_id=40109, item_num=1}},
	[212] = {{type=1, pos=6, id=212, name="英雄经验", item_id=22, item_num=20000}},
	[213] = {{type=1, pos=6, id=213, name="英雄经验", item_id=22, item_num=25000}},
	[214] = {{type=1, pos=6, id=214, name="英雄经验", item_id=22, item_num=30000}},
	[215] = {{type=1, pos=6, id=215, name="英雄经验", item_id=22, item_num=40000}},
	[216] = {{type=1, pos=6, id=216, name="英雄经验", item_id=22, item_num=50000}},
	[217] = {{type=1, pos=7, id=217, name="4星随机碎片", item_id=29904, item_num=30}},
	[218] = {{type=1, pos=7, id=218, name="胜利戒指", item_id=40406, item_num=1}},
	[219] = {{type=1, pos=7, id=219, name="胜利战刃", item_id=40106, item_num=1}},
	[220] = {{type=1, pos=7, id=220, name="胜利护甲", item_id=40206, item_num=1}},
	[221] = {{type=1, pos=7, id=221, name="胜利头盔", item_id=40306, item_num=1}},
	[222] = {{type=1, pos=8, id=222, name="炼神石", item_id=72001, item_num=2}},
	[223] = {{type=1, pos=8, id=223, name="炼神石", item_id=72001, item_num=2}},
	[224] = {{type=1, pos=8, id=224, name="符文精华", item_id=10450, item_num=30}},
	[225] = {{type=1, pos=8, id=225, name="符文精华", item_id=10450, item_num=30}},
	[226] = {{type=1, pos=8, id=226, name="符文精华", item_id=10450, item_num=30}},
	[227] = {{type=2, pos=1, id=227, name="5星随机碎片", item_id=29905, item_num=50}},
	[228] = {{type=2, pos=1, id=228, name="5星光明碎片", item_id=29405, item_num=50}},
	[229] = {{type=2, pos=1, id=229, name="5星黑暗碎片", item_id=29505, item_num=50}},
	[230] = {{type=2, pos=1, id=230, name="冰霜巨龙碎片", item_id=24902, item_num=50}},
	[231] = {{type=2, pos=1, id=231, name="炎魔之王碎片", item_id=25901, item_num=50}},
	[232] = {{type=2, pos=1, id=232, name="雅典娜碎片", item_id=26905, item_num=50}},
	[233] = {{type=2, pos=1, id=233, name="黑暗之主碎片", item_id=28903, item_num=50}},
	[234] = {{type=2, pos=2, id=234, name="刻印石", item_id=72003, item_num=1}},
	[235] = {{type=2, pos=2, id=235, name="刻印石", item_id=72003, item_num=1}},
	[236] = {{type=2, pos=2, id=236, name="神器符石", item_id=72002, item_num=5}},
	[237] = {{type=2, pos=2, id=237, name="神器符石", item_id=72002, item_num=5}},
	[238] = {{type=2, pos=2, id=238, name="神器符石", item_id=72002, item_num=5}},
	[239] = {{type=2, pos=3, id=239, name="祝福护甲", item_id=40212, item_num=1}},
	[240] = {{type=2, pos=3, id=240, name="祝福戒指", item_id=40412, item_num=1}},
	[241] = {{type=2, pos=3, id=241, name="祝福长剑", item_id=40112, item_num=1}},
	[242] = {{type=2, pos=3, id=242, name="祝福头盔", item_id=40312, item_num=1}},
	[243] = {{type=2, pos=3, id=243, name="圣光护甲", item_id=40213, item_num=1}},
	[244] = {{type=2, pos=4, id=244, name="月亮符文", item_id=10452, item_num=1}},
	[245] = {{type=2, pos=4, id=245, name="月亮符文", item_id=10452, item_num=1}},
	[246] = {{type=2, pos=4, id=246, name="月亮符文", item_id=10452, item_num=1}},
	[247] = {{type=2, pos=4, id=247, name="月亮符文", item_id=10452, item_num=1}},
	[248] = {{type=2, pos=4, id=248, name="月亮符文", item_id=10452, item_num=1}},
	[249] = {{type=2, pos=5, id=249, name="光辉巨剑", item_id=40110, item_num=1}},
	[250] = {{type=2, pos=5, id=250, name="光辉头盔", item_id=40310, item_num=1}},
	[251] = {{type=2, pos=5, id=251, name="光辉护甲", item_id=40210, item_num=1}},
	[252] = {{type=2, pos=5, id=252, name="光辉戒指", item_id=40410, item_num=1}},
	[253] = {{type=2, pos=5, id=253, name="希望长剑", item_id=40111, item_num=1}},
	[254] = {{type=2, pos=6, id=254, name="金币", item_id=1, item_num=1000000}},
	[255] = {{type=2, pos=6, id=255, name="金币", item_id=1, item_num=1200000}},
	[256] = {{type=2, pos=6, id=256, name="金币", item_id=1, item_num=1500000}},
	[257] = {{type=2, pos=6, id=257, name="金币", item_id=1, item_num=2000000}},
	[258] = {{type=2, pos=6, id=258, name="金币", item_id=1, item_num=3000000}},
	[259] = {{type=2, pos=7, id=259, name="4星光明碎片", item_id=29404, item_num=30}},
	[260] = {{type=2, pos=7, id=260, name="4星黑暗碎片", item_id=29504, item_num=30}},
	[261] = {{type=2, pos=7, id=261, name="5星随机碎片", item_id=29905, item_num=50}},
	[262] = {{type=2, pos=7, id=262, name="4星随机碎片", item_id=29904, item_num=30}},
	[263] = {{type=2, pos=7, id=263, name="4星随机碎片", item_id=29904, item_num=30}},
	[264] = {{type=2, pos=8, id=264, name="先知水晶", item_id=14001, item_num=1}},
	[265] = {{type=2, pos=8, id=265, name="先知水晶", item_id=14001, item_num=1}},
	[266] = {{type=2, pos=8, id=266, name="先知水晶", item_id=14001, item_num=1}},
	[267] = {{type=2, pos=8, id=267, name="先知水晶", item_id=14001, item_num=1}},
	[268] = {{type=2, pos=8, id=268, name="先知水晶", item_id=14001, item_num=1}},
	[269] = {{type=2, pos=1, id=269, name="神灵大祭司碎片", item_id=27906, item_num=50}},
	[270] = {{type=2, pos=1, id=270, name="5星光明碎片", item_id=29405, item_num=50}},
	[271] = {{type=2, pos=1, id=271, name="5星黑暗碎片", item_id=29505, item_num=50}},
	[272] = {{type=2, pos=1, id=272, name="冰雪女王碎片", item_id=24901, item_num=50}},
	[273] = {{type=2, pos=1, id=273, name="普罗米修斯碎片", item_id=25906, item_num=50}},
	[274] = {{type=2, pos=1, id=274, name="斯芬克斯碎片", item_id=26907, item_num=50}},
	[275] = {{type=2, pos=1, id=275, name="潘多拉碎片", item_id=28906, item_num=50}},
	[276] = {{type=2, pos=2, id=276, name="刻印石", item_id=72003, item_num=1}},
	[277] = {{type=2, pos=2, id=277, name="刻印石", item_id=72003, item_num=1}},
	[278] = {{type=2, pos=2, id=278, name="神器符石", item_id=72002, item_num=5}},
	[279] = {{type=2, pos=2, id=279, name="神器符石", item_id=72002, item_num=5}},
	[280] = {{type=2, pos=2, id=280, name="神器符石", item_id=72002, item_num=5}},
	[281] = {{type=2, pos=3, id=281, name="祝福护甲", item_id=40212, item_num=1}},
	[282] = {{type=2, pos=3, id=282, name="祝福戒指", item_id=40412, item_num=1}},
	[283] = {{type=2, pos=3, id=283, name="祝福长剑", item_id=40112, item_num=1}},
	[284] = {{type=2, pos=3, id=284, name="圣光头盔", item_id=40313, item_num=1}},
	[285] = {{type=2, pos=3, id=285, name="圣光护甲", item_id=40213, item_num=1}},
	[286] = {{type=2, pos=4, id=286, name="月亮符文", item_id=10452, item_num=1}},
	[287] = {{type=2, pos=4, id=287, name="月亮符文", item_id=10452, item_num=1}},
	[288] = {{type=2, pos=4, id=288, name="月亮符文", item_id=10452, item_num=1}},
	[289] = {{type=2, pos=4, id=289, name="月亮符文", item_id=10452, item_num=1}},
	[290] = {{type=2, pos=4, id=290, name="月亮符文", item_id=10452, item_num=1}},
	[291] = {{type=2, pos=5, id=291, name="光辉巨剑", item_id=40110, item_num=1}},
	[292] = {{type=2, pos=5, id=292, name="光辉头盔", item_id=40310, item_num=1}},
	[293] = {{type=2, pos=5, id=293, name="光辉护甲", item_id=40210, item_num=1}},
	[294] = {{type=2, pos=5, id=294, name="光辉戒指", item_id=40410, item_num=1}},
	[295] = {{type=2, pos=5, id=295, name="希望长剑", item_id=40111, item_num=1}},
	[296] = {{type=2, pos=6, id=296, name="金币", item_id=1, item_num=1500000}},
	[297] = {{type=2, pos=6, id=297, name="金币", item_id=1, item_num=1700000}},
	[298] = {{type=2, pos=6, id=298, name="金币", item_id=1, item_num=2000000}},
	[299] = {{type=2, pos=6, id=299, name="金币", item_id=1, item_num=3000000}},
	[300] = {{type=2, pos=6, id=300, name="金币", item_id=1, item_num=4000000}},
	[301] = {{type=2, pos=7, id=301, name="4星光明碎片", item_id=29404, item_num=30}},
	[302] = {{type=2, pos=7, id=302, name="4星黑暗碎片", item_id=29504, item_num=30}},
	[303] = {{type=2, pos=7, id=303, name="5星随机碎片", item_id=29905, item_num=50}},
	[304] = {{type=2, pos=7, id=304, name="路西法碎片", item_id=28905, item_num=50}},
	[305] = {{type=2, pos=7, id=305, name="派西斯碎片", item_id=24905, item_num=50}},
	[306] = {{type=2, pos=8, id=306, name="先知水晶", item_id=14001, item_num=1}},
	[307] = {{type=2, pos=8, id=307, name="先知水晶", item_id=14001, item_num=1}},
	[308] = {{type=2, pos=8, id=308, name="先知水晶", item_id=14001, item_num=1}},
	[309] = {{type=2, pos=8, id=309, name="先知水晶", item_id=14001, item_num=1}},
	[310] = {{type=2, pos=8, id=310, name="先知水晶", item_id=14001, item_num=1}}
}
-- -------------------get_rand_list_end---------------------


-- -------------------magnificat_list_start-------------------
Config.DialData.data_magnificat_list_length = 2
Config.DialData.data_magnificat_list = {
	[1] = {
		[1] = {id=1, round_id=1, min=1, max=29, award={{1,28.50},{22,28},{10103,9},{10401,5.40},{14002,9.66},{29104,0.14},{29204,0.14},{29304,0.14},{29404,0.11},{29504,0.11},{29903,1.80},{29904,0.30},{29905,0.06},{40105,2.25},{40108,0.47},{40205,2.25},{40206,0.45},{40207,0.69},{40305,0.44},{40307,0.69},{40405,2.25},{40407,0.69},{40408,0.47},{72001,6}}},
		[2] = {id=2, round_id=1, min=30, max=49, award={{1,28.50},{22,28},{10103,9},{10401,5.40},{10450,3.30},{10451,2.20},{14002,4.60},{29104,0.11},{29204,0.11},{29304,0.11},{29404,0.20},{29504,0.20},{29904,0.92},{29905,0.06},{40105,2.25},{40106,1.89},{40108,0.51},{40205,2.25},{40206,1.89},{40307,0.73},{40407,0.73},{40408,1.02},{72001,6}}},
		[3] = {id=3, round_id=1, min=50, max=999, award={{1,28.50},{22,28},{10103,9},{10401,5.40},{10450,1.98},{10451,3.52},{14002,4.60},{24907,0.03},{25902,0.03},{26904,0.03},{29404,0.18},{29504,0.18},{29904,1.41},{29905,0.04},{40106,2.02},{40108,0.73},{40109,0.06},{40206,2.02},{40208,0.73},{40306,2.02},{40308,0.73},{40406,2.02},{40408,0.73},{72001,6}}},
	},
	[2] = {
		[1] = {id=1, round_id=2, min=1, max=49, award={{1,28},{10452,28.50},{14001,15},{24902,0.11},{25901,0.11},{26905,0.11},{28903,0.10},{29404,2.34},{29405,0.12},{29504,2.34},{29505,0.12},{29904,3.96},{29905,0.69},{40110,0.72},{40111,0.12},{40112,1.10},{40210,0.72},{40212,1.32},{40213,0.66},{40310,0.72},{40312,1.10},{40410,0.72},{40412,1.32},{72002,7.75},{72003,2.25}}},
		[2] = {id=2, round_id=2, min=50, max=999, award={{1,28},{10452,28.50},{14001,15},{24901,0.21},{24905,0.45},{25906,0.21},{26907,0.21},{27906,0.04},{28905,0.45},{28906,0.04},{29404,3.60},{29405,0.15},{29504,3.60},{29505,0.15},{29905,0.90},{40110,0.72},{40111,0.12},{40112,1.49},{40210,0.72},{40212,1.49},{40213,0.52},{40310,0.72},{40313,0.52},{40410,0.72},{40412,1.49},{72002,7.75},{72003,2.25}}},
	},
}
-- -------------------magnificat_list_end---------------------

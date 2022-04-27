----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--dungeon_stone_data.xml
--------------------------------------

Config = Config or {} 
Config.DungeonStoneData = Config.DungeonStoneData or {}

-- -------------------const_start-------------------
Config.DungeonStoneData.data_const_length = 4
Config.DungeonStoneData.data_const = {
	["hook_cost"] = {val=30, desc="扫荡消耗钻石"},
	["free_num"] = {val=2, desc="每天免费次数"},
	["desc_rule"] = {val=1, desc="1、每个副本每天有2次免费挑战次数\n2、提升vip可购买额外次数"},
	["dungeon_type"] = {val={1,4,2,3,5}, desc="副本类型常量（增加副本类型在这里相应增加）"}
}
Config.DungeonStoneData.data_const_fun = function(key)
	local data=Config.DungeonStoneData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.DungeonStoneData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------award_list_start-------------------
Config.DungeonStoneData.data_award_list_length = 5
Config.DungeonStoneData.data_award_list = {
	[1] = {
		[101] = {id=101, name="金币副本", dun_type=1, difficulty=1, pre_id=0, lev_limit=1, power=1000, unit_id=86001, first_items={}, show_items={{1,100000},{10001,10}}, pis_str="activity_21", title_name="简单", class_type=1},
		[102] = {id=102, name="金币副本", dun_type=1, difficulty=2, pre_id=101, lev_limit=1, power=40000, unit_id=86002, first_items={}, show_items={{1,150000},{10001,20}}, pis_str="activity_22", title_name="普通", class_type=1},
		[103] = {id=103, name="金币副本", dun_type=1, difficulty=3, pre_id=102, lev_limit=1, power=70000, unit_id=86003, first_items={}, show_items={{1,200000},{10001,30}}, pis_str="activity_23", title_name="困难", class_type=1},
		[104] = {id=104, name="金币副本", dun_type=1, difficulty=4, pre_id=103, lev_limit=1, power=110000, unit_id=86004, first_items={}, show_items={{1,250000},{10001,40}}, pis_str="activity_23", title_name="噩梦1", class_type=1},
		[105] = {id=105, name="金币副本", dun_type=1, difficulty=5, pre_id=104, lev_limit=1, power=170000, unit_id=86005, first_items={}, show_items={{1,300000},{10001,50}}, pis_str="activity_23", title_name="噩梦2", class_type=1},
		[106] = {id=106, name="金币副本", dun_type=1, difficulty=6, pre_id=105, lev_limit=1, power=280000, unit_id=86006, first_items={}, show_items={{1,350000},{10001,60}}, pis_str="activity_24", title_name="地狱1", class_type=1},
		[107] = {id=107, name="金币副本", dun_type=1, difficulty=7, pre_id=106, lev_limit=1, power=430000, unit_id=86007, first_items={}, show_items={{1,400000},{10001,70}}, pis_str="activity_24", title_name="地狱2", class_type=1},
		[108] = {id=108, name="金币副本", dun_type=1, difficulty=8, pre_id=107, lev_limit=1, power=600000, unit_id=86008, first_items={}, show_items={{1,450000},{10001,80}}, pis_str="activity_24", title_name="深渊1", class_type=1},
		[109] = {id=109, name="金币副本", dun_type=1, difficulty=9, pre_id=108, lev_limit=1, power=760000, unit_id=86009, first_items={}, show_items={{1,500000},{10001,100}}, pis_str="activity_24", title_name="深渊2", class_type=1},
	},
	[4] = {
		[201] = {id=201, name="经验副本", dun_type=4, difficulty=1, pre_id=0, lev_limit=1, power=1000, unit_id=86101, first_items={}, show_items={{22,50000}}, pis_str="activity_21", title_name="简单", class_type=4},
		[202] = {id=202, name="经验副本", dun_type=4, difficulty=2, pre_id=201, lev_limit=1, power=46000, unit_id=86102, first_items={}, show_items={{22,80000}}, pis_str="activity_22", title_name="普通", class_type=4},
		[203] = {id=203, name="经验副本", dun_type=4, difficulty=3, pre_id=202, lev_limit=1, power=85000, unit_id=86103, first_items={}, show_items={{22,110000}}, pis_str="activity_23", title_name="困难", class_type=4},
		[204] = {id=204, name="经验副本", dun_type=4, difficulty=4, pre_id=203, lev_limit=1, power=145000, unit_id=86104, first_items={}, show_items={{22,140000}}, pis_str="activity_23", title_name="噩梦1", class_type=4},
		[205] = {id=205, name="经验副本", dun_type=4, difficulty=5, pre_id=204, lev_limit=1, power=180000, unit_id=86105, first_items={}, show_items={{22,170000}}, pis_str="activity_23", title_name="噩梦2", class_type=4},
		[206] = {id=206, name="经验副本", dun_type=4, difficulty=6, pre_id=205, lev_limit=1, power=300000, unit_id=86106, first_items={}, show_items={{22,200000}}, pis_str="activity_24", title_name="地狱1", class_type=4},
		[207] = {id=207, name="经验副本", dun_type=4, difficulty=7, pre_id=206, lev_limit=1, power=450000, unit_id=86107, first_items={}, show_items={{22,230000}}, pis_str="activity_24", title_name="地狱2", class_type=4},
		[208] = {id=208, name="经验副本", dun_type=4, difficulty=8, pre_id=207, lev_limit=1, power=680000, unit_id=86108, first_items={}, show_items={{22,260000}}, pis_str="activity_24", title_name="深渊1", class_type=4},
		[209] = {id=209, name="经验副本", dun_type=4, difficulty=9, pre_id=208, lev_limit=1, power=830000, unit_id=86109, first_items={}, show_items={{22,300000}}, pis_str="activity_24", title_name="深渊2", class_type=4},
	},
	[2] = {
		[301] = {id=301, name="英雄副本", dun_type=2, difficulty=1, pre_id=0, lev_limit=1, power=1000, unit_id=86201, first_items={}, show_items={{29903,10},{29904,2}}, pis_str="activity_21", title_name="简单", class_type=2},
		[302] = {id=302, name="英雄副本", dun_type=2, difficulty=2, pre_id=301, lev_limit=1, power=60000, unit_id=86202, first_items={}, show_items={{29903,20},{29904,5}}, pis_str="activity_22", title_name="普通", class_type=2},
		[303] = {id=303, name="英雄副本", dun_type=2, difficulty=3, pre_id=302, lev_limit=1, power=92000, unit_id=86203, first_items={}, show_items={{29903,20},{29904,10}}, pis_str="activity_23", title_name="困难", class_type=2},
		[304] = {id=304, name="英雄副本", dun_type=2, difficulty=4, pre_id=303, lev_limit=1, power=150000, unit_id=86204, first_items={}, show_items={{29903,20},{29904,15}}, pis_str="activity_23", title_name="噩梦1", class_type=2},
		[305] = {id=305, name="英雄副本", dun_type=2, difficulty=5, pre_id=304, lev_limit=1, power=190000, unit_id=86205, first_items={}, show_items={{29903,20},{29904,20}}, pis_str="activity_23", title_name="噩梦2", class_type=2},
		[306] = {id=306, name="英雄副本", dun_type=2, difficulty=6, pre_id=305, lev_limit=1, power=340000, unit_id=86206, first_items={}, show_items={{29903,30},{29904,25}}, pis_str="activity_24", title_name="地狱1", class_type=2},
		[307] = {id=307, name="英雄副本", dun_type=2, difficulty=7, pre_id=306, lev_limit=1, power=500000, unit_id=86207, first_items={}, show_items={{29903,30},{29904,30}}, pis_str="activity_24", title_name="地狱2", class_type=2},
		[308] = {id=308, name="英雄副本", dun_type=2, difficulty=8, pre_id=307, lev_limit=1, power=760000, unit_id=86208, first_items={}, show_items={{29904,30},{29905,1}}, pis_str="activity_24", title_name="深渊1", class_type=2},
		[309] = {id=309, name="英雄副本", dun_type=2, difficulty=9, pre_id=308, lev_limit=1, power=950000, unit_id=86209, first_items={}, show_items={{29904,30},{29905,2}}, pis_str="activity_24", title_name="深渊2", class_type=2},
	},
	[3] = {
		[401] = {id=401, name="神器副本", dun_type=3, difficulty=1, pre_id=0, lev_limit=1, power=1000, unit_id=86301, first_items={}, show_items={{72001,4}}, pis_str="activity_21", title_name="简单", class_type=3},
		[402] = {id=402, name="神器副本", dun_type=3, difficulty=2, pre_id=401, lev_limit=1, power=50000, unit_id=86302, first_items={}, show_items={{72001,6}}, pis_str="activity_22", title_name="普通", class_type=3},
		[403] = {id=403, name="神器副本", dun_type=3, difficulty=3, pre_id=402, lev_limit=1, power=90000, unit_id=86303, first_items={}, show_items={{72001,8}}, pis_str="activity_23", title_name="困难", class_type=3},
		[404] = {id=404, name="神器副本", dun_type=3, difficulty=4, pre_id=403, lev_limit=1, power=155000, unit_id=86304, first_items={}, show_items={{72001,10}}, pis_str="activity_23", title_name="噩梦1", class_type=3},
		[405] = {id=405, name="神器副本", dun_type=3, difficulty=5, pre_id=404, lev_limit=1, power=186000, unit_id=86305, first_items={}, show_items={{72001,12}}, pis_str="activity_23", title_name="噩梦2", class_type=3},
		[406] = {id=406, name="神器副本", dun_type=3, difficulty=6, pre_id=405, lev_limit=1, power=315000, unit_id=86306, first_items={}, show_items={{72001,14}}, pis_str="activity_24", title_name="地狱1", class_type=3},
		[407] = {id=407, name="神器副本", dun_type=3, difficulty=7, pre_id=406, lev_limit=1, power=465000, unit_id=86307, first_items={}, show_items={{72001,16}}, pis_str="activity_24", title_name="地狱2", class_type=3},
		[408] = {id=408, name="神器副本", dun_type=3, difficulty=8, pre_id=407, lev_limit=1, power=720000, unit_id=86308, first_items={}, show_items={{72001,18}}, pis_str="activity_24", title_name="深渊1", class_type=3},
		[409] = {id=409, name="神器副本", dun_type=3, difficulty=9, pre_id=408, lev_limit=1, power=880000, unit_id=86309, first_items={}, show_items={{72001,20}}, pis_str="activity_24", title_name="深渊2", class_type=3},
	},
	[5] = {
		[501] = {id=501, name="符文副本", dun_type=5, difficulty=1, pre_id=0, lev_limit=70, power=60000, unit_id=86401, first_items={}, show_items={{10450,60}}, pis_str="activity_21", title_name="简单", class_type=5},
		[502] = {id=502, name="符文副本", dun_type=5, difficulty=2, pre_id=501, lev_limit=75, power=90000, unit_id=86402, first_items={}, show_items={{10450,90}}, pis_str="activity_22", title_name="普通", class_type=5},
		[503] = {id=503, name="符文副本", dun_type=5, difficulty=3, pre_id=502, lev_limit=80, power=150000, unit_id=86403, first_items={}, show_items={{10450,120}}, pis_str="activity_23", title_name="困难", class_type=5},
		[504] = {id=504, name="符文副本", dun_type=5, difficulty=4, pre_id=503, lev_limit=85, power=230000, unit_id=86404, first_items={}, show_items={{10450,150}}, pis_str="activity_23", title_name="噩梦1", class_type=5},
		[505] = {id=505, name="符文副本", dun_type=5, difficulty=5, pre_id=504, lev_limit=90, power=320000, unit_id=86405, first_items={}, show_items={{10450,180}}, pis_str="activity_23", title_name="噩梦2", class_type=5},
		[506] = {id=506, name="符文副本", dun_type=5, difficulty=6, pre_id=505, lev_limit=95, power=500000, unit_id=86406, first_items={}, show_items={{10450,210}}, pis_str="activity_24", title_name="地狱1", class_type=5},
		[507] = {id=507, name="符文副本", dun_type=5, difficulty=7, pre_id=506, lev_limit=100, power=760000, unit_id=86407, first_items={}, show_items={{10450,240}}, pis_str="activity_24", title_name="地狱2", class_type=5},
		[508] = {id=508, name="符文副本", dun_type=5, difficulty=8, pre_id=507, lev_limit=105, power=1050000, unit_id=86408, first_items={}, show_items={{10450,270}}, pis_str="activity_24", title_name="深渊1", class_type=5},
		[509] = {id=509, name="符文副本", dun_type=5, difficulty=9, pre_id=508, lev_limit=110, power=1350000, unit_id=86409, first_items={}, show_items={{10450,300}}, pis_str="activity_24", title_name="深渊2", class_type=5},
	},
}
-- -------------------award_list_end---------------------


-- -------------------buy_start-------------------
Config.DungeonStoneData.data_buy_length = 5
Config.DungeonStoneData.data_buy = {
	[1] = {
		[1] = {vip=0, cost=0},
		[2] = {vip=0, cost=0},
		[3] = {vip=1, cost=50},
		[4] = {vip=3, cost=50},
		[5] = {vip=5, cost=50},
		[6] = {vip=7, cost=50},
		[7] = {vip=9, cost=50},
		[8] = {vip=11, cost=50},
		[9] = {vip=13, cost=50},
	},
	[2] = {
		[1] = {vip=0, cost=0},
		[2] = {vip=0, cost=0},
		[3] = {vip=1, cost=50},
		[4] = {vip=3, cost=50},
		[5] = {vip=5, cost=50},
		[6] = {vip=7, cost=50},
		[7] = {vip=9, cost=50},
		[8] = {vip=11, cost=50},
		[9] = {vip=13, cost=50},
	},
	[3] = {
		[1] = {vip=0, cost=0},
		[2] = {vip=0, cost=0},
		[3] = {vip=1, cost=50},
		[4] = {vip=3, cost=50},
		[5] = {vip=5, cost=50},
		[6] = {vip=7, cost=50},
		[7] = {vip=9, cost=50},
		[8] = {vip=11, cost=50},
		[9] = {vip=13, cost=50},
	},
	[4] = {
		[1] = {vip=0, cost=0},
		[2] = {vip=0, cost=0},
		[3] = {vip=1, cost=50},
		[4] = {vip=3, cost=50},
		[5] = {vip=5, cost=50},
		[6] = {vip=7, cost=50},
		[7] = {vip=9, cost=50},
		[8] = {vip=11, cost=50},
		[9] = {vip=13, cost=50},
	},
	[5] = {
		[1] = {vip=0, cost=0},
		[2] = {vip=0, cost=0},
		[3] = {vip=1, cost=100},
		[4] = {vip=3, cost=100},
		[5] = {vip=5, cost=100},
		[6] = {vip=7, cost=100},
		[7] = {vip=9, cost=100},
		[8] = {vip=11, cost=100},
		[9] = {vip=13, cost=100},
	},
}
-- -------------------buy_end---------------------


-- -------------------type_open_start-------------------
Config.DungeonStoneData.data_type_open_length = 5
Config.DungeonStoneData.data_type_open = {
	[1] = {id=1, activate={{'lev',15}}, desc="等级15级开启", name="金币副本"},
	[4] = {id=4, activate={{'lev',17}}, desc="等级17级开启", name="经验副本"},
	[2] = {id=2, activate={{'lev',18}}, desc="等级18级开启", name="英雄副本"},
	[3] = {id=3, activate={{'lev',20}}, desc="等级20级开启", name="神器副本"},
	[5] = {id=5, activate={{'lev',70}}, desc="等级70级开启", name="符文副本"}
}
Config.DungeonStoneData.data_type_open_fun = function(key)
	local data=Config.DungeonStoneData.data_type_open[key]
	if DATA_DEBUG and data == nil then
		print('(Config.DungeonStoneData.data_type_open['..key..'])not found') return
	end
	return data
end
-- -------------------type_open_end---------------------

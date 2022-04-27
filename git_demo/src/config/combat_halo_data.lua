----------------------------------------------------
-- 此文件由数据工具生成
-- 战斗加成配置数据--combat_halo_data.xml
--------------------------------------

Config = Config or {} 
Config.CombatHaloData = Config.CombatHaloData or {}

-- -------------------const_start-------------------
Config.CombatHaloData.data_const_length = 0
Config.CombatHaloData.data_const = {

}
Config.CombatHaloData.data_const_fun = function(key)
	local data=Config.CombatHaloData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.CombatHaloData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------halo_start-------------------
Config.CombatHaloData.data_halo_length = 23
Config.CombatHaloData.data_halo = {
	[1] = {id=1, pos_info={{1,5}}, attrs={{'hp_max_per',220},{'atk_per',160},{'hit_magic',30}}, condition=0},
	[2] = {id=2, pos_info={{2,5}}, attrs={{'hp_max_per',220},{'atk_per',160},{'crit_rate',30}}, condition=0},
	[3] = {id=3, pos_info={{3,5}}, attrs={{'hp_max_per',220},{'atk_per',160},{'dodge_rate',30}}, condition=0},
	[4] = {id=4, pos_info={{4,5}}, attrs={{'hp_max_per',300},{'atk_per',200},{'res',30}}, condition=0},
	[5] = {id=5, pos_info={{5,5}}, attrs={{'hp_max_per',300},{'atk_per',200},{'dam',30}}, condition=0},
	[6] = {id=6, pos_info={{1,4}}, attrs={{'hp_max_per',160},{'atk_per',120}}, condition=0},
	[7] = {id=7, pos_info={{2,4}}, attrs={{'hp_max_per',160},{'atk_per',120}}, condition=0},
	[8] = {id=8, pos_info={{3,4}}, attrs={{'hp_max_per',160},{'atk_per',120}}, condition=0},
	[9] = {id=9, pos_info={{4,4}}, attrs={{'hp_max_per',220},{'atk_per',150}}, condition=0},
	[10] = {id=10, pos_info={{5,4}}, attrs={{'hp_max_per',220},{'atk_per',150}}, condition=0},
	[11] = {id=11, pos_info={{1,3}}, attrs={{'hp_max_per',110},{'atk_per',80}}, condition=0},
	[12] = {id=12, pos_info={{2,3}}, attrs={{'hp_max_per',110},{'atk_per',80}}, condition=0},
	[13] = {id=13, pos_info={{3,3}}, attrs={{'hp_max_per',110},{'atk_per',80}}, condition=0},
	[14] = {id=14, pos_info={{4,3}}, attrs={{'hp_max_per',150},{'atk_per',110}}, condition=0},
	[15] = {id=15, pos_info={{5,3}}, attrs={{'hp_max_per',150},{'atk_per',110}}, condition=0},
	[16] = {id=16, pos_info={{1,2}}, attrs={{'hp_max_per',70},{'atk_per',50}}, condition=0},
	[17] = {id=17, pos_info={{2,2}}, attrs={{'hp_max_per',70},{'atk_per',50}}, condition=0},
	[18] = {id=18, pos_info={{3,2}}, attrs={{'hp_max_per',70},{'atk_per',50}}, condition=0},
	[19] = {id=19, pos_info={{4,2}}, attrs={{'hp_max_per',100},{'atk_per',70}}, condition=0},
	[20] = {id=20, pos_info={{5,2}}, attrs={{'hp_max_per',100},{'atk_per',70}}, condition=0},
	[21] = {id=21, pos_info={{1,1},{2,1},{3,1},{4,1},{5,1}}, attrs={{'hp_max_per',170},{'atk_per',120}}, condition=0},
	[22] = {id=22, pos_info={{4,1}}, attrs={{'hp_max_per',40},{'atk_per',30}}, condition=21},
	[23] = {id=23, pos_info={{5,1}}, attrs={{'hp_max_per',40},{'atk_per',30}}, condition=21}
}
Config.CombatHaloData.data_halo_fun = function(key)
	local data=Config.CombatHaloData.data_halo[key]
	if DATA_DEBUG and data == nil then
		print('(Config.CombatHaloData.data_halo['..key..'])not found') return
	end
	return data
end
-- -------------------halo_end---------------------


-- -------------------halo_icon_start-------------------
Config.CombatHaloData.data_halo_icon_length = 96
Config.CombatHaloData.data_halo_icon = {
	[1] = {id=1, icon=1001, nums={5}},
	[2] = {id=2, icon=1002, nums={5}},
	[3] = {id=3, icon=1003, nums={5}},
	[4] = {id=4, icon=1004, nums={5}},
	[5] = {id=5, icon=1005, nums={5}},
	[6] = {id=6, icon=1001, nums={4}},
	[7] = {id=7, icon=1002, nums={4}},
	[8] = {id=8, icon=1003, nums={4}},
	[9] = {id=9, icon=1004, nums={4}},
	[10] = {id=10, icon=1005, nums={4}},
	[11] = {id=11, icon=1001, nums={3}},
	[12] = {id=12, icon=1002, nums={3}},
	[13] = {id=13, icon=1003, nums={3}},
	[14] = {id=14, icon=1004, nums={3}},
	[15] = {id=15, icon=1005, nums={3}},
	[16] = {id=16, icon=1001, nums={2}},
	[17] = {id=17, icon=1002, nums={2}},
	[18] = {id=18, icon=1003, nums={2}},
	[19] = {id=19, icon=1004, nums={2}},
	[20] = {id=20, icon=1005, nums={2}},
	[21] = {id=21, icon=1006, nums={}},
	[22] = {id=22, icon=1004, nums={1}},
	[23] = {id=23, icon=1005, nums={1}},
	[1117] = {id=1117, icon=1026, nums={3,2}},
	[1118] = {id=1118, icon=1025, nums={3,2}},
	[1119] = {id=1119, icon=1023, nums={3,2}},
	[1120] = {id=1120, icon=1024, nums={3,2}},
	[1216] = {id=1216, icon=1022, nums={3,2}},
	[1218] = {id=1218, icon=1021, nums={3,2}},
	[1219] = {id=1219, icon=1019, nums={3,2}},
	[1220] = {id=1220, icon=1020, nums={3,2}},
	[1316] = {id=1316, icon=1014, nums={3,2}},
	[1317] = {id=1317, icon=1013, nums={3,2}},
	[1319] = {id=1319, icon=1011, nums={3,2}},
	[1320] = {id=1320, icon=1012, nums={3,2}},
	[1416] = {id=1416, icon=1018, nums={3,2}},
	[1417] = {id=1417, icon=1017, nums={3,2}},
	[1418] = {id=1418, icon=1016, nums={3,2}},
	[1420] = {id=1420, icon=1015, nums={3,2}},
	[1516] = {id=1516, icon=1010, nums={3,2}},
	[1517] = {id=1517, icon=1009, nums={3,2}},
	[1518] = {id=1518, icon=1008, nums={3,2}},
	[1519] = {id=1519, icon=1007, nums={3,2}},
	[1617] = {id=1617, icon=1022, nums={2,2}},
	[1618] = {id=1618, icon=1014, nums={2,2}},
	[1619] = {id=1619, icon=1018, nums={2,2}},
	[1620] = {id=1620, icon=1010, nums={2,2}},
	[1718] = {id=1718, icon=1013, nums={2,2}},
	[1719] = {id=1719, icon=1017, nums={2,2}},
	[1720] = {id=1720, icon=1009, nums={2,2}},
	[1819] = {id=1819, icon=1016, nums={2,2}},
	[1820] = {id=1820, icon=1008, nums={2,2}},
	[1920] = {id=1920, icon=1007, nums={2,2}},
	[2223] = {id=2223, icon=1007, nums={1,1}},
	[622] = {id=622, icon=1023, nums={4,1}},
	[722] = {id=722, icon=1019, nums={4,1}},
	[822] = {id=822, icon=1011, nums={4,1}},
	[1022] = {id=1022, icon=1007, nums={4,1}},
	[1122] = {id=1122, icon=1023, nums={3,1}},
	[1222] = {id=1222, icon=1019, nums={3,1}},
	[1322] = {id=1322, icon=1011, nums={3,1}},
	[1522] = {id=1522, icon=1007, nums={3,1}},
	[1622] = {id=1622, icon=1023, nums={2,1}},
	[1722] = {id=1722, icon=1019, nums={2,1}},
	[1822] = {id=1822, icon=1011, nums={2,1}},
	[2022] = {id=2022, icon=1007, nums={2,1}},
	[623] = {id=623, icon=1024, nums={4,1}},
	[723] = {id=723, icon=1020, nums={4,1}},
	[823] = {id=823, icon=1012, nums={4,1}},
	[923] = {id=923, icon=1015, nums={4,1}},
	[1123] = {id=1123, icon=1024, nums={3,1}},
	[1223] = {id=1223, icon=1020, nums={3,1}},
	[1323] = {id=1323, icon=1012, nums={3,1}},
	[1423] = {id=1423, icon=1015, nums={3,1}},
	[1623] = {id=1623, icon=1024, nums={2,1}},
	[1723] = {id=1723, icon=1020, nums={2,1}},
	[1823] = {id=1823, icon=1012, nums={2,1}},
	[1923] = {id=1923, icon=1015, nums={2,1}},
	[112223] = {id=112223, icon=112223, nums={3,1,1}},
	[122223] = {id=122223, icon=122223, nums={3,1,1}},
	[132223] = {id=132223, icon=132223, nums={3,1,1}},
	[162223] = {id=162223, icon=112223, nums={2,1,1}},
	[172223] = {id=172223, icon=122223, nums={2,1,1}},
	[182223] = {id=182223, icon=132223, nums={2,1,1}},
	[161722] = {id=161722, icon=161722, nums={1,2,2}},
	[161822] = {id=161822, icon=161822, nums={1,2,2}},
	[162022] = {id=162022, icon=162022, nums={1,2,2}},
	[171822] = {id=171822, icon=171822, nums={1,2,2}},
	[172022] = {id=172022, icon=172022, nums={1,2,2}},
	[182022] = {id=182022, icon=182022, nums={1,2,2}},
	[161723] = {id=161723, icon=161723, nums={1,2,2}},
	[161823] = {id=161823, icon=161823, nums={1,2,2}},
	[161923] = {id=161923, icon=161923, nums={1,2,2}},
	[171823] = {id=171823, icon=171823, nums={1,2,2}},
	[171923] = {id=171923, icon=171923, nums={1,2,2}},
	[181923] = {id=181923, icon=181923, nums={1,2,2}}
}
Config.CombatHaloData.data_halo_icon_fun = function(key)
	local data=Config.CombatHaloData.data_halo_icon[key]
	if DATA_DEBUG and data == nil then
		print('(Config.CombatHaloData.data_halo_icon['..key..'])not found') return
	end
	return data
end
-- -------------------halo_icon_end---------------------


-- -------------------halo_show_start-------------------
Config.CombatHaloData.data_halo_show_length = 6
Config.CombatHaloData.data_halo_show = {
	[1] = {
		[1] = {name="深蓝之力", icon=1001, desc="上阵2个水系英雄", attrs={{'hp_max_per',70},{'atk_per',50}}, pos_info={{1,2}}},
		[2] = {name="深蓝之力", icon=0, desc="上阵3个水系英雄", attrs={{'hp_max_per',110},{'atk_per',80}}, pos_info={{1,3}}},
		[3] = {name="深蓝之力", icon=0, desc="上阵4个水系英雄", attrs={{'hp_max_per',160},{'atk_per',120}}, pos_info={{1,4}}},
		[4] = {name="深蓝之力", icon=0, desc="上阵5个水系英雄", attrs={{'hp_max_per',220},{'atk_per',160},{'hit_magic',30}}, pos_info={{1,5}}},
	},
	[2] = {
		[1] = {name="永燃之力", icon=1002, desc="上阵2个火系英雄", attrs={{'hp_max_per',70},{'atk_per',50}}, pos_info={{2,2}}},
		[2] = {name="永燃之力", icon=0, desc="上阵3个火系英雄", attrs={{'hp_max_per',110},{'atk_per',80}}, pos_info={{2,3}}},
		[3] = {name="永燃之力", icon=0, desc="上阵4个火系英雄", attrs={{'hp_max_per',160},{'atk_per',120}}, pos_info={{2,4}}},
		[4] = {name="永燃之力", icon=0, desc="上阵5个火系英雄", attrs={{'hp_max_per',220},{'atk_per',160},{'crit_rate',30}}, pos_info={{2,5}}},
	},
	[3] = {
		[1] = {name="苍翠之力", icon=1003, desc="上阵2个风系英雄", attrs={{'hp_max_per',70},{'atk_per',50}}, pos_info={{3,2}}},
		[2] = {name="苍翠之力", icon=0, desc="上阵3个风系英雄", attrs={{'hp_max_per',110},{'atk_per',80}}, pos_info={{3,3}}},
		[3] = {name="苍翠之力", icon=0, desc="上阵4个风系英雄", attrs={{'hp_max_per',160},{'atk_per',120}}, pos_info={{3,4}}},
		[4] = {name="苍翠之力", icon=0, desc="上阵5个风系英雄", attrs={{'hp_max_per',220},{'atk_per',160},{'dodge_rate',30}}, pos_info={{3,5}}},
	},
	[4] = {
		[1] = {name="辉光之力", icon=1004, desc="上阵1个光系英雄", attrs={{'hp_max_per',40},{'atk_per',30}}, pos_info={{4,1}}},
		[2] = {name="辉光之力", icon=0, desc="上阵2个光系英雄", attrs={{'hp_max_per',100},{'atk_per',70}}, pos_info={{4,2}}},
		[3] = {name="辉光之力", icon=0, desc="上阵3个光系英雄", attrs={{'hp_max_per',150},{'atk_per',110}}, pos_info={{4,3}}},
		[4] = {name="辉光之力", icon=0, desc="上阵4个光系英雄", attrs={{'hp_max_per',220},{'atk_per',150}}, pos_info={{4,4}}},
		[5] = {name="辉光之力", icon=0, desc="上阵5个光系英雄", attrs={{'hp_max_per',300},{'atk_per',200},{'res',30}}, pos_info={{4,5}}},
	},
	[5] = {
		[1] = {name="深黯之力", icon=1005, desc="上阵1个暗系英雄", attrs={{'hp_max_per',40},{'atk_per',30}}, pos_info={{5,1}}},
		[2] = {name="深黯之力", icon=0, desc="上阵2个暗系英雄", attrs={{'hp_max_per',100},{'atk_per',70}}, pos_info={{5,2}}},
		[3] = {name="深黯之力", icon=0, desc="上阵3个暗系英雄", attrs={{'hp_max_per',150},{'atk_per',110}}, pos_info={{5,3}}},
		[4] = {name="深黯之力", icon=0, desc="上阵4个暗系英雄", attrs={{'hp_max_per',220},{'atk_per',150}}, pos_info={{5,4}}},
		[5] = {name="深黯之力", icon=0, desc="上阵5个暗系英雄", attrs={{'hp_max_per',300},{'atk_per',200},{'dam',30}}, pos_info={{5,5}}},
	},
	[6] = {
		[1] = {name="融合之力", icon=1006, desc="上阵5个不同种族的英雄", attrs={{'hp_max_per',170},{'atk_per',120}}, pos_info={{1,1},{2,1},{3,1},{4,1},{5,1}}},
	},
}
-- -------------------halo_show_end---------------------

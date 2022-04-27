----------------------------------------------------
-- 此文件由数据工具生成
-- attr配置数据--attr_data.xml
--------------------------------------

Config = Config or {} 
Config.AttrData = Config.AttrData or {}

-- -------------------id_to_key_start-------------------
Config.AttrData.data_id_to_key_length = 29
Config.AttrData.data_id_to_key = {
	[101] = "atk",
	[102] = "def_p",
	[103] = "def_s",
	[104] = "hp_max",
	[105] = "hp",
	[106] = "speed",
	[107] = "def",
	[111] = "hit_rate",
	[112] = "dodge_rate",
	[113] = "crit_rate",
	[114] = "crit_ratio",
	[115] = "hit_magic",
	[116] = "dodge_magic",
	[117] = "tenacity",
	[118] = "atk_per",
	[119] = "def_per",
	[120] = "hp_max_per",
	[121] = "dam",
	[122] = "res",
	[123] = "cure",
	[124] = "be_cure",
	[125] = "dam_p",
	[126] = "dam_s",
	[127] = "res_p",
	[128] = "res_s",
	[129] = "speed_per",
	[130] = "def_p_per",
	[131] = "def_s_per",
	[132] = "toughness"
}
Config.AttrData.data_id_to_key_fun = function(key)
	local data=Config.AttrData.data_id_to_key[key]
	if DATA_DEBUG and data == nil then
		print('(Config.AttrData.data_id_to_key['..key..'])not found') return
	end
	return data
end
-- -------------------id_to_key_end---------------------


-- -------------------key_to_id_start-------------------
Config.AttrData.data_key_to_id_length = 29
Config.AttrData.data_key_to_id = {
	["atk"] = 101,
	["def_p"] = 102,
	["def_s"] = 103,
	["hp_max"] = 104,
	["hp"] = 105,
	["speed"] = 106,
	["def"] = 107,
	["hit_rate"] = 111,
	["dodge_rate"] = 112,
	["crit_rate"] = 113,
	["crit_ratio"] = 114,
	["hit_magic"] = 115,
	["dodge_magic"] = 116,
	["tenacity"] = 117,
	["atk_per"] = 118,
	["def_per"] = 119,
	["hp_max_per"] = 120,
	["dam"] = 121,
	["res"] = 122,
	["cure"] = 123,
	["be_cure"] = 124,
	["dam_p"] = 125,
	["dam_s"] = 126,
	["res_p"] = 127,
	["res_s"] = 128,
	["speed_per"] = 129,
	["def_p_per"] = 130,
	["def_s_per"] = 131,
	["toughness"] = 132
}
Config.AttrData.data_key_to_id_fun = function(key)
	local data=Config.AttrData.data_key_to_id[key]
	if DATA_DEBUG and data == nil then
		print('(Config.AttrData.data_key_to_id['..key..'])not found') return
	end
	return data
end
-- -------------------key_to_id_end---------------------


-- -------------------id_to_name_start-------------------
Config.AttrData.data_id_to_name_length = 29
Config.AttrData.data_id_to_name = {
	[101] = "攻击",
	[102] = "物防",
	[103] = "法防",
	[104] = "生命",
	[105] = "生命",
	[106] = "速度",
	[107] = "防御",
	[111] = "命中",
	[112] = "闪躲",
	[113] = "暴击率",
	[114] = "暴伤",
	[115] = "控制",
	[116] = "抗控",
	[117] = "抗暴",
	[118] = "攻击",
	[119] = "防御",
	[120] = "生命",
	[121] = "伤害加成",
	[122] = "免伤",
	[123] = "治疗",
	[124] = "受疗",
	[125] = "物伤",
	[126] = "法伤",
	[127] = "物免",
	[128] = "法免",
	[129] = "速度",
	[130] = "物防",
	[131] = "法防",
	[132] = "韧性"
}
Config.AttrData.data_id_to_name_fun = function(key)
	local data=Config.AttrData.data_id_to_name[key]
	if DATA_DEBUG and data == nil then
		print('(Config.AttrData.data_id_to_name['..key..'])not found') return
	end
	return data
end
-- -------------------id_to_name_end---------------------


-- -------------------key_to_name_start-------------------
Config.AttrData.data_key_to_name_length = 29
Config.AttrData.data_key_to_name = {
	["atk"] = "攻击",
	["def_p"] = "物防",
	["def_s"] = "法防",
	["hp_max"] = "生命",
	["hp"] = "生命",
	["speed"] = "速度",
	["def"] = "防御",
	["hit_rate"] = "命中",
	["dodge_rate"] = "闪躲",
	["crit_rate"] = "暴击率",
	["crit_ratio"] = "暴伤",
	["hit_magic"] = "控制",
	["dodge_magic"] = "抗控",
	["tenacity"] = "抗暴",
	["atk_per"] = "攻击",
	["def_per"] = "防御",
	["hp_max_per"] = "生命",
	["dam"] = "伤害加成",
	["res"] = "免伤",
	["cure"] = "治疗",
	["be_cure"] = "受疗",
	["dam_p"] = "物伤",
	["dam_s"] = "法伤",
	["res_p"] = "物免",
	["res_s"] = "法免",
	["speed_per"] = "速度",
	["def_p_per"] = "物防",
	["def_s_per"] = "法防",
	["toughness"] = "韧性"
}
Config.AttrData.data_key_to_name_fun = function(key)
	local data=Config.AttrData.data_key_to_name[key]
	if DATA_DEBUG and data == nil then
		print('(Config.AttrData.data_key_to_name['..key..'])not found') return
	end
	return data
end
-- -------------------key_to_name_end---------------------


-- -------------------power_start-------------------
Config.AttrData.data_power_length = 29
Config.AttrData.data_power = {
	["atk"] = {power=2000, not_to_power=0},
	["def_p"] = {power=0, not_to_power=0},
	["def_s"] = {power=0, not_to_power=0},
	["hp_max"] = {power=400, not_to_power=0},
	["hp"] = {power=0, not_to_power=0},
	["speed"] = {power=6400, not_to_power=0},
	["def"] = {power=2658, not_to_power=0},
	["hit_rate"] = {power=0, not_to_power=0},
	["dodge_rate"] = {power=0, not_to_power=0},
	["crit_rate"] = {power=14000, not_to_power=0},
	["crit_ratio"] = {power=20000, not_to_power=1500},
	["hit_magic"] = {power=8000, not_to_power=0},
	["dodge_magic"] = {power=8000, not_to_power=0},
	["tenacity"] = {power=14000, not_to_power=0},
	["atk_per"] = {power=0, not_to_power=0},
	["def_per"] = {power=0, not_to_power=0},
	["hp_max_per"] = {power=0, not_to_power=0},
	["dam"] = {power=18000, not_to_power=0},
	["res"] = {power=18000, not_to_power=0},
	["cure"] = {power=0, not_to_power=0},
	["be_cure"] = {power=0, not_to_power=0},
	["dam_p"] = {power=0, not_to_power=0},
	["dam_s"] = {power=0, not_to_power=0},
	["res_p"] = {power=18000, not_to_power=0},
	["res_s"] = {power=18000, not_to_power=0},
	["speed_per"] = {power=0, not_to_power=0},
	["def_p_per"] = {power=0, not_to_power=0},
	["def_s_per"] = {power=0, not_to_power=0},
	["toughness"] = {power=0, not_to_power=0}
}
Config.AttrData.data_power_fun = function(key)
	local data=Config.AttrData.data_power[key]
	if DATA_DEBUG and data == nil then
		print('(Config.AttrData.data_power['..key..'])not found') return
	end
	return data
end
-- -------------------power_end---------------------


-- -------------------type_start-------------------
Config.AttrData.data_type_length = 29
Config.AttrData.data_type = {
	["atk"] = 1,
	["def_p"] = 1,
	["def_s"] = 1,
	["hp_max"] = 1,
	["hp"] = 1,
	["speed"] = 1,
	["def"] = 1,
	["hit_rate"] = 2,
	["dodge_rate"] = 2,
	["crit_rate"] = 2,
	["crit_ratio"] = 2,
	["hit_magic"] = 2,
	["dodge_magic"] = 2,
	["tenacity"] = 2,
	["atk_per"] = 2,
	["def_per"] = 2,
	["hp_max_per"] = 2,
	["dam"] = 2,
	["res"] = 2,
	["cure"] = 2,
	["be_cure"] = 2,
	["dam_p"] = 2,
	["dam_s"] = 2,
	["res_p"] = 2,
	["res_s"] = 2,
	["speed_per"] = 2,
	["def_p_per"] = 2,
	["def_s_per"] = 2,
	["toughness"] = 2
}
Config.AttrData.data_type_fun = function(key)
	local data=Config.AttrData.data_type[key]
	if DATA_DEBUG and data == nil then
		print('(Config.AttrData.data_type['..key..'])not found') return
	end
	return data
end
-- -------------------type_end---------------------


-- -------------------partner_power_start-------------------
Config.AttrData.data_partner_power_length = 29
Config.AttrData.data_partner_power = {
	["atk"] = 2000,
	["def_p"] = 0,
	["def_s"] = 0,
	["hp_max"] = 400,
	["hp"] = 0,
	["speed"] = 6400,
	["def"] = 2658,
	["hit_rate"] = 0,
	["dodge_rate"] = 0,
	["crit_rate"] = 14000,
	["crit_ratio"] = 20000,
	["hit_magic"] = 8000,
	["dodge_magic"] = 8000,
	["tenacity"] = 14000,
	["atk_per"] = 0,
	["def_per"] = 0,
	["hp_max_per"] = 0,
	["dam"] = 18000,
	["res"] = 18000,
	["cure"] = 0,
	["be_cure"] = 0,
	["dam_p"] = 0,
	["dam_s"] = 0,
	["res_p"] = 18000,
	["res_s"] = 18000,
	["speed_per"] = 0,
	["def_p_per"] = 0,
	["def_s_per"] = 0,
	["toughness"] = 0
}
Config.AttrData.data_partner_power_fun = function(key)
	local data=Config.AttrData.data_partner_power[key]
	if DATA_DEBUG and data == nil then
		print('(Config.AttrData.data_partner_power['..key..'])not found') return
	end
	return data
end
-- -------------------partner_power_end---------------------


-- -------------------is_show_start-------------------
Config.AttrData.data_is_show_length = 14
Config.AttrData.data_is_show = {
	["atk"] = 1,
	["def_p"] = 1,
	["def_s"] = 1,
	["hp_max"] = 1,
	["speed"] = 1,
	["def"] = 1,
	["crit_rate"] = 1,
	["crit_ratio"] = 1,
	["hit_magic"] = 1,
	["dodge_magic"] = 1,
	["tenacity"] = 1,
	["atk_per"] = 1,
	["def_per"] = 1,
	["hp_max_per"] = 1
}
Config.AttrData.data_is_show_fun = function(key)
	local data=Config.AttrData.data_is_show[key]
	if DATA_DEBUG and data == nil then
		print('(Config.AttrData.data_is_show['..key..'])not found') return
	end
	return data
end
-- -------------------is_show_end---------------------

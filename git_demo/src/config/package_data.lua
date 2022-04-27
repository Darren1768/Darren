----------------------------------------------------
-- 此文件由数据工具生成
-- 存储空间配置数据--package_data.xml
--------------------------------------

Config = Config or {} 
Config.PackageData = Config.PackageData or {}

-- -------------------backpack_cost_start-------------------
Config.PackageData.data_backpack_cost_length = 8
Config.PackageData.data_backpack_cost = {
	["bag_vol_def"] = {key="bag_vol_def", val=999, desc="角色背包初始格子数"},
	["bag_vol_max"] = {key="bag_vol_max", val=999, desc="角色背包最大格子数"},
	["partner_eqm_vol_def"] = {key="partner_eqm_vol_def", val=999, desc="伙伴装备背包基础格子数"},
	["bag_vol_open_def"] = {key="bag_vol_open_def", val=5, desc="角色背包每次开启的格子数"},
	["eqm_bag_vol_open_def"] = {key="eqm_bag_vol_open_def", val=10, desc="装备背包每次开启的格子数"},
	["eqm_bag_vol_max"] = {key="eqm_bag_vol_max", val=999, desc="装备背包最大格子数"},
	["open_lev"] = {key="open_lev", val=70, desc="装备背包一键出售按钮开启条件"},
	["limit_lev"] = {key="limit_lev", val=100, desc="装备背包一键出售限制条件"}
}
Config.PackageData.data_backpack_cost_fun = function(key)
	local data=Config.PackageData.data_backpack_cost[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PackageData.data_backpack_cost['..key..'])not found') return
	end
	return data
end
-- -------------------backpack_cost_end---------------------


-- -------------------backpack_use_start-------------------
Config.PackageData.data_backpack_use_length = 1
Config.PackageData.data_backpack_use = {
	[3] = {
		[1] = {type=3, num=1, loss={{3,50}}},
		[2] = {type=3, num=2, loss={{3,100}}},
		[3] = {type=3, num=3, loss={{3,150}}},
		[4] = {type=3, num=4, loss={{3,200}}},
		[5] = {type=3, num=5, loss={{3,200}}},
		[6] = {type=3, num=6, loss={{3,200}}},
		[7] = {type=3, num=7, loss={{3,200}}},
		[8] = {type=3, num=8, loss={{3,200}}},
		[9] = {type=3, num=9, loss={{3,200}}},
		[10] = {type=3, num=10, loss={{3,200}}},
		[11] = {type=3, num=11, loss={{3,200}}},
		[12] = {type=3, num=12, loss={{3,200}}},
		[13] = {type=3, num=13, loss={{3,200}}},
	},
}
-- -------------------backpack_use_end---------------------

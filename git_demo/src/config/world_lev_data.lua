----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--world_lev_data.xml
--------------------------------------

Config = Config or {} 
Config.WorldLevData = Config.WorldLevData or {}

-- -------------------const_start-------------------
Config.WorldLevData.data_const_length = 2
Config.WorldLevData.data_const = {
	["worldlev_number"] = {key="worldlev_number", val=50, desc="世界等级计算最大人数"},
	["worldlev_des"] = {key="worldlev_des", val=0, desc="世界等级由本服等级前50名玩家的等级决定"}
}
Config.WorldLevData.data_const_fun = function(key)
	local data=Config.WorldLevData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.WorldLevData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------

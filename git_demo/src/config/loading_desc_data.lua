----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--loading_desc_data.xml
--------------------------------------

Config = Config or {} 
Config.LoadingDescData = Config.LoadingDescData or {}

-- -------------------desc_start-------------------
Config.LoadingDescData.data_desc_length = 7
Config.LoadingDescData.data_desc = {
	[1] = "副本推图关卡越高，获取角色经验、金币、英雄经验效率越高",
	[2] = "英雄升星、进阶可大幅提高英雄属性成长，升级属性加成提高",
	[3] = "加入公会，一起打Boss可以赚取大量公会贡献",
	[4] = "战斗不停！即使离线也会不断获得经验、金币、英雄碎片等挂机奖励",
	[5] = "快速作战可以立即获得大量角色经验和资源",
	[6] = "挑战竞技场拿竞技奖杯，珍贵英雄、先知水晶超值兑换",
	[7] = "游戏怎么玩？推图、爬塔、打Boss、养英雄玩竞技，感受成长和竞技的乐趣"
}
Config.LoadingDescData.data_desc_fun = function(key)
	local data=Config.LoadingDescData.data_desc[key]
	if DATA_DEBUG and data == nil then
		print('(Config.LoadingDescData.data_desc['..key..'])not found') return
	end
	return data
end
-- -------------------desc_end---------------------

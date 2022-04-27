----------------------------------------------------
-- 此文件由数据工具生成
-- 配置数据--cross_show_data.xml
--------------------------------------

Config = Config or {} 
Config.CrossShowData = Config.CrossShowData or {}

-- -------------------const_start-------------------
Config.CrossShowData.data_const_length = 1
Config.CrossShowData.data_const = {
	["game_rule"] = {code="game_rule", val=1, desc="1.冒险者所在区服世界等级达到100级时开启跨服时空\n2.跨服时空开启后，相关玩法同一区服组内的区服共同参与\n3.跨服组根据区服世界等级分组，每2周的周一0:00进行跨服重组\n4.在跨服重组后达到世界等级要求的区服，需要等待下次跨服重组，方可开启跨服时空玩法匹配"}
}
Config.CrossShowData.data_const_fun = function(key)
	local data=Config.CrossShowData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.CrossShowData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------base_start-------------------
Config.CrossShowData.data_base_length = 6
Config.CrossShowData.data_base = {
	[1] = {id=1, name="天梯争霸", open_limit={{'lev',55}}, icon="1", source_id=103},
	[2] = {id=2, name="公会战", open_limit={{'guild_war'}}, icon="2", source_id=55},
	[3] = {id=3, name="跨服竞技场", open_limit={{'world_lev',120},{'lev',115}}, icon="3", source_id=120},
	[4] = {id=4, name="周冠军赛", open_limit={{'lev',55}}, icon="4", source_id=121},
	[5] = {id=5, name="组队竞技场", open_limit={{'lev',70}}, icon="5", source_id=123},
	[6] = {id=6, name="巅峰冠军场", open_limit={{'world_lev',120},{'lev',55}}, icon="6", source_id=124}
}
Config.CrossShowData.data_base_fun = function(key)
	local data=Config.CrossShowData.data_base[key]
	if DATA_DEBUG and data == nil then
		print('(Config.CrossShowData.data_base['..key..'])not found') return
	end
	return data
end
-- -------------------base_end---------------------

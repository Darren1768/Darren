----------------------------------------------------
-- 此文件由数据工具生成
-- 关系配置数据--relation_data.xml
--------------------------------------

Config = Config or {} 
Config.RelationData = Config.RelationData or {}

-- -------------------relation_start-------------------
Config.RelationData.data_relation_length = 5
Config.RelationData.data_relation = {
	[1] = {id=1, type=1, name="金兰", time=10},
	[2] = {id=2, type=1, name="至交", time=180},
	[10] = {id=10, type=2, name="情侣", time=0},
	[11] = {id=11, type=2, name="夫妻", time=0},
	[20] = {id=20, type=2, name="知己", time=0}
}
Config.RelationData.data_relation_fun = function(key)
	local data=Config.RelationData.data_relation[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RelationData.data_relation['..key..'])not found') return
	end
	return data
end
-- -------------------relation_end---------------------


-- -------------------appoint_num_start-------------------
Config.RelationData.data_appoint_num_length = 3
Config.RelationData.data_appoint_num = {
	[1] = {id=1, lev=1, num=1},
	[2] = {id=2, lev=60, num=2},
	[3] = {id=3, lev=90, num=3}
}
Config.RelationData.data_appoint_num_fun = function(key)
	local data=Config.RelationData.data_appoint_num[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RelationData.data_appoint_num['..key..'])not found') return
	end
	return data
end
-- -------------------appoint_num_end---------------------


-- -------------------buff_list_start-------------------
Config.RelationData.data_buff_list_length = 2
Config.RelationData.data_buff_list = {
	[1] = {{buff_id=1000004, id=1, time=2592000}, {buff_id=1000003, id=1, time=1296000}, {buff_id=1000002, id=1, time=432000}, {buff_id=1000001, id=1, time=172800}},
	[2] = {{buff_id=1000008, id=2, time=2592000}, {buff_id=1000007, id=2, time=1296000}, {buff_id=1000006, id=2, time=432000}, {buff_id=1000005, id=2, time=172800}}
}
-- -------------------buff_list_end---------------------

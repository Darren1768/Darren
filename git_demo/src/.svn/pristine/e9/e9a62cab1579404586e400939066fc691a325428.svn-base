----------------------------------------------------
-- 此文件由数据工具生成
-- 阵法配置数据--formation_data.xml
--------------------------------------

Config = Config or {} 
Config.FormationData = Config.FormationData or {}

-- -------------------form_cost_start-------------------
Config.FormationData.data_form_cost_length = 8
Config.FormationData.data_form_cost = {
	["lineup"] = {code="lineup", val=3, desc=""},
	["lineup_max"] = {code="lineup_max", val=5, desc=""},
	["lineup_unit"] = {code="lineup_unit", val=5, desc=""},
	["exp_a"] = {code="exp_a", val=200, desc=""},
	["exp_b"] = {code="exp_b", val=100, desc=""},
	["item_zf"] = {code="item_zf", val=10130, desc=""},
	["restrain_effect"] = {code="restrain_effect", val={{'dam',0},{'res',0}}, desc="克制方全体<div fontcolor=249003>伤害+0%，免伤+0%</div>"},
	["restrain_des"] = {code="restrain_des", val=0, desc="1、不同的阵法，英雄<div fontcolor=#249003>站位</div>不同，前、中、后排加成效果不同\n2、阵法<div fontcolor=#249003>等级</div>越高，属性加成越高\n3、阵法之间存在克制效果，克制将<div fontcolor=#249003>对敌方造成的伤害提高5%</div>，同时<div fontcolor=#249003>受到敌方的伤害降低5%</div>"}
}
Config.FormationData.data_form_cost_fun = function(key)
	local data=Config.FormationData.data_form_cost[key]
	if DATA_DEBUG and data == nil then
		print('(Config.FormationData.data_form_cost['..key..'])not found') return
	end
	return data
end
-- -------------------form_cost_end---------------------


-- -------------------form_data_start-------------------
Config.FormationData.data_form_data_length = 6
Config.FormationData.data_form_data = {
	[1] = {type=1, order=1, name="锋矢阵", pos={{1,2},{2,4},{3,6},{4,7},{5,9}}, need_lev=1, desc="锋矢阵", pos_list={{1,266,139},{2,50,126},{3,210,170},{4,226,215},{5,312,283}}},
	[2] = {type=2, order=2, name="疾风阵", pos={{1,1},{2,3},{3,4},{4,6},{5,8}}, need_lev=20, desc="疾风阵", pos_list={{1,196,98},{2,278,147},{3,356,198},{4,82,113},{5,358,299}}},
	[3] = {type=3, order=3, name="灵法阵", pos={{1,1},{2,2},{3,3},{4,5},{5,8}}, need_lev=30, desc="灵法阵", pos_list={{1,281,142},{2,113,147},{3,202,199},{4,289,254},{5,127,254}}},
	[5] = {type=5, order=4, name="地绝阵", pos={{1,2},{2,5},{3,7},{4,8},{5,9}}, need_lev=40, desc="地绝阵", pos_list={{1,313,131},{2,233,185},{3,50,185},{4,152,239},{5,237,294}}},
	[6] = {type=6, order=5, name="圣灵阵", pos={{1,1},{2,3},{3,5},{4,7},{5,9}}, need_lev=50, desc="圣灵阵", pos_list={{1,284,141},{2,365,205},{3,204,198},{4,39,200},{5,132,253}}},
	[4] = {type=4, order=6, name="天攻阵", pos={{1,2},{2,4},{3,5},{4,6},{5,8}}, need_lev=60, desc="天攻阵", pos_list={{1,308,111},{2,142,138},{3,286,231},{4,55,200},{5,214,292}}}
}
Config.FormationData.data_form_data_fun = function(key)
	local data=Config.FormationData.data_form_data[key]
	if DATA_DEBUG and data == nil then
		print('(Config.FormationData.data_form_data['..key..'])not found') return
	end
	return data
end
-- -------------------form_data_end---------------------

----------------------------------------------------
-- 此文件由数据工具生成
-- 元素神殿--element_temple_data.xml
--------------------------------------

Config = Config or {} 
Config.ElementTempleData = Config.ElementTempleData or {}

-- -------------------const_start-------------------
Config.ElementTempleData.data_const_length = 5
Config.ElementTempleData.data_const = {
	["join_lev"] = {val=90, desc="冒险者等级90级开启"},
	["refresh_time"] = {val=10800, desc="挑战次数刷新时间"},
	["refresh_number"] = {val=10, desc="挑战次数上限"},
	["rank_number"] = {val=20, desc="排行榜最大人数"},
	["challenge_free"] = {val=2, desc="特权每日赠送挑战次数"}
}
Config.ElementTempleData.data_const_fun = function(key)
	local data=Config.ElementTempleData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ElementTempleData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------base_start-------------------
Config.ElementTempleData.data_base_length = 5
Config.ElementTempleData.data_base = {
	[1] = {type=1, name="水之圣殿", group={1,2,11,12}, open_day={1,6,7}, res_id=1},
	[2] = {type=2, name="火之圣殿", group={3,4,13,14}, open_day={3,6,7}, res_id=2},
	[3] = {type=3, name="风之圣殿", group={5,6,15,16}, open_day={5,6,7}, res_id=3},
	[4] = {type=4, name="光之圣殿", group={7,8,17,18}, open_day={2,6,7}, res_id=4},
	[5] = {type=5, name="暗之圣殿", group={9,10,19,20}, open_day={4,6,7}, res_id=5}
}
Config.ElementTempleData.data_base_fun = function(key)
	local data=Config.ElementTempleData.data_base[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ElementTempleData.data_base['..key..'])not found') return
	end
	return data
end
-- -------------------base_end---------------------


-- -------------------customs_start-------------------
Config.ElementTempleData.data_customs_length = 20
Config.ElementTempleData.data_customs = {
	[1] = {
		[1] = {group=1, id=1, limit={{3,1}}, limit_desc="本关需上阵1位风系英雄", unit_id=35051, first_reward={{17001,30},{17011,2}}, auto_reward={{17001,5},{17011,1}}, power=440583, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=1, id=2, limit={{3,2}}, limit_desc="本关需上阵2位风系英雄", unit_id=35052, first_reward={{17001,35},{17011,4}}, auto_reward={{17001,6},{17011,1}}, power=798253, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=1, id=3, limit={{3,2}}, limit_desc="本关需上阵2位风系英雄", unit_id=35053, first_reward={{17001,40},{17011,6}}, auto_reward={{17001,7},{17011,1}}, power=1203092, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=1, id=4, limit={{3,3}}, limit_desc="本关需上阵3位风系英雄", unit_id=35054, first_reward={{17001,45},{17011,8}}, auto_reward={{17001,8},{17011,1}}, power=1345660, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=1, id=5, limit={{3,3}}, limit_desc="本关需上阵3位风系英雄", unit_id=35055, first_reward={{17001,50},{17011,10}}, auto_reward={{17001,9},{17011,1}}, power=1630794, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=1, id=6, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35056, first_reward={{17001,55},{17011,12}}, auto_reward={{17001,10},{17011,1}}, power=1883784, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=1, id=7, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35057, first_reward={{17001,65},{17011,14}}, auto_reward={{17001,11},{17011,1}}, power=2164884, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=1, id=8, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35058, first_reward={{17001,80},{17011,16}}, auto_reward={{17001,12},{17011,1}}, power=2445984, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=1, id=9, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35059, first_reward={{17001,100},{17011,18}}, auto_reward={{17001,13},{17011,1}}, power=2727084, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=1, id=10, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35060, first_reward={{17001,120},{17011,20}}, auto_reward={{17001,15},{17011,1}}, power=3008184, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=1, id=11, limit={{3,5}}, limit_desc="本关需上阵5位风系英雄", unit_id=35401, first_reward={{17001,125},{17011,22}}, auto_reward={{17001,16},{17011,1}}, power=5000000, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=1, id=12, limit={{3,5}}, limit_desc="本关需上阵5位风系英雄", unit_id=35402, first_reward={{17001,130},{17011,24}}, auto_reward={{17001,18},{17011,1}}, power=6000000, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[2] = {
		[1] = {group=2, id=1, limit={{3,1}}, limit_desc="本关需上阵1位风系英雄", unit_id=35061, first_reward={{17001,30},{17011,2}}, auto_reward={{17001,5},{17011,1}}, power=440583, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=2, id=2, limit={{3,2}}, limit_desc="本关需上阵2位风系英雄", unit_id=35062, first_reward={{17001,35},{17011,4}}, auto_reward={{17001,6},{17011,1}}, power=798253, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=2, id=3, limit={{3,2}}, limit_desc="本关需上阵2位风系英雄", unit_id=35063, first_reward={{17001,40},{17011,6}}, auto_reward={{17001,7},{17011,1}}, power=1203092, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=2, id=4, limit={{3,3}}, limit_desc="本关需上阵3位风系英雄", unit_id=35064, first_reward={{17001,45},{17011,8}}, auto_reward={{17001,8},{17011,1}}, power=1345660, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=2, id=5, limit={{3,3}}, limit_desc="本关需上阵3位风系英雄", unit_id=35065, first_reward={{17001,50},{17011,10}}, auto_reward={{17001,9},{17011,1}}, power=1630794, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=2, id=6, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35066, first_reward={{17001,55},{17011,12}}, auto_reward={{17001,10},{17011,1}}, power=1883784, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=2, id=7, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35067, first_reward={{17001,65},{17011,14}}, auto_reward={{17001,11},{17011,1}}, power=2164884, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=2, id=8, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35068, first_reward={{17001,80},{17011,16}}, auto_reward={{17001,12},{17011,1}}, power=2445984, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=2, id=9, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35069, first_reward={{17001,100},{17011,18}}, auto_reward={{17001,13},{17011,1}}, power=2727084, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=2, id=10, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35070, first_reward={{17001,120},{17011,20}}, auto_reward={{17001,15},{17011,1}}, power=3008184, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=2, id=11, limit={{3,5}}, limit_desc="本关需上阵5位风系英雄", unit_id=35406, first_reward={{17001,125},{17011,22}}, auto_reward={{17001,16},{17011,1}}, power=5000000, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=2, id=12, limit={{3,5}}, limit_desc="本关需上阵5位风系英雄", unit_id=35407, first_reward={{17001,130},{17011,24}}, auto_reward={{17001,18},{17011,1}}, power=6000000, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[11] = {
		[1] = {group=11, id=1, limit={{3,1}}, limit_desc="本关需上阵1位风系英雄", unit_id=35131, first_reward={{17001,30},{17011,2}}, auto_reward={{17001,5},{17011,1}}, power=440583, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=11, id=2, limit={{3,2}}, limit_desc="本关需上阵2位风系英雄", unit_id=35132, first_reward={{17001,35},{17011,4}}, auto_reward={{17001,6},{17011,1}}, power=798253, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=11, id=3, limit={{3,2}}, limit_desc="本关需上阵2位风系英雄", unit_id=35133, first_reward={{17001,40},{17011,6}}, auto_reward={{17001,7},{17011,1}}, power=1203092, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=11, id=4, limit={{3,3}}, limit_desc="本关需上阵3位风系英雄", unit_id=35134, first_reward={{17001,45},{17011,8}}, auto_reward={{17001,8},{17011,1}}, power=1345660, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=11, id=5, limit={{3,3}}, limit_desc="本关需上阵3位风系英雄", unit_id=35135, first_reward={{17001,50},{17011,10}}, auto_reward={{17001,9},{17011,1}}, power=1630794, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=11, id=6, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35136, first_reward={{17001,55},{17011,12}}, auto_reward={{17001,10},{17011,1}}, power=1883784, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=11, id=7, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35137, first_reward={{17001,65},{17011,14}}, auto_reward={{17001,11},{17011,1}}, power=2164884, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=11, id=8, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35138, first_reward={{17001,80},{17011,16}}, auto_reward={{17001,12},{17011,1}}, power=2445984, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=11, id=9, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35139, first_reward={{17001,100},{17011,18}}, auto_reward={{17001,13},{17011,1}}, power=2727084, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=11, id=10, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35140, first_reward={{17001,120},{17011,20}}, auto_reward={{17001,15},{17011,1}}, power=3008184, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=11, id=11, limit={{3,5}}, limit_desc="本关需上阵5位风系英雄", unit_id=35411, first_reward={{17001,125},{17011,22}}, auto_reward={{17001,16},{17011,1}}, power=5000000, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=11, id=12, limit={{3,5}}, limit_desc="本关需上阵5位风系英雄", unit_id=35412, first_reward={{17001,130},{17011,24}}, auto_reward={{17001,18},{17011,1}}, power=6000000, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[12] = {
		[1] = {group=12, id=1, limit={{3,1}}, limit_desc="本关需上阵1位风系英雄", unit_id=35141, first_reward={{17001,30},{17011,2}}, auto_reward={{17001,5},{17011,1}}, power=440583, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=12, id=2, limit={{3,2}}, limit_desc="本关需上阵2位风系英雄", unit_id=35142, first_reward={{17001,35},{17011,4}}, auto_reward={{17001,6},{17011,1}}, power=798253, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=12, id=3, limit={{3,2}}, limit_desc="本关需上阵2位风系英雄", unit_id=35143, first_reward={{17001,40},{17011,6}}, auto_reward={{17001,7},{17011,1}}, power=1203092, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=12, id=4, limit={{3,3}}, limit_desc="本关需上阵3位风系英雄", unit_id=35144, first_reward={{17001,45},{17011,8}}, auto_reward={{17001,8},{17011,1}}, power=1345660, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=12, id=5, limit={{3,3}}, limit_desc="本关需上阵3位风系英雄", unit_id=35145, first_reward={{17001,50},{17011,10}}, auto_reward={{17001,9},{17011,1}}, power=1630794, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=12, id=6, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35146, first_reward={{17001,55},{17011,12}}, auto_reward={{17001,10},{17011,1}}, power=1883784, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=12, id=7, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35147, first_reward={{17001,65},{17011,14}}, auto_reward={{17001,11},{17011,1}}, power=2164884, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=12, id=8, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35148, first_reward={{17001,80},{17011,16}}, auto_reward={{17001,12},{17011,1}}, power=2445984, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=12, id=9, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35149, first_reward={{17001,100},{17011,18}}, auto_reward={{17001,13},{17011,1}}, power=2727084, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=12, id=10, limit={{3,4}}, limit_desc="本关需上阵4位风系英雄", unit_id=35150, first_reward={{17001,120},{17011,20}}, auto_reward={{17001,15},{17011,1}}, power=3008184, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=12, id=11, limit={{3,5}}, limit_desc="本关需上阵5位风系英雄", unit_id=35416, first_reward={{17001,125},{17011,22}}, auto_reward={{17001,16},{17011,1}}, power=5000000, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=12, id=12, limit={{3,5}}, limit_desc="本关需上阵5位风系英雄", unit_id=35417, first_reward={{17001,130},{17011,24}}, auto_reward={{17001,18},{17011,1}}, power=6000000, camp_skill={{3,601001},{1,601002},{2,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[3] = {
		[1] = {group=3, id=1, limit={{1,1}}, limit_desc="本关需上阵1位水系英雄", unit_id=35011, first_reward={{17002,30},{17011,2}}, auto_reward={{17002,5},{17011,1}}, power=440583, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=3, id=2, limit={{1,2}}, limit_desc="本关需上阵2位水系英雄", unit_id=35012, first_reward={{17002,35},{17011,4}}, auto_reward={{17002,6},{17011,1}}, power=798253, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=3, id=3, limit={{1,2}}, limit_desc="本关需上阵2位水系英雄", unit_id=35013, first_reward={{17002,40},{17011,6}}, auto_reward={{17002,7},{17011,1}}, power=1203092, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=3, id=4, limit={{1,3}}, limit_desc="本关需上阵3位水系英雄", unit_id=35014, first_reward={{17002,45},{17011,8}}, auto_reward={{17002,8},{17011,1}}, power=1345660, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=3, id=5, limit={{1,3}}, limit_desc="本关需上阵3位水系英雄", unit_id=35015, first_reward={{17002,50},{17011,10}}, auto_reward={{17002,9},{17011,1}}, power=1630794, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=3, id=6, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35016, first_reward={{17002,55},{17011,12}}, auto_reward={{17002,10},{17011,1}}, power=1883784, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=3, id=7, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35017, first_reward={{17002,65},{17011,14}}, auto_reward={{17002,11},{17011,1}}, power=2164884, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=3, id=8, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35018, first_reward={{17002,80},{17011,16}}, auto_reward={{17002,12},{17011,1}}, power=2445984, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=3, id=9, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35019, first_reward={{17002,100},{17011,18}}, auto_reward={{17002,13},{17011,1}}, power=2727084, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=3, id=10, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35020, first_reward={{17002,120},{17011,20}}, auto_reward={{17002,15},{17011,1}}, power=3008184, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=3, id=11, limit={{1,5}}, limit_desc="本关需上阵5位水系英雄", unit_id=35421, first_reward={{17002,125},{17011,22}}, auto_reward={{17002,16},{17011,1}}, power=5000000, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=3, id=12, limit={{1,5}}, limit_desc="本关需上阵5位水系英雄", unit_id=35422, first_reward={{17002,130},{17011,24}}, auto_reward={{17002,18},{17011,1}}, power=6000000, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[4] = {
		[1] = {group=4, id=1, limit={{1,1}}, limit_desc="本关需上阵1位水系英雄", unit_id=35021, first_reward={{17002,30},{17011,2}}, auto_reward={{17002,5},{17011,1}}, power=440583, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=4, id=2, limit={{1,2}}, limit_desc="本关需上阵2位水系英雄", unit_id=35022, first_reward={{17002,35},{17011,4}}, auto_reward={{17002,6},{17011,1}}, power=798253, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=4, id=3, limit={{1,2}}, limit_desc="本关需上阵2位水系英雄", unit_id=35023, first_reward={{17002,40},{17011,6}}, auto_reward={{17002,7},{17011,1}}, power=1203092, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=4, id=4, limit={{1,3}}, limit_desc="本关需上阵3位水系英雄", unit_id=35024, first_reward={{17002,45},{17011,8}}, auto_reward={{17002,8},{17011,1}}, power=1345660, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=4, id=5, limit={{1,3}}, limit_desc="本关需上阵3位水系英雄", unit_id=35025, first_reward={{17002,50},{17011,10}}, auto_reward={{17002,9},{17011,1}}, power=1630794, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=4, id=6, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35026, first_reward={{17002,55},{17011,12}}, auto_reward={{17002,10},{17011,1}}, power=1883784, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=4, id=7, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35027, first_reward={{17002,65},{17011,14}}, auto_reward={{17002,11},{17011,1}}, power=2164884, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=4, id=8, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35028, first_reward={{17002,80},{17011,16}}, auto_reward={{17002,12},{17011,1}}, power=2445984, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=4, id=9, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35029, first_reward={{17002,100},{17011,18}}, auto_reward={{17002,13},{17011,1}}, power=2727084, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=4, id=10, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35030, first_reward={{17002,120},{17011,20}}, auto_reward={{17002,15},{17011,1}}, power=3008184, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=4, id=11, limit={{1,5}}, limit_desc="本关需上阵5位水系英雄", unit_id=35426, first_reward={{17002,125},{17011,22}}, auto_reward={{17002,16},{17011,1}}, power=5000000, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=4, id=12, limit={{1,5}}, limit_desc="本关需上阵5位水系英雄", unit_id=35427, first_reward={{17002,130},{17011,24}}, auto_reward={{17002,18},{17011,1}}, power=6000000, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[13] = {
		[1] = {group=13, id=1, limit={{1,1}}, limit_desc="本关需上阵1位水系英雄", unit_id=35111, first_reward={{17002,30},{17011,2}}, auto_reward={{17002,5},{17011,1}}, power=440583, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=13, id=2, limit={{1,2}}, limit_desc="本关需上阵2位水系英雄", unit_id=35112, first_reward={{17002,35},{17011,4}}, auto_reward={{17002,6},{17011,1}}, power=798253, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=13, id=3, limit={{1,2}}, limit_desc="本关需上阵2位水系英雄", unit_id=35113, first_reward={{17002,40},{17011,6}}, auto_reward={{17002,7},{17011,1}}, power=1203092, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=13, id=4, limit={{1,3}}, limit_desc="本关需上阵3位水系英雄", unit_id=35114, first_reward={{17002,45},{17011,8}}, auto_reward={{17002,8},{17011,1}}, power=1345660, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=13, id=5, limit={{1,3}}, limit_desc="本关需上阵3位水系英雄", unit_id=35115, first_reward={{17002,50},{17011,10}}, auto_reward={{17002,9},{17011,1}}, power=1630794, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=13, id=6, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35116, first_reward={{17002,55},{17011,12}}, auto_reward={{17002,10},{17011,1}}, power=1883784, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=13, id=7, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35117, first_reward={{17002,65},{17011,14}}, auto_reward={{17002,11},{17011,1}}, power=2164884, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=13, id=8, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35118, first_reward={{17002,80},{17011,16}}, auto_reward={{17002,12},{17011,1}}, power=2445984, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=13, id=9, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35119, first_reward={{17002,100},{17011,18}}, auto_reward={{17002,13},{17011,1}}, power=2727084, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=13, id=10, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35120, first_reward={{17002,120},{17011,20}}, auto_reward={{17002,15},{17011,1}}, power=3008184, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=13, id=11, limit={{1,5}}, limit_desc="本关需上阵5位水系英雄", unit_id=35431, first_reward={{17002,125},{17011,22}}, auto_reward={{17002,16},{17011,1}}, power=5000000, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=13, id=12, limit={{1,5}}, limit_desc="本关需上阵5位水系英雄", unit_id=35432, first_reward={{17002,130},{17011,24}}, auto_reward={{17002,18},{17011,1}}, power=6000000, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[14] = {
		[1] = {group=14, id=1, limit={{1,1}}, limit_desc="本关需上阵1位水系英雄", unit_id=35121, first_reward={{17002,30},{17011,2}}, auto_reward={{17002,5},{17011,1}}, power=440583, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=14, id=2, limit={{1,2}}, limit_desc="本关需上阵2位水系英雄", unit_id=35122, first_reward={{17002,35},{17011,4}}, auto_reward={{17002,6},{17011,1}}, power=798253, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=14, id=3, limit={{1,2}}, limit_desc="本关需上阵2位水系英雄", unit_id=35123, first_reward={{17002,40},{17011,6}}, auto_reward={{17002,7},{17011,1}}, power=1203092, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=14, id=4, limit={{1,3}}, limit_desc="本关需上阵3位水系英雄", unit_id=35124, first_reward={{17002,45},{17011,8}}, auto_reward={{17002,8},{17011,1}}, power=1345660, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=14, id=5, limit={{1,3}}, limit_desc="本关需上阵3位水系英雄", unit_id=35125, first_reward={{17002,50},{17011,10}}, auto_reward={{17002,9},{17011,1}}, power=1630794, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=14, id=6, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35126, first_reward={{17002,55},{17011,12}}, auto_reward={{17002,10},{17011,1}}, power=1883784, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=14, id=7, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35127, first_reward={{17002,65},{17011,14}}, auto_reward={{17002,11},{17011,1}}, power=2164884, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=14, id=8, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35128, first_reward={{17002,80},{17011,16}}, auto_reward={{17002,12},{17011,1}}, power=2445984, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=14, id=9, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35129, first_reward={{17002,100},{17011,18}}, auto_reward={{17002,13},{17011,1}}, power=2727084, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=14, id=10, limit={{1,4}}, limit_desc="本关需上阵4位水系英雄", unit_id=35130, first_reward={{17002,120},{17011,20}}, auto_reward={{17002,15},{17011,1}}, power=3008184, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=14, id=11, limit={{1,5}}, limit_desc="本关需上阵5位水系英雄", unit_id=35436, first_reward={{17002,125},{17011,22}}, auto_reward={{17002,16},{17011,1}}, power=5000000, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=14, id=12, limit={{1,5}}, limit_desc="本关需上阵5位水系英雄", unit_id=35437, first_reward={{17002,130},{17011,24}}, auto_reward={{17002,18},{17011,1}}, power=6000000, camp_skill={{1,601001},{2,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[5] = {
		[1] = {group=5, id=1, limit={{2,1}}, limit_desc="本关需上阵1位火系英雄", unit_id=35041, first_reward={{17003,30},{17011,2}}, auto_reward={{17003,5},{17011,1}}, power=440583, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=5, id=2, limit={{2,2}}, limit_desc="本关需上阵2位火系英雄", unit_id=35042, first_reward={{17003,35},{17011,4}}, auto_reward={{17003,6},{17011,1}}, power=798253, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=5, id=3, limit={{2,2}}, limit_desc="本关需上阵2位火系英雄", unit_id=35043, first_reward={{17003,40},{17011,6}}, auto_reward={{17003,7},{17011,1}}, power=1203092, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=5, id=4, limit={{2,3}}, limit_desc="本关需上阵3位火系英雄", unit_id=35044, first_reward={{17003,45},{17011,8}}, auto_reward={{17003,8},{17011,1}}, power=1345660, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=5, id=5, limit={{2,3}}, limit_desc="本关需上阵3位火系英雄", unit_id=35045, first_reward={{17003,50},{17011,10}}, auto_reward={{17003,9},{17011,1}}, power=1630794, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=5, id=6, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35046, first_reward={{17003,55},{17011,12}}, auto_reward={{17003,10},{17011,1}}, power=1883784, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=5, id=7, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35047, first_reward={{17003,65},{17011,14}}, auto_reward={{17003,11},{17011,1}}, power=2164884, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=5, id=8, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35048, first_reward={{17003,80},{17011,16}}, auto_reward={{17003,12},{17011,1}}, power=2445984, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=5, id=9, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35049, first_reward={{17003,100},{17011,18}}, auto_reward={{17003,13},{17011,1}}, power=2727084, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=5, id=10, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35050, first_reward={{17003,120},{17011,20}}, auto_reward={{17003,15},{17011,1}}, power=3008184, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=5, id=11, limit={{2,5}}, limit_desc="本关需上阵5位火系英雄", unit_id=35441, first_reward={{17003,125},{17011,22}}, auto_reward={{17003,16},{17011,1}}, power=5000000, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=5, id=12, limit={{2,5}}, limit_desc="本关需上阵5位火系英雄", unit_id=35442, first_reward={{17003,130},{17011,24}}, auto_reward={{17003,18},{17011,1}}, power=6000000, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[6] = {
		[1] = {group=6, id=1, limit={{2,1}}, limit_desc="本关需上阵1位火系英雄", unit_id=35031, first_reward={{17003,30},{17011,2}}, auto_reward={{17003,5},{17011,1}}, power=440583, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=6, id=2, limit={{2,2}}, limit_desc="本关需上阵2位火系英雄", unit_id=35032, first_reward={{17003,35},{17011,4}}, auto_reward={{17003,6},{17011,1}}, power=798253, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=6, id=3, limit={{2,2}}, limit_desc="本关需上阵2位火系英雄", unit_id=35033, first_reward={{17003,40},{17011,6}}, auto_reward={{17003,7},{17011,1}}, power=1203092, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=6, id=4, limit={{2,3}}, limit_desc="本关需上阵3位火系英雄", unit_id=35034, first_reward={{17003,45},{17011,8}}, auto_reward={{17003,8},{17011,1}}, power=1345660, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=6, id=5, limit={{2,3}}, limit_desc="本关需上阵3位火系英雄", unit_id=35035, first_reward={{17003,50},{17011,10}}, auto_reward={{17003,9},{17011,1}}, power=1630794, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=6, id=6, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35036, first_reward={{17003,55},{17011,12}}, auto_reward={{17003,10},{17011,1}}, power=1883784, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=6, id=7, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35037, first_reward={{17003,65},{17011,14}}, auto_reward={{17003,11},{17011,1}}, power=2164884, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=6, id=8, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35038, first_reward={{17003,80},{17011,16}}, auto_reward={{17003,12},{17011,1}}, power=2445984, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=6, id=9, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35039, first_reward={{17003,100},{17011,18}}, auto_reward={{17003,13},{17011,1}}, power=2727084, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=6, id=10, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35040, first_reward={{17003,120},{17011,20}}, auto_reward={{17003,15},{17011,1}}, power=3008184, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=6, id=11, limit={{2,5}}, limit_desc="本关需上阵5位火系英雄", unit_id=35446, first_reward={{17003,125},{17011,22}}, auto_reward={{17003,16},{17011,1}}, power=5000000, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=6, id=12, limit={{2,5}}, limit_desc="本关需上阵5位火系英雄", unit_id=35447, first_reward={{17003,130},{17011,24}}, auto_reward={{17003,18},{17011,1}}, power=6000000, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[15] = {
		[1] = {group=15, id=1, limit={{2,1}}, limit_desc="本关需上阵1位火系英雄", unit_id=35151, first_reward={{17003,30},{17011,2}}, auto_reward={{17003,5},{17011,1}}, power=440583, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=15, id=2, limit={{2,2}}, limit_desc="本关需上阵2位火系英雄", unit_id=35152, first_reward={{17003,35},{17011,4}}, auto_reward={{17003,6},{17011,1}}, power=798253, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=15, id=3, limit={{2,2}}, limit_desc="本关需上阵2位火系英雄", unit_id=35153, first_reward={{17003,40},{17011,6}}, auto_reward={{17003,7},{17011,1}}, power=1203092, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=15, id=4, limit={{2,3}}, limit_desc="本关需上阵3位火系英雄", unit_id=35154, first_reward={{17003,45},{17011,8}}, auto_reward={{17003,8},{17011,1}}, power=1345660, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=15, id=5, limit={{2,3}}, limit_desc="本关需上阵3位火系英雄", unit_id=35155, first_reward={{17003,50},{17011,10}}, auto_reward={{17003,9},{17011,1}}, power=1630794, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=15, id=6, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35156, first_reward={{17003,55},{17011,12}}, auto_reward={{17003,10},{17011,1}}, power=1883784, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=15, id=7, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35157, first_reward={{17003,65},{17011,14}}, auto_reward={{17003,11},{17011,1}}, power=2164884, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=15, id=8, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35158, first_reward={{17003,80},{17011,16}}, auto_reward={{17003,12},{17011,1}}, power=2445984, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=15, id=9, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35159, first_reward={{17003,100},{17011,18}}, auto_reward={{17003,13},{17011,1}}, power=2727084, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=15, id=10, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35160, first_reward={{17003,120},{17011,20}}, auto_reward={{17003,15},{17011,1}}, power=3008184, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=15, id=11, limit={{2,5}}, limit_desc="本关需上阵5位火系英雄", unit_id=35451, first_reward={{17003,125},{17011,22}}, auto_reward={{17003,16},{17011,1}}, power=5000000, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=15, id=12, limit={{2,5}}, limit_desc="本关需上阵5位火系英雄", unit_id=35452, first_reward={{17003,130},{17011,24}}, auto_reward={{17003,18},{17011,1}}, power=6000000, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[16] = {
		[1] = {group=16, id=1, limit={{2,1}}, limit_desc="本关需上阵1位火系英雄", unit_id=35161, first_reward={{17003,30},{17011,2}}, auto_reward={{17003,5},{17011,1}}, power=440583, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=16, id=2, limit={{2,2}}, limit_desc="本关需上阵2位火系英雄", unit_id=35162, first_reward={{17003,35},{17011,4}}, auto_reward={{17003,6},{17011,1}}, power=798253, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=16, id=3, limit={{2,2}}, limit_desc="本关需上阵2位火系英雄", unit_id=35163, first_reward={{17003,40},{17011,6}}, auto_reward={{17003,7},{17011,1}}, power=1203092, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=16, id=4, limit={{2,3}}, limit_desc="本关需上阵3位火系英雄", unit_id=35164, first_reward={{17003,45},{17011,8}}, auto_reward={{17003,8},{17011,1}}, power=1345660, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=16, id=5, limit={{2,3}}, limit_desc="本关需上阵3位火系英雄", unit_id=35165, first_reward={{17003,50},{17011,10}}, auto_reward={{17003,9},{17011,1}}, power=1630794, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=16, id=6, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35166, first_reward={{17003,55},{17011,12}}, auto_reward={{17003,10},{17011,1}}, power=1883784, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=16, id=7, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35167, first_reward={{17003,65},{17011,14}}, auto_reward={{17003,11},{17011,1}}, power=2164884, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=16, id=8, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35168, first_reward={{17003,80},{17011,16}}, auto_reward={{17003,12},{17011,1}}, power=2445984, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=16, id=9, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35169, first_reward={{17003,100},{17011,18}}, auto_reward={{17003,13},{17011,1}}, power=2727084, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=16, id=10, limit={{2,4}}, limit_desc="本关需上阵4位火系英雄", unit_id=35170, first_reward={{17003,120},{17011,20}}, auto_reward={{17003,15},{17011,1}}, power=3008184, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=16, id=11, limit={{2,5}}, limit_desc="本关需上阵5位火系英雄", unit_id=35456, first_reward={{17003,125},{17011,22}}, auto_reward={{17003,16},{17011,1}}, power=5000000, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=16, id=12, limit={{2,5}}, limit_desc="本关需上阵5位火系英雄", unit_id=35457, first_reward={{17003,130},{17011,24}}, auto_reward={{17003,18},{17011,1}}, power=6000000, camp_skill={{2,601001},{1,601002},{3,601002},{4,601002},{5,601002}}, limit_dun_id=10},
	},
	[7] = {
		[1] = {group=7, id=1, limit={{5,1}}, limit_desc="本关需上阵1位暗系英雄", unit_id=35071, first_reward={{17004,30},{17011,2}}, auto_reward={{17004,5},{17011,1}}, power=440583, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[2] = {group=7, id=2, limit={{5,2}}, limit_desc="本关需上阵2位暗系英雄", unit_id=35072, first_reward={{17004,35},{17011,4}}, auto_reward={{17004,6},{17011,1}}, power=798253, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[3] = {group=7, id=3, limit={{5,2}}, limit_desc="本关需上阵2位暗系英雄", unit_id=35073, first_reward={{17004,40},{17011,6}}, auto_reward={{17004,7},{17011,1}}, power=1203092, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[4] = {group=7, id=4, limit={{5,3}}, limit_desc="本关需上阵3位暗系英雄", unit_id=35074, first_reward={{17004,45},{17011,8}}, auto_reward={{17004,8},{17011,1}}, power=1345660, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[5] = {group=7, id=5, limit={{5,3}}, limit_desc="本关需上阵3位暗系英雄", unit_id=35075, first_reward={{17004,50},{17011,10}}, auto_reward={{17004,9},{17011,1}}, power=1630794, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[6] = {group=7, id=6, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35076, first_reward={{17004,55},{17011,12}}, auto_reward={{17004,10},{17011,1}}, power=1883784, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[7] = {group=7, id=7, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35077, first_reward={{17004,65},{17011,14}}, auto_reward={{17004,11},{17011,1}}, power=2164884, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=5},
		[8] = {group=7, id=8, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35078, first_reward={{17004,80},{17011,16}}, auto_reward={{17004,12},{17011,1}}, power=2445984, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=6},
		[9] = {group=7, id=9, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35079, first_reward={{17004,100},{17011,18}}, auto_reward={{17004,13},{17011,1}}, power=2727084, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=7},
		[10] = {group=7, id=10, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35080, first_reward={{17004,120},{17011,20}}, auto_reward={{17004,15},{17011,1}}, power=3008184, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=8},
		[11] = {group=7, id=11, limit={{5,5}}, limit_desc="本关需上阵5位暗系英雄", unit_id=35461, first_reward={{17004,125},{17011,22}}, auto_reward={{17004,16},{17011,1}}, power=5000000, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=9},
		[12] = {group=7, id=12, limit={{5,5}}, limit_desc="本关需上阵5位暗系英雄", unit_id=35462, first_reward={{17004,130},{17011,24}}, auto_reward={{17004,18},{17011,1}}, power=6000000, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=10},
	},
	[8] = {
		[1] = {group=8, id=1, limit={{5,1}}, limit_desc="本关需上阵1位暗系英雄", unit_id=35081, first_reward={{17004,30},{17011,2}}, auto_reward={{17004,5},{17011,1}}, power=440583, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[2] = {group=8, id=2, limit={{5,2}}, limit_desc="本关需上阵2位暗系英雄", unit_id=35082, first_reward={{17004,35},{17011,4}}, auto_reward={{17004,6},{17011,1}}, power=798253, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[3] = {group=8, id=3, limit={{5,2}}, limit_desc="本关需上阵2位暗系英雄", unit_id=35083, first_reward={{17004,40},{17011,6}}, auto_reward={{17004,7},{17011,1}}, power=1203092, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[4] = {group=8, id=4, limit={{5,3}}, limit_desc="本关需上阵3位暗系英雄", unit_id=35084, first_reward={{17004,45},{17011,8}}, auto_reward={{17004,8},{17011,1}}, power=1345660, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[5] = {group=8, id=5, limit={{5,3}}, limit_desc="本关需上阵3位暗系英雄", unit_id=35085, first_reward={{17004,50},{17011,10}}, auto_reward={{17004,9},{17011,1}}, power=1630794, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[6] = {group=8, id=6, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35086, first_reward={{17004,55},{17011,12}}, auto_reward={{17004,10},{17011,1}}, power=1883784, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[7] = {group=8, id=7, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35087, first_reward={{17004,65},{17011,14}}, auto_reward={{17004,11},{17011,1}}, power=2164884, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=5},
		[8] = {group=8, id=8, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35088, first_reward={{17004,80},{17011,16}}, auto_reward={{17004,12},{17011,1}}, power=2445984, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=6},
		[9] = {group=8, id=9, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35089, first_reward={{17004,100},{17011,18}}, auto_reward={{17004,13},{17011,1}}, power=2727084, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=7},
		[10] = {group=8, id=10, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35090, first_reward={{17004,120},{17011,20}}, auto_reward={{17004,15},{17011,1}}, power=3008184, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=8},
		[11] = {group=8, id=11, limit={{5,5}}, limit_desc="本关需上阵5位暗系英雄", unit_id=35466, first_reward={{17004,125},{17011,22}}, auto_reward={{17004,16},{17011,1}}, power=5000000, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=9},
		[12] = {group=8, id=12, limit={{5,5}}, limit_desc="本关需上阵5位暗系英雄", unit_id=35467, first_reward={{17004,130},{17011,24}}, auto_reward={{17004,18},{17011,1}}, power=6000000, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=10},
	},
	[17] = {
		[1] = {group=17, id=1, limit={{5,1}}, limit_desc="本关需上阵1位暗系英雄", unit_id=35171, first_reward={{17004,30},{17011,2}}, auto_reward={{17004,5},{17011,1}}, power=440583, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[2] = {group=17, id=2, limit={{5,2}}, limit_desc="本关需上阵2位暗系英雄", unit_id=35172, first_reward={{17004,35},{17011,4}}, auto_reward={{17004,6},{17011,1}}, power=798253, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[3] = {group=17, id=3, limit={{5,2}}, limit_desc="本关需上阵2位暗系英雄", unit_id=35173, first_reward={{17004,40},{17011,6}}, auto_reward={{17004,7},{17011,1}}, power=1203092, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[4] = {group=17, id=4, limit={{5,3}}, limit_desc="本关需上阵3位暗系英雄", unit_id=35174, first_reward={{17004,45},{17011,8}}, auto_reward={{17004,8},{17011,1}}, power=1345660, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[5] = {group=17, id=5, limit={{5,3}}, limit_desc="本关需上阵3位暗系英雄", unit_id=35175, first_reward={{17004,50},{17011,10}}, auto_reward={{17004,9},{17011,1}}, power=1630794, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[6] = {group=17, id=6, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35176, first_reward={{17004,55},{17011,12}}, auto_reward={{17004,10},{17011,1}}, power=1883784, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[7] = {group=17, id=7, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35177, first_reward={{17004,65},{17011,14}}, auto_reward={{17004,11},{17011,1}}, power=2164884, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=5},
		[8] = {group=17, id=8, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35178, first_reward={{17004,80},{17011,16}}, auto_reward={{17004,12},{17011,1}}, power=2445984, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=6},
		[9] = {group=17, id=9, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35179, first_reward={{17004,100},{17011,18}}, auto_reward={{17004,13},{17011,1}}, power=2727084, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=7},
		[10] = {group=17, id=10, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35180, first_reward={{17004,120},{17011,20}}, auto_reward={{17004,15},{17011,1}}, power=3008184, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=8},
		[11] = {group=17, id=11, limit={{5,5}}, limit_desc="本关需上阵5位暗系英雄", unit_id=35471, first_reward={{17004,125},{17011,22}}, auto_reward={{17004,16},{17011,1}}, power=5000000, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=9},
		[12] = {group=17, id=12, limit={{5,5}}, limit_desc="本关需上阵5位暗系英雄", unit_id=35472, first_reward={{17004,130},{17011,24}}, auto_reward={{17004,18},{17011,1}}, power=6000000, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=10},
	},
	[18] = {
		[1] = {group=18, id=1, limit={{5,1}}, limit_desc="本关需上阵1位暗系英雄", unit_id=35181, first_reward={{17004,30},{17011,2}}, auto_reward={{17004,5},{17011,1}}, power=440583, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[2] = {group=18, id=2, limit={{5,2}}, limit_desc="本关需上阵2位暗系英雄", unit_id=35182, first_reward={{17004,35},{17011,4}}, auto_reward={{17004,6},{17011,1}}, power=798253, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[3] = {group=18, id=3, limit={{5,2}}, limit_desc="本关需上阵2位暗系英雄", unit_id=35183, first_reward={{17004,40},{17011,6}}, auto_reward={{17004,7},{17011,1}}, power=1203092, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[4] = {group=18, id=4, limit={{5,3}}, limit_desc="本关需上阵3位暗系英雄", unit_id=35184, first_reward={{17004,45},{17011,8}}, auto_reward={{17004,8},{17011,1}}, power=1345660, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[5] = {group=18, id=5, limit={{5,3}}, limit_desc="本关需上阵3位暗系英雄", unit_id=35185, first_reward={{17004,50},{17011,10}}, auto_reward={{17004,9},{17011,1}}, power=1630794, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[6] = {group=18, id=6, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35186, first_reward={{17004,55},{17011,12}}, auto_reward={{17004,10},{17011,1}}, power=1883784, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=0},
		[7] = {group=18, id=7, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35187, first_reward={{17004,65},{17011,14}}, auto_reward={{17004,11},{17011,1}}, power=2164884, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=5},
		[8] = {group=18, id=8, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35188, first_reward={{17004,80},{17011,16}}, auto_reward={{17004,12},{17011,1}}, power=2445984, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=6},
		[9] = {group=18, id=9, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35189, first_reward={{17004,100},{17011,18}}, auto_reward={{17004,13},{17011,1}}, power=2727084, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=7},
		[10] = {group=18, id=10, limit={{5,4}}, limit_desc="本关需上阵4位暗系英雄", unit_id=35190, first_reward={{17004,120},{17011,20}}, auto_reward={{17004,15},{17011,1}}, power=3008184, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=8},
		[11] = {group=18, id=11, limit={{5,5}}, limit_desc="本关需上阵5位暗系英雄", unit_id=35476, first_reward={{17004,125},{17011,22}}, auto_reward={{17004,16},{17011,1}}, power=5000000, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=9},
		[12] = {group=18, id=12, limit={{5,5}}, limit_desc="本关需上阵5位暗系英雄", unit_id=35477, first_reward={{17004,130},{17011,24}}, auto_reward={{17004,18},{17011,1}}, power=6000000, camp_skill={{5,601001},{1,601002},{2,601002},{3,601002},{4,601002}}, limit_dun_id=10},
	},
	[9] = {
		[1] = {group=9, id=1, limit={{4,1}}, limit_desc="本关需上阵1位光系英雄", unit_id=35091, first_reward={{17005,30},{17011,2}}, auto_reward={{17005,5},{17011,1}}, power=440583, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=9, id=2, limit={{4,2}}, limit_desc="本关需上阵2位光系英雄", unit_id=35092, first_reward={{17005,35},{17011,4}}, auto_reward={{17005,6},{17011,1}}, power=798253, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=9, id=3, limit={{4,2}}, limit_desc="本关需上阵2位光系英雄", unit_id=35093, first_reward={{17005,40},{17011,6}}, auto_reward={{17005,7},{17011,1}}, power=1203092, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=9, id=4, limit={{4,3}}, limit_desc="本关需上阵3位光系英雄", unit_id=35094, first_reward={{17005,45},{17011,8}}, auto_reward={{17005,8},{17011,1}}, power=1345660, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=9, id=5, limit={{4,3}}, limit_desc="本关需上阵3位光系英雄", unit_id=35095, first_reward={{17005,50},{17011,10}}, auto_reward={{17005,9},{17011,1}}, power=1630794, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=9, id=6, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35096, first_reward={{17005,55},{17011,12}}, auto_reward={{17005,10},{17011,1}}, power=1883784, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=9, id=7, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35097, first_reward={{17005,65},{17011,14}}, auto_reward={{17005,11},{17011,1}}, power=2164884, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=9, id=8, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35098, first_reward={{17005,80},{17011,16}}, auto_reward={{17005,12},{17011,1}}, power=2445984, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=9, id=9, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35099, first_reward={{17005,100},{17011,18}}, auto_reward={{17005,13},{17011,1}}, power=2727084, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=9, id=10, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35100, first_reward={{17005,120},{17011,20}}, auto_reward={{17005,15},{17011,1}}, power=3008184, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=9, id=11, limit={{4,5}}, limit_desc="本关需上阵5位光系英雄", unit_id=35481, first_reward={{17005,125},{17011,22}}, auto_reward={{17005,16},{17011,1}}, power=5000000, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=9, id=12, limit={{4,5}}, limit_desc="本关需上阵5位光系英雄", unit_id=35482, first_reward={{17005,130},{17011,24}}, auto_reward={{17005,18},{17011,1}}, power=6000000, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=10},
	},
	[10] = {
		[1] = {group=10, id=1, limit={{4,1}}, limit_desc="本关需上阵1位光系英雄", unit_id=35101, first_reward={{17005,30},{17011,2}}, auto_reward={{17005,5},{17011,1}}, power=440583, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=10, id=2, limit={{4,2}}, limit_desc="本关需上阵2位光系英雄", unit_id=35102, first_reward={{17005,35},{17011,4}}, auto_reward={{17005,6},{17011,1}}, power=798253, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=10, id=3, limit={{4,2}}, limit_desc="本关需上阵2位光系英雄", unit_id=35103, first_reward={{17005,40},{17011,6}}, auto_reward={{17005,7},{17011,1}}, power=1203092, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=10, id=4, limit={{4,3}}, limit_desc="本关需上阵3位光系英雄", unit_id=35104, first_reward={{17005,45},{17011,8}}, auto_reward={{17005,8},{17011,1}}, power=1345660, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=10, id=5, limit={{4,3}}, limit_desc="本关需上阵3位光系英雄", unit_id=35105, first_reward={{17005,50},{17011,10}}, auto_reward={{17005,9},{17011,1}}, power=1630794, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=10, id=6, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35106, first_reward={{17005,55},{17011,12}}, auto_reward={{17005,10},{17011,1}}, power=1883784, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=10, id=7, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35107, first_reward={{17005,65},{17011,14}}, auto_reward={{17005,11},{17011,1}}, power=2164884, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=10, id=8, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35108, first_reward={{17005,80},{17011,16}}, auto_reward={{17005,12},{17011,1}}, power=2445984, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=10, id=9, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35109, first_reward={{17005,100},{17011,18}}, auto_reward={{17005,13},{17011,1}}, power=2727084, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=10, id=10, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35110, first_reward={{17005,120},{17011,20}}, auto_reward={{17005,15},{17011,1}}, power=3008184, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=10, id=11, limit={{4,5}}, limit_desc="本关需上阵5位光系英雄", unit_id=35486, first_reward={{17005,125},{17011,22}}, auto_reward={{17005,16},{17011,1}}, power=5000000, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=10, id=12, limit={{4,5}}, limit_desc="本关需上阵5位光系英雄", unit_id=35487, first_reward={{17005,130},{17011,24}}, auto_reward={{17005,18},{17011,1}}, power=6000000, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=10},
	},
	[19] = {
		[1] = {group=19, id=1, limit={{4,1}}, limit_desc="本关需上阵1位光系英雄", unit_id=35191, first_reward={{17005,30},{17011,2}}, auto_reward={{17005,5},{17011,1}}, power=440583, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=19, id=2, limit={{4,2}}, limit_desc="本关需上阵2位光系英雄", unit_id=35192, first_reward={{17005,35},{17011,4}}, auto_reward={{17005,6},{17011,1}}, power=798253, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=19, id=3, limit={{4,2}}, limit_desc="本关需上阵2位光系英雄", unit_id=35193, first_reward={{17005,40},{17011,6}}, auto_reward={{17005,7},{17011,1}}, power=1203092, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=19, id=4, limit={{4,3}}, limit_desc="本关需上阵3位光系英雄", unit_id=35194, first_reward={{17005,45},{17011,8}}, auto_reward={{17005,8},{17011,1}}, power=1345660, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=19, id=5, limit={{4,3}}, limit_desc="本关需上阵3位光系英雄", unit_id=35195, first_reward={{17005,50},{17011,10}}, auto_reward={{17005,9},{17011,1}}, power=1630794, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=19, id=6, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35196, first_reward={{17005,55},{17011,12}}, auto_reward={{17005,10},{17011,1}}, power=1883784, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=19, id=7, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35197, first_reward={{17005,65},{17011,14}}, auto_reward={{17005,11},{17011,1}}, power=2164884, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=19, id=8, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35198, first_reward={{17005,80},{17011,16}}, auto_reward={{17005,12},{17011,1}}, power=2445984, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=19, id=9, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35199, first_reward={{17005,100},{17011,18}}, auto_reward={{17005,13},{17011,1}}, power=2727084, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=19, id=10, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35200, first_reward={{17005,120},{17011,20}}, auto_reward={{17005,15},{17011,1}}, power=3008184, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=19, id=11, limit={{4,5}}, limit_desc="本关需上阵5位光系英雄", unit_id=35491, first_reward={{17005,125},{17011,22}}, auto_reward={{17005,16},{17011,1}}, power=5000000, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=19, id=12, limit={{4,5}}, limit_desc="本关需上阵5位光系英雄", unit_id=35492, first_reward={{17005,130},{17011,24}}, auto_reward={{17005,18},{17011,1}}, power=6000000, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=10},
	},
	[20] = {
		[1] = {group=20, id=1, limit={{4,1}}, limit_desc="本关需上阵1位光系英雄", unit_id=35201, first_reward={{17005,30},{17011,2}}, auto_reward={{17005,5},{17011,1}}, power=440583, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[2] = {group=20, id=2, limit={{4,2}}, limit_desc="本关需上阵2位光系英雄", unit_id=35202, first_reward={{17005,35},{17011,4}}, auto_reward={{17005,6},{17011,1}}, power=798253, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[3] = {group=20, id=3, limit={{4,2}}, limit_desc="本关需上阵2位光系英雄", unit_id=35203, first_reward={{17005,40},{17011,6}}, auto_reward={{17005,7},{17011,1}}, power=1203092, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[4] = {group=20, id=4, limit={{4,3}}, limit_desc="本关需上阵3位光系英雄", unit_id=35204, first_reward={{17005,45},{17011,8}}, auto_reward={{17005,8},{17011,1}}, power=1345660, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[5] = {group=20, id=5, limit={{4,3}}, limit_desc="本关需上阵3位光系英雄", unit_id=35205, first_reward={{17005,50},{17011,10}}, auto_reward={{17005,9},{17011,1}}, power=1630794, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[6] = {group=20, id=6, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35206, first_reward={{17005,55},{17011,12}}, auto_reward={{17005,10},{17011,1}}, power=1883784, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=0},
		[7] = {group=20, id=7, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35207, first_reward={{17005,65},{17011,14}}, auto_reward={{17005,11},{17011,1}}, power=2164884, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=5},
		[8] = {group=20, id=8, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35208, first_reward={{17005,80},{17011,16}}, auto_reward={{17005,12},{17011,1}}, power=2445984, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=6},
		[9] = {group=20, id=9, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35209, first_reward={{17005,100},{17011,18}}, auto_reward={{17005,13},{17011,1}}, power=2727084, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=7},
		[10] = {group=20, id=10, limit={{4,4}}, limit_desc="本关需上阵4位光系英雄", unit_id=35210, first_reward={{17005,120},{17011,20}}, auto_reward={{17005,15},{17011,1}}, power=3008184, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=8},
		[11] = {group=20, id=11, limit={{4,5}}, limit_desc="本关需上阵5位光系英雄", unit_id=35496, first_reward={{17005,125},{17011,22}}, auto_reward={{17005,16},{17011,1}}, power=5000000, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=9},
		[12] = {group=20, id=12, limit={{4,5}}, limit_desc="本关需上阵5位光系英雄", unit_id=35497, first_reward={{17005,130},{17011,24}}, auto_reward={{17005,18},{17011,1}}, power=6000000, camp_skill={{4,601001},{1,601002},{2,601002},{3,601002},{5,601002}}, limit_dun_id=10},
	},
}
-- -------------------customs_end---------------------


-- -------------------buy_count_start-------------------
Config.ElementTempleData.data_buy_count_length = 2
Config.ElementTempleData.data_buy_count = {
	[1] = {num=1, vip=0, cost=50},
	[2] = {num=2, vip=0, cost=100}
}
Config.ElementTempleData.data_buy_count_fun = function(key)
	local data=Config.ElementTempleData.data_buy_count[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ElementTempleData.data_buy_count['..key..'])not found') return
	end
	return data
end
-- -------------------buy_count_end---------------------


-- -------------------privilege_start-------------------
Config.ElementTempleData.data_privilege_length = 6
Config.ElementTempleData.data_privilege = {
	[1] = 100,
	[2] = 100,
	[3] = 100,
	[4] = 100,
	[5] = 150,
	[6] = 150
}
Config.ElementTempleData.data_privilege_fun = function(key)
	local data=Config.ElementTempleData.data_privilege[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ElementTempleData.data_privilege['..key..'])not found') return
	end
	return data
end
-- -------------------privilege_end---------------------


-- -------------------award_start-------------------
Config.ElementTempleData.data_award_length = 6
Config.ElementTempleData.data_award = {
{min=1, max=1, items={{39010,100},{3,300}}},
{min=2, max=2, items={{39010,80},{3,250}}},
{min=3, max=3, items={{39010,65},{3,200}}},
{min=4, max=10, items={{39010,50},{3,160}}},
{min=11, max=20, items={{39010,40},{3,130}}},
{min=21, max=50, items={{39010,30},{3,100}}}
}
-- -------------------award_end---------------------


-- -------------------monster_start-------------------
Config.ElementTempleData.data_monster_length = 20
Config.ElementTempleData.data_monster = {
	[1] = {group=1, name="冰雪女王", bust_id=10036, head_id=10502, attr_desc="风系英雄额外造成50%伤害", skill_list={924401,924402,924403}, combat_desc="非风系英雄在战斗时攻击力下降50%"},
	[2] = {group=2, name="泰坦", bust_id=10083, head_id=10504, attr_desc="风系英雄额外造成50%伤害", skill_list={925201,925202,925203}, combat_desc="非风系英雄在战斗时攻击力下降50%"},
	[3] = {group=3, name="炎魔之王", bust_id=10008, head_id=20502, attr_desc="水系英雄额外造成50%伤害", skill_list={920401,920402,920403}, combat_desc="非水系英雄在战斗时攻击力下降50%"},
	[4] = {group=4, name="普罗米修斯", bust_id=10078, head_id=20507, attr_desc="水系英雄额外造成50%伤害", skill_list={921401,921402,921403}, combat_desc="非水系英雄在战斗时攻击力下降50%"},
	[5] = {group=5, name="影刹", bust_id=10086, head_id=30502, attr_desc="火系英雄额外造成50%伤害", skill_list={923401,923402,923403}, combat_desc="非火系英雄在战斗时攻击力下降50%"},
	[6] = {group=6, name="雅典娜", bust_id=10010, head_id=30506, attr_desc="火系英雄额外造成50%伤害", skill_list={922401,922402,922403}, combat_desc="非火系英雄在战斗时攻击力下降50%"},
	[7] = {group=7, name="赫拉", bust_id=10027, head_id=40503, attr_desc="暗系英雄额外造成50%伤害", skill_list={926201,926202,926203}, combat_desc="非暗系英雄在战斗时攻击力下降50%"},
	[8] = {group=8, name="雷神", bust_id=10075, head_id=40504, attr_desc="暗系英雄额外造成50%伤害", skill_list={927301,927302,927303}, combat_desc="非暗系英雄在战斗时攻击力下降50%"},
	[9] = {group=9, name="阿努比斯", bust_id=10067, head_id=50505, attr_desc="光系英雄额外造成50%伤害", skill_list={928401,928402,928403}, combat_desc="非光系英雄在战斗时攻击力下降50%"},
	[10] = {group=10, name="黑暗之主", bust_id=10044, head_id=50504, attr_desc="光系英雄额外造成50%伤害", skill_list={929401,929402,929403}, combat_desc="非光系英雄在战斗时攻击力下降50%"},
	[11] = {group=11, name="耶梦加得", bust_id=10089, head_id=10510, attr_desc="风系英雄额外造成50%伤害", skill_list={933901,933902,933903}, combat_desc="非风系英雄在战斗时攻击力下降50%"},
	[12] = {group=12, name="少年梅林", bust_id=10030, head_id=10507, attr_desc="风系英雄额外造成50%伤害", skill_list={934901,934902,934903}, combat_desc="非风系英雄在战斗时攻击力下降50%"},
	[13] = {group=13, name="洛基", bust_id=10088, head_id=20509, attr_desc="水系英雄额外造成50%伤害", skill_list={931901,931902,931903}, combat_desc="非水系英雄在战斗时攻击力下降50%"},
	[14] = {group=14, name="菲尼克斯", bust_id=10032, head_id=20504, attr_desc="水系英雄额外造成50%伤害", skill_list={932901,932902,932903}, combat_desc="非水系英雄在战斗时攻击力下降50%"},
	[15] = {group=15, name="斯芬克斯", bust_id=10081, head_id=30508, attr_desc="火系英雄额外造成50%伤害", skill_list={935901,935902,935903}, combat_desc="非火系英雄在战斗时攻击力下降50%"},
	[16] = {group=16, name="奥丁", bust_id=10039, head_id=30501, attr_desc="火系英雄额外造成50%伤害", skill_list={936901,936902,936903}, combat_desc="非火系英雄在战斗时攻击力下降50%"},
	[17] = {group=17, name="宙斯", bust_id=10001, head_id=40502, attr_desc="暗系英雄额外造成50%伤害", skill_list={937901,937902,937903}, combat_desc="非暗系英雄在战斗时攻击力下降50%"},
	[18] = {group=18, name="艾蕾莉亚", bust_id=10068, head_id=40506, attr_desc="暗系英雄额外造成50%伤害", skill_list={938901,938902,938903}, combat_desc="非暗系英雄在战斗时攻击力下降50%"},
	[19] = {group=19, name="亚巴顿", bust_id=10085, head_id=50503, attr_desc="光系英雄额外造成50%伤害", skill_list={939901,939902,939903}, combat_desc="非光系英雄在战斗时攻击力下降50%"},
	[20] = {group=20, name="潘多拉", bust_id=10069, head_id=50507, attr_desc="光系英雄额外造成50%伤害", skill_list={940901,940902,940903}, combat_desc="非光系英雄在战斗时攻击力下降50%"}
}
Config.ElementTempleData.data_monster_fun = function(key)
	local data=Config.ElementTempleData.data_monster[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ElementTempleData.data_monster['..key..'])not found') return
	end
	return data
end
-- -------------------monster_end---------------------


-- -------------------explain_start-------------------
Config.ElementTempleData.data_explain_length = 3
Config.ElementTempleData.data_explain = {
	[1] = {id=1, title="元素圣殿", desc="1.共有水、火、风、光、暗5大圣殿副本，周一至周五轮流开启，周末所有圣殿副本将全部开启\n2.每个圣殿共有12层，每层通关后可开启对应的扫荡\n3.周末副本开启时，将继承周一至周五各个副本的进度\n4.每周一0点副本将重置，所有副本进度将被清空\n5.圣殿中获得的材料可用于各个元素圣物的升级和进阶"},
	[2] = {id=2, title="挑战次数", desc="1.挑战次数为所有副本共用\n2.挑战失败不消耗次数\n3.挑战次数每日0点更新\n4.每天可消耗钻石额外购买2次挑战次数。"},
	[3] = {id=3, title="排行榜", desc="1.每周记录玩家所有圣殿的通关总次数，扫荡不计入统计\n2.每周一0点将根据排行榜的排名发放对应奖励，同时重置通关数"}
}
Config.ElementTempleData.data_explain_fun = function(key)
	local data=Config.ElementTempleData.data_explain[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ElementTempleData.data_explain['..key..'])not found') return
	end
	return data
end
-- -------------------explain_end---------------------

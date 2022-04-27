----------------------------------------------------
-- 此文件由数据工具生成
-- 伙伴装备配置数据--partner_skill_data.xml
--------------------------------------

Config = Config or {} 
Config.PartnerSkillData = Config.PartnerSkillData or {}

-- -------------------partner_skill_const_start-------------------
Config.PartnerSkillData.data_partner_skill_const_length = 2
Config.PartnerSkillData.data_partner_skill_const = {
	["skill_slot"] = {code="skill_slot", val={'star',6}, desc="天赋栏开启条件"},
	["skill_rule"] = {code="skill_rule", val=1, desc="1.每个天赋栏可消耗对应的技能符石使英雄领悟对应技能，技能符石可在[技能商店]中消耗符文精华购买\n2.领悟了的技能可消耗对应技能符石进行升级\n3.可通过[遗忘]技能来重新领悟技能\n4.[遗忘]技能后，将根据技能等级返还一定的符文精华\n5.若领悟的技能与符文携带的技能为同类型，则优先且只生效高级别的技能"}
}
Config.PartnerSkillData.data_partner_skill_const_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_skill_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_skill_const['..key..'])not found') return
	end
	return data
end
-- -------------------partner_skill_const_end---------------------


-- -------------------partner_skill_pos_start-------------------
Config.PartnerSkillData.data_partner_skill_pos_length = 3
Config.PartnerSkillData.data_partner_skill_pos = {
	[1] = {pos=1, pos_limit={'star',6}},
	[2] = {pos=2, pos_limit={'star',11}},
	[3] = {pos=3, pos_limit={'star',13}}
}
Config.PartnerSkillData.data_partner_skill_pos_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_skill_pos[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_skill_pos['..key..'])not found') return
	end
	return data
end
-- -------------------partner_skill_pos_end---------------------


-- -------------------partner_skill_learn_start-------------------
Config.PartnerSkillData.data_partner_skill_learn_length = 55
Config.PartnerSkillData.data_partner_skill_learn = {
	[700001] = {id=700001, expend={{16001,1}}, order=1, order_magician=2, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700011] = {id=700011, expend={{16002,1}}, order=2, order_magician=1000, order_warrior=5, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700021] = {id=700021, expend={{16003,1}}, order=3, order_magician=1000, order_warrior=6, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700031] = {id=700031, expend={{16004,1}}, order=4, order_magician=1000, order_warrior=7, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700041] = {id=700041, expend={{16005,1}}, order=5, order_magician=1000, order_warrior=8, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700051] = {id=700051, expend={{16006,1}}, order=6, order_magician=10, order_warrior=10, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700061] = {id=700061, expend={{16007,1}}, order=7, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700071] = {id=700071, expend={{16008,1}}, order=8, order_magician=9, order_warrior=1000, order_tank=10, order_ssistant=10, limit_career={}},
	[700081] = {id=700081, expend={{16009,1}}, order=9, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700091] = {id=700091, expend={{16010,1}}, order=10, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700101] = {id=700101, expend={{16011,1}}, order=11, order_magician=8, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700111] = {id=700111, expend={{16012,1}}, order=12, order_magician=7, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700121] = {id=700121, expend={{16013,1}}, order=13, order_magician=6, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700131] = {id=700131, expend={{16014,1}}, order=14, order_magician=1000, order_warrior=4, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700141] = {id=700141, expend={{16015,1}}, order=15, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700151] = {id=700151, expend={{16016,1}}, order=16, order_magician=5, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700161] = {id=700161, expend={{16017,1}}, order=17, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700171] = {id=700171, expend={{16018,1}}, order=18, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=7, limit_career={}},
	[700181] = {id=700181, expend={{16019,1}}, order=19, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700191] = {id=700191, expend={{16020,1}}, order=20, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700201] = {id=700201, expend={{16021,1}}, order=21, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=5, limit_career={}},
	[700211] = {id=700211, expend={{16022,1}}, order=22, order_magician=1000, order_warrior=1000, order_tank=6, order_ssistant=6, limit_career={}},
	[700221] = {id=700221, expend={{16023,1}}, order=23, order_magician=1000, order_warrior=1000, order_tank=9, order_ssistant=8, limit_career={}},
	[700231] = {id=700231, expend={{16024,1}}, order=24, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700241] = {id=700241, expend={{16025,1}}, order=25, order_magician=1000, order_warrior=1000, order_tank=5, order_ssistant=1000, limit_career={}},
	[700251] = {id=700251, expend={{16026,1}}, order=26, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700261] = {id=700261, expend={{16027,1}}, order=27, order_magician=1000, order_warrior=1000, order_tank=4, order_ssistant=1000, limit_career={}},
	[700271] = {id=700271, expend={{16028,1}}, order=28, order_magician=1000, order_warrior=1000, order_tank=3, order_ssistant=1000, limit_career={}},
	[700291] = {id=700291, expend={{16029,1}}, order=29, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1, limit_career={}},
	[700301] = {id=700301, expend={{16030,1}}, order=30, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700311] = {id=700311, expend={{16031,1}}, order=31, order_magician=3, order_warrior=3, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700321] = {id=700321, expend={{16032,1}}, order=32, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[750000] = {id=750000, expend={{16033,1}}, order=33, order_magician=1, order_warrior=1000, order_tank=1000, order_ssistant=2, limit_career={}},
	[750100] = {id=750100, expend={{16034,1}}, order=34, order_magician=1000, order_warrior=1000, order_tank=8, order_ssistant=9, limit_career={}},
	[750200] = {id=750200, expend={{16035,1}}, order=35, order_magician=1000, order_warrior=1, order_tank=1000, order_ssistant=1000, limit_career={}},
	[750400] = {id=750400, expend={{16036,1}}, order=36, order_magician=1000, order_warrior=2, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700281] = {id=700281, expend={{16037,1}}, order=37, order_magician=1000, order_warrior=1000, order_tank=7, order_ssistant=3, limit_career={}},
	[700361] = {id=700361, expend={{16038,1}}, order=38, order_magician=1000, order_warrior=1000, order_tank=1, order_ssistant=1000, limit_career={}},
	[700371] = {id=700371, expend={{16039,1}}, order=39, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=4, limit_career={}},
	[700381] = {id=700381, expend={{16040,1}}, order=40, order_magician=1000, order_warrior=1000, order_tank=2, order_ssistant=1000, limit_career={}},
	[700391] = {id=700391, expend={{16041,1}}, order=41, order_magician=1000, order_warrior=9, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700401] = {id=700401, expend={{16042,1}}, order=42, order_magician=4, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700411] = {id=700411, expend={{16043,1}}, order=43, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700421] = {id=700421, expend={{16044,1}}, order=44, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700431] = {id=700431, expend={{16045,1}}, order=45, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700441] = {id=700441, expend={{16046,1}}, order=46, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[700451] = {id=700451, expend={{16047,1}}, order=47, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={}},
	[701001] = {id=701001, expend={{16101,1}}, order=1000, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={{3}}},
	[701011] = {id=701011, expend={{16102,1}}, order=1001, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={{3}}},
	[701021] = {id=701021, expend={{16103,1}}, order=1002, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={{2}}},
	[701031] = {id=701031, expend={{16104,1}}, order=1003, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={{2}}},
	[701041] = {id=701041, expend={{16105,1}}, order=1004, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={{4}}},
	[701051] = {id=701051, expend={{16106,1}}, order=1005, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={{4}}},
	[701061] = {id=701061, expend={{16107,1}}, order=1006, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={{5}}},
	[701071] = {id=701071, expend={{16108,1}}, order=1007, order_magician=1000, order_warrior=1000, order_tank=1000, order_ssistant=1000, limit_career={{5}}}
}
Config.PartnerSkillData.data_partner_skill_learn_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_skill_learn[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_skill_learn['..key..'])not found') return
	end
	return data
end
-- -------------------partner_skill_learn_end---------------------


-- -------------------partner_commend_skill_start-------------------
Config.PartnerSkillData.data_partner_commend_skill_length = 7
Config.PartnerSkillData.data_partner_commend_skill = {
  [20507] = {700291,750000,700281,700361,700201,700211,700171,700221,750100,700071},
  [40507] = {700291,700371,700281,700361,700201,700211,700171,700221,750100,700071},
  [40509] = {700291,700231,700281,700361,700201,700211,700171,700221,750100,700071},
  [40502] = {750000,700001,700321,700311,700151,700121,700111,700101,700071,700141},
  [40503] = {750000,700001,700311,700401,700131,700121,700111,700101,700071,700051},
  [30511] = {700071,750200,700281,700421,700151,700171,700251,700221,700311},
  [10510] = {750000,700001,700311,700401,700051,700041,700111,700191,700071,700051}
}
-- -------------------partner_commend_skill_end---------------------


-- -------------------partner_skill_level_start-------------------
Config.PartnerSkillData.data_partner_skill_level_length = 110
Config.PartnerSkillData.data_partner_skill_level = {
	[700001] = {id=700001, next_id=700003, expend={{16001,3},{10450,10000}}},
	[700011] = {id=700011, next_id=700013, expend={{16002,3},{10450,10000}}},
	[700021] = {id=700021, next_id=700023, expend={{16003,3},{10450,10000}}},
	[700031] = {id=700031, next_id=700033, expend={{16004,3},{10450,10000}}},
	[700041] = {id=700041, next_id=700043, expend={{16005,3},{10450,10000}}},
	[700051] = {id=700051, next_id=700053, expend={{16006,3},{10450,10000}}},
	[700061] = {id=700061, next_id=700063, expend={{16007,3},{10450,10000}}},
	[700071] = {id=700071, next_id=700073, expend={{16008,3},{10450,10000}}},
	[700081] = {id=700081, next_id=700083, expend={{16009,3},{10450,10000}}},
	[700091] = {id=700091, next_id=700093, expend={{16010,3},{10450,10000}}},
	[700101] = {id=700101, next_id=700103, expend={{16011,3},{10450,10000}}},
	[700111] = {id=700111, next_id=700113, expend={{16012,3},{10450,10000}}},
	[700121] = {id=700121, next_id=700123, expend={{16013,3},{10450,10000}}},
	[700131] = {id=700131, next_id=700133, expend={{16014,3},{10450,10000}}},
	[700141] = {id=700141, next_id=700143, expend={{16015,3},{10450,10000}}},
	[700151] = {id=700151, next_id=700153, expend={{16016,3},{10450,10000}}},
	[700161] = {id=700161, next_id=700163, expend={{16017,3},{10450,10000}}},
	[700171] = {id=700171, next_id=700173, expend={{16018,3},{10450,10000}}},
	[700181] = {id=700181, next_id=700183, expend={{16019,3},{10450,10000}}},
	[700191] = {id=700191, next_id=700193, expend={{16020,3},{10450,10000}}},
	[700201] = {id=700201, next_id=700203, expend={{16021,3},{10450,10000}}},
	[700211] = {id=700211, next_id=700213, expend={{16022,3},{10450,10000}}},
	[700221] = {id=700221, next_id=700223, expend={{16023,3},{10450,10000}}},
	[700231] = {id=700231, next_id=700233, expend={{16024,3},{10450,10000}}},
	[700241] = {id=700241, next_id=700243, expend={{16025,3},{10450,10000}}},
	[700251] = {id=700251, next_id=700253, expend={{16026,3},{10450,10000}}},
	[700261] = {id=700261, next_id=700263, expend={{16027,3},{10450,10000}}},
	[700271] = {id=700271, next_id=700273, expend={{16028,3},{10450,10000}}},
	[700291] = {id=700291, next_id=700293, expend={{16029,3},{10450,10000}}},
	[700301] = {id=700301, next_id=700303, expend={{16030,3},{10450,10000}}},
	[700311] = {id=700311, next_id=700313, expend={{16031,3},{10450,10000}}},
	[700321] = {id=700321, next_id=700323, expend={{16032,3},{10450,10000}}},
	[750000] = {id=750000, next_id=750001, expend={{16033,3},{10450,10000}}},
	[750100] = {id=750100, next_id=750101, expend={{16034,3},{10450,10000}}},
	[750200] = {id=750200, next_id=750201, expend={{16035,3},{10450,10000}}},
	[750400] = {id=750400, next_id=750401, expend={{16036,3},{10450,10000}}},
	[700281] = {id=700281, next_id=700283, expend={{16037,3},{10450,10000}}},
	[700361] = {id=700361, next_id=700363, expend={{16038,3},{10450,10000}}},
	[700371] = {id=700371, next_id=700373, expend={{16039,3},{10450,10000}}},
	[700381] = {id=700381, next_id=700383, expend={{16040,3},{10450,10000}}},
	[700391] = {id=700391, next_id=700393, expend={{16041,3},{10450,10000}}},
	[700401] = {id=700401, next_id=700403, expend={{16042,3},{10450,10000}}},
	[700411] = {id=700411, next_id=700413, expend={{16043,3},{10450,10000}}},
	[700421] = {id=700421, next_id=700423, expend={{16044,3},{10450,10000}}},
	[700431] = {id=700431, next_id=700433, expend={{16045,3},{10450,10000}}},
	[700441] = {id=700441, next_id=700443, expend={{16046,3},{10450,10000}}},
	[700451] = {id=700451, next_id=700453, expend={{16047,3},{10450,10000}}},
	[701001] = {id=701001, next_id=701003, expend={{16101,3},{10460,10}}},
	[701011] = {id=701011, next_id=701013, expend={{16102,3},{10460,10}}},
	[701021] = {id=701021, next_id=701023, expend={{16103,3},{10460,10}}},
	[701031] = {id=701031, next_id=701033, expend={{16104,3},{10460,10}}},
	[701041] = {id=701041, next_id=701043, expend={{16105,3},{10460,10}}},
	[701051] = {id=701051, next_id=701053, expend={{16106,3},{10460,10}}},
	[701061] = {id=701061, next_id=701063, expend={{16107,3},{10460,10}}},
	[701071] = {id=701071, next_id=701073, expend={{16108,3},{10460,10}}},
	[700003] = {id=700003, next_id=700005, expend={{16001,5},{10450,20000}}},
	[700013] = {id=700013, next_id=700015, expend={{16002,5},{10450,20000}}},
	[700023] = {id=700023, next_id=700025, expend={{16003,5},{10450,20000}}},
	[700033] = {id=700033, next_id=700035, expend={{16004,5},{10450,20000}}},
	[700043] = {id=700043, next_id=700045, expend={{16005,5},{10450,20000}}},
	[700053] = {id=700053, next_id=700055, expend={{16006,5},{10450,20000}}},
	[700063] = {id=700063, next_id=700065, expend={{16007,5},{10450,20000}}},
	[700073] = {id=700073, next_id=700075, expend={{16008,5},{10450,20000}}},
	[700083] = {id=700083, next_id=700085, expend={{16009,5},{10450,20000}}},
	[700093] = {id=700093, next_id=700095, expend={{16010,5},{10450,20000}}},
	[700103] = {id=700103, next_id=700105, expend={{16011,5},{10450,20000}}},
	[700113] = {id=700113, next_id=700115, expend={{16012,5},{10450,20000}}},
	[700123] = {id=700123, next_id=700125, expend={{16013,5},{10450,20000}}},
	[700133] = {id=700133, next_id=700135, expend={{16014,5},{10450,20000}}},
	[700143] = {id=700143, next_id=700145, expend={{16015,5},{10450,20000}}},
	[700153] = {id=700153, next_id=700155, expend={{16016,5},{10450,20000}}},
	[700163] = {id=700163, next_id=700165, expend={{16017,5},{10450,20000}}},
	[700173] = {id=700173, next_id=700175, expend={{16018,5},{10450,20000}}},
	[700183] = {id=700183, next_id=700185, expend={{16019,5},{10450,20000}}},
	[700193] = {id=700193, next_id=700195, expend={{16020,5},{10450,20000}}},
	[700203] = {id=700203, next_id=700205, expend={{16021,5},{10450,20000}}},
	[700213] = {id=700213, next_id=700215, expend={{16022,5},{10450,20000}}},
	[700223] = {id=700223, next_id=700225, expend={{16023,5},{10450,20000}}},
	[700233] = {id=700233, next_id=700235, expend={{16024,5},{10450,20000}}},
	[700243] = {id=700243, next_id=700245, expend={{16025,5},{10450,20000}}},
	[700253] = {id=700253, next_id=700255, expend={{16026,5},{10450,20000}}},
	[700263] = {id=700263, next_id=700265, expend={{16027,5},{10450,20000}}},
	[700273] = {id=700273, next_id=700275, expend={{16028,5},{10450,20000}}},
	[700293] = {id=700293, next_id=700295, expend={{16029,5},{10450,20000}}},
	[700303] = {id=700303, next_id=700305, expend={{16030,5},{10450,20000}}},
	[700313] = {id=700313, next_id=700315, expend={{16031,5},{10450,20000}}},
	[700323] = {id=700323, next_id=700325, expend={{16032,5},{10450,20000}}},
	[750001] = {id=750001, next_id=750002, expend={{16033,5},{10450,20000}}},
	[750101] = {id=750101, next_id=750102, expend={{16034,5},{10450,20000}}},
	[750201] = {id=750201, next_id=750202, expend={{16035,5},{10450,20000}}},
	[750401] = {id=750401, next_id=750402, expend={{16036,5},{10450,20000}}},
	[700283] = {id=700283, next_id=700285, expend={{16037,5},{10450,20000}}},
	[700363] = {id=700363, next_id=700365, expend={{16038,5},{10450,20000}}},
	[700373] = {id=700373, next_id=700375, expend={{16039,5},{10450,20000}}},
	[700383] = {id=700383, next_id=700385, expend={{16040,5},{10450,20000}}},
	[700393] = {id=700393, next_id=700395, expend={{16041,5},{10450,20000}}},
	[700403] = {id=700403, next_id=700405, expend={{16042,5},{10450,20000}}},
	[700413] = {id=700413, next_id=700415, expend={{16043,5},{10450,20000}}},
	[700423] = {id=700423, next_id=700425, expend={{16044,5},{10450,20000}}},
	[700433] = {id=700433, next_id=700435, expend={{16045,5},{10450,20000}}},
	[700443] = {id=700443, next_id=700445, expend={{16046,5},{10450,20000}}},
	[700453] = {id=700453, next_id=700455, expend={{16047,5},{10450,20000}}},
	[701003] = {id=701003, next_id=701005, expend={{16101,5},{10460,20}}},
	[701013] = {id=701013, next_id=701015, expend={{16102,5},{10460,20}}},
	[701023] = {id=701023, next_id=701025, expend={{16103,5},{10460,20}}},
	[701033] = {id=701033, next_id=701035, expend={{16104,5},{10460,20}}},
	[701043] = {id=701043, next_id=701045, expend={{16105,5},{10460,20}}},
	[701053] = {id=701053, next_id=701055, expend={{16106,5},{10460,20}}},
	[701063] = {id=701063, next_id=701065, expend={{16107,5},{10460,20}}},
	[701073] = {id=701073, next_id=701075, expend={{16108,5},{10460,20}}}
}
Config.PartnerSkillData.data_partner_skill_level_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_skill_level[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_skill_level['..key..'])not found') return
	end
	return data
end
-- -------------------partner_skill_level_end---------------------


-- -------------------partner_skill_map_start-------------------
Config.PartnerSkillData.data_partner_skill_map_length = 110
Config.PartnerSkillData.data_partner_skill_map = {
	[700003] = 700001,
	[700013] = 700011,
	[700023] = 700021,
	[700033] = 700031,
	[700043] = 700041,
	[700053] = 700051,
	[700063] = 700061,
	[700073] = 700071,
	[700083] = 700081,
	[700093] = 700091,
	[700103] = 700101,
	[700113] = 700111,
	[700123] = 700121,
	[700133] = 700131,
	[700143] = 700141,
	[700153] = 700151,
	[700163] = 700161,
	[700173] = 700171,
	[700183] = 700181,
	[700193] = 700191,
	[700203] = 700201,
	[700213] = 700211,
	[700223] = 700221,
	[700233] = 700231,
	[700243] = 700241,
	[700253] = 700251,
	[700263] = 700261,
	[700273] = 700271,
	[700293] = 700291,
	[700303] = 700301,
	[700313] = 700311,
	[700323] = 700321,
	[750001] = 750000,
	[750101] = 750100,
	[750201] = 750200,
	[750401] = 750400,
	[700283] = 700281,
	[700363] = 700361,
	[700373] = 700371,
	[700383] = 700381,
	[700393] = 700391,
	[700403] = 700401,
	[700413] = 700411,
	[700423] = 700421,
	[700433] = 700431,
	[700443] = 700441,
	[700453] = 700451,
	[701003] = 701001,
	[701013] = 701011,
	[701023] = 701021,
	[701033] = 701031,
	[701043] = 701041,
	[701053] = 701051,
	[701063] = 701061,
	[701073] = 701071,
	[700005] = 700003,
	[700015] = 700013,
	[700025] = 700023,
	[700035] = 700033,
	[700045] = 700043,
	[700055] = 700053,
	[700065] = 700063,
	[700075] = 700073,
	[700085] = 700083,
	[700095] = 700093,
	[700105] = 700103,
	[700115] = 700113,
	[700125] = 700123,
	[700135] = 700133,
	[700145] = 700143,
	[700155] = 700153,
	[700165] = 700163,
	[700175] = 700173,
	[700185] = 700183,
	[700195] = 700193,
	[700205] = 700203,
	[700215] = 700213,
	[700225] = 700223,
	[700235] = 700233,
	[700245] = 700243,
	[700255] = 700253,
	[700265] = 700263,
	[700275] = 700273,
	[700295] = 700293,
	[700305] = 700303,
	[700315] = 700313,
	[700325] = 700323,
	[750002] = 750001,
	[750102] = 750101,
	[750202] = 750201,
	[750402] = 750401,
	[700285] = 700283,
	[700365] = 700363,
	[700375] = 700373,
	[700385] = 700383,
	[700395] = 700393,
	[700405] = 700403,
	[700415] = 700413,
	[700425] = 700423,
	[700435] = 700433,
	[700445] = 700443,
	[700455] = 700453,
	[701005] = 701003,
	[701015] = 701013,
	[701025] = 701023,
	[701035] = 701033,
	[701045] = 701043,
	[701055] = 701053,
	[701065] = 701063,
	[701075] = 701073
}
Config.PartnerSkillData.data_partner_skill_map_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_skill_map[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_skill_map['..key..'])not found') return
	end
	return data
end
-- -------------------partner_skill_map_end---------------------


-- -------------------partner_skill_back_start-------------------
Config.PartnerSkillData.data_partner_skill_back_length = 165
Config.PartnerSkillData.data_partner_skill_back = {
	[700001] = {expend={{3,100}}, award1={{10450,1375}}},
	[700011] = {expend={{3,100}}, award1={{10450,1375}}},
	[700021] = {expend={{3,100}}, award1={{10450,1250}}},
	[700031] = {expend={{3,100}}, award1={{10450,1250}}},
	[700041] = {expend={{3,100}}, award1={{10450,1375}}},
	[700051] = {expend={{3,100}}, award1={{10450,1375}}},
	[700061] = {expend={{3,100}}, award1={{10450,1250}}},
	[700071] = {expend={{3,100}}, award1={{10450,1500}}},
	[700081] = {expend={{3,100}}, award1={{10450,1000}}},
	[700091] = {expend={{3,100}}, award1={{10450,1000}}},
	[700101] = {expend={{3,100}}, award1={{10450,1000}}},
	[700111] = {expend={{3,100}}, award1={{10450,1000}}},
	[700121] = {expend={{3,100}}, award1={{10450,1000}}},
	[700131] = {expend={{3,100}}, award1={{10450,1000}}},
	[700141] = {expend={{3,100}}, award1={{10450,1250}}},
	[700151] = {expend={{3,100}}, award1={{10450,1000}}},
	[700161] = {expend={{3,100}}, award1={{10450,1000}}},
	[700171] = {expend={{3,100}}, award1={{10450,1375}}},
	[700181] = {expend={{3,100}}, award1={{10450,1250}}},
	[700191] = {expend={{3,100}}, award1={{10450,1250}}},
	[700201] = {expend={{3,100}}, award1={{10450,1375}}},
	[700211] = {expend={{3,100}}, award1={{10450,1250}}},
	[700221] = {expend={{3,100}}, award1={{10450,1250}}},
	[700231] = {expend={{3,100}}, award1={{10450,1375}}},
	[700241] = {expend={{3,100}}, award1={{10450,1375}}},
	[700251] = {expend={{3,100}}, award1={{10450,1250}}},
	[700261] = {expend={{3,100}}, award1={{10450,1375}}},
	[700271] = {expend={{3,100}}, award1={{10450,1375}}},
	[700291] = {expend={{3,100}}, award1={{10450,1250}}},
	[700301] = {expend={{3,100}}, award1={{10450,1000}}},
	[700311] = {expend={{3,100}}, award1={{10450,1375}}},
	[700321] = {expend={{3,100}}, award1={{10450,1375}}},
	[750000] = {expend={{3,100}}, award1={{10450,1500}}},
	[750100] = {expend={{3,100}}, award1={{10450,1375}}},
	[750200] = {expend={{3,100}}, award1={{10450,1500}}},
	[750400] = {expend={{3,100}}, award1={{10450,1375}}},
	[700281] = {expend={{3,100}}, award1={{10450,1375}}},
	[700361] = {expend={{3,100}}, award1={{10450,1375}}},
	[700371] = {expend={{3,100}}, award1={{10450,1250}}},
	[700381] = {expend={{3,100}}, award1={{10450,1250}}},
	[700391] = {expend={{3,100}}, award1={{10450,1375}}},
	[700401] = {expend={{3,100}}, award1={{10450,1375}}},
	[700411] = {expend={{3,100}}, award1={{10450,1375}}},
	[700421] = {expend={{3,100}}, award1={{10450,1375}}},
	[700431] = {expend={{3,100}}, award1={{10450,1375}}},
	[700441] = {expend={{3,100}}, award1={{10450,1375}}},
	[700451] = {expend={{3,100}}, award1={{10450,1375}}},
	[701001] = {expend={{3,100}}, award1={{10460,2}}},
	[701011] = {expend={{3,100}}, award1={{10460,2}}},
	[701021] = {expend={{3,100}}, award1={{10460,2}}},
	[701031] = {expend={{3,100}}, award1={{10460,2}}},
	[701041] = {expend={{3,100}}, award1={{10460,2}}},
	[701051] = {expend={{3,100}}, award1={{10460,2}}},
	[701061] = {expend={{3,100}}, award1={{10460,2}}},
	[701071] = {expend={{3,100}}, award1={{10460,2}}},
	[700003] = {expend={{3,200}}, award1={{10450,10500}}},
	[700013] = {expend={{3,200}}, award1={{10450,10500}}},
	[700023] = {expend={{3,200}}, award1={{10450,10000}}},
	[700033] = {expend={{3,200}}, award1={{10450,10000}}},
	[700043] = {expend={{3,200}}, award1={{10450,10500}}},
	[700053] = {expend={{3,200}}, award1={{10450,10500}}},
	[700063] = {expend={{3,200}}, award1={{10450,10000}}},
	[700073] = {expend={{3,200}}, award1={{10450,11000}}},
	[700083] = {expend={{3,200}}, award1={{10450,9000}}},
	[700093] = {expend={{3,200}}, award1={{10450,9000}}},
	[700103] = {expend={{3,200}}, award1={{10450,9000}}},
	[700113] = {expend={{3,200}}, award1={{10450,9000}}},
	[700123] = {expend={{3,200}}, award1={{10450,9000}}},
	[700133] = {expend={{3,200}}, award1={{10450,9000}}},
	[700143] = {expend={{3,200}}, award1={{10450,10000}}},
	[700153] = {expend={{3,200}}, award1={{10450,9000}}},
	[700163] = {expend={{3,200}}, award1={{10450,9000}}},
	[700173] = {expend={{3,200}}, award1={{10450,10500}}},
	[700183] = {expend={{3,200}}, award1={{10450,10000}}},
	[700193] = {expend={{3,200}}, award1={{10450,10000}}},
	[700203] = {expend={{3,200}}, award1={{10450,10500}}},
	[700213] = {expend={{3,200}}, award1={{10450,10000}}},
	[700223] = {expend={{3,200}}, award1={{10450,10000}}},
	[700233] = {expend={{3,200}}, award1={{10450,10500}}},
	[700243] = {expend={{3,200}}, award1={{10450,10500}}},
	[700253] = {expend={{3,200}}, award1={{10450,10000}}},
	[700263] = {expend={{3,200}}, award1={{10450,10500}}},
	[700273] = {expend={{3,200}}, award1={{10450,10500}}},
	[700293] = {expend={{3,200}}, award1={{10450,10000}}},
	[700303] = {expend={{3,200}}, award1={{10450,9000}}},
	[700313] = {expend={{3,200}}, award1={{10450,10500}}},
	[700323] = {expend={{3,200}}, award1={{10450,10500}}},
	[750001] = {expend={{3,200}}, award1={{10450,11000}}},
	[750101] = {expend={{3,200}}, award1={{10450,10500}}},
	[750201] = {expend={{3,200}}, award1={{10450,11000}}},
	[750401] = {expend={{3,200}}, award1={{10450,10500}}},
	[700283] = {expend={{3,200}}, award1={{10450,10500}}},
	[700363] = {expend={{3,200}}, award1={{10450,10500}}},
	[700373] = {expend={{3,200}}, award1={{10450,10000}}},
	[700383] = {expend={{3,200}}, award1={{10450,10000}}},
	[700393] = {expend={{3,200}}, award1={{10450,10500}}},
	[700403] = {expend={{3,200}}, award1={{10450,10500}}},
	[700413] = {expend={{3,200}}, award1={{10450,10500}}},
	[700423] = {expend={{3,200}}, award1={{10450,10500}}},
	[700433] = {expend={{3,200}}, award1={{10450,10500}}},
	[700443] = {expend={{3,200}}, award1={{10450,10500}}},
	[700453] = {expend={{3,200}}, award1={{10450,10500}}},
	[701003] = {expend={{3,200}}, award1={{10460,13}}},
	[701013] = {expend={{3,200}}, award1={{10460,13}}},
	[701023] = {expend={{3,200}}, award1={{10460,13}}},
	[701033] = {expend={{3,200}}, award1={{10460,13}}},
	[701043] = {expend={{3,200}}, award1={{10460,13}}},
	[701053] = {expend={{3,200}}, award1={{10460,13}}},
	[701063] = {expend={{3,200}}, award1={{10460,13}}},
	[701073] = {expend={{3,200}}, award1={{10460,13}}},
	[700005] = {expend={{3,500}}, award1={{10450,27375}}},
	[700015] = {expend={{3,500}}, award1={{10450,27375}}},
	[700025] = {expend={{3,500}}, award1={{10450,26250}}},
	[700035] = {expend={{3,500}}, award1={{10450,26250}}},
	[700045] = {expend={{3,500}}, award1={{10450,27375}}},
	[700055] = {expend={{3,500}}, award1={{10450,27375}}},
	[700065] = {expend={{3,500}}, award1={{10450,26250}}},
	[700075] = {expend={{3,500}}, award1={{10450,28500}}},
	[700085] = {expend={{3,500}}, award1={{10450,24000}}},
	[700095] = {expend={{3,500}}, award1={{10450,24000}}},
	[700105] = {expend={{3,500}}, award1={{10450,24000}}},
	[700115] = {expend={{3,500}}, award1={{10450,24000}}},
	[700125] = {expend={{3,500}}, award1={{10450,24000}}},
	[700135] = {expend={{3,500}}, award1={{10450,24000}}},
	[700145] = {expend={{3,500}}, award1={{10450,26250}}},
	[700155] = {expend={{3,500}}, award1={{10450,24000}}},
	[700165] = {expend={{3,500}}, award1={{10450,24000}}},
	[700175] = {expend={{3,500}}, award1={{10450,27375}}},
	[700185] = {expend={{3,500}}, award1={{10450,26250}}},
	[700195] = {expend={{3,500}}, award1={{10450,26250}}},
	[700205] = {expend={{3,500}}, award1={{10450,27375}}},
	[700215] = {expend={{3,500}}, award1={{10450,26250}}},
	[700225] = {expend={{3,500}}, award1={{10450,26250}}},
	[700235] = {expend={{3,500}}, award1={{10450,27375}}},
	[700245] = {expend={{3,500}}, award1={{10450,27375}}},
	[700255] = {expend={{3,500}}, award1={{10450,26250}}},
	[700265] = {expend={{3,500}}, award1={{10450,27375}}},
	[700275] = {expend={{3,500}}, award1={{10450,27375}}},
	[700295] = {expend={{3,500}}, award1={{10450,26250}}},
	[700305] = {expend={{3,500}}, award1={{10450,24000}}},
	[700315] = {expend={{3,500}}, award1={{10450,27375}}},
	[700325] = {expend={{3,500}}, award1={{10450,27375}}},
	[750002] = {expend={{3,500}}, award1={{10450,28500}}},
	[750102] = {expend={{3,500}}, award1={{10450,27375}}},
	[750202] = {expend={{3,500}}, award1={{10450,28500}}},
	[750402] = {expend={{3,500}}, award1={{10450,27375}}},
	[700285] = {expend={{3,500}}, award1={{10450,27375}}},
	[700365] = {expend={{3,500}}, award1={{10450,27375}}},
	[700375] = {expend={{3,500}}, award1={{10450,26250}}},
	[700385] = {expend={{3,500}}, award1={{10450,26250}}},
	[700395] = {expend={{3,500}}, award1={{10450,27375}}},
	[700405] = {expend={{3,500}}, award1={{10450,27375}}},
	[700415] = {expend={{3,500}}, award1={{10450,27375}}},
	[700425] = {expend={{3,500}}, award1={{10450,27375}}},
	[700435] = {expend={{3,500}}, award1={{10450,27375}}},
	[700445] = {expend={{3,500}}, award1={{10450,27375}}},
	[700455] = {expend={{3,500}}, award1={{10450,27375}}},
	[701005] = {expend={{3,500}}, award1={{10460,33}}},
	[701015] = {expend={{3,500}}, award1={{10460,33}}},
	[701025] = {expend={{3,500}}, award1={{10460,33}}},
	[701035] = {expend={{3,500}}, award1={{10460,33}}},
	[701045] = {expend={{3,500}}, award1={{10460,33}}},
	[701055] = {expend={{3,500}}, award1={{10460,33}}},
	[701065] = {expend={{3,500}}, award1={{10460,33}}},
	[701075] = {expend={{3,500}}, award1={{10460,33}}}
}
Config.PartnerSkillData.data_partner_skill_back_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_skill_back[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_skill_back['..key..'])not found') return
	end
	return data
end
-- -------------------partner_skill_back_end---------------------


-- -------------------partner_skill_view_start-------------------
Config.PartnerSkillData.data_partner_skill_view_length = 3
Config.PartnerSkillData.data_partner_skill_view = {
	[1] = {701001,701011,701021,701031,701041,701051,701061,701071,700001,700011,700021,700031,700041,700051,700061,700071,700081,700091,700101,700111,700121,700131,700141,700151,700161,700171,700181,700191,700201,700211,700221,700231,700241,700251,700261,700271,700291,700301,700311,700321,750000,750100,750200,750400,700281,700361,700371,700381,700391,700401,700411,700421,700431,700441,700451},
	[2] = {701003,701013,701023,701033,701043,701053,701063,701073,700003,700013,700023,700033,700043,700053,700063,700073,700083,700093,700103,700113,700123,700133,700143,700153,700163,700173,700183,700193,700203,700213,700223,700233,700243,700253,700263,700273,700293,700303,700313,700323,750001,750101,750201,750401,700283,700363,700373,700383,700393,700403,700413,700423,700433,700443,700453},
	[3] = {701005,701015,701025,701035,701045,701055,701065,701075,700005,700015,700025,700035,700045,700055,700065,700075,700085,700095,700105,700115,700125,700135,700145,700155,700165,700175,700185,700195,700205,700215,700225,700235,700245,700255,700265,700275,700295,700305,700315,700325,750002,750102,750202,750402,700285,700365,700375,700385,700395,700405,700415,700425,700435,700445,700455}
}
Config.PartnerSkillData.data_partner_skill_view_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_skill_view[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_skill_view['..key..'])not found') return
	end
	return data
end
-- -------------------partner_skill_view_end---------------------


-- -------------------partner_skill_item_start-------------------
Config.PartnerSkillData.data_partner_skill_item_length = 110
Config.PartnerSkillData.data_partner_skill_item = {
	[700001] = {id=700001, expend={16001}},
	[700011] = {id=700011, expend={16002}},
	[700021] = {id=700021, expend={16003}},
	[700031] = {id=700031, expend={16004}},
	[700041] = {id=700041, expend={16005}},
	[700051] = {id=700051, expend={16006}},
	[700061] = {id=700061, expend={16007}},
	[700071] = {id=700071, expend={16008}},
	[700081] = {id=700081, expend={16009}},
	[700091] = {id=700091, expend={16010}},
	[700101] = {id=700101, expend={16011}},
	[700111] = {id=700111, expend={16012}},
	[700121] = {id=700121, expend={16013}},
	[700131] = {id=700131, expend={16014}},
	[700141] = {id=700141, expend={16015}},
	[700151] = {id=700151, expend={16016}},
	[700161] = {id=700161, expend={16017}},
	[700171] = {id=700171, expend={16018}},
	[700181] = {id=700181, expend={16019}},
	[700191] = {id=700191, expend={16020}},
	[700201] = {id=700201, expend={16021}},
	[700211] = {id=700211, expend={16022}},
	[700221] = {id=700221, expend={16023}},
	[700231] = {id=700231, expend={16024}},
	[700241] = {id=700241, expend={16025}},
	[700251] = {id=700251, expend={16026}},
	[700261] = {id=700261, expend={16027}},
	[700271] = {id=700271, expend={16028}},
	[700291] = {id=700291, expend={16029}},
	[700301] = {id=700301, expend={16030}},
	[700311] = {id=700311, expend={16031}},
	[700321] = {id=700321, expend={16032}},
	[750000] = {id=750000, expend={16033}},
	[750100] = {id=750100, expend={16034}},
	[750200] = {id=750200, expend={16035}},
	[750400] = {id=750400, expend={16036}},
	[700281] = {id=700281, expend={16037}},
	[700361] = {id=700361, expend={16038}},
	[700371] = {id=700371, expend={16039}},
	[700381] = {id=700381, expend={16040}},
	[700391] = {id=700391, expend={16041}},
	[700401] = {id=700401, expend={16042}},
	[700411] = {id=700411, expend={16043}},
	[700421] = {id=700421, expend={16044}},
	[700431] = {id=700431, expend={16045}},
	[700441] = {id=700441, expend={16046}},
	[700451] = {id=700451, expend={16047}},
	[701001] = {id=701001, expend={16101}},
	[701011] = {id=701011, expend={16102}},
	[701021] = {id=701021, expend={16103}},
	[701031] = {id=701031, expend={16104}},
	[701041] = {id=701041, expend={16105}},
	[701051] = {id=701051, expend={16106}},
	[701061] = {id=701061, expend={16107}},
	[701071] = {id=701071, expend={16108}},
	[700003] = {id=700003, expend={16001}},
	[700013] = {id=700013, expend={16002}},
	[700023] = {id=700023, expend={16003}},
	[700033] = {id=700033, expend={16004}},
	[700043] = {id=700043, expend={16005}},
	[700053] = {id=700053, expend={16006}},
	[700063] = {id=700063, expend={16007}},
	[700073] = {id=700073, expend={16008}},
	[700083] = {id=700083, expend={16009}},
	[700093] = {id=700093, expend={16010}},
	[700103] = {id=700103, expend={16011}},
	[700113] = {id=700113, expend={16012}},
	[700123] = {id=700123, expend={16013}},
	[700133] = {id=700133, expend={16014}},
	[700143] = {id=700143, expend={16015}},
	[700153] = {id=700153, expend={16016}},
	[700163] = {id=700163, expend={16017}},
	[700173] = {id=700173, expend={16018}},
	[700183] = {id=700183, expend={16019}},
	[700193] = {id=700193, expend={16020}},
	[700203] = {id=700203, expend={16021}},
	[700213] = {id=700213, expend={16022}},
	[700223] = {id=700223, expend={16023}},
	[700233] = {id=700233, expend={16024}},
	[700243] = {id=700243, expend={16025}},
	[700253] = {id=700253, expend={16026}},
	[700263] = {id=700263, expend={16027}},
	[700273] = {id=700273, expend={16028}},
	[700293] = {id=700293, expend={16029}},
	[700303] = {id=700303, expend={16030}},
	[700313] = {id=700313, expend={16031}},
	[700323] = {id=700323, expend={16032}},
	[750001] = {id=750001, expend={16033}},
	[750101] = {id=750101, expend={16034}},
	[750201] = {id=750201, expend={16035}},
	[750401] = {id=750401, expend={16036}},
	[700283] = {id=700283, expend={16037}},
	[700363] = {id=700363, expend={16038}},
	[700373] = {id=700373, expend={16039}},
	[700383] = {id=700383, expend={16040}},
	[700393] = {id=700393, expend={16041}},
	[700403] = {id=700403, expend={16042}},
	[700413] = {id=700413, expend={16043}},
	[700423] = {id=700423, expend={16044}},
	[700433] = {id=700433, expend={16045}},
	[700443] = {id=700443, expend={16046}},
	[700453] = {id=700453, expend={16047}},
	[701003] = {id=701003, expend={16101}},
	[701013] = {id=701013, expend={16102}},
	[701023] = {id=701023, expend={16103}},
	[701033] = {id=701033, expend={16104}},
	[701043] = {id=701043, expend={16105}},
	[701053] = {id=701053, expend={16106}},
	[701063] = {id=701063, expend={16107}},
	[701073] = {id=701073, expend={16108}}
}
Config.PartnerSkillData.data_partner_skill_item_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_skill_item[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_skill_item['..key..'])not found') return
	end
	return data
end
-- -------------------partner_skill_item_end---------------------


-- -------------------partner_awakening_skill_start-------------------
Config.PartnerSkillData.data_partner_awakening_skill_length = 24
Config.PartnerSkillData.data_partner_awakening_skill = {
	[701001] = {id=701001, limit_career={{3}}},
	[701011] = {id=701011, limit_career={{3}}},
	[701021] = {id=701021, limit_career={{2}}},
	[701031] = {id=701031, limit_career={{2}}},
	[701041] = {id=701041, limit_career={{4}}},
	[701051] = {id=701051, limit_career={{4}}},
	[701061] = {id=701061, limit_career={{5}}},
	[701071] = {id=701071, limit_career={{5}}},
	[701003] = {id=701003, limit_career={{3}}},
	[701013] = {id=701013, limit_career={{3}}},
	[701023] = {id=701023, limit_career={{2}}},
	[701033] = {id=701033, limit_career={{2}}},
	[701043] = {id=701043, limit_career={{4}}},
	[701053] = {id=701053, limit_career={{4}}},
	[701063] = {id=701063, limit_career={{5}}},
	[701073] = {id=701073, limit_career={{5}}},
	[701005] = {id=701005, limit_career={{3}}},
	[701015] = {id=701015, limit_career={{3}}},
	[701025] = {id=701025, limit_career={{2}}},
	[701035] = {id=701035, limit_career={{2}}},
	[701045] = {id=701045, limit_career={{4}}},
	[701055] = {id=701055, limit_career={{4}}},
	[701065] = {id=701065, limit_career={{5}}},
	[701075] = {id=701075, limit_career={{5}}}
}
Config.PartnerSkillData.data_partner_awakening_skill_fun = function(key)
	local data=Config.PartnerSkillData.data_partner_awakening_skill[key]
	if DATA_DEBUG and data == nil then
		print('(Config.PartnerSkillData.data_partner_awakening_skill['..key..'])not found') return
	end
	return data
end
-- -------------------partner_awakening_skill_end---------------------

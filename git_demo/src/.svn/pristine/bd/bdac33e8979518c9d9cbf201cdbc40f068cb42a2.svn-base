----------------------------------------------------
-- 此文件由数据工具生成
-- 活动指定英雄置换--holiday_convert_data.xml
--------------------------------------

Config = Config or {} 
Config.HolidayConvertData = Config.HolidayConvertData or {}

-- -------------------const_start-------------------
Config.HolidayConvertData.data_const_length = 3
Config.HolidayConvertData.data_const = {
	["item_id"] = {val=37005, desc="置换道具id"},
	["game_rule"] = {val=1, desc="1、置换神殿可以将<div fontcolor=289b14>7星以上</div>英雄转换为<div fontcolor=289b14>同种族</div>其他英雄\n2、选择1个7星以上英雄后再投入<div fontcolor=289b14>相同的</div>指定数量5星英雄，消耗一定的<div fontcolor=289b14>时光璃华</div>，即可转换为指定目标英雄\n3、无法升为10星以上的英雄，不能作为目标英雄或材料英雄参与十星以上的置换操作\n4、参与作为置换材料的指定目标5星英雄，会返还培养材料及身上的装备、符文\n5、置换后得到的7星以上目标英雄会<div fontcolor=289b14>继承</div>置换前原7星以上英雄的所有装备、符文、天赋、等级、进阶等\n6、<div fontcolor=289b14>置换无法撤回，请谨慎操作</div>"},
	["jump_to"] = {val=91035, desc="暂无来源"}
}
Config.HolidayConvertData.data_const_fun = function(key)
	local data=Config.HolidayConvertData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.HolidayConvertData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------convert_info_start-------------------
Config.HolidayConvertData.data_convert_info_length = 6
Config.HolidayConvertData.data_convert_info = {
	[7] = {
		[1] = {camp_type=1, star=7, name="七星水系", src_group=102, target_group=1002, expend=2, loss={{37005,4}}},
		[2] = {camp_type=2, star=7, name="七星火系", src_group=202, target_group=2002, expend=2, loss={{37005,4}}},
		[3] = {camp_type=3, star=7, name="七星风系", src_group=302, target_group=3002, expend=2, loss={{37005,4}}},
		[4] = {camp_type=4, star=7, name="七星光系", src_group=402, target_group=4002, expend=2, loss={{37005,4}}},
		[5] = {camp_type=5, star=7, name="七星暗系", src_group=502, target_group=5002, expend=2, loss={{37005,4}}},
	},
	[8] = {
		[1] = {camp_type=1, star=8, name="八星水系", src_group=102, target_group=1002, expend=2, loss={{37005,4}}},
		[2] = {camp_type=2, star=8, name="八星火系", src_group=202, target_group=2002, expend=2, loss={{37005,4}}},
		[3] = {camp_type=3, star=8, name="八星风系", src_group=302, target_group=3002, expend=2, loss={{37005,4}}},
		[4] = {camp_type=4, star=8, name="八星光系", src_group=402, target_group=4002, expend=2, loss={{37005,4}}},
		[5] = {camp_type=5, star=8, name="八星暗系", src_group=502, target_group=5002, expend=2, loss={{37005,4}}},
	},
	[9] = {
		[1] = {camp_type=1, star=9, name="九星水系", src_group=102, target_group=1002, expend=3, loss={{37005,6}}},
		[2] = {camp_type=2, star=9, name="九星火系", src_group=202, target_group=2002, expend=3, loss={{37005,6}}},
		[3] = {camp_type=3, star=9, name="九星风系", src_group=302, target_group=3002, expend=3, loss={{37005,6}}},
		[4] = {camp_type=4, star=9, name="九星光系", src_group=402, target_group=4002, expend=3, loss={{37005,6}}},
		[5] = {camp_type=5, star=9, name="九星暗系", src_group=502, target_group=5002, expend=3, loss={{37005,6}}},
	},
	[10] = {
		[1] = {camp_type=1, star=10, name="十星水系", src_group=101, target_group=1001, expend=5, loss={{37005,10}}},
		[2] = {camp_type=2, star=10, name="十星火系", src_group=201, target_group=2001, expend=5, loss={{37005,10}}},
		[3] = {camp_type=3, star=10, name="十星风系", src_group=301, target_group=3001, expend=5, loss={{37005,10}}},
		[4] = {camp_type=4, star=10, name="十星光系", src_group=401, target_group=4001, expend=5, loss={{37005,10}}},
		[5] = {camp_type=5, star=10, name="十星暗系", src_group=501, target_group=5001, expend=5, loss={{37005,10}}},
	},
	[11] = {
		[1] = {camp_type=1, star=11, name="十一星水系", src_group=101, target_group=1001, expend=7, loss={{37005,20}}},
		[2] = {camp_type=2, star=11, name="十一星火系", src_group=201, target_group=2001, expend=7, loss={{37005,20}}},
		[3] = {camp_type=3, star=11, name="十一星风系", src_group=301, target_group=3001, expend=7, loss={{37005,20}}},
		[4] = {camp_type=4, star=11, name="十一星光系", src_group=401, target_group=4001, expend=7, loss={{37005,20}}},
		[5] = {camp_type=5, star=11, name="十一星暗系", src_group=501, target_group=5001, expend=7, loss={{37005,20}}},
	},
	[12] = {
		[1] = {camp_type=1, star=12, name="十二星水系", src_group=101, target_group=1001, expend=9, loss={{37005,30}}},
		[2] = {camp_type=2, star=12, name="十二星火系", src_group=201, target_group=2001, expend=9, loss={{37005,30}}},
		[3] = {camp_type=3, star=12, name="十二星风系", src_group=301, target_group=3001, expend=9, loss={{37005,30}}},
		[4] = {camp_type=4, star=12, name="十二星光系", src_group=401, target_group=4001, expend=9, loss={{37005,30}}},
		[5] = {camp_type=5, star=12, name="十二星暗系", src_group=501, target_group=5001, expend=9, loss={{37005,30}}},
	},
}
-- -------------------convert_info_end---------------------


-- -------------------hero_list_start-------------------
Config.HolidayConvertData.data_hero_list_length = 10
Config.HolidayConvertData.data_hero_list = {
	[101] = {
		[10501] = {src_group=101, bid=10501},
		[10502] = {src_group=101, bid=10502},
		[10503] = {src_group=101, bid=10503},
		[10504] = {src_group=101, bid=10504},
		[10505] = {src_group=101, bid=10505},
		[10507] = {src_group=101, bid=10507},
		[10510] = {src_group=101, bid=10510},
		[10511] = {src_group=101, bid=10511},
		[10512] = {src_group=101, bid=10512},
	},
	[102] = {
		[10506] = {src_group=102, bid=10506},
		[10508] = {src_group=102, bid=10508},
		[10509] = {src_group=102, bid=10509},
		[10501] = {src_group=102, bid=10501},
		[10502] = {src_group=102, bid=10502},
		[10503] = {src_group=102, bid=10503},
		[10504] = {src_group=102, bid=10504},
		[10505] = {src_group=102, bid=10505},
		[10507] = {src_group=102, bid=10507},
		[10510] = {src_group=102, bid=10510},
		[10511] = {src_group=102, bid=10511},
		[10512] = {src_group=102, bid=10512},
	},
	[201] = {
		[20501] = {src_group=201, bid=20501},
		[20502] = {src_group=201, bid=20502},
		[20504] = {src_group=201, bid=20504},
		[20505] = {src_group=201, bid=20505},
		[20507] = {src_group=201, bid=20507},
		[20508] = {src_group=201, bid=20508},
		[20509] = {src_group=201, bid=20509},
		[20510] = {src_group=201, bid=20510},
		[20511] = {src_group=201, bid=20511},
		[20512] = {src_group=201, bid=20512},
	},
	[202] = {
		[20503] = {src_group=202, bid=20503},
		[20506] = {src_group=202, bid=20506},
		[20501] = {src_group=202, bid=20501},
		[20502] = {src_group=202, bid=20502},
		[20504] = {src_group=202, bid=20504},
		[20505] = {src_group=202, bid=20505},
		[20507] = {src_group=202, bid=20507},
		[20508] = {src_group=202, bid=20508},
		[20509] = {src_group=202, bid=20509},
		[20510] = {src_group=202, bid=20510},
		[20511] = {src_group=202, bid=20511},
		[20512] = {src_group=202, bid=20512},
	},
	[301] = {
		[30501] = {src_group=301, bid=30501},
		[30502] = {src_group=301, bid=30502},
		[30504] = {src_group=301, bid=30504},
		[30506] = {src_group=301, bid=30506},
		[30507] = {src_group=301, bid=30507},
		[30508] = {src_group=301, bid=30508},
		[30509] = {src_group=301, bid=30509},
		[30510] = {src_group=301, bid=30510},
		[30511] = {src_group=301, bid=30511},
		[30512] = {src_group=301, bid=30512},
	},
	[302] = {
		[30503] = {src_group=302, bid=30503},
		[30505] = {src_group=302, bid=30505},
		[30501] = {src_group=302, bid=30501},
		[30502] = {src_group=302, bid=30502},
		[30504] = {src_group=302, bid=30504},
		[30506] = {src_group=302, bid=30506},
		[30507] = {src_group=302, bid=30507},
		[30508] = {src_group=302, bid=30508},
		[30509] = {src_group=302, bid=30509},
		[30510] = {src_group=302, bid=30510},
		[30511] = {src_group=302, bid=30511},
		[30512] = {src_group=302, bid=30512},
	},
	[401] = {
		[40502] = {src_group=401, bid=40502},
		[40503] = {src_group=401, bid=40503},
		[40504] = {src_group=401, bid=40504},
		[40506] = {src_group=401, bid=40506},
		[40507] = {src_group=401, bid=40507},
		[40508] = {src_group=401, bid=40508},
		[40509] = {src_group=401, bid=40509},
		[40510] = {src_group=401, bid=40510},
	},
	[402] = {
		[40501] = {src_group=402, bid=40501},
		[40505] = {src_group=402, bid=40505},
		[40502] = {src_group=402, bid=40502},
		[40503] = {src_group=402, bid=40503},
		[40504] = {src_group=402, bid=40504},
		[40506] = {src_group=402, bid=40506},
		[40507] = {src_group=402, bid=40507},
		[40508] = {src_group=402, bid=40508},
		[40509] = {src_group=402, bid=40509},
		[40510] = {src_group=402, bid=40510},
	},
	[501] = {
		[50502] = {src_group=501, bid=50502},
		[50503] = {src_group=501, bid=50503},
		[50504] = {src_group=501, bid=50504},
		[50505] = {src_group=501, bid=50505},
		[50507] = {src_group=501, bid=50507},
		[50508] = {src_group=501, bid=50508},
		[50509] = {src_group=501, bid=50509},
		[50510] = {src_group=501, bid=50510},
	},
	[502] = {
		[50501] = {src_group=502, bid=50501},
		[50506] = {src_group=502, bid=50506},
		[50502] = {src_group=502, bid=50502},
		[50503] = {src_group=502, bid=50503},
		[50504] = {src_group=502, bid=50504},
		[50505] = {src_group=502, bid=50505},
		[50507] = {src_group=502, bid=50507},
		[50508] = {src_group=502, bid=50508},
		[50509] = {src_group=502, bid=50509},
		[50510] = {src_group=502, bid=50510},
	},
}
-- -------------------hero_list_end---------------------


-- -------------------target_hero_list_start-------------------
Config.HolidayConvertData.data_target_hero_list_length = 10
Config.HolidayConvertData.data_target_hero_list = {
	[1001] = {
		[10501] = {target_group=1001, bid=10501},
		[10502] = {target_group=1001, bid=10502},
		[10503] = {target_group=1001, bid=10503},
		[10504] = {target_group=1001, bid=10504},
		[10505] = {target_group=1001, bid=10505},
		[10507] = {target_group=1001, bid=10507},
		[10510] = {target_group=1001, bid=10510},
		[10511] = {target_group=1001, bid=10511},
		[10512] = {target_group=1001, bid=10512},
	},
	[1002] = {
		[10506] = {target_group=1002, bid=10506},
		[10508] = {target_group=1002, bid=10508},
		[10509] = {target_group=1002, bid=10509},
		[10501] = {target_group=1002, bid=10501},
		[10502] = {target_group=1002, bid=10502},
		[10503] = {target_group=1002, bid=10503},
		[10504] = {target_group=1002, bid=10504},
		[10505] = {target_group=1002, bid=10505},
		[10507] = {target_group=1002, bid=10507},
		[10510] = {target_group=1002, bid=10510},
		[10511] = {target_group=1002, bid=10511},
		[10512] = {target_group=1002, bid=10512},
	},
	[2001] = {
		[20501] = {target_group=2001, bid=20501},
		[20502] = {target_group=2001, bid=20502},
		[20504] = {target_group=2001, bid=20504},
		[20505] = {target_group=2001, bid=20505},
		[20507] = {target_group=2001, bid=20507},
		[20508] = {target_group=2001, bid=20508},
		[20509] = {target_group=2001, bid=20509},
		[20510] = {target_group=2001, bid=20510},
		[20511] = {target_group=2001, bid=20511},
		[20512] = {target_group=2001, bid=20512},
	},
	[2002] = {
		[20503] = {target_group=2002, bid=20503},
		[20506] = {target_group=2002, bid=20506},
		[20501] = {target_group=2002, bid=20501},
		[20502] = {target_group=2002, bid=20502},
		[20504] = {target_group=2002, bid=20504},
		[20505] = {target_group=2002, bid=20505},
		[20507] = {target_group=2002, bid=20507},
		[20508] = {target_group=2002, bid=20508},
		[20509] = {target_group=2002, bid=20509},
		[20510] = {target_group=2002, bid=20510},
		[20511] = {target_group=2002, bid=20511},
		[20512] = {target_group=2002, bid=20512},
	},
	[3001] = {
		[30501] = {target_group=3001, bid=30501},
		[30502] = {target_group=3001, bid=30502},
		[30504] = {target_group=3001, bid=30504},
		[30506] = {target_group=3001, bid=30506},
		[30507] = {target_group=3001, bid=30507},
		[30508] = {target_group=3001, bid=30508},
		[30509] = {target_group=3001, bid=30509},
		[30510] = {target_group=3001, bid=30510},
		[30511] = {target_group=3001, bid=30511},
		[30512] = {target_group=3001, bid=30512},
	},
	[3002] = {
		[30503] = {target_group=3002, bid=30503},
		[30505] = {target_group=3002, bid=30505},
		[30501] = {target_group=3002, bid=30501},
		[30502] = {target_group=3002, bid=30502},
		[30504] = {target_group=3002, bid=30504},
		[30506] = {target_group=3002, bid=30506},
		[30507] = {target_group=3002, bid=30507},
		[30508] = {target_group=3002, bid=30508},
		[30509] = {target_group=3002, bid=30509},
		[30510] = {target_group=3002, bid=30510},
		[30511] = {target_group=3002, bid=30511},
		[30512] = {target_group=3002, bid=30512},
	},
	[4001] = {
		[40502] = {target_group=4001, bid=40502},
		[40503] = {target_group=4001, bid=40503},
		[40504] = {target_group=4001, bid=40504},
		[40506] = {target_group=4001, bid=40506},
		[40507] = {target_group=4001, bid=40507},
		[40508] = {target_group=4001, bid=40508},
		[40509] = {target_group=4001, bid=40509},
		[40510] = {target_group=4001, bid=40510},
	},
	[4002] = {
		[40501] = {target_group=4002, bid=40501},
		[40505] = {target_group=4002, bid=40505},
		[40502] = {target_group=4002, bid=40502},
		[40503] = {target_group=4002, bid=40503},
		[40504] = {target_group=4002, bid=40504},
		[40506] = {target_group=4002, bid=40506},
		[40507] = {target_group=4002, bid=40507},
		[40508] = {target_group=4002, bid=40508},
		[40509] = {target_group=4002, bid=40509},
		[40510] = {target_group=4002, bid=40510},
	},
	[5001] = {
		[50502] = {target_group=5001, bid=50502},
		[50503] = {target_group=5001, bid=50503},
		[50504] = {target_group=5001, bid=50504},
		[50505] = {target_group=5001, bid=50505},
		[50507] = {target_group=5001, bid=50507},
		[50508] = {target_group=5001, bid=50508},
		[50509] = {target_group=5001, bid=50509},
		[50510] = {target_group=5001, bid=50510},
	},
	[5002] = {
		[50501] = {target_group=5002, bid=50501},
		[50506] = {target_group=5002, bid=50506},
		[50502] = {target_group=5002, bid=50502},
		[50503] = {target_group=5002, bid=50503},
		[50504] = {target_group=5002, bid=50504},
		[50505] = {target_group=5002, bid=50505},
		[50507] = {target_group=5002, bid=50507},
		[50508] = {target_group=5002, bid=50508},
		[50509] = {target_group=5002, bid=50509},
		[50510] = {target_group=5002, bid=50510},
	},
}
-- -------------------target_hero_list_end---------------------

----------------------------------------------------
-- 此文件由数据工具生成
-- 聊天框数据--say_data.xml
--------------------------------------

Config = Config or {} 
Config.SayData = Config.SayData or {}

-- -------------------say_frame_start-------------------
Config.SayData.data_say_frame_length = 9
Config.SayData.data_say_frame = {
	[1000] = {base_id=1000, name="聊天气泡", group=100, loss={}, desc="领主专属聊天气泡", expire_time=0, is_panel=0, is_show=1, res_id=0, color=63, offx=0, offy=0, attr={}},
	[1001] = {base_id=1001, name="无人能挡", group=101, loss={}, desc="段位赛达到<div fontcolor=#289b14>传奇段位</div>可激活", expire_time=10080, is_panel=0, is_show=1, res_id=6, color=63, offx=30, offy=15, attr={}},
	[1002] = {base_id=1002, name="荣耀冠军", group=102, loss={}, desc="每日竞技场结算时排名<div fontcolor=#289b14>第一</div>可激活荣耀冠军气泡", expire_time=1440, is_panel=0, is_show=1, res_id=1, color=63, offx=30, offy=15, attr={}},
	[1003] = {base_id=1003, name="天梯宗师", group=103, loss={}, desc="天梯段位达到宗师六阶激活", expire_time=10080, is_panel=0, is_show=1, res_id=2, color=91, offx=30, offy=15, attr={}},
	[1004] = {base_id=1004, name="首席霸主", group=104, loss={{50104,1}}, desc="首席争霸服务器第一名玩家可获得", expire_time=10080, is_panel=1, is_show=1, res_id=8, color=63, offx=20, offy=10, attr={}},
	[1100] = {base_id=1100, name="任性宝宝", group=110, loss={{50100,1}}, desc="双11活动可获得；使用同类道具激活可叠加有效期", expire_time=10080, is_panel=1, is_show=1, res_id=7, color=63, offx=20, offy=15, attr={}},
	[1101] = {base_id=1101, name="任性宝宝", group=110, loss={{50101,1}}, desc="双11活动可获得；使用同类道具激活可叠加有效期", expire_time=21600, is_panel=1, is_show=0, res_id=7, color=63, offx=20, offy=15, attr={}},
	[1102] = {base_id=1102, name="任性宝宝", group=110, loss={{50102,1}}, desc="双11活动可获得；使用同类道具激活可叠加有效期", expire_time=43200, is_panel=1, is_show=0, res_id=7, color=63, offx=20, offy=15, attr={}},
	[1103] = {base_id=1103, name="任性宝宝", group=110, loss={{50103,1}}, desc="双11活动可获得；使用同类道具激活可叠加有效期", expire_time=129600, is_panel=1, is_show=0, res_id=7, color=63, offx=20, offy=15, attr={}}
}
Config.SayData.data_say_frame_fun = function(key)
	local data=Config.SayData.data_say_frame[key]
	if DATA_DEBUG and data == nil then
		print('(Config.SayData.data_say_frame['..key..'])not found') return
	end
	return data
end
-- -------------------say_frame_end---------------------


-- -------------------const_start-------------------
Config.SayData.data_const_length = 14
Config.SayData.data_const = {
	["default_bubble"] = {val=1000, desc="默认聊天气泡"},
	["say_repeak_vip"] = {val=4, desc="VIPX以下限制"},
	["say_repeak_lev"] = {val=80, desc="X级以下限制"},
	["say_repeak_span"] = {val=15, desc="最近X分钟内的发言条数"},
	["say_repeak_num"] = {val=3, desc="筛选的发言条数"},
	["say_repeak_similar"] = {val=60, desc="封禁的相似度（百分比）"},
	["say_repeak_time"] = {val=10, desc="封禁的小时"},
	["say_string_length"] = {val=28, desc="限制的字符串长度（中文3个字符，英/数一个字符）"},
	["cooldown_same_province"] = {val=5, desc="同省发言冷却"},
	["cooldown_cross_service"] = {val=10, desc="跨服发言冷却"},
	["cooldown_world"] = {val=10, desc="世界发言冷却"},
	["cooldown_guild"] = {val=5, desc="公会发言冷却"},
	["cooldown_team"] = {val=3, desc="组队聊天发言冷却"},
	["at_condition"] = {val=30, desc="角色达到30级才可at其他玩家，请努力提升等级！"}
}
Config.SayData.data_const_fun = function(key)
	local data=Config.SayData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.SayData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------

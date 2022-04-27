----------------------------------------------------
-- 此文件由数据工具生成
-- 活动配置--dailyplay_data.xml
--------------------------------------

Config = Config or {} 
Config.DailyplayData = Config.DailyplayData or {}

-- -------------------limitactivity_start-------------------
Config.DailyplayData.data_limitactivity_length = 7
Config.DailyplayData.data_limitactivity = {
	[1] = {id=1, name="萌兽寻宝", activate={{'open_day',2},{'lev',28}}, val={{10007,1,2}}, is_open=1, desc="奖励翻倍", lock_desc="开服第2天、主角达32级开启"},
	[2] = {id=2, name="帮会Boss狂欢", activate={{'lev',10}}, val={{10,2}}, is_open=1, desc="11:00-13:00 奖励翻倍", lock_desc=""},
	[3] = {id=3, name="首席争霸", activate={}, val={}, is_open=0, desc="", lock_desc=""},
	[4] = {id=4, name="众神战场", activate={{'open_day',4},{'lev',45}}, val={{8,33000,2}}, is_open=1, desc="每日12:30-13:00、20:00-20:30开启", lock_desc="开服第4天、主角达45级开启"},
	[5] = {id=5, name="帮会战", activate={{'lev',1}}, val={}, is_open=1, desc="每周三、周六12:00-20:00开启", lock_desc=""},
	[6] = {id=6, name="冠军赛", activate={{'open_day',6}}, val={}, is_open=1, desc="每个竞技场赛季的第三、六天21:05-22:00开启", lock_desc="开服第6天开启"},
	[7] = {id=7, name="跨服天梯", activate={}, val={{70003,1,21,10421}}, is_open=1, desc="跨服期间开启", lock_desc="跨服期间开启"}
}
Config.DailyplayData.data_limitactivity_fun = function(key)
	local data=Config.DailyplayData.data_limitactivity[key]
	if DATA_DEBUG and data == nil then
		print('(Config.DailyplayData.data_limitactivity['..key..'])not found') return
	end
	return data
end
-- -------------------limitactivity_end---------------------


-- -------------------exerciseactivity_start-------------------
Config.DailyplayData.data_exerciseactivity_length = 4
Config.DailyplayData.data_exerciseactivity = {
	[1] = {id=1, name="材料副本", activate={{'lev',15}}, val={{1,22,29904,72001}}, is_open=1, desc="参与可获得大量实用道具", lock_desc="冒险家15级开启", pic_name="txt_cn_activity_item_12", goto_id=2},
	[2] = {id=2, name="无尽试炼", activate={{'lev',25}}, val={{22,1,10403,10450}}, is_open=1, desc="参与可获得大量英雄经验", lock_desc="冒险家25级开启", pic_name="txt_cn_activity_item_11", goto_id=1},
	[3] = {id=3, name="位面征战", activate={{'lev',30}}, val={{29905,29904,1,25}}, is_open=1, desc="参与可获得征战积分和金币", lock_desc="冒险家30级开启", pic_name="txt_cn_activity_item_14", goto_id=3},
	[4] = {id=4, name="星河神殿", activate={{'lev',35}}, val={{50701,50702,50703}}, is_open=1, desc="参与争夺神位，赢强力称号", lock_desc="冒险家35级开启", pic_name="txt_cn_activity_item_13", goto_id=4}
}
Config.DailyplayData.data_exerciseactivity_fun = function(key)
	local data=Config.DailyplayData.data_exerciseactivity[key]
	if DATA_DEBUG and data == nil then
		print('(Config.DailyplayData.data_exerciseactivity['..key..'])not found') return
	end
	return data
end
-- -------------------exerciseactivity_end---------------------

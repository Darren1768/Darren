----------------------------------------------------
-- 此文件由数据工具生成
-- 弹幕配置数据--subtitle_data.xml
--------------------------------------

Config = Config or {} 
Config.SubtitleData = Config.SubtitleData or {}

-- -------------------list_start-------------------
Config.SubtitleData.data_list_length = 3
Config.SubtitleData.data_list = {
	[101] = {id=101, name="冠军赛", loss={{2,500}}, msg_len=40, save_len=30},
	[102] = {id=102, name="跨服冠军赛", loss={{1,500}}, msg_len=40, save_len=30},
	[103] = {id=103, name="巅峰冠军赛", loss={{1,500}}, msg_len=40, save_len=30}
}
Config.SubtitleData.data_list_fun = function(key)
	local data=Config.SubtitleData.data_list[key]
	if DATA_DEBUG and data == nil then
		print('(Config.SubtitleData.data_list['..key..'])not found') return
	end
	return data
end
-- -------------------list_end---------------------


-- -------------------system_start-------------------
Config.SubtitleData.data_system_length = 3
Config.SubtitleData.data_system = {
	[103] = {{msg="晚上八点半正式开打，再问**"},
		{msg="世纪大战么，感觉这里能见到好多大佬"},
		{msg="三局两胜是指第一队打第一队，第二队打第二队！"},
		{msg="商店奖励好像很不错的样子~"},
		{msg="请各位懂事，让我们多拿竞猜币~"},
		{msg="一天一局，不慌哈哈"}
	},
	[102] = {{msg="666666666"},
		{msg="一边拉满幸福美满"},
		{msg="冲冲冲"},
		{msg="参与竞猜，赢取大量冠军币可以去商城兑换奖励哦"}
	},
	[101] = {{msg="666666666"},
		{msg="一边拉满幸福美满"},
		{msg="冲冲冲"},
		{msg="参与竞猜，赢取大量冠军积分可以去商城兑换奖励哦"}
	},
}
-- -------------------system_end---------------------


-- -------------------const_start-------------------
Config.SubtitleData.data_const_length = 6
Config.SubtitleData.data_const = {
	["sub_speed"] = {key="sub_speed", val={8,14}, desc="弹幕速度"},
	["sub_space"] = {key="sub_space", val=2, desc="弹幕间隔(秒)"},
	["subcircle_space"] = {key="subcircle_space", val=3, desc="弹幕循环间隔(秒)"},
	["sub_color"] = {key="sub_color", val={91,97}, desc="弹幕颜色编号(color表)"},
	["sub_font"] = {key="sub_font", val={25,30}, desc="弹幕字体大小"},
	["sub_cost"] = {key="sub_cost", val=500, desc="弹幕发送消耗(银币)"}
}
Config.SubtitleData.data_const_fun = function(key)
	local data=Config.SubtitleData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.SubtitleData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------

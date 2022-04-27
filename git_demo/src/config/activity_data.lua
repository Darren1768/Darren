----------------------------------------------------
-- 此文件由数据工具生成
-- 活跃度--activity_data.xml
--------------------------------------

Config = Config or {} 
Config.ActivityData = Config.ActivityData or {}

-- -------------------get_start-------------------
Config.ActivityData.data_get_length = 4
Config.ActivityData.data_get = {
	[1] = {index=1, activity=25, rewards={{3,20},{1,10000}}},
	[2] = {index=2, activity=50, rewards={{3,30},{10401,2}}},
	[3] = {index=3, activity=75, rewards={{3,50},{37001,1}}},
	[4] = {index=4, activity=100, rewards={{3,100},{1,50000}}}
}
Config.ActivityData.data_get_fun = function(key)
	local data=Config.ActivityData.data_get[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ActivityData.data_get['..key..'])not found') return
	end
	return data
end
-- -------------------get_end---------------------


-- -------------------sign_info_start-------------------
Config.ActivityData.data_sign_info_length = 8
Config.ActivityData.data_sign_info = {
	[1] = {id=1, desc="<div fontcolor=#d95014>冠军赛</div>马上开始！谁将登上冠军宝座，参与比赛和趣味竞猜可活动丰厚奖励哦~", items={50012,1,8,29905}, time=10, cancel="取消", ok="前往参与"},
	[2] = {id=2, desc="<div fontcolor=#d95014>冠军赛</div>已经开始啦，正在进行竞猜阶段。是否前往参与竞猜？", items={50012,1,8,29905}, time=10, cancel="取消", ok="前往参与"},
	[3] = {id=3, desc="<div fontcolor=#d95014>众神战场</div>马上开始啦，正在进行报名阶段，快来参与强者之间的较量吧！", items={50603,8,10030,30302,2}, time=10, cancel="取消", ok="前往报名"},
	[4] = {id=4, desc="<div fontcolor=#d95014>众神战场</div>正在进行中，大量奖励等你来拿，是否进入？", items={50603,8,10030,30302,2}, time=10, cancel="取消", ok="进入战场"},
	[11] = {id=11, desc="<div fontcolor=#d95014>周冠军赛</div>已经开始啦，正在进行竞猜阶段。是否前往参与竞猜？", items={72109,10453,29905,34,1450}, time=10, cancel="取消", ok="前往参与"},
	[12] = {id=12, desc="<div fontcolor=#d95014>周冠军赛</div>马上开始！谁将登上冠军宝座，参与比赛和趣味竞猜可活动丰厚奖励哦~", items={72109,10453,29905,34,1450}, time=10, cancel="取消", ok="前往参与"},
	[13] = {id=13, desc="<div fontcolor=#d95014>巅峰冠军赛</div>已经开始啦，正在进行竞猜阶段。是否前往参与竞猜？", items={72112,50024,10603,27907,38}, time=10, cancel="取消", ok="前往参与"},
	[14] = {id=14, desc="<div fontcolor=#d95014>巅峰冠军赛</div>已经开始啦，正在进行竞猜阶段。是否前往参与竞猜？", items={72112,50024,10603,27907,38}, time=10, cancel="取消", ok="前往参与"}
}
Config.ActivityData.data_sign_info_fun = function(key)
	local data=Config.ActivityData.data_sign_info[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ActivityData.data_sign_info['..key..'])not found') return
	end
	return data
end
-- -------------------sign_info_end---------------------

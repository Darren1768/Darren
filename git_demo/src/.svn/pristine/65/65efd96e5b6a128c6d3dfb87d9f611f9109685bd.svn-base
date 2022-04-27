----------------------------------------------------
-- 此文件由数据工具生成
-- 个人空间成就数据--room_feat_data.xml
--------------------------------------

Config = Config or {} 
Config.RoomFeatData = Config.RoomFeatData or {}

-- -------------------const_start-------------------
Config.RoomFeatData.data_const_length = 3
Config.RoomFeatData.data_const = {
	["experience_open_limit"] = {key='experience_open_limit', val=55, desc="55级开启进阶历练"},
	["badge_open_limit"] = {key='badge_open_limit', val=55, desc="55级开启荣誉墙"},
	["home_world_feat"] = {key='home_world_feat', val=1001, desc="家园彩蛋特殊显示ID"}
}
Config.RoomFeatData.data_const_fun = function(key)
	local data=Config.RoomFeatData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RoomFeatData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------exp_info_start-------------------
Config.RoomFeatData.data_exp_info_length = 117
Config.RoomFeatData.data_exp_info = {
	[1001] = {id=1001, name="神秘礼物", type=2, lev=10, desc="你获得了一份神秘的礼物，快去看看吧", commit_rewards={{10033,1}}, hide=1},
	[40000] = {id=40000, name="试练之塔", type=3, lev=16, desc="通关试练塔第300层", commit_rewards={{55501,1},{1,100000}}, hide=0},
	[40010] = {id=40010, name="试练之塔", type=3, lev=16, desc="通关试练塔第600层", commit_rewards={{55502,1},{1,100000}}, hide=0},
	[41000] = {id=41000, name="越界战斗Ⅰ", type=1, lev=8, desc="PVP中，六回合内战胜战力高于自身的对手，累计3次", commit_rewards={{29,3},{3,50}}, hide=0},
	[41010] = {id=41010, name="越界战斗Ⅱ", type=1, lev=8, desc="PVP中，四回合内战胜战力高于自身的对手，累计3次", commit_rewards={{29,3},{3,100}}, hide=0},
	[42000] = {id=42000, name="冠军赛Ⅰ", type=1, lev=8, desc="冠军赛累计进入3次前32强", commit_rewards={{55411,1},{1,100000}}, hide=0},
	[42010] = {id=42010, name="冠军赛Ⅱ", type=1, lev=8, desc="冠军赛累计进入2次前8强", commit_rewards={{55412,1},{1,100000}}, hide=0},
	[42020] = {id=42020, name="冠军之冕", type=1, lev=8, desc="获得一次冠军赛第1名", commit_rewards={{55413,1},{1,100000}}, hide=0},
	[42100] = {id=42100, name="小试周冠", type=1, lev=55, desc="参与一次周冠军赛战斗", commit_rewards={{10403,1},{3,150}}, hide=0},
	[42110] = {id=42110, name="荣耀之冠Ⅰ", type=1, lev=55, desc="周冠军赛累计进入3次前64强", commit_rewards={{55421,1},{1,100000}}, hide=0},
	[42120] = {id=42120, name="荣耀之冠Ⅱ", type=1, lev=55, desc="周冠军赛累计进入2次前8强", commit_rewards={{55422,1},{1,100000}}, hide=0},
	[42130] = {id=42130, name="勇冠神界", type=1, lev=55, desc="获得一次周冠军赛第1名", commit_rewards={{55423,1},{1,100000}}, hide=0},
	[42200] = {id=42200, name="初登巅峰", type=1, lev=55, desc="参与一次巅峰冠军赛战斗", commit_rewards={{10403,1},{3,150}}, hide=0},
	[42210] = {id=42210, name="巅峰荣耀Ⅰ", type=1, lev=55, desc="巅峰冠军赛累计进入3次前64强", commit_rewards={{55431,1},{1,100000}}, hide=0},
	[42220] = {id=42220, name="巅峰荣耀Ⅱ", type=1, lev=55, desc="巅峰冠军赛累计进入2次前8强", commit_rewards={{55432,1},{1,100000}}, hide=0},
	[42230] = {id=42230, name="众神之巅", type=1, lev=55, desc="获得一次巅峰冠军赛第1名", commit_rewards={{55433,1},{1,100000}}, hide=0},
	[43000] = {id=43000, name="你好毒Ⅰ", type=3, lev=10, desc="单场战斗累计造成150万中毒伤害", commit_rewards={{10403,1},{3,100}}, hide=0},
	[43010] = {id=43010, name="你好毒Ⅱ", type=3, lev=10, desc="单场战斗累计造成300万中毒伤害", commit_rewards={{10403,1},{3,150}}, hide=0},
	[43110] = {id=43110, name="疼疼疼Ⅰ", type=3, lev=10, desc="单场战斗累计造成150万流血伤害", commit_rewards={{10403,1},{3,100}}, hide=0},
	[43120] = {id=43120, name="疼疼疼Ⅱ", type=3, lev=10, desc="单场战斗累计造成300万流血伤害", commit_rewards={{10403,1},{3,150}}, hide=0},
	[43210] = {id=43210, name="熊熊烈焰Ⅰ", type=3, lev=10, desc="单场战斗累计造成150万灼烧伤害", commit_rewards={{10403,1},{3,100}}, hide=0},
	[43220] = {id=43220, name="熊熊烈焰Ⅱ", type=3, lev=10, desc="单场战斗累计造成300万灼烧伤害", commit_rewards={{10403,1},{3,150}}, hide=0},
	[44000] = {id=44000, name="输出担当Ⅰ", type=3, lev=18, desc="公会副本中，单场战斗累计造成150万伤害", commit_rewards={{40112,1},{3,50}}, hide=0},
	[44010] = {id=44010, name="输出担当Ⅱ", type=3, lev=18, desc="公会副本中，单场战斗累计造成300万伤害", commit_rewards={{40212,1},{3,100}}, hide=0},
	[44020] = {id=44020, name="输出担当Ⅲ", type=3, lev=18, desc="公会副本中，单场战斗累计造成500万伤害", commit_rewards={{40412,1},{40312,1}}, hide=0},
	[45000] = {id=45000, name="攻无不克", type=3, lev=18, desc="参与并累计获得10次公会战胜利", commit_rewards={{55311,1},{1,100000}}, hide=0},
	[45010] = {id=45010, name="战无不胜", type=3, lev=18, desc="参与并累计获得50次公会战胜利", commit_rewards={{55312,1},{1,100000}}, hide=0},
	[45020] = {id=45020, name="所向披靡", type=3, lev=18, desc="参与并累计获得100次公会战胜利", commit_rewards={{55313,1},{1,100000}}, hide=0},
	[46000] = {id=46000, name="无尽·初级", type=3, lev=25, desc="首次通关无尽试炼第300关", commit_rewards={{55301,1},{3,100}}, hide=0},
	[46010] = {id=46010, name="无尽·中级", type=3, lev=25, desc="首次通关无尽试炼第450关", commit_rewards={{55302,1},{3,150}}, hide=0},
	[46020] = {id=46020, name="无尽·高级", type=3, lev=25, desc="首次通关无尽试炼第600关", commit_rewards={{55303,1},{3,200}}, hide=0},
	[46030] = {id=46030, name="无尽·巅峰", type=3, lev=25, desc="首次通关无尽试炼第900关", commit_rewards={{55304,1},{3,300}}, hide=0},
	[46800] = {id=46800, name="位面·探险", type=3, lev=30, desc="达成历练：通关第三层任意难度5次", commit_rewards={{55181,1},{1,100000}}, hide=0},
	[46810] = {id=46810, name="位面·突破", type=3, lev=30, desc="达成历练：通关第三层任意难度10次", commit_rewards={{55182,1},{1,100000}}, hide=0},
	[46820] = {id=46820, name="位面·引领", type=3, lev=30, desc="达成历练：通关第三层任意难度15次", commit_rewards={{55183,1},{1,100000}}, hide=0},
	[46830] = {id=46830, name="位面·巅峰", type=3, lev=30, desc="达成历练：通关第三层任意难度20次", commit_rewards={{55184,1},{1,100000}}, hide=0},
	[46840] = {id=46840, name="位面·征战", type=3, lev=30, desc="达成历练：通关第三层任意难度30次", commit_rewards={{55185,1},{1,100000}}, hide=0},
	[47000] = {id=47000, name="位面征战·水", type=3, lev=30, desc="位面征战【极冰雪原】达100%进度3次", commit_rewards={{55201,1},{1,100000}}, hide=1},
	[47010] = {id=47010, name="位面征战·火", type=3, lev=30, desc="位面征战【熔火炼狱】达100%进度3次", commit_rewards={{55202,1},{1,100000}}, hide=1},
	[47020] = {id=47020, name="位面征战·风", type=3, lev=30, desc="位面征战【风棘之森】达100%进度3次", commit_rewards={{55203,1},{1,100000}}, hide=1},
	[47030] = {id=47030, name="位面征战·光", type=3, lev=30, desc="位面征战【神灵遗迹】达100%进度5次", commit_rewards={{55204,1},{1,100000}}, hide=1},
	[47040] = {id=47040, name="位面征战·暗", type=3, lev=30, desc="位面征战【荒黯之墟】达100%进度5次", commit_rewards={{55205,1},{1,100000}}, hide=1},
	[48000] = {id=48000, name="彩虹符文", type=2, lev=55, desc="累计获得10个彩虹符文", commit_rewards={{37002,1},{3,100}}, hide=0},
	[48010] = {id=48010, name="闪烁符文", type=2, lev=55, desc="累计获得10个闪烁符文", commit_rewards={{37002,3},{3,200}}, hide=0},
	[49000] = {id=49000, name="交友广泛", type=2, lev=35, desc="拥有10个跨服好友", commit_rewards={{37001,5},{3,100}}, hide=0},
	[50000] = {id=50000, name="寻宝者", type=3, lev=55, desc="进入神界冒险第40层", commit_rewards={{55401,1},{1,100000}}, hide=0},
	[50010] = {id=50010, name="探险者", type=3, lev=55, desc="进入神界冒险第70层", commit_rewards={{55402,1},{1,100000}}, hide=0},
	[50020] = {id=50020, name="大探险家", type=3, lev=55, desc="进入神界冒险第90层", commit_rewards={{55403,1},{1,100000}}, hide=0},
	[50110] = {id=50110, name="神界冒险Ⅰ", type=3, lev=55, desc="神界冒险累计击杀500个守卫", commit_rewards={{10403,1},{3,50}}, hide=0},
	[50120] = {id=50120, name="神界冒险Ⅱ", type=3, lev=55, desc="神界冒险累计击杀2000个守卫", commit_rewards={{37002,1},{3,100}}, hide=0},
	[50130] = {id=50130, name="神界冒险Ⅲ", type=3, lev=55, desc="神界冒险累计击杀5000个守卫", commit_rewards={{37002,3},{3,150}}, hide=0},
	[51000] = {id=51000, name="天梯之路Ⅰ", type=1, lev=55, desc="跨服天梯累计挑战胜利100次", commit_rewards={{10403,1},{3,50}}, hide=0},
	[51010] = {id=51010, name="天梯之路Ⅱ", type=1, lev=55, desc="跨服天梯累计挑战胜利300次", commit_rewards={{37002,1},{3,100}}, hide=0},
	[51020] = {id=51020, name="天梯之路Ⅲ", type=1, lev=55, desc="跨服天梯累计挑战胜利600次", commit_rewards={{37002,3},{3,150}}, hide=0},
	[51110] = {id=51110, name="天梯之路", type=1, lev=55, desc="跨服天梯赛季结算时获得前20名", commit_rewards={{10403,1},{3,100}}, hide=0},
	[51120] = {id=51120, name="登峰造极", type=1, lev=55, desc="跨服天梯赛季结算时获得第1名", commit_rewards={{10403,1},{3,150}}, hide=0},
	[52000] = {id=52000, name="初露锋芒", type=2, lev=55, desc="最高战力达到100万", commit_rewards={{55702,1},{1,100000}}, hide=0},
	[52010] = {id=52010, name="冠绝一时", type=2, lev=55, desc="最高战力达到200万", commit_rewards={{55703,1},{1,100000}}, hide=0},
	[52020] = {id=52020, name="谁与争锋", type=2, lev=55, desc="最高战力达到350万", commit_rewards={{55704,1},{1,100000}}, hide=0},
	[53000] = {id=53000, name="英雄培养Ⅰ", type=2, lev=55, desc="当前拥有5个10星英雄", commit_rewards={{37002,1},{3,100}}, hide=0},
	[53010] = {id=53010, name="英雄培养Ⅱ", type=2, lev=55, desc="当前拥有5个11星英雄", commit_rewards={{37002,3},{3,200}}, hide=0},
	[53110] = {id=53110, name="水系英雄Ⅰ", type=2, lev=55, desc="使3个水系英雄达到10星", commit_rewards={{37002,1},{3,150}}, hide=0},
	[53120] = {id=53120, name="水系英雄Ⅱ", type=2, lev=55, desc="使1个水系英雄达到11星", commit_rewards={{37002,1},{3,200}}, hide=0},
	[53210] = {id=53210, name="火系英雄Ⅰ", type=2, lev=55, desc="使3个火系英雄达到10星", commit_rewards={{37002,1},{3,150}}, hide=0},
	[53220] = {id=53220, name="火系英雄Ⅱ", type=2, lev=55, desc="使1个火系英雄达到11星", commit_rewards={{37002,1},{3,200}}, hide=0},
	[53310] = {id=53310, name="风系英雄Ⅰ", type=2, lev=55, desc="使3个风系英雄达到10星", commit_rewards={{37002,1},{3,150}}, hide=0},
	[53320] = {id=53320, name="风系英雄Ⅱ", type=2, lev=55, desc="使1个风系英雄达到11星", commit_rewards={{37002,1},{3,200}}, hide=0},
	[53410] = {id=53410, name="光系英雄Ⅰ", type=2, lev=55, desc="使3个光系英雄达到10星", commit_rewards={{37002,1},{3,150}}, hide=0},
	[53420] = {id=53420, name="光系英雄Ⅱ", type=2, lev=55, desc="使1个光系英雄达到11星", commit_rewards={{37002,1},{3,200}}, hide=0},
	[53510] = {id=53510, name="暗系英雄Ⅰ", type=2, lev=55, desc="使3个暗系英雄达到10星", commit_rewards={{37002,1},{3,150}}, hide=0},
	[53520] = {id=53520, name="暗系英雄Ⅱ", type=2, lev=55, desc="使1个暗系英雄达到11星", commit_rewards={{37002,1},{3,200}}, hide=0},
	[53610] = {id=53610, name="神来之手Ⅰ", type=2, lev=8, desc="任意一届冠军赛中11场竞猜全部正确", commit_rewards={{55701,1},{1,100000}}, hide=0},
	[53620] = {id=53620, name="神来之手Ⅱ", type=2, lev=55, desc="任意一届周冠军赛中12场竞猜全部正确", commit_rewards={{55707,1},{1,100000}}, hide=0},
	[53630] = {id=53630, name="神来之手Ⅲ", type=2, lev=55, desc="任意一届巅峰冠军赛中14场竞猜全部正确", commit_rewards={{55708,1},{1,100000}}, hide=0},
	[53710] = {id=53710, name="神力觉醒", type=2, lev=170, desc="获得一位13星英雄", commit_rewards={{55709,1},{1,100000}}, hide=0},
	[75000] = {id=75000, name="天赋领悟Ⅰ", type=2, lev=55, desc="累计领悟10个初级技能", commit_rewards={{10403,1},{3,50}}, hide=0},
	[75010] = {id=75010, name="天赋领悟Ⅱ", type=2, lev=55, desc="累计领悟10个中级技能", commit_rewards={{37002,1},{3,100}}, hide=0},
	[75020] = {id=75020, name="天赋领悟Ⅲ", type=2, lev=55, desc="累计领悟10个高级技能", commit_rewards={{37002,3},{3,150}}, hide=0},
	[76000] = {id=76000, name="元素之力", type=3, lev=90, desc="通关任意圣殿的第6关", commit_rewards={{55101,1},{1,100000}}, hide=0},
	[76010] = {id=76010, name="元素掌控", type=3, lev=90, desc="本周内通过每个圣殿的第6关", commit_rewards={{55102,1},{1,100000}}, hide=0},
	[76110] = {id=76110, name="元素领主", type=3, lev=90, desc="通关任意圣殿的第10关", commit_rewards={{55103,1},{1,100000}}, hide=0},
	[76120] = {id=76120, name="元素主宰", type=3, lev=90, desc="本周内通过每个圣殿的第10关", commit_rewards={{55104,1},{1,100000}}, hide=0},
	[76210] = {id=76210, name="元素圣殿Ⅰ", type=3, lev=90, desc="排行榜结算时累计获得3次前10名", commit_rewards={{29,3},{3,100}}, hide=0},
	[76220] = {id=76220, name="元素圣殿Ⅱ", type=3, lev=90, desc="排行榜结算时累计获得3次前3名", commit_rewards={{29,3},{3,150}}, hide=0},
	[77000] = {id=77000, name="段位精英Ⅰ", type=1, lev=100, desc="超凡段位赛累计获胜100场", commit_rewards={{10403,1},{3,100}}, hide=0},
	[77010] = {id=77010, name="段位精英Ⅱ", type=1, lev=100, desc="超凡段位赛累计获胜1000场", commit_rewards={{37002,3},{3,150}}, hide=0},
	[77110] = {id=77110, name="赛季精英", type=1, lev=100, desc="超凡段位赛赛季结算时达到铂金及以上段位", commit_rewards={{55601,1},{1,100000}}, hide=0},
	[77120] = {id=77120, name="强者之证", type=1, lev=100, desc="超凡段位赛赛季结算时达到钻石及以上段位", commit_rewards={{55602,1},{1,100000}}, hide=0},
	[77210] = {id=77210, name="王者之心", type=1, lev=100, desc="超凡段位赛赛季结算时获得前10名", commit_rewards={{55603,1},{1,100000}}, hide=0},
	[77220] = {id=77220, name="超凡之巅", type=1, lev=100, desc="超凡段位赛赛季结算时获得第1名", commit_rewards={{55604,1},{1,100000}}, hide=0},
	[77310] = {id=77310, name="王者争霸", type=1, lev=100, desc="参与一次王者赛", commit_rewards={{37002,1},{3,100}}, hide=0},
	[78000] = {id=78000, name="天界副本Ⅰ", type=3, lev=105, desc="完美通关天界副本前12章", commit_rewards={{17210,3},{3,50}}, hide=0},
	[78010] = {id=78010, name="天界副本Ⅱ", type=3, lev=105, desc="完美通关天界副本前24章", commit_rewards={{17210,3},{3,50}}, hide=0},
	[78020] = {id=78020, name="天界副本Ⅲ", type=3, lev=105, desc="完美通关天界副本前36章", commit_rewards={{17211,3},{3,50}}, hide=0},
	[80000] = {id=80000, name="跨服竞技Ⅰ", type=1, lev=115, desc="跨服竞技场累计获胜100场", commit_rewards={{10403,1},{3,50}}, hide=0},
	[80010] = {id=80010, name="跨服竞技Ⅱ", type=1, lev=115, desc="跨服竞技场累计获胜1000场", commit_rewards={{37002,1},{3,100}}, hide=0},
	[80020] = {id=80020, name="跨服竞技Ⅲ", type=1, lev=0, desc="跨服竞技场累计获胜2500场", commit_rewards={{37002,3},{3,150}}, hide=0},
	[80110] = {id=80110, name="战场勇者", type=1, lev=115, desc="跨服竞技场赛季结算时获得前10名", commit_rewards={{29,3},{3,100}}, hide=0},
	[80120] = {id=80120, name="天启战神", type=1, lev=115, desc="跨服竞技场赛季结算时获得第1名", commit_rewards={{37002,1},{3,150}}, hide=0},
	[90010] = {id=90010, name="极品符文", type=2, lev=10, desc="出现拥有高级迅捷+高级迟缓的符文", commit_rewards={{10403,1},{3,150}}, hide=1},
	[90020] = {id=90020, name="极品符文", type=2, lev=10, desc="出现拥有高级物连+高级法连的符文", commit_rewards={{10403,1},{3,150}}, hide=1},
	[90030] = {id=90030, name="欧气满满", type=2, lev=10, desc="友情召唤累计获得3个五星英雄", commit_rewards={{55705,1},{1,100000}}, hide=1},
	[90040] = {id=90040, name="欧皇降临", type=2, lev=10, desc="普通召唤累计获得3个五星英雄", commit_rewards={{55706,1},{1,100000}}, hide=1},
	[90050] = {id=90050, name="手气最佳", type=2, lev=18, desc="获得3次公会红包的手气最佳", commit_rewards={{10403,1},{3,100}}, hide=1},
	[90060] = {id=90060, name="中流砥柱", type=2, lev=18, desc="公会捐献累计捐献3万钻石", commit_rewards={{10403,1},{3,100}}, hide=1},
	[90070] = {id=90070, name="我是拳王", type=2, lev=55, desc="冒险猜拳累计获胜100次", commit_rewards={{10403,1},{3,100}}, hide=1},
	[90080] = {id=90080, name="旗鼓相当", type=2, lev=10, desc="战斗中累计触发100次天平模式", commit_rewards={{10403,1},{3,100}}, hide=1},
	[90090] = {id=90090, name="家里有矿", type=2, lev=18, desc="发放的红包累计超过5万钻石", commit_rewards={{10403,1},{3,100}}, hide=1},
	[90100] = {id=90100, name="试炼之境", type=2, lev=10, desc="试炼之境击杀难度5及以上难度第15关boss", commit_rewards={{55801,1},{1,100000}}, hide=1},
	[90110] = {id=90110, name="黄金的勇者", type=2, lev=10, desc="累计充值100000钻石", commit_rewards={{55802,1},{1,100000}}, hide=1},
	[100010] = {id=100010, name="组队竞技", type=1, lev=70, desc="组队竞技场队伍累计胜利100次（队伍挑战次数）", commit_rewards={{10403,1},{3,50}}, hide=0},
	[100020] = {id=100020, name="友谊与荣耀", type=1, lev=70, desc="作为队长参与组队竞技场挑战100次（队伍挑战次数）", commit_rewards={{55901,1},{3,100}}, hide=0},
	[100030] = {id=100030, name="无人可挡", type=1, lev=70, desc="组队竞技场仅用己方前两位出战的选手就击败了对方全部选手累计75次", commit_rewards={{37002,1},{3,100}}, hide=0},
	[100040] = {id=100040, name="勇攀高峰", type=1, lev=70, desc="累计获得组队竞技场赛季结算前5名3次", commit_rewards={{55902,1},{3,150}}, hide=0},
	[100050] = {id=100050, name="群山之巅", type=1, lev=70, desc="获得组队竞技场赛季结算第1名1次", commit_rewards={{55903,1},{3,150}}, hide=0},
	[100060] = {id=100060, name="勇冠三军", type=1, lev=70, desc="作为队伍首个出战的选手击败对方全部三位选手累计25次", commit_rewards={{37002,1},{3,150}}, hide=1},
	[100070] = {id=100070, name="力挽狂澜", type=1, lev=70, desc="作为队伍最后出战的选手击败对方全部三位选手累计25次", commit_rewards={{37002,1},{3,150}}, hide=1}
}
Config.RoomFeatData.data_exp_info_fun = function(key)
	local data=Config.RoomFeatData.data_exp_info[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RoomFeatData.data_exp_info['..key..'])not found') return
	end
	return data
end
-- -------------------exp_info_end---------------------


-- -------------------honor_icon_info_start-------------------
Config.RoomFeatData.data_honor_icon_info_length = 60
Config.RoomFeatData.data_honor_icon_info = {
	[1001] = {id=1001, type_id=1, type_name="试练之塔", name="试练·突破者", desc1="达成历练：通关试练塔300层", desc2="目标只有一个，那就是再突破一层", need_items={{{55501,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_001", quality=3},
	[1002] = {id=1002, type_id=1, type_name="试练之塔", name="试练·引领者", desc1="达成历练：通关试练塔600层", desc2="通往塔顶的道路，就由我来引领你前行吧！", need_items={{{55502,1}}}, point=500, is_show=0, effect_res="E24605", icon_res="wall_icon_002", quality=4},
	[2001] = {id=2001, type_id=2, type_name="无尽试炼", name="无尽·初级", desc1="达成历练：首次通关无尽试炼第300关", desc2="去追寻无尽的意义所在吧！", need_items={{{55301,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_011", quality=3},
	[2002] = {id=2002, type_id=2, type_name="无尽试炼", name="无尽·中级", desc1="达成历练：首次通关无尽试炼第450关", desc2="再向前走，也许你就能追寻它的尽头", need_items={{{55302,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_012", quality=4},
	[2003] = {id=2003, type_id=2, type_name="无尽试炼", name="无尽·高级", desc1="达成历练：首次通关无尽试炼第600关", desc2="这场试炼的终极意义，在于不断超越昨天的自己", need_items={{{55303,1}}}, point=500, is_show=0, effect_res="E24605", icon_res="wall_icon_013", quality=5},
	[2004] = {id=2004, type_id=2, type_name="无尽试炼", name="无尽·巅峰", desc1="达成历练：首次通关无尽试炼第900关", desc2="成为巅峰？还是超越巅峰？", need_items={{{55304,1}}}, point=800, is_show=0, effect_res="E24605", icon_res="wall_icon_014", quality=5},
	[2081] = {id=2081, type_id=3, type_name="位面征战", name="位面·探险", desc1="达成历练：通关第三层任意难度5次", desc2="去冒险，去追寻！", need_items={{{55181,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_1301", quality=4},
	[2082] = {id=2082, type_id=3, type_name="位面征战", name="位面·突破", desc1="达成历练：通关第三层任意难度10次", desc2="再向前走，也许你就能有所突破", need_items={{{55182,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_1302", quality=4},
	[2083] = {id=2083, type_id=3, type_name="位面征战", name="位面·引领", desc1="达成历练：通关第三层任意难度15次", desc2="通往魔王的道路，就由我来引领你前行吧！", need_items={{{55183,1}}}, point=500, is_show=0, effect_res="", icon_res="wall_icon_1303", quality=4},
	[2084] = {id=2084, type_id=3, type_name="位面征战", name="位面·巅峰", desc1="达成历练：通关第三层任意难度20次", desc2="成为巅峰？还是超越巅峰？", need_items={{{55184,1}}}, point=800, is_show=0, effect_res="", icon_res="wall_icon_1304", quality=5},
	[2085] = {id=2085, type_id=3, type_name="位面征战", name="位面·征战", desc1="达成历练：通关第三层任意难度30次", desc2="无休止征战的终极意义，究竟是什么？", need_items={{{55185,1}}}, point=1000, is_show=0, effect_res="E24605", icon_res="wall_icon_1305", quality=5},
	[3001] = {id=3001, type_id=3, type_name="位面征战", name="位面征战·水", desc1="达成历练：位面征战【极冰雪原】达100%进度3次", desc2="水主生长，滋润万物。", need_items={{{55201,1}}}, point=50, is_show=1, effect_res="", icon_res="wall_icon_1201", quality=4},
	[3002] = {id=3002, type_id=3, type_name="位面征战", name="位面征战·火", desc1="达成历练：位面征战【熔火炼狱】达100%进度3次", desc2="火主消亡，梵烧殆尽。", need_items={{{55202,1}}}, point=200, is_show=1, effect_res="", icon_res="wall_icon_1202", quality=4},
	[3003] = {id=3003, type_id=3, type_name="位面征战", name="位面征战·风", desc1="达成历练：位面征战【风棘之森】达100%进度3次", desc2="风主传承，生意盎然。", need_items={{{55203,1}}}, point=500, is_show=1, effect_res="", icon_res="wall_icon_1203", quality=4},
	[3004] = {id=3004, type_id=3, type_name="位面征战", name="位面征战·光", desc1="达成历练：位面征战【神灵遗迹】达100%进度5次", desc2="光主创造，万物敬仰。", need_items={{{55204,1}}}, point=800, is_show=1, effect_res="", icon_res="wall_icon_1204", quality=5},
	[3005] = {id=3005, type_id=3, type_name="位面征战", name="位面征战·暗", desc1="达成历练：位面征战【荒黯之墟】达100%进度5次", desc2="暗主毁灭，归于虚无。", need_items={{{55205,1}}}, point=1000, is_show=1, effect_res="", icon_res="wall_icon_1205", quality=5},
	[4001] = {id=4001, type_id=4, type_name="公会战", name="攻无不克", desc1="达成历练：参与并累计获得10次公会战胜利", desc2="愿你我携手，共同成就公会的辉煌", need_items={{{55311,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_031", quality=3},
	[4002] = {id=4002, type_id=4, type_name="公会战", name="战无不胜", desc1="达成历练：参与并累计获得50次公会战胜利", desc2="以此记录你为公会做出的卓越贡献", need_items={{{55312,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_032", quality=4},
	[4003] = {id=4003, type_id=4, type_name="公会战", name="所向披靡", desc1="达成历练：参与并累计获得100次公会战胜利", desc2="以此纪念我们共同的荣耀与辉煌", need_items={{{55313,1}}}, point=500, is_show=0, effect_res="E24604", icon_res="wall_icon_033", quality=5},
	[5001] = {id=5001, type_id=5, type_name="神界冒险", name="寻宝者", desc1="达成历练：进入神界冒险第40层", desc2="神界还有无尽的宝藏等待着你去探寻", need_items={{{55401,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_041", quality=3},
	[5002] = {id=5002, type_id=5, type_name="神界冒险", name="探险者", desc1="达成历练：进入神界冒险第70层", desc2="危险与机遇并存，真正的冒险者才能见到别样的风景", need_items={{{55402,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_042", quality=4},
	[5003] = {id=5003, type_id=5, type_name="神界冒险", name="大探险家", desc1="达成历练：进入神界冒险第90层", desc2="大探险家的眼里，一定会有不一样的风景吧", need_items={{{55403,1}}}, point=500, is_show=0, effect_res="E24604", icon_res="wall_icon_043", quality=5},
	[6001] = {id=6001, type_id=6, type_name="冠军赛", name="冠军赛·32强", desc1="达成历练：冠军赛累计进入3次前32强", desc2="此徽章的持有者已在冒险大陆上初露锋芒", need_items={{{55411,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_051", quality=3},
	[6002] = {id=6002, type_id=6, type_name="冠军赛", name="冠军赛·8强", desc1="达成历练：冠军赛累计进入2次前8强", desc2="做好准备，冠军的宝座已经近在咫尺", need_items={{{55412,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_052", quality=4},
	[6003] = {id=6003, type_id=6, type_name="冠军赛", name="冠军之冕", desc1="达成历练：获得一次冠军赛第1名", desc2="以冠军之名，为今夜的王者加冕", need_items={{{55413,1}}}, point=500, is_show=0, effect_res="E24605", icon_res="wall_icon_053", quality=5},
	[6011] = {id=6011, type_id=7, type_name="周冠军赛", name="荣耀之冠·64强", desc1="达成历练：周冠军赛累计进入3次前64强", desc2="被征召而至的冒险者将在神域之中崭露头角", need_items={{{55421,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_055", quality=3},
	[6012] = {id=6012, type_id=7, type_name="周冠军赛", name="荣耀之冠·8强", desc1="达成历练：周冠军赛累计进入2次前8强", desc2="前进一步，就是离终点更近一步", need_items={{{55422,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_056", quality=4},
	[6013] = {id=6013, type_id=7, type_name="周冠军赛", name="勇冠神界", desc1="达成历练：获得一次周冠军赛第1名", desc2="唯有一往无前的勇气，才配得上这份万人敬仰的荣誉", need_items={{{55423,1}}}, point=500, is_show=0, effect_res="E24605", icon_res="wall_icon_057", quality=5},
	[6021] = {id=6021, type_id=8, type_name="巅峰冠军赛", name="巅峰荣耀·64强", desc1="达成历练：巅峰冠军赛累计进入3次前64强", desc2="极少冒险者凭卓越表现走到了这一步", need_items={{{55431,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_058", quality=3},
	[6022] = {id=6022, type_id=8, type_name="巅峰冠军赛", name="巅峰荣耀·8强", desc1="达成历练：巅峰冠军赛累计进入2次前8强", desc2="前进一步，就是离终点更近一步", need_items={{{55432,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_059", quality=4},
	[6023] = {id=6023, type_id=8, type_name="巅峰冠军赛", name="众神之巅", desc1="达成历练：获得一次巅峰冠军赛第1名", desc2="唯有万夫莫开的实力，才配得上这份众神敬仰的称号", need_items={{{55433,1}}}, point=500, is_show=0, effect_res="E24605", icon_res="wall_icon_060", quality=5},
	[7001] = {id=7001, type_id=9, type_name="元素圣殿", name="元素之力", desc1="达成历练：通关任意元素圣殿的第6关", desc2="世界的元素一分为五，这将是你主宰世界的起点", need_items={{{55101,1}}}, point=200, is_show=0, effect_res="E24601", icon_res="wall_icon_061", quality=3},
	[7002] = {id=7002, type_id=9, type_name="元素圣殿", name="元素掌控", desc1="达成历练：本周内通过每个元素圣殿的第6关", desc2="世界的元素一分为五，而你已成就了这世界1/5的意志", need_items={{{55102,1}}}, point=500, is_show=0, effect_res="E24601", icon_res="wall_icon_062", quality=4},
	[7003] = {id=7003, type_id=9, type_name="元素圣殿", name="元素领主", desc1="达成历练：通关任意元素圣殿的第10关", desc2="如果不为成为元素主宰而前行，那掌控元素也将失去意义", need_items={{{55103,1}}}, point=500, is_show=0, effect_res="E24602", icon_res="wall_icon_063", quality=4},
	[7004] = {id=7004, type_id=9, type_name="元素圣殿", name="元素主宰", desc1="达成历练：本周内通过每个元素圣殿的第10关", desc2="呼啸汹涌燃烧，就连那光与暗，都愿与他的意志共存亡", need_items={{{55104,1}}}, point=1200, is_show=0, effect_res="E24603", icon_res="wall_icon_064", quality=5},
	[8001] = {id=8001, type_id=10, type_name="超凡段位赛", name="赛季精英", desc1="达成历练：超凡段位赛赛季结算时达到铂金及以上段位", desc2="精英，便是你迈上强者之路的第一步", need_items={{{55601,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_071", quality=3},
	[8002] = {id=8002, type_id=10, type_name="超凡段位赛", name="强者之证", desc1="达成历练：超凡段位赛赛季结算时达到钻石及以上段位", desc2="强者一称，只有更强，没有最强", need_items={{{55602,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_072", quality=4},
	[8003] = {id=8003, type_id=10, type_name="超凡段位赛", name="王者之心", desc1="达成历练：超凡段位赛赛季结算时获得前10名", desc2="所谓王者，从不会止步于王者", need_items={{{55603,1}}}, point=1200, is_show=0, effect_res="E24604", icon_res="wall_icon_073", quality=5},
	[8004] = {id=8004, type_id=10, type_name="超凡段位赛", name="超凡之巅", desc1="达成历练：超凡段位赛赛季结算时获得第1名", desc2="千锤万炼成钢，百战百胜超凡", need_items={{{55604,1}}}, point=1200, is_show=0, effect_res="E24605", icon_res="wall_icon_074", quality=5},
	[9001] = {id=9001, type_id=12, type_name="特殊成就I", name="神明眷顾", desc1="达成历练：任意一届冠军赛中11场竞猜全部正确", desc2="智慧、博学与幸运，将会指引着你", need_items={{{55701,1}}}, point=200, is_show=0, effect_res="E24605", icon_res="wall_icon_900", quality=4},
	[9007] = {id=9007, type_id=12, type_name="特殊成就I", name="神之恩宠", desc1="达成历练：任意一届周冠军赛中12场竞猜全部正确", desc2="如同得到神的恩宠一般，你拥有化腐朽为神奇的力量", need_items={{{55707,1}}}, point=200, is_show=0, effect_res="E24605", icon_res="wall_icon_906", quality=4},
	[9008] = {id=9008, type_id=12, type_name="特殊成就I", name="智慧之神", desc1="达成历练：任意一届巅峰冠军赛中14场竞猜全部正确", desc2="智慧、学识都犹如神明一般，远胜凡人", need_items={{{55708,1}}}, point=200, is_show=0, effect_res="E24605", icon_res="wall_icon_907", quality=5},
	[9009] = {id=9009, type_id=13, type_name="特殊成就II", name="神力觉醒", desc1="达成历练：获得一位13星英雄", desc2="在神的面前，绝对的力量皆为谎言", need_items={{{55709,1}}}, point=500, is_show=1, effect_res="E24605", icon_res="wall_icon_908", quality=5},
	[9002] = {id=9002, type_id=13, type_name="特殊成就II", name="初露锋芒", desc1="达成历练：最高战力达到100万", desc2="利刃出鞘，便是初露锋芒之时", need_items={{{55702,1}}}, point=50, is_show=0, effect_res="", icon_res="wall_icon_901", quality=3},
	[9003] = {id=9003, type_id=13, type_name="特殊成就II", name="冠绝一时", desc1="达成历练：最高战力达到200万", desc2="他人眼中的终点，于他而言不过是起点", need_items={{{55703,1}}}, point=200, is_show=0, effect_res="", icon_res="wall_icon_902", quality=4},
	[9004] = {id=9004, type_id=13, type_name="特殊成就II", name="谁与争锋", desc1="达成历练：最高战力达到350万", desc2="立于顶点的人，必将受到万人敬仰", need_items={{{55704,1}}}, point=500, is_show=0, effect_res="E24605", icon_res="wall_icon_903", quality=5},
	[9005] = {id=9005, type_id=14, type_name="特殊成就III", name="欧气满满", desc1="达成隐藏历练：友情召唤累计获得3个五星英雄", desc2="当你需要五星英雄时，他就这么来了", need_items={{{55705,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_904", quality=4},
	[9006] = {id=9006, type_id=14, type_name="特殊成就III", name="欧皇降临", desc1="达成隐藏历练：普通召唤累计获得3个五星英雄", desc2="这枚徽章只象征一件事：你就是天选之人", need_items={{{55706,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_905", quality=4},
	[9101] = {id=9101, type_id=99, type_name="特殊徽章", name="试炼之境", desc1="达成历练：试炼之境击杀难度5及以上难度第15关boss", desc2="授予在试炼之境中最勇敢的挑战者的证明，极其珍贵", need_items={{{55801,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1000", quality=4},
	[9102] = {id=9102, type_id=99, type_name="特殊徽章", name="黄金的勇者", desc1="累计充值100000钻石后获得", desc2="你所拥有的财富，让所有冒险者都感到不简单，特此为你颁发了这枚纯金打造的徽章", need_items={{{55802,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1001", quality=4},
	[9103] = {id=9103, type_id=99, type_name="特殊徽章", name="冒险的领航人", desc1="参与游戏社区活动，投稿征集，攻略评测获得", desc2="声名远扬的冒险者，也将成为我们的前行的领航之人\n——献予伟大的冒险领航人", need_items={{{55803,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1002", quality=4},
	[9104] = {id=9104, type_id=99, type_name="特殊徽章", name="皇家骑士团", desc1="参与游戏社区活动，投稿征集，攻略评测获得", desc2="手中的剑与盾，为皇家的荣誉而生\n——授予拥有杰出贡献的骑士们", need_items={{{55804,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1003", quality=4},
	[9105] = {id=9105, type_id=99, type_name="特殊徽章", name="智慧之贤者", desc1="参与游戏社区活动，投稿征集，攻略评测获得", desc2="贤者的智慧，是冒险大陆前行的希望之光\n——授予无私奉献的贤者们", need_items={{{55805,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1004", quality=4},
	[9106] = {id=9106, type_id=99, type_name="特殊徽章", name="试炼之星", desc1="星空试炼活动中获得服务器前10名", desc2="授予在星空试炼中超越自我，达到巅峰的最强冒险者们", need_items={{{55806,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1005", quality=4},
	[9107] = {id=9107, type_id=99, type_name="特殊徽章", name="奇境探险家", desc1="参与圣夜奇境活动，达成挑战目标", desc2="授予在圣夜奇境中出色表现的冒险者们，表彰你们的成就", need_items={{{55807,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1006", quality=4},
	[9108] = {id=9108, type_id=99, type_name="特殊徽章", name="冒险嘉年华", desc1="参与欧皇派对七日登陆活动获得", desc2="一场欧皇的盛宴，就缺你了", need_items={{{55808,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1007", quality=4},
	[9109] = {id=9109, type_id=99, type_name="特殊徽章", name="金瑞贺新春", desc1="在新年活动中，挑战一次金色年兽可获得", desc2="献给在年兽活动中表现优异，坚强勇敢的冒险者们", need_items={{{55809,1}}}, point=200, is_show=1, effect_res="E24605", icon_res="wall_icon_1008", quality=4},
	[9201] = {id=9201, type_id=11, type_name="组队竞技场", name="友谊与荣耀", desc1="作为队长参与组队竞技场挑战100次", desc2="你就是群众领袖", need_items={{{55901,1}}}, point=500, is_show=0, effect_res="E24605", icon_res="wall_icon_1101", quality=4},
	[9202] = {id=9202, type_id=11, type_name="组队竞技场", name="勇攀高峰", desc1="累计获得组队竞技场赛季结算前5名3次", desc2="不畏惧艰辛，勇于攀登高峰，挑战强者", need_items={{{55902,1}}}, point=800, is_show=0, effect_res="E24605", icon_res="wall_icon_1102", quality=4},
	[9203] = {id=9203, type_id=11, type_name="组队竞技场", name="群山之巅", desc1="获得组队竞技场赛季结算第1名1次", desc2="众生为你铺平一条通天之路", need_items={{{55903,1}}}, point=1200, is_show=0, effect_res="E24605", icon_res="wall_icon_1103", quality=5}
}
Config.RoomFeatData.data_honor_icon_info_fun = function(key)
	local data=Config.RoomFeatData.data_honor_icon_info[key]
	if DATA_DEBUG and data == nil then
		print('(Config.RoomFeatData.data_honor_icon_info['..key..'])not found') return
	end
	return data
end
-- -------------------honor_icon_info_end---------------------


-- -------------------honor_title_info_start-------------------
Config.RoomFeatData.data_honor_title_info_length = 6
Config.RoomFeatData.data_honor_title_info = {
{min=0, max=199, name="见习骑士", res_id=1},
{min=200, max=1999, name="白银骑士", res_id=2},
{min=2000, max=4999, name="暗夜男爵", res_id=3},
{min=5000, max=9999, name="雷霆子爵", res_id=4},
{min=10000, max=49999, name="红莲伯爵", res_id=5},
{min=50000, max=999999, name="耀光公爵", res_id=6}
}
-- -------------------honor_title_info_end---------------------


-- -------------------type_list_start-------------------
Config.RoomFeatData.data_type_list_length = 3
Config.RoomFeatData.data_type_list = {
	[2] = {{id=90110}, {id=90100}, {id=90090}, {id=90080}, {id=90070}, {id=90060}, {id=90050}, {id=90040}, {id=90030}, {id=90020}, {id=90010}, {id=75020}, {id=75010}, {id=75000}, {id=53710}, {id=53630}, {id=53620}, {id=53610}, {id=53520}, {id=53510}, {id=53420}, {id=53410}, {id=53320}, {id=53310}, {id=53220}, {id=53210}, {id=53120}, {id=53110}, {id=53010}, {id=53000}, {id=52020}, {id=52010}, {id=52000}, {id=49000}, {id=48010}, {id=48000}, {id=1001}},
	[3] = {{id=78020}, {id=78010}, {id=78000}, {id=76220}, {id=76210}, {id=76120}, {id=76110}, {id=76010}, {id=76000}, {id=50130}, {id=50120}, {id=50110}, {id=50020}, {id=50010}, {id=50000}, {id=47040}, {id=47030}, {id=47020}, {id=47010}, {id=47000}, {id=46840}, {id=46830}, {id=46820}, {id=46810}, {id=46800}, {id=46030}, {id=46020}, {id=46010}, {id=46000}, {id=45020}, {id=45010}, {id=45000}, {id=44020}, {id=44010}, {id=44000}, {id=43220}, {id=43210}, {id=43120}, {id=43110}, {id=43010}, {id=43000}, {id=40010}, {id=40000}},
	[1] = {{id=100070}, {id=100060}, {id=100050}, {id=100040}, {id=100030}, {id=100020}, {id=100010}, {id=80120}, {id=80110}, {id=80020}, {id=80010}, {id=80000}, {id=77310}, {id=77220}, {id=77210}, {id=77120}, {id=77110}, {id=77010}, {id=77000}, {id=51120}, {id=51110}, {id=51020}, {id=51010}, {id=51000}, {id=42230}, {id=42220}, {id=42210}, {id=42200}, {id=42130}, {id=42120}, {id=42110}, {id=42100}, {id=42020}, {id=42010}, {id=42000}, {id=41010}, {id=41000}}
}
-- -------------------type_list_end---------------------


-- -------------------show_list_start-------------------
Config.RoomFeatData.data_show_list_length = 2
Config.RoomFeatData.data_show_list = {
	[0] = {{id=9203}, {id=9202}, {id=9201}, {id=9004}, {id=9003}, {id=9002}, {id=9008}, {id=9007}, {id=9001}, {id=8004}, {id=8003}, {id=8002}, {id=8001}, {id=7004}, {id=7003}, {id=7002}, {id=7001}, {id=6023}, {id=6022}, {id=6021}, {id=6013}, {id=6012}, {id=6011}, {id=6003}, {id=6002}, {id=6001}, {id=5003}, {id=5002}, {id=5001}, {id=4003}, {id=4002}, {id=4001}, {id=2085}, {id=2084}, {id=2083}, {id=2082}, {id=2081}, {id=2004}, {id=2003}, {id=2002}, {id=2001}, {id=1002}, {id=1001}},
	[1] = {{id=9109}, {id=9108}, {id=9107}, {id=9106}, {id=9105}, {id=9104}, {id=9103}, {id=9102}, {id=9101}, {id=9006}, {id=9005}, {id=9009}, {id=3005}, {id=3004}, {id=3003}, {id=3002}, {id=3001}}
}
-- -------------------show_list_end---------------------

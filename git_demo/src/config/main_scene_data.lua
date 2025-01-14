Config = Config or {}
Config.city_data = {
	[1] = {
		id=1
		,res_id='centercity'
		,layer_sum=4
		,name='主城'
		,width=1440
		,height=1280
		,building_list={
			--{bid=4 ,name='试\n炼\n塔' ,res='4' ,dun_id=0 ,x=123 ,y=832 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=3},
			{bid=5 ,name='幻\n灵' ,res='5' ,dun_id=0 ,x=800 ,y=1050 ,name_x=650 ,name_y=100 ,dir=0 ,type=1 ,layer=3},
			--{bid=3 ,name='竞\n技\n场' ,res='3' ,dun_id=0 ,x=198 ,y=689 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			{bid=7 ,name='炼\n灵' ,res='7' ,dun_id=10010 ,x=868 ,y=650 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			-- {bid=8 ,name='洗\n灵\n阁' ,res='8' ,dun_id=0 ,x=500 ,y=700 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=3},
			-- {bid=10 ,name='精\n灵\n商\n店' ,res='10' ,dun_id=0 ,x=102 ,y=485 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			--{bid=1 ,name='商\n店' ,res='1' ,dun_id=0 ,x=104 ,y=691 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			{bid=2 ,name='灵\n聚\n堂' ,res='2' ,dun_id=0 ,x=1120 ,y=500 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			{bid=22 ,name='鲁\n班\n船' ,res='2' ,dun_id=0 ,x=1350 ,y=680 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=23 ,name='洗\n灵\n传\n送' ,res='2' ,dun_id=0 ,x=350 ,y=670 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=3},

			{bid=150 ,name='鸟风筝' ,res='E54509' ,dun_id=1 ,x=0 ,y=0 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=92 ,name='星光夜晚' ,res='E54530' ,dun_id=2 ,x=736 ,y=635 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=4},
			-- {bid=13 ,name='跨\n服\n时\n空' ,res='13' ,dun_id=10010 ,x=284 ,y=689 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			{bid=98 ,name='试练塔光柱' ,res='E50060' ,dun_id=0 ,x=999 ,y=934 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=3},
			{bid=97 ,name='召唤水池' ,res='E50063' ,dun_id=0 ,x=1065 ,y=385 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=96 ,name='房子光' ,res='E50062' ,dun_id=0 ,x=139 ,y=286 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=102 ,name='图书白天' ,res='E54513' ,dun_id=1 ,x=1270 ,y=381 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=116 ,name='图书夜晚' ,res='E54518' ,dun_id=2 ,x=1270 ,y=381 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=87 ,name='灯萤火虫夜' ,res='E54533' ,dun_id=2 ,x=506 ,y=94 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=1},
			{bid=90 ,name='商店门' ,res='E54514' ,dun_id=0 ,x=529 ,y=348 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=91 ,name='商店灯夜晚' ,res='E54531' ,dun_id=2 ,x=720 ,y=588 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			-- {bid=11 ,name='秘\n境\n探\n险' ,res='11' ,dun_id=10010 ,x=868 ,y=650 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=3},
			{bid=106 ,name='传送门' ,res='E50070' ,dun_id=0 ,x=1100 ,y=592 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=3},
			{bid=103 ,name='猫咪白天' ,res='E54510' ,dun_id=1 ,x=347 ,y=197 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=104 ,name='猫咪夜晚' ,res='E54516' ,dun_id=2 ,x=1082 ,y=188 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			--{bid=12 ,name='跨\n服\n战\n场' ,res='12' ,dun_id=10010 ,x=238 ,y=839 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=3},
			{bid=84 ,name='光剑夜晚' ,res='E54535' ,dun_id=2 ,x=1178 ,y=815 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=3},
			{bid=83 ,name='光剑白天' ,res='E54534' ,dun_id=1 ,x=1178 ,y=815 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=3},
			{bid=131 ,name='右中树白天' ,res='E54545' ,dun_id=1 ,x=1219 ,y=348 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=132 ,name='右中树夜晚' ,res='E54546' ,dun_id=2 ,x=1219 ,y=348 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=128 ,name='中树白天' ,res='E54543' ,dun_id=1 ,x=643 ,y=496 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=129 ,name='中树夜晚' ,res='E54544' ,dun_id=2 ,x=643 ,y=496 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=135 ,name='右树白天' ,res='E54547' ,dun_id=1 ,x=1490 ,y=369 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=1},
			{bid=136 ,name='右树夜晚' ,res='E54548' ,dun_id=2 ,x=1490 ,y=369 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=1},
			{bid=144 ,name='前景花白天' ,res='E54551' ,dun_id=1 ,x=210 ,y=-28 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=1},
			{bid=145 ,name='前景花夜晚' ,res='E54552' ,dun_id=2 ,x=210 ,y=-28 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=1},
			{bid=147 ,name='小船白天' ,res='E54553' ,dun_id=1 ,x=1087 ,y=378 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=148 ,name='小船夜晚' ,res='E54554' ,dun_id=2 ,x=1087 ,y=378 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=156 ,name='蝴蝶白天' ,res='E54557' ,dun_id=1 ,x=643 ,y=225 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=157 ,name='蝴蝶2夏' ,res='E54558' ,dun_id=1 ,x=1012 ,y=254 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=152 ,name='主城云白天' ,res='E54555' ,dun_id=1 ,x=836 ,y=510 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=4},
			{bid=153 ,name='旗子白天' ,res='E54556' ,dun_id=1 ,x=494 ,y=1052 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=158 ,name='蝴蝶3' ,res='E54557' ,dun_id=1 ,x=997 ,y=208 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=159 ,name='蝴蝶4' ,res='E54558' ,dun_id=1 ,x=720 ,y=187 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=160 ,name='旗子夜晚' ,res='E54560' ,dun_id=2 ,x=495 ,y=1052 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			-- {bid=14 ,name='家\n园' ,res='14' ,dun_id=0 ,x=184 ,y=456 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			-- {bid=15 ,name='原\n力\n水\n晶' ,res='15' ,dun_id=10010 ,x=1300 ,y=865 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			-- {bid=16 ,name='幸\n运\n探\n宝' ,res='16' ,dun_id=0 ,x=199 ,y=395 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			{bid=170 ,name='幸运转盘' ,res='E54562' ,dun_id=0 ,x=480 ,y=300 ,name_x=100 ,name_y=100 ,dir=0 ,type=3 ,layer=2},
			{bid=171 ,name='白天水池一圈花' ,res='E54539' ,dun_id=1 ,x=836 ,y=201 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=172 ,name='晚上水池一圈花' ,res='E54540' ,dun_id=2 ,x=836 ,y=201 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=175 ,name='左树白天' ,res='E54541' ,dun_id=1 ,x=-24 ,y=634 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=176 ,name='左树夜晚' ,res='E54542' ,dun_id=2 ,x=-24 ,y=634 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=180 ,name='召唤水晶球' ,res='E50061' ,dun_id=0 ,x=840 ,y=235 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=200 ,name='水池小人' ,res='E50066' ,dun_id=0 ,x=847 ,y=234 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=82 ,name='夜晚商店灯' ,res='E54532' ,dun_id=2 ,x=735 ,y=566 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
			{bid=120 ,name='白天落叶' ,res='E50067' ,dun_id=1 ,x=85 ,y=199 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=2},
		}
	},
	[2] = {
		id=2
		,res_id='centercity_2'
		,layer_sum=1
		,name='主城_2'
		,width=720
		,height=1280
		,building_list={
			{bid=1 ,name='商城' ,res='1' ,dun_id=10010 ,x=403 ,y=582 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=2 ,name='铁匠铺' ,res='2' ,dun_id=10010 ,x=97 ,y=708 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=3 ,name='竞技场' ,res='3' ,dun_id=10010 ,x=608 ,y=517 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=4 ,name='灵修卷' ,res='4' ,dun_id=10010 ,x=511 ,y=886 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=5 ,name='召唤' ,res='5' ,dun_id=10010 ,x=317 ,y=449 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=6 ,name='融合祭坛' ,res='6' ,dun_id=10010 ,x=800 ,y=550 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=2},
			{bid=7 ,name='祭祀小屋' ,res='7' ,dun_id=10010 ,x=679 ,y=803 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=8 ,name='先知圣殿' ,res='8' ,dun_id=10010 ,x=418 ,y=733 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=9 ,name='图书馆' ,res='9' ,dun_id=10010 ,x=271 ,y=705 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
			{bid=10 ,name='杂货店' ,res='10' ,dun_id=10010 ,x=124 ,y=429 ,name_x=100 ,name_y=100 ,dir=0 ,type=1 ,layer=1},
		}
	},
	[3] = {
		id=3
		,res_id='business'
		,layer_sum=3
		,name='商业街'
		,width=1080
		,height=1106
		,building_list={
			{bid=1 ,name='积分商店' ,res='1' ,dun_id=0 ,x=322 ,y=392 ,name_x=60 ,name_y=-80 ,dir=0 ,type=1 ,layer=1},
			-- {bid=2 ,name='精灵商店' ,res='2' ,dun_id=0 ,x=298 ,y=634 ,name_x=72 ,name_y=-75 ,dir=0 ,type=1 ,layer=1},
			{bid=3 ,name='礼包商店' ,res='3' ,dun_id=0 ,x=646 ,y=734 ,name_x=-15 ,name_y=-140 ,dir=0 ,type=1 ,layer=1},
			{bid=4 ,name='皮肤商店' ,res='4' ,dun_id=0 ,x=404 ,y=796 ,name_x=50 ,name_y=-40 ,dir=0 ,type=1 ,layer=1},
			{bid=5 ,name='圣羽商店' ,res='5' ,dun_id=0 ,x=771 ,y=1066 ,name_x=60 ,name_y=-105 ,dir=0 ,type=1 ,layer=2},
			{bid=6 ,name='道具商城' ,res='6' ,dun_id=0 ,x=751 ,y=385 ,name_x=10 ,name_y=-100 ,dir=0 ,type=1 ,layer=1},
			{bid=20 ,name='飞艇特效' ,res='E27303' ,dun_id=0 ,x=625 ,y=760 ,name_x=100 ,name_y=100 ,dir=0 ,type=2 ,layer=1},
		}
	},
	[4] = {
		id=4
		,res_id='hl_bigbg_55'
		,layer_sum=1
		,name='灵界'
		,width=1440
		,height=1280
		,building_list={
			-- {bid=18 ,name='灵界' ,dun_id=0 ,x=450 ,y=1108 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},--原灵界
			{bid=50 ,name='灵\n界' ,dun_id=0 ,x=668 ,y=1105 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1}, -- 探索历练
			{bid=1 ,name='商\n店' ,dun_id=0 ,x=1400 ,y=929 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
			{bid=19 ,name='金\n鱼\n悬\n赏'  ,dun_id=0 ,x=490 ,y=850 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
			{bid=4 ,name='灵\n修\n卷'  ,dun_id=0 ,x=1324 ,y=385 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
			{bid=12 ,name='竞\n技\n馆'  ,dun_id=0 ,x=569 ,y=589 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
			{bid=20 ,name='公\n会\n管\n理'  ,dun_id=0 ,x=760 ,y=182 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
            {bid=17 ,name='灵\n魂\n阁'  ,dun_id=0 ,x=35 ,y=834 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
            {bid=21 ,name='排\n行\n榜'  ,dun_id=0 ,x=455 ,y=252 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=2 ,name='竞\n技\n场'  ,dun_id=0 ,x=700 ,y=450 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
			{bid=200 ,name='大\n师\n牌'  ,dun_id=0 ,x=570 ,y=598 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1}, -- 跨服天梯
			{bid=31 ,name='将\n灵'  ,dun_id=0 ,x=1080 ,y=550 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1}, --周冠军赛
			{bid=28 ,name='武\n神\n挑\n战'  ,dun_id=0 ,x=1054 ,y=798 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1}, -- 跨服竞技场

		}
	},
}
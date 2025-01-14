----------------------------------------------------
-- 此文件由数据工具生成
-- 共鸣石碑--resonate_data.xml
--------------------------------------

Config = Config or {} 
Config.ResonateData = Config.ResonateData or {}

-- -------------------const_start-------------------
Config.ResonateData.data_const_length = 20
Config.ResonateData.data_const = {
	["open_lev"] = {val=90, desc="角色达90级开启"},
	["hero_star_condition"] = {val=3, desc="只有3星或以上的英雄才可被配置到圣阵中"},
	["empowerment_day_limit"] = {val=2, desc="每日赋能次数限制"},
	["rule_tips"] = {val=1, desc="1.水晶增幅可升级，增幅阶段越高对全体英雄的属性加成越高；增幅升级需要消耗<div fontcolor=65df74>【天晶魔液】</div>和<div fontcolor=65df74>【金币】</div>，其中天晶魔液可在“魔液炼金”中提炼获得，也可通过<div fontcolor=65df74>周冠军赛商店</div>兑换获得\n2.增幅受供奉英雄星级影响，供奉英雄的<div fontcolor=65df74>总星级</div>越高，对增幅的属性额外加成越高\n3.供奉英雄历史最高总星数达到<div fontcolor=65df74>30星</div>时，可开启<div fontcolor=65df74>“赋能”</div>功能"},
	["empowerment_rule_tips"] = {val=1, desc="1.供奉英雄总星级数达30星后开启赋能功能\n2.玩家可挑选一个星级较低的英雄，通过赋能创造出一个高星的同名英雄，等级、阶级均为目标星级下的最大值（<div fontcolor=65df74>目标星级为13星时，赋能等级随水晶等级突破而提升</div>）\n3.赋能后的英雄有效时间为<div fontcolor=65df74>1天</div>，失效后该英雄身上的装备、神装、符文均会返还到背包中\n4.赋能创造会消耗一定的<div fontcolor=65df74>【共鸣遗物】</div>和<div fontcolor=65df74>【金币】</div>，其中共鸣遗物可在<div fontcolor=65df74>超凡段位赛商店</div>中兑换获得\n5.赋能后的新英雄只可参与主线推图、竞技场、试练塔、元素圣殿等玩法，具体请以玩法提示为准；且该英雄不能被献祭和作为材料被消耗，不可作为赋能创造所需低星英雄"},
	["empowerment_condition"] = {val=30, desc="赋能需供奉英雄历史最高总星数达30"},
	["single_refine_consume"] = {val={{22,30000}}, desc="单个材料提料消耗经验"},
	["alchemy_goods"] = {val=10095, desc="炼金获取的材料ID"},
	["empowerment_span"] = {val=1440, desc="赋能英雄持续时间（单位：分钟）"},
	["extract_rule"] = {val=1, desc="1.可在此将英雄经验提炼为<div fontcolor=65df74>【天晶魔液】</div>，可用于增幅提升\n2.炼金等级等同于增幅等级，<div fontcolor=65df74>等级越高提炼效率越高</div>\n3.提炼效率与经验注入上限随着炼金等级的提高而提高"},
	["cell_init"] = {val=1, desc="初始免费共鸣槽位"},
	["cell_max"] = {val=20, desc="共鸣槽位上限"},
	["cell_cool_time"] = {val=1440, desc="槽位冷却时间（分钟）"},
	["cell_flush_expend"] = {val={{3,300}}, desc="刷新冷却时间消耗"},
	["amp_all_start_limit"] = {val=50, desc="增幅需供奉英雄历史最高总星数达50"},
	["cystal_pre_lev_limit"] = {val=340, desc="原力水晶前期等级上限"},
	["star_add_lev_12"] = {val=2, desc="每个12星英雄加的等级上限"},
	["star_add_lev_13"] = {val=4, desc="每个13星英雄加的等级上限"},
	["cystal_max_lev_limit"] = {val=400, desc="水晶最高等级限制"},
	["rule_tips2"] = {val=1, desc="1.<div fontcolor=65df74>等级最高</div>的5名英雄自动成为水晶供奉英雄。\n2.放入槽位的英雄会提升至<div fontcolor=65df74>水晶等级</div>，英雄星级<div fontcolor=65df74>保持不变</div>，提升后的等级仍然受到英雄品质的<div fontcolor=65df74>等级限制</div>。\n3.放入槽位的英雄可正常升星，也可在各玩法中使用，但<div fontcolor=65df74>无法进行升级、献祭、回退</div>等操作\n4.当英雄离开槽位时，槽位会进入24小时的冷却时间，冷却时间完毕后可以重新放入英雄，可以花费钻石立即刷新冷却时间。\n5.英雄被动离开槽位时，该槽位不会进入冷却时间。\n6.<div fontcolor=65df74>水晶等级</div>在340级前，由供奉英雄中等级最低者决定。\n7.当供奉英雄都达到<div fontcolor=65df74>340级</div>后，可以突破更高的水晶等级上限。\n8.水晶等级突破后，将不再依赖供奉英雄，可消耗资源进行升级，所有槽内英雄同步提升等级。\n9.水晶等级突破后，每拥有一个<div fontcolor=65df74>12星/13星</div>英雄，为突破后的水晶提供<div fontcolor=65df74>2/4级</div>的等级上限。\n10.水晶槽位可花费<div fontcolor=65df74>原能碎片</div>和<div fontcolor=65df74>钻石</div>开启，<div fontcolor=65df74>原能碎片</div>可在剧情副本中挂机获得。"}
}
Config.ResonateData.data_const_fun = function(key)
	local data=Config.ResonateData.data_const[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ResonateData.data_const['..key..'])not found') return
	end
	return data
end
-- -------------------const_end---------------------


-- -------------------pos_info_start-------------------
Config.ResonateData.data_pos_info_length = 5
Config.ResonateData.data_pos_info = {
	[1] = {pos=1, pos_cond={{'lev',90}}},
	[2] = {pos=2, pos_cond={{'lev',90}}},
	[3] = {pos=3, pos_cond={{'lev',90}}},
	[4] = {pos=4, pos_cond={{'lev',90}}},
	[5] = {pos=5, pos_cond={{'lev',90}}}
}
Config.ResonateData.data_pos_info_fun = function(key)
	local data=Config.ResonateData.data_pos_info[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ResonateData.data_pos_info['..key..'])not found') return
	end
	return data
end
-- -------------------pos_info_end---------------------


-- -------------------level_up_start-------------------
Config.ResonateData.data_level_up_length = 200
Config.ResonateData.data_level_up_cache = {}
Config.ResonateData.data_level_up = function(key)
	if Config.ResonateData.data_level_up_cache[key] == nil then
		local base = Config.ResonateData.data_level_up_table[key]
		if not base then return end
		base = loadstring(string.format('return %s',base))()
		if not base then return end
		Config.ResonateData.data_level_up_cache[key] = {
			lev = base[1],
			expend = base[2],
			attr = base[3],
			limit_num = base[4],
			need_time = base[5],
		}
	end
	return Config.ResonateData.data_level_up_cache[key] 
end
Config.ResonateData.data_level_up_table = {
	[200] = [[{200, {{10095,2833},{1,8499000}}, {{'hp_max',109068},{'atk',10328},{'def',270}}, 1045, 42}]],
	[199] = [[{199, {{10095,2812},{1,8436000}}, {{'hp_max',108259},{'atk',10251},{'def',268}}, 1040, 42}]],
	[198] = [[{198, {{10095,2791},{1,8373000}}, {{'hp_max',107451},{'atk',10174},{'def',266}}, 1035, 44}]],
	[197] = [[{197, {{10095,2770},{1,8310000}}, {{'hp_max',106642},{'atk',10098},{'def',264}}, 1030, 44}]],
	[196] = [[{196, {{10095,2749},{1,8247000}}, {{'hp_max',105834},{'atk',10021},{'def',262}}, 1025, 46}]],
	[195] = [[{195, {{10095,2728},{1,8184000}}, {{'hp_max',105025},{'atk',9945},{'def',260}}, 1020, 46}]],
	[194] = [[{194, {{10095,2707},{1,8121000}}, {{'hp_max',104217},{'atk',9868},{'def',258}}, 1015, 48}]],
	[193] = [[{193, {{10095,2686},{1,8058000}}, {{'hp_max',103408},{'atk',9792},{'def',256}}, 1010, 48}]],
	[192] = [[{192, {{10095,2665},{1,7995000}}, {{'hp_max',102600},{'atk',9715},{'def',254}}, 1005, 50}]],
	[191] = [[{191, {{10095,2644},{1,7932000}}, {{'hp_max',101791},{'atk',9638},{'def',252}}, 1000, 50}]],
	[190] = [[{190, {{10095,2623},{1,7869000}}, {{'hp_max',100983},{'atk',9562},{'def',250}}, 995, 52}]],
	[189] = [[{189, {{10095,2603},{1,7809000}}, {{'hp_max',100213},{'atk',9489},{'def',248}}, 990, 52}]],
	[188] = [[{188, {{10095,2582},{1,7746000}}, {{'hp_max',99404},{'atk',9412},{'def',246}}, 985, 54}]],
	[187] = [[{187, {{10095,2562},{1,7686000}}, {{'hp_max',98634},{'atk',9340},{'def',244}}, 980, 54}]],
	[186] = [[{186, {{10095,2541},{1,7623000}}, {{'hp_max',97826},{'atk',9263},{'def',242}}, 975, 56}]],
	[185] = [[{185, {{10095,2521},{1,7563000}}, {{'hp_max',97056},{'atk',9190},{'def',240}}, 970, 56}]],
	[184] = [[{184, {{10095,2500},{1,7500000}}, {{'hp_max',96247},{'atk',9114},{'def',238}}, 965, 58}]],
	[183] = [[{183, {{10095,2480},{1,7440000}}, {{'hp_max',95477},{'atk',9041},{'def',236}}, 960, 58}]],
	[182] = [[{182, {{10095,2460},{1,7380000}}, {{'hp_max',94707},{'atk',8968},{'def',234}}, 955, 60}]],
	[181] = [[{181, {{10095,2440},{1,7320000}}, {{'hp_max',93937},{'atk',8895},{'def',232}}, 950, 60}]],
	[180] = [[{180, {{10095,2419},{1,7257000}}, {{'hp_max',93129},{'atk',8818},{'def',230}}, 945, 62}]],
	[179] = [[{179, {{10095,2399},{1,7197000}}, {{'hp_max',92359},{'atk',8745},{'def',228}}, 940, 62}]],
	[178] = [[{178, {{10095,2379},{1,7137000}}, {{'hp_max',91589},{'atk',8672},{'def',226}}, 935, 64}]],
	[177] = [[{177, {{10095,2359},{1,7077000}}, {{'hp_max',90819},{'atk',8599},{'def',224}}, 930, 64}]],
	[176] = [[{176, {{10095,2339},{1,7017000}}, {{'hp_max',90049},{'atk',8527},{'def',222}}, 925, 66}]],
	[175] = [[{175, {{10095,2320},{1,6960000}}, {{'hp_max',89317},{'atk',8457},{'def',220}}, 920, 66}]],
	[174] = [[{174, {{10095,2300},{1,6900000}}, {{'hp_max',88547},{'atk',8384},{'def',218}}, 915, 68}]],
	[173] = [[{173, {{10095,2280},{1,6840000}}, {{'hp_max',87777},{'atk',8311},{'def',216}}, 910, 68}]],
	[172] = [[{172, {{10095,2260},{1,6780000}}, {{'hp_max',87008},{'atk',8239},{'def',214}}, 905, 70}]],
	[171] = [[{171, {{10095,2241},{1,6723000}}, {{'hp_max',86276},{'atk',8169},{'def',212}}, 900, 70}]],
	[170] = [[{170, {{10095,2221},{1,6663000}}, {{'hp_max',85506},{'atk',8096},{'def',210}}, 895, 72}]],
	[169] = [[{169, {{10095,2202},{1,6606000}}, {{'hp_max',84775},{'atk',8027},{'def',208}}, 890, 72}]],
	[168] = [[{168, {{10095,2182},{1,6546000}}, {{'hp_max',84005},{'atk',7954},{'def',206}}, 885, 74}]],
	[167] = [[{167, {{10095,2163},{1,6489000}}, {{'hp_max',83273},{'atk',7885},{'def',204}}, 880, 74}]],
	[166] = [[{166, {{10095,2143},{1,6429000}}, {{'hp_max',82503},{'atk',7812},{'def',202}}, 875, 76}]],
	[165] = [[{165, {{10095,2124},{1,6372000}}, {{'hp_max',81772},{'atk',7743},{'def',200}}, 870, 76}]],
	[164] = [[{164, {{10095,2105},{1,6315000}}, {{'hp_max',81040},{'atk',7673},{'def',198}}, 865, 78}]],
	[163] = [[{163, {{10095,2086},{1,6258000}}, {{'hp_max',80309},{'atk',7604},{'def',196}}, 860, 78}]],
	[162] = [[{162, {{10095,2066},{1,6198000}}, {{'hp_max',79539},{'atk',7531},{'def',194}}, 855, 80}]],
	[161] = [[{161, {{10095,2047},{1,6141000}}, {{'hp_max',78807},{'atk',7462},{'def',192}}, 850, 80}]],
	[160] = [[{160, {{10095,2028},{1,6084000}}, {{'hp_max',78076},{'atk',7393},{'def',190}}, 845, 82}]],
	[159] = [[{159, {{10095,2009},{1,6027000}}, {{'hp_max',77344},{'atk',7324},{'def',188}}, 840, 82}]],
	[158] = [[{158, {{10095,1991},{1,5973000}}, {{'hp_max',76651},{'atk',7258},{'def',186}}, 835, 84}]],
	[157] = [[{157, {{10095,1972},{1,5916000}}, {{'hp_max',75920},{'atk',7189},{'def',184}}, 830, 84}]],
	[156] = [[{156, {{10095,1953},{1,5859000}}, {{'hp_max',75188},{'atk',7119},{'def',182}}, 825, 86}]],
	[155] = [[{155, {{10095,1934},{1,5802000}}, {{'hp_max',74457},{'atk',7050},{'def',180}}, 820, 86}]],
	[154] = [[{154, {{10095,1916},{1,5748000}}, {{'hp_max',73764},{'atk',6984},{'def',178}}, 815, 88}]],
	[153] = [[{153, {{10095,1897},{1,5691000}}, {{'hp_max',73032},{'atk',6915},{'def',176}}, 810, 88}]],
	[152] = [[{152, {{10095,1878},{1,5634000}}, {{'hp_max',72301},{'atk',6846},{'def',174}}, 805, 90}]],
	[151] = [[{151, {{10095,1860},{1,5580000}}, {{'hp_max',71608},{'atk',6780},{'def',172}}, 800, 90}]],
	[150] = [[{150, {{10095,1842},{1,5526000}}, {{'hp_max',70915},{'atk',6715},{'def',170}}, 795, 92}]],
	[149] = [[{149, {{10095,1823},{1,5469000}}, {{'hp_max',70183},{'atk',6645},{'def',168}}, 790, 92}]],
	[148] = [[{148, {{10095,1805},{1,5415000}}, {{'hp_max',69490},{'atk',6580},{'def',166}}, 785, 94}]],
	[147] = [[{147, {{10095,1787},{1,5361000}}, {{'hp_max',68797},{'atk',6514},{'def',164}}, 780, 94}]],
	[146] = [[{146, {{10095,1769},{1,5307000}}, {{'hp_max',68104},{'atk',6449},{'def',162}}, 775, 96}]],
	[145] = [[{145, {{10095,1751},{1,5253000}}, {{'hp_max',67411},{'atk',6383},{'def',160}}, 770, 96}]],
	[144] = [[{144, {{10095,1733},{1,5199000}}, {{'hp_max',66718},{'atk',6317},{'def',158}}, 765, 98}]],
	[143] = [[{143, {{10095,1715},{1,5145000}}, {{'hp_max',66025},{'atk',6252},{'def',156}}, 760, 98}]],
	[142] = [[{142, {{10095,1697},{1,5091000}}, {{'hp_max',65333},{'atk',6186},{'def',154}}, 755, 100}]],
	[141] = [[{141, {{10095,1679},{1,5037000}}, {{'hp_max',64640},{'atk',6120},{'def',152}}, 750, 100}]],
	[140] = [[{140, {{10095,1661},{1,4983000}}, {{'hp_max',63947},{'atk',6055},{'def',150}}, 745, 102}]],
	[139] = [[{139, {{10095,1643},{1,4929000}}, {{'hp_max',63254},{'atk',5989},{'def',148}}, 740, 102}]],
	[138] = [[{138, {{10095,1626},{1,4878000}}, {{'hp_max',62599},{'atk',5927},{'def',146}}, 735, 104}]],
	[137] = [[{137, {{10095,1608},{1,4824000}}, {{'hp_max',61906},{'atk',5862},{'def',144}}, 730, 104}]],
	[136] = [[{136, {{10095,1591},{1,4773000}}, {{'hp_max',61252},{'atk',5800},{'def',142}}, 725, 106}]],
	[135] = [[{135, {{10095,1573},{1,4719000}}, {{'hp_max',60559},{'atk',5734},{'def',140}}, 720, 106}]],
	[134] = [[{134, {{10095,1556},{1,4668000}}, {{'hp_max',59904},{'atk',5672},{'def',138}}, 715, 108}]],
	[133] = [[{133, {{10095,1538},{1,4614000}}, {{'hp_max',59211},{'atk',5606},{'def',136}}, 710, 108}]],
	[132] = [[{132, {{10095,1521},{1,4563000}}, {{'hp_max',58557},{'atk',5544},{'def',134}}, 705, 110}]],
	[131] = [[{131, {{10095,1504},{1,4512000}}, {{'hp_max',57902},{'atk',5482},{'def',132}}, 700, 110}]],
	[130] = [[{130, {{10095,1487},{1,4461000}}, {{'hp_max',57248},{'atk',5421},{'def',131}}, 695, 112}]],
	[129] = [[{129, {{10095,1470},{1,4410000}}, {{'hp_max',56593},{'atk',5359},{'def',130}}, 690, 112}]],
	[128] = [[{128, {{10095,1453},{1,4359000}}, {{'hp_max',55939},{'atk',5297},{'def',129}}, 685, 114}]],
	[127] = [[{127, {{10095,1436},{1,4308000}}, {{'hp_max',55284},{'atk',5235},{'def',128}}, 680, 114}]],
	[126] = [[{126, {{10095,1419},{1,4257000}}, {{'hp_max',54630},{'atk',5173},{'def',127}}, 675, 116}]],
	[125] = [[{125, {{10095,1402},{1,4206000}}, {{'hp_max',53975},{'atk',5111},{'def',126}}, 670, 116}]],
	[124] = [[{124, {{10095,1385},{1,4155000}}, {{'hp_max',53321},{'atk',5049},{'def',125}}, 665, 118}]],
	[123] = [[{123, {{10095,1369},{1,4107000}}, {{'hp_max',52705},{'atk',4990},{'def',124}}, 660, 118}]],
	[122] = [[{122, {{10095,1352},{1,4056000}}, {{'hp_max',52050},{'atk',4928},{'def',123}}, 655, 120}]],
	[121] = [[{121, {{10095,1336},{1,4008000}}, {{'hp_max',51434},{'atk',4870},{'def',122}}, 650, 120}]],
	[120] = [[{120, {{10095,1319},{1,3957000}}, {{'hp_max',50780},{'atk',4808},{'def',121}}, 645, 122}]],
	[119] = [[{119, {{10095,1303},{1,3909000}}, {{'hp_max',50164},{'atk',4750},{'def',120}}, 640, 122}]],
	[118] = [[{118, {{10095,1286},{1,3858000}}, {{'hp_max',49509},{'atk',4688},{'def',119}}, 635, 124}]],
	[117] = [[{117, {{10095,1270},{1,3810000}}, {{'hp_max',48893},{'atk',4629},{'def',118}}, 630, 124}]],
	[116] = [[{116, {{10095,1254},{1,3762000}}, {{'hp_max',48277},{'atk',4571},{'def',117}}, 625, 126}]],
	[115] = [[{115, {{10095,1238},{1,3714000}}, {{'hp_max',47661},{'atk',4513},{'def',116}}, 620, 126}]],
	[114] = [[{114, {{10095,1222},{1,3666000}}, {{'hp_max',47045},{'atk',4454},{'def',115}}, 615, 128}]],
	[113] = [[{113, {{10095,1206},{1,3618000}}, {{'hp_max',46429},{'atk',4396},{'def',114}}, 610, 128}]],
	[112] = [[{112, {{10095,1190},{1,3570000}}, {{'hp_max',45813},{'atk',4338},{'def',113}}, 605, 130}]],
	[111] = [[{111, {{10095,1174},{1,3522000}}, {{'hp_max',45197},{'atk',4279},{'def',112}}, 600, 130}]],
	[110] = [[{110, {{10095,1158},{1,3474000}}, {{'hp_max',44581},{'atk',4221},{'def',111}}, 595, 132}]],
	[109] = [[{109, {{10095,1142},{1,3426000}}, {{'hp_max',43965},{'atk',4163},{'def',110}}, 590, 132}]],
	[108] = [[{108, {{10095,1127},{1,3381000}}, {{'hp_max',43388},{'atk',4108},{'def',109}}, 585, 134}]],
	[107] = [[{107, {{10095,1111},{1,3333000}}, {{'hp_max',42772},{'atk',4050},{'def',108}}, 580, 134}]],
	[106] = [[{106, {{10095,1096},{1,3288000}}, {{'hp_max',42195},{'atk',3995},{'def',107}}, 575, 136}]],
	[105] = [[{105, {{10095,1080},{1,3240000}}, {{'hp_max',41579},{'atk',3937},{'def',106}}, 570, 136}]],
	[104] = [[{104, {{10095,1065},{1,3195000}}, {{'hp_max',41001},{'atk',3882},{'def',105}}, 565, 138}]],
	[103] = [[{103, {{10095,1050},{1,3150000}}, {{'hp_max',40424},{'atk',3827},{'def',104}}, 560, 138}]],
	[102] = [[{102, {{10095,1035},{1,3105000}}, {{'hp_max',39846},{'atk',3773},{'def',103}}, 555, 140}]],
	[101] = [[{101, {{10095,1020},{1,3060000}}, {{'hp_max',39269},{'atk',3718},{'def',102}}, 550, 140}]],
	[100] = [[{100, {{10095,1005},{1,3015000}}, {{'hp_max',38691},{'atk',3663},{'def',101}}, 545, 142}]],
	[99] = [[{99, {{10095,990},{1,2970000}}, {{'hp_max',38114},{'atk',3609},{'def',100}}, 540, 142}]],
	[98] = [[{98, {{10095,975},{1,2925000}}, {{'hp_max',37536},{'atk',3554},{'def',99}}, 535, 144}]],
	[97] = [[{97, {{10095,960},{1,2880000}}, {{'hp_max',36959},{'atk',3499},{'def',98}}, 530, 144}]],
	[96] = [[{96, {{10095,945},{1,2835000}}, {{'hp_max',36381},{'atk',3445},{'def',97}}, 525, 146}]],
	[95] = [[{95, {{10095,930},{1,2790000}}, {{'hp_max',35804},{'atk',3390},{'def',96}}, 520, 146}]],
	[94] = [[{94, {{10095,916},{1,2748000}}, {{'hp_max',35265},{'atk',3339},{'def',95}}, 515, 148}]],
	[93] = [[{93, {{10095,901},{1,2703000}}, {{'hp_max',34687},{'atk',3284},{'def',94}}, 510, 148}]],
	[92] = [[{92, {{10095,887},{1,2661000}}, {{'hp_max',34148},{'atk',3233},{'def',93}}, 505, 150}]],
	[91] = [[{91, {{10095,873},{1,2619000}}, {{'hp_max',33609},{'atk',3182},{'def',92}}, 500, 150}]],
	[90] = [[{90, {{10095,858},{1,2574000}}, {{'hp_max',33032},{'atk',3127},{'def',91}}, 495, 152}]],
	[89] = [[{89, {{10095,844},{1,2532000}}, {{'hp_max',32493},{'atk',3076},{'def',90}}, 490, 152}]],
	[88] = [[{88, {{10095,830},{1,2490000}}, {{'hp_max',31954},{'atk',3025},{'def',89}}, 485, 154}]],
	[87] = [[{87, {{10095,816},{1,2448000}}, {{'hp_max',31415},{'atk',2974},{'def',88}}, 480, 154}]],
	[86] = [[{86, {{10095,802},{1,2406000}}, {{'hp_max',30876},{'atk',2923},{'def',87}}, 475, 156}]],
	[85] = [[{85, {{10095,788},{1,2364000}}, {{'hp_max',30337},{'atk',2872},{'def',86}}, 470, 156}]],
	[84] = [[{84, {{10095,774},{1,2322000}}, {{'hp_max',29798},{'atk',2821},{'def',85}}, 465, 158}]],
	[83] = [[{83, {{10095,761},{1,2283000}}, {{'hp_max',29297},{'atk',2774},{'def',84}}, 460, 158}]],
	[82] = [[{82, {{10095,747},{1,2241000}}, {{'hp_max',28758},{'atk',2723},{'def',83}}, 455, 160}]],
	[81] = [[{81, {{10095,734},{1,2202000}}, {{'hp_max',28258},{'atk',2675},{'def',82}}, 450, 160}]],
	[80] = [[{80, {{10095,720},{1,2160000}}, {{'hp_max',27719},{'atk',2624},{'def',81}}, 445, 162}]],
	[79] = [[{79, {{10095,707},{1,2121000}}, {{'hp_max',27218},{'atk',2577},{'def',80}}, 440, 162}]],
	[78] = [[{78, {{10095,693},{1,2079000}}, {{'hp_max',26679},{'atk',2526},{'def',79}}, 435, 164}]],
	[77] = [[{77, {{10095,680},{1,2040000}}, {{'hp_max',26179},{'atk',2479},{'def',78}}, 430, 164}]],
	[76] = [[{76, {{10095,667},{1,2001000}}, {{'hp_max',25678},{'atk',2431},{'def',77}}, 425, 166}]],
	[75] = [[{75, {{10095,654},{1,1962000}}, {{'hp_max',25178},{'atk',2384},{'def',76}}, 420, 166}]],
	[74] = [[{74, {{10095,641},{1,1923000}}, {{'hp_max',24677},{'atk',2336},{'def',75}}, 415, 168}]],
	[73] = [[{73, {{10095,628},{1,1884000}}, {{'hp_max',24177},{'atk',2289},{'def',74}}, 410, 168}]],
	[72] = [[{72, {{10095,615},{1,1845000}}, {{'hp_max',23676},{'atk',2242},{'def',73}}, 405, 170}]],
	[71] = [[{71, {{10095,603},{1,1809000}}, {{'hp_max',23214},{'atk',2198},{'def',72}}, 400, 170}]],
	[70] = [[{70, {{10095,590},{1,1770000}}, {{'hp_max',22714},{'atk',2150},{'def',71}}, 395, 172}]],
	[69] = [[{69, {{10095,578},{1,1734000}}, {{'hp_max',22252},{'atk',2107},{'def',70}}, 390, 172}]],
	[68] = [[{68, {{10095,565},{1,1695000}}, {{'hp_max',21752},{'atk',2059},{'def',69}}, 385, 174}]],
	[67] = [[{67, {{10095,553},{1,1659000}}, {{'hp_max',21290},{'atk',2016},{'def',68}}, 380, 174}]],
	[66] = [[{66, {{10095,541},{1,1623000}}, {{'hp_max',20828},{'atk',1972},{'def',67}}, 375, 176}]],
	[65] = [[{65, {{10095,529},{1,1587000}}, {{'hp_max',20366},{'atk',1928},{'def',66}}, 370, 176}]],
	[64] = [[{64, {{10095,517},{1,1551000}}, {{'hp_max',19904},{'atk',1884},{'def',65}}, 365, 178}]],
	[63] = [[{63, {{10095,505},{1,1515000}}, {{'hp_max',19442},{'atk',1841},{'def',64}}, 360, 178}]],
	[62] = [[{62, {{10095,493},{1,1479000}}, {{'hp_max',18980},{'atk',1797},{'def',63}}, 355, 180}]],
	[61] = [[{61, {{10095,481},{1,1443000}}, {{'hp_max',18518},{'atk',1753},{'def',62}}, 350, 180}]],
	[60] = [[{60, {{10095,469},{1,1407000}}, {{'hp_max',18056},{'atk',1709},{'def',61}}, 345, 182}]],
	[59] = [[{59, {{10095,458},{1,1374000}}, {{'hp_max',17632},{'atk',1669},{'def',60}}, 340, 182}]],
	[58] = [[{58, {{10095,446},{1,1338000}}, {{'hp_max',17170},{'atk',1625},{'def',59}}, 335, 184}]],
	[57] = [[{57, {{10095,435},{1,1305000}}, {{'hp_max',16747},{'atk',1585},{'def',58}}, 330, 184}]],
	[56] = [[{56, {{10095,424},{1,1272000}}, {{'hp_max',16323},{'atk',1545},{'def',57}}, 325, 186}]],
	[55] = [[{55, {{10095,412},{1,1236000}}, {{'hp_max',15861},{'atk',1501},{'def',56}}, 320, 186}]],
	[54] = [[{54, {{10095,401},{1,1203000}}, {{'hp_max',15438},{'atk',1461},{'def',55}}, 315, 188}]],
	[53] = [[{53, {{10095,390},{1,1170000}}, {{'hp_max',15014},{'atk',1421},{'def',54}}, 310, 188}]],
	[52] = [[{52, {{10095,379},{1,1137000}}, {{'hp_max',14591},{'atk',1381},{'def',53}}, 305, 190}]],
	[51] = [[{51, {{10095,369},{1,1107000}}, {{'hp_max',14206},{'atk',1345},{'def',52}}, 300, 190}]],
	[50] = [[{50, {{10095,358},{1,1074000}}, {{'hp_max',13782},{'atk',1305},{'def',51}}, 295, 192}]],
	[49] = [[{49, {{10095,348},{1,1044000}}, {{'hp_max',13397},{'atk',1268},{'def',50}}, 290, 192}]],
	[48] = [[{48, {{10095,337},{1,1011000}}, {{'hp_max',12974},{'atk',1228},{'def',49}}, 285, 194}]],
	[47] = [[{47, {{10095,327},{1,981000}}, {{'hp_max',12589},{'atk',1192},{'def',48}}, 280, 194}]],
	[46] = [[{46, {{10095,316},{1,948000}}, {{'hp_max',12165},{'atk',1152},{'def',47}}, 275, 196}]],
	[45] = [[{45, {{10095,306},{1,918000}}, {{'hp_max',11780},{'atk',1115},{'def',46}}, 270, 196}]],
	[44] = [[{44, {{10095,296},{1,888000}}, {{'hp_max',11395},{'atk',1079},{'def',45}}, 265, 198}]],
	[43] = [[{43, {{10095,286},{1,858000}}, {{'hp_max',11010},{'atk',1042},{'def',44}}, 260, 198}]],
	[42] = [[{42, {{10095,277},{1,831000}}, {{'hp_max',10664},{'atk',1009},{'def',43}}, 255, 200}]],
	[41] = [[{41, {{10095,267},{1,801000}}, {{'hp_max',10279},{'atk',973},{'def',42}}, 250, 200}]],
	[40] = [[{40, {{10095,257},{1,771000}}, {{'hp_max',9894},{'atk',936},{'def',41}}, 245, 202}]],
	[39] = [[{39, {{10095,248},{1,744000}}, {{'hp_max',9547},{'atk',904},{'def',40}}, 240, 202}]],
	[38] = [[{38, {{10095,239},{1,717000}}, {{'hp_max',9201},{'atk',871},{'def',39}}, 235, 204}]],
	[37] = [[{37, {{10095,230},{1,690000}}, {{'hp_max',8854},{'atk',838},{'def',38}}, 230, 204}]],
	[36] = [[{36, {{10095,221},{1,663000}}, {{'hp_max',8508},{'atk',805},{'def',37}}, 225, 206}]],
	[35] = [[{35, {{10095,212},{1,636000}}, {{'hp_max',8161},{'atk',772},{'def',36}}, 220, 206}]],
	[34] = [[{34, {{10095,203},{1,609000}}, {{'hp_max',7815},{'atk',740},{'def',35}}, 215, 208}]],
	[33] = [[{33, {{10095,194},{1,582000}}, {{'hp_max',7468},{'atk',707},{'def',34}}, 210, 208}]],
	[32] = [[{32, {{10095,186},{1,558000}}, {{'hp_max',7160},{'atk',678},{'def',33}}, 205, 210}]],
	[31] = [[{31, {{10095,177},{1,531000}}, {{'hp_max',6814},{'atk',645},{'def',32}}, 200, 210}]],
	[30] = [[{30, {{10095,169},{1,507000}}, {{'hp_max',6506},{'atk',616},{'def',31}}, 195, 212}]],
	[29] = [[{29, {{10095,161},{1,483000}}, {{'hp_max',6198},{'atk',586},{'def',30}}, 190, 212}]],
	[28] = [[{28, {{10095,153},{1,459000}}, {{'hp_max',5890},{'atk',557},{'def',29}}, 185, 214}]],
	[27] = [[{27, {{10095,145},{1,435000}}, {{'hp_max',5582},{'atk',528},{'def',28}}, 180, 214}]],
	[26] = [[{26, {{10095,137},{1,411000}}, {{'hp_max',5274},{'atk',499},{'def',27}}, 175, 216}]],
	[25] = [[{25, {{10095,130},{1,390000}}, {{'hp_max',5004},{'atk',473},{'def',26}}, 170, 216}]],
	[24] = [[{24, {{10095,122},{1,366000}}, {{'hp_max',4696},{'atk',444},{'def',25}}, 165, 218}]],
	[23] = [[{23, {{10095,115},{1,345000}}, {{'hp_max',4427},{'atk',419},{'def',24}}, 160, 218}]],
	[22] = [[{22, {{10095,108},{1,324000}}, {{'hp_max',4157},{'atk',393},{'def',23}}, 155, 220}]],
	[21] = [[{21, {{10095,101},{1,303000}}, {{'hp_max',3888},{'atk',368},{'def',22}}, 150, 220}]],
	[20] = [[{20, {{10095,94},{1,282000}}, {{'hp_max',3618},{'atk',342},{'def',21}}, 145, 222}]],
	[19] = [[{19, {{10095,87},{1,261000}}, {{'hp_max',3349},{'atk',317},{'def',20}}, 140, 222}]],
	[18] = [[{18, {{10095,81},{1,243000}}, {{'hp_max',3118},{'atk',295},{'def',19}}, 135, 224}]],
	[17] = [[{17, {{10095,75},{1,225000}}, {{'hp_max',2887},{'atk',273},{'def',18}}, 130, 224}]],
	[16] = [[{16, {{10095,69},{1,207000}}, {{'hp_max',2656},{'atk',251},{'def',17}}, 125, 226}]],
	[15] = [[{15, {{10095,63},{1,189000}}, {{'hp_max',2425},{'atk',229},{'def',16}}, 120, 226}]],
	[14] = [[{14, {{10095,57},{1,171000}}, {{'hp_max',2194},{'atk',207},{'def',15}}, 115, 228}]],
	[13] = [[{13, {{10095,51},{1,153000}}, {{'hp_max',1963},{'atk',185},{'def',14}}, 110, 228}]],
	[12] = [[{12, {{10095,46},{1,138000}}, {{'hp_max',1770},{'atk',167},{'def',13}}, 105, 230}]],
	[11] = [[{11, {{10095,41},{1,123000}}, {{'hp_max',1578},{'atk',149},{'def',12}}, 100, 230}]],
	[10] = [[{10, {{10095,36},{1,108000}}, {{'hp_max',1385},{'atk',131},{'def',11}}, 95, 232}]],
	[9] = [[{9, {{10095,32},{1,96000}}, {{'hp_max',1231},{'atk',116},{'def',10}}, 90, 232}]],
	[8] = [[{8, {{10095,27},{1,81000}}, {{'hp_max',1039},{'atk',98},{'def',9}}, 85, 234}]],
	[7] = [[{7, {{10095,22},{1,66000}}, {{'hp_max',846},{'atk',80},{'def',8}}, 80, 234}]],
	[6] = [[{6, {{10095,18},{1,54000}}, {{'hp_max',692},{'atk',65},{'def',7}}, 75, 236}]],
	[5] = [[{5, {{10095,14},{1,42000}}, {{'hp_max',538},{'atk',51},{'def',6}}, 70, 236}]],
	[4] = [[{4, {{10095,10},{1,30000}}, {{'hp_max',384},{'atk',36},{'def',5}}, 65, 238}]],
	[3] = [[{3, {{10095,6},{1,18000}}, {{'hp_max',230},{'atk',21},{'def',4}}, 60, 238}]],
	[2] = [[{2, {{10095,3},{1,9000}}, {{'hp_max',115},{'atk',10},{'def',3}}, 55, 240}]],
	[1] = [[{1, {{10095,1},{1,3000}}, {{'hp_max',38},{'atk',3},{'def',2}}, 50, 240}]]
}
-- -------------------level_up_end---------------------


-- -------------------star_attr_start-------------------
Config.ResonateData.data_star_attr_length = 71
Config.ResonateData.data_star_attr_cache = {}
Config.ResonateData.data_star_attr = function(key)
	if Config.ResonateData.data_star_attr_cache[key] == nil then
		local base = Config.ResonateData.data_star_attr_table[key]
		if not base then return end
		base = loadstring(string.format('return %s',base))()
		if not base then return end
		Config.ResonateData.data_star_attr_cache[key] = {
			star = base[1],
			rio = base[2],
		}
	end
	return Config.ResonateData.data_star_attr_cache[key] 
end
Config.ResonateData.data_star_attr_table = {
	[75] = [[{75, 350}]],
	[74] = [[{74, 350}]],
	[73] = [[{73, 350}]],
	[72] = [[{72, 350}]],
	[71] = [[{71, 350}]],
	[70] = [[{70, 350}]],
	[69] = [[{69, 350}]],
	[68] = [[{68, 350}]],
	[67] = [[{67, 350}]],
	[66] = [[{66, 350}]],
	[65] = [[{65, 350}]],
	[64] = [[{64, 340}]],
	[63] = [[{63, 330}]],
	[62] = [[{62, 320}]],
	[61] = [[{61, 310}]],
	[60] = [[{60, 300}]],
	[59] = [[{59, 250}]],
	[58] = [[{58, 250}]],
	[57] = [[{57, 250}]],
	[56] = [[{56, 250}]],
	[55] = [[{55, 250}]],
	[54] = [[{54, 200}]],
	[53] = [[{53, 200}]],
	[52] = [[{52, 200}]],
	[51] = [[{51, 200}]],
	[50] = [[{50, 200}]],
	[49] = [[{49, 170}]],
	[48] = [[{48, 170}]],
	[47] = [[{47, 170}]],
	[46] = [[{46, 170}]],
	[45] = [[{45, 170}]],
	[44] = [[{44, 140}]],
	[43] = [[{43, 140}]],
	[42] = [[{42, 140}]],
	[41] = [[{41, 140}]],
	[40] = [[{40, 140}]],
	[39] = [[{39, 110}]],
	[38] = [[{38, 110}]],
	[37] = [[{37, 110}]],
	[36] = [[{36, 110}]],
	[35] = [[{35, 110}]],
	[34] = [[{34, 80}]],
	[33] = [[{33, 80}]],
	[32] = [[{32, 80}]],
	[31] = [[{31, 80}]],
	[30] = [[{30, 80}]],
	[29] = [[{29, 50}]],
	[28] = [[{28, 50}]],
	[27] = [[{27, 50}]],
	[26] = [[{26, 50}]],
	[25] = [[{25, 50}]],
	[24] = [[{24, 40}]],
	[23] = [[{23, 40}]],
	[22] = [[{22, 40}]],
	[21] = [[{21, 40}]],
	[20] = [[{20, 40}]],
	[19] = [[{19, 30}]],
	[18] = [[{18, 30}]],
	[17] = [[{17, 30}]],
	[16] = [[{16, 30}]],
	[15] = [[{15, 30}]],
	[14] = [[{14, 20}]],
	[13] = [[{13, 20}]],
	[12] = [[{12, 20}]],
	[11] = [[{11, 20}]],
	[10] = [[{10, 20}]],
	[9] = [[{9, 10}]],
	[8] = [[{8, 10}]],
	[7] = [[{7, 10}]],
	[6] = [[{6, 10}]],
	[5] = [[{5, 10}]]
}
-- -------------------star_attr_end---------------------


-- -------------------star_cost_start-------------------
Config.ResonateData.data_star_cost_length = 13
Config.ResonateData.data_star_cost = {
	[6] = {star=6, loss1={{10096,1}}, loss2={{1,1000000}}},
	[7] = {star=7, loss1={{10096,1}}, loss2={{1,2000000}}},
	[8] = {star=8, loss1={{10096,1}}, loss2={{1,3000000}}},
	[9] = {star=9, loss1={{10096,1}}, loss2={{1,4000000}}},
	[10] = {star=10, loss1={{10096,1}}, loss2={{1,5000000}}},
	[11] = {star=11, loss1={{10096,1}}, loss2={{1,6000000}}},
	[12] = {star=12, loss1={{10096,1}}, loss2={{1,8000000}}},
	[13] = {star=13, loss1={{10096,1}}, loss2={{1,10000000}}},
	[14] = {star=14, loss1={{10096,1}}, loss2={{1,10000000}}},
	[15] = {star=15, loss1={{10096,1}}, loss2={{1,10000000}}},
	[16] = {star=16, loss1={{10096,1}}, loss2={{1,10000000}}},
	[17] = {star=17, loss1={{10096,1}}, loss2={{1,10000000}}},
	[18] = {star=18, loss1={{10096,1}}, loss2={{1,10000000}}}
}
Config.ResonateData.data_star_cost_fun = function(key)
	local data=Config.ResonateData.data_star_cost[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ResonateData.data_star_cost['..key..'])not found') return
	end
	return data
end
-- -------------------star_cost_end---------------------


-- -------------------cell_cost_start-------------------
Config.ResonateData.data_cell_cost_length = 29
Config.ResonateData.data_cell_cost = {
	[1] = {count=1, loss1={{10480,200}}, loss2={{3,500}}},
	[2] = {count=2, loss1={{10480,300}}, loss2={{3,600}}},
	[3] = {count=3, loss1={{10480,400}}, loss2={{3,700}}},
	[4] = {count=4, loss1={{10480,500}}, loss2={{3,800}}},
	[5] = {count=5, loss1={{10480,600}}, loss2={{3,900}}},
	[6] = {count=6, loss1={{10480,700}}, loss2={{3,1000}}},
	[7] = {count=7, loss1={{10480,800}}, loss2={{3,1100}}},
	[8] = {count=8, loss1={{10480,900}}, loss2={{3,1200}}},
	[9] = {count=9, loss1={{10480,1000}}, loss2={{3,1300}}},
	[10] = {count=10, loss1={{10480,1200}}, loss2={{3,1400}}},
	[11] = {count=11, loss1={{10480,1400}}, loss2={{3,1500}}},
	[12] = {count=12, loss1={{10480,1600}}, loss2={{3,1600}}},
	[13] = {count=13, loss1={{10480,1800}}, loss2={{3,1700}}},
	[14] = {count=14, loss1={{10480,2000}}, loss2={{3,1800}}},
	[15] = {count=15, loss1={{10480,2200}}, loss2={{3,1900}}},
	[16] = {count=16, loss1={{10480,2400}}, loss2={{3,2000}}},
	[17] = {count=17, loss1={{10480,2600}}, loss2={{3,2100}}},
	[18] = {count=18, loss1={{10480,2800}}, loss2={{3,2200}}},
	[19] = {count=19, loss1={{10480,3000}}, loss2={{3,2300}}},
	[20] = {count=20, loss1={{10480,3200}}, loss2={{3,2400}}},
	[21] = {count=21, loss1={{10480,3400}}, loss2={{3,2500}}},
	[22] = {count=22, loss1={{10480,3600}}, loss2={{3,2600}}},
	[23] = {count=23, loss1={{10480,3800}}, loss2={{3,2700}}},
	[24] = {count=24, loss1={{10480,4000}}, loss2={{3,2800}}},
	[25] = {count=25, loss1={{10480,4200}}, loss2={{3,2900}}},
	[26] = {count=26, loss1={{10480,4400}}, loss2={{3,3000}}},
	[27] = {count=27, loss1={{10480,4600}}, loss2={{3,3100}}},
	[28] = {count=28, loss1={{10480,4800}}, loss2={{3,3200}}},
	[29] = {count=29, loss1={{10480,5000}}, loss2={{3,3300}}}
}
Config.ResonateData.data_cell_cost_fun = function(key)
	local data=Config.ResonateData.data_cell_cost[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ResonateData.data_cell_cost['..key..'])not found') return
	end
	return data
end
-- -------------------cell_cost_end---------------------


-- -------------------crystal_cost_start-------------------
Config.ResonateData.data_crystal_cost_length = 101
Config.ResonateData.data_crystal_cost = {
	[340] = {lev=340, expend={{10001,4000},{1,31200000},{22,16000000}}},
	[341] = {lev=341, expend={{10001,4500},{1,35100000},{22,18000000}}},
	[342] = {lev=342, expend={{10001,5000},{1,39000000},{22,20000000}}},
	[343] = {lev=343, expend={{10001,5500},{1,42900000},{22,22000000}}},
	[344] = {lev=344, expend={{10001,6000},{1,46800000},{22,24000000}}},
	[345] = {lev=345, expend={{10001,6500},{1,50700000},{22,26000000}}},
	[346] = {lev=346, expend={{10001,7000},{1,54600000},{22,28000000}}},
	[347] = {lev=347, expend={{10001,7500},{1,58500000},{22,30000000}}},
	[348] = {lev=348, expend={{10001,8000},{1,62400000},{22,32000000}}},
	[349] = {lev=349, expend={{10001,8500},{1,66300000},{22,34000000}}},
	[350] = {lev=350, expend={{10001,9000},{1,70200000},{22,36000000}}},
	[351] = {lev=351, expend={{10001,9500},{1,74100000},{22,38000000}}},
	[352] = {lev=352, expend={{10001,10000},{1,78000000},{22,40000000}}},
	[353] = {lev=353, expend={{10001,10500},{1,81900000},{22,42000000}}},
	[354] = {lev=354, expend={{10001,11000},{1,85800000},{22,44000000}}},
	[355] = {lev=355, expend={{10001,11500},{1,89700000},{22,46000000}}},
	[356] = {lev=356, expend={{10001,12000},{1,93600000},{22,48000000}}},
	[357] = {lev=357, expend={{10001,12500},{1,97500000},{22,50000000}}},
	[358] = {lev=358, expend={{10001,13000},{1,101400000},{22,52000000}}},
	[359] = {lev=359, expend={{10001,13500},{1,105300000},{22,54000000}}},
	[360] = {lev=360, expend={{10001,14000},{1,109200000},{22,56000000}}},
	[361] = {lev=361, expend={{10001,14500},{1,113100000},{22,58000000}}},
	[362] = {lev=362, expend={{10001,15000},{1,117000000},{22,60000000}}},
	[363] = {lev=363, expend={{10001,15500},{1,120900000},{22,62000000}}},
	[364] = {lev=364, expend={{10001,16000},{1,124800000},{22,64000000}}},
	[365] = {lev=365, expend={{10001,16500},{1,128700000},{22,66000000}}},
	[366] = {lev=366, expend={{10001,17000},{1,132600000},{22,68000000}}},
	[367] = {lev=367, expend={{10001,17500},{1,136500000},{22,70000000}}},
	[368] = {lev=368, expend={{10001,18000},{1,140400000},{22,72000000}}},
	[369] = {lev=369, expend={{10001,18500},{1,144300000},{22,74000000}}},
	[370] = {lev=370, expend={{10001,19000},{1,148200000},{22,76000000}}},
	[371] = {lev=371, expend={{10001,19500},{1,152100000},{22,78000000}}},
	[372] = {lev=372, expend={{10001,20000},{1,156000000},{22,80000000}}},
	[373] = {lev=373, expend={{10001,20500},{1,159900000},{22,82000000}}},
	[374] = {lev=374, expend={{10001,21000},{1,163800000},{22,84000000}}},
	[375] = {lev=375, expend={{10001,21500},{1,167700000},{22,86000000}}},
	[376] = {lev=376, expend={{10001,22000},{1,171600000},{22,88000000}}},
	[377] = {lev=377, expend={{10001,22500},{1,175500000},{22,90000000}}},
	[378] = {lev=378, expend={{10001,23000},{1,179400000},{22,92000000}}},
	[379] = {lev=379, expend={{10001,23500},{1,183300000},{22,94000000}}},
	[380] = {lev=380, expend={{10001,24000},{1,187200000},{22,96000000}}},
	[381] = {lev=381, expend={{10001,24500},{1,191100000},{22,98000000}}},
	[382] = {lev=382, expend={{10001,25000},{1,195000000},{22,100000000}}},
	[383] = {lev=383, expend={{10001,25500},{1,198900000},{22,102000000}}},
	[384] = {lev=384, expend={{10001,26000},{1,202800000},{22,104000000}}},
	[385] = {lev=385, expend={{10001,26500},{1,206700000},{22,106000000}}},
	[386] = {lev=386, expend={{10001,27000},{1,210600000},{22,108000000}}},
	[387] = {lev=387, expend={{10001,27500},{1,214500000},{22,110000000}}},
	[388] = {lev=388, expend={{10001,28000},{1,218400000},{22,112000000}}},
	[389] = {lev=389, expend={{10001,28500},{1,222300000},{22,114000000}}},
	[390] = {lev=390, expend={{10001,29000},{1,226200000},{22,116000000}}},
	[391] = {lev=391, expend={{10001,29500},{1,230100000},{22,118000000}}},
	[392] = {lev=392, expend={{10001,30000},{1,234000000},{22,120000000}}},
	[393] = {lev=393, expend={{10001,30500},{1,237900000},{22,122000000}}},
	[394] = {lev=394, expend={{10001,31000},{1,241800000},{22,124000000}}},
	[395] = {lev=395, expend={{10001,31500},{1,245700000},{22,126000000}}},
	[396] = {lev=396, expend={{10001,32000},{1,249600000},{22,128000000}}},
	[397] = {lev=397, expend={{10001,32500},{1,253500000},{22,130000000}}},
	[398] = {lev=398, expend={{10001,33000},{1,257400000},{22,132000000}}},
	[399] = {lev=399, expend={{10001,33500},{1,261300000},{22,134000000}}},
	[400] = {lev=400, expend={{10001,34000},{1,265200000},{22,136000000}}},
	[401] = {lev=401, expend={{10001,34500},{1,269100000},{22,138000000}}},
	[402] = {lev=402, expend={{10001,35000},{1,273000000},{22,140000000}}},
	[403] = {lev=403, expend={{10001,35500},{1,276900000},{22,142000000}}},
	[404] = {lev=404, expend={{10001,36000},{1,280800000},{22,144000000}}},
	[405] = {lev=405, expend={{10001,36500},{1,284700000},{22,146000000}}},
	[406] = {lev=406, expend={{10001,37000},{1,288600000},{22,148000000}}},
	[407] = {lev=407, expend={{10001,37500},{1,292500000},{22,150000000}}},
	[408] = {lev=408, expend={{10001,38000},{1,296400000},{22,152000000}}},
	[409] = {lev=409, expend={{10001,38500},{1,300300000},{22,154000000}}},
	[410] = {lev=410, expend={{10001,39000},{1,304200000},{22,156000000}}},
	[411] = {lev=411, expend={{10001,39500},{1,308100000},{22,158000000}}},
	[412] = {lev=412, expend={{10001,40000},{1,312000000},{22,160000000}}},
	[413] = {lev=413, expend={{10001,40500},{1,315900000},{22,162000000}}},
	[414] = {lev=414, expend={{10001,41000},{1,319800000},{22,164000000}}},
	[415] = {lev=415, expend={{10001,41500},{1,323700000},{22,166000000}}},
	[416] = {lev=416, expend={{10001,42000},{1,327600000},{22,168000000}}},
	[417] = {lev=417, expend={{10001,42500},{1,331500000},{22,170000000}}},
	[418] = {lev=418, expend={{10001,43000},{1,335400000},{22,172000000}}},
	[419] = {lev=419, expend={{10001,43500},{1,339300000},{22,174000000}}},
	[420] = {lev=420, expend={{10001,44000},{1,343200000},{22,176000000}}},
	[421] = {lev=421, expend={{10001,44500},{1,347100000},{22,178000000}}},
	[422] = {lev=422, expend={{10001,45000},{1,351000000},{22,180000000}}},
	[423] = {lev=423, expend={{10001,45500},{1,354900000},{22,182000000}}},
	[424] = {lev=424, expend={{10001,46000},{1,358800000},{22,184000000}}},
	[425] = {lev=425, expend={{10001,46500},{1,362700000},{22,186000000}}},
	[426] = {lev=426, expend={{10001,47000},{1,366600000},{22,188000000}}},
	[427] = {lev=427, expend={{10001,47500},{1,370500000},{22,190000000}}},
	[428] = {lev=428, expend={{10001,48000},{1,374400000},{22,192000000}}},
	[429] = {lev=429, expend={{10001,48500},{1,378300000},{22,194000000}}},
	[430] = {lev=430, expend={{10001,49000},{1,382200000},{22,196000000}}},
	[431] = {lev=431, expend={{10001,49500},{1,386100000},{22,198000000}}},
	[432] = {lev=432, expend={{10001,50000},{1,390000000},{22,200000000}}},
	[433] = {lev=433, expend={{10001,50500},{1,393900000},{22,202000000}}},
	[434] = {lev=434, expend={{10001,51000},{1,397800000},{22,204000000}}},
	[435] = {lev=435, expend={{10001,51500},{1,401700000},{22,206000000}}},
	[436] = {lev=436, expend={{10001,52000},{1,405600000},{22,208000000}}},
	[437] = {lev=437, expend={{10001,52500},{1,409500000},{22,210000000}}},
	[438] = {lev=438, expend={{10001,53000},{1,413400000},{22,212000000}}},
	[439] = {lev=439, expend={{10001,53500},{1,417300000},{22,214000000}}},
	[440] = {lev=440, expend={{10001,54000},{1,421200000},{22,216000000}}}
}
Config.ResonateData.data_crystal_cost_fun = function(key)
	local data=Config.ResonateData.data_crystal_cost[key]
	if DATA_DEBUG and data == nil then
		print('(Config.ResonateData.data_crystal_cost['..key..'])not found') return
	end
	return data
end
-- -------------------crystal_cost_end---------------------

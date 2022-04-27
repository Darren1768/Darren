--[[
        exchange_data.lua
        exported by excel2lua.py
        from file:exchange_data.xlsx
--]]


Config = Config or {}
Config.ExchangeData = Config.ExchangeData or {}

---------------------data_shop_exchage_elite start--------------------
Config.ExchangeData.data_shop_exchage_elite_length = 10
Config.ExchangeData.data_shop_exchage_elite = {
 [1] = {id=17001,arena_elite_lev=0,limit_month=1,limit_day=0,lev={0,0},limit_week=0,pay_type="elite_coin",order=1,price=40000,label=0,item_num=50,item_name="洛基碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=25908,type=17},
 [2] = {id=17002,arena_elite_lev=0,limit_month=1,limit_day=0,lev={0,0},limit_week=0,pay_type="elite_coin",order=2,price=37500,label=0,item_num=50,item_name="影刹碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=26901,type=17},
 [3] = {id=17003,arena_elite_lev=0,limit_month=1,limit_day=0,lev={0,0},limit_week=0,pay_type="elite_coin",order=3,price=37500,label=0,item_num=50,item_name="泰坦碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=24903,type=17},
 [4] = {id=17004,arena_elite_lev=0,limit_month=1,limit_day=0,lev={0,0},limit_week=0,pay_type="elite_coin",order=4,price=40000,label=0,item_num=50,item_name="艾蕾莉亚碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=27905,type=17},
 [5] = {id=17005,arena_elite_lev=0,limit_month=1,limit_day=0,lev={0,0},limit_week=0,pay_type="elite_coin",order=5,price=40000,label=0,item_num=50,item_name="亚巴顿碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=28902,type=17},
 [6] = {id=17006,arena_elite_lev=0,limit_month=0,limit_day=1,lev={0,0},limit_week=0,pay_type="elite_coin",order=6,price=3750,label=0,item_num=100,item_name="炼神石",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=72001,type=17},
 [7] = {id=17007,arena_elite_lev=0,limit_month=0,limit_day=0,lev={0,0},limit_week=5,pay_type="elite_coin",order=7,price=2500,label=0,item_num=1000,item_name="符文精华",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=10450,type=17},
 [8] = {id=17008,arena_elite_lev=0,limit_month=1,limit_day=0,lev={0,0},limit_week=0,pay_type="elite_coin",order=8,price=5000,label=0,item_num=1,item_name="赋能遗物",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=10096,type=17},
 [9] = {id=17009,arena_elite_lev=0,limit_month=0,limit_day=0,lev={160,999},limit_week=1,pay_type="elite_coin",order=9,price=12500,label=0,item_num=5,item_name="觉醒石",discount=0,bind=1,role_lev={{'lv',160}},glev=0,is_partner=0,icon=0,item_bid=10460,type=17},
 [10] = {id=17010,arena_elite_lev=7,limit_month=4,limit_day=0,lev={0,0},limit_week=0,pay_type="elite_coin",order=10,price=5000,label=0,item_num=10,item_name="天赋秘典",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=10006,type=17}
}
Config.ExchangeData.data_shop_exchage_elite_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_elite[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_elite['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_elite end--------------------
---------------------data_shop_exchage_gold start--------------------
Config.ExchangeData.data_shop_exchage_gold_length = 10
Config.ExchangeData.data_shop_exchage_gold = {
 [1] = {id=1001,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=1,limit_day=5,pay_type="gold",price=20,lev={0,0},item_num=1,icon=0,discount=14,label=7,is_partner=0,item_name="竞技挑战券",item_bid=10103,type=1},
 [2] = {id=1002,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=2,limit_day=5,pay_type="gold",price=200,lev={0,0},item_num=20,icon=0,discount=140,label=7,is_partner=0,item_name="先知精华",item_bid=14002,type=1},
 [3] = {id=1003,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=3,limit_day=1,pay_type="gold",price=1000,lev={0,0},item_num=100,icon=0,discount=800,label=8,is_partner=0,item_name="先知精华",item_bid=14002,type=1},
 [4] = {id=1004,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=4,limit_day=5,pay_type="gold",price=100,lev={0,0},item_num=1,icon=0,discount=60,label=6,is_partner=0,item_name="5星随机碎片",item_bid=29905,type=1},
 [5] = {id=1005,bind=1,limit_vip=2,limit_month=0,limit_week=0,open_srv_timestamp=0,order=5,limit_day=1,pay_type="gold",price=250,lev={0,0},item_num=1,icon=0,discount=25,label=1,is_partner=0,item_name="高级召唤卷",item_bid=10403,type=1},
 [6] = {id=1006,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=6,limit_day=2,pay_type="gold",price=2500,lev={0,0},item_num=1,icon=0,discount=1000,label=4,is_partner=0,item_name="先知水晶",item_bid=14001,type=1},
 [7] = {id=1007,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=7,limit_day=1,pay_type="gold",price=1000,lev={0,0},item_num=1000,icon=0,discount=800,label=8,is_partner=0,item_name="符文精华",item_bid=10450,type=1},
 [8] = {id=1008,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=8,limit_day=1,pay_type="gold",price=1000,lev={0,0},item_num=1,icon=0,discount=600,label=6,is_partner=0,item_name="高级寻宝券",item_bid=37002,type=1},
 [9] = {id=1009,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=9,limit_day=10,pay_type="gold",price=1000,lev={0,0},item_num=1,icon=0,discount=500,label=5,is_partner=0,item_name="圣露",item_bid=10041,type=1},
 [10] = {id=1010,bind=1,limit_vip=0,limit_month=0,limit_week=1,open_srv_timestamp=0,order=10,limit_day=0,pay_type="gold",price=500,lev={0,0},item_num=1,icon=0,discount=300,label=6,is_partner=0,item_name="永恒晶石",item_bid=10034,type=1}
}
Config.ExchangeData.data_shop_exchage_gold_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_gold[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_gold['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_gold end--------------------
---------------------data_shop_exchage_seer start--------------------
Config.ExchangeData.data_shop_exchage_seer_length = 79
Config.ExchangeData.data_shop_exchage_seer = {
 [1] = {id=31001,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=1,price=20,label=0,item_name="5星娜迦公主碎片",discount=0,item_num=50,icon=0,item_bid=24900,is_partner=0,type=31},
 [2] = {id=31002,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=2,price=20,label=0,item_name="5星冰霜巨龙碎片",discount=0,item_num=50,icon=0,item_bid=24902,is_partner=0,type=31},
 [3] = {id=31003,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=3,price=35,label=0,item_name="5星泰坦碎片",discount=0,item_num=50,icon=0,item_bid=24903,is_partner=0,type=31},
 [4] = {id=31004,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=4,price=35,label=0,item_name="5星波塞冬碎片",discount=0,item_num=50,icon=0,item_bid=24904,is_partner=0,type=31},
 [5] = {id=31005,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=5,price=20,label=0,item_name="5星派西斯碎片",discount=0,item_num=50,icon=0,item_bid=24905,is_partner=0,type=31},
 [6] = {id=31006,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=6,price=20,label=0,item_name="5星少年梅林碎片",discount=0,item_num=50,icon=0,item_bid=24906,is_partner=0,type=31},
 [7] = {id=31007,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=7,price=20,label=0,item_name="5星海宁芙碎片",discount=0,item_num=50,icon=0,item_bid=24907,is_partner=0,type=31},
 [8] = {id=31008,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=8,price=20,label=0,item_name="5星阿瑞斯碎片",discount=0,item_num=50,icon=0,item_bid=24908,is_partner=0,type=31},
 [9] = {id=31009,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=9,price=35,label=0,item_name="5星冰雪女王碎片",discount=0,item_num=50,icon=0,item_bid=24901,is_partner=0,type=31},
 [10] = {id=31064,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=10,price=35,label=0,item_name="5星耶梦加得碎片",discount=0,item_num=50,icon=0,item_bid=24909,is_partner=0,type=31},
 [11] = {id=31069,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=11,price=35,label=0,item_name="5星酒神碎片",discount=0,item_num=50,icon=0,item_bid=24910,is_partner=0,type=31},
 [12] = {id=31077,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=12,price=35,label=0,item_name="5星利维坦碎片",discount=0,item_num=50,icon=0,item_bid=24911,is_partner=0,type=31},
 [13] = {id=31010,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=13,price=20,label=0,item_name="5星炽天使碎片",discount=0,item_num=50,icon=0,item_bid=25900,is_partner=0,type=31},
 [14] = {id=31011,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=14,price=20,label=0,item_name="5星炎魔之王碎片",discount=0,item_num=50,icon=0,item_bid=25901,is_partner=0,type=31},
 [15] = {id=31012,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=15,price=20,label=0,item_name="5星剑豪卡赞碎片",discount=0,item_num=50,icon=0,item_bid=25902,is_partner=0,type=31},
 [16] = {id=31013,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=16,price=20,label=0,item_name="5星菲尼克斯碎片",discount=0,item_num=50,icon=0,item_bid=25903,is_partner=0,type=31},
 [17] = {id=31014,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=17,price=20,label=0,item_name="5星阿波罗碎片",discount=0,item_num=50,icon=0,item_bid=25904,is_partner=0,type=31},
 [18] = {id=31015,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=18,price=20,label=0,item_name="5星吸血伯爵碎片",discount=0,item_num=50,icon=0,item_bid=25905,is_partner=0,type=31},
 [19] = {id=31063,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=19,price=35,label=0,item_name="5星洛基碎片",discount=0,item_num=50,icon=0,item_bid=25908,is_partner=0,type=31},
 [20] = {id=31016,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=20,price=35,label=0,item_name="5星普罗米修斯碎片",discount=0,item_num=50,icon=0,item_bid=25906,is_partner=0,type=31},
 [21] = {id=31017,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=21,price=35,label=0,item_name="瓦尔基里碎片",discount=0,item_num=50,icon=0,item_bid=25907,is_partner=0,type=31},
 [22] = {id=31071,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=22,price=35,label=0,item_name="哪吒碎片",discount=0,item_num=50,icon=0,item_bid=25909,is_partner=0,type=31},
 [23] = {id=31074,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=23,price=35,label=0,item_name="海姆达尔碎片",discount=0,item_num=50,icon=0,item_bid=25910,is_partner=0,type=31},
 [24] = {id=31078,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=24,price=45,label=0,item_name="阿奇丽碎片",discount=0,item_num=50,icon=0,item_bid=25911,is_partner=0,type=31},
 [25] = {id=31018,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=25,price=20,label=0,item_name="5星奥丁碎片",discount=0,item_num=50,icon=0,item_bid=26900,is_partner=0,type=31},
 [26] = {id=31019,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=26,price=35,label=0,item_name="5星影刹碎片",discount=0,item_num=50,icon=0,item_bid=26901,is_partner=0,type=31},
 [27] = {id=31020,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=27,price=20,label=0,item_name="5星凯兰崔尔碎片",discount=0,item_num=50,icon=0,item_bid=26902,is_partner=0,type=31},
 [28] = {id=31021,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=28,price=20,label=0,item_name="5星魅魔女王碎片",discount=0,item_num=50,icon=0,item_bid=26903,is_partner=0,type=31},
 [29] = {id=31022,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=29,price=20,label=0,item_name="5星美杜莎碎片",discount=0,item_num=50,icon=0,item_bid=26904,is_partner=0,type=31},
 [30] = {id=31023,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=30,price=20,label=0,item_name="5星雅典娜碎片",discount=0,item_num=50,icon=0,item_bid=26905,is_partner=0,type=31},
 [31] = {id=31024,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=31,price=35,label=0,item_name="5星潘碎片",discount=0,item_num=50,icon=0,item_bid=26906,is_partner=0,type=31},
 [32] = {id=31025,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=32,price=35,label=0,item_name="斯芬克斯碎片",discount=0,item_num=50,icon=0,item_bid=26907,is_partner=0,type=31},
 [33] = {id=31066,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=33,price=35,label=0,item_name="芬尼尔碎片",discount=0,item_num=50,icon=0,item_bid=26908,is_partner=0,type=31},
 [34] = {id=31068,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=34,price=35,label=0,item_name="拉塔托斯克碎片",discount=0,item_num=50,icon=0,item_bid=26909,is_partner=0,type=31},
 [35] = {id=31073,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=35,price=35,label=0,item_name="辛西娅碎片",discount=0,item_num=50,icon=0,item_bid=26910,is_partner=0,type=31},
 [36] = {id=31079,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=36,price=35,label=0,item_name="塞莎特碎片",discount=0,item_num=50,icon=0,item_bid=26911,is_partner=0,type=31},
 [37] = {id=31026,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=37,price=25,label=0,item_name="4星伊西斯碎片",discount=0,item_num=50,icon=0,item_bid=27900,is_partner=0,type=31},
 [38] = {id=31027,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=38,price=35,label=0,item_name="5星赫拉碎片",discount=0,item_num=50,icon=0,item_bid=27902,is_partner=0,type=31},
 [39] = {id=31028,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=39,price=35,label=0,item_name="5星雷神碎片",discount=0,item_num=50,icon=0,item_bid=27903,is_partner=0,type=31},
 [40] = {id=31029,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=40,price=25,label=0,item_name="5星盖亚碎片",discount=0,item_num=50,icon=0,item_bid=27904,is_partner=0,type=31},
 [41] = {id=31030,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=41,price=35,label=0,item_name="5星艾蕾莉亚碎片",discount=0,item_num=50,icon=0,item_bid=27905,is_partner=0,type=31},
 [42] = {id=31031,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=42,price=45,label=0,item_name="5星神灵大祭司碎片",discount=0,item_num=50,icon=0,item_bid=27906,is_partner=0,type=31},
 [43] = {id=31032,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=43,price=45,label=0,item_name="宙斯碎片",discount=0,item_num=50,icon=0,item_bid=27901,is_partner=0,type=31},
 [44] = {id=31065,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=44,price=45,label=0,item_name="拉斐尔碎片",discount=0,item_num=50,icon=0,item_bid=27907,is_partner=0,type=31},
 [45] = {id=31070,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=45,price=45,label=0,item_name="维纳斯碎片",discount=0,item_num=50,icon=0,item_bid=27908,is_partner=0,type=31},
 [46] = {id=31076,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=46,price=45,label=0,item_name="加百列碎片",discount=0,item_num=50,icon=0,item_bid=27909,is_partner=0,type=31},
 [47] = {id=31033,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=47,price=25,label=0,item_name="4星蛇女墨莎碎片",discount=0,item_num=50,icon=0,item_bid=28900,is_partner=0,type=31},
 [48] = {id=31034,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=48,price=45,label=0,item_name="5星哈迪斯碎片",discount=0,item_num=50,icon=0,item_bid=28901,is_partner=0,type=31},
 [49] = {id=31035,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=49,price=35,label=0,item_name="5星亚巴顿碎片",discount=0,item_num=50,icon=0,item_bid=28902,is_partner=0,type=31},
 [50] = {id=31036,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=50,price=35,label=0,item_name="5星阿努比斯碎片",discount=0,item_num=50,icon=0,item_bid=28904,is_partner=0,type=31},
 [51] = {id=31037,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=51,price=25,label=0,item_name="5星路西法碎片",discount=0,item_num=50,icon=0,item_bid=28905,is_partner=0,type=31},
 [52] = {id=31038,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=52,price=45,label=0,item_name="5星潘多拉碎片",discount=0,item_num=50,icon=0,item_bid=28906,is_partner=0,type=31},
 [53] = {id=31039,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=53,price=45,label=0,item_name="黑暗之主碎片",discount=0,item_num=50,icon=0,item_bid=28903,is_partner=0,type=31},
 [54] = {id=31067,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=54,price=45,label=0,item_name="海拉碎片",discount=0,item_num=50,icon=0,item_bid=28907,is_partner=0,type=31},
 [55] = {id=31072,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=55,price=45,label=0,item_name="尼德霍格碎片",discount=0,item_num=50,icon=0,item_bid=28908,is_partner=0,type=31},
 [56] = {id=31075,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=56,price=45,label=0,item_name="阿蒙碎片",discount=0,item_num=50,icon=0,item_bid=28909,is_partner=0,type=31},
 [57] = {id=31040,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=57,price=3,label=0,item_name="亚瑟碎片",discount=0,item_num=30,icon=0,item_bid=24800,is_partner=0,type=31},
 [58] = {id=31041,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=58,price=3,label=0,item_name="竖琴海妖碎片",discount=0,item_num=30,icon=0,item_bid=24801,is_partner=0,type=31},
 [59] = {id=31042,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=59,price=3,label=0,item_name="水元素碎片",discount=0,item_num=30,icon=0,item_bid=24802,is_partner=0,type=31},
 [60] = {id=31043,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=60,price=3,label=0,item_name="冰晶女巫碎片",discount=0,item_num=30,icon=0,item_bid=24803,is_partner=0,type=31},
 [61] = {id=31044,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=61,price=3,label=0,item_name="娜迦侍女碎片",discount=0,item_num=30,icon=0,item_bid=24804,is_partner=0,type=31},
 [62] = {id=31045,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=62,price=3,label=0,item_name="火枪艾克碎片",discount=0,item_num=30,icon=0,item_bid=25800,is_partner=0,type=31},
 [63] = {id=31046,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=63,price=3,label=0,item_name="凯瑟琳碎片",discount=0,item_num=30,icon=0,item_bid=25801,is_partner=0,type=31},
 [64] = {id=31047,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=64,price=3,label=0,item_name="阿伽门农碎片",discount=0,item_num=30,icon=0,item_bid=25802,is_partner=0,type=31},
 [65] = {id=31048,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=65,price=3,label=0,item_name="雷诺蛮锤碎片",discount=0,item_num=30,icon=0,item_bid=25803,is_partner=0,type=31},
 [66] = {id=31049,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=66,price=3,label=0,item_name="翼女碎片",discount=0,item_num=30,icon=0,item_bid=25804,is_partner=0,type=31},
 [67] = {id=31050,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=67,price=3,label=0,item_name="吟游诗人碎片",discount=0,item_num=30,icon=0,item_bid=26800,is_partner=0,type=31},
 [68] = {id=31051,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=68,price=3,label=0,item_name="亡灵收割者碎片",discount=0,item_num=30,icon=0,item_bid=26801,is_partner=0,type=31},
 [69] = {id=31052,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=69,price=3,label=0,item_name="圣锤提尔碎片",discount=0,item_num=30,icon=0,item_bid=26802,is_partner=0,type=31},
 [70] = {id=31053,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=70,price=3,label=0,item_name="甘道夫碎片",discount=0,item_num=30,icon=0,item_bid=26803,is_partner=0,type=31},
 [71] = {id=31054,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=71,price=3,label=0,item_name="德鲁伊碎片",discount=0,item_num=30,icon=0,item_bid=26804,is_partner=0,type=31},
 [72] = {id=31055,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=72,price=5,label=0,item_name="光明牧师碎片",discount=0,item_num=30,icon=0,item_bid=27800,is_partner=0,type=31},
 [73] = {id=31056,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=73,price=5,label=0,item_name="月之祭司碎片",discount=0,item_num=30,icon=0,item_bid=27801,is_partner=0,type=31},
 [74] = {id=31057,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=74,price=5,label=0,item_name="精灵王子碎片",discount=0,item_num=30,icon=0,item_bid=27802,is_partner=0,type=31},
 [75] = {id=31058,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=75,price=5,label=0,item_name="丘比特碎片",discount=0,item_num=30,icon=0,item_bid=27803,is_partner=0,type=31},
 [76] = {id=31059,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=76,price=5,label=0,item_name="毒咒女巫碎片",discount=0,item_num=30,icon=0,item_bid=28800,is_partner=0,type=31},
 [77] = {id=31060,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=77,price=5,label=0,item_name="死亡骑士碎片",discount=0,item_num=30,icon=0,item_bid=28801,is_partner=0,type=31},
 [78] = {id=31061,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=78,price=5,label=0,item_name="阿喀琉斯碎片",discount=0,item_num=30,icon=0,item_bid=28802,is_partner=0,type=31},
 [79] = {id=31062,bind=1,limit_month=0,limit_day=0,lev={1,999},limit_week=0,pay_type="recruithigh_hero",order=79,price=5,label=0,item_name="黑精灵密言碎片",discount=0,item_num=30,icon=0,item_bid=28803,is_partner=0,type=31}
}
Config.ExchangeData.data_shop_exchage_seer_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_seer[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_seer['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_seer end--------------------
---------------------data_shop_exchage_cloth start--------------------
Config.ExchangeData.data_shop_exchage_cloth_length = 120
Config.ExchangeData.data_shop_exchage_cloth = {
 [1] = {id=52001,order=1,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=5030201,item_name="[极品]3星穿甲耳环",type=52},
 [2] = {id=52002,order=2,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=5030202,item_name="[极品]3星穿甲项链",type=52},
 [3] = {id=52003,order=3,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=5030203,item_name="[极品]3星穿甲戒指",type=52},
 [4] = {id=52004,order=4,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=5030204,item_name="[极品]3星穿甲手镯",type=52},
 [5] = {id=52005,order=5,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=6030201,item_name="[极品]3星破法耳环",type=52},
 [6] = {id=52006,order=6,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=6030202,item_name="[极品]3星破法项链",type=52},
 [7] = {id=52007,order=7,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=6030203,item_name="[极品]3星破法戒指",type=52},
 [8] = {id=52008,order=8,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=6030204,item_name="[极品]3星破法手镯",type=52},
 [9] = {id=52009,order=9,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=7030201,item_name="[极品]3星斗战耳环",type=52},
 [10] = {id=52010,order=10,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=7030202,item_name="[极品]3星斗战项链",type=52},
 [11] = {id=52011,order=11,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=7030203,item_name="[极品]3星斗战戒指",type=52},
 [12] = {id=52012,order=12,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=7030204,item_name="[极品]3星斗战手镯",type=52},
 [13] = {id=52013,order=13,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=8030201,item_name="[极品]3星镇灵耳环",type=52},
 [14] = {id=52014,order=14,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=8030202,item_name="[极品]3星镇灵项链",type=52},
 [15] = {id=52015,order=15,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=8030203,item_name="[极品]3星镇灵戒指",type=52},
 [16] = {id=52016,order=16,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=25,limit_month=0,item_num=1,limit_day=0,item_bid=8030204,item_name="[极品]3星镇灵手镯",type=52},
 [17] = {id=52017,order=17,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=9030201,item_name="[极品]3星魔甲耳环",type=52},
 [18] = {id=52018,order=18,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=9030202,item_name="[极品]3星魔甲项链",type=52},
 [19] = {id=52019,order=19,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=9030203,item_name="[极品]3星魔甲戒指",type=52},
 [20] = {id=52020,order=20,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=9030204,item_name="[极品]3星魔甲手镯",type=52},
 [21] = {id=52021,order=21,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=10030201,item_name="[极品]3星神战耳环",type=52},
 [22] = {id=52022,order=22,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=10030202,item_name="[极品]3星神战项链",type=52},
 [23] = {id=52023,order=23,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=10030203,item_name="[极品]3星神战戒指",type=52},
 [24] = {id=52024,order=24,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=10030204,item_name="[极品]3星神战手镯",type=52},
 [25] = {id=52025,order=25,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=11030201,item_name="[极品]3星龙威耳环",type=52},
 [26] = {id=52026,order=26,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=11030202,item_name="[极品]3星龙威项链",type=52},
 [27] = {id=52027,order=27,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=11030203,item_name="[极品]3星龙威戒指",type=52},
 [28] = {id=52028,order=28,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=11030204,item_name="[极品]3星龙威手镯",type=52},
 [29] = {id=52029,order=29,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=12030201,item_name="[极品]3星神愈耳环",type=52},
 [30] = {id=52030,order=30,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=12030202,item_name="[极品]3星神愈项链",type=52},
 [31] = {id=52031,order=31,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=12030203,item_name="[极品]3星神愈戒指",type=52},
 [32] = {id=52032,order=32,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=12030204,item_name="[极品]3星神愈手镯",type=52},
 [33] = {id=52097,order=33,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=13030201,item_name="[极品]3星极速耳环",type=52},
 [34] = {id=52098,order=34,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=13030202,item_name="[极品]3星极速项链",type=52},
 [35] = {id=52099,order=35,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=13030203,item_name="[极品]3星极速戒指",type=52},
 [36] = {id=52100,order=36,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=13030204,item_name="[极品]3星极速手镯",type=52},
 [37] = {id=52101,order=37,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=14030201,item_name="[极品]3星玄护耳环",type=52},
 [38] = {id=52102,order=38,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=14030202,item_name="[极品]3星玄护项链",type=52},
 [39] = {id=52103,order=39,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=14030203,item_name="[极品]3星玄护戒指",type=52},
 [40] = {id=52104,order=40,buy_condit=0,limit_week=0,pay_type="feather_exchange",price=30,limit_month=0,item_num=1,limit_day=0,item_bid=14030204,item_name="[极品]3星玄护手镯",type=52},
 [41] = {id=52033,order=41,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=5040201,item_name="[极品]4星穿甲耳环",type=52},
 [42] = {id=52034,order=42,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=5040202,item_name="[极品]4星穿甲项链",type=52},
 [43] = {id=52035,order=43,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=5040203,item_name="[极品]4星穿甲戒指",type=52},
 [44] = {id=52036,order=44,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=5040204,item_name="[极品]4星穿甲手镯",type=52},
 [45] = {id=52037,order=45,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=6040201,item_name="[极品]4星破法耳环",type=52},
 [46] = {id=52038,order=46,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=6040202,item_name="[极品]4星破法项链",type=52},
 [47] = {id=52039,order=47,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=6040203,item_name="[极品]4星破法戒指",type=52},
 [48] = {id=52040,order=48,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=6040204,item_name="[极品]4星破法手镯",type=52},
 [49] = {id=52041,order=49,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=7040201,item_name="[极品]4星斗战耳环",type=52},
 [50] = {id=52042,order=50,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=7040202,item_name="[极品]4星斗战项链",type=52},
 [51] = {id=52043,order=51,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=7040203,item_name="[极品]4星斗战戒指",type=52},
 [52] = {id=52044,order=52,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=7040204,item_name="[极品]4星斗战手镯",type=52},
 [53] = {id=52045,order=53,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=8040201,item_name="[极品]4星镇灵耳环",type=52},
 [54] = {id=52046,order=54,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=8040202,item_name="[极品]4星镇灵项链",type=52},
 [55] = {id=52047,order=55,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=8040203,item_name="[极品]4星镇灵戒指",type=52},
 [56] = {id=52048,order=56,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=40,limit_month=0,item_num=1,limit_day=0,item_bid=8040204,item_name="[极品]4星镇灵手镯",type=52},
 [57] = {id=52049,order=57,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=9040201,item_name="[极品]4星魔甲耳环",type=52},
 [58] = {id=52050,order=58,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=9040202,item_name="[极品]4星魔甲项链",type=52},
 [59] = {id=52051,order=59,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=9040203,item_name="[极品]4星魔甲戒指",type=52},
 [60] = {id=52052,order=60,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=9040204,item_name="[极品]4星魔甲手镯",type=52},
 [61] = {id=52053,order=61,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=10040201,item_name="[极品]4星神战耳环",type=52},
 [62] = {id=52054,order=62,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=10040202,item_name="[极品]4星神战项链",type=52},
 [63] = {id=52055,order=63,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=10040203,item_name="[极品]4星神战戒指",type=52},
 [64] = {id=52056,order=64,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=10040204,item_name="[极品]4星神战手镯",type=52},
 [65] = {id=52057,order=65,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=11040201,item_name="[极品]4星龙威耳环",type=52},
 [66] = {id=52058,order=66,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=11040202,item_name="[极品]4星龙威项链",type=52},
 [67] = {id=52059,order=67,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=11040203,item_name="[极品]4星龙威戒指",type=52},
 [68] = {id=52060,order=68,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=11040204,item_name="[极品]4星龙威手镯",type=52},
 [69] = {id=52061,order=69,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=12040201,item_name="[极品]4星神愈耳环",type=52},
 [70] = {id=52062,order=70,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=12040202,item_name="[极品]4星神愈项链",type=52},
 [71] = {id=52063,order=71,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=12040203,item_name="[极品]4星神愈戒指",type=52},
 [72] = {id=52064,order=72,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=12040204,item_name="[极品]4星神愈手镯",type=52},
 [73] = {id=52105,order=73,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=13040201,item_name="[极品]4星极速耳环",type=52},
 [74] = {id=52106,order=74,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=13040202,item_name="[极品]4星极速项链",type=52},
 [75] = {id=52107,order=75,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=13040203,item_name="[极品]4星极速戒指",type=52},
 [76] = {id=52108,order=76,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=13040204,item_name="[极品]4星极速手镯",type=52},
 [77] = {id=52109,order=77,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=14040201,item_name="[极品]4星玄护耳环",type=52},
 [78] = {id=52110,order=78,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=14040202,item_name="[极品]4星玄护项链",type=52},
 [79] = {id=52111,order=79,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=14040203,item_name="[极品]4星玄护戒指",type=52},
 [80] = {id=52112,order=80,buy_condit=15000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达15000",pay_type="feather_exchange",price=50,limit_month=0,item_num=1,limit_day=0,item_bid=14040204,item_name="[极品]4星玄护手镯",type=52},
 [81] = {id=52065,order=81,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=5050201,item_name="[极品]5星穿甲耳环",type=52},
 [82] = {id=52066,order=82,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=5050202,item_name="[极品]5星穿甲项链",type=52},
 [83] = {id=52067,order=83,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=5050203,item_name="[极品]5星穿甲戒指",type=52},
 [84] = {id=52068,order=84,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=5050204,item_name="[极品]5星穿甲手镯",type=52},
 [85] = {id=52069,order=85,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=6050201,item_name="[极品]5星破法耳环",type=52},
 [86] = {id=52070,order=86,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=6050202,item_name="[极品]5星破法项链",type=52},
 [87] = {id=52071,order=87,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=6050203,item_name="[极品]5星破法戒指",type=52},
 [88] = {id=52072,order=88,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=6050204,item_name="[极品]5星破法手镯",type=52},
 [89] = {id=52073,order=89,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=7050201,item_name="[极品]5星斗战耳环",type=52},
 [90] = {id=52074,order=90,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=7050202,item_name="[极品]5星斗战项链",type=52},
 [91] = {id=52075,order=91,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=7050203,item_name="[极品]5星斗战戒指",type=52},
 [92] = {id=52076,order=92,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=7050204,item_name="[极品]5星斗战手镯",type=52},
 [93] = {id=52077,order=93,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=8050201,item_name="[极品]5星镇灵耳环",type=52},
 [94] = {id=52078,order=94,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=8050202,item_name="[极品]5星镇灵项链",type=52},
 [95] = {id=52079,order=95,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=8050203,item_name="[极品]5星镇灵戒指",type=52},
 [96] = {id=52080,order=96,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=60,limit_month=0,item_num=1,limit_day=0,item_bid=8050204,item_name="[极品]5星镇灵手镯",type=52},
 [97] = {id=52081,order=97,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=9050201,item_name="[极品]5星魔甲耳环",type=52},
 [98] = {id=52082,order=98,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=9050202,item_name="[极品]5星魔甲项链",type=52},
 [99] = {id=52083,order=99,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=9050203,item_name="[极品]5星魔甲戒指",type=52},
 [100] = {id=52084,order=100,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=9050204,item_name="[极品]5星魔甲手镯",type=52},
 [101] = {id=52085,order=101,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=10050201,item_name="[极品]5星神战耳环",type=52},
 [102] = {id=52086,order=102,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=10050202,item_name="[极品]5星神战项链",type=52},
 [103] = {id=52087,order=103,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=10050203,item_name="[极品]5星神战戒指",type=52},
 [104] = {id=52088,order=104,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=10050204,item_name="[极品]5星神战手镯",type=52},
 [105] = {id=52089,order=105,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=11050201,item_name="[极品]5星龙威耳环",type=52},
 [106] = {id=52090,order=106,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=11050202,item_name="[极品]5星龙威项链",type=52},
 [107] = {id=52091,order=107,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=11050203,item_name="[极品]5星龙威戒指",type=52},
 [108] = {id=52092,order=108,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=11050204,item_name="[极品]5星龙威手镯",type=52},
 [109] = {id=52093,order=109,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=12050201,item_name="[极品]5星神愈耳环",type=52},
 [110] = {id=52094,order=110,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=12050202,item_name="[极品]5星神愈项链",type=52},
 [111] = {id=52095,order=111,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=12050203,item_name="[极品]5星神愈戒指",type=52},
 [112] = {id=52096,order=112,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=12050204,item_name="[极品]5星神愈手镯",type=52},
 [113] = {id=52113,order=113,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=13050201,item_name="[极品]5星极速耳环",type=52},
 [114] = {id=52114,order=114,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=13050202,item_name="[极品]5星极速项链",type=52},
 [115] = {id=52115,order=115,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=13050203,item_name="[极品]5星极速戒指",type=52},
 [116] = {id=52116,order=116,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=13050204,item_name="[极品]5星极速手镯",type=52},
 [117] = {id=52117,order=117,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=14050201,item_name="[极品]5星玄护耳环",type=52},
 [118] = {id=52118,order=118,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=14050202,item_name="[极品]5星玄护项链",type=52},
 [119] = {id=52119,order=119,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=14050203,item_name="[极品]5星玄护戒指",type=52},
 [120] = {id=52120,order=120,buy_condit=24000,limit_week=0,pass_name="需要战力前五英雄的神装总评分达24000",pay_type="feather_exchange",price=100,limit_month=0,item_num=1,limit_day=0,item_bid=14050204,item_name="[极品]5星玄护手镯",type=52}
}
Config.ExchangeData.data_shop_exchage_cloth_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_cloth[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_cloth['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_cloth end--------------------
---------------------data_shop_exchage_arena start--------------------
Config.ExchangeData.data_shop_exchage_arena_length = 11
Config.ExchangeData.data_shop_exchage_arena = {
 [1] = {id=6001,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=1,limit_day=0,pay_type="arena_cent",price=1000,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="4星光明英雄碎片",item_bid=29404,type=6},
 [2] = {id=6002,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=2,limit_day=0,pay_type="arena_cent",price=1000,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="4星黑暗英雄碎片",item_bid=29504,type=6},
 [3] = {id=6003,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=3,limit_day=0,pay_type="arena_cent",price=3500,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="5星水系英雄碎片",item_bid=29105,type=6},
 [4] = {id=6004,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=4,limit_day=0,pay_type="arena_cent",price=3500,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="5星火系英雄碎片",item_bid=29205,type=6},
 [5] = {id=6005,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=5,limit_day=0,pay_type="arena_cent",price=3500,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="5星自然英雄碎片",item_bid=29305,type=6},
 [6] = {id=6006,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=6,limit_day=0,pay_type="arena_cent",price=3500,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="5星随机英雄碎片",item_bid=29905,type=6},
 [7] = {id=6007,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=7,limit_day=0,pay_type="arena_cent",price=2000,lev={1,999},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="先知水晶",item_bid=14001,type=6},
 [8] = {id=6011,bind=1,limit_vip=0,limit_month=0,limit_week=1,open_srv_timestamp=1519003689,order=8,limit_day=0,pay_type="arena_cent",price=1000,lev={1,999},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="永恒晶石",item_bid=10034,type=6},
 [9] = {id=6008,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=9,limit_day=0,pay_type="arena_cent",price=250,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="先知精华",item_bid=14002,type=6},
 [10] = {id=6009,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=10,limit_day=0,pay_type="arena_cent",price=5000,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="雷神碎片",item_bid=27903,type=6},
 [11] = {id=6010,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=11,limit_day=0,pay_type="arena_cent",price=5000,lev={1,999},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="潘多拉碎片",item_bid=28906,type=6}
}
Config.ExchangeData.data_shop_exchage_arena_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_arena[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_arena['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_arena end--------------------
---------------------data_shop_list start--------------------
Config.ExchangeData.data_shop_list_length = 26
Config.ExchangeData.data_shop_list = {
 [1] = {id=1,cost_list={},name="道具",score_sort=0,sort=1,login_red={},item_bid=3,limit={},subtype={}},
 [2] = {id=2,cost_list={{11,5000}},name="英雄",score_sort=9,sort=2,login_red={},item_bid=11,limit={},subtype={}},
 [3] = {id=3,cost_list={},name="积分",score_sort=0,sort=3,login_red={},item_bid=0,limit={},subtype={8,6,5,16,17}},
 [4] = {id=4,cost_list={{3,20}},name="杂货店",score_sort=0,sort=0,login_red={},item_bid=3,limit={},subtype={}},
 [5] = {id=5,cost_list={},name="公会",score_sort=3,sort=0,login_red={},item_bid=10,limit={},subtype={}},
 [6] = {id=6,cost_list={},name="竞技",score_sort=1,sort=0,login_red={},item_bid=8,limit={},subtype={}},
 [8] = {id=8,cost_list={},name="征战",score_sort=2,sort=0,login_red={},item_bid=25,limit={{'lev',30}},subtype={}},
 [9] = {id=9,cost_list={{10450,200}},name="技能",score_sort=0,sort=4,login_red={},item_bid=10450,limit={},subtype={}},
 [16] = {id=16,cost_list={{18,50}},name="探宝",score_sort=4,sort=0,login_red={},item_bid=18,limit={{'lev',10}},subtype={}},
 [17] = {id=17,cost_list={},name="段位",score_sort=5,sort=0,login_red={},item_bid=27,limit={{'lev',100}},subtype={}},
 [18] = {id=18,cost_list={},name="皮肤",score_sort=0,sort=5,login_red={},item_bid=29,limit={{'lev',35}},subtype={}},
 [28] = {id=28,cost_list={},name="神装商店",score_sort=0,sort=0,login_red={},item_bid=28,limit={},subtype={}},
 [30] = {id=30,cost_list={},name="跨服天梯",score_sort=6,sort=0,login_red={},item_bid=21,limit={{'lev',55}},subtype={}},
 [31] = {id=31,cost_list={},name="先知商店",score_sort=0,sort=0,login_red={},item_bid=24,limit={},subtype={}},
 [34] = {id=34,cost_list={{30,100}},name="跨服竞技",score_sort=7,sort=0,login_red={},item_bid=30,limit={{'lev',70}},subtype={}},
 [36] = {id=36,cost_list={},name="冠军商店",score_sort=8,sort=0,login_red={},item_bid=34,limit={{'lev',55}},subtype={}},
 [37] = {id=37,cost_list={},name="巅峰商店",score_sort=10,sort=0,login_red={},item_bid=38,limit={{'lev',55}},subtype={}},
 [40] = {id=40,cost_list={},name="宅室",score_sort=0,sort=0,login_red={},item_bid=0,limit={},subtype={41,42,43}},
 [41] = {id=41,cost_list={},name="家具",score_sort=0,sort=0,login_red={},item_bid=31,limit={},subtype={}},
 [42] = {id=42,cost_list={},name="出行",score_sort=0,sort=0,login_red={},item_bid=31,limit={},subtype={}},
 [43] = {id=43,cost_list={{31,300}},name="随机商店",score_sort=0,sort=0,login_red={},item_bid=3,limit={},subtype={}},
 [50] = {id=50,cost_list={},name="圣羽",score_sort=0,sort=0,login_red={},item_bid=0,limit={{'lev',10},{'open_day',7}},subtype={51,52}},
 [51] = {id=51,cost_list={},name="英雄",score_sort=0,sort=0,login_red={},item_bid=35,limit={{'lev',10},{'open_day',7}},subtype={}},
 [52] = {id=52,cost_list={},name="神装",score_sort=0,sort=0,login_red={},item_bid=35,limit={{'lev',120},{'open_day',7}},subtype={}},
 [53] = {id=53,cost_list={},name="英魂商店",score_sort=0,sort=0,login_red={},item_bid=10005,limit={{'lev',6}},subtype={}},
 [80] = {id=80,cost_list={},name="圣夜奇境商店",score_sort=0,sort=0,login_red={},item_bid=0,limit={{'lev',10},{'open_day',7}},subtype={}}
}
Config.ExchangeData.data_shop_list_fun = function(key)
    local data =Config.ExchangeData.data_shop_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_list['..key..'])not found') return
    end
    return data
end
---------------------data_shop_list end--------------------
---------------------data_shop_exchage_herosoul start--------------------
Config.ExchangeData.data_shop_exchage_herosoul_length = 19
Config.ExchangeData.data_shop_exchage_herosoul = {
 [1] = {id=53001,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=1,pay_type=10005,limit_day=0,price=30,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="冰雪女王碎片",item_bid=24901,item_num=50,type=53},
 [2] = {id=53002,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=2,pay_type=10005,limit_day=0,price=30,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="菲尼克斯碎片",item_bid=25903,item_num=50,type=53},
 [3] = {id=53003,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=3,pay_type=10005,limit_day=0,price=30,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="影刹碎片",item_bid=26901,item_num=50,type=53},
 [4] = {id=53004,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=4,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="冰霜巨龙碎片",item_bid=24902,item_num=50,type=53},
 [5] = {id=53005,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=5,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="派西斯碎片",item_bid=24905,item_num=50,type=53},
 [6] = {id=53006,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=6,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="少年梅林碎片",item_bid=24906,item_num=50,type=53},
 [7] = {id=53007,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=7,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="海宁芙碎片",item_bid=24907,item_num=50,type=53},
 [8] = {id=53008,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=8,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="阿瑞斯碎片",item_bid=24908,item_num=50,type=53},
 [9] = {id=53009,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=9,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="炽天使碎片",item_bid=25900,item_num=50,type=53},
 [10] = {id=53010,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=10,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="炎魔之王碎片",item_bid=25901,item_num=50,type=53},
 [11] = {id=53011,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=11,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="剑豪卡赞碎片",item_bid=25902,item_num=50,type=53},
 [12] = {id=53012,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=12,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="阿波罗碎片",item_bid=25904,item_num=50,type=53},
 [13] = {id=53013,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=13,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="吸血伯爵碎片",item_bid=25905,item_num=50,type=53},
 [14] = {id=53014,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=14,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="奥丁碎片",item_bid=26900,item_num=50,type=53},
 [15] = {id=53015,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=15,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="凯兰崔尔碎片",item_bid=26902,item_num=50,type=53},
 [16] = {id=53016,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=16,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="魅魔女王碎片",item_bid=26903,item_num=50,type=53},
 [17] = {id=53017,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=17,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="美杜莎碎片",item_bid=26904,item_num=50,type=53},
 [18] = {id=53018,bind=1,limit_rank=0,limit_month=1,limit_week=0,order=18,pay_type=10005,limit_day=0,price=20,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="雅典娜碎片",item_bid=26905,item_num=50,type=53},
 [19] = {id=53019,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=19,pay_type=10005,limit_day=0,price=15,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="高级召唤卷",item_bid=10403,item_num=10,type=53}
}
Config.ExchangeData.data_shop_exchage_herosoul_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_herosoul[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_herosoul['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_herosoul end--------------------
---------------------exchage_crosschampion start--------------------
Config.ExchangeData.exchage_crosschampion_length = 8
Config.ExchangeData.exchage_crosschampion = {
 [1] = {id=36001,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=1,pay_type="cluster_guess_cent",limit_day=0,price=14500,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣光之刃",item_bid=40113,item_num=1,type=36},
 [2] = {id=36002,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=2,pay_type="cluster_guess_cent",limit_day=0,price=14500,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣光护甲",item_bid=40213,item_num=1,type=36},
 [3] = {id=36003,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=3,pay_type="cluster_guess_cent",limit_day=0,price=14500,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣光头盔",item_bid=40313,item_num=1,type=36},
 [4] = {id=36004,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=4,pay_type="cluster_guess_cent",limit_day=0,price=14500,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣光戒指",item_bid=40413,item_num=1,type=36},
 [5] = {id=36005,bind=1,limit_rank=0,limit_month=0,limit_week=5,order=5,pay_type="cluster_guess_cent",limit_day=0,price=1250,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="符文精华",item_bid=10450,item_num=1000,type=36},
 [6] = {id=36006,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=6,pay_type="cluster_guess_cent",limit_day=0,price=2500,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="冠军之心",item_bid=10301,item_num=1,type=36},
 [7] = {id=36007,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=7,pay_type="cluster_guess_cent",limit_day=0,price=5000,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="天晶魔液",item_bid=10095,item_num=200,type=36},
 [8] = {id=36008,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=8,pay_type="cluster_guess_cent",limit_day=0,price=750,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="玄魔蛋",item_bid=10602,item_num=1,type=36}
}
Config.ExchangeData.exchage_crosschampion_fun = function(key)
    local data =Config.ExchangeData.exchage_crosschampion[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.exchage_crosschampion['..key..'])not found') return
    end
    return data
end
---------------------exchage_crosschampion end--------------------
Config.ExchangeData.data_shop_exchage_boss_type = {
}
Config.ExchangeData.data_shop_exchage_boss = {
}
Config.ExchangeData.data_shop_exchage_friend = {
}
---------------------data_shop_exchage_suit start--------------------
Config.ExchangeData.data_shop_exchage_suit_length = 14
Config.ExchangeData.data_shop_exchage_suit = {
 [1] = {
    [10030]={id=10030,bind=1,limit_week=0,order=999,pay_type="holy_eqm_coin",price=5,show_condit=0,limit_month=0,star=0,show_star=0,limit_day=100,limit_count=0,lev=105,icon=10030,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="天界神石",item_bid=10030,label=0,item_num=1,type=28},
    [99010101]={id=99010101,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=1010001,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="1星勇气耳环",item_bid=99010101,label=0,item_num=1,type=28},
    [99010102]={id=99010102,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=1010002,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="1星勇气项链",item_bid=99010102,label=0,item_num=1,type=28},
    [99010103]={id=99010103,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=1010003,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="1星勇气戒指",item_bid=99010103,label=0,item_num=1,type=28},
    [99010104]={id=99010104,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=1010004,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="1星勇气手镯",item_bid=99010104,label=0,item_num=1,type=28},
    [99010201]={id=99010201,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=1020001,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="2星勇气耳环",item_bid=99010201,label=0,item_num=1,type=28},
    [99010202]={id=99010202,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=1020002,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="2星勇气项链",item_bid=99010202,label=0,item_num=1,type=28},
    [99010203]={id=99010203,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=1020003,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="2星勇气戒指",item_bid=99010203,label=0,item_num=1,type=28},
    [99010204]={id=99010204,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=1020004,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="2星勇气手镯",item_bid=99010204,label=0,item_num=1,type=28},
    [99010301]={id=99010301,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=1030001,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="3星勇气耳环",item_bid=99010301,label=0,item_num=1,type=28},
    [99010302]={id=99010302,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=1030002,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="3星勇气项链",item_bid=99010302,label=0,item_num=1,type=28},
    [99010303]={id=99010303,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=1030003,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="3星勇气戒指",item_bid=99010303,label=0,item_num=1,type=28},
    [99010304]={id=99010304,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=1030004,discount=0,buy_condit=0,tag=1,is_partner=0,item_name="3星勇气手镯",item_bid=99010304,label=0,item_num=1,type=28},
    [99010401]={id=99010401,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=1040001,discount=0,buy_condit=15000,tag=1,is_partner=0,item_name="4星勇气耳环",item_bid=99010401,label=0,item_num=1,type=28},
    [99010402]={id=99010402,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=1040002,discount=0,buy_condit=15000,tag=1,is_partner=0,item_name="4星勇气项链",item_bid=99010402,label=0,item_num=1,type=28},
    [99010403]={id=99010403,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=1040003,discount=0,buy_condit=15000,tag=1,is_partner=0,item_name="4星勇气戒指",item_bid=99010403,label=0,item_num=1,type=28},
    [99010404]={id=99010404,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=1040004,discount=0,buy_condit=15000,tag=1,is_partner=0,item_name="4星勇气手镯",item_bid=99010404,label=0,item_num=1,type=28},
    [99010501]={id=99010501,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=1050001,discount=0,buy_condit=24000,tag=1,is_partner=0,item_name="5星勇气耳环",item_bid=99010501,label=0,item_num=1,type=28},
    [99010502]={id=99010502,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=1050002,discount=0,buy_condit=24000,tag=1,is_partner=0,item_name="5星勇气项链",item_bid=99010502,label=0,item_num=1,type=28},
    [99010503]={id=99010503,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=1050003,discount=0,buy_condit=24000,tag=1,is_partner=0,item_name="5星勇气戒指",item_bid=99010503,label=0,item_num=1,type=28},
    [99010504]={id=99010504,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=1050004,discount=0,buy_condit=24000,tag=1,is_partner=0,item_name="5星勇气手镯",item_bid=99010504,label=0,item_num=1,type=28}},
 [2] = {
    [99020101]={id=99020101,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=2010001,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="1星狂怒耳环",item_bid=99020101,label=0,item_num=1,type=28},
    [99020102]={id=99020102,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=2010002,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="1星狂怒项链",item_bid=99020102,label=0,item_num=1,type=28},
    [99020103]={id=99020103,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=2010003,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="1星狂怒戒指",item_bid=99020103,label=0,item_num=1,type=28},
    [99020104]={id=99020104,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=2010004,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="1星狂怒手镯",item_bid=99020104,label=0,item_num=1,type=28},
    [99020201]={id=99020201,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=2020001,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="2星狂怒耳环",item_bid=99020201,label=0,item_num=1,type=28},
    [99020202]={id=99020202,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=2020002,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="2星狂怒项链",item_bid=99020202,label=0,item_num=1,type=28},
    [99020203]={id=99020203,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=2020003,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="2星狂怒戒指",item_bid=99020203,label=0,item_num=1,type=28},
    [99020204]={id=99020204,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=2020004,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="2星狂怒手镯",item_bid=99020204,label=0,item_num=1,type=28},
    [99020301]={id=99020301,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=2030001,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="3星狂怒耳环",item_bid=99020301,label=0,item_num=1,type=28},
    [99020302]={id=99020302,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=2030002,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="3星狂怒项链",item_bid=99020302,label=0,item_num=1,type=28},
    [99020303]={id=99020303,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=2030003,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="3星狂怒戒指",item_bid=99020303,label=0,item_num=1,type=28},
    [99020304]={id=99020304,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=2030004,discount=0,buy_condit=0,tag=2,is_partner=0,item_name="3星狂怒手镯",item_bid=99020304,label=0,item_num=1,type=28},
    [99020401]={id=99020401,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=2040001,discount=0,buy_condit=15000,tag=2,is_partner=0,item_name="4星狂怒耳环",item_bid=99020401,label=0,item_num=1,type=28},
    [99020402]={id=99020402,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=2040002,discount=0,buy_condit=15000,tag=2,is_partner=0,item_name="4星狂怒项链",item_bid=99020402,label=0,item_num=1,type=28},
    [99020403]={id=99020403,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=2040003,discount=0,buy_condit=15000,tag=2,is_partner=0,item_name="4星狂怒戒指",item_bid=99020403,label=0,item_num=1,type=28},
    [99020404]={id=99020404,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=2040004,discount=0,buy_condit=15000,tag=2,is_partner=0,item_name="4星狂怒手镯",item_bid=99020404,label=0,item_num=1,type=28},
    [99020501]={id=99020501,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=2050001,discount=0,buy_condit=24000,tag=2,is_partner=0,item_name="5星狂怒耳环",item_bid=99020501,label=0,item_num=1,type=28},
    [99020502]={id=99020502,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=2050002,discount=0,buy_condit=24000,tag=2,is_partner=0,item_name="5星狂怒项链",item_bid=99020502,label=0,item_num=1,type=28},
    [99020503]={id=99020503,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=2050003,discount=0,buy_condit=24000,tag=2,is_partner=0,item_name="5星狂怒戒指",item_bid=99020503,label=0,item_num=1,type=28},
    [99020504]={id=99020504,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=2050004,discount=0,buy_condit=24000,tag=2,is_partner=0,item_name="5星狂怒手镯",item_bid=99020504,label=0,item_num=1,type=28}},
 [3] = {
    [99030101]={id=99030101,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=3010001,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="1星斗志耳环",item_bid=99030101,label=0,item_num=1,type=28},
    [99030102]={id=99030102,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=3010002,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="1星斗志项链",item_bid=99030102,label=0,item_num=1,type=28},
    [99030103]={id=99030103,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=3010003,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="1星斗志戒指",item_bid=99030103,label=0,item_num=1,type=28},
    [99030104]={id=99030104,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=3010004,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="1星斗志手镯",item_bid=99030104,label=0,item_num=1,type=28},
    [99030201]={id=99030201,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=3020001,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="2星斗志耳环",item_bid=99030201,label=0,item_num=1,type=28},
    [99030202]={id=99030202,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=3020002,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="2星斗志项链",item_bid=99030202,label=0,item_num=1,type=28},
    [99030203]={id=99030203,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=3020003,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="2星斗志戒指",item_bid=99030203,label=0,item_num=1,type=28},
    [99030204]={id=99030204,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=3020004,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="2星斗志手镯",item_bid=99030204,label=0,item_num=1,type=28},
    [99030301]={id=99030301,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=3030001,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="3星斗志耳环",item_bid=99030301,label=0,item_num=1,type=28},
    [99030302]={id=99030302,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=3030002,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="3星斗志项链",item_bid=99030302,label=0,item_num=1,type=28},
    [99030303]={id=99030303,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=3030003,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="3星斗志戒指",item_bid=99030303,label=0,item_num=1,type=28},
    [99030304]={id=99030304,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=3030004,discount=0,buy_condit=0,tag=3,is_partner=0,item_name="3星斗志手镯",item_bid=99030304,label=0,item_num=1,type=28},
    [99030401]={id=99030401,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=3040001,discount=0,buy_condit=15000,tag=3,is_partner=0,item_name="4星斗志耳环",item_bid=99030401,label=0,item_num=1,type=28},
    [99030402]={id=99030402,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=3040002,discount=0,buy_condit=15000,tag=3,is_partner=0,item_name="4星斗志项链",item_bid=99030402,label=0,item_num=1,type=28},
    [99030403]={id=99030403,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=3040003,discount=0,buy_condit=15000,tag=3,is_partner=0,item_name="4星斗志戒指",item_bid=99030403,label=0,item_num=1,type=28},
    [99030404]={id=99030404,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=3040004,discount=0,buy_condit=15000,tag=3,is_partner=0,item_name="4星斗志手镯",item_bid=99030404,label=0,item_num=1,type=28},
    [99030501]={id=99030501,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=3050001,discount=0,buy_condit=24000,tag=3,is_partner=0,item_name="5星斗志耳环",item_bid=99030501,label=0,item_num=1,type=28},
    [99030502]={id=99030502,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=3050002,discount=0,buy_condit=24000,tag=3,is_partner=0,item_name="5星斗志项链",item_bid=99030502,label=0,item_num=1,type=28},
    [99030503]={id=99030503,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=3050003,discount=0,buy_condit=24000,tag=3,is_partner=0,item_name="5星斗志戒指",item_bid=99030503,label=0,item_num=1,type=28},
    [99030504]={id=99030504,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=3050004,discount=0,buy_condit=24000,tag=3,is_partner=0,item_name="5星斗志手镯",item_bid=99030504,label=0,item_num=1,type=28}},
 [4] = {
    [99040101]={id=99040101,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=4010001,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="1星灵咏耳环",item_bid=99040101,label=0,item_num=1,type=28},
    [99040102]={id=99040102,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=4010002,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="1星灵咏项链",item_bid=99040102,label=0,item_num=1,type=28},
    [99040103]={id=99040103,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=4010003,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="1星灵咏戒指",item_bid=99040103,label=0,item_num=1,type=28},
    [99040104]={id=99040104,bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=40,show_condit=0,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=4010004,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="1星灵咏手镯",item_bid=99040104,label=0,item_num=1,type=28},
    [99040201]={id=99040201,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=4020001,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="2星灵咏耳环",item_bid=99040201,label=0,item_num=1,type=28},
    [99040202]={id=99040202,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=4020002,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="2星灵咏项链",item_bid=99040202,label=0,item_num=1,type=28},
    [99040203]={id=99040203,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=4020003,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="2星灵咏戒指",item_bid=99040203,label=0,item_num=1,type=28},
    [99040204]={id=99040204,bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=70,show_condit=0,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=4020004,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="2星灵咏手镯",item_bid=99040204,label=0,item_num=1,type=28},
    [99040301]={id=99040301,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=4030001,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="3星灵咏耳环",item_bid=99040301,label=0,item_num=1,type=28},
    [99040302]={id=99040302,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=4030002,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="3星灵咏项链",item_bid=99040302,label=0,item_num=1,type=28},
    [99040303]={id=99040303,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=4030003,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="3星灵咏戒指",item_bid=99040303,label=0,item_num=1,type=28},
    [99040304]={id=99040304,bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=110,show_condit=0,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=4030004,discount=0,buy_condit=0,tag=4,is_partner=0,item_name="3星灵咏手镯",item_bid=99040304,label=0,item_num=1,type=28},
    [99040401]={id=99040401,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=4040001,discount=0,buy_condit=15000,tag=4,is_partner=0,item_name="4星灵咏耳环",item_bid=99040401,label=0,item_num=1,type=28},
    [99040402]={id=99040402,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=4040002,discount=0,buy_condit=15000,tag=4,is_partner=0,item_name="4星灵咏项链",item_bid=99040402,label=0,item_num=1,type=28},
    [99040403]={id=99040403,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=4040003,discount=0,buy_condit=15000,tag=4,is_partner=0,item_name="4星灵咏戒指",item_bid=99040403,label=0,item_num=1,type=28},
    [99040404]={id=99040404,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=160,show_condit=7500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=4040004,discount=0,buy_condit=15000,tag=4,is_partner=0,item_name="4星灵咏手镯",item_bid=99040404,label=0,item_num=1,type=28},
    [99040501]={id=99040501,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=4050001,discount=0,buy_condit=24000,tag=4,is_partner=0,item_name="5星灵咏耳环",item_bid=99040501,label=0,item_num=1,type=28},
    [99040502]={id=99040502,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=4050002,discount=0,buy_condit=24000,tag=4,is_partner=0,item_name="5星灵咏项链",item_bid=99040502,label=0,item_num=1,type=28},
    [99040503]={id=99040503,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=4050003,discount=0,buy_condit=24000,tag=4,is_partner=0,item_name="5星灵咏戒指",item_bid=99040503,label=0,item_num=1,type=28},
    [99040504]={id=99040504,pass_name="战力前五英雄神装\n总评分达24000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=240,show_condit=19500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=4050004,discount=0,buy_condit=24000,tag=4,is_partner=0,item_name="5星灵咏手镯",item_bid=99040504,label=0,item_num=1,type=28}},
 [5] = {
    [99050101]={id=99050101,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=5010001,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="1星穿甲耳环",item_bid=99050101,label=0,item_num=1,type=28},
    [99050102]={id=99050102,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=5010002,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="1星穿甲项链",item_bid=99050102,label=0,item_num=1,type=28},
    [99050103]={id=99050103,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=5010003,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="1星穿甲戒指",item_bid=99050103,label=0,item_num=1,type=28},
    [99050104]={id=99050104,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=5010004,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="1星穿甲手镯",item_bid=99050104,label=0,item_num=1,type=28},
    [99050201]={id=99050201,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=5020001,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="2星穿甲耳环",item_bid=99050201,label=0,item_num=1,type=28},
    [99050202]={id=99050202,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=5020002,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="2星穿甲项链",item_bid=99050202,label=0,item_num=1,type=28},
    [99050203]={id=99050203,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=5020003,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="2星穿甲戒指",item_bid=99050203,label=0,item_num=1,type=28},
    [99050204]={id=99050204,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=5020004,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="2星穿甲手镯",item_bid=99050204,label=0,item_num=1,type=28},
    [99050301]={id=99050301,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=5030001,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="3星穿甲耳环",item_bid=99050301,label=0,item_num=1,type=28},
    [99050302]={id=99050302,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=5030002,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="3星穿甲项链",item_bid=99050302,label=0,item_num=1,type=28},
    [99050303]={id=99050303,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=5030003,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="3星穿甲戒指",item_bid=99050303,label=0,item_num=1,type=28},
    [99050304]={id=99050304,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=5030004,discount=0,buy_condit=15000,tag=5,is_partner=0,item_name="3星穿甲手镯",item_bid=99050304,label=0,item_num=1,type=28},
    [99050401]={id=99050401,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=5040001,discount=0,buy_condit=18000,tag=5,is_partner=0,item_name="4星穿甲耳环",item_bid=99050401,label=0,item_num=1,type=28},
    [99050402]={id=99050402,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=5040002,discount=0,buy_condit=18000,tag=5,is_partner=0,item_name="4星穿甲项链",item_bid=99050402,label=0,item_num=1,type=28},
    [99050403]={id=99050403,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=5040003,discount=0,buy_condit=18000,tag=5,is_partner=0,item_name="4星穿甲戒指",item_bid=99050403,label=0,item_num=1,type=28},
    [99050404]={id=99050404,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=5040004,discount=0,buy_condit=18000,tag=5,is_partner=0,item_name="4星穿甲手镯",item_bid=99050404,label=0,item_num=1,type=28},
    [99050501]={id=99050501,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=5050001,discount=0,buy_condit=27000,tag=5,is_partner=0,item_name="5星穿甲耳环",item_bid=99050501,label=0,item_num=1,type=28},
    [99050502]={id=99050502,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=5050002,discount=0,buy_condit=27000,tag=5,is_partner=0,item_name="5星穿甲项链",item_bid=99050502,label=0,item_num=1,type=28},
    [99050503]={id=99050503,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=5050003,discount=0,buy_condit=27000,tag=5,is_partner=0,item_name="5星穿甲戒指",item_bid=99050503,label=0,item_num=1,type=28},
    [99050504]={id=99050504,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=5050004,discount=0,buy_condit=27000,tag=5,is_partner=0,item_name="5星穿甲手镯",item_bid=99050504,label=0,item_num=1,type=28}},
 [6] = {
    [99060101]={id=99060101,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=6010001,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="1星破法耳环",item_bid=99060101,label=0,item_num=1,type=28},
    [99060102]={id=99060102,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=6010002,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="1星破法项链",item_bid=99060102,label=0,item_num=1,type=28},
    [99060103]={id=99060103,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=6010003,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="1星破法戒指",item_bid=99060103,label=0,item_num=1,type=28},
    [99060104]={id=99060104,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=6010004,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="1星破法手镯",item_bid=99060104,label=0,item_num=1,type=28},
    [99060201]={id=99060201,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=6020001,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="2星破法耳环",item_bid=99060201,label=0,item_num=1,type=28},
    [99060202]={id=99060202,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=6020002,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="2星破法项链",item_bid=99060202,label=0,item_num=1,type=28},
    [99060203]={id=99060203,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=6020003,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="2星破法戒指",item_bid=99060203,label=0,item_num=1,type=28},
    [99060204]={id=99060204,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=6020004,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="2星破法手镯",item_bid=99060204,label=0,item_num=1,type=28},
    [99060301]={id=99060301,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=6030001,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="3星破法耳环",item_bid=99060301,label=0,item_num=1,type=28},
    [99060302]={id=99060302,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=6030002,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="3星破法项链",item_bid=99060302,label=0,item_num=1,type=28},
    [99060303]={id=99060303,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=6030003,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="3星破法戒指",item_bid=99060303,label=0,item_num=1,type=28},
    [99060304]={id=99060304,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=6030004,discount=0,buy_condit=15000,tag=6,is_partner=0,item_name="3星破法手镯",item_bid=99060304,label=0,item_num=1,type=28},
    [99060401]={id=99060401,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=6040001,discount=0,buy_condit=18000,tag=6,is_partner=0,item_name="4星破法耳环",item_bid=99060401,label=0,item_num=1,type=28},
    [99060402]={id=99060402,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=6040002,discount=0,buy_condit=18000,tag=6,is_partner=0,item_name="4星破法项链",item_bid=99060402,label=0,item_num=1,type=28},
    [99060403]={id=99060403,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=6040003,discount=0,buy_condit=18000,tag=6,is_partner=0,item_name="4星破法戒指",item_bid=99060403,label=0,item_num=1,type=28},
    [99060404]={id=99060404,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=6040004,discount=0,buy_condit=18000,tag=6,is_partner=0,item_name="4星破法手镯",item_bid=99060404,label=0,item_num=1,type=28},
    [99060501]={id=99060501,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=6050001,discount=0,buy_condit=27000,tag=6,is_partner=0,item_name="5星破法耳环",item_bid=99060501,label=0,item_num=1,type=28},
    [99060502]={id=99060502,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=6050002,discount=0,buy_condit=27000,tag=6,is_partner=0,item_name="5星破法项链",item_bid=99060502,label=0,item_num=1,type=28},
    [99060503]={id=99060503,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=6050003,discount=0,buy_condit=27000,tag=6,is_partner=0,item_name="5星破法戒指",item_bid=99060503,label=0,item_num=1,type=28},
    [99060504]={id=99060504,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=6050004,discount=0,buy_condit=27000,tag=6,is_partner=0,item_name="5星破法手镯",item_bid=99060504,label=0,item_num=1,type=28}},
 [7] = {
    [99070101]={id=99070101,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=7010001,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="1星斗战耳环",item_bid=99070101,label=0,item_num=1,type=28},
    [99070102]={id=99070102,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=7010002,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="1星斗战项链",item_bid=99070102,label=0,item_num=1,type=28},
    [99070103]={id=99070103,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=7010003,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="1星斗战戒指",item_bid=99070103,label=0,item_num=1,type=28},
    [99070104]={id=99070104,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=7010004,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="1星斗战手镯",item_bid=99070104,label=0,item_num=1,type=28},
    [99070201]={id=99070201,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=7020001,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="2星斗战耳环",item_bid=99070201,label=0,item_num=1,type=28},
    [99070202]={id=99070202,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=7020002,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="2星斗战项链",item_bid=99070202,label=0,item_num=1,type=28},
    [99070203]={id=99070203,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=7020003,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="2星斗战戒指",item_bid=99070203,label=0,item_num=1,type=28},
    [99070204]={id=99070204,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=7020004,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="2星斗战手镯",item_bid=99070204,label=0,item_num=1,type=28},
    [99070301]={id=99070301,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=7030001,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="3星斗战耳环",item_bid=99070301,label=0,item_num=1,type=28},
    [99070302]={id=99070302,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=7030002,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="3星斗战项链",item_bid=99070302,label=0,item_num=1,type=28},
    [99070303]={id=99070303,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=7030003,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="3星斗战戒指",item_bid=99070303,label=0,item_num=1,type=28},
    [99070304]={id=99070304,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=7030004,discount=0,buy_condit=15000,tag=7,is_partner=0,item_name="3星斗战手镯",item_bid=99070304,label=0,item_num=1,type=28},
    [99070401]={id=99070401,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=7040001,discount=0,buy_condit=18000,tag=7,is_partner=0,item_name="4星斗战耳环",item_bid=99070401,label=0,item_num=1,type=28},
    [99070402]={id=99070402,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=7040002,discount=0,buy_condit=18000,tag=7,is_partner=0,item_name="4星斗战项链",item_bid=99070402,label=0,item_num=1,type=28},
    [99070403]={id=99070403,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=7040003,discount=0,buy_condit=18000,tag=7,is_partner=0,item_name="4星斗战戒指",item_bid=99070403,label=0,item_num=1,type=28},
    [99070404]={id=99070404,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=7040004,discount=0,buy_condit=18000,tag=7,is_partner=0,item_name="4星斗战手镯",item_bid=99070404,label=0,item_num=1,type=28},
    [99070501]={id=99070501,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=7050001,discount=0,buy_condit=27000,tag=7,is_partner=0,item_name="5星斗战耳环",item_bid=99070501,label=0,item_num=1,type=28},
    [99070502]={id=99070502,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=7050002,discount=0,buy_condit=27000,tag=7,is_partner=0,item_name="5星斗战项链",item_bid=99070502,label=0,item_num=1,type=28},
    [99070503]={id=99070503,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=7050003,discount=0,buy_condit=27000,tag=7,is_partner=0,item_name="5星斗战戒指",item_bid=99070503,label=0,item_num=1,type=28},
    [99070504]={id=99070504,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=7050004,discount=0,buy_condit=27000,tag=7,is_partner=0,item_name="5星斗战手镯",item_bid=99070504,label=0,item_num=1,type=28}},
 [8] = {
    [99080101]={id=99080101,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=8010001,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="1星镇灵耳环",item_bid=99080101,label=0,item_num=1,type=28},
    [99080102]={id=99080102,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=8010002,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="1星镇灵项链",item_bid=99080102,label=0,item_num=1,type=28},
    [99080103]={id=99080103,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=8010003,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="1星镇灵戒指",item_bid=99080103,label=0,item_num=1,type=28},
    [99080104]={id=99080104,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=50,show_condit=15000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=8010004,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="1星镇灵手镯",item_bid=99080104,label=0,item_num=1,type=28},
    [99080201]={id=99080201,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=8020001,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="2星镇灵耳环",item_bid=99080201,label=0,item_num=1,type=28},
    [99080202]={id=99080202,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=8020002,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="2星镇灵项链",item_bid=99080202,label=0,item_num=1,type=28},
    [99080203]={id=99080203,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=8020003,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="2星镇灵戒指",item_bid=99080203,label=0,item_num=1,type=28},
    [99080204]={id=99080204,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=90,show_condit=15000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=8020004,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="2星镇灵手镯",item_bid=99080204,label=0,item_num=1,type=28},
    [99080301]={id=99080301,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=8030001,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="3星镇灵耳环",item_bid=99080301,label=0,item_num=1,type=28},
    [99080302]={id=99080302,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=8030002,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="3星镇灵项链",item_bid=99080302,label=0,item_num=1,type=28},
    [99080303]={id=99080303,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=8030003,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="3星镇灵戒指",item_bid=99080303,label=0,item_num=1,type=28},
    [99080304]={id=99080304,pass_name="战力前五英雄神装\n总评分达15000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=130,show_condit=15000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=8030004,discount=0,buy_condit=15000,tag=8,is_partner=0,item_name="3星镇灵手镯",item_bid=99080304,label=0,item_num=1,type=28},
    [99080401]={id=99080401,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=8040001,discount=0,buy_condit=18000,tag=8,is_partner=0,item_name="4星镇灵耳环",item_bid=99080401,label=0,item_num=1,type=28},
    [99080402]={id=99080402,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=8040002,discount=0,buy_condit=18000,tag=8,is_partner=0,item_name="4星镇灵项链",item_bid=99080402,label=0,item_num=1,type=28},
    [99080403]={id=99080403,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=8040003,discount=0,buy_condit=18000,tag=8,is_partner=0,item_name="4星镇灵戒指",item_bid=99080403,label=0,item_num=1,type=28},
    [99080404]={id=99080404,pass_name="战力前五英雄神装\n总评分达18000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=200,show_condit=16500,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=8040004,discount=0,buy_condit=18000,tag=8,is_partner=0,item_name="4星镇灵手镯",item_bid=99080404,label=0,item_num=1,type=28},
    [99080501]={id=99080501,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=8050001,discount=0,buy_condit=27000,tag=8,is_partner=0,item_name="5星镇灵耳环",item_bid=99080501,label=0,item_num=1,type=28},
    [99080502]={id=99080502,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=8050002,discount=0,buy_condit=27000,tag=8,is_partner=0,item_name="5星镇灵项链",item_bid=99080502,label=0,item_num=1,type=28},
    [99080503]={id=99080503,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=8050003,discount=0,buy_condit=27000,tag=8,is_partner=0,item_name="5星镇灵戒指",item_bid=99080503,label=0,item_num=1,type=28},
    [99080504]={id=99080504,pass_name="战力前五英雄神装\n总评分达27000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=290,show_condit=22500,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=8050004,discount=0,buy_condit=27000,tag=8,is_partner=0,item_name="5星镇灵手镯",item_bid=99080504,label=0,item_num=1,type=28}},
 [9] = {
    [99090101]={id=99090101,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=9010001,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="1星魔甲耳环",item_bid=99090101,label=0,item_num=1,type=28},
    [99090102]={id=99090102,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=9010002,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="1星魔甲项链",item_bid=99090102,label=0,item_num=1,type=28},
    [99090103]={id=99090103,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=9010003,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="1星魔甲戒指",item_bid=99090103,label=0,item_num=1,type=28},
    [99090104]={id=99090104,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=9010004,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="1星魔甲手镯",item_bid=99090104,label=0,item_num=1,type=28},
    [99090201]={id=99090201,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=9020001,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="2星魔甲耳环",item_bid=99090201,label=0,item_num=1,type=28},
    [99090202]={id=99090202,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=9020002,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="2星魔甲项链",item_bid=99090202,label=0,item_num=1,type=28},
    [99090203]={id=99090203,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=9020003,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="2星魔甲戒指",item_bid=99090203,label=0,item_num=1,type=28},
    [99090204]={id=99090204,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=9020004,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="2星魔甲手镯",item_bid=99090204,label=0,item_num=1,type=28},
    [99090301]={id=99090301,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=9030001,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="3星魔甲耳环",item_bid=99090301,label=0,item_num=1,type=28},
    [99090302]={id=99090302,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=9030002,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="3星魔甲项链",item_bid=99090302,label=0,item_num=1,type=28},
    [99090303]={id=99090303,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=9030003,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="3星魔甲戒指",item_bid=99090303,label=0,item_num=1,type=28},
    [99090304]={id=99090304,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=9030004,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="3星魔甲手镯",item_bid=99090304,label=0,item_num=1,type=28},
    [99090401]={id=99090401,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=9040001,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="4星魔甲耳环",item_bid=99090401,label=0,item_num=1,type=28},
    [99090402]={id=99090402,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=9040002,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="4星魔甲项链",item_bid=99090402,label=0,item_num=1,type=28},
    [99090403]={id=99090403,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=9040003,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="4星魔甲戒指",item_bid=99090403,label=0,item_num=1,type=28},
    [99090404]={id=99090404,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=9040004,discount=0,buy_condit=20000,tag=9,is_partner=0,item_name="4星魔甲手镯",item_bid=99090404,label=0,item_num=1,type=28},
    [99090501]={id=99090501,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=9050001,discount=0,buy_condit=30000,tag=9,is_partner=0,item_name="5星魔甲耳环",item_bid=99090501,label=0,item_num=1,type=28},
    [99090502]={id=99090502,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=9050002,discount=0,buy_condit=30000,tag=9,is_partner=0,item_name="5星魔甲项链",item_bid=99090502,label=0,item_num=1,type=28},
    [99090503]={id=99090503,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=9050003,discount=0,buy_condit=30000,tag=9,is_partner=0,item_name="5星魔甲戒指",item_bid=99090503,label=0,item_num=1,type=28},
    [99090504]={id=99090504,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=9050004,discount=0,buy_condit=30000,tag=9,is_partner=0,item_name="5星魔甲手镯",item_bid=99090504,label=0,item_num=1,type=28}},
 [10] = {
    [99100101]={id=99100101,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=10010001,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="1星神战耳环",item_bid=99100101,label=0,item_num=1,type=28},
    [99100102]={id=99100102,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=10010002,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="1星神战项链",item_bid=99100102,label=0,item_num=1,type=28},
    [99100103]={id=99100103,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=10010003,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="1星神战戒指",item_bid=99100103,label=0,item_num=1,type=28},
    [99100104]={id=99100104,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=10010004,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="1星神战手镯",item_bid=99100104,label=0,item_num=1,type=28},
    [99100201]={id=99100201,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=10020001,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="2星神战耳环",item_bid=99100201,label=0,item_num=1,type=28},
    [99100202]={id=99100202,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=10020002,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="2星神战项链",item_bid=99100202,label=0,item_num=1,type=28},
    [99100203]={id=99100203,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=10020003,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="2星神战戒指",item_bid=99100203,label=0,item_num=1,type=28},
    [99100204]={id=99100204,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=10020004,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="2星神战手镯",item_bid=99100204,label=0,item_num=1,type=28},
    [99100301]={id=99100301,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=10030001,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="3星神战耳环",item_bid=99100301,label=0,item_num=1,type=28},
    [99100302]={id=99100302,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=10030002,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="3星神战项链",item_bid=99100302,label=0,item_num=1,type=28},
    [99100303]={id=99100303,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=10030003,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="3星神战戒指",item_bid=99100303,label=0,item_num=1,type=28},
    [99100304]={id=99100304,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=10030004,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="3星神战手镯",item_bid=99100304,label=0,item_num=1,type=28},
    [99100401]={id=99100401,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=10040001,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="4星神战耳环",item_bid=99100401,label=0,item_num=1,type=28},
    [99100402]={id=99100402,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=10040002,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="4星神战项链",item_bid=99100402,label=0,item_num=1,type=28},
    [99100403]={id=99100403,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=10040003,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="4星神战戒指",item_bid=99100403,label=0,item_num=1,type=28},
    [99100404]={id=99100404,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=10040004,discount=0,buy_condit=20000,tag=10,is_partner=0,item_name="4星神战手镯",item_bid=99100404,label=0,item_num=1,type=28},
    [99100501]={id=99100501,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=10050001,discount=0,buy_condit=30000,tag=10,is_partner=0,item_name="5星神战耳环",item_bid=99100501,label=0,item_num=1,type=28},
    [99100502]={id=99100502,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=10050002,discount=0,buy_condit=30000,tag=10,is_partner=0,item_name="5星神战项链",item_bid=99100502,label=0,item_num=1,type=28},
    [99100503]={id=99100503,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=10050003,discount=0,buy_condit=30000,tag=10,is_partner=0,item_name="5星神战戒指",item_bid=99100503,label=0,item_num=1,type=28},
    [99100504]={id=99100504,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=10050004,discount=0,buy_condit=30000,tag=10,is_partner=0,item_name="5星神战手镯",item_bid=99100504,label=0,item_num=1,type=28}},
 [11] = {
    [99110101]={id=99110101,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=11010001,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="1星龙威耳环",item_bid=99110101,label=0,item_num=1,type=28},
    [99110102]={id=99110102,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=11010002,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="1星龙威项链",item_bid=99110102,label=0,item_num=1,type=28},
    [99110103]={id=99110103,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=11010003,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="1星龙威戒指",item_bid=99110103,label=0,item_num=1,type=28},
    [99110104]={id=99110104,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=11010004,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="1星龙威手镯",item_bid=99110104,label=0,item_num=1,type=28},
    [99110201]={id=99110201,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=11020001,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="2星龙威耳环",item_bid=99110201,label=0,item_num=1,type=28},
    [99110202]={id=99110202,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=11020002,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="2星龙威项链",item_bid=99110202,label=0,item_num=1,type=28},
    [99110203]={id=99110203,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=11020003,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="2星龙威戒指",item_bid=99110203,label=0,item_num=1,type=28},
    [99110204]={id=99110204,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=11020004,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="2星龙威手镯",item_bid=99110204,label=0,item_num=1,type=28},
    [99110301]={id=99110301,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=11030001,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="3星龙威耳环",item_bid=99110301,label=0,item_num=1,type=28},
    [99110302]={id=99110302,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=11030002,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="3星龙威项链",item_bid=99110302,label=0,item_num=1,type=28},
    [99110303]={id=99110303,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=11030003,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="3星龙威戒指",item_bid=99110303,label=0,item_num=1,type=28},
    [99110304]={id=99110304,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=11030004,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="3星龙威手镯",item_bid=99110304,label=0,item_num=1,type=28},
    [99110401]={id=99110401,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=11040001,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="4星龙威耳环",item_bid=99110401,label=0,item_num=1,type=28},
    [99110402]={id=99110402,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=11040002,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="4星龙威项链",item_bid=99110402,label=0,item_num=1,type=28},
    [99110403]={id=99110403,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=11040003,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="4星龙威戒指",item_bid=99110403,label=0,item_num=1,type=28},
    [99110404]={id=99110404,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=11040004,discount=0,buy_condit=20000,tag=11,is_partner=0,item_name="4星龙威手镯",item_bid=99110404,label=0,item_num=1,type=28},
    [99110501]={id=99110501,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=11050001,discount=0,buy_condit=30000,tag=11,is_partner=0,item_name="5星龙威耳环",item_bid=99110501,label=0,item_num=1,type=28},
    [99110502]={id=99110502,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=11050002,discount=0,buy_condit=30000,tag=11,is_partner=0,item_name="5星龙威项链",item_bid=99110502,label=0,item_num=1,type=28},
    [99110503]={id=99110503,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=11050003,discount=0,buy_condit=30000,tag=11,is_partner=0,item_name="5星龙威戒指",item_bid=99110503,label=0,item_num=1,type=28},
    [99110504]={id=99110504,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=11050004,discount=0,buy_condit=30000,tag=11,is_partner=0,item_name="5星龙威手镯",item_bid=99110504,label=0,item_num=1,type=28}},
 [12] = {
    [99120101]={id=99120101,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=12010001,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="1星神愈耳环",item_bid=99120101,label=0,item_num=1,type=28},
    [99120102]={id=99120102,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=12010002,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="1星神愈项链",item_bid=99120102,label=0,item_num=1,type=28},
    [99120103]={id=99120103,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=12010003,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="1星神愈戒指",item_bid=99120103,label=0,item_num=1,type=28},
    [99120104]={id=99120104,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=12010004,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="1星神愈手镯",item_bid=99120104,label=0,item_num=1,type=28},
    [99120201]={id=99120201,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=12020001,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="2星神愈耳环",item_bid=99120201,label=0,item_num=1,type=28},
    [99120202]={id=99120202,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=12020002,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="2星神愈项链",item_bid=99120202,label=0,item_num=1,type=28},
    [99120203]={id=99120203,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=12020003,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="2星神愈戒指",item_bid=99120203,label=0,item_num=1,type=28},
    [99120204]={id=99120204,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=12020004,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="2星神愈手镯",item_bid=99120204,label=0,item_num=1,type=28},
    [99120301]={id=99120301,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=12030001,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="3星神愈耳环",item_bid=99120301,label=0,item_num=1,type=28},
    [99120302]={id=99120302,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=12030002,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="3星神愈项链",item_bid=99120302,label=0,item_num=1,type=28},
    [99120303]={id=99120303,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=12030003,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="3星神愈戒指",item_bid=99120303,label=0,item_num=1,type=28},
    [99120304]={id=99120304,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=12030004,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="3星神愈手镯",item_bid=99120304,label=0,item_num=1,type=28},
    [99120401]={id=99120401,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=12040001,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="4星神愈耳环",item_bid=99120401,label=0,item_num=1,type=28},
    [99120402]={id=99120402,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=12040002,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="4星神愈项链",item_bid=99120402,label=0,item_num=1,type=28},
    [99120403]={id=99120403,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=12040003,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="4星神愈戒指",item_bid=99120403,label=0,item_num=1,type=28},
    [99120404]={id=99120404,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=12040004,discount=0,buy_condit=20000,tag=12,is_partner=0,item_name="4星神愈手镯",item_bid=99120404,label=0,item_num=1,type=28},
    [99120501]={id=99120501,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=12050001,discount=0,buy_condit=30000,tag=12,is_partner=0,item_name="5星神愈耳环",item_bid=99120501,label=0,item_num=1,type=28},
    [99120502]={id=99120502,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=12050002,discount=0,buy_condit=30000,tag=12,is_partner=0,item_name="5星神愈项链",item_bid=99120502,label=0,item_num=1,type=28},
    [99120503]={id=99120503,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=12050003,discount=0,buy_condit=30000,tag=12,is_partner=0,item_name="5星神愈戒指",item_bid=99120503,label=0,item_num=1,type=28},
    [99120504]={id=99120504,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=12050004,discount=0,buy_condit=30000,tag=12,is_partner=0,item_name="5星神愈手镯",item_bid=99120504,label=0,item_num=1,type=28}},
 [13] = {
    [99130101]={id=99130101,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=13010001,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="1星极速耳环",item_bid=99130101,label=0,item_num=1,type=28},
    [99130102]={id=99130102,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=13010002,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="1星极速项链",item_bid=99130102,label=0,item_num=1,type=28},
    [99130103]={id=99130103,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=13010003,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="1星极速戒指",item_bid=99130103,label=0,item_num=1,type=28},
    [99130104]={id=99130104,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=13010004,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="1星极速手镯",item_bid=99130104,label=0,item_num=1,type=28},
    [99130201]={id=99130201,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=13020001,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="2星极速耳环",item_bid=99130201,label=0,item_num=1,type=28},
    [99130202]={id=99130202,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=13020002,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="2星极速项链",item_bid=99130202,label=0,item_num=1,type=28},
    [99130203]={id=99130203,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=13020003,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="2星极速戒指",item_bid=99130203,label=0,item_num=1,type=28},
    [99130204]={id=99130204,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=13020004,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="2星极速手镯",item_bid=99130204,label=0,item_num=1,type=28},
    [99130301]={id=99130301,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=13030001,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="3星极速耳环",item_bid=99130301,label=0,item_num=1,type=28},
    [99130302]={id=99130302,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=13030002,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="3星极速项链",item_bid=99130302,label=0,item_num=1,type=28},
    [99130303]={id=99130303,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=13030003,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="3星极速戒指",item_bid=99130303,label=0,item_num=1,type=28},
    [99130304]={id=99130304,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=13030004,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="3星极速手镯",item_bid=99130304,label=0,item_num=1,type=28},
    [99130401]={id=99130401,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=13040001,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="4星极速耳环",item_bid=99130401,label=0,item_num=1,type=28},
    [99130402]={id=99130402,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=13040002,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="4星极速项链",item_bid=99130402,label=0,item_num=1,type=28},
    [99130403]={id=99130403,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=13040003,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="4星极速戒指",item_bid=99130403,label=0,item_num=1,type=28},
    [99130404]={id=99130404,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=13040004,discount=0,buy_condit=20000,tag=13,is_partner=0,item_name="4星极速手镯",item_bid=99130404,label=0,item_num=1,type=28},
    [99130501]={id=99130501,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=13050001,discount=0,buy_condit=30000,tag=13,is_partner=0,item_name="5星极速耳环",item_bid=99130501,label=0,item_num=1,type=28},
    [99130502]={id=99130502,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=13050002,discount=0,buy_condit=30000,tag=13,is_partner=0,item_name="5星极速项链",item_bid=99130502,label=0,item_num=1,type=28},
    [99130503]={id=99130503,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=13050003,discount=0,buy_condit=30000,tag=13,is_partner=0,item_name="5星极速戒指",item_bid=99130503,label=0,item_num=1,type=28},
    [99130504]={id=99130504,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=13050004,discount=0,buy_condit=30000,tag=13,is_partner=0,item_name="5星极速手镯",item_bid=99130504,label=0,item_num=1,type=28}},
 [14] = {
    [99140101]={id=99140101,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=14010001,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="1星玄护耳环",item_bid=99140101,label=0,item_num=1,type=28},
    [99140102]={id=99140102,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=14010002,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="1星玄护项链",item_bid=99140102,label=0,item_num=1,type=28},
    [99140103]={id=99140103,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=14010003,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="1星玄护戒指",item_bid=99140103,label=0,item_num=1,type=28},
    [99140104]={id=99140104,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=1,pay_type="holy_eqm_coin",price=60,show_condit=20000,limit_month=0,star=0,show_star=1,limit_day=0,limit_count=0,lev=105,icon=14010004,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="1星玄护手镯",item_bid=99140104,label=0,item_num=1,type=28},
    [99140201]={id=99140201,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=14020001,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="2星玄护耳环",item_bid=99140201,label=0,item_num=1,type=28},
    [99140202]={id=99140202,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=14020002,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="2星玄护项链",item_bid=99140202,label=0,item_num=1,type=28},
    [99140203]={id=99140203,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=14020003,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="2星玄护戒指",item_bid=99140203,label=0,item_num=1,type=28},
    [99140204]={id=99140204,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=2,pay_type="holy_eqm_coin",price=110,show_condit=20000,limit_month=0,star=0,show_star=2,limit_day=0,limit_count=0,lev=105,icon=14020004,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="2星玄护手镯",item_bid=99140204,label=0,item_num=1,type=28},
    [99140301]={id=99140301,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=14030001,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="3星玄护耳环",item_bid=99140301,label=0,item_num=1,type=28},
    [99140302]={id=99140302,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=14030002,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="3星玄护项链",item_bid=99140302,label=0,item_num=1,type=28},
    [99140303]={id=99140303,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=14030003,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="3星玄护戒指",item_bid=99140303,label=0,item_num=1,type=28},
    [99140304]={id=99140304,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=3,pay_type="holy_eqm_coin",price=170,show_condit=20000,limit_month=0,star=0,show_star=3,limit_day=0,limit_count=0,lev=105,icon=14030004,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="3星玄护手镯",item_bid=99140304,label=0,item_num=1,type=28},
    [99140401]={id=99140401,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=14040001,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="4星玄护耳环",item_bid=99140401,label=0,item_num=1,type=28},
    [99140402]={id=99140402,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=14040002,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="4星玄护项链",item_bid=99140402,label=0,item_num=1,type=28},
    [99140403]={id=99140403,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=14040003,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="4星玄护戒指",item_bid=99140403,label=0,item_num=1,type=28},
    [99140404]={id=99140404,pass_name="战力前五英雄神装\n总评分达20000",bind=1,limit_week=0,order=4,pay_type="holy_eqm_coin",price=240,show_condit=20000,limit_month=0,star=0,show_star=4,limit_day=0,limit_count=0,lev=105,icon=14040004,discount=0,buy_condit=20000,tag=14,is_partner=0,item_name="4星玄护手镯",item_bid=99140404,label=0,item_num=1,type=28},
    [99140501]={id=99140501,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=14050001,discount=0,buy_condit=30000,tag=14,is_partner=0,item_name="5星玄护耳环",item_bid=99140501,label=0,item_num=1,type=28},
    [99140502]={id=99140502,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=14050002,discount=0,buy_condit=30000,tag=14,is_partner=0,item_name="5星玄护项链",item_bid=99140502,label=0,item_num=1,type=28},
    [99140503]={id=99140503,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=14050003,discount=0,buy_condit=30000,tag=14,is_partner=0,item_name="5星玄护戒指",item_bid=99140503,label=0,item_num=1,type=28},
    [99140504]={id=99140504,pass_name="战力前五英雄神装\n总评分达30000",bind=1,limit_week=0,order=5,pay_type="holy_eqm_coin",price=360,show_condit=25000,limit_month=0,star=0,show_star=5,limit_day=0,limit_count=0,lev=105,icon=14050004,discount=0,buy_condit=30000,tag=14,is_partner=0,item_name="5星玄护手镯",item_bid=99140504,label=0,item_num=1,type=28}}
}
Config.ExchangeData.data_shop_exchage_suit_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_suit[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_suit['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_suit end--------------------
---------------------data_shop_exchage_ladder start--------------------
Config.ExchangeData.data_shop_exchage_ladder_length = 11
Config.ExchangeData.data_shop_exchage_ladder = {
 [1] = {id=30001,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=1,pay_type="sky_coin",limit_day=0,price=50000,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="神灵大祭司碎片",item_bid=27906,item_num=50,type=30},
 [2] = {id=30002,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=2,pay_type="sky_coin",limit_day=0,price=50000,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="潘多拉碎片",item_bid=28906,item_num=50,type=30},
 [3] = {id=30003,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=3,pay_type="sky_coin",limit_day=0,price=37500,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="斯芬克斯碎片",item_bid=26907,item_num=50,type=30},
 [4] = {id=30004,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=4,pay_type="sky_coin",limit_day=0,price=37500,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="瓦尔基里碎片",item_bid=25907,item_num=50,type=30},
 [5] = {id=30005,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=5,pay_type="sky_coin",limit_day=0,price=37500,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="冰雪女王碎片",item_bid=24901,item_num=50,type=30},
 [6] = {id=30006,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=6,pay_type="sky_coin",limit_day=0,price=29000,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣光之刃",item_bid=40113,item_num=1,type=30},
 [7] = {id=30007,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=7,pay_type="sky_coin",limit_day=0,price=29000,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣光护甲",item_bid=40213,item_num=1,type=30},
 [8] = {id=30008,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=8,pay_type="sky_coin",limit_day=0,price=29000,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣光头盔",item_bid=40313,item_num=1,type=30},
 [9] = {id=30009,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=9,pay_type="sky_coin",limit_day=0,price=29000,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣光戒指",item_bid=40413,item_num=1,type=30},
 [10] = {id=30010,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=10,pay_type="sky_coin",limit_day=0,price=1250,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="符文精华",item_bid=10450,item_num=500,type=30},
 [11] = {id=30011,bind=1,limit_rank=0,limit_month=0,limit_week=10,order=11,pay_type="sky_coin",limit_day=0,price=250,limit_count=0,lev={1,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="皮肤碎片",item_bid=29,item_num=1,type=30}
}
Config.ExchangeData.data_shop_exchage_ladder_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_ladder[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_ladder['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_ladder end--------------------
---------------------data_shop_exchage_cost start--------------------
Config.ExchangeData.data_shop_exchage_cost_length = 38
Config.ExchangeData.data_shop_exchage_cost = {
 ["cluster_commodity_num"] = {desc="跨服竞技场商店商品个数限制",key="cluster_commodity_num",val=9},
 ["cluster_recovery"] = {desc="跨服竞技场商店免费次数恢复时间",key="cluster_recovery",val=86400},
 ["cluster_refresh_free"] = {desc="跨服竞技场商店每日免费刷新次数",key="cluster_refresh_free",val=1},
 ["cluster_refresh_number"] = {desc="跨服竞技场商店刷新次数上限",key="cluster_refresh_number",val=20},
 ["cluster_refresh_time"] = {desc="跨服竞技场商店免费次数刷新时间",key="cluster_refresh_time",val={{0,0,0}}},
 ["cost_item"] = {desc="神秘刷新券",key="cost_item",val=10101},
 ["exchange_limit_lev"] = {desc="商城等级限制",key="exchange_limit_lev",val=1},
 ["furniture_recovery"] = {desc="家具随机商店免费次数回复时间（秒）",key="furniture_recovery",val=28800},
 ["furniture_refresh_free"] = {desc="家具随机商店免费刷新次数上限",key="furniture_refresh_free",val=3},
 ["furniture_refresh_number"] = {desc="家具随机商店刷新次数上限",key="furniture_refresh_number",val=10},
 ["furniture_refresh_time"] = {desc="家具随机商店免费次数刷新时间（弃用字段）",key="furniture_refresh_time",val={{0,0,0}}},
 ["furniture_spend"] = {desc="家具随机商店刷新所需花费（家园币）",key="furniture_spend",val=300},
 ["guess_instruction"] = {desc="当前所有商品买完后将会自动刷新",key="guess_instruction",val=0},
 ["hero_soul_instruction"] = {desc="当前所有商品买完后将会自动刷新",key="hero_soul_instruction",val=0},
 ["mall_def"] = {desc="杂货店格子数",key="mall_def",val=6},
 ["max_free_times"] = {desc="杂货店免费次数上限",key="max_free_times",val=5},
 ["maximum_number"] = {desc="杂货店刷新次数上限",key="maximum_number",val=100},
 ["number_recovery"] = {desc="杂货店单次恢复时间（秒）",key="number_recovery",val=7200},
 ["open_arena_cent_lev"] = {desc="尚未解锁竞技场",key="open_arena_cent_lev",val=1},
 ["open_furniture_lev"] = {desc="尚未解锁宅室商店",key="open_furniture_lev",val=70},
 ["open_god_point_lev"] = {desc="20关开启Boss",key="open_god_point_lev",val=1},
 ["open_gold_lev"] = {desc="尚未解锁道具商城",key="open_gold_lev",val=1},
 ["open_guess_point_lev"] = {desc="尚未解锁竞技场",key="open_guess_point_lev",val=1},
 ["open_guild_lev"] = {desc="尚未加入公会",key="open_guild_lev",val=1},
 ["open_hero_soul_lev"] = {desc="尚未解锁神格商城",key="open_hero_soul_lev",val=1},
 ["open_point_lev"] = {desc="尚未解锁积分商城",key="open_point_lev",val=1},
 ["open_secret_lev"] = {desc="尚未解锁杂货店",key="open_secret_lev",val=1},
 ["open_skill_lev"] = {desc="尚未解锁技能商城",key="open_skill_lev",val=1},
 ["secret_instruction"] = {desc="当前所有商品买完后将会自动刷新",key="secret_instruction",val=0},
 ["skill_recovery"] = {desc="技能商店免费次数恢复时间",key="skill_recovery",val=28800},
 ["skill_refresh_free"] = {desc="技能商店每日免费刷新次数",key="skill_refresh_free",val=3},
 ["skill_refresh_number"] = {desc="技能商店刷新次数上限",key="skill_refresh_number",val=20},
 ["skill_refresh_time"] = {desc="技能商店免费次数刷新时间",key="skill_refresh_time",val={{0,0,0}}},
 ["soul_def"] = {desc="英雄商城",key="soul_def",val=11},
 ["soul_reset_cost"] = {desc="神格商店充值消耗",key="soul_reset_cost",val={{11,5000}}},
 ["star_instruction"] = {desc="当前所有商品买完后将会自动刷新",key="star_instruction",val=0},
 ["treasure_plaid"] = {desc="探宝格子数",key="treasure_plaid",val=8},
 ["treasure_time"] = {desc="探宝商城刷新时间",key="treasure_time",val={{0,0,0}}}
}
Config.ExchangeData.data_shop_exchage_cost_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_cost[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_cost['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_cost end--------------------
---------------------data_shop_exchage_furniture start--------------------
Config.ExchangeData.data_shop_exchage_furniture_length = 32
Config.ExchangeData.data_shop_exchage_furniture = {
 [1] = {id=41001,limit_week=0,limit_month=0,order=1,pay_type="home_coin",price=1500,limit_day=0,item_num=1,item_bid=200102,item_type=4,item_desc="舒适度+30",item_name="芬芳花瓶",type=41},
 [2] = {id=41002,limit_week=0,limit_month=0,order=2,pay_type="home_coin",price=1500,limit_day=0,item_num=1,item_bid=200103,item_type=4,item_desc="舒适度+30",item_name="舒适木凳",type=41},
 [3] = {id=41003,limit_week=0,limit_month=0,order=3,pay_type="home_coin",price=1500,limit_day=0,item_num=1,item_bid=200104,item_type=4,item_desc="舒适度+30",item_name="花布小圆桌",type=41},
 [4] = {id=41004,limit_week=0,limit_month=0,order=4,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200151,item_type=2,item_desc="舒适度+100",item_name="温馨小屋地板",type=41},
 [5] = {id=41005,limit_week=0,limit_month=0,order=5,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200152,item_type=1,item_desc="舒适度+100",item_name="温馨小屋墙壁",type=41},
 [6] = {id=41006,limit_week=0,limit_month=0,order=6,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200101,item_type=3,item_desc="舒适度+60",item_name="小挂画",type=41},
 [7] = {id=41007,limit_week=0,limit_month=0,order=7,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200105,item_type=4,item_desc="舒适度+60",item_name="舒适单人沙发",type=41},
 [8] = {id=41008,limit_week=0,limit_month=0,order=8,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200106,item_type=4,item_desc="舒适度+80",item_name="木制书架",type=41},
 [9] = {id=41009,limit_week=0,limit_month=0,order=9,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200107,item_type=4,item_desc="舒适度+40",item_name="木制床头柜",type=41},
 [10] = {id=41010,limit_week=0,limit_month=0,order=10,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200108,item_type=3,item_desc="舒适度+120",item_name="木制挂钟",type=41},
 [11] = {id=41011,limit_week=0,limit_month=0,order=11,pay_type="home_coin",price=1500,limit_day=0,item_num=1,item_bid=200204,item_type=4,item_desc="舒适度+35",item_name="皇室钢琴椅",type=41},
 [12] = {id=41012,limit_week=0,limit_month=0,order=12,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200208,item_type=3,item_desc="舒适度+40",item_name="皇室壁灯",type=41},
 [13] = {id=41013,limit_week=0,limit_month=0,order=13,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200209,item_type=3,item_desc="舒适度+90",item_name="黄金圆镜",type=41},
 [14] = {id=41014,limit_week=0,limit_month=0,order=14,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200201,item_type=4,item_desc="舒适度+60",item_name="皇室茶桌",type=41},
 [15] = {id=41015,limit_week=0,limit_month=0,order=15,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200202,item_type=3,item_desc="舒适度+90",item_name="皇室挂画",type=41},
 [16] = {id=41016,limit_week=0,limit_month=0,order=16,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200203,item_type=4,item_desc="舒适度+40",item_name="红酒小圆桌",type=41},
 [17] = {id=41017,limit_week=0,limit_month=0,order=17,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200205,item_type=4,item_desc="舒适度+60",item_name="皇室尊贵沙发",type=41},
 [18] = {id=41018,limit_week=0,limit_month=0,order=18,pay_type="home_coin",price=5000,limit_day=0,item_num=1,item_bid=200251,item_type=2,item_desc="舒适度+120",item_name="皇室贵族地板",type=41},
 [19] = {id=41019,limit_week=0,limit_month=0,order=19,pay_type="home_coin",price=5000,limit_day=0,item_num=1,item_bid=200252,item_type=1,item_desc="舒适度+120",item_name="皇室贵族墙壁",type=41},
 [20] = {id=41020,limit_week=0,limit_month=0,order=20,pay_type="home_coin",price=1500,limit_day=0,item_num=1,item_bid=200301,item_type=4,item_desc="舒适度+35",item_name="翠绿星座骰子",type=41},
 [21] = {id=41021,limit_week=0,limit_month=0,order=21,pay_type="home_coin",price=1500,limit_day=0,item_num=1,item_bid=200302,item_type=4,item_desc="舒适度+35",item_name="深紫星座骰子",type=41},
 [22] = {id=41022,limit_week=0,limit_month=0,order=22,pay_type="home_coin",price=1500,limit_day=0,item_num=1,item_bid=200303,item_type=4,item_desc="舒适度+35",item_name="湛蓝星座骰子",type=41},
 [23] = {id=41023,limit_week=0,limit_month=0,order=23,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200309,item_type=4,item_desc="舒适度+40",item_name="星月屏风",type=41},
 [24] = {id=41024,limit_week=0,limit_month=0,order=24,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200304,item_type=4,item_desc="舒适度+40",item_name="占星师靠椅",type=41},
 [25] = {id=41025,limit_week=0,limit_month=0,order=25,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200305,item_type=4,item_desc="舒适度+90",item_name="占星师小圆桌",type=41},
 [26] = {id=41026,limit_week=0,limit_month=0,order=26,pay_type="home_coin",price=5000,limit_day=0,item_num=1,item_bid=200351,item_type=2,item_desc="舒适度+120",item_name="占星密室地板",type=41},
 [27] = {id=41027,limit_week=0,limit_month=0,order=27,pay_type="home_coin",price=5000,limit_day=0,item_num=1,item_bid=200352,item_type=1,item_desc="舒适度+120",item_name="占星密室墙壁",type=41},
 [28] = {id=41028,limit_week=0,limit_month=0,order=28,pay_type="home_coin",price=8000,limit_day=0,item_num=1,item_bid=200110,item_type=5,item_desc="舒适度+340",item_name="绒毛圆毯",type=41},
 [29] = {id=41029,limit_week=0,limit_month=0,order=29,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200410,item_type=4,item_desc="舒适度+40",item_name="心意绵绵纸鹤",type=41},
 [30] = {id=41030,limit_week=0,limit_month=0,order=30,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200412,item_type=4,item_desc="舒适度+40",item_name="浓情七夕圆凳",type=41},
 [31] = {id=41031,limit_week=0,limit_month=0,order=31,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200503,item_type=4,item_desc="舒适度+40",item_name="逝者墓碑",type=41},
 [32] = {id=41032,limit_week=0,limit_month=0,order=32,pay_type="home_coin",price=3000,limit_day=0,item_num=1,item_bid=200504,item_type=4,item_desc="舒适度+40",item_name="鬼面树干",type=41}
}
Config.ExchangeData.data_shop_exchage_furniture_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_furniture[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_furniture['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_furniture end--------------------
---------------------data_shop_exchage_expediton start--------------------
Config.ExchangeData.data_shop_exchage_expediton_length = 14
Config.ExchangeData.data_shop_exchage_expediton = {
 [1] = {id=8012,bind=1,limit_vip=0,limit_month=0,limit_week=1,open_srv_timestamp=0,order=1,limit_day=0,pay_type="expedition_medal",price=3750,lev={0,0},item_num=50,icon=0,discount=0,label=0,is_partner=0,item_name="奥术之尘",item_bid=10040,type=8},
 [2] = {id=8001,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=2,limit_day=0,pay_type="expedition_medal",price=1250,lev={0,0},item_num=5,icon=0,discount=0,label=0,is_partner=0,item_name="神器符石",item_bid=72002,type=8},
 [3] = {id=8002,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=3,limit_day=0,pay_type="expedition_medal",price=1875,lev={0,0},item_num=50,icon=0,discount=0,label=0,is_partner=0,item_name="炼神石",item_bid=72001,type=8},
 [4] = {id=8013,bind=1,limit_vip=0,limit_month=0,limit_week=5,open_srv_timestamp=0,order=4,limit_day=0,pay_type="expedition_medal",price=1000,lev={0,0},item_num=10000,icon=0,discount=0,label=0,is_partner=0,item_name="烈阳晶石",item_bid=32,type=8},
 [5] = {id=8003,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=5,limit_day=0,pay_type="expedition_medal",price=5000,lev={0,0},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="5星英雄碎片",item_bid=29905,type=8},
 [6] = {id=8004,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=6,limit_day=0,pay_type="expedition_medal",price=1000,lev={0,0},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="4星水系碎片",item_bid=29104,type=8},
 [7] = {id=8005,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=7,limit_day=0,pay_type="expedition_medal",price=1000,lev={0,0},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="4星火系碎片",item_bid=29204,type=8},
 [8] = {id=8006,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=8,limit_day=0,pay_type="expedition_medal",price=1000,lev={0,0},item_num=10,icon=0,discount=0,label=0,is_partner=0,item_name="4星自然碎片",item_bid=29304,type=8},
 [9] = {id=8007,bind=1,limit_vip=0,limit_month=1,limit_week=0,open_srv_timestamp=0,order=9,limit_day=0,pay_type="expedition_medal",price=45000,lev={0,0},item_num=50,icon=0,discount=0,label=0,is_partner=0,item_name="斯芬克斯碎片",item_bid=26907,type=8},
 [10] = {id=8008,bind=1,limit_vip=0,limit_month=1,limit_week=0,open_srv_timestamp=0,order=10,limit_day=0,pay_type="expedition_medal",price=45000,lev={0,0},item_num=50,icon=0,discount=0,label=0,is_partner=0,item_name="瓦尔基里碎片",item_bid=25907,type=8},
 [11] = {id=8014,bind=1,limit_vip=0,limit_month=1,limit_week=0,open_srv_timestamp=0,order=11,limit_day=0,pay_type="expedition_medal",price=55000,lev={0,0},item_num=50,icon=0,discount=0,label=0,is_partner=0,item_name="哪吒碎片",item_bid=25909,type=8},
 [12] = {id=8011,bind=1,limit_vip=0,limit_month=1,limit_week=0,open_srv_timestamp=0,order=12,limit_day=0,pay_type="expedition_medal",price=45000,lev={0,0},item_num=50,icon=0,discount=0,label=0,is_partner=0,item_name="耶梦加得碎片",item_bid=24909,type=8},
 [13] = {id=8009,bind=1,limit_vip=0,limit_month=1,limit_week=0,open_srv_timestamp=0,order=13,limit_day=0,pay_type="expedition_medal",price=55000,lev={0,0},item_num=50,icon=0,discount=0,label=0,is_partner=0,item_name="雷神碎片",item_bid=27903,type=8},
 [14] = {id=8010,bind=1,limit_vip=0,limit_month=1,limit_week=0,open_srv_timestamp=0,order=14,limit_day=0,pay_type="expedition_medal",price=50000,lev={0,0},item_num=50,icon=0,discount=0,label=0,is_partner=0,item_name="路西法碎片",item_bid=28905,type=8}
}
Config.ExchangeData.data_shop_exchage_expediton_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_expediton[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_expediton['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_expediton end--------------------
---------------------data_shop_exchage_hero start--------------------
Config.ExchangeData.data_shop_exchage_hero_length = 28
Config.ExchangeData.data_shop_exchage_hero = {
 [1] = {id=51001,limit_week=0,order=1,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=24901,item_name="冰雪女王碎片",type=51},
 [2] = {id=51002,limit_week=0,order=2,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=24903,item_name="泰坦碎片",type=51},
 [3] = {id=51003,limit_week=0,order=3,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=24904,item_name="波塞冬碎片",type=51},
 [4] = {id=51004,limit_week=0,order=4,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=24909,item_name="耶梦加得碎片",type=51},
 [5] = {id=51005,limit_week=0,order=5,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=24910,item_name="酒神碎片",type=51},
 [6] = {id=51006,limit_week=0,order=6,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=25906,item_name="普罗米修斯碎片",type=51},
 [7] = {id=51007,limit_week=0,order=7,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=25907,item_name="瓦尔基里碎片",type=51},
 [8] = {id=51008,limit_week=0,order=8,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=25908,item_name="洛基碎片",type=51},
 [9] = {id=51025,limit_week=0,order=9,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=25909,item_name="哪吒碎片",type=51},
 [10] = {id=51027,limit_week=0,order=10,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=25910,item_name="海姆达尔碎片",type=51},
 [11] = {id=51009,limit_week=0,order=11,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=26901,item_name="影刹碎片",type=51},
 [12] = {id=51010,limit_week=0,order=12,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=26906,item_name="潘碎片",type=51},
 [13] = {id=51011,limit_week=0,order=13,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=26907,item_name="斯芬克斯碎片",type=51},
 [14] = {id=51012,limit_week=0,order=14,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=26908,item_name="芬尼尔碎片",type=51},
 [15] = {id=51013,limit_week=0,order=15,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=26909,item_name="拉塔托斯克碎片",type=51},
 [16] = {id=51028,limit_week=0,order=16,pay_type="feather_exchange",price=60,limit_month=0,item_num=50,limit_day=0,item_bid=26910,item_name="辛西娅碎片",type=51},
 [17] = {id=51014,limit_week=0,order=17,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=27901,item_name="宙斯碎片",type=51},
 [18] = {id=51015,limit_week=0,order=18,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=27903,item_name="雷神碎片",type=51},
 [19] = {id=51016,limit_week=0,order=19,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=27906,item_name="神灵大祭司碎片",type=51},
 [20] = {id=51017,limit_week=0,order=20,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=27907,item_name="拉斐尔碎片",type=51},
 [21] = {id=51018,limit_week=0,order=21,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=27908,item_name="维纳斯碎片",type=51},
 [22] = {id=51019,limit_week=0,order=22,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=28901,item_name="哈迪斯碎片",type=51},
 [23] = {id=51020,limit_week=0,order=23,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=28902,item_name="亚巴顿碎片",type=51},
 [24] = {id=51021,limit_week=0,order=24,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=28903,item_name="黑暗之主碎片",type=51},
 [25] = {id=51022,limit_week=0,order=25,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=28905,item_name="路西法碎片",type=51},
 [26] = {id=51023,limit_week=0,order=26,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=28906,item_name="潘多拉碎片",type=51},
 [27] = {id=51024,limit_week=0,order=27,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=28907,item_name="海拉碎片",type=51},
 [28] = {id=51026,limit_week=0,order=28,pay_type="feather_exchange",price=80,limit_month=0,item_num=50,limit_day=0,item_bid=28908,item_name="尼德霍格碎片",type=51}
}
Config.ExchangeData.data_shop_exchage_hero_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_hero[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_hero['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_hero end--------------------
---------------------data_shop_exchage_guild start--------------------
Config.ExchangeData.data_shop_exchage_guild_length = 16
Config.ExchangeData.data_shop_exchage_guild = {
 [1] = {id=5001,arena_elite_lev=0,limit_month=0,limit_day=0,lev={0,0},limit_week=2,pay_type="guild",order=1,price=1500,label=0,item_num=30,item_name="亡灵收割者碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=26801,type=5},
 [2] = {id=5002,arena_elite_lev=0,limit_month=0,limit_day=0,lev={0,0},limit_week=2,pay_type="guild",order=2,price=1500,label=0,item_num=30,item_name="水元素碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=24802,type=5},
 [3] = {id=5003,arena_elite_lev=0,limit_month=0,limit_day=0,lev={0,0},limit_week=2,pay_type="guild",order=3,price=1500,label=0,item_num=30,item_name="翼女碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=25804,type=5},
 [4] = {id=5004,arena_elite_lev=0,limit_month=0,limit_day=0,lev={0,0},limit_week=2,pay_type="guild",order=4,price=2000,label=0,item_num=30,item_name="光明牧师碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=27800,type=5},
 [5] = {id=5005,arena_elite_lev=0,limit_month=0,limit_day=0,lev={0,0},limit_week=2,pay_type="guild",order=5,price=2000,label=0,item_num=30,item_name="死亡骑士碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=28801,type=5},
 [6] = {id=5006,arena_elite_lev=0,limit_month=0,limit_day=0,lev=3,limit_week=1,pay_type="guild",order=6,price=15000,label=0,item_num=50,item_name="波塞冬碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=24904,type=5},
 [7] = {id=5007,arena_elite_lev=0,limit_month=0,limit_day=0,lev=3,limit_week=1,pay_type="guild",order=7,price=15000,label=0,item_num=50,item_name="阿波罗碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=25904,type=5},
 [8] = {id=5008,arena_elite_lev=0,limit_month=0,limit_day=0,lev=3,limit_week=1,pay_type="guild",order=8,price=15000,label=0,item_num=50,item_name="美杜莎碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=26904,type=5},
 [9] = {id=5009,arena_elite_lev=0,limit_month=0,limit_day=0,lev=4,limit_week=1,pay_type="guild",order=9,price=2500,label=0,item_num=10,item_name="5星随机英雄碎片",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=29905,type=5},
 [10] = {id=5010,arena_elite_lev=0,limit_month=0,limit_day=0,lev=5,limit_week=1,pay_type="guild",order=10,price=20000,label=0,item_num=1,item_name="灵犀短刃",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=40114,type=5},
 [11] = {id=5011,arena_elite_lev=0,limit_month=0,limit_day=0,lev=5,limit_week=1,pay_type="guild",order=11,price=20000,label=0,item_num=1,item_name="灵犀护甲",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=40214,type=5},
 [12] = {id=5012,arena_elite_lev=0,limit_month=0,limit_day=0,lev=5,limit_week=1,pay_type="guild",order=12,price=20000,label=0,item_num=1,item_name="灵犀头盔",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=40314,type=5},
 [13] = {id=5013,arena_elite_lev=0,limit_month=0,limit_day=0,lev=5,limit_week=1,pay_type="guild",order=13,price=20000,label=0,item_num=1,item_name="灵犀战靴",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=40414,type=5},
 [14] = {id=5014,arena_elite_lev=0,limit_month=0,limit_day=0,lev=6,limit_week=2,pay_type="guild",order=14,price=2500,label=0,item_num=1,item_name="月亮符文",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=10452,type=5},
 [15] = {id=5015,arena_elite_lev=0,limit_month=0,limit_day=0,lev=4,limit_week=5,pay_type="guild",order=15,price=500,label=0,item_num=1,item_name="星辰符文",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=10451,type=5},
 [16] = {id=5016,arena_elite_lev=0,limit_month=0,limit_day=0,lev=4,limit_week=5,pay_type="guild",order=16,price=50,label=0,item_num=1,item_name="普通召唤卷",discount=0,bind=1,role_lev={},glev=0,is_partner=0,icon=0,item_bid=10401,type=5}
}
Config.ExchangeData.data_shop_exchage_guild_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_guild[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_guild['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_guild end--------------------
Config.ExchangeData.data_shop_star = {
}
---------------------data_shop_exchage_peakchampion start--------------------
Config.ExchangeData.data_shop_exchage_peakchampion_length = 12
Config.ExchangeData.data_shop_exchage_peakchampion = {
 [1] = {id=37001,bind=1,limit_rank=0,limit_month=0,limit_week=0,order=1,pay_type="peak_guess_cent",limit_day=0,price=1000,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="烈阳晶石",item_bid=32,item_num=10000,type=37},
 [2] = {id=37002,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=2,pay_type="peak_guess_cent",limit_day=0,price=7500,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="奥术之尘",item_bid=10040,item_num=100,type=37},
 [3] = {id=37003,bind=1,limit_rank=0,limit_month=2,limit_week=0,order=3,pay_type="peak_guess_cent",limit_day=0,price=3600,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="圣灵蛋",item_bid=10603,item_num=1,type=37},
 [4] = {id=37009,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=4,pay_type="peak_guess_cent",limit_day=0,price=5000,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="先知水晶",item_bid=14001,item_num=1,type=37},
 [5] = {id=37010,bind=1,limit_rank=0,limit_month=0,limit_week=1,order=5,pay_type="peak_guess_cent",limit_day=0,price=10000,limit_count=0,lev={160,999},label=0,icon=0,discount=0,role_lev={{'lv',160}},is_partner=0,item_name="随机觉醒符石",item_bid=16201,item_num=1,type=37},
 [6] = {id=37011,bind=1,limit_rank=0,limit_month=0,limit_week=2,order=6,pay_type="peak_guess_cent",limit_day=0,price=12500,limit_count=0,lev={160,999},label=0,icon=0,discount=0,role_lev={{'lv',160}},is_partner=0,item_name="觉醒石",item_bid=10460,item_num=5,type=37},
 [7] = {id=37012,bind=1,limit_rank=0,limit_month=2,limit_week=0,order=7,pay_type="peak_guess_cent",limit_day=0,price=15000,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="好运宝珠",item_bid=10470,item_num=1,type=37},
 [8] = {id=37004,bind=1,limit_rank=0,limit_month=10,limit_week=0,order=8,pay_type="peak_guess_cent",limit_day=0,price=5000,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="拉斐尔碎片",item_bid=27907,item_num=5,type=37},
 [9] = {id=37005,bind=1,limit_rank=0,limit_month=10,limit_week=0,order=9,pay_type="peak_guess_cent",limit_day=0,price=5000,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="哈迪斯碎片",item_bid=28901,item_num=5,type=37},
 [10] = {id=37006,bind=1,limit_rank=0,limit_month=10,limit_week=0,order=10,pay_type="peak_guess_cent",limit_day=0,price=3750,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="酒神碎片",item_bid=24910,item_num=5,type=37},
 [11] = {id=37007,bind=1,limit_rank=0,limit_month=10,limit_week=0,order=11,pay_type="peak_guess_cent",limit_day=0,price=3750,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="海姆达尔碎片",item_bid=25910,item_num=5,type=37},
 [12] = {id=37008,bind=1,limit_rank=0,limit_month=10,limit_week=0,order=12,pay_type="peak_guess_cent",limit_day=0,price=3750,limit_count=0,lev={55,999},label=0,icon=0,discount=0,role_lev={},is_partner=0,item_name="辛西娅碎片",item_bid=26910,item_num=5,type=37}
}
Config.ExchangeData.data_shop_exchage_peakchampion_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_peakchampion[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_peakchampion['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_peakchampion end--------------------
---------------------data_shop_exchage_pet start--------------------
Config.ExchangeData.data_shop_exchage_pet_length = 18
Config.ExchangeData.data_shop_exchage_pet = {
 [1] = {id=42101,limit_soft=200,limit_month=0,limit_week=0,pay_type="home_coin",order=1,price=200,limit_day=0,item_num=1,item_bid=100101,item_type=1,item_desc="适合短途旅行",item_name="压缩饼干",type=42},
 [2] = {id=42102,limit_soft=600,limit_month=0,limit_week=0,pay_type="home_coin",order=2,price=280,limit_day=0,item_num=1,item_bid=100102,item_type=1,item_desc="适合短途旅行",item_name="饭团",type=42},
 [3] = {id=42103,limit_soft=1000,limit_month=0,limit_week=0,pay_type="home_coin",order=3,price=360,limit_day=0,item_num=1,item_bid=100103,item_type=1,item_desc="适合中程旅行",item_name="蛋糕",type=42},
 [4] = {id=42104,limit_soft=1400,limit_month=0,limit_week=0,pay_type="home_coin",order=4,price=480,limit_day=0,item_num=1,item_bid=100104,item_type=1,item_desc="适合中程旅行",item_name="法式面包",type=42},
 [5] = {id=42105,limit_soft=1800,limit_month=0,limit_week=0,pay_type="home_coin",order=5,price=600,limit_day=0,item_num=1,item_bid=100105,item_type=1,item_desc="适合长途旅行",item_name="三明治",type=42},
 [6] = {id=42106,limit_soft=2300,limit_month=0,limit_week=0,pay_type="home_coin",order=6,price=680,limit_day=0,item_num=1,item_bid=100106,item_type=1,item_desc="适合长途旅行",item_name="汉堡",type=42},
 [7] = {id=42107,limit_soft=2900,limit_month=0,limit_week=0,pay_type="home_coin",order=7,price=760,limit_day=0,item_num=1,item_bid=100107,item_type=1,item_desc="适合超远地区旅行",item_name="披萨",type=42},
 [8] = {id=42108,limit_soft=3500,limit_month=0,limit_week=0,pay_type="home_coin",order=8,price=880,limit_day=0,item_num=1,item_bid=100108,item_type=1,item_desc="适合超远地区旅行",item_name="豪华寿司组",type=42},
 [9] = {id=42201,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=9,price=80,limit_day=2,item_num=1,item_bid=100201,item_type=2,item_desc="英雄碎片概率+5%",item_name="小礼盒",type=42},
 [10] = {id=42202,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=10,price=80,limit_day=2,item_num=1,item_bid=100202,item_type=2,item_desc="符文精华概率+5%",item_name="玻璃瓶",type=42},
 [11] = {id=42203,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=11,price=80,limit_day=2,item_num=1,item_bid=100203,item_type=2,item_desc="日记概率+2%",item_name="毛笔",type=42},
 [12] = {id=42204,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=12,price=80,limit_day=2,item_num=1,item_bid=100204,item_type=2,item_desc="明信片概率+2%",item_name="傻瓜机",type=42},
 [13] = {id=42205,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=13,price=80,limit_day=2,item_num=1,item_bid=100205,item_type=2,item_desc="金币、钻石概率+5%",item_name="手持式探测器",type=42},
 [14] = {id=42241,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=14,price=160,limit_day=2,item_num=1,item_bid=100241,item_type=2,item_desc="英雄碎片概率+10%",item_name="宝箱",type=42},
 [15] = {id=42242,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=15,price=160,limit_day=2,item_num=1,item_bid=100242,item_type=2,item_desc="符文精华概率+10%",item_name="水晶瓶",type=42},
 [16] = {id=42243,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=16,price=160,limit_day=2,item_num=1,item_bid=100243,item_type=2,item_desc="日记概率+5%",item_name="贵重的钢笔",type=42},
 [17] = {id=42244,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=17,price=160,limit_day=2,item_num=1,item_bid=100244,item_type=2,item_desc="明信片概率+5%",item_name="智能相机",type=42},
 [18] = {id=42245,limit_soft=0,limit_month=0,limit_week=0,pay_type="home_coin",order=18,price=160,limit_day=2,item_num=1,item_bid=100245,item_type=2,item_desc="金币钻石概率+10%",item_name="精密的探测仪",type=42}
}
Config.ExchangeData.data_shop_exchage_pet_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_pet[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_pet['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_pet end--------------------
---------------------data_shop_exchage_skin start--------------------
Config.ExchangeData.data_shop_exchage_skin_length = 13
Config.ExchangeData.data_shop_exchage_skin = {
 [1] = {id=18001,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=1,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="水色悠梦(7天)",item_bid=23002,type=18},
 [2] = {id=18002,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=2,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="如梦令(7天)",item_bid=23005,type=18},
 [3] = {id=18003,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=3,limit_day=0,pay_type="skin_debris",price=20,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="赤羽火舞(7天)",item_bid=23008,type=18},
 [4] = {id=18004,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=4,limit_day=0,pay_type="skin_debris",price=20,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="御龙金甲(7天)",item_bid=23011,type=18},
 [5] = {id=18005,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=5,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="赤魅海盗(7天)",item_bid=23014,type=18},
 [6] = {id=18006,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=6,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="甜心女仆(7天)",item_bid=23017,type=18},
 [7] = {id=18007,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=7,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="暗影暴君(7天)",item_bid=23020,type=18},
 [8] = {id=18008,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=8,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="竹韵清风(7天)",item_bid=23023,type=18},
 [9] = {id=18009,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=9,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="暴走青春(7天)",item_bid=23026,type=18},
 [10] = {id=18010,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=10,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="绽放的誓约(7天)",item_bid=23029,type=18},
 [11] = {id=18011,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=11,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="魅夜男爵(7天)",item_bid=23032,type=18},
 [12] = {id=18012,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=12,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="冰雪圆舞曲(7天)",item_bid=23035,type=18},
 [13] = {id=18015,bind=1,limit_vip=0,limit_month=0,limit_week=0,open_srv_timestamp=0,order=13,limit_day=0,pay_type="skin_debris",price=40,lev={0,0},item_num=1,icon=0,discount=0,label=0,is_partner=0,item_name="一战封神(7天)",item_bid=23044,type=18}
}
Config.ExchangeData.data_shop_exchage_skin_fun = function(key)
    local data =Config.ExchangeData.data_shop_exchage_skin[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ExchangeData.data_shop_exchage_skin['..key..'])not found') return
    end
    return data
end
---------------------data_shop_exchage_skin end--------------------

--[[
        oracle_data.lua
        exported by excel2lua.py
        from file:oracle_data.xlsx
--]]


Config = Config or {}
Config.OracleData = Config.OracleData or {}

---------------------data_rank_list start--------------------
Config.OracleData.data_rank_list_length = 9
Config.OracleData.data_rank_list = {
 [1] = {award={{20084,50},{12010,2500}},rank1=1,rank2=1},
 [2] = {award={{20084,40},{12010,2000}},rank1=2,rank2=2},
 [3] = {award={{20084,30},{12010,1500}},rank1=3,rank2=3},
 [5] = {award={{20084,25},{12010,1250}},rank1=5,rank2=4},
 [10] = {award={{20084,20},{12010,1000}},rank1=10,rank2=6},
 [20] = {award={{20084,16},{12010,800}},rank1=20,rank2=11},
 [30] = {award={{20084,12},{12010,600}},rank1=30,rank2=21},
 [50] = {award={{20084,8},{12010,400}},rank1=50,rank2=31},
 [100] = {award={{20084,5},{12010,250}},rank1=100,rank2=51}
}
Config.OracleData.data_rank_list_fun = function(key)
    local data =Config.OracleData.data_rank_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.OracleData.data_rank_list['..key..'])not found') return
    end
    return data
end
---------------------data_rank_list end--------------------
---------------------data_award_list start--------------------
Config.OracleData.data_award_list_length = 6
Config.OracleData.data_award_list = {
 [1] = {id=1,item={{10201,1}},expend={{12010,750}},limit_count=1},
 [2] = {id=2,item={{10213,1}},expend={{12010,250}},limit_count=5},
 [3] = {id=3,item={{15000,5}},expend={{12010,125}},limit_count=10},
 [4] = {id=4,item={{10590,5}},expend={{12010,125}},limit_count=0},
 [5] = {id=5,item={{10200,5}},expend={{12010,375}},limit_count=0},
 [6] = {id=6,item={{1,50000}},expend={{12010,125}},limit_count=0}
}
Config.OracleData.data_award_list_fun = function(key)
    local data =Config.OracleData.data_award_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.OracleData.data_award_list['..key..'])not found') return
    end
    return data
end
---------------------data_award_list end--------------------
---------------------data_const start--------------------
Config.OracleData.data_const_length = 11
Config.OracleData.data_const = {
 ["buy_time"] = {desc="每日购买次数上限",label="buy_time",val=5},
 ["day"] = {desc="活动天数",label="day",val=7},
 ["day_times"] = {desc="次数上限",label="day_times",val=5},
 ["energy_time"] = {desc="恢复时间(秒)",label="energy_time",val=7200},
 ["item_time"] = {desc="道具每日使用上限",label="item_time",val=10},
 ["no_rank_rewards"] = {desc="未上榜奖励",label="no_rank_rewards",val={1,20000}},
 ["open_limit_lev"] = {desc="进入等级限制",label="open_limit_lev",val=20},
 ["orcle_intrduction"] = {desc="1、七天活动期间每击杀一次BOSS，BOSS就会升级变得更强，击杀固定等级的BOSS可以领取BOSS宝藏的奖励。\n2、系统根据玩家攻略进度和总伤害进行排名，排名靠前的玩家可以在七天挑战结束后获得排名奖励。\n3、活动期间，每2小时都会恢复一点挑战次数，可以使用神谕水晶增加次数，也可使用钻石购买挑战次数。\n4、活动结束之后，可以在勋章商店处兑换奖励，活动结束后会保留入口两天让大家进入兑换。",label="orcle_intrduction",val=0},
 ["rewards_item"] = {desc="勋章ID",label="rewards_item",val=12010},
 ["rewards_limit"] = {desc="前三名奖励需要层数",label="rewards_limit",val=30},
 ["times_item"] = {desc="增加次数物品ID",label="times_item",val=10416}
}
Config.OracleData.data_const_fun = function(key)
    local data =Config.OracleData.data_const[key]
    if DATA_DEBUG and data == nil then
        print('( Config.OracleData.data_const['..key..'])not found') return
    end
    return data
end
---------------------data_const end--------------------
---------------------data_boss_list start--------------------
Config.OracleData.data_boss_list_length = 60
Config.OracleData.data_boss_list = {
 [1] = {id=51001,lev=1,boss_id=210001,gold=1298,type_id=1},
 [2] = {id=51002,lev=2,boss_id=210005,gold=2597,type_id=1},
 [3] = {id=51003,lev=3,boss_id=210009,gold=3896,type_id=1},
 [4] = {id=51004,lev=4,boss_id=210013,gold=5195,type_id=1},
 [5] = {id=51005,lev=5,boss_id=210017,gold=6493,type_id=1},
 [6] = {id=51006,lev=6,boss_id=210021,gold=7792,type_id=1},
 [7] = {id=51007,lev=7,boss_id=210025,gold=9091,type_id=1},
 [8] = {id=51008,lev=8,boss_id=210029,gold=10390,type_id=1},
 [9] = {id=51009,lev=9,boss_id=210033,gold=11689,type_id=1},
 [10] = {id=51010,lev=10,boss_id=210037,gold=12987,type_id=1},
 [11] = {id=51011,lev=11,boss_id=210041,gold=14286,type_id=1},
 [12] = {id=51012,lev=12,boss_id=210045,gold=15585,type_id=1},
 [13] = {id=51013,lev=13,boss_id=210049,gold=16884,type_id=1},
 [14] = {id=51014,lev=14,boss_id=210053,gold=18183,type_id=1},
 [15] = {id=51015,lev=15,boss_id=210057,gold=19481,type_id=1},
 [16] = {id=51016,lev=16,boss_id=210061,gold=20780,type_id=1},
 [17] = {id=51017,lev=17,boss_id=210065,gold=22079,type_id=1},
 [18] = {id=51018,lev=18,boss_id=210069,gold=23378,type_id=1},
 [19] = {id=51019,lev=19,boss_id=210073,gold=24676,type_id=1},
 [20] = {id=51020,lev=20,boss_id=210077,gold=25975,type_id=1},
 [21] = {id=51021,lev=21,boss_id=210081,gold=27274,type_id=1},
 [22] = {id=51022,lev=22,boss_id=210085,gold=28573,type_id=1},
 [23] = {id=51023,lev=23,boss_id=210089,gold=29872,type_id=1},
 [24] = {id=51024,lev=24,boss_id=210093,gold=31170,type_id=1},
 [25] = {id=51025,lev=25,boss_id=210097,gold=32469,type_id=1},
 [26] = {id=51026,lev=26,boss_id=210101,gold=33768,type_id=1},
 [27] = {id=51027,lev=27,boss_id=210105,gold=35067,type_id=1},
 [28] = {id=51028,lev=28,boss_id=210109,gold=36366,type_id=1},
 [29] = {id=51029,lev=29,boss_id=210113,gold=37664,type_id=1},
 [30] = {id=51030,lev=30,boss_id=210117,gold=38963,type_id=1},
 [31] = {id=51031,lev=31,boss_id=210121,gold=40911,type_id=1},
 [32] = {id=51032,lev=32,boss_id=210125,gold=42957,type_id=1},
 [33] = {id=51033,lev=33,boss_id=210129,gold=45105,type_id=1},
 [34] = {id=51034,lev=34,boss_id=210133,gold=47360,type_id=1},
 [35] = {id=51035,lev=35,boss_id=210137,gold=49728,type_id=1},
 [36] = {id=51036,lev=36,boss_id=210141,gold=50000,type_id=1},
 [37] = {id=51037,lev=37,boss_id=210145,gold=50000,type_id=1},
 [38] = {id=51038,lev=38,boss_id=210149,gold=50000,type_id=1},
 [39] = {id=51039,lev=39,boss_id=210153,gold=50000,type_id=1},
 [40] = {id=51040,lev=40,boss_id=210157,gold=50000,type_id=1},
 [41] = {id=51041,lev=41,boss_id=210161,gold=50000,type_id=1},
 [42] = {id=51042,lev=42,boss_id=210165,gold=50000,type_id=1},
 [43] = {id=51043,lev=43,boss_id=210169,gold=50000,type_id=1},
 [44] = {id=51044,lev=44,boss_id=210173,gold=50000,type_id=1},
 [45] = {id=51045,lev=45,boss_id=210177,gold=50000,type_id=1},
 [46] = {id=51046,lev=46,boss_id=210181,gold=50000,type_id=1},
 [47] = {id=51047,lev=47,boss_id=210185,gold=50000,type_id=1},
 [48] = {id=51048,lev=48,boss_id=210189,gold=50000,type_id=1},
 [49] = {id=51049,lev=49,boss_id=210193,gold=50000,type_id=1},
 [50] = {id=51050,lev=50,boss_id=210197,gold=50000,type_id=1},
 [51] = {id=51051,lev=51,boss_id=210201,gold=50000,type_id=1},
 [52] = {id=51052,lev=52,boss_id=210205,gold=50000,type_id=1},
 [53] = {id=51053,lev=53,boss_id=210209,gold=50000,type_id=1},
 [54] = {id=51054,lev=54,boss_id=210213,gold=50000,type_id=1},
 [55] = {id=51055,lev=55,boss_id=210217,gold=50000,type_id=1},
 [56] = {id=51056,lev=56,boss_id=210221,gold=50000,type_id=1},
 [57] = {id=51057,lev=57,boss_id=210225,gold=50000,type_id=1},
 [58] = {id=51058,lev=58,boss_id=210229,gold=50000,type_id=1},
 [59] = {id=51059,lev=59,boss_id=210233,gold=50000,type_id=1},
 [60] = {id=51060,lev=60,boss_id=210237,gold=50000,type_id=1}
}
Config.OracleData.data_boss_list_fun = function(key)
    local data =Config.OracleData.data_boss_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.OracleData.data_boss_list['..key..'])not found') return
    end
    return data
end
---------------------data_boss_list end--------------------
---------------------data_box_list start--------------------
Config.OracleData.data_box_list_length = 12
Config.OracleData.data_box_list = {
 [5] = {award={{20084,5},{12010,250}},lev=5},
 [10] = {award={{20084,10},{12010,300}},lev=10},
 [15] = {award={{20084,10},{12010,350}},lev=15},
 [20] = {award={{20084,15},{12010,400}},lev=20},
 [25] = {award={{20084,15},{12010,450}},lev=25},
 [30] = {award={{20084,20},{12010,500}},lev=30},
 [35] = {award={{20084,20},{12010,550}},lev=35},
 [40] = {award={{20084,20},{12010,600}},lev=40},
 [45] = {award={{20084,20},{12010,650}},lev=45},
 [50] = {award={{20084,20},{12010,700}},lev=50},
 [55] = {award={{20084,20},{12010,750}},lev=55},
 [60] = {award={{20084,20},{12010,800}},lev=60}
}
Config.OracleData.data_box_list_fun = function(key)
    local data =Config.OracleData.data_box_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.OracleData.data_box_list['..key..'])not found') return
    end
    return data
end
---------------------data_box_list end--------------------
---------------------data_buy_list start--------------------
Config.OracleData.data_buy_list_length = 5
Config.OracleData.data_buy_list = {
 [1] = {count=1,expend=100,vip_lev=1},
 [2] = {count=2,expend=100,vip_lev=2},
 [3] = {count=3,expend=150,vip_lev=3},
 [4] = {count=4,expend=200,vip_lev=5},
 [5] = {count=5,expend=250,vip_lev=7}
}
Config.OracleData.data_buy_list_fun = function(key)
    local data =Config.OracleData.data_buy_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.OracleData.data_buy_list['..key..'])not found') return
    end
    return data
end
---------------------data_buy_list end--------------------
---------------------data_desc start--------------------
Config.OracleData.data_desc_length = 1
Config.OracleData.data_desc = {
 [1] = {id=1,desc="强大的单体输出和反击能力，被动可以保护自己免受过量伤害，并且在攻击中进行闪电追击",skill_list={50171,50172,50173,50174}}
}
Config.OracleData.data_desc_fun = function(key)
    local data =Config.OracleData.data_desc[key]
    if DATA_DEBUG and data == nil then
        print('( Config.OracleData.data_desc['..key..'])not found') return
    end
    return data
end
---------------------data_desc end--------------------

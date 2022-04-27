--[[
        dun_chapter_data.lua
        exported by excel2lua.py
        from file:dun_chapter_data.xlsx
--]]


Config = Config or {}
Config.DunChapterData = Config.DunChapterData or {}

---------------------data_buy_count start--------------------
Config.DunChapterData.data_buy_count_length = 5
Config.DunChapterData.data_buy_count = {
 [1] = {count=1,expend=50,vip=0},
 [2] = {count=2,expend=100,vip=1},
 [3] = {count=3,expend=150,vip=2},
 [4] = {count=4,expend=200,vip=3},
 [5] = {count=5,expend=250,vip=4}
}
Config.DunChapterData.data_buy_count_fun = function(key)
    local data =Config.DunChapterData.data_buy_count[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunChapterData.data_buy_count['..key..'])not found') return
    end
    return data
end
---------------------data_buy_count end--------------------
---------------------data_const_list start--------------------
Config.DunChapterData.data_const_list_length = 24
Config.DunChapterData.data_const_list = {
 ["battle_times"] = {desc="每个上阵英雄出手次数",label="battle_times",val=6},
 ["condition_1"] = {desc="战斗胜利",label="condition_1",val=0},
 ["condition_2"] = {desc="战斗中无英雄阵亡",label="condition_2",val=0},
 ["condition_3"] = {desc="总出手次数不超过%s次",label="condition_3",val=0},
 ["condition_fb_3"] = {desc="出手次数≤上阵英雄X6",label="condition_fb_3",val=0},
 ["hard_cost"] = {desc="地下城消除体力",label="hard_cost",val=10},
 ["hard_num"] = {desc="地下城挑战次数",label="hard_num",val=3},
 ["mainland_1"] = {desc="第一大陆开启章节",label="mainland_1",val=101},
 ["mainland_2"] = {desc="第二大陆开启章节",label="mainland_2",val=107},
 ["mainland_3"] = {desc="第三大陆开启章节",label="mainland_3",val=112},
 ["mainland_4"] = {desc="第四大陆开启章节",label="mainland_4",val=117},
 ["open_2"] = {desc="开启第2阵位等级",label="open_2",val=1},
 ["open_3"] = {desc="开启第3阵位等级",label="open_3",val=4},
 ["open_4"] = {desc="开启第4阵位等级",label="open_4",val=9},
 ["open_5"] = {desc="开启第5阵位等级",label="open_5",val=15},
 ["open_limit_2"] = {desc="通关中土大陆开启",label="open_limit_2",val=2},
 ["open_limit_3"] = {desc="通关北境冰川大陆开启",label="open_limit_3",val=3},
 ["open_limit_4"] = {desc="通关努曼诺尔大陆开启",label="open_limit_4",val=4},
 ["reward_auto_open"] = {desc="奖励弹出的等级限制（防止太早弹出影响引导）",label="reward_auto_open",val=12},
 ["simple_cost"] = {desc="普通副本消耗体力",label="simple_cost",val=6},
 ["simple_num"] = {desc="普通副本挑战次数",label="simple_num",val=9999},
 ["swap_lev_limit"] = {desc="扫荡等级限制",label="swap_lev_limit",val=25},
 ["swap_vip_limit"] = {desc="扫荡VIP等级限制",label="swap_vip_limit",val=1},
 ["undertown_limit"] = {desc="通关该副本开启地下城",label="undertown_limit",val=10106}
}
Config.DunChapterData.data_const_list_fun = function(key)
    local data =Config.DunChapterData.data_const_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunChapterData.data_const_list['..key..'])not found') return
    end
    return data
end
---------------------data_const_list end--------------------
---------------------data_map_pos start--------------------
Config.DunChapterData.data_map_pos_length = 8
Config.DunChapterData.data_map_pos = {
 [10001] = {map_id=10001,pos_27={},pos_28={},pos_26={},pos_24={},pos_25={},pos_23={},pos_29={},pos_30={},pos_7={{981,196}},pos_3={{370,361}},pos_6={{736,144}},pos_4={{270,158}},pos_5={{549,202}},pos_8={{967,400}},pos_22={},pos_20={},pos_12={{573,470}},pos_13={{278,265}},pos_11={{309,507}},pos_1={{240,483}},pos_10={{866,147}},pos_21={},pos_14={{550,203}},pos_16={{963,399}},pos_2={{472,513}},pos_15={{862,146}},pos_19={},pos_17={{413,389}},pos_18={{992,219}},pos_9={{502,431}}},
 [10002] = {map_id=10002,pos_27={},pos_28={},pos_26={},pos_24={},pos_25={},pos_23={},pos_29={},pos_30={},pos_7={{1015,480}},pos_3={{294,217}},pos_6={{792,345}},pos_4={{540,174}},pos_5={{753,197}},pos_8={{996,287}},pos_22={},pos_20={},pos_12={},pos_13={},pos_11={},pos_1={{371,504}},pos_10={{885,440}},pos_21={},pos_14={},pos_16={},pos_2={{479,382}},pos_15={},pos_19={},pos_17={},pos_18={},pos_9={{403,282}}},
 [10003] = {map_id=10003,pos_27={},pos_28={},pos_26={},pos_24={},pos_25={},pos_23={},pos_29={},pos_30={},pos_7={{912,308}},pos_3={{400,192}},pos_6={{855,161}},pos_4={{564,260}},pos_5={{685,154}},pos_8={{932,440}},pos_22={},pos_20={},pos_12={},pos_13={},pos_11={},pos_1={{299,468}},pos_10={{990,225}},pos_21={},pos_14={},pos_16={},pos_2={{275,332}},pos_15={},pos_19={},pos_17={},pos_18={},pos_9={{300,235}}},
 [10004] = {map_id=10004,pos_27={},pos_28={},pos_26={},pos_24={},pos_25={},pos_23={},pos_29={},pos_30={},pos_7={{1071,373}},pos_3={{548,215}},pos_6={{925,448}},pos_4={{559,406}},pos_5={{756,414}},pos_8={{974,242}},pos_22={},pos_20={},pos_12={},pos_13={},pos_11={},pos_1={{283,398}},pos_10={{1040,497}},pos_21={},pos_14={},pos_16={},pos_2={{299,219}},pos_15={},pos_19={},pos_17={},pos_18={},pos_9={{419,201}}},
 [10005] = {map_id=10005,pos_27={},pos_28={},pos_26={},pos_24={},pos_25={},pos_23={},pos_29={},pos_30={},pos_7={{984,188}},pos_3={{529,484}},pos_6={{745,189}},pos_4={{746,471}},pos_5={{607,314}},pos_8={{960,356}},pos_22={},pos_20={},pos_12={},pos_13={},pos_11={},pos_1={{266,243}},pos_10={{865,154}},pos_21={},pos_14={},pos_16={},pos_2={{284,451}},pos_15={},pos_19={},pos_17={},pos_18={},pos_9={{408,482}}},
 [20001] = {map_id=20001,pos_27={},pos_28={},pos_26={},pos_24={},pos_25={},pos_23={},pos_29={},pos_30={},pos_7={},pos_3={{458,190}},pos_6={},pos_4={{824,179}},pos_5={{1011,432}},pos_8={},pos_22={},pos_20={},pos_12={},pos_13={},pos_11={},pos_1={{355,492}},pos_10={{995,272}},pos_21={},pos_14={},pos_16={},pos_2={{636,398}},pos_15={},pos_19={},pos_17={},pos_18={},pos_9={{447,329}}},
 [20002] = {map_id=20002,pos_27={},pos_28={},pos_26={},pos_24={},pos_25={},pos_23={},pos_29={},pos_30={},pos_7={},pos_3={{706,442}},pos_6={},pos_4={{877,205}},pos_5={{1015,430}},pos_8={},pos_22={},pos_20={},pos_12={},pos_13={},pos_11={},pos_1={{254,206}},pos_10={{1035,256}},pos_21={},pos_14={},pos_16={},pos_2={{453,383}},pos_15={},pos_19={},pos_17={},pos_18={},pos_9={{557,462}}},
 [20003] = {map_id=20003,pos_27={},pos_28={},pos_26={},pos_24={},pos_25={},pos_23={},pos_29={},pos_30={},pos_7={},pos_3={{759,288}},pos_6={},pos_4={{753,532}},pos_5={{1002,386}},pos_8={},pos_22={},pos_20={},pos_12={},pos_13={},pos_11={},pos_1={{335,392}},pos_10={{928,527}},pos_21={},pos_14={},pos_16={},pos_2={{475,204}},pos_15={},pos_19={},pos_17={},pos_18={},pos_9={{642,171}}}
}
Config.DunChapterData.data_map_pos_fun = function(key)
    local data =Config.DunChapterData.data_map_pos[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunChapterData.data_map_pos['..key..'])not found') return
    end
    return data
end
---------------------data_map_pos end--------------------
---------------------data_special_box start--------------------
Config.DunChapterData.data_special_box_length = 83
Config.DunChapterData.data_special_box = {
 [1] = {id=1,award={{10590,16},{10651,2},{10801,2},{10751,2},{10701,2}},map_id=10001,dun_id=10105,chapter_id=101,map_pos=18},
 [2] = {id=2,award={{10651,1},{10801,1},{10751,1},{10701,1}},map_id=10002,dun_id=10202,chapter_id=102,map_pos=9},
 [3] = {id=3,award={{10651,2},{10801,2},{10751,2},{10701,2}},map_id=10002,dun_id=10206,chapter_id=102,map_pos=10},
 [4] = {id=4,award={{10652,3},{10802,3},{10752,3},{10702,2}},map_id=10004,dun_id=10302,chapter_id=103,map_pos=9},
 [5] = {id=5,award={{10652,3},{10802,3},{10752,3},{10702,2}},map_id=10004,dun_id=10306,chapter_id=103,map_pos=10},
 [6] = {id=6,award={{10653,4},{10803,4},{10753,4},{10703,3}},map_id=10005,dun_id=10402,chapter_id=104,map_pos=9},
 [7] = {id=7,award={{10653,4},{10803,4},{10753,4},{10703,3}},map_id=10005,dun_id=10406,chapter_id=104,map_pos=10},
 [8] = {id=8,award={{10654,6},{10804,6},{10754,6},{10704,4}},map_id=10003,dun_id=10502,chapter_id=105,map_pos=9},
 [9] = {id=9,award={{10654,6},{10804,6},{10754,6},{10704,4}},map_id=10003,dun_id=10506,chapter_id=105,map_pos=10},
 [10] = {id=10,award={{10655,8},{10805,8},{10755,8},{10705,6}},map_id=10001,dun_id=10602,chapter_id=106,map_pos=9},
 [11] = {id=11,award={{10655,8},{10805,8},{10755,8},{10705,6}},map_id=10001,dun_id=10606,chapter_id=106,map_pos=10},
 [12] = {id=12,award={{10656,10},{10806,10},{10756,10},{10706,8}},map_id=10002,dun_id=10702,chapter_id=107,map_pos=9},
 [13] = {id=13,award={{10656,10},{10806,10},{10756,10},{10706,8}},map_id=10002,dun_id=10706,chapter_id=107,map_pos=10},
 [14] = {id=14,award={{10657,10},{10807,10},{10757,10},{10707,10}},map_id=10001,dun_id=10802,chapter_id=108,map_pos=9},
 [15] = {id=15,award={{10657,10},{10807,10},{10757,10},{10707,10}},map_id=10001,dun_id=10806,chapter_id=108,map_pos=10},
 [16] = {id=16,award={{10658,10},{10808,10},{10758,10},{10708,10}},map_id=10004,dun_id=10902,chapter_id=109,map_pos=9},
 [17] = {id=17,award={{10658,10},{10808,10},{10758,10},{10708,10}},map_id=10004,dun_id=10906,chapter_id=109,map_pos=10},
 [18] = {id=18,award={{10659,10},{10809,10},{10759,10},{10709,10}},map_id=10005,dun_id=11002,chapter_id=110,map_pos=9},
 [19] = {id=19,award={{10659,10},{10809,10},{10759,10},{10709,10}},map_id=10005,dun_id=11006,chapter_id=110,map_pos=10},
 [20] = {id=20,award={{10660,10},{10810,10},{10760,10},{10710,10}},map_id=10003,dun_id=11102,chapter_id=111,map_pos=9},
 [21] = {id=21,award={{10660,10},{10810,10},{10760,10},{10710,10}},map_id=10003,dun_id=11106,chapter_id=111,map_pos=10},
 [22] = {id=22,award={{10660,10},{10810,10},{10760,10},{10710,10}},map_id=10001,dun_id=11202,chapter_id=112,map_pos=9},
 [23] = {id=23,award={{10660,10},{10810,10},{10760,10},{10710,10}},map_id=10001,dun_id=11206,chapter_id=112,map_pos=10},
 [24] = {id=24,award={{10661,10},{10811,10},{10761,10},{10711,10}},map_id=10002,dun_id=11302,chapter_id=113,map_pos=9},
 [25] = {id=25,award={{10661,10},{10811,10},{10761,10},{10711,10}},map_id=10002,dun_id=11306,chapter_id=113,map_pos=10},
 [26] = {id=26,award={{10661,10},{10811,10},{10761,10},{10711,10}},map_id=10003,dun_id=11402,chapter_id=114,map_pos=9},
 [27] = {id=27,award={{10661,10},{10811,10},{10761,10},{10711,10}},map_id=10003,dun_id=11406,chapter_id=114,map_pos=10},
 [28] = {id=28,award={{10662,10},{10812,10},{10762,10},{10712,10}},map_id=10004,dun_id=11502,chapter_id=115,map_pos=9},
 [29] = {id=29,award={{10662,10},{10812,10},{10762,10},{10712,10}},map_id=10004,dun_id=11506,chapter_id=115,map_pos=10},
 [30] = {id=30,award={{10662,10},{10812,10},{10762,10},{10712,10}},map_id=10003,dun_id=11602,chapter_id=116,map_pos=9},
 [31] = {id=31,award={{10662,10},{10812,10},{10762,10},{10712,10}},map_id=10003,dun_id=11606,chapter_id=116,map_pos=10},
 [32] = {id=32,award={{2,30},{10600,3}},map_id=20001,dun_id=20102,chapter_id=201,map_pos=9},
 [33] = {id=33,award={{2,30},{10600,3}},map_id=20001,dun_id=20104,chapter_id=201,map_pos=10},
 [34] = {id=34,award={{2,30},{10601,3}},map_id=20003,dun_id=20202,chapter_id=202,map_pos=9},
 [35] = {id=35,award={{2,30},{10601,3}},map_id=20003,dun_id=20204,chapter_id=202,map_pos=10},
 [36] = {id=36,award={{2,30},{10602,3}},map_id=20002,dun_id=20302,chapter_id=203,map_pos=9},
 [37] = {id=37,award={{2,30},{10602,3}},map_id=20002,dun_id=20304,chapter_id=203,map_pos=10},
 [38] = {id=38,award={{2,30},{10603,3}},map_id=20001,dun_id=20402,chapter_id=204,map_pos=9},
 [39] = {id=39,award={{2,30},{10603,3}},map_id=20001,dun_id=20404,chapter_id=204,map_pos=10},
 [40] = {id=40,award={{2,30},{10604,3}},map_id=20003,dun_id=20502,chapter_id=205,map_pos=9},
 [41] = {id=41,award={{2,30},{10604,3}},map_id=20003,dun_id=20504,chapter_id=205,map_pos=10},
 [42] = {id=42,award={{2,30},{10605,3}},map_id=20002,dun_id=20602,chapter_id=206,map_pos=9},
 [43] = {id=43,award={{2,30},{10605,3}},map_id=20002,dun_id=20604,chapter_id=206,map_pos=10},
 [44] = {id=44,award={{2,30},{10606,3}},map_id=20001,dun_id=20702,chapter_id=207,map_pos=9},
 [45] = {id=45,award={{2,30},{10606,3}},map_id=20001,dun_id=20704,chapter_id=207,map_pos=10},
 [46] = {id=46,award={{2,30},{10606,3}},map_id=20003,dun_id=20802,chapter_id=208,map_pos=9},
 [47] = {id=47,award={{2,30},{10606,3}},map_id=20003,dun_id=20804,chapter_id=208,map_pos=10},
 [48] = {id=48,award={{2,30},{10607,3}},map_id=20002,dun_id=20902,chapter_id=209,map_pos=9},
 [49] = {id=49,award={{2,30},{10607,3}},map_id=20002,dun_id=20904,chapter_id=209,map_pos=10},
 [50] = {id=50,award={{2,30},{10607,3}},map_id=20001,dun_id=21002,chapter_id=210,map_pos=9},
 [51] = {id=51,award={{2,30},{10607,3}},map_id=20001,dun_id=21004,chapter_id=210,map_pos=10},
 [52] = {id=52,award={{2,30},{10608,3}},map_id=20003,dun_id=21102,chapter_id=211,map_pos=9},
 [53] = {id=53,award={{2,30},{10608,3}},map_id=20003,dun_id=21104,chapter_id=211,map_pos=10},
 [54] = {id=54,award={{2,30},{10608,3}},map_id=20002,dun_id=21202,chapter_id=212,map_pos=9},
 [55] = {id=55,award={{2,30},{10608,3}},map_id=20002,dun_id=21204,chapter_id=212,map_pos=10},
 [56] = {id=56,award={{2,30},{10609,3}},map_id=20001,dun_id=21302,chapter_id=213,map_pos=9},
 [57] = {id=57,award={{2,30},{10609,3}},map_id=20001,dun_id=21304,chapter_id=213,map_pos=10},
 [58] = {id=58,award={{2,30},{10609,3}},map_id=20003,dun_id=21402,chapter_id=214,map_pos=9},
 [59] = {id=59,award={{2,30},{10609,3}},map_id=20003,dun_id=21404,chapter_id=214,map_pos=10},
 [60] = {id=60,award={{2,30},{10610,3}},map_id=20002,dun_id=21502,chapter_id=215,map_pos=9},
 [61] = {id=61,award={{2,30},{10610,3}},map_id=20002,dun_id=21504,chapter_id=215,map_pos=10},
 [62] = {id=62,award={{2,30},{10610,3}},map_id=20001,dun_id=21602,chapter_id=216,map_pos=9},
 [63] = {id=63,award={{2,30},{10610,3}},map_id=20001,dun_id=21604,chapter_id=216,map_pos=10},
 [64] = {id=64,award={{2,30},{10611,3}},map_id=20002,dun_id=21702,chapter_id=217,map_pos=9},
 [65] = {id=65,award={{2,30},{10611,3}},map_id=20002,dun_id=21704,chapter_id=217,map_pos=10},
 [66] = {id=66,award={{2,30},{10611,3}},map_id=20001,dun_id=21802,chapter_id=218,map_pos=9},
 [67] = {id=67,award={{2,30},{10611,3}},map_id=20001,dun_id=21804,chapter_id=218,map_pos=10},
 [68] = {id=68,award={{2,30},{10612,3}},map_id=20003,dun_id=21902,chapter_id=219,map_pos=9},
 [69] = {id=69,award={{2,30},{10612,3}},map_id=20003,dun_id=21904,chapter_id=219,map_pos=10},
 [70] = {id=70,award={{2,30},{10612,3}},map_id=20002,dun_id=22002,chapter_id=220,map_pos=9},
 [71] = {id=71,award={{2,30},{10612,3}},map_id=20002,dun_id=22004,chapter_id=220,map_pos=10},
 [72] = {id=72,award={{2,30},{10613,3}},map_id=20001,dun_id=22102,chapter_id=221,map_pos=9},
 [73] = {id=73,award={{2,30},{10613,3}},map_id=20001,dun_id=22104,chapter_id=221,map_pos=10},
 [74] = {id=74,award={{10663,10},{10813,10},{10763,10},{10713,10}},map_id=10001,dun_id=11702,chapter_id=117,map_pos=9},
 [75] = {id=75,award={{10663,10},{10813,10},{10763,10},{10713,10}},map_id=10001,dun_id=11706,chapter_id=117,map_pos=10},
 [76] = {id=76,award={{10664,10},{10814,10},{10764,10},{10714,10}},map_id=10002,dun_id=11802,chapter_id=118,map_pos=9},
 [77] = {id=77,award={{10664,10},{10814,10},{10764,10},{10714,10}},map_id=10002,dun_id=11806,chapter_id=118,map_pos=10},
 [78] = {id=78,award={{10664,10},{10814,10},{10764,10},{10714,10}},map_id=10003,dun_id=11902,chapter_id=119,map_pos=9},
 [79] = {id=79,award={{10664,10},{10814,10},{10764,10},{10714,10}},map_id=10003,dun_id=11906,chapter_id=119,map_pos=10},
 [80] = {id=80,award={{10665,10},{10815,10},{10765,10},{10715,10}},map_id=10004,dun_id=12002,chapter_id=120,map_pos=9},
 [81] = {id=81,award={{10665,10},{10815,10},{10765,10},{10715,10}},map_id=10004,dun_id=12006,chapter_id=120,map_pos=10},
 [82] = {id=82,award={{10665,10},{10815,10},{10765,10},{10715,10}},map_id=10003,dun_id=12102,chapter_id=121,map_pos=9},
 [83] = {id=83,award={{10665,10},{10815,10},{10765,10},{10715,10}},map_id=10003,dun_id=12106,chapter_id=121,map_pos=10}
}
Config.DunChapterData.data_special_box_fun = function(key)
    local data =Config.DunChapterData.data_special_box[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunChapterData.data_special_box['..key..'])not found') return
    end
    return data
end
---------------------data_special_box end--------------------
---------------------data_guide_reward start--------------------
Config.DunChapterData.data_guide_reward_length = 16
Config.DunChapterData.data_guide_reward = {
 [1001] = {id=1,condition=10106,icon=2,award={{2,50}},chapter_name="第一章",award_id=1001,chapter_id=101,partner_id=30021},
 [1002] = {id=1,condition=10208,icon=2,award={{2,50}},chapter_name="第二章",award_id=1002,chapter_id=102,partner_id=0},
 [1003] = {id=1,condition=10308,icon=2,award={{2,50}},chapter_name="第三章",award_id=1003,chapter_id=103,partner_id=0},
 [1004] = {id=1,condition=10408,icon=2,award={{2,50}},chapter_name="第四章",award_id=1004,chapter_id=104,partner_id=0},
 [1005] = {id=1,condition=10508,icon=2,award={{2,50}},chapter_name="第五章",award_id=1005,chapter_id=105,partner_id=0},
 [1006] = {id=1,condition=10608,icon=30021,award={{26001,1}},chapter_name="第六章",award_id=1006,chapter_id=106,partner_id=0},
 [2001] = {id=2,condition=10708,icon=2,award={{2,80}},chapter_name="第七章",award_id=2001,chapter_id=107,partner_id=30015},
 [2002] = {id=2,condition=10808,icon=2,award={{2,80}},chapter_name="第八章",award_id=2002,chapter_id=108,partner_id=0},
 [2003] = {id=2,condition=10908,icon=2,award={{2,80}},chapter_name="第九章",award_id=2003,chapter_id=109,partner_id=0},
 [2004] = {id=2,condition=11008,icon=2,award={{2,80}},chapter_name="第十章",award_id=2004,chapter_id=110,partner_id=0},
 [2005] = {id=2,condition=11108,icon=30015,award={{26000,1}},chapter_name="第十一章",award_id=2005,chapter_id=111,partner_id=0},
 [3001] = {id=3,condition=11208,icon=2,award={{2,100}},chapter_name="第十二章",award_id=3001,chapter_id=112,partner_id=20011},
 [3002] = {id=3,condition=11308,icon=2,award={{2,100}},chapter_name="第十三章",award_id=3002,chapter_id=113,partner_id=0},
 [3003] = {id=3,condition=11408,icon=2,award={{2,100}},chapter_name="第十四章",award_id=3003,chapter_id=114,partner_id=0},
 [3004] = {id=3,condition=11508,icon=2,award={{2,100}},chapter_name="第十五章",award_id=3004,chapter_id=115,partner_id=0},
 [3005] = {id=3,condition=11608,icon=20011,award={{26002,1}},chapter_name="第十六章",award_id=3005,chapter_id=116,partner_id=0}
}
Config.DunChapterData.data_guide_reward_fun = function(key)
    local data =Config.DunChapterData.data_guide_reward[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunChapterData.data_guide_reward['..key..'])not found') return
    end
    return data
end
---------------------data_guide_reward end--------------------
---------------------data_chapter_list start--------------------
Config.DunChapterData.data_chapter_list_length = 42
Config.DunChapterData.data_chapter_list = {
 [101] = {id=101,award={{9,{{10,1000},{20078,10},{1,15000},{3,20}}},{18,{{20072,8},{10,2000},{1,30000}}}},name="迷雾森林",link_id=201,island_id=1,chapter_index="第1章",open_lev=1,type=0},
 [102] = {id=102,award={{12,{{2,40},{10590,20},{1,20000}}},{24,{{2,60},{10590,30},{1,40000}}}},name="帕兰诺平原",link_id=202,island_id=1,chapter_index="第2章",open_lev=1,type=0},
 [103] = {id=103,award={{12,{{2,40},{10590,20},{1,25000}}},{24,{{2,60},{10590,30},{1,50000}}}},name="安格玛山脉",link_id=203,island_id=1,chapter_index="第3章",open_lev=1,type=0},
 [104] = {id=104,award={{12,{{2,40},{10590,20},{1,30000}}},{24,{{2,60},{10590,30},{1,60000}}}},name="风暴雪山",link_id=204,island_id=1,chapter_index="第4章",open_lev=17,type=0},
 [105] = {id=105,award={{12,{{2,40},{10590,20},{1,35000}}},{24,{{2,60},{10590,30},{1,70000}}}},name="图拉蒙神庙",link_id=205,island_id=1,chapter_index="第5章",open_lev=21,type=0},
 [106] = {id=106,award={{12,{{2,40},{10590,20},{1,40000}}},{24,{{2,60},{10590,30},{1,80000}}}},name="永歌森林",link_id=206,island_id=1,chapter_index="第6章",open_lev=25,type=0},
 [107] = {id=107,award={{12,{{2,40},{10590,20},{1,45000}}},{24,{{2,60},{10590,30},{1,90000}}}},name="北裂境平原",link_id=207,island_id=2,chapter_index="第7章",open_lev=29,type=0},
 [108] = {id=108,award={{12,{{2,40},{10590,20},{1,50000}}},{24,{{2,60},{10590,30},{1,100000}}}},name="落日森林",link_id=208,island_id=2,chapter_index="第8章",open_lev=33,type=0},
 [109] = {id=109,award={{12,{{2,40},{10590,20},{1,55000}}},{24,{{2,60},{10590,30},{1,110000}}}},name="叹息山脉",link_id=209,island_id=2,chapter_index="第9章",open_lev=37,type=0},
 [110] = {id=110,award={{12,{{2,40},{10590,20},{1,60000}}},{24,{{2,60},{10590,30},{1,120000}}}},name="冰冠冰川",link_id=210,island_id=2,chapter_index="第10章",open_lev=41,type=0},
 [111] = {id=111,award={{12,{{2,40},{10590,20},{1,65000}}},{24,{{2,60},{10590,30},{1,130000}}}},name="萨隆米亚神庙",link_id=211,island_id=2,chapter_index="第11章",open_lev=45,type=0},
 [112] = {id=112,award={{12,{{2,40},{10590,20},{1,70000}}},{24,{{2,60},{10590,30},{1,140000}}}},name="特洛伊群岛",link_id=212,island_id=3,chapter_index="第12章",open_lev=45,type=0},
 [113] = {id=113,award={{12,{{2,40},{10590,20},{1,75000}}},{24,{{2,60},{10590,30},{1,150000}}}},name="亚特兰提斯城",link_id=213,island_id=3,chapter_index="第13章",open_lev=49,type=0},
 [114] = {id=114,award={{12,{{2,40},{10590,20},{1,80000}}},{24,{{2,60},{10590,30},{1,160000}}}},name="努曼诺尔神庙",link_id=214,island_id=3,chapter_index="第14章",open_lev=49,type=0},
 [115] = {id=115,award={{12,{{2,40},{10590,20},{1,85000}}},{24,{{2,60},{10590,30},{1,170000}}}},name="奥林匹斯山脉",link_id=215,island_id=3,chapter_index="第15章",open_lev=54,type=0},
 [116] = {id=116,award={{12,{{2,40},{10590,20},{1,90000}}},{24,{{2,60},{10590,30},{1,180000}}}},name="极乐净土",link_id=216,island_id=3,chapter_index="第16章",open_lev=54,type=0},
 [117] = {id=117,award={{12,{{2,40},{10590,20},{1,95000}}},{24,{{2,60},{10590,30},{1,190000}}}},name="炼狱祭坛",link_id=217,island_id=4,chapter_index="第17章",open_lev=60,type=0},
 [118] = {id=118,award={{12,{{2,40},{10590,20},{1,100000}}},{24,{{2,60},{10590,30},{1,200000}}}},name="死亡沼泽",link_id=218,island_id=4,chapter_index="第18章",open_lev=62,type=0},
 [119] = {id=119,award={{12,{{2,40},{10590,20},{1,105000}}},{24,{{2,60},{10590,30},{1,210000}}}},name="囚禁之岛",link_id=219,island_id=4,chapter_index="第19章",open_lev=64,type=0},
 [120] = {id=120,award={{12,{{2,40},{10590,20},{1,110000}}},{24,{{2,60},{10590,30},{1,220000}}}},name="坎特鲁",link_id=220,island_id=4,chapter_index="第20章",open_lev=66,type=0},
 [121] = {id=121,award={{12,{{2,40},{10590,20},{1,115000}}},{24,{{2,60},{10590,30},{1,230000}}}},name="幻术之地",link_id=221,island_id=4,chapter_index="第21章",open_lev=68,type=0},
 [201] = {id=201,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="地穴入口",link_id=101,island_id=1,chapter_index="第1章",open_lev=1,type=1},
 [202] = {id=202,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="神庙废墟",link_id=102,island_id=1,chapter_index="第2章",open_lev=1,type=1},
 [203] = {id=203,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="地心峡谷",link_id=103,island_id=1,chapter_index="第3章",open_lev=1,type=1},
 [204] = {id=204,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="龙之巢穴",link_id=104,island_id=1,chapter_index="第4章",open_lev=17,type=1},
 [205] = {id=205,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="宫殿禁地",link_id=105,island_id=1,chapter_index="第5章",open_lev=21,type=1},
 [206] = {id=206,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="恶魔囚笼",link_id=106,island_id=1,chapter_index="第6章",open_lev=25,type=1},
 [207] = {id=207,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="龙鸣之地",link_id=107,island_id=2,chapter_index="第7章",open_lev=29,type=1},
 [208] = {id=208,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="地下陵墓",link_id=108,island_id=2,chapter_index="第8章",open_lev=33,type=1},
 [209] = {id=209,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="炼狱熔炉",link_id=109,island_id=2,chapter_index="第9章",open_lev=37,type=1},
 [210] = {id=210,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="烈焰峡谷",link_id=110,island_id=2,chapter_index="第10章",open_lev=41,type=1},
 [211] = {id=211,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="幽冥神庙",link_id=111,island_id=2,chapter_index="第11章",open_lev=45,type=1},
 [212] = {id=212,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="地心熔岩",link_id=112,island_id=3,chapter_index="第12章",open_lev=45,type=1},
 [213] = {id=213,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="红龙陵墓",link_id=113,island_id=3,chapter_index="第13章",open_lev=49,type=1},
 [214] = {id=214,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="破败神庙",link_id=114,island_id=3,chapter_index="第14章",open_lev=49,type=1},
 [215] = {id=215,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="阴森宫殿",link_id=115,island_id=3,chapter_index="第15章",open_lev=54,type=1},
 [216] = {id=216,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="龙骸禁地",link_id=116,island_id=3,chapter_index="第16章",open_lev=54,type=1},
 [217] = {id=217,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="陨落祭坛",link_id=117,island_id=4,chapter_index="第17章",open_lev=60,type=1},
 [218] = {id=218,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="勇者峡谷",link_id=118,island_id=4,chapter_index="第18章",open_lev=62,type=1},
 [219] = {id=219,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="神址遗迹",link_id=120,island_id=4,chapter_index="第19章",open_lev=64,type=1},
 [220] = {id=220,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="炼狱神殿",link_id=121,island_id=4,chapter_index="第20章",open_lev=66,type=1},
 [221] = {id=221,award={{15,{{2,100},{10213,1},{1,80000},{10200,5}}}},name="魔瞳幻境",link_id=122,island_id=4,chapter_index="第21章",open_lev=68,type=1}
}
Config.DunChapterData.data_chapter_list_fun = function(key)
    local data =Config.DunChapterData.data_chapter_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunChapterData.data_chapter_list['..key..'])not found') return
    end
    return data
end
---------------------data_chapter_list end--------------------
---------------------data_dungeon_list start--------------------
Config.DunChapterData.data_dungeon_list_length = 42
Config.DunChapterData.data_dungeon_list = {
 [101] = {
    [10101]={id=10101,award_show={{10300,1},{10650,1},{3,60}},name="2021/1/1",next_id=10102,show_icon=26049,partner_num=2,map_pos=11,map_model_tag=0,map_id=10001,chapter_id=101,show_model="H30025",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1},{10800,1}},unit_id=22000},
    [10102]={id=10102,award_show={{10300,1},{10750,1},{3,60}},name="2021/1/2",next_id=10103,show_icon=26030,partner_num=2,map_pos=12,map_model_tag=0,map_id=10001,chapter_id=101,show_model="H30008",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1},{10700,1}},unit_id=22005},
    [10103]={id=10103,award_show={{10300,1},{10590,1},{3,60}},name="2021/1/3",next_id=10104,show_icon=26003,partner_num=2,map_pos=13,map_model_tag=0,map_id=10001,chapter_id=101,show_model="H30067",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22020},
    [10104]={id=10104,award_show={{10300,1},{10700,1},{3,60}},name="2021/1/4",next_id=10105,show_icon=26000,partner_num=2,map_pos=14,map_model_tag=0,map_id=10001,chapter_id=101,show_model="H30003",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22025},
    [10105]={id=10105,award_show={{10300,1},{10590,1},{3,60}},name="2021/1/5",next_id=10106,show_icon=26033,partner_num=3,map_pos=15,map_model_tag=0,map_id=10001,chapter_id=101,show_model="H30034",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22030},
    [10106]={id=10106,award_show={{10300,1},{10800,1},{3,60}},name="2021/1/6",next_id=10201,show_icon=26025,partner_num=3,map_pos=16,map_model_tag=1,map_id=10001,chapter_id=101,show_model="H30057",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22035}},
 [102] = {
    [10201]={id=10201,award_show={{10300,1},{10590,1},{3,60}},name="2021/2/1",next_id=10202,show_icon=26052,partner_num=3,map_pos=1,map_model_tag=0,map_id=10002,chapter_id=102,show_model="H30030",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22040},
    [10202]={id=10202,award_show={{10300,1},{10651,1},{3,60}},name="2021/2/2",next_id=10203,show_icon=26001,partner_num=3,map_pos=2,map_model_tag=0,map_id=10002,chapter_id=102,show_model="H30010",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22045},
    [10203]={id=10203,award_show={{10300,1},{10590,1},{3,60}},name="2021/2/3",next_id=10204,show_icon=26004,partner_num=3,map_pos=3,map_model_tag=0,map_id=10002,chapter_id=102,show_model="H30045",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22050},
    [10204]={id=10204,award_show={{10300,1},{10801,1},{3,60}},name="2021/2/4",next_id=10205,show_icon=26059,partner_num=3,map_pos=4,map_model_tag=1,map_id=10002,chapter_id=102,show_model="H30058",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22055},
    [10205]={id=10205,award_show={{10300,1},{10590,1},{3,60}},name="2021/2/5",next_id=10206,show_icon=26052,partner_num=3,map_pos=5,map_model_tag=0,map_id=10002,chapter_id=102,show_model="H30030",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22060},
    [10206]={id=10206,award_show={{10300,1},{10751,1},{3,60}},name="2021/2/6",next_id=10207,show_icon=26005,partner_num=3,map_pos=6,map_model_tag=0,map_id=10002,chapter_id=102,show_model="H30006",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22065},
    [10207]={id=10207,award_show={{10300,1},{10590,1},{3,60}},name="2021/2/7",next_id=10208,show_icon=26045,partner_num=3,map_pos=7,map_model_tag=0,map_id=10002,chapter_id=102,show_model="H30069",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22070},
    [10208]={id=10208,award_show={{10300,1},{10701,1},{3,60}},name="2021/2/8",next_id=10301,show_icon=26038,partner_num=3,map_pos=8,map_model_tag=1,map_id=10002,chapter_id=102,show_model="H30007",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22075}},
 [103] = {
    [10301]={id=10301,award_show={{10300,1},{10590,1},{3,60}},name="2021/3/1",next_id=10302,show_icon=26043,partner_num=4,map_pos=1,map_model_tag=0,map_id=10004,chapter_id=103,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22080},
    [10302]={id=10302,award_show={{10300,1},{10652,1},{3,60}},name="2021/3/2",next_id=10303,show_icon=26026,partner_num=4,map_pos=2,map_model_tag=0,map_id=10004,chapter_id=103,show_model="H30020",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22085},
    [10303]={id=10303,award_show={{10300,1},{10590,1},{3,60}},name="2021/3/3",next_id=10304,show_icon=26043,partner_num=4,map_pos=3,map_model_tag=0,map_id=10004,chapter_id=103,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22090},
    [10304]={id=10304,award_show={{10300,1},{10802,1},{3,60}},name="2021/3/4",next_id=10305,show_icon=26027,partner_num=4,map_pos=4,map_model_tag=1,map_id=10004,chapter_id=103,show_model="H30004",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22095},
    [10305]={id=10305,award_show={{10300,1},{10590,1},{3,60}},name="2021/3/5",next_id=10306,show_icon=26037,partner_num=4,map_pos=5,map_model_tag=0,map_id=10004,chapter_id=103,show_model="H30036",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22100},
    [10306]={id=10306,award_show={{10300,1},{10752,1},{3,60}},name="2021/3/6",next_id=10307,show_icon=26056,partner_num=4,map_pos=6,map_model_tag=0,map_id=10004,chapter_id=103,show_model="H30061",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22105},
    [10307]={id=10307,award_show={{10300,1},{10590,1},{3,60}},name="2021/3/7",next_id=10308,show_icon=26029,partner_num=4,map_pos=7,map_model_tag=0,map_id=10004,chapter_id=103,show_model="H30002",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22110},
    [10308]={id=10308,award_show={{10300,1},{10702,1},{3,60}},name="2021/3/8",next_id=10401,show_icon=26040,partner_num=4,map_pos=8,map_model_tag=1,map_id=10004,chapter_id=103,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22115}},
 [104] = {
    [10401]={id=10401,award_show={{10300,1},{10590,1},{3,60}},name="2021/4/1",next_id=10402,show_icon=26032,partner_num=5,map_pos=1,map_model_tag=0,map_id=10005,chapter_id=104,show_model="H30039",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22120},
    [10402]={id=10402,award_show={{10300,1},{10653,1},{3,60}},name="2021/4/2",next_id=10403,show_icon=26007,partner_num=5,map_pos=2,map_model_tag=0,map_id=10005,chapter_id=104,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22125},
    [10403]={id=10403,award_show={{10300,1},{10590,1},{3,60}},name="2021/4/3",next_id=10404,show_icon=26040,partner_num=5,map_pos=3,map_model_tag=0,map_id=10005,chapter_id=104,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22130},
    [10404]={id=10404,award_show={{10300,1},{10803,1},{3,60}},name="2021/4/4",next_id=10405,show_icon=26027,partner_num=5,map_pos=4,map_model_tag=1,map_id=10005,chapter_id=104,show_model="H30004",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22135},
    [10405]={id=10405,award_show={{10300,1},{10590,1},{3,60}},name="2021/4/5",next_id=10406,show_icon=26032,partner_num=5,map_pos=5,map_model_tag=0,map_id=10005,chapter_id=104,show_model="H30039",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22140},
    [10406]={id=10406,award_show={{10300,1},{10753,1},{3,60}},name="2021/4/6",next_id=10407,show_icon=26021,partner_num=5,map_pos=6,map_model_tag=0,map_id=10005,chapter_id=104,show_model="H30021",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22145},
    [10407]={id=10407,award_show={{10300,1},{10590,1},{3,60}},name="2021/4/7",next_id=10408,show_icon=26005,partner_num=5,map_pos=7,map_model_tag=0,map_id=10005,chapter_id=104,show_model="H30006",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22150},
    [10408]={id=10408,award_show={{10300,1},{10703,1},{3,60}},name="2021/4/8",next_id=10501,show_icon=26061,partner_num=5,map_pos=8,map_model_tag=1,map_id=10005,chapter_id=104,show_model="H30016",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22155}},
 [105] = {
    [10501]={id=10501,award_show={{10300,1},{10590,1},{3,60}},name="2021/5/1",next_id=10502,show_icon=26051,partner_num=5,map_pos=1,map_model_tag=0,map_id=10003,chapter_id=105,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22160},
    [10502]={id=10502,award_show={{10300,1},{10654,1},{3,60}},name="2021/5/2",next_id=10503,show_icon=26028,partner_num=5,map_pos=2,map_model_tag=0,map_id=10003,chapter_id=105,show_model="H30053",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22165},
    [10503]={id=10503,award_show={{10300,1},{10590,1},{3,60}},name="2021/5/3",next_id=10504,show_icon=26042,partner_num=5,map_pos=3,map_model_tag=0,map_id=10003,chapter_id=105,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22170},
    [10504]={id=10504,award_show={{10300,1},{10804,1},{3,60}},name="2021/5/4",next_id=10505,show_icon=26015,partner_num=5,map_pos=4,map_model_tag=1,map_id=10003,chapter_id=105,show_model="H30040",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22175},
    [10505]={id=10505,award_show={{10300,1},{10590,1},{3,60}},name="2021/5/5",next_id=10506,show_icon=26006,partner_num=5,map_pos=5,map_model_tag=0,map_id=10003,chapter_id=105,show_model="H30029",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22180},
    [10506]={id=10506,award_show={{10300,1},{10754,1},{3,60}},name="2021/5/6",next_id=10507,show_icon=26019,partner_num=5,map_pos=6,map_model_tag=0,map_id=10003,chapter_id=105,show_model="H30041",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22185},
    [10507]={id=10507,award_show={{10300,1},{10590,1},{3,60}},name="2021/5/7",next_id=10508,show_icon=26042,partner_num=5,map_pos=7,map_model_tag=0,map_id=10003,chapter_id=105,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22190},
    [10508]={id=10508,award_show={{10300,1},{10704,1},{3,60}},name="2021/5/8",next_id=10601,show_icon=26053,partner_num=5,map_pos=8,map_model_tag=1,map_id=10003,chapter_id=105,show_model="H30054",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22195}},
 [106] = {
    [10601]={id=10601,award_show={{10300,1},{10590,1},{3,60}},name="2021/6/1",next_id=10602,show_icon=26049,partner_num=5,map_pos=1,map_model_tag=0,map_id=10001,chapter_id=106,show_model="H30025",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22200},
    [10602]={id=10602,award_show={{10300,1},{10655,1},{3,60}},name="2021/6/2",next_id=10603,show_icon=26000,partner_num=5,map_pos=2,map_model_tag=0,map_id=10001,chapter_id=106,show_model="H30003",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22205},
    [10603]={id=10603,award_show={{10300,1},{10590,1},{3,60}},name="2021/6/3",next_id=10604,show_icon=26011,partner_num=5,map_pos=3,map_model_tag=0,map_id=10001,chapter_id=106,show_model="H30068",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22210},
    [10604]={id=10604,award_show={{10300,1},{10805,1},{3,60}},name="2021/6/4",next_id=10605,show_icon=26003,partner_num=5,map_pos=4,map_model_tag=1,map_id=10001,chapter_id=106,show_model="H30067",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22215},
    [10605]={id=10605,award_show={{10300,1},{10590,1},{3,60}},name="2021/6/5",next_id=10606,show_icon=26004,partner_num=5,map_pos=5,map_model_tag=0,map_id=10001,chapter_id=106,show_model="H30045",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22220},
    [10606]={id=10606,award_show={{10300,1},{10755,1},{3,60}},name="2021/6/6",next_id=10607,show_icon=26007,partner_num=5,map_pos=6,map_model_tag=0,map_id=10001,chapter_id=106,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22225},
    [10607]={id=10607,award_show={{10300,1},{10590,1},{3,60}},name="2021/6/7",next_id=10608,show_icon=26025,partner_num=5,map_pos=7,map_model_tag=0,map_id=10001,chapter_id=106,show_model="H30057",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22230},
    [10608]={id=10608,award_show={{10300,1},{10705,1},{3,60}},name="2021/6/8",next_id=10701,show_icon=26055,partner_num=5,map_pos=8,map_model_tag=1,map_id=10001,chapter_id=106,show_model="H30051",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22235}},
 [107] = {
    [10701]={id=10701,award_show={{10300,1},{10590,1},{3,60}},name="2021/7/1",next_id=10702,show_icon=26026,partner_num=5,map_pos=1,map_model_tag=0,map_id=10002,chapter_id=107,show_model="H30020",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22240},
    [10702]={id=10702,award_show={{10300,1},{10656,1},{3,60}},name="2021/7/2",next_id=10703,show_icon=26010,partner_num=5,map_pos=2,map_model_tag=0,map_id=10002,chapter_id=107,show_model="H30071",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22245},
    [10703]={id=10703,award_show={{10300,1},{10590,1},{3,60}},name="2021/7/3",next_id=10704,show_icon=26031,partner_num=5,map_pos=3,map_model_tag=0,map_id=10002,chapter_id=107,show_model="H30015",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22250},
    [10704]={id=10704,award_show={{10300,1},{10806,1},{3,60}},name="2021/7/4",next_id=10705,show_icon=26059,partner_num=5,map_pos=4,map_model_tag=1,map_id=10002,chapter_id=107,show_model="H30058",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22255},
    [10705]={id=10705,award_show={{10300,1},{10590,1},{3,60}},name="2021/7/5",next_id=10706,show_icon=26007,partner_num=5,map_pos=5,map_model_tag=0,map_id=10002,chapter_id=107,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22260},
    [10706]={id=10706,award_show={{10300,1},{10756,1},{3,60}},name="2021/7/6",next_id=10707,show_icon=26060,partner_num=5,map_pos=6,map_model_tag=0,map_id=10002,chapter_id=107,show_model="H30063",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22265},
    [10707]={id=10707,award_show={{10300,1},{10590,1},{3,60}},name="2021/7/7",next_id=10708,show_icon=26020,partner_num=5,map_pos=7,map_model_tag=0,map_id=10002,chapter_id=107,show_model="H30050",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22270},
    [10708]={id=10708,award_show={{10300,1},{10706,1},{3,60}},name="2021/7/8",next_id=10801,show_icon=26014,partner_num=5,map_pos=8,map_model_tag=1,map_id=10002,chapter_id=107,show_model="H30065",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22275}},
 [108] = {
    [10801]={id=10801,award_show={{10300,1},{10590,1},{3,60}},name="2021/8/1",next_id=10802,show_icon=26004,partner_num=5,map_pos=1,map_model_tag=0,map_id=10001,chapter_id=108,show_model="H30045",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22280},
    [10802]={id=10802,award_show={{10300,1},{10657,1},{3,60}},name="2021/8/2",next_id=10803,show_icon=26007,partner_num=5,map_pos=2,map_model_tag=0,map_id=10001,chapter_id=108,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22285},
    [10803]={id=10803,award_show={{10300,1},{10590,1},{3,60}},name="2021/8/3",next_id=10804,show_icon=26005,partner_num=5,map_pos=3,map_model_tag=0,map_id=10001,chapter_id=108,show_model="H30006",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22290},
    [10804]={id=10804,award_show={{10300,1},{10807,1},{3,60}},name="2021/8/4",next_id=10805,show_icon=26000,partner_num=5,map_pos=4,map_model_tag=1,map_id=10001,chapter_id=108,show_model="H30003",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22295},
    [10805]={id=10805,award_show={{10300,1},{10590,1},{3,60}},name="2021/8/5",next_id=10806,show_icon=26041,partner_num=5,map_pos=5,map_model_tag=0,map_id=10001,chapter_id=108,show_model="H30013",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22300},
    [10806]={id=10806,award_show={{10300,1},{10757,1},{3,60}},name="2021/8/6",next_id=10807,show_icon=26025,partner_num=5,map_pos=6,map_model_tag=0,map_id=10001,chapter_id=108,show_model="H30057",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22305},
    [10807]={id=10807,award_show={{10300,1},{10590,1},{3,60}},name="2021/8/7",next_id=10808,show_icon=26007,partner_num=5,map_pos=7,map_model_tag=0,map_id=10001,chapter_id=108,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22310},
    [10808]={id=10808,award_show={{10300,1},{10707,1},{3,60}},name="2021/8/8",next_id=10901,show_icon=26055,partner_num=5,map_pos=8,map_model_tag=1,map_id=10001,chapter_id=108,show_model="H30051",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22315}},
 [109] = {
    [10901]={id=10901,award_show={{10300,1},{10590,1},{3,60}},name="2021/9/1",next_id=10902,show_icon=26043,partner_num=5,map_pos=1,map_model_tag=0,map_id=10004,chapter_id=109,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22320},
    [10902]={id=10902,award_show={{10300,1},{10658,1},{3,60}},name="2021/9/2",next_id=10903,show_icon=26026,partner_num=5,map_pos=2,map_model_tag=0,map_id=10004,chapter_id=109,show_model="H30020",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22325},
    [10903]={id=10903,award_show={{10300,1},{10590,1},{3,60}},name="2021/9/3",next_id=10904,show_icon=26039,partner_num=5,map_pos=3,map_model_tag=0,map_id=10004,chapter_id=109,show_model="H30037",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22330},
    [10904]={id=10904,award_show={{10300,1},{10808,1},{3,60}},name="2021/9/4",next_id=10905,show_icon=26040,partner_num=5,map_pos=4,map_model_tag=1,map_id=10004,chapter_id=109,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22335},
    [10905]={id=10905,award_show={{10300,1},{10590,1},{3,60}},name="2021/9/5",next_id=10906,show_icon=26020,partner_num=5,map_pos=5,map_model_tag=0,map_id=10004,chapter_id=109,show_model="H30050",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22340},
    [10906]={id=10906,award_show={{10300,1},{10758,1},{3,60}},name="2021/9/6",next_id=10907,show_icon=26027,partner_num=5,map_pos=6,map_model_tag=0,map_id=10004,chapter_id=109,show_model="H30004",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22345},
    [10907]={id=10907,award_show={{10300,1},{10590,1},{3,60}},name="2021/9/7",next_id=10908,show_icon=26024,partner_num=5,map_pos=7,map_model_tag=0,map_id=10004,chapter_id=109,show_model="H30056",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22350},
    [10908]={id=10908,award_show={{10300,1},{10708,1},{3,60}},name="2021/9/8",next_id=11001,show_icon=26061,partner_num=5,map_pos=8,map_model_tag=1,map_id=10004,chapter_id=109,show_model="H30016",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22355}},
 [110] = {
    [11001]={id=11001,award_show={{10300,1},{10590,1},{3,60}},name="2021/10/1",next_id=11002,show_icon=26007,partner_num=5,map_pos=1,map_model_tag=0,map_id=10005,chapter_id=110,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22360},
    [11002]={id=11002,award_show={{10300,1},{10659,1},{3,60}},name="2021/10/2",next_id=11003,show_icon=26029,partner_num=5,map_pos=2,map_model_tag=0,map_id=10005,chapter_id=110,show_model="H30002",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22365},
    [11003]={id=11003,award_show={{10300,1},{10590,1},{3,60}},name="2021/10/3",next_id=11004,show_icon=26040,partner_num=5,map_pos=3,map_model_tag=0,map_id=10005,chapter_id=110,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22370},
    [11004]={id=11004,award_show={{10300,1},{10809,1},{3,60}},name="2021/10/4",next_id=11005,show_icon=26021,partner_num=5,map_pos=4,map_model_tag=1,map_id=10005,chapter_id=110,show_model="H30021",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22375},
    [11005]={id=11005,award_show={{10300,1},{10590,1},{3,60}},name="2021/10/5",next_id=11006,show_icon=26043,partner_num=5,map_pos=5,map_model_tag=0,map_id=10005,chapter_id=110,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22380},
    [11006]={id=11006,award_show={{10300,1},{10759,1},{3,60}},name="2021/10/6",next_id=11007,show_icon=26061,partner_num=5,map_pos=6,map_model_tag=0,map_id=10005,chapter_id=110,show_model="H30016",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22385},
    [11007]={id=11007,award_show={{10300,1},{10590,1},{3,60}},name="2021/10/7",next_id=11008,show_icon=26006,partner_num=5,map_pos=7,map_model_tag=0,map_id=10005,chapter_id=110,show_model="H30029",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22390},
    [11008]={id=11008,award_show={{10300,1},{10709,1},{3,60}},name="2021/10/8",next_id=11101,show_icon=26054,partner_num=5,map_pos=8,map_model_tag=1,map_id=10005,chapter_id=110,show_model="H30072",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22395}},
 [111] = {
    [11101]={id=11101,award_show={{10300,1},{10590,1},{3,60}},name="2021/11/1",next_id=11102,show_icon=26019,partner_num=5,map_pos=1,map_model_tag=0,map_id=10003,chapter_id=111,show_model="H30041",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22400},
    [11102]={id=11102,award_show={{10300,1},{10660,1},{3,60}},name="2021/11/2",next_id=11103,show_icon=26013,partner_num=5,map_pos=2,map_model_tag=0,map_id=10003,chapter_id=111,show_model="H30060",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22405},
    [11103]={id=11103,award_show={{10300,1},{10590,1},{3,60}},name="2021/11/3",next_id=11104,show_icon=26025,partner_num=5,map_pos=3,map_model_tag=0,map_id=10003,chapter_id=111,show_model="H30057",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22410},
    [11104]={id=11104,award_show={{10300,1},{10810,1},{3,60}},name="2021/11/4",next_id=11105,show_icon=26060,partner_num=5,map_pos=4,map_model_tag=1,map_id=10003,chapter_id=111,show_model="H30063",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22415},
    [11105]={id=11105,award_show={{10300,1},{10590,1},{3,60}},name="2021/11/5",next_id=11106,show_icon=26038,partner_num=5,map_pos=5,map_model_tag=0,map_id=10003,chapter_id=111,show_model="H30007",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22420},
    [11106]={id=11106,award_show={{10300,1},{10760,1},{3,60}},name="2021/11/6",next_id=11107,show_icon=26053,partner_num=5,map_pos=6,map_model_tag=0,map_id=10003,chapter_id=111,show_model="H30054",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22425},
    [11107]={id=11107,award_show={{10300,1},{10590,1},{3,60}},name="2021/11/7",next_id=11108,show_icon=26001,partner_num=5,map_pos=7,map_model_tag=0,map_id=10003,chapter_id=111,show_model="H30010",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22430},
    [11108]={id=11108,award_show={{10300,1},{10710,1},{3,60}},name="2021/11/8",next_id=11201,show_icon=26057,partner_num=5,map_pos=8,map_model_tag=1,map_id=10003,chapter_id=111,show_model="H30059",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22435}},
 [112] = {
    [11201]={id=11201,award_show={{10301,1},{10590,1},{3,60}},name="2021/12/1",next_id=11202,show_icon=26028,partner_num=5,map_pos=1,map_model_tag=0,map_id=10001,chapter_id=112,show_model="H30053",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22440},
    [11202]={id=11202,award_show={{10301,1},{10660,1},{3,60}},name="2021/12/2",next_id=11203,show_icon=26031,partner_num=5,map_pos=2,map_model_tag=0,map_id=10001,chapter_id=112,show_model="H30015",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22445},
    [11203]={id=11203,award_show={{10301,1},{10590,1},{3,60}},name="2021/12/3",next_id=11204,show_icon=26005,partner_num=5,map_pos=3,map_model_tag=0,map_id=10001,chapter_id=112,show_model="H30006",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22450},
    [11204]={id=11204,award_show={{10301,1},{10810,1},{3,60}},name="2021/12/4",next_id=11205,show_icon=26019,partner_num=5,map_pos=4,map_model_tag=1,map_id=10001,chapter_id=112,show_model="H30041",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22455},
    [11205]={id=11205,award_show={{10301,1},{10590,1},{3,60}},name="2021/12/5",next_id=11206,show_icon=26009,partner_num=5,map_pos=5,map_model_tag=0,map_id=10001,chapter_id=112,show_model="H30042",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22460},
    [11206]={id=11206,award_show={{10301,1},{10760,1},{3,60}},name="2021/12/6",next_id=11207,show_icon=26012,partner_num=5,map_pos=6,map_model_tag=0,map_id=10001,chapter_id=112,show_model="H30027",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22465},
    [11207]={id=11207,award_show={{10301,1},{10590,1},{3,60}},name="2021/12/7",next_id=11208,show_icon=26032,partner_num=5,map_pos=7,map_model_tag=0,map_id=10001,chapter_id=112,show_model="H30039",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22470},
    [11208]={id=11208,award_show={{10301,1},{10710,1},{3,60}},name="2021/12/8",next_id=11301,show_icon=26010,partner_num=5,map_pos=8,map_model_tag=1,map_id=10001,chapter_id=112,show_model="H30071",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22475}},
 [113] = {
    [11301]={id=11301,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/13",next_id=11302,show_icon=26003,partner_num=5,map_pos=1,map_model_tag=0,map_id=10002,chapter_id=113,show_model="H30067",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22480},
    [11302]={id=11302,award_show={{10301,1},{10661,1},{3,60}},name="2021/2/13",next_id=11303,show_icon=26000,partner_num=5,map_pos=2,map_model_tag=0,map_id=10002,chapter_id=113,show_model="H30003",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22485},
    [11303]={id=11303,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/13",next_id=11304,show_icon=26007,partner_num=5,map_pos=3,map_model_tag=0,map_id=10002,chapter_id=113,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22490},
    [11304]={id=11304,award_show={{10301,1},{10811,1},{3,60}},name="2021/4/13",next_id=11305,show_icon=26024,partner_num=5,map_pos=4,map_model_tag=1,map_id=10002,chapter_id=113,show_model="H30056",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22495},
    [11305]={id=11305,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/13",next_id=11306,show_icon=26043,partner_num=5,map_pos=5,map_model_tag=0,map_id=10002,chapter_id=113,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22500},
    [11306]={id=11306,award_show={{10301,1},{10761,1},{3,60}},name="2021/6/13",next_id=11307,show_icon=26022,partner_num=5,map_pos=6,map_model_tag=0,map_id=10002,chapter_id=113,show_model="H30019",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22505},
    [11307]={id=11307,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/13",next_id=11308,show_icon=26040,partner_num=5,map_pos=7,map_model_tag=0,map_id=10002,chapter_id=113,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22510},
    [11308]={id=11308,award_show={{10301,1},{10711,1},{3,60}},name="2021/8/13",next_id=11401,show_icon=26020,partner_num=5,map_pos=8,map_model_tag=1,map_id=10002,chapter_id=113,show_model="H30050",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22515}},
 [114] = {
    [11401]={id=11401,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/14",next_id=11402,show_icon=26028,partner_num=5,map_pos=1,map_model_tag=0,map_id=10003,chapter_id=114,show_model="H30053",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22520},
    [11402]={id=11402,award_show={{10301,1},{10661,1},{3,60}},name="2021/2/14",next_id=11403,show_icon=26060,partner_num=5,map_pos=2,map_model_tag=0,map_id=10003,chapter_id=114,show_model="H30063",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22525},
    [11403]={id=11403,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/14",next_id=11404,show_icon=26018,partner_num=5,map_pos=3,map_model_tag=0,map_id=10003,chapter_id=114,show_model="H30062",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22530},
    [11404]={id=11404,award_show={{10301,1},{10811,1},{3,60}},name="2021/4/14",next_id=11405,show_icon=26013,partner_num=5,map_pos=4,map_model_tag=1,map_id=10003,chapter_id=114,show_model="H30060",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22535},
    [11405]={id=11405,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/14",next_id=11406,show_icon=26047,partner_num=5,map_pos=5,map_model_tag=0,map_id=10003,chapter_id=114,show_model="H30073",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22540},
    [11406]={id=11406,award_show={{10301,1},{10761,1},{3,60}},name="2021/6/14",next_id=11407,show_icon=26054,partner_num=5,map_pos=6,map_model_tag=0,map_id=10003,chapter_id=114,show_model="H30072",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22545},
    [11407]={id=11407,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/14",next_id=11408,show_icon=26010,partner_num=5,map_pos=7,map_model_tag=0,map_id=10003,chapter_id=114,show_model="H30071",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22550},
    [11408]={id=11408,award_show={{10301,1},{10711,1},{3,60}},name="2021/8/14",next_id=11501,show_icon=26015,partner_num=5,map_pos=8,map_model_tag=1,map_id=10003,chapter_id=114,show_model="H30040",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22555}},
 [115] = {
    [11501]={id=11501,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/15",next_id=11502,show_icon=26042,partner_num=5,map_pos=1,map_model_tag=0,map_id=10004,chapter_id=115,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22560},
    [11502]={id=11502,award_show={{10301,1},{10662,1},{3,60}},name="2021/2/15",next_id=11503,show_icon=26036,partner_num=5,map_pos=2,map_model_tag=0,map_id=10004,chapter_id=115,show_model="H30055",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22565},
    [11503]={id=11503,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/15",next_id=11504,show_icon=26039,partner_num=5,map_pos=3,map_model_tag=0,map_id=10004,chapter_id=115,show_model="H30037",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22570},
    [11504]={id=11504,award_show={{10301,1},{10812,1},{3,60}},name="2021/4/15",next_id=11505,show_icon=26044,partner_num=5,map_pos=4,map_model_tag=1,map_id=10004,chapter_id=115,show_model="H30009",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22575},
    [11505]={id=11505,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/15",next_id=11506,show_icon=26040,partner_num=5,map_pos=5,map_model_tag=0,map_id=10004,chapter_id=115,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22580},
    [11506]={id=11506,award_show={{10301,1},{10762,1},{3,60}},name="2021/6/15",next_id=11507,show_icon=26043,partner_num=5,map_pos=6,map_model_tag=0,map_id=10004,chapter_id=115,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22585},
    [11507]={id=11507,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/15",next_id=11508,show_icon=26030,partner_num=5,map_pos=7,map_model_tag=0,map_id=10004,chapter_id=115,show_model="H30008",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22590},
    [11508]={id=11508,award_show={{10301,1},{10712,1},{3,60}},name="2021/8/15",next_id=11601,show_icon=26049,partner_num=5,map_pos=8,map_model_tag=1,map_id=10004,chapter_id=115,show_model="H30025",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22595}},
 [116] = {
    [11601]={id=11601,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/16",next_id=11602,show_icon=26051,partner_num=5,map_pos=1,map_model_tag=0,map_id=10003,chapter_id=116,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22600},
    [11602]={id=11602,award_show={{10301,1},{10662,1},{3,60}},name="2021/2/16",next_id=11603,show_icon=26048,partner_num=5,map_pos=2,map_model_tag=0,map_id=10003,chapter_id=116,show_model="H30012",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22605},
    [11603]={id=11603,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/16",next_id=11604,show_icon=26043,partner_num=5,map_pos=3,map_model_tag=0,map_id=10003,chapter_id=116,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22610},
    [11604]={id=11604,award_show={{10301,1},{10812,1},{3,60}},name="2021/4/16",next_id=11605,show_icon=26038,partner_num=5,map_pos=4,map_model_tag=1,map_id=10003,chapter_id=116,show_model="H30007",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22615},
    [11605]={id=11605,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/16",next_id=11606,show_icon=26048,partner_num=5,map_pos=5,map_model_tag=0,map_id=10003,chapter_id=116,show_model="H30012",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22620},
    [11606]={id=11606,award_show={{10301,1},{10762,1},{3,60}},name="2021/6/16",next_id=11607,show_icon=26051,partner_num=5,map_pos=6,map_model_tag=0,map_id=10003,chapter_id=116,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22625},
    [11607]={id=11607,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/16",next_id=11608,show_icon=26051,partner_num=5,map_pos=7,map_model_tag=0,map_id=10003,chapter_id=116,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22630},
    [11608]={id=11608,award_show={{10301,1},{10712,1},{3,60}},name="2021/8/16",next_id=11701,show_icon=26036,partner_num=5,map_pos=8,map_model_tag=1,map_id=10003,chapter_id=116,show_model="H30055",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22635}},
 [117] = {
    [11701]={id=11701,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/17",next_id=11702,show_icon=26028,partner_num=5,map_pos=1,map_model_tag=0,map_id=10001,chapter_id=117,show_model="H30053",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22700},
    [11702]={id=11702,award_show={{10301,1},{10663,1},{3,60}},name="2021/2/17",next_id=11703,show_icon=26031,partner_num=5,map_pos=2,map_model_tag=0,map_id=10001,chapter_id=117,show_model="H30015",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22705},
    [11703]={id=11703,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/17",next_id=11704,show_icon=26005,partner_num=5,map_pos=3,map_model_tag=0,map_id=10001,chapter_id=117,show_model="H30006",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22710},
    [11704]={id=11704,award_show={{10301,1},{10813,1},{3,60}},name="2021/4/17",next_id=11705,show_icon=26019,partner_num=5,map_pos=4,map_model_tag=1,map_id=10001,chapter_id=117,show_model="H30041",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22715},
    [11705]={id=11705,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/17",next_id=11706,show_icon=26009,partner_num=5,map_pos=5,map_model_tag=0,map_id=10001,chapter_id=117,show_model="H30042",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22720},
    [11706]={id=11706,award_show={{10301,1},{10763,1},{3,60}},name="2021/6/17",next_id=11707,show_icon=26012,partner_num=5,map_pos=6,map_model_tag=0,map_id=10001,chapter_id=117,show_model="H30027",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22725},
    [11707]={id=11707,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/17",next_id=11708,show_icon=26032,partner_num=5,map_pos=7,map_model_tag=0,map_id=10001,chapter_id=117,show_model="H30039",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22730},
    [11708]={id=11708,award_show={{10301,1},{10713,1},{3,60}},name="2021/8/17",next_id=11801,show_icon=26010,partner_num=5,map_pos=8,map_model_tag=1,map_id=10001,chapter_id=117,show_model="H30071",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22735}},
 [118] = {
    [11801]={id=11801,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/18",next_id=11802,show_icon=26003,partner_num=5,map_pos=1,map_model_tag=0,map_id=10002,chapter_id=118,show_model="H30067",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22750},
    [11802]={id=11802,award_show={{10301,1},{10664,1},{3,60}},name="2021/2/18",next_id=11803,show_icon=26000,partner_num=5,map_pos=2,map_model_tag=0,map_id=10002,chapter_id=118,show_model="H30003",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22755},
    [11803]={id=11803,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/18",next_id=11804,show_icon=26007,partner_num=5,map_pos=3,map_model_tag=0,map_id=10002,chapter_id=118,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22760},
    [11804]={id=11804,award_show={{10301,1},{10814,1},{3,60}},name="2021/4/18",next_id=11805,show_icon=26024,partner_num=5,map_pos=4,map_model_tag=1,map_id=10002,chapter_id=118,show_model="H30056",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22765},
    [11805]={id=11805,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/18",next_id=11806,show_icon=26043,partner_num=5,map_pos=5,map_model_tag=0,map_id=10002,chapter_id=118,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22770},
    [11806]={id=11806,award_show={{10301,1},{10764,1},{3,60}},name="2021/6/18",next_id=11807,show_icon=26022,partner_num=5,map_pos=6,map_model_tag=0,map_id=10002,chapter_id=118,show_model="H30019",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22775},
    [11807]={id=11807,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/18",next_id=11808,show_icon=26040,partner_num=5,map_pos=7,map_model_tag=0,map_id=10002,chapter_id=118,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22780},
    [11808]={id=11808,award_show={{10301,1},{10714,1},{3,60}},name="2021/8/18",next_id=11901,show_icon=26020,partner_num=5,map_pos=8,map_model_tag=1,map_id=10002,chapter_id=118,show_model="H30050",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22785}},
 [119] = {
    [11901]={id=11901,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/19",next_id=11902,show_icon=26028,partner_num=5,map_pos=1,map_model_tag=0,map_id=10003,chapter_id=119,show_model="H30053",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22800},
    [11902]={id=11902,award_show={{10301,1},{10664,1},{3,60}},name="2021/2/19",next_id=11903,show_icon=26060,partner_num=5,map_pos=2,map_model_tag=0,map_id=10003,chapter_id=119,show_model="H30063",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22805},
    [11903]={id=11903,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/19",next_id=11904,show_icon=26018,partner_num=5,map_pos=3,map_model_tag=0,map_id=10003,chapter_id=119,show_model="H30062",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22810},
    [11904]={id=11904,award_show={{10301,1},{10814,1},{3,60}},name="2021/4/19",next_id=11905,show_icon=26013,partner_num=5,map_pos=4,map_model_tag=1,map_id=10003,chapter_id=119,show_model="H30060",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22815},
    [11905]={id=11905,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/19",next_id=11906,show_icon=26047,partner_num=5,map_pos=5,map_model_tag=0,map_id=10003,chapter_id=119,show_model="H30073",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22820},
    [11906]={id=11906,award_show={{10301,1},{10764,1},{3,60}},name="2021/6/19",next_id=11907,show_icon=26054,partner_num=5,map_pos=6,map_model_tag=0,map_id=10003,chapter_id=119,show_model="H30072",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22825},
    [11907]={id=11907,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/19",next_id=11908,show_icon=26010,partner_num=5,map_pos=7,map_model_tag=0,map_id=10003,chapter_id=119,show_model="H30071",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22830},
    [11908]={id=11908,award_show={{10301,1},{10714,1},{3,60}},name="2021/8/19",next_id=12001,show_icon=26015,partner_num=5,map_pos=8,map_model_tag=1,map_id=10003,chapter_id=119,show_model="H30040",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22835}},
 [120] = {
    [12001]={id=12001,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/20",next_id=12002,show_icon=26042,partner_num=5,map_pos=1,map_model_tag=0,map_id=10004,chapter_id=120,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22850},
    [12002]={id=12002,award_show={{10301,1},{10665,1},{3,60}},name="2021/2/20",next_id=12003,show_icon=26036,partner_num=5,map_pos=2,map_model_tag=0,map_id=10004,chapter_id=120,show_model="H30055",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22855},
    [12003]={id=12003,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/20",next_id=12004,show_icon=26039,partner_num=5,map_pos=3,map_model_tag=0,map_id=10004,chapter_id=120,show_model="H30037",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22860},
    [12004]={id=12004,award_show={{10301,1},{10815,1},{3,60}},name="2021/4/20",next_id=12005,show_icon=26044,partner_num=5,map_pos=4,map_model_tag=1,map_id=10004,chapter_id=120,show_model="H30009",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22865},
    [12005]={id=12005,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/20",next_id=12006,show_icon=26040,partner_num=5,map_pos=5,map_model_tag=0,map_id=10004,chapter_id=120,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22870},
    [12006]={id=12006,award_show={{10301,1},{10765,1},{3,60}},name="2021/6/20",next_id=12007,show_icon=26043,partner_num=5,map_pos=6,map_model_tag=0,map_id=10004,chapter_id=120,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22875},
    [12007]={id=12007,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/20",next_id=12008,show_icon=26030,partner_num=5,map_pos=7,map_model_tag=0,map_id=10004,chapter_id=120,show_model="H30008",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22880},
    [12008]={id=12008,award_show={{10301,1},{10715,1},{3,60}},name="2021/8/20",next_id=12101,show_icon=26049,partner_num=5,map_pos=8,map_model_tag=1,map_id=10004,chapter_id=120,show_model="H30025",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22885}},
 [121] = {
    [12101]={id=12101,award_show={{10301,1},{10590,1},{3,60}},name="2021/1/21",next_id=12102,show_icon=26051,partner_num=5,map_pos=1,map_model_tag=0,map_id=10003,chapter_id=121,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22900},
    [12102]={id=12102,award_show={{10301,1},{10665,1},{3,60}},name="2021/2/21",next_id=12103,show_icon=26048,partner_num=5,map_pos=2,map_model_tag=0,map_id=10003,chapter_id=121,show_model="H30012",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22905},
    [12103]={id=12103,award_show={{10301,1},{10590,1},{3,60}},name="2021/3/21",next_id=12104,show_icon=26043,partner_num=5,map_pos=3,map_model_tag=0,map_id=10003,chapter_id=121,show_model="H30028",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22910},
    [12104]={id=12104,award_show={{10301,1},{10815,1},{3,60}},name="2021/4/21",next_id=12105,show_icon=26038,partner_num=5,map_pos=4,map_model_tag=1,map_id=10003,chapter_id=121,show_model="H30007",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22915},
    [12105]={id=12105,award_show={{10301,1},{10590,1},{3,60}},name="2021/5/21",next_id=12106,show_icon=26048,partner_num=5,map_pos=5,map_model_tag=0,map_id=10003,chapter_id=121,show_model="H30012",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22920},
    [12106]={id=12106,award_show={{10301,1},{10765,1},{3,60}},name="2021/6/21",next_id=12107,show_icon=26051,partner_num=5,map_pos=6,map_model_tag=0,map_id=10003,chapter_id=121,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22925},
    [12107]={id=12107,award_show={{10301,1},{10590,1},{3,60}},name="2021/7/21",next_id=12108,show_icon=26051,partner_num=5,map_pos=7,map_model_tag=0,map_id=10003,chapter_id=121,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22930},
    [12108]={id=12108,award_show={{10301,1},{10715,1},{3,60}},name="2021/8/21",next_id=0,show_icon=26036,partner_num=5,map_pos=8,map_model_tag=1,map_id=10003,chapter_id=121,show_model="H30055",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=22935}},
 [201] = {
    [20101]={id=20101,award_show={{10600,1},{3,100}},name="2021/1/1",next_id=20102,show_icon=20071,partner_num=3,map_pos=1,map_model_tag=0,map_id=20001,chapter_id=201,show_model="H30009",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23000},
    [20102]={id=20102,award_show={{10600,1},{3,100}},name="2021/1/2",next_id=20103,show_icon=10600,partner_num=3,map_pos=2,map_model_tag=0,map_id=20001,chapter_id=201,show_model="H30009",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23005},
    [20103]={id=20103,award_show={{10600,1},{3,100}},name="2021/1/3",next_id=20104,show_icon=20077,partner_num=3,map_pos=3,map_model_tag=0,map_id=20001,chapter_id=201,show_model="H30025",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23010},
    [20104]={id=20104,award_show={{10600,1},{3,100}},name="2021/1/4",next_id=20105,show_icon=10600,partner_num=3,map_pos=4,map_model_tag=0,map_id=20001,chapter_id=201,show_model="H30025",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23015},
    [20105]={id=20105,award_show={{10600,1},{3,100}},name="2021/1/5",next_id=20201,show_icon=20061,partner_num=3,map_pos=5,map_model_tag=0,map_id=20001,chapter_id=201,show_model="H30067",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23020}},
 [202] = {
    [20201]={id=20201,award_show={{10601,1},{10600,1},{3,100}},name="2021/2/1",next_id=20202,show_icon=20072,partner_num=3,map_pos=1,map_model_tag=0,map_id=20003,chapter_id=202,show_model="H30069",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23025},
    [20202]={id=20202,award_show={{10601,1},{10600,1},{3,100}},name="2021/2/2",next_id=20203,show_icon=10601,partner_num=3,map_pos=2,map_model_tag=0,map_id=20003,chapter_id=202,show_model="H30069",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23030},
    [20203]={id=20203,award_show={{10601,1},{10600,1},{3,100}},name="2021/2/3",next_id=20204,show_icon=20078,partner_num=3,map_pos=3,map_model_tag=0,map_id=20003,chapter_id=202,show_model="H30068",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23035},
    [20204]={id=20204,award_show={{10601,1},{10600,1},{3,100}},name="2021/2/4",next_id=20205,show_icon=10601,partner_num=3,map_pos=4,map_model_tag=0,map_id=20003,chapter_id=202,show_model="H30068",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23040},
    [20205]={id=20205,award_show={{10601,1},{10600,1},{3,100}},name="2021/2/5",next_id=20301,show_icon=20080,partner_num=3,map_pos=5,map_model_tag=0,map_id=20003,chapter_id=202,show_model="H30030",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23045}},
 [203] = {
    [20301]={id=20301,award_show={{10602,1},{10601,1},{3,100}},name="2021/3/1",next_id=20302,show_icon=20079,partner_num=4,map_pos=1,map_model_tag=0,map_id=20002,chapter_id=203,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23050},
    [20302]={id=20302,award_show={{10602,1},{10601,1},{3,100}},name="2021/3/2",next_id=20303,show_icon=10602,partner_num=4,map_pos=2,map_model_tag=0,map_id=20002,chapter_id=203,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23055},
    [20303]={id=20303,award_show={{10602,1},{10601,1},{3,100}},name="2021/3/3",next_id=20304,show_icon=20073,partner_num=4,map_pos=3,map_model_tag=0,map_id=20002,chapter_id=203,show_model="H30014",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23060},
    [20304]={id=20304,award_show={{10602,1},{10601,1},{3,100}},name="2021/3/4",next_id=20305,show_icon=10602,partner_num=4,map_pos=4,map_model_tag=0,map_id=20002,chapter_id=203,show_model="H30014",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23065},
    [20305]={id=20305,award_show={{10602,1},{10601,1},{3,100}},name="2021/3/5",next_id=20401,show_icon=20046,partner_num=4,map_pos=5,map_model_tag=0,map_id=20002,chapter_id=203,show_model="H30004",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23070}},
 [204] = {
    [20401]={id=20401,award_show={{10603,1},{10602,1},{3,100}},name="2021/4/1",next_id=20402,show_icon=20074,partner_num=5,map_pos=1,map_model_tag=0,map_id=20001,chapter_id=204,show_model="H30073",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23075},
    [20402]={id=20402,award_show={{10603,1},{10602,1},{3,100}},name="2021/4/2",next_id=20403,show_icon=10603,partner_num=5,map_pos=2,map_model_tag=0,map_id=20001,chapter_id=204,show_model="H30073",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23080},
    [20403]={id=20403,award_show={{10603,1},{10602,1},{3,100}},name="2021/4/3",next_id=20404,show_icon=20055,partner_num=5,map_pos=3,map_model_tag=0,map_id=20001,chapter_id=204,show_model="H30045",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23085},
    [20404]={id=20404,award_show={{10603,1},{10602,1},{3,100}},name="2021/4/4",next_id=20405,show_icon=10603,partner_num=5,map_pos=4,map_model_tag=0,map_id=20001,chapter_id=204,show_model="H30045",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23090},
    [20405]={id=20405,award_show={{10603,1},{10602,1},{3,100}},name="2021/4/5",next_id=20501,show_icon=20036,partner_num=5,map_pos=5,map_model_tag=0,map_id=20001,chapter_id=204,show_model="H30050",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23095}},
 [205] = {
    [20501]={id=20501,award_show={{10604,1},{10603,1},{14700,1},{3,100}},name="2021/5/1",next_id=20502,show_icon=20075,partner_num=5,map_pos=1,map_model_tag=0,map_id=20003,chapter_id=205,show_model="H30012",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23100},
    [20502]={id=20502,award_show={{10604,1},{10603,1},{14700,1},{3,100}},name="2021/5/2",next_id=20503,show_icon=10604,partner_num=5,map_pos=2,map_model_tag=0,map_id=20003,chapter_id=205,show_model="H30012",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23105},
    [20503]={id=20503,award_show={{10604,1},{10603,1},{14700,1},{3,100}},name="2021/5/3",next_id=20504,show_icon=20069,partner_num=5,map_pos=3,map_model_tag=0,map_id=20003,chapter_id=205,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23110},
    [20504]={id=20504,award_show={{10604,1},{10603,1},{14700,1},{3,100}},name="2021/5/4",next_id=20505,show_icon=10604,partner_num=5,map_pos=4,map_model_tag=0,map_id=20003,chapter_id=205,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23115},
    [20505]={id=20505,award_show={{10604,1},{10603,1},{14700,1},{3,100}},name="2021/5/5",next_id=20601,show_icon=20060,partner_num=5,map_pos=5,map_model_tag=0,map_id=20003,chapter_id=205,show_model="H30006",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23120}},
 [206] = {
    [20601]={id=20601,award_show={{10605,1},{10604,1},{14700,1},{3,100}},name="2021/6/1",next_id=20602,show_icon=20051,partner_num=5,map_pos=1,map_model_tag=0,map_id=20002,chapter_id=206,show_model="H30008",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23125},
    [20602]={id=20602,award_show={{10605,1},{10604,1},{14700,1},{3,100}},name="2021/6/2",next_id=20603,show_icon=10605,partner_num=5,map_pos=2,map_model_tag=0,map_id=20002,chapter_id=206,show_model="H30008",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23130},
    [20603]={id=20603,award_show={{10605,1},{10604,1},{14700,1},{3,100}},name="2021/6/3",next_id=20604,show_icon=20044,partner_num=5,map_pos=3,map_model_tag=0,map_id=20002,chapter_id=206,show_model="H30057",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23135},
    [20604]={id=20604,award_show={{10605,1},{10604,1},{14700,1},{3,100}},name="2021/6/4",next_id=20605,show_icon=10605,partner_num=5,map_pos=4,map_model_tag=0,map_id=20002,chapter_id=206,show_model="H30057",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23140},
    [20605]={id=20605,award_show={{10605,1},{10604,1},{14700,1},{3,100}},name="2021/6/5",next_id=20701,show_icon=20034,partner_num=5,map_pos=5,map_model_tag=0,map_id=20002,chapter_id=206,show_model="H30003",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23145}},
 [207] = {
    [20701]={id=20701,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/7/1",next_id=20702,show_icon=20078,partner_num=5,map_pos=1,map_model_tag=0,map_id=20001,chapter_id=207,show_model="H30068",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23150},
    [20702]={id=20702,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/7/2",next_id=20703,show_icon=10606,partner_num=5,map_pos=2,map_model_tag=0,map_id=20001,chapter_id=207,show_model="H30068",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23155},
    [20703]={id=20703,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/7/3",next_id=20704,show_icon=20068,partner_num=5,map_pos=3,map_model_tag=0,map_id=20001,chapter_id=207,show_model="H30013",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23160},
    [20704]={id=20704,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/7/4",next_id=20705,show_icon=10606,partner_num=5,map_pos=4,map_model_tag=0,map_id=20001,chapter_id=207,show_model="H30013",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23165},
    [20705]={id=20705,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/7/5",next_id=20801,show_icon=20054,partner_num=5,map_pos=5,map_model_tag=0,map_id=20001,chapter_id=207,show_model="H30070",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23170}},
 [208] = {
    [20801]={id=20801,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/8/1",next_id=20802,show_icon=20057,partner_num=5,map_pos=1,map_model_tag=0,map_id=20003,chapter_id=208,show_model="H30034",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23175},
    [20802]={id=20802,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/8/2",next_id=20803,show_icon=10606,partner_num=5,map_pos=2,map_model_tag=0,map_id=20003,chapter_id=208,show_model="H30034",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23180},
    [20803]={id=20803,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/8/3",next_id=20804,show_icon=20050,partner_num=5,map_pos=3,map_model_tag=0,map_id=20003,chapter_id=208,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23185},
    [20804]={id=20804,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/8/4",next_id=20805,show_icon=10606,partner_num=5,map_pos=4,map_model_tag=0,map_id=20003,chapter_id=208,show_model="H30047",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23190},
    [20805]={id=20805,award_show={{10606,1},{10605,1},{14700,1},{3,100}},name="2021/8/5",next_id=20901,show_icon=20042,partner_num=5,map_pos=5,map_model_tag=0,map_id=20003,chapter_id=208,show_model="H30026",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23195}},
 [209] = {
    [20901]={id=20901,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/9/1",next_id=20902,show_icon=20066,partner_num=5,map_pos=1,map_model_tag=0,map_id=20002,chapter_id=209,show_model="H30037",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23200},
    [20902]={id=20902,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/9/2",next_id=20903,show_icon=10607,partner_num=5,map_pos=2,map_model_tag=0,map_id=20002,chapter_id=209,show_model="H30037",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23205},
    [20903]={id=20903,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/9/3",next_id=20904,show_icon=20062,partner_num=5,map_pos=3,map_model_tag=0,map_id=20002,chapter_id=209,show_model="H30055",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23210},
    [20904]={id=20904,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/9/4",next_id=20905,show_icon=10607,partner_num=5,map_pos=4,map_model_tag=0,map_id=20002,chapter_id=209,show_model="H30055",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23215},
    [20905]={id=20905,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/9/5",next_id=21001,show_icon=20043,partner_num=5,map_pos=5,map_model_tag=0,map_id=20002,chapter_id=209,show_model="H30056",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23220}},
 [210] = {
    [21001]={id=21001,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/10/1",next_id=21002,show_icon=20064,partner_num=5,map_pos=1,map_model_tag=0,map_id=20001,chapter_id=210,show_model="H30007",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23225},
    [21002]={id=21002,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/10/2",next_id=21003,show_icon=10607,partner_num=5,map_pos=2,map_model_tag=0,map_id=20001,chapter_id=210,show_model="H30007",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23230},
    [21003]={id=21003,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/10/3",next_id=21004,show_icon=20056,partner_num=5,map_pos=3,map_model_tag=0,map_id=20001,chapter_id=210,show_model="H30039",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23235},
    [21004]={id=21004,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/10/4",next_id=21005,show_icon=10607,partner_num=5,map_pos=4,map_model_tag=0,map_id=20001,chapter_id=210,show_model="H30039",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23240},
    [21005]={id=21005,award_show={{10607,1},{10606,1},{14700,1},{3,100}},name="2021/10/5",next_id=21101,show_icon=20040,partner_num=5,map_pos=5,map_model_tag=0,map_id=20001,chapter_id=210,show_model="H30010",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23245}},
 [211] = {
    [21101]={id=21101,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/11/1",next_id=21102,show_icon=20063,partner_num=5,map_pos=1,map_model_tag=0,map_id=20003,chapter_id=211,show_model="H30036",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23250},
    [21102]={id=21102,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/11/2",next_id=21103,show_icon=10608,partner_num=5,map_pos=2,map_model_tag=0,map_id=20003,chapter_id=211,show_model="H30036",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23255},
    [21103]={id=21103,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/11/3",next_id=21104,show_icon=20059,partner_num=5,map_pos=3,map_model_tag=0,map_id=20003,chapter_id=211,show_model="H30017",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23260},
    [21104]={id=21104,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/11/4",next_id=21105,show_icon=10608,partner_num=5,map_pos=4,map_model_tag=0,map_id=20003,chapter_id=211,show_model="H30018",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23265},
    [21105]={id=21105,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/11/5",next_id=21201,show_icon=20049,partner_num=5,map_pos=5,map_model_tag=0,map_id=20003,chapter_id=211,show_model="H30002",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23270}},
 [212] = {
    [21201]={id=21201,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/12/1",next_id=21202,show_icon=20053,partner_num=5,map_pos=1,map_model_tag=0,map_id=20002,chapter_id=212,show_model="H30071",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23275},
    [21202]={id=21202,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/12/2",next_id=21203,show_icon=10608,partner_num=5,map_pos=2,map_model_tag=0,map_id=20002,chapter_id=212,show_model="H30071",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23280},
    [21203]={id=21203,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/12/3",next_id=21204,show_icon=20045,partner_num=5,map_pos=3,map_model_tag=0,map_id=20002,chapter_id=212,show_model="H30020",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23285},
    [21204]={id=21204,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/12/4",next_id=21205,show_icon=10608,partner_num=5,map_pos=4,map_model_tag=0,map_id=20002,chapter_id=212,show_model="H30020",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23290},
    [21205]={id=21205,award_show={{10608,1},{10607,1},{14700,1},{3,100}},name="2021/12/5",next_id=21301,show_icon=20038,partner_num=5,map_pos=5,map_model_tag=0,map_id=20002,chapter_id=212,show_model="H30019",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23295}},
 [213] = {
    [21301]={id=21301,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/1/13",next_id=21302,show_icon=20071,partner_num=5,map_pos=1,map_model_tag=0,map_id=20001,chapter_id=213,show_model="H30009",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23300},
    [21302]={id=21302,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/2/13",next_id=21303,show_icon=10609,partner_num=5,map_pos=2,map_model_tag=0,map_id=20001,chapter_id=213,show_model="H30009",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23305},
    [21303]={id=21303,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/3/13",next_id=21304,show_icon=20069,partner_num=5,map_pos=3,map_model_tag=0,map_id=20001,chapter_id=213,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23310},
    [21304]={id=21304,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/4/13",next_id=21305,show_icon=10609,partner_num=5,map_pos=4,map_model_tag=0,map_id=20001,chapter_id=213,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23315},
    [21305]={id=21305,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/5/13",next_id=21401,show_icon=20058,partner_num=5,map_pos=5,map_model_tag=0,map_id=20001,chapter_id=213,show_model="H30042",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23320}},
 [214] = {
    [21401]={id=21401,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/1/14",next_id=21402,show_icon=20072,partner_num=5,map_pos=1,map_model_tag=0,map_id=20003,chapter_id=214,show_model="H30069",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23325},
    [21402]={id=21402,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/2/14",next_id=21403,show_icon=10609,partner_num=5,map_pos=2,map_model_tag=0,map_id=20003,chapter_id=214,show_model="H30069",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23330},
    [21403]={id=21403,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/3/14",next_id=21404,show_icon=20052,partner_num=5,map_pos=3,map_model_tag=0,map_id=20003,chapter_id=214,show_model="H30015",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23335},
    [21404]={id=21404,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/4/14",next_id=21405,show_icon=10609,partner_num=5,map_pos=4,map_model_tag=0,map_id=20003,chapter_id=214,show_model="H30015",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23340},
    [21405]={id=21405,award_show={{10609,1},{10608,1},{14700,1},{3,100}},name="2021/5/14",next_id=21501,show_icon=20025,partner_num=5,map_pos=5,map_model_tag=0,map_id=20003,chapter_id=214,show_model="H30052",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23345}},
 [215] = {
    [21501]={id=21501,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/1/15",next_id=21502,show_icon=20055,partner_num=5,map_pos=1,map_model_tag=0,map_id=20002,chapter_id=215,show_model="H30045",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23350},
    [21502]={id=21502,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/2/15",next_id=21503,show_icon=10610,partner_num=5,map_pos=2,map_model_tag=0,map_id=20002,chapter_id=215,show_model="H30045",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23355},
    [21503]={id=21503,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/3/15",next_id=21504,show_icon=20067,partner_num=5,map_pos=3,map_model_tag=0,map_id=20002,chapter_id=215,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23360},
    [21504]={id=21504,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/4/15",next_id=21505,show_icon=10610,partner_num=5,map_pos=4,map_model_tag=0,map_id=20002,chapter_id=215,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23365},
    [21505]={id=21505,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/5/15",next_id=21601,show_icon=20059,partner_num=5,map_pos=5,map_model_tag=0,map_id=20002,chapter_id=215,show_model="H30017",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23370}},
 [216] = {
    [21601]={id=21601,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/1/16",next_id=21602,show_icon=20061,partner_num=5,map_pos=1,map_model_tag=0,map_id=20001,chapter_id=216,show_model="H30067",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23375},
    [21602]={id=21602,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/2/16",next_id=21603,show_icon=10610,partner_num=5,map_pos=2,map_model_tag=0,map_id=20001,chapter_id=216,show_model="H30067",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23380},
    [21603]={id=21603,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/3/16",next_id=21604,show_icon=20063,partner_num=5,map_pos=3,map_model_tag=0,map_id=20001,chapter_id=216,show_model="H30036",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23385},
    [21604]={id=21604,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/4/16",next_id=21605,show_icon=10610,partner_num=5,map_pos=4,map_model_tag=0,map_id=20001,chapter_id=216,show_model="H30036",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23390},
    [21605]={id=21605,award_show={{10610,1},{10609,1},{14700,1},{3,100}},name="2021/5/16",next_id=21701,show_icon=20021,partner_num=5,map_pos=5,map_model_tag=0,map_id=20001,chapter_id=216,show_model="H30065",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23395}},
 [217] = {
    [21701]={id=21701,award_show={{10611,1},{10610,1},{14700,1},{3,100}},name="2021/1/17",next_id=21702,show_icon=20052,partner_num=5,map_pos=1,map_model_tag=0,map_id=20002,chapter_id=217,show_model="H30015",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23475},
    [21702]={id=21702,award_show={{10611,1},{10610,1},{14700,1},{3,100}},name="2021/2/17",next_id=21703,show_icon=10611,partner_num=5,map_pos=2,map_model_tag=0,map_id=20002,chapter_id=217,show_model="H30071",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23480},
    [21703]={id=21703,award_show={{10611,1},{10610,1},{14700,1},{3,100}},name="2021/3/17",next_id=21704,show_icon=20065,partner_num=5,map_pos=3,map_model_tag=0,map_id=20002,chapter_id=217,show_model="H30029",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23485},
    [21704]={id=21704,award_show={{10611,1},{10610,1},{14700,1},{3,100}},name="2021/4/17",next_id=21705,show_icon=10611,partner_num=5,map_pos=4,map_model_tag=0,map_id=20002,chapter_id=217,show_model="H30020",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23490},
    [21705]={id=21705,award_show={{10611,1},{10610,1},{14700,1},{3,100}},name="2021/5/17",next_id=21801,show_icon=20022,partner_num=5,map_pos=5,map_model_tag=0,map_id=20002,chapter_id=217,show_model="H30040",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23495}},
 [218] = {
    [21801]={id=21801,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/1/18",next_id=21802,show_icon=20069,partner_num=5,map_pos=1,map_model_tag=0,map_id=20001,chapter_id=218,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23575},
    [21802]={id=21802,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/2/18",next_id=21803,show_icon=10612,partner_num=5,map_pos=2,map_model_tag=0,map_id=20001,chapter_id=218,show_model="H30009",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23580},
    [21803]={id=21803,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/3/18",next_id=21804,show_icon=20021,partner_num=5,map_pos=3,map_model_tag=0,map_id=20001,chapter_id=218,show_model="H30065",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23585},
    [21804]={id=21804,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/4/18",next_id=21805,show_icon=10612,partner_num=5,map_pos=4,map_model_tag=0,map_id=20001,chapter_id=218,show_model="H30066",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23590},
    [21805]={id=21805,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/5/18",next_id=21901,show_icon=20033,partner_num=5,map_pos=5,map_model_tag=0,map_id=20001,chapter_id=218,show_model="H30041",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23595}},
 [219] = {
    [21901]={id=21901,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/1/19",next_id=21902,show_icon=20049,partner_num=5,map_pos=1,map_model_tag=0,map_id=20003,chapter_id=219,show_model="H30002",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23675},
    [21902]={id=21902,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/2/19",next_id=21903,show_icon=10612,partner_num=5,map_pos=2,map_model_tag=0,map_id=20003,chapter_id=219,show_model="H30069",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23680},
    [21903]={id=21903,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/3/19",next_id=21904,show_icon=20037,partner_num=5,map_pos=3,map_model_tag=0,map_id=20003,chapter_id=219,show_model="H30021",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23685},
    [21904]={id=21904,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/4/19",next_id=21905,show_icon=10612,partner_num=5,map_pos=4,map_model_tag=0,map_id=20003,chapter_id=219,show_model="H30015",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23690},
    [21905]={id=21905,award_show={{10612,1},{10611,1},{14700,1},{3,100}},name="2021/5/19",next_id=22001,show_icon=20041,partner_num=5,map_pos=5,map_model_tag=0,map_id=20003,chapter_id=219,show_model="H30060",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23695}},
 [220] = {
    [22001]={id=22001,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/1/20",next_id=22002,show_icon=20064,partner_num=5,map_pos=1,map_model_tag=0,map_id=20002,chapter_id=220,show_model="H30007",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23775},
    [22002]={id=22002,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/2/20",next_id=22003,show_icon=10613,partner_num=5,map_pos=2,map_model_tag=0,map_id=20002,chapter_id=220,show_model="H30045",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23780},
    [22003]={id=22003,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/3/20",next_id=22004,show_icon=20031,partner_num=5,map_pos=3,map_model_tag=0,map_id=20002,chapter_id=220,show_model="H30062",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23785},
    [22004]={id=22004,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/4/20",next_id=22005,show_icon=10613,partner_num=5,map_pos=4,map_model_tag=0,map_id=20002,chapter_id=220,show_model="H30049",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23790},
    [22005]={id=22005,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/5/20",next_id=22101,show_icon=20024,partner_num=5,map_pos=5,map_model_tag=0,map_id=20002,chapter_id=220,show_model="H30064",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23795}},
 [221] = {
    [22101]={id=22101,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/1/21",next_id=22102,show_icon=20063,partner_num=5,map_pos=1,map_model_tag=0,map_id=20001,chapter_id=221,show_model="H30036",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23875},
    [22102]={id=22102,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/2/21",next_id=22103,show_icon=10613,partner_num=5,map_pos=2,map_model_tag=0,map_id=20001,chapter_id=221,show_model="H30067",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23880},
    [22103]={id=22103,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/3/21",next_id=22104,show_icon=20035,partner_num=5,map_pos=3,map_model_tag=0,map_id=20001,chapter_id=221,show_model="H30027",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23885},
    [22104]={id=22104,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/4/21",next_id=22105,show_icon=10613,partner_num=5,map_pos=4,map_model_tag=0,map_id=20001,chapter_id=221,show_model="H30036",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23890},
    [22105]={id=22105,award_show={{10613,1},{10612,1},{14700,1},{3,100}},name="2021/5/21",next_id=0,show_icon=20028,partner_num=5,map_pos=5,map_model_tag=0,map_id=20001,chapter_id=221,show_model="H30051",desc="我是描述我是描述我是描述我是描述我是描述我是描述我是描述我是描述",first_award={{10200,1}},unit_id=23895}}
}
Config.DunChapterData.data_dungeon_list_fun = function(key)
    local data =Config.DunChapterData.data_dungeon_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunChapterData.data_dungeon_list['..key..'])not found') return
    end
    return data
end
---------------------data_dungeon_list end--------------------

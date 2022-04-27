--[[
        dun_trial_data.lua
        exported by excel2lua.py
        from file:dun_trial_data.xlsx
--]]


Config = Config or {}
Config.DunTrialData = Config.DunTrialData or {}

---------------------data_hardtower start--------------------
Config.DunTrialData.data_hardtower_length = 15
Config.DunTrialData.data_hardtower = {
 [1] = {award={{1,1,10000},{13,1,100}},loss={},name="第1层",rem_power=225000,unit_list=28501,lev=50,floor_tips="优先控制或者击杀月之骑士",headicon=30002,drop_id=50040,floor=1,unitid=28500},
 [2] = {award={{1,1,10000},{13,1,100}},loss={},name="第2层",rem_power=240000,unit_list=28506,lev=50,floor_tips="敌方强力AOE，注意己方气血",headicon=20001,drop_id=50041,floor=2,unitid=28505},
 [3] = {award={{1,1,10000},{13,1,100}},loss={},name="第3层",rem_power=250000,unit_list=28511,lev=50,floor_tips="防止敌方睡眠单点秒杀，优先击杀狼人",headicon=20017,drop_id=50042,floor=3,unitid=28510},
 [4] = {award={{1,1,10000},{13,1,100}},loss={},name="第4层",rem_power=260000,unit_list=28516,lev=50,floor_tips="控制阿努比斯，己方最好有免疫BUFF",headicon=30016,drop_id=50043,floor=4,unitid=28515},
 [5] = {award={{10201,1,1},{1,1,10000},{13,1,100}},loss={},name="第5层",rem_power=275000,unit_list=28521,lev=50,floor_tips="控制甘道夫或者赫拉，带强力加血",headicon=30025,drop_id=0,floor=5,unitid=28520},
 [6] = {award={{1,1,15000},{13,1,150}},loss={},name="第6层",rem_power=285000,unit_list=28526,lev=50,floor_tips="带具有净化或者免疫的辅助",headicon=30005,drop_id=50044,floor=6,unitid=28525},
 [7] = {award={{1,1,15000},{13,1,150}},loss={},name="第7层",rem_power=300000,unit_list=28531,lev=50,floor_tips="净化身上减益效果",headicon=30004,drop_id=50045,floor=7,unitid=28530},
 [8] = {award={{1,1,15000},{13,1,150}},loss={},name="第8层",rem_power=320000,unit_list=28536,lev=50,floor_tips="带净化辅助和强力奶妈，先手控制输出",headicon=30010,drop_id=50046,floor=8,unitid=28535},
 [9] = {award={{1,1,15000},{13,1,150}},loss={},name="第9层",rem_power=330000,unit_list=28541,lev=50,floor_tips="点杀其中一个水元素",headicon=20013,drop_id=50047,floor=9,unitid=28540},
 [10] = {award={{14705,1,10},{1,1,15000},{13,1,150}},loss={},name="第10层",rem_power=340000,unit_list=28546,lev=50,floor_tips="BOSS每隔3回合会直接秒杀一个英雄",headicon=40000,drop_id=0,floor=10,unitid=28545},
 [11] = {award={{1,1,20000},{13,1,200}},loss={},name="第11层",rem_power=360000,unit_list=28551,lev=50,floor_tips="需要稳定破甲BOSS",headicon=30018,drop_id=50048,floor=11,unitid=28550},
 [12] = {award={{1,1,20000},{13,1,200}},loss={},name="第12层",rem_power=380000,unit_list=28556,lev=50,floor_tips="需减速打条，延缓BOSS攻击频率",headicon=30011,drop_id=50049,floor=12,unitid=28555},
 [13] = {award={{1,1,20000},{13,1,200}},loss={},name="第13层",rem_power=395000,unit_list=28561,lev=50,floor_tips="BOSS免疫直接伤害，用持续伤害耗死",headicon=30006,drop_id=50050,floor=13,unitid=28560},
 [14] = {award={{1,1,20000},{13,1,200}},loss={},name="第14层",rem_power=410000,unit_list=28566,lev=50,floor_tips="炽天使攻击必定暴击",headicon=30012,drop_id=50051,floor=14,unitid=28565},
 [15] = {award={{10213,1,5},{1,1,20000},{13,1,200}},loss={},name="第15层",rem_power=430000,unit_list=28571,lev=50,floor_tips="在炎魔之王吃掉小怪前把小怪清掉",headicon=30010,drop_id=0,floor=15,unitid=28570}
}
Config.DunTrialData.data_hardtower_fun = function(key)
    local data =Config.DunTrialData.data_hardtower[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunTrialData.data_hardtower['..key..'])not found') return
    end
    return data
end
---------------------data_hardtower end--------------------
---------------------data_showgain start--------------------
Config.DunTrialData.data_showgain_length = 4
Config.DunTrialData.data_showgain = {
 [31] = {id=31,gain={{14705,1,1}},desc="概率奖励"},
 [33] = {id=33,gain={{10201,1,1}},desc="第5层奖励"},
 [34] = {id=34,gain={{14705,1,10}},desc="第10层奖励"},
 [35] = {id=35,gain={{10213,1,5}},desc="第15层奖励"}
}
Config.DunTrialData.data_showgain_fun = function(key)
    local data =Config.DunTrialData.data_showgain[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunTrialData.data_showgain['..key..'])not found') return
    end
    return data
end
---------------------data_showgain end--------------------
---------------------data_trialtower start--------------------
Config.DunTrialData.data_trialtower_length = 70
Config.DunTrialData.data_trialtower = {
 [1] = {award={{1,1,500},{10,1,250}},name="第1层",loss={},rem_power=16000,unit_list=28002,lev=1,gain={},first_award={{2,1,50}},headicon=30004,floor=1,floor_tips="需要抗住敌方第一波进攻！",unitid=28002},
 [2] = {award={{1,1,500},{10,1,250}},name="第2层",loss={},rem_power=16000,unit_list=28007,lev=2,gain={},first_award={{2,1,50}},headicon=30015,floor=2,floor_tips="需先手击败游侠射手",unitid=28007},
 [3] = {award={{1,1,500},{10,1,250}},name="第3层",loss={},rem_power=16000,unit_list=28012,lev=3,gain={},first_award={{2,1,50}},headicon=30022,floor=3,floor_tips="吸血伯爵能稳定控制流血状态单位，需优先集火",unitid=28012},
 [4] = {award={{1,1,500},{10,1,250}},name="第4层",loss={},rem_power=16000,unit_list=28017,lev=4,gain={},first_award={{2,1,50}},headicon=20001,floor=4,floor_tips="埃恩德隆魔法输出极高，需优先集火",unitid=28017},
 [5] = {award={{1,1,500},{10,1,250}},name="第5层",loss={},rem_power=16000,unit_list=28022,lev=5,gain={},first_award={{10210,1,1}},headicon=30017,floor=5,floor_tips="有BUFF加成的剑圣攻击极高，需小心",unitid=28022},
 [6] = {award={{1,1,500},{10,1,250}},name="第6层",loss={},rem_power=16000,unit_list=28027,lev=6,gain={},first_award={{2,1,50}},headicon=20005,floor=6,floor_tips="光明牧师能复活阵亡的队友",unitid=28027},
 [7] = {award={{1,1,500},{10,1,250}},name="第7层",loss={},rem_power=17000,unit_list=28032,lev=7,gain={},first_award={{2,1,50}},headicon=20002,floor=7,floor_tips="灼烧流第一波伤害极高，需要辅助英雄恢复状态",unitid=28032},
 [8] = {award={{1,1,500},{10,1,250}},name="第8层",loss={},rem_power=18000,unit_list=28037,lev=8,gain={},first_award={{2,1,50}},headicon=20024,floor=8,floor_tips="奥杜尔·铜须魔法输出极高，需优先集火",unitid=28037},
 [9] = {award={{1,1,500},{10,1,250}},name="第9层",loss={},rem_power=19000,unit_list=28042,lev=9,gain={},first_award={{2,1,50}},headicon=30014,floor=9,floor_tips="美杜莎能石化流血单位",unitid=28042},
 [10] = {award={{1,1,500},{10,1,250},{10200,1,2}},name="第10层",loss={},rem_power=20000,unit_list=28047,lev=10,gain={},first_award={{10201,1,1}},headicon=30013,floor=10,floor_tips="诅咒伤害无视防御，尽快结束战斗",unitid=28047},
 [11] = {award={{1,1,750},{10,1,375}},name="第11层",loss={},rem_power=22000,unit_list=28052,lev=11,gain={},first_award={{2,1,75}},headicon=30012,floor=11,floor_tips="炽天使暴击后会追加攻击一个单位",unitid=28052},
 [12] = {award={{1,1,750},{10,1,375}},name="第12层",loss={},rem_power=24000,unit_list=28057,lev=12,gain={},first_award={{2,1,75}},headicon=30009,floor=12,floor_tips="凯兰崔尔能让第一个阵亡的队友复活",unitid=28057},
 [13] = {award={{1,1,750},{10,1,375}},name="第13层",loss={},rem_power=26000,unit_list=28062,lev=13,gain={},first_award={{2,1,75}},headicon=30016,floor=13,floor_tips="游侠射手是主力输出，集火击杀",unitid=28062},
 [14] = {award={{1,1,750},{10,1,375}},name="第14层",loss={},rem_power=28000,unit_list=28067,lev=14,gain={},first_award={{2,1,75}},headicon=30021,floor=14,floor_tips="竖琴海妖概率睡眠敌方所有单位",unitid=28067},
 [15] = {award={{1,1,800},{10,1,400}},name="第15层",loss={},rem_power=30000,unit_list=28072,lev=15,gain={},first_award={{10201,1,1}},headicon=30020,floor=15,floor_tips="甘道夫的魔法输出极高，需抗住其2波输出",unitid=28072},
 [16] = {award={{1,1,800},{10,1,400}},name="第16层",loss={},rem_power=35000,unit_list=28077,lev=16,gain={},first_award={{2,1,75}},headicon=30002,floor=16,floor_tips="水元素对减速单位必定冰冻",unitid=28077},
 [17] = {award={{1,1,800},{10,1,400}},name="第17层",loss={},rem_power=38000,unit_list=28082,lev=17,gain={},first_award={{2,1,75}},headicon=30006,floor=17,floor_tips="盖亚擅长持久战，尽早结束战斗",unitid=28082},
 [18] = {award={{1,1,800},{10,1,400}},name="第18层",loss={},rem_power=40000,unit_list=28087,lev=18,gain={},first_award={{2,1,75}},headicon=30010,floor=18,floor_tips="炎魔之王气血低于40%时异常狂暴，需小心",unitid=28085},
 [19] = {award={{1,1,800},{10,1,400}},name="第19层",loss={},rem_power=42000,unit_list=28092,lev=19,gain={},first_award={{2,1,75}},headicon=30003,floor=19,floor_tips="哈迪斯和吸血伯爵大概率能控制住所有目标",unitid=28092},
 [20] = {award={{1,1,800},{10,1,400},{10200,1,2}},name="第20层",loss={},rem_power=45000,unit_list=28097,lev=20,gain={},first_award={{10201,1,1}},headicon=30007,floor=20,floor_tips="优先击杀或者控制阿努比斯",unitid=28097},
 [21] = {award={{1,1,1000},{10,1,500}},name="第21层",loss={},rem_power=48000,unit_list=28102,lev=21,gain={},first_award={{2,1,100}},headicon=30005,floor=21,floor_tips="奥丁的破甲配合群体输出能造成高伤害",unitid=28102},
 [22] = {award={{1,1,1000},{10,1,500}},name="第22层",loss={},rem_power=50000,unit_list=28107,lev=22,gain={},first_award={{2,1,100}},headicon=30019,floor=22,floor_tips="菲尼克斯拥有2条命，先击杀其他敌人",unitid=28107},
 [23] = {award={{1,1,1000},{10,1,500}},name="第23层",loss={},rem_power=52000,unit_list=28112,lev=23,gain={},first_award={{2,1,100}},headicon=30018,floor=23,floor_tips="冰霜巨龙防御极高，且输出不低，先破甲击杀",unitid=28112},
 [24] = {award={{1,1,1000},{10,1,500}},name="第24层",loss={},rem_power=55000,unit_list=28117,lev=24,gain={},first_award={{2,1,100}},headicon=30017,floor=24,floor_tips="剑圣的无敌斩每次能击杀一个英雄",unitid=28117},
 [25] = {award={{1,1,1000},{10,1,500}},name="第25层",loss={},rem_power=60000,unit_list=28122,lev=25,gain={},first_award={{10201,1,1}},headicon=30023,floor=25,floor_tips="优先击杀输出英雄",unitid=28122},
 [26] = {award={{1,1,1000},{10,1,500}},name="第26层",loss={},rem_power=70000,unit_list=28127,lev=26,gain={},first_award={{2,1,100}},headicon=20019,floor=26,floor_tips="憎恶被攻击后会反伤，需要加血辅助持续治疗",unitid=28127},
 [27] = {award={{1,1,1000},{10,1,500}},name="第27层",loss={},rem_power=72000,unit_list=28132,lev=27,gain={},first_award={{2,1,100}},headicon=30024,floor=27,floor_tips="影刹有反击BUFF时需击杀其他敌人",unitid=28132},
 [28] = {award={{1,1,1000},{10,1,500}},name="第28层",loss={},rem_power=76000,unit_list=28137,lev=28,gain={},first_award={{2,1,100}},headicon=30018,floor=28,floor_tips="冰霜巨龙的吐息随着回合数增加伤害越来越高",unitid=28135},
 [29] = {award={{1,1,1000},{10,1,500}},name="第29层",loss={},rem_power=80000,unit_list=28142,lev=29,gain={},first_award={{2,1,100}},headicon=30016,floor=29,floor_tips="抗住月之祭司重置后的一波输出",unitid=28142},
 [30] = {award={{1,1,1200},{10,1,600},{10200,1,2}},name="第30层",loss={},rem_power=90000,unit_list=28147,lev=30,gain={},first_award={{81052,1,1}},headicon=30001,floor=30,floor_tips="优先击杀或者控制住宙斯",unitid=28147},
 [31] = {award={{1,1,1200},{10,1,600}},name="第31层",loss={},rem_power=100000,unit_list=28152,lev=31,gain={},first_award={{2,1,125}},headicon=30004,floor=31,floor_tips="击败主力输出雅典娜",unitid=28152},
 [32] = {award={{1,1,1200},{10,1,600}},name="第32层",loss={},rem_power=105000,unit_list=28157,lev=32,gain={},first_award={{2,1,125}},headicon=20022,floor=32,floor_tips="需同时击败2个BOSS，否则会无限复活！",unitid=28155},
 [33] = {award={{1,1,1200},{10,1,600}},name="第33层",loss={},rem_power=110000,unit_list=28162,lev=33,gain={},first_award={{2,1,125}},headicon=30021,floor=33,floor_tips="优先击杀魅魔女王",unitid=28162},
 [34] = {award={{1,1,1200},{10,1,600}},name="第34层",loss={},rem_power=120000,unit_list=28167,lev=34,gain={},first_award={{2,1,125}},headicon=20001,floor=34,floor_tips="优先击杀2个输出，注意德鲁伊复活",unitid=28167},
 [35] = {award={{1,1,1200},{10,1,600},{10200,1,2}},name="第35层",loss={},rem_power=125000,unit_list=28172,lev=35,gain={},first_award={{10211,1,1}},headicon=30020,floor=35,floor_tips="击败甘道夫需要他两名学生的帮助",unitid=28170},
 [36] = {award={{1,1,1200},{10,1,600}},name="第36层",loss={},rem_power=135000,unit_list=28177,lev=36,gain={},first_award={{2,1,125}},headicon=20005,floor=36,floor_tips="暴走的阿瑞斯，注意其沉默技能",unitid=28177},
 [37] = {award={{1,1,1200},{10,1,600}},name="第37层",loss={},rem_power=140000,unit_list=28182,lev=37,gain={},first_award={{2,1,125}},headicon=20002,floor=37,floor_tips="灼烧暴击流，抗住第一波群体输出",unitid=28182},
 [38] = {award={{1,1,1200},{10,1,600}},name="第38层",loss={},rem_power=150000,unit_list=28187,lev=38,gain={},first_award={{2,1,125}},headicon=30004,floor=38,floor_tips="雅典娜会召唤仆从加入战斗",unitid=28185},
 [39] = {award={{1,1,1200},{10,1,600}},name="第39层",loss={},rem_power=155000,unit_list=28192,lev=39,gain={},first_award={{2,1,125}},headicon=30014,floor=39,floor_tips="加强版的流血套路，优先击杀核心美杜莎吧",unitid=28192},
 [40] = {award={{1,1,1500},{10,1,750},{10200,1,2}},name="第40层",loss={},rem_power=160000,unit_list=28197,lev=40,gain={},first_award={{10212,1,1}},headicon=20023,floor=40,floor_tips="岩石傀儡受到伤害会反击，优先击杀其队友吧",unitid=28195},
 [41] = {award={{1,1,1500},{10,1,750}},name="第41层",loss={},rem_power=165000,unit_list=28202,lev=41,gain={},first_award={{2,1,175}},headicon=30012,floor=41,floor_tips="注意炽天使残局收割",unitid=28200},
 [42] = {award={{1,1,1500},{10,1,750}},name="第42层",loss={},rem_power=180000,unit_list=28207,lev=42,gain={},first_award={{2,1,175}},headicon=30015,floor=42,floor_tips="击杀一个后，另外一个会进入狂暴状态",unitid=28205},
 [43] = {award={{1,1,1500},{10,1,750}},name="第43层",loss={},rem_power=190000,unit_list=28212,lev=43,gain={},first_award={{2,1,175}},headicon=30007,floor=43,floor_tips="控制或者优先击杀核心阿努比斯",unitid=28210},
 [44] = {award={{1,1,1500},{10,1,750}},name="第44层",loss={},rem_power=200000,unit_list=28217,lev=44,gain={},first_award={{2,1,175}},headicon=20014,floor=44,floor_tips="优先集火2个射手",unitid=28215},
 [45] = {award={{1,1,1500},{10,1,750},{10200,1,2}},name="第45层",loss={},rem_power=210000,unit_list=28222,lev=45,gain={},first_award={{81062,1,1}},headicon=30010,floor=45,floor_tips="每个敌人死后都会给其他敌人增加超强BUFF",unitid=28220},
 [46] = {award={{1,1,1500},{10,1,750}},name="第46层",loss={},rem_power=220000,unit_list=28227,lev=46,gain={},first_award={{2,1,175}},headicon=30002,floor=46,floor_tips="防止己方被冰冻",unitid=28225},
 [47] = {award={{1,1,1500},{10,1,750}},name="第47层",loss={},rem_power=230000,unit_list=28232,lev=47,gain={},first_award={{2,1,175}},headicon=30024,floor=47,floor_tips="己方释放2技能或者3技能会遭到影刹攻击",unitid=28230},
 [48] = {award={{1,1,1500},{10,1,750}},name="第48层",loss={},rem_power=235000,unit_list=28237,lev=48,gain={},first_award={{2,1,175}},headicon=30003,floor=48,floor_tips="需要清除流血状态或者强力加血辅助",unitid=28235},
 [49] = {award={{1,1,1500},{10,1,750}},name="第49层",loss={},rem_power=250000,unit_list=28242,lev=49,gain={},first_award={{2,1,175}},headicon=30007,floor=49,floor_tips="需优先集火路西法和阿努比斯",unitid=28240},
 [50] = {award={{1,1,1500},{10,1,750},{10200,1,2}},name="第50层",loss={},rem_power=276000,unit_list=28247,lev=50,gain={},first_award={{10212,1,1}},headicon=20003,floor=50,floor_tips="雷诺矮人不会被其他两个矮人复活",unitid=28245},
 [51] = {award={{1,1,2000},{10,1,1000}},name="第51层",loss={},rem_power=296000,unit_list=28252,lev=51,gain={},first_award={{2,1,200}},headicon=30005,floor=51,floor_tips="需在对面输出攻击前集火击杀",unitid=28250},
 [52] = {award={{1,1,2000},{10,1,1000}},name="第52层",loss={},rem_power=316000,unit_list=28257,lev=52,gain={},first_award={{2,1,200}},headicon=20001,floor=52,floor_tips="优先击杀BOSS召唤出来的狼人",unitid=28255},
 [53] = {award={{1,1,2000},{10,1,1000}},name="第53层",loss={},rem_power=336000,unit_list=28262,lev=53,gain={},first_award={{2,1,200}},headicon=30018,floor=53,floor_tips="需要破甲英雄针对攻击冰霜巨龙",unitid=28260},
 [54] = {award={{1,1,2000},{10,1,1000}},name="第54层",loss={},rem_power=356000,unit_list=28267,lev=54,gain={},first_award={{2,1,200}},headicon=30019,floor=54,floor_tips="带有免疫或者恢复能力的英雄抵抗灼烧流",unitid=28265},
 [55] = {award={{1,1,2000},{10,1,1000},{10200,1,2}},name="第55层",loss={},rem_power=376000,unit_list=28272,lev=55,gain={},first_award={{81082,1,1}},headicon=30001,floor=55,floor_tips="哈迪斯带有禁疗效果，提高自身英雄的生存能力",unitid=28270},
 [56] = {award={{1,1,2500},{10,1,1250}},name="第56层",loss={},rem_power=396000,unit_list=28277,lev=56,gain={},first_award={{2,1,200}},headicon=30006,floor=56,floor_tips="优先击杀凯兰崔尔，需要带破甲型英雄",unitid=28275},
 [57] = {award={{1,1,2500},{10,1,1250}},name="第57层",loss={},rem_power=416000,unit_list=28282,lev=57,gain={},first_award={{2,1,200}},headicon=30020,floor=57,floor_tips="抗住大法师4回合群攻且全部英雄不阵亡即可获胜",unitid=28280},
 [58] = {award={{1,1,2500},{10,1,1250}},name="第58层",loss={},rem_power=436000,unit_list=28287,lev=58,gain={},first_award={{2,1,200}},headicon=30014,floor=58,floor_tips="需带有全体免疫的英雄",unitid=28285},
 [59] = {award={{1,1,2500},{10,1,1250}},name="第59层",loss={},rem_power=456000,unit_list=28292,lev=59,gain={},first_award={{2,1,200}},headicon=30016,floor=59,floor_tips="先手控制雅典娜",unitid=28290},
 [60] = {award={{1,1,2500},{10,1,1250},{10200,1,2}},name="第60层",loss={},rem_power=476000,unit_list=28297,lev=60,gain={},first_award={{10212,1,1}},headicon=30011,floor=60,floor_tips="控制并先击杀黑暗之主的分身",unitid=28295},
 [61] = {award={{1,1,3000},{10,1,1500}},name="第61层",loss={},rem_power=500000,unit_list=28302,lev=61,gain={},first_award={{2,1,250}},headicon=30025,floor=61,floor_tips="防止被敌方控制住",unitid=28300},
 [62] = {award={{1,1,3000},{10,1,1500}},name="第62层",loss={},rem_power=535000,unit_list=28307,lev=62,gain={},first_award={{2,1,250}},headicon=30002,floor=62,floor_tips="优先击杀2个水元素",unitid=28305},
 [63] = {award={{1,1,3000},{10,1,1500}},name="第63层",loss={},rem_power=596000,unit_list=28312,lev=63,gain={},first_award={{2,1,250}},headicon=30018,floor=63,floor_tips="冰龙每3回合切换一次免疫效果",unitid=28310},
 [64] = {award={{1,1,3000},{10,1,1500}},name="第64层",loss={},rem_power=622000,unit_list=28317,lev=64,gain={},first_award={{2,1,250}},headicon=30009,floor=64,floor_tips="需快速击杀3个输出",unitid=28315},
 [65] = {award={{1,1,3000},{10,1,1500},{10200,1,2}},name="第65层",loss={},rem_power=684000,unit_list=28322,lev=65,gain={},first_award={{10212,1,1}},headicon=30019,floor=65,floor_tips="凤凰复活冷却只有3回合，需要在3回合内击杀",unitid=28320},
 [66] = {award={{1,1,3000},{10,1,1500}},name="第66层",loss={},rem_power=713000,unit_list=28327,lev=66,gain={},first_award={{2,1,250}},headicon=30011,floor=66,floor_tips="小心黑暗之主收割",unitid=28325},
 [67] = {award={{1,1,3000},{10,1,1500}},name="第67层",loss={},rem_power=765000,unit_list=28332,lev=67,gain={},first_award={{2,1,250}},headicon=30020,floor=67,floor_tips="甘道夫每出手一次额外释放一次狂风",unitid=28330},
 [68] = {award={{1,1,3000},{10,1,1500}},name="第68层",loss={},rem_power=810000,unit_list=28337,lev=68,gain={},first_award={{2,1,250}},headicon=30007,floor=68,floor_tips="每4回合阿努比斯引爆一次诅咒",unitid=28335},
 [69] = {award={{1,1,3000},{10,1,1500}},name="第69层",loss={},rem_power=861000,unit_list=28342,lev=69,gain={},first_award={{2,1,250}},headicon=30026,floor=69,floor_tips="控制敌方输出",unitid=28340},
 [70] = {award={{1,1,3000},{10,1,1500},{10200,1,2}},name="第70层",loss={},rem_power=900000,unit_list=28347,lev=70,gain={},first_award={{10212,1,1}},headicon=30028,floor=70,floor_tips="丘比特免疫法术伤害，雷神免疫物理伤害",unitid=28345}
}
Config.DunTrialData.data_trialtower_fun = function(key)
    local data =Config.DunTrialData.data_trialtower[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunTrialData.data_trialtower['..key..'])not found') return
    end
    return data
end
---------------------data_trialtower end--------------------
---------------------data_constant start--------------------
Config.DunTrialData.data_constant_length = 7
Config.DunTrialData.data_constant = {
 ["free_close"] = 21,21,0,0},
 ["free_open"] = 21,10,0,0},
 ["hard_open"] = 50,50,50,50,50},
 ["id_hard"] = 2,2,2,2,2},
 ["id_normal"] = 1,1,1,1,1},
 ["open_lev"] = 15,15,15,15,15},
 ["reset_time"] = {1,0,0,0},{16,0,0,0}}
}
Config.DunTrialData.data_constant_fun = function(key)
    local data =Config.DunTrialData.data_constant[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DunTrialData.data_constant['..key..'])not found') return
    end
    return data
end
---------------------data_constant end--------------------

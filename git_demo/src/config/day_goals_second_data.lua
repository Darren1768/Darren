--[[
        day_goals_second_data.lua
        exported by excel2lua.py
        from file:day_goals_second_data.xlsx
--]]


Config = Config or {}
Config.DayGoalsSecondData = Config.DayGoalsSecondData or {}

---------------------data_welfarecollection start--------------------
Config.DayGoalsSecondData.data_welfarecollection_length = 7
Config.DayGoalsSecondData.data_welfarecollection = {
 [1] = {
    [1]={award1={{2,20}},goal_id=20000,desc="登陆1次",condition={{'login',1}},day=1},
    [2]={award1={{2,20},{1,10000}},goal_id=20004,desc="等级达到39级",condition={{'evt_levup',39}},day=1}},
 [2] = {
    [1]={award1={{2,20}},goal_id=30000,desc="登陆1次",condition={{'login',2}},day=2},
    [2]={award1={{2,20},{1,15000}},goal_id=30004,desc="等级达到40级",condition={{'evt_levup',40}},day=2}},
 [3] = {
    [1]={award1={{2,20}},goal_id=40000,desc="登陆1次",condition={{'login',3}},day=3},
    [2]={award1={{2,20},{1,18000}},goal_id=40004,desc="等级达到41级",condition={{'evt_levup',41}},day=3}},
 [4] = {
    [1]={award1={{2,20}},goal_id=50000,desc="登陆1次",condition={{'login',4}},day=4},
    [2]={award1={{2,20},{1,20000}},goal_id=50004,desc="等级达到42级",condition={{'evt_levup',42}},day=4}},
 [5] = {
    [1]={award1={{2,20}},goal_id=60000,desc="登陆1次",condition={{'login',5}},day=5},
    [2]={award1={{2,20},{1,25000}},goal_id=60004,desc="等级达到43级",condition={{'evt_levup',43}},day=5}},
 [6] = {
    [1]={award1={{2,20}},goal_id=70000,desc="登陆1次",condition={{'login',6}},day=6},
    [2]={award1={{2,20},{1,30000}},goal_id=70004,desc="等级达到44级",condition={{'evt_levup',44}},day=6}},
 [7] = {
    [1]={award1={{2,20}},goal_id=80000,desc="登陆1次",condition={{'login',7}},day=7},
    [2]={award1={{2,20},{1,35000}},goal_id=80004,desc="等级达到45级",condition={{'evt_levup',45}},day=7}}
}
Config.DayGoalsSecondData.data_welfarecollection_fun = function(key)
    local data =Config.DayGoalsSecondData.data_welfarecollection[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DayGoalsSecondData.data_welfarecollection['..key..'])not found') return
    end
    return data
end
---------------------data_welfarecollection end--------------------
---------------------data_growthtarget start--------------------
Config.DayGoalsSecondData.data_growthtarget_length = 7
Config.DayGoalsSecondData.data_growthtarget = {
 [1] = {
    [1]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',10708}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11010,desc="通关第七章北裂境平原",target_type=1,day=1,type_name="剧情副本"},
    [2]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',10808}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11020,desc="通关第八章落日森林",target_type=1,day=1,type_name="地下城副本"},
    [3]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',10908}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11030,desc="通关第九章叹息山脉",target_type=1,day=1,type_name="地下城副本"},
    [4]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',11008}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11040,desc="通关第十章冰冠冰川",target_type=1,day=1,type_name="地下城副本"},
    [5]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',11108}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11050,desc="通关第十一章萨隆米亚神庙",target_type=1,day=1,type_name="剧情副本"},
    [6]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',11208}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11060,desc="通关第十二章特洛伊群岛",target_type=1,day=1,type_name="剧情副本"},
    [7]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',20705}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11070,desc="通关第七章龙鸣之地",target_type=2,day=1,type_name="剧情副本"},
    [8]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',20805}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11080,desc="通关第八章地下陵墓",target_type=2,day=1,type_name="剧情副本"},
    [9]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',20905}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11090,desc="通关第九章炼狱熔炉",target_type=2,day=1,type_name="剧情副本"},
    [10]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',21005}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11100,desc="通关第十章烈焰峡谷",target_type=2,day=1,type_name="地下城副本"},
    [11]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',21105}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11110,desc="通关第十一章幽冥神庙",target_type=2,day=1,type_name="地下城副本"},
    [12]={award1={{2,20},{10,1000}},progress={[1] ={target=3,param={{'chapter',21205}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="juqing",lev=1,goal_id=11120,desc="通关第十二章地心熔岩",target_type=2,day=1,type_name="地下城副本"}},
 [2] = {
    [1]={award1={{30111,2},{10,1000}},progress={[1] ={target=0,param={{'quality',9}},target_val=1,cli_label="evt_partner"}},show_icon="partner_jinjie",lev=1,goal_id=13010,desc="1个英雄达到紫色+3",target_type=1,day=2,type_name="英雄阶级"},
    [2]={award1={{30111,3},{10,1000}},progress={[1] ={target=0,param={{'quality',9}},target_val=3,cli_label="evt_partner"}},show_icon="partner_jinjie",lev=1,goal_id=13020,desc="3个英雄达到紫色+3",target_type=1,day=2,type_name="英雄培养"},
    [3]={award1={{30110,2},{10,1000}},progress={[1] ={target=0,param={{'quality',9}},target_val=3,cli_label="evt_partner"}},show_icon="partner_jinjie",lev=1,goal_id=13030,desc="5个英雄达到紫色+3",target_type=1,day=2,type_name="英雄培养"},
    [4]={award1={{30110,3},{10,2000}},progress={[1] ={target=0,param={{'quality',10}},target_val=1,cli_label="evt_partner"}},show_icon="partner_jinjie",lev=1,goal_id=13040,desc="1个英雄达到橙色",target_type=1,day=2,type_name="英雄培养"},
    [5]={award1={{30110,3},{10,2000}},progress={[1] ={target=0,param={{'quality',10}},target_val=3,cli_label="evt_partner"}},show_icon="partner_jinjie",lev=1,goal_id=13050,desc="3个英雄达到橙色",target_type=1,day=2,type_name="英雄培养"},
    [6]={award1={{2,20},{10302,5}},progress={[1] ={target=0,param={{'quality',10}},target_val=5,cli_label="evt_partner"}},show_icon="partner_jinjie",lev=16,goal_id=13060,desc="5个英雄达到橙色",target_type=1,day=2,type_name="英雄培养"},
    [7]={award1={{2,20},{10302,5}},progress={[1] ={target=0,param={{'star',3}},target_val=5,cli_label="evt_partner"}},show_icon="partner_xingji",lev=16,goal_id=13070,desc="拥有5个3星",target_type=2,day=2,type_name="英雄培养"},
    [8]={award1={{2,20},{10302,5}},progress={[1] ={target=0,param={{'star',4}},target_val=1,cli_label="evt_partner"}},show_icon="partner_xingji",lev=16,goal_id=13080,desc="拥有1个4星",target_type=2,day=2,type_name="英雄培养"},
    [9]={award1={{2,20},{10200,1}},progress={[1] ={target=0,param={{'star',4}},target_val=2,cli_label="evt_partner"}},show_icon="partner_xingji",lev=16,goal_id=13090,desc="拥有2个4星",target_type=2,day=2,type_name="英雄阶级"},
    [10]={award1={{2,30},{10200,2}},progress={[1] ={target=0,param={{'star',4}},target_val=3,cli_label="evt_partner"}},show_icon="partner_xingji",lev=16,goal_id=13100,desc="拥有3个4星",target_type=2,day=2,type_name="英雄阶级"},
    [11]={award1={{2,50},{10200,5}},progress={[1] ={target=0,param={{'star',5}},target_val=1,cli_label="evt_partner"}},show_icon="partner_xingji",lev=16,goal_id=13110,desc="拥有1个5星",target_type=2,day=2,type_name="英雄阶级"},
    [12]={award1={{2,100},{10201,1}},progress={[1] ={target=0,param={{'star',6}},target_val=1,cli_label="evt_partner"}},show_icon="partner_xingji",lev=16,goal_id=13120,desc="拥有1个6星",target_type=2,day=2,type_name="英雄阶级"},
    [13]={award1={{2,20},{15000,5}},progress={[1] ={target=0,param={{'awaken',1}},target_val=1,cli_label="evt_partner"}},show_icon="partner_juexing",lev=28,goal_id=13130,desc="1个英雄达到觉醒+1",target_type=2,day=2,type_name="英雄阶级"},
    [14]={award1={{2,20},{15000,10}},progress={[1] ={target=0,param={{'awaken',1}},target_val=3,cli_label="evt_partner"}},show_icon="partner_juexing",lev=28,goal_id=13140,desc="3个英雄达到觉醒+1",target_type=2,day=2,type_name="英雄培养"},
    [15]={award1={{2,20},{15041,1}},progress={[1] ={target=0,param={},target_val=5,cli_label="evt_artifact_enhance"}},show_icon="shenqi",lev=28,goal_id=13180,desc="英雄神器强化5次",target_type=2,day=2,type_name="英雄培养"},
    [16]={award1={{2,20},{15041,1}},progress={[1] ={target=0,param={},target_val=10,cli_label="evt_artifact_enhance"}},show_icon="shenqi",lev=28,goal_id=13181,desc="英雄神器强化10次",target_type=2,day=2,type_name="英雄培养"}},
 [3] = {
    [1]={award1={{2,20},{10214,5}},progress={[1] ={target=0,param={},target_val=5,cli_label="evt_eqm_wash"}},show_icon="partner_jinjie",lev=1,goal_id=14010,desc="装备洗练5次",target_type=1,day=3,type_name="装备培养"},
    [2]={award1={{2,20},{10214,5}},progress={[1] ={target=0,param={},target_val=10,cli_label="evt_eqm_wash"}},show_icon="partner_jinjie",lev=1,goal_id=14030,desc="装备洗练10次",target_type=1,day=3,type_name="异界裂缝"},
    [3]={award1={{2,20},{10214,10}},progress={[1] ={target=0,param={},target_val=20,cli_label="evt_eqm_wash"}},show_icon="partner_jinjie",lev=1,goal_id=14040,desc="装备洗练20次",target_type=1,day=3,type_name="异界裂缝"},
    [4]={award1={{2,50},{10214,10}},progress={[1] ={target=0,param={},target_val=30,cli_label="evt_eqm_wash"}},show_icon="partner_jinjie",lev=1,goal_id=14050,desc="装备洗练30次",target_type=1,day=3,type_name="异界裂缝"},
    [5]={award1={{2,20},{10200,1}},progress={[1] ={target=0,param={},target_val=1,cli_label="evt_eqm_refine"}},show_icon="partner_zb",lev=28,goal_id=14061,desc="装备精炼1次",target_type=1,day=3,type_name="装备培养"},
    [6]={award1={{2,20},{10200,1}},progress={[1] ={target=0,param={},target_val=3,cli_label="evt_eqm_refine"}},show_icon="partner_zb",lev=28,goal_id=14062,desc="装备精炼3次",target_type=1,day=3,type_name="装备培养"},
    [7]={award1={{15002,4},{15010,2}},progress={[1] ={target=0,param={},target_val=1,cli_label="evt_halo_compose"}},show_icon="yjs_halo",lev=28,goal_id=14065,desc="制作1次光环",target_type=1,day=3,type_name="装备培养"},
    [8]={award1={{15002,2},{15010,1}},progress={[1] ={target=0,param={},target_val=2,cli_label="evt_halo_refine"}},show_icon="partner_jinjie",lev=28,goal_id=14066,desc="光环精炼2次",target_type=1,day=3,type_name="装备培养"},
    [9]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=3,cli_label="evt_farplane_fight"}},show_icon="yijie",lev=22,goal_id=14070,desc="通关异界裂缝3次",target_type=2,day=3,type_name="装备培养"},
    [10]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=6,cli_label="evt_farplane_fight"}},show_icon="yijie",lev=22,goal_id=14080,desc="通关异界裂缝6次",target_type=2,day=3,type_name="英雄培养"},
    [11]={award1={{2,40},{10,1000}},progress={[1] ={target=0,param={},target_val=9,cli_label="evt_farplane_fight"}},show_icon="yijie",lev=22,goal_id=14090,desc="通关异界裂缝9次",target_type=2,day=3,type_name="英雄培养"},
    [12]={award1={{2,40},{10,1000}},progress={[1] ={target=0,param={},target_val=12,cli_label="evt_farplane_fight"}},show_icon="yijie",lev=22,goal_id=14100,desc="通关异界裂缝12次",target_type=2,day=3,type_name="异界裂缝"}},
 [4] = {
    [1]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',3}},target_val=20,cli_label="evt_combat_start"}},show_icon="zhuxiao",lev=17,goal_id=15010,desc="击败大陆野怪20次",target_type=1,day=4,type_name="诸神小怪"},
    [2]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',3}},target_val=40,cli_label="evt_combat_start"}},show_icon="zhuxiao",lev=17,goal_id=15020,desc="击败大陆野怪40次",target_type=1,day=4,type_name="诸神boss"},
    [3]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',3}},target_val=60,cli_label="evt_combat_start"}},show_icon="zhuxiao",lev=17,goal_id=15030,desc="击败大陆野怪60次",target_type=1,day=4,type_name="诸神boss"},
    [4]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',3}},target_val=80,cli_label="evt_combat_start"}},show_icon="zhuxiao",lev=17,goal_id=15040,desc="击败大陆野怪80次",target_type=1,day=4,type_name="诸神小怪"},
    [5]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',3}},target_val=100,cli_label="evt_combat_start"}},show_icon="zhuxiao",lev=17,goal_id=15050,desc="击败大陆野怪100次",target_type=1,day=4,type_name="诸神小怪"},
    [6]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',4}},target_val=1,cli_label="evt_combat_start"}},show_icon="zhuboss",lev=17,goal_id=15060,desc="击败大陆boss1次",target_type=2,day=4,type_name="诸神小怪"},
    [7]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',4}},target_val=3,cli_label="evt_combat_start"}},show_icon="zhuboss",lev=17,goal_id=15070,desc="击败大陆boss3次",target_type=2,day=4,type_name="诸神小怪"},
    [8]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',4}},target_val=6,cli_label="evt_combat_start"}},show_icon="zhuboss",lev=17,goal_id=15080,desc="击败大陆boss6次",target_type=2,day=4,type_name="诸神boss"},
    [9]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',4}},target_val=9,cli_label="evt_combat_start"}},show_icon="zhuboss",lev=18,goal_id=15090,desc="击败大陆boss9次",target_type=2,day=4,type_name="诸神boss"},
    [10]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',4}},target_val=15,cli_label="evt_combat_start"}},show_icon="zhuboss",lev=18,goal_id=15100,desc="击败大陆boss15次",target_type=2,day=4,type_name="诸神boss"},
    [11]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'world_unit_type',4}},target_val=25,cli_label="evt_combat_start"}},show_icon="zhuboss",lev=18,goal_id=15110,desc="击败大陆boss25次",target_type=2,day=4,type_name="诸神boss"}},
 [5] = {
    [1]={award1={{2,10},{10,1000}},progress={[1] ={target=6,param={{'difficulty',3}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="dragon",lev=28,goal_id=16010,desc="通关冒险难度巨龙",target_type=1,day=5,type_name="副本通关"},
    [2]={award1={{2,20},{10,1000}},progress={[1] ={target=6,param={{'difficulty',4}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="dragon",lev=28,goal_id=16020,desc="通关困难难度巨龙",target_type=1,day=5,type_name="竞技挑战"},
    [3]={award1={{2,20},{10,1500}},progress={[1] ={target=6,param={{'difficulty',5}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="dragon",lev=28,goal_id=16030,desc="通关王者难度巨龙",target_type=1,day=5,type_name="副本通关"},
    [4]={award1={{2,30},{10,1500}},progress={[1] ={target=5,param={{'difficulty',3}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="titan",lev=28,goal_id=16040,desc="通关冒险难度凤凰",target_type=1,day=5,type_name="副本通关"},
    [5]={award1={{2,20},{10,1000}},progress={[1] ={target=5,param={{'difficulty',4}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="titan",lev=28,goal_id=16050,desc="通关困难难度凤凰",target_type=1,day=5,type_name="副本通关"},
    [6]={award1={{2,50},{10,5000}},progress={[1] ={target=5,param={{'difficulty',5}},target_val=1,cli_label="evt_dungeon_pass"}},show_icon="titan",lev=28,goal_id=16060,desc="通关王者难度凤凰",target_type=1,day=5,type_name="副本通关"},
    [7]={award1={{2,20},{10,5000}},progress={[1] ={target=0,param={},target_val=12,cli_label="evt_sky_ladder_fight"}},show_icon="tianti",lev=28,goal_id=16070,desc="参加12次天梯对决",target_type=2,day=5,type_name="副本通关"},
    [8]={award1={{2,20},{10,5000}},progress={[1] ={target=0,param={},target_val=24,cli_label="evt_sky_ladder_fight"}},show_icon="tianti",lev=28,goal_id=16071,desc="参加24次天梯对决",target_type=2,day=5,type_name="竞技挑战"},
    [9]={award1={{2,20},{10,5000}},progress={[1] ={target=0,param={},target_val=3,cli_label="evt_zs_war_fight"}},show_icon="zhongshen",lev=28,goal_id=16080,desc="参加3次众神战场",target_type=2,day=5,type_name="竞技挑战"},
    [10]={award1={{2,20},{10,5000}},progress={[1] ={target=0,param={},target_val=5,cli_label="evt_zs_war_fight"}},show_icon="zhongshen",lev=28,goal_id=16081,desc="参加5次众神战场",target_type=2,day=5,type_name="竞技挑战"}},
 [6] = {
    [1]={award1={{30111,2},{2,20}},progress={[1] ={target=3,param={{'power',150000}},target_val=1,cli_label="evt_power"}},show_icon="buzhen",lev=26,goal_id=17010,desc="布阵战力达到150000",target_type=1,day=6,type_name="战力提升"},
    [2]={award1={{30111,2},{2,20}},progress={[1] ={target=3,param={{'power',170000}},target_val=1,cli_label="evt_power"}},show_icon="buzhen",lev=26,goal_id=17020,desc="布阵战力达到170000",target_type=1,day=6,type_name="实力提升"},
    [3]={award1={{30111,2},{2,20}},progress={[1] ={target=3,param={{'power',200000}},target_val=1,cli_label="evt_power"}},show_icon="buzhen",lev=26,goal_id=17030,desc="布阵战力达到200000",target_type=1,day=6,type_name="实力提升"},
    [4]={award1={{10200,1},{2,20}},progress={[1] ={target=3,param={{'power',230000}},target_val=1,cli_label="evt_power"}},show_icon="buzhen",lev=26,goal_id=17040,desc="布阵战力达到230000",target_type=1,day=6,type_name="实力提升"},
    [5]={award1={{10200,1},{2,20}},progress={[1] ={target=3,param={{'power',250000}},target_val=1,cli_label="evt_power"}},show_icon="buzhen",lev=26,goal_id=17050,desc="布阵战力达到250000",target_type=1,day=6,type_name="实力提升"},
    [6]={award1={{10210,1},{2,20}},progress={[1] ={target=3,param={{'power',280000}},target_val=1,cli_label="evt_power"}},show_icon="buzhen",lev=26,goal_id=17060,desc="布阵战力达到280000",target_type=1,day=6,type_name="实力提升"},
    [7]={award1={{30110,3},{2,20}},progress={[1] ={target=3,param={{'power',300000}},target_val=1,cli_label="evt_power"}},show_icon="buzhen",lev=26,goal_id=17070,desc="布阵战力达到300000",target_type=1,day=6,type_name="实力提升"},
    [8]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'type',2}},target_val=10,cli_label="evt_partner_summon"}},show_icon="summon",lev=25,goal_id=17080,desc="高级召唤10次",target_type=2,day=6,type_name="战力提升"},
    [9]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={{'type',2}},target_val=30,cli_label="evt_partner_summon"}},show_icon="summon",lev=25,goal_id=17100,desc="高级召唤30次",target_type=2,day=6,type_name="战力提升"},
    [10]={award1={{2,30},{10,1500}},progress={[1] ={target=0,param={{'type',2}},target_val=60,cli_label="evt_partner_summon"}},show_icon="summon",lev=25,goal_id=17120,desc="高级召唤60次",target_type=2,day=6,type_name="战力提升"},
    [11]={award1={{2,50},{10,3000}},progress={[1] ={target=0,param={{'type',2}},target_val=90,cli_label="evt_partner_summon"}},show_icon="summon",lev=25,goal_id=17130,desc="高级召唤90次",target_type=2,day=6,type_name="战力提升"},
    [12]={award1={{2,20},{1,30000}},progress={[1] ={target=0,param={{'type',2}},target_val=5,cli_label="evt_artifact_summon"}},show_icon="shenqi_zhuzao",lev=28,goal_id=17140,desc="神器高级铸造5次",target_type=2,day=6,type_name="战力提升"},
    [13]={award1={{2,20},{1,50000}},progress={[1] ={target=0,param={{'type',2}},target_val=10,cli_label="evt_artifact_summon"}},show_icon="shenqi_zhuzao",lev=28,goal_id=17150,desc="神器高级铸造10次",target_type=2,day=6,type_name="战力提升"},
    [14]={award1={{2,20},{10207,1}},progress={[1] ={target=0,param={{'type',2}},target_val=20,cli_label="evt_artifact_summon"}},show_icon="shenqi_zhuzao",lev=28,goal_id=17160,desc="神器高级铸造20次",target_type=2,day=6,type_name="实力提升"},
    [15]={award1={{2,20},{10207,1}},progress={[1] ={target=0,param={{'type',2}},target_val=30,cli_label="evt_artifact_summon"}},show_icon="shenqi_zhuzao",lev=28,goal_id=17170,desc="神器高级铸造30次",target_type=2,day=6,type_name="实力提升"}},
 [7] = {
    [1]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=5000,cli_label="evt_loss_hero_soul"}},show_icon="shenge",lev=1,goal_id=18010,desc="神格消耗5000点",target_type=1,day=7,type_name="神格消耗"},
    [2]={award1={{2,20},{10,2000}},progress={[1] ={target=0,param={},target_val=10000,cli_label="evt_loss_hero_soul"}},show_icon="shenge",lev=1,goal_id=18020,desc="神格消耗10000点",target_type=1,day=7,type_name="钻石消耗"},
    [3]={award1={{2,20},{10,5000}},progress={[1] ={target=0,param={},target_val=15000,cli_label="evt_loss_hero_soul"}},show_icon="shenge",lev=1,goal_id=18030,desc="神格消耗15000点",target_type=1,day=7,type_name="钻石消耗"},
    [4]={award1={{2,20},{10201,1}},progress={[1] ={target=0,param={},target_val=20000,cli_label="evt_loss_hero_soul"}},show_icon="shenge",lev=1,goal_id=18040,desc="神格消耗20000点",target_type=1,day=7,type_name="钻石消耗"},
    [5]={award1={{2,20},{10201,1}},progress={[1] ={target=0,param={},target_val=25000,cli_label="evt_loss_hero_soul"}},show_icon="shenge",lev=1,goal_id=18050,desc="神格消耗25000点",target_type=1,day=7,type_name="神格消耗"},
    [6]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=30000,cli_label="evt_loss_hero_soul"}},show_icon="shenge",lev=1,goal_id=18060,desc="神格消耗30000点",target_type=1,day=7,type_name="神格消耗"},
    [7]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=1000,cli_label="evt_loss_gold_day_goals2"}},show_icon="shenmi",lev=17,goal_id=18070,desc="消耗1000钻",target_type=2,day=7,type_name="神格消耗"},
    [8]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=2000,cli_label="evt_loss_gold_day_goals2"}},show_icon="shenmi",lev=17,goal_id=18080,desc="消耗2000钻",target_type=2,day=7,type_name="神格消耗"},
    [9]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=4000,cli_label="evt_loss_gold_day_goals2"}},show_icon="shenmi",lev=17,goal_id=18090,desc="消耗4000钻",target_type=2,day=7,type_name="神格消耗"},
    [10]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=8000,cli_label="evt_loss_gold_day_goals2"}},show_icon="shenmi",lev=17,goal_id=18100,desc="消耗8000钻",target_type=2,day=7,type_name="钻石消耗"},
    [11]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=12000,cli_label="evt_loss_gold_day_goals2"}},show_icon="shenmi",lev=17,goal_id=18110,desc="消耗12000钻",target_type=2,day=7,type_name="钻石消耗"},
    [12]={award1={{2,20},{10,1000}},progress={[1] ={target=0,param={},target_val=15000,cli_label="evt_loss_gold_day_goals2"}},show_icon="shenmi",lev=17,goal_id=18120,desc="消耗15000钻",target_type=2,day=7,type_name="钻石消耗"}}
}
Config.DayGoalsSecondData.data_growthtarget_fun = function(key)
    local data =Config.DayGoalsSecondData.data_growthtarget[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DayGoalsSecondData.data_growthtarget['..key..'])not found') return
    end
    return data
end
---------------------data_growthtarget end--------------------
---------------------data_all_target start--------------------
Config.DayGoalsSecondData.data_all_target_length = 1
Config.DayGoalsSecondData.data_all_target = {
 [88] = {id=88,award={{20084,80}}}
}
Config.DayGoalsSecondData.data_all_target_fun = function(key)
    local data =Config.DayGoalsSecondData.data_all_target[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DayGoalsSecondData.data_all_target['..key..'])not found') return
    end
    return data
end
---------------------data_all_target end--------------------
---------------------data_halfdiscount start--------------------
Config.DayGoalsSecondData.data_halfdiscount_length = 7
Config.DayGoalsSecondData.data_halfdiscount = {
 [1] = {award1={{10212,1},{10211,1},{10401,1}},icon="action_gift_4",price1=1800,day=1,award1_name="符石礼包",price2=900},
 [2] = {award1={{15000,100}},icon="action_gift_12",price1=1000,day=2,award1_name="觉醒礼包",price2=500},
 [3] = {award1={{10214,30},{80005,1}},icon="action_gift_14",price1=1200,day=3,award1_name="洗练精炼礼包",price2=600},
 [4] = {award1={{10466,1},{15010,2},{15002,4}},icon="action_gift_13",price1=2000,day=4,award1_name="光环礼包",price2=1000},
 [5] = {award1={{10207,10}},icon="action_gift_11",price1=1500,day=5,award1_name="神器铸造礼包",price2=750},
 [6] = {award1={{10464,1},{15042,10}},icon="action_gift_10",price1=3200,day=6,award1_name="随机三星神器礼包",price2=1600},
 [7] = {award1={{13,4800}},icon="action_gift_15",price1=2400,day=7,award1_name="神格积分礼包",price2=1200}
}
Config.DayGoalsSecondData.data_halfdiscount_fun = function(key)
    local data =Config.DayGoalsSecondData.data_halfdiscount[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DayGoalsSecondData.data_halfdiscount['..key..'])not found') return
    end
    return data
end
---------------------data_halfdiscount end--------------------
---------------------data_constant start--------------------
Config.DayGoalsSecondData.data_constant_length = 3
Config.DayGoalsSecondData.data_constant = {
 ["over_time"] = {desc="结束时间",label="over_time",val=7},
 ["rule_desc"] = {desc="1.全民探索根据天数开放，玩家完成任务后，可在第七天开始领取终极大奖；\n2.全民探索内的任务均从活动开启时计算；\n3.活动7天后（即第8天0点）关闭，奖励只可领取一次，领取后继续完成任务不可补充领取奖励;(福利领取、半价折扣不计算在内)",label="rule_desc",val=1},
 ["task_total"] = {desc="全目标总任务数量",label="task_total",val=88}
}
Config.DayGoalsSecondData.data_constant_fun = function(key)
    local data =Config.DayGoalsSecondData.data_constant[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DayGoalsSecondData.data_constant['..key..'])not found') return
    end
    return data
end
---------------------data_constant end--------------------

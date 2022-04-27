--[[
        research_data.lua
        exported by excel2lua.py
        from file:research_data.xlsx
--]]


Config = Config or {}
Config.ResearchData = Config.ResearchData or {}

---------------------data_research start--------------------
Config.ResearchData.data_research_length = 10
Config.ResearchData.data_research = {
 [1] = {expend=0,limit_lv=0,limit_count=0,lv=1},
 [2] = {expend=200000,limit_lv=1,limit_count=3,lv=2},
 [3] = {expend=300000,limit_lv=2,limit_count=4,lv=3},
 [4] = {expend=400000,limit_lv=3,limit_count=5,lv=4},
 [5] = {expend=500000,limit_lv=4,limit_count=6,lv=5},
 [6] = {expend=600000,limit_lv=5,limit_count=6,lv=6},
 [7] = {expend=700000,limit_lv=6,limit_count=6,lv=7},
 [8] = {expend=800000,limit_lv=7,limit_count=6,lv=8},
 [9] = {expend=900000,limit_lv=8,limit_count=6,lv=9},
 [10] = {expend=1000000,limit_lv=9,limit_count=6,lv=10}
}
Config.ResearchData.data_research_fun = function(key)
    local data =Config.ResearchData.data_research[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ResearchData.data_research['..key..'])not found') return
    end
    return data
end
---------------------data_research end--------------------
---------------------data_const start--------------------
Config.ResearchData.data_const_length = 5
Config.ResearchData.data_const = {
 ["attr_init"] = {desc="属性初始等级",key="attr_init",val=0},
 ["attr_max"] = {desc="属性最大等级",key="attr_max",val=10},
 ["lv_up"] = {desc="研究所开启等级",key="lv_up",val=10},
 ["research_init"] = {desc="研究所初始等级",key="research_init",val=1},
 ["research_max"] = {desc="研究所最大等级",key="research_max",val=10}
}
Config.ResearchData.data_const_fun = function(key)
    local data =Config.ResearchData.data_const[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ResearchData.data_const['..key..'])not found') return
    end
    return data
end
---------------------data_const end--------------------
---------------------data_attrLev start--------------------
Config.ResearchData.data_attrLev_length = 6
Config.ResearchData.data_attrLev = {
 [1] = {
    [1]={id=1,lv=1,attr={{'atk_per',50}},desc="所有英雄攻击额外加成5%",expend={{1,10000},{6,100}},name="御火术"},
    [2]={id=1,lv=2,attr={{'atk_per',80}},desc="所有英雄攻击额外加成8%",expend={{1,25000},{6,200}},name="末日风暴"},
    [3]={id=1,lv=3,attr={{'atk_per',110}},desc="所有英雄攻击额外加成11%",expend={{1,50000},{6,300}},name="烈火术"},
    [4]={id=1,lv=4,attr={{'atk_per',140}},desc="所有英雄攻击额外加成14%",expend={{1,75000},{6,400}},name="焰火环"},
    [5]={id=1,lv=5,attr={{'atk_per',170}},desc="所有英雄攻击额外加成17%",expend={{1,100000},{6,500}},name="炽炎波"},
    [6]={id=1,lv=6,attr={{'atk_per',200}},desc="所有英雄攻击额外加成20%",expend={{1,150000},{6,600}},name="炙炎旋流"},
    [7]={id=1,lv=7,attr={{'atk_per',230}},desc="所有英雄攻击额外加成23%",expend={{1,600000},{6,700}},name="火山熔岩"},
    [8]={id=1,lv=8,attr={{'atk_per',260}},desc="所有英雄攻击额外加成26%",expend={{1,400000},{6,800}},name="烈日蚀晴"},
    [9]={id=1,lv=9,attr={{'atk_per',290}},desc="所有英雄攻击额外加成29%",expend={{1,600000},{6,900}},name="地狱烈焰"},
    [10]={id=1,lv=10,attr={{'atk_per',320}},desc="所有英雄攻击额外加成32%",expend={{1,800000},{6,1000}},name="烈火熊熊"}},
 [2] = {
    [1]={id=2,lv=1,attr={{'def_s_per',50}},desc="所有英雄法术防御额外加成5%",expend={{1,10000},{6,100}},name="御水术"},
    [2]={id=2,lv=2,attr={{'def_s_per',80}},desc="所有英雄法术防御额外加成8%",expend={{1,25000},{6,200}},name="绝对零度"},
    [3]={id=2,lv=3,attr={{'def_s_per',110}},desc="所有英雄法术防御额外加成11%",expend={{1,50000},{6,300}},name="水泡术"},
    [4]={id=2,lv=4,attr={{'def_s_per',140}},desc="所有英雄法术防御额外加成14%",expend={{1,75000},{6,400}},name="流水盾"},
    [5]={id=2,lv=5,attr={{'def_s_per',170}},desc="所有英雄法术防御额外加成17%",expend={{1,100000},{6,500}},name="寒冰墙"},
    [6]={id=2,lv=6,attr={{'def_s_per',200}},desc="所有英雄法术防御额外加成20%",expend={{1,150000},{6,600}},name="冰霜护盾"},
    [7]={id=2,lv=7,attr={{'def_s_per',230}},desc="所有英雄法术防御额外加成23%",expend={{1,600000},{6,700}},name="水纹护体"},
    [8]={id=2,lv=8,attr={{'def_s_per',260}},desc="所有英雄法术防御额外加成26%",expend={{1,400000},{6,800}},name="瀑布冲击"},
    [9]={id=2,lv=9,attr={{'def_s_per',290}},desc="所有英雄法术防御额外加成29%",expend={{1,600000},{6,900}},name="冰天雪地"},
    [10]={id=2,lv=10,attr={{'def_s_per',320}},desc="所有英雄法术防御额外加成32%",expend={{1,800000},{6,1000}},name="雪地冰雕"}},
 [3] = {
    [1]={id=3,lv=1,attr={{'def_p_per',50}},desc="所有英雄物理防御额外加成5%",expend={{1,10000},{6,100}},name="御土术"},
    [2]={id=3,lv=2,attr={{'def_p_per',80}},desc="所有英雄物理防御额外加成8%",expend={{1,25000},{6,200}},name="叹息之墙"},
    [3]={id=3,lv=3,attr={{'def_p_per',110}},desc="所有英雄物理防御额外加成11%",expend={{1,50000},{6,300}},name="土墙术"},
    [4]={id=3,lv=4,attr={{'def_p_per',140}},desc="所有英雄物理防御额外加成14%",expend={{1,75000},{6,400}},name="岩石盾"},
    [5]={id=3,lv=5,attr={{'def_p_per',170}},desc="所有英雄物理防御额外加成17%",expend={{1,100000},{6,500}},name="流沙迷雾"},
    [6]={id=3,lv=6,attr={{'def_p_per',200}},desc="所有英雄物理防御额外加成20%",expend={{1,150000},{6,600}},name="护体石肤"},
    [7]={id=3,lv=7,attr={{'def_p_per',230}},desc="所有英雄物理防御额外加成23%",expend={{1,600000},{6,700}},name="火山熔岩"},
    [8]={id=3,lv=8,attr={{'def_p_per',260}},desc="所有英雄物理防御额外加成26%",expend={{1,400000},{6,800}},name="元素守护"},
    [9]={id=3,lv=9,attr={{'def_p_per',290}},desc="所有英雄物理防御额外加成29%",expend={{1,600000},{6,900}},name="石化森林"},
    [10]={id=3,lv=10,attr={{'def_p_per',320}},desc="所有英雄物理防御额外加成32%",expend={{1,800000},{6,1000}},name="绝对防御"}},
 [4] = {
    [1]={id=4,lv=1,attr={{'hp_max_per',50}},desc="所有英雄气血上限额外加成5%",expend={{1,10000},{6,100}},name="御木术"},
    [2]={id=4,lv=2,attr={{'hp_max_per',80}},desc="所有英雄气血上限额外加成8%",expend={{1,25000},{6,200}},name="生生不息"},
    [3]={id=4,lv=3,attr={{'hp_max_per',110}},desc="所有英雄气血上限额外加成11%",expend={{1,50000},{6,300}},name="叶舞术"},
    [4]={id=4,lv=4,attr={{'hp_max_per',140}},desc="所有英雄气血上限额外加成14%",expend={{1,75000},{6,400}},name="护林阵"},
    [5]={id=4,lv=5,attr={{'hp_max_per',170}},desc="所有英雄气血上限额外加成17%",expend={{1,100000},{6,500}},name="护心花"},
    [6]={id=4,lv=6,attr={{'hp_max_per',200}},desc="所有英雄气血上限额外加成20%",expend={{1,150000},{6,600}},name="藤蔓缠绕"},
    [7]={id=4,lv=7,attr={{'hp_max_per',230}},desc="所有英雄气血上限额外加成23%",expend={{1,600000},{6,700}},name="落地生根"},
    [8]={id=4,lv=8,attr={{'hp_max_per',260}},desc="所有英雄气血上限额外加成26%",expend={{1,400000},{6,800}},name="众生复苏"},
    [9]={id=4,lv=9,attr={{'hp_max_per',290}},desc="所有英雄气血上限额外加成29%",expend={{1,600000},{6,900}},name="森林之歌"},
    [10]={id=4,lv=10,attr={{'hp_max_per',320}},desc="所有英雄气血上限额外加成32%",expend={{1,800000},{6,1000}},name="万木守护"}},
 [5] = {
    [1]={id=5,lv=1,attr={{'crit_ratio',50}},desc="所有英雄暴击伤害额外加成5%",expend={{1,10000},{6,100}},name="御雷术"},
    [2]={id=5,lv=2,attr={{'crit_ratio',80}},desc="所有英雄暴击伤害额外加成8%",expend={{1,25000},{6,200}},name="天罚"},
    [3]={id=5,lv=3,attr={{'crit_ratio',110}},desc="所有英雄暴击伤害额外加成11%",expend={{1,50000},{6,300}},name="闪电箭"},
    [4]={id=5,lv=4,attr={{'crit_ratio',140}},desc="所有英雄暴击伤害额外加成14%",expend={{1,75000},{6,400}},name="静电术"},
    [5]={id=5,lv=5,attr={{'crit_ratio',170}},desc="所有英雄暴击伤害额外加成17%",expend={{1,100000},{6,500}},name="雷爆术"},
    [6]={id=5,lv=6,attr={{'crit_ratio',200}},desc="所有英雄暴击伤害额外加成20%",expend={{1,150000},{6,600}},name="天雷闪"},
    [7]={id=5,lv=7,attr={{'crit_ratio',230}},desc="所有英雄暴击伤害额外加成23%",expend={{1,600000},{6,700}},name="雷鸣爆弹"},
    [8]={id=5,lv=8,attr={{'crit_ratio',260}},desc="所有英雄暴击伤害额外加成26%",expend={{1,400000},{6,800}},name="雷动九天"},
    [9]={id=5,lv=9,attr={{'crit_ratio',290}},desc="所有英雄暴击伤害额外加成29%",expend={{1,600000},{6,900}},name="连锁闪电"},
    [10]={id=5,lv=10,attr={{'crit_ratio',320}},desc="所有英雄暴击伤害额外加成32%",expend={{1,800000},{6,1000}},name="闪电风暴"}},
 [6] = {
    [1]={id=6,lv=1,attr={{'speed',5}},desc="所有英雄速度额外增加5",expend={{1,10000},{6,100}},name="御风术"},
    [2]={id=6,lv=2,attr={{'speed',8}},desc="所有英雄速度额外增加8",expend={{1,25000},{6,200}},name="瞬间移动"},
    [3]={id=6,lv=3,attr={{'speed',11}},desc="所有英雄速度额外增加11",expend={{1,50000},{6,300}},name="加速术"},
    [4]={id=6,lv=4,attr={{'speed',14}},desc="所有英雄速度额外增加14",expend={{1,75000},{6,400}},name="飞行术"},
    [5]={id=6,lv=5,attr={{'speed',17}},desc="所有英雄速度额外增加17",expend={{1,100000},{6,500}},name="风行步"},
    [6]={id=6,lv=6,attr={{'speed',20}},desc="所有英雄速度额外增加20",expend={{1,150000},{6,600}},name="空气盾"},
    [7]={id=6,lv=7,attr={{'speed',23}},desc="所有英雄速度额外增加23",expend={{1,600000},{6,700}},name="风卷残云"},
    [8]={id=6,lv=8,attr={{'speed',26}},desc="所有英雄速度额外增加26",expend={{1,400000},{6,800}},name="随风飘动"},
    [9]={id=6,lv=9,attr={{'speed',29}},desc="所有英雄速度额外增加29",expend={{1,600000},{6,900}},name="风之翔翼"},
    [10]={id=6,lv=10,attr={{'speed',32}},desc="所有英雄速度额外增加32",expend={{1,800000},{6,1000}},name="天风之舞"}}
}
Config.ResearchData.data_attrLev_fun = function(key)
    local data =Config.ResearchData.data_attrLev[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ResearchData.data_attrLev['..key..'])not found') return
    end
    return data
end
---------------------data_attrLev end--------------------

--[[
        equip_recommend.lua
        exported by excel2lua.py
        from file:equip_recommend.xlsx
--]]


Config = Config or {}
Config.EquipRecommend = Config.EquipRecommend or {}

---------------------data_recommend_list start--------------------
Config.EquipRecommend.data_recommend_list_length = 65
Config.EquipRecommend.data_recommend_list = {
 [10001] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'},{2,'dodge_magic'}},desc2="迅捷（增加速度）\n勇气（增加气血）",bid=10001,recommend_attr3={{1,'speed'},{2,'hp_max_per'}}},
 [10002] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=10002,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [10003] = {attr_list={{1,'def'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'def_per'}},recommend_attr2={{1,'dodge_magic'}},desc2="预言者（连续获得回合）\n守护（增加防御）",bid=10003,recommend_attr3={{1,'def_per'},{2,'speed'}}},
 [10004] = {attr_list={{1,'def'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'def_per'}},recommend_attr2={{1,'dodge_magic'}},desc2="预言者（连续获得回合）\n守护（增加防御）",bid=10004,recommend_attr3={{1,'def_per'},{2,'speed'}}},
 [10005] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="雷霆套（增加暴伤）\n狂怒（增加暴击率）",bid=10005,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [10007] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="征服（增加攻击）\n狂怒（增加暴击率）",bid=10007,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [10008] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=10008,recommend_attr3={{1,'hp_max_per'},{2,'speed'}}},
 [10009] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="审判（增加效果命中）\n狂怒（增加暴击率）",bid=10009,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [10010] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="征服（增加攻击）\n狂怒（增加暴击率）",bid=10010,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20001] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=20001,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20002] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="雷霆套（增加暴伤）\n狂怒（增加暴击率）",bid=20002,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20003] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="战吼（全队加护盾）\n勇气（增加气血）",bid=20003,recommend_attr3={{1,'speed'},{2,'hp_max_per'}}},
 [20004] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=20004,recommend_attr3={{1,'speed'},{2,'hp_max_per'}}},
 [20005] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="雷霆套（增加暴伤）\n狂怒（增加暴击率）",bid=20005,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20006] = {attr_list={{1,'def'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'def_per'}},recommend_attr2={{1,'def_per'},{2,'dodge_magic'}},desc2="预言者（连续获得回合）\n守护（增加防御）",bid=20006,recommend_attr3={{1,'speed'},{2,'def_per'}}},
 [20007] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'},{2,'atk_per'}},desc2="迅捷（增加速度）\n狂怒（增加暴击率）",bid=20007,recommend_attr3={{1,'speed'}}},
 [20008] = {attr_list={{1,'hp_max'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'},{2,'dodge_magic'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=20008,recommend_attr3={{1,'hp_max_per'},{1,'speed'}}},
 [20009] = {attr_list={{1,'speed'},{2,'hp_max'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="迅捷（增加速度）\n勇气（增加生命）",bid=20009,recommend_attr3={{1,'speed'}}},
 [20010] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'},{2,'dodge_magic'}},desc2="迅捷（增加速度）\n勇气（增加生命）",bid=20010,recommend_attr3={{1,'speed'}}},
 [20011] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hit_magic'},{2,'hp_max_per'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=20011,recommend_attr3={{1,'speed'}}},
 [20012] = {attr_list={{1,'speed'},{2,'hp_max'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hit_magic'},{2,'hp_max_per'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=20012,recommend_attr3={{1,'speed'}}},
 [20013] = {attr_list={{1,'hit_magic'},{1,'atk'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'},{2,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=20013,recommend_attr3={{1,'speed'}}},
 [20014] = {attr_list={{1,'speed'},{2,'hp_max'},{2,'hit_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hit_magic'}},desc2="迅捷（增加速度）\n集中（增加效果命中）",bid=20014,recommend_attr3={{1,'speed'}}},
 [20015] = {attr_list={{1,'speed'},{2,'hp_max'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'},{2,'dodge_magic'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=20015,recommend_attr3={{1,'speed'}}},
 [20016] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=20016,recommend_attr3={{1,'hp_max_per'},{2,'speed'}}},
 [20017] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="征服套（增加攻击）\n狂怒（增加暴击率）",bid=20017,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20018] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="征服套（增加攻击）\n狂怒（增加暴击率）",bid=20018,recommend_attr3={{1,'speed'}}},
 [20019] = {attr_list={{1,'hp_max'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="英雄（反弹伤害）\n勇气（增加气血）",bid=20019,recommend_attr3={{1,'hp_max_per'},{2,'speed'}}},
 [20020] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="征服套（增加攻击）\n狂怒（增加暴击率）",bid=20020,recommend_attr3={{1,'speed'}}},
 [20021] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="战吼（全队加护盾）\n勇气（增加气血）",bid=20021,recommend_attr3={{1,'hp_max_per'},{2,'speed'}}},
 [20022] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'},{2,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=20022,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20023] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'},{2,'dodge_magic'}},desc2="无畏（增加效果抵抗）\n勇气（增加气血）",bid=20023,recommend_attr3={{1,'hp_max_per'}}},
 [20024] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=20024,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20025] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=20025,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20026] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=20026,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [20027] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n审判（增加效果命中）",bid=20027,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [30001] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'}},desc2="迅捷（提升速度先手控制）\n狂怒（增加暴击率）",bid=30001,recommend_attr3={{1,'speed'}}},
 [30002] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="战吼（全队加护盾）\n勇气（增加气血）",bid=30002,recommend_attr3={{1,'speed'},{2,'hp_max_per'}}},
 [30003] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'crit_ratio'},{2,'crit_rate'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=30003,recommend_attr3={{1,'speed'}}},
 [30004] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="预言者（连续获得回合）\n狂怒（增加暴击率）",bid=30004,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [30005] = {attr_list={{1,'def'},{1,'hit_magic'},{2,'dodge_magic'}},recommend_attr1={{1,'def_per'}},recommend_attr2={{1,'dodge_magic'},{2,'def_per'}},desc2="秩序（眩晕控制）\n反击（反击嘲讽）",bid=30005,recommend_attr3={{1,'def_per'},{2,'speed'}}},
 [30006] = {attr_list={{1,'def'},{1,'hit_magic'},{2,'speed'}},recommend_attr1={{1,'def_per'}},recommend_attr2={{1,'def_per'}},desc2="秩序（眩晕控制）\n守护（增加防御）",bid=30006,recommend_attr3={{1,'speed'}}},
 [30007] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_rate'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=30007,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [30008] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=30008,recommend_attr3={{1,'speed'}}},
 [30009] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'},{2,'dodge_magic'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=30009,recommend_attr3={{1,'hp_max_per'},{1,'speed'}}},
 [30010] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="雷霆（增加暴伤）\n狂怒（增加暴击率）",bid=30010,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [30011] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="雷霆（增加暴伤）\n狂怒（增加暴击率）",bid=30011,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [30012] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'atk_per'},{2,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="征服（增加攻击）\n狂怒（增加暴击率）",bid=30012,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [30013] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'atk_per'},{2,'crit_ratio'}},recommend_attr2={{1,'atk_per'},{2,'hit_magic'}},desc2="征服（增加攻击）\n狂怒（增加暴击率）",bid=30013,recommend_attr3={{1,'speed'}}},
 [30014] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'speed'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'},{2,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=30014,recommend_attr3={{1,'speed'}}},
 [30015] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'},{2,'atk_per'}},desc2="预言者（连续获得回合）\n狂怒（增加暴击率）",bid=30015,recommend_attr3={{1,'speed'}}},
 [30016] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="迅捷（增加速度）\n勇气（增加生命）",bid=30016,recommend_attr3={{1,'speed'}}},
 [30017] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'},{2,'atk_per'}},desc2="征服（增加攻击）\n狂怒（增加暴击率）",bid=30017,recommend_attr3={{1,'speed'},{2,'atk_per'}}},
 [30018] = {attr_list={{1,'def'},{1,'hit_magic'},{2,'speed'}},recommend_attr1={{1,'def_per'}},recommend_attr2={{1,'hit_magic'},{2,'def_per'}},desc2="预言者（连续获得回合）\n反击（反击冰冻）",bid=30018,recommend_attr3={{1,'speed'}}},
 [30019] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=30019,recommend_attr3={{1,'speed'},{2,'atk_per'}}},
 [30020] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=30020,recommend_attr3={{1,'speed'}}},
 [30021] = {attr_list={{1,'atk'},{1,'speed'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="预言者（连续获得回合）\n狂怒（增加暴击率）",bid=30021,recommend_attr3={{1,'speed'},{2,'atk_per'}}},
 [30022] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="征服套（增加攻击）\n狂怒（增加暴击率）",bid=30022,recommend_attr3={{1,'speed'},{2,'atk_per'}}},
 [30023] = {attr_list={{1,'hit_magic'},{1,'speed'},{2,'hp_max'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hit_magic'}},desc2="迅捷套（增加速度）\n勇气（增加生命）",bid=30023,recommend_attr3={{1,'speed'}}},
 [30024] = {attr_list={{1,'hp_max'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'},{2,'dodge_magic'}},desc2="战吼（全队加护盾）\n勇气（增加气血）",bid=30024,recommend_attr3={{1,'speed'},{1,'hp_max_per'}}},
 [30025] = {attr_list={{1,'hit_magic'},{1,'speed'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'hit_magic'},{2,'atk_per'}},desc2="秩序（眩晕控制）\n狂怒（增加暴击率）",bid=30025,recommend_attr3={{1,'speed'},{2,'atk_per'}}},
 [30026] = {attr_list={{1,'atk'},{1,'hit_magic'},{2,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="雷霆套（增加暴伤）\n狂怒（增加暴击率）",bid=30026,recommend_attr3={{1,'atk_per'},{2,'speed'}}},
 [30027] = {attr_list={{1,'hp_max'},{2,'speed'},{2,'dodge_magic'}},recommend_attr1={{1,'hp_max_per'}},recommend_attr2={{1,'hp_max_per'}},desc2="预言者（连续获得回合）\n勇气（增加生命）",bid=30027,recommend_attr3={{1,'speed'}}},
 [30028] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="吸血（生存保障）\n狂怒（增加暴击率）",bid=30028,recommend_attr3={{1,'atk_per'},{1,'speed'}}},
 [30029] = {attr_list={{1,'atk'},{1,'crit_rate'},{2,'crit_ratio'}},recommend_attr1={{1,'crit_ratio'}},recommend_attr2={{1,'atk_per'}},desc2="吸血（生存保障）\n狂怒（增加暴击率）",bid=30029,recommend_attr3={{1,'atk_per'},{1,'speed'}}}
}
Config.EquipRecommend.data_recommend_list_fun = function(key)
    local data =Config.EquipRecommend.data_recommend_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.EquipRecommend.data_recommend_list['..key..'])not found') return
    end
    return data
end
---------------------data_recommend_list end--------------------

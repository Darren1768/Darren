--[[
        partner_refine_data.lua
        exported by excel2lua.py
        from file:partner_refine_data.xlsx
--]]


Config = Config or {}
Config.PartnerRefineData = Config.PartnerRefineData or {}

---------------------data_refine_sell start--------------------
Config.PartnerRefineData.data_refine_sell_length = 4
Config.PartnerRefineData.data_refine_sell = {
 [1] = {color=1,expend={{1,10000}}},
 [2] = {color=2,expend={{1,20000}}},
 [3] = {color=3,expend={{1,30000}}},
 [4] = {color=4,expend={{1,40000}}}
}
Config.PartnerRefineData.data_refine_sell_fun = function(key)
    local data =Config.PartnerRefineData.data_refine_sell[key]
    if DATA_DEBUG and data == nil then
        print('( Config.PartnerRefineData.data_refine_sell['..key..'])not found') return
    end
    return data
end
---------------------data_refine_sell end--------------------
---------------------data_refine_const start--------------------
Config.PartnerRefineData.data_refine_const_length = 4
Config.PartnerRefineData.data_refine_const = {
 ["eqm_bap_lev"] = {desc="多少级开启精炼",label="eqm_bap_lev",val=45},
 ["eqm_bap_star"] = {desc="多少星以上可洗炼",label="eqm_bap_star",val=4},
 ["eqm_lev"] = {desc="强化多少以上装备可洗炼",label="eqm_lev",val=12},
 ["refine_intrduction"] = {desc="1、装备精炼可以让装备副属性获得额外的增加\n2、精炼需要消耗对应类型和属性的精炼石，精炼石的品质影响精炼的效果\n3、首次精炼的效果会自动保存，后续精炼的效果玩家可以自行选择是否覆盖\n4、洗炼后的副属性可以继续精炼，但是精炼后的属性不能够再进行洗炼转换\n5、精炼石可以在天梯商店和神秘商店兑换购买",label="refine_intrduction",val=0}
}
Config.PartnerRefineData.data_refine_const_fun = function(key)
    local data =Config.PartnerRefineData.data_refine_const[key]
    if DATA_DEBUG and data == nil then
        print('( Config.PartnerRefineData.data_refine_const['..key..'])not found') return
    end
    return data
end
---------------------data_refine_const end--------------------
---------------------data_refine_set start--------------------
Config.PartnerRefineData.data_refine_set_length = 15
Config.PartnerRefineData.data_refine_set = {
 [4000] = {id=1,set_id=4000},
 [4010] = {id=2,set_id=4010},
 [4020] = {id=2,set_id=4020},
 [4030] = {id=1,set_id=4030},
 [4040] = {id=1,set_id=4040},
 [4050] = {id=1,set_id=4050},
 [4060] = {id=1,set_id=4060},
 [4070] = {id=3,set_id=4070},
 [4080] = {id=3,set_id=4080},
 [4090] = {id=2,set_id=4090},
 [4100] = {id=2,set_id=4100},
 [4110] = {id=3,set_id=4110},
 [4140] = {id=3,set_id=4140},
 [4150] = {id=2,set_id=4150},
 [4160] = {id=3,set_id=4160}
}
Config.PartnerRefineData.data_refine_set_fun = function(key)
    local data =Config.PartnerRefineData.data_refine_set[key]
    if DATA_DEBUG and data == nil then
        print('( Config.PartnerRefineData.data_refine_set['..key..'])not found') return
    end
    return data
end
---------------------data_refine_set end--------------------
---------------------data_partner_refine start--------------------
Config.PartnerRefineData.data_partner_refine_length = 3
Config.PartnerRefineData.data_partner_refine = {
 [1] = {
    [51001]={id=51001,rand={{3,4,50},{4,7,450},{7,9,350},{9,10,100},{10,12,50}},attr="atk",gold={{1,5000}},color=1,set_id=1,show={3,12}},
    [51002]={id=51002,rand={{2,2,50},{2,4,450},{4,5,350},{5,6,100},{6,7,50}},attr="def",gold={{1,5000}},color=1,set_id=1,show={2,7}},
    [51003]={id=51003,rand={{36,48,50},{48,72,450},{72,96,350},{96,108,100},{108,120,50}},attr="hp_max",gold={{1,5000}},color=1,set_id=1,show={36,120}},
    [51004]={id=51004,rand={{1,1,800},{2,2,200}},attr="speed",gold={{1,5000}},color=1,set_id=1,show={1,2}},
    [51005]={id=51005,rand={{10,10,800},{20,20,200}},attr="atk_per",gold={{1,5000}},color=1,set_id=1,show={10,20}},
    [51006]={id=51006,rand={{10,10,800},{20,20,200}},attr="def_per",gold={{1,5000}},color=1,set_id=1,show={10,20}},
    [51007]={id=51007,rand={{10,10,800},{20,20,200}},attr="hp_max_per",gold={{1,5000}},color=1,set_id=1,show={10,20}},
    [51008]={id=51008,rand={{10,10,800},{20,20,200}},attr="crit_rate",gold={{1,5000}},color=1,set_id=1,show={10,20}},
    [51009]={id=51009,rand={{10,10,800},{20,20,200}},attr="crit_ratio",gold={{1,5000}},color=1,set_id=1,show={10,20}},
    [51010]={id=51010,rand={{10,10,800},{20,20,200}},attr="hit_magic",gold={{1,5000}},color=1,set_id=1,show={10,20}},
    [51011]={id=51011,rand={{10,10,800},{20,20,200}},attr="dodge_magic",gold={{1,5000}},color=1,set_id=1,show={10,20}},
    [51012]={id=51012,rand={{7,9,50},{9,14,450},{14,19,350},{19,21,100},{21,24,50}},attr="atk",gold={{1,10000}},color=2,set_id=1,show={7,24}},
    [51013]={id=51013,rand={{3,4,50},{4,6,450},{6,8,350},{8,9,100},{9,10,50}},attr="def",gold={{1,10000}},color=2,set_id=1,show={3,10}},
    [51014]={id=51014,rand={{72,96,50},{96,144,450},{144,192,350},{192,216,100},{216,240,50}},attr="hp_max",gold={{1,10000}},color=2,set_id=1,show={72,240}},
    [51015]={id=51015,rand={{1,1,600},{2,2,300},{3,3,100}},attr="speed",gold={{1,10000}},color=2,set_id=1,show={1,3}},
    [51016]={id=51016,rand={{10,10,600},{20,20,300},{30,30,100}},attr="atk_per",gold={{1,10000}},color=2,set_id=1,show={10,30}},
    [51017]={id=51017,rand={{10,10,600},{20,20,300},{30,30,100}},attr="def_per",gold={{1,10000}},color=2,set_id=1,show={10,30}},
    [51018]={id=51018,rand={{10,10,600},{20,20,300},{30,30,100}},attr="hp_max_per",gold={{1,10000}},color=2,set_id=1,show={10,30}},
    [51019]={id=51019,rand={{10,10,600},{20,20,300},{30,30,100}},attr="crit_rate",gold={{1,10000}},color=2,set_id=1,show={10,30}},
    [51020]={id=51020,rand={{10,10,600},{20,20,300},{30,30,100}},attr="crit_ratio",gold={{1,10000}},color=2,set_id=1,show={10,30}},
    [51021]={id=51021,rand={{10,10,600},{20,20,300},{30,30,100}},attr="hit_magic",gold={{1,10000}},color=2,set_id=1,show={10,30}},
    [51022]={id=51022,rand={{10,10,600},{20,20,300},{30,30,100}},attr="dodge_magic",gold={{1,10000}},color=2,set_id=1,show={10,30}},
    [51023]={id=51023,rand={{10,14,50},{14,21,450},{21,28,350},{28,32,100},{32,36,50}},attr="atk",gold={{1,15000}},color=3,set_id=1,show={10,36}},
    [51024]={id=51024,rand={{4,6,50},{6,9,450},{9,12,350},{12,14,100},{14,16,50}},attr="def",gold={{1,15000}},color=3,set_id=1,show={4,16}},
    [51025]={id=51025,rand={{108,144,50},{144,216,450},{216,288,350},{288,324,100},{324,360,50}},attr="hp_max",gold={{1,15000}},color=3,set_id=1,show={108,360}},
    [51026]={id=51026,rand={{2,2,800},{3,3,200}},attr="speed",gold={{1,15000}},color=3,set_id=1,show={2,3}},
    [51027]={id=51027,rand={{20,20,800},{30,30,200}},attr="atk_per",gold={{1,15000}},color=3,set_id=1,show={20,30}},
    [51028]={id=51028,rand={{20,20,800},{30,30,200}},attr="def_per",gold={{1,15000}},color=3,set_id=1,show={20,30}},
    [51029]={id=51029,rand={{20,20,800},{30,30,200}},attr="hp_max_per",gold={{1,15000}},color=3,set_id=1,show={20,30}},
    [51030]={id=51030,rand={{20,20,800},{30,30,200}},attr="crit_rate",gold={{1,15000}},color=3,set_id=1,show={20,30}},
    [51031]={id=51031,rand={{20,20,800},{30,30,200}},attr="crit_ratio",gold={{1,15000}},color=3,set_id=1,show={20,30}},
    [51032]={id=51032,rand={{20,20,800},{30,30,200}},attr="hit_magic",gold={{1,15000}},color=3,set_id=1,show={20,30}},
    [51033]={id=51033,rand={{20,20,800},{30,30,200}},attr="dodge_magic",gold={{1,15000}},color=3,set_id=1,show={20,30}},
    [51034]={id=51034,rand={{14,19,50},{19,28,450},{28,38,350},{38,43,100},{43,48,50}},attr="atk",gold={{1,20000}},color=4,set_id=1,show={14,48}},
    [51035]={id=51035,rand={{6,8,50},{8,12,450},{12,16,350},{16,18,100},{18,21,50}},attr="def",gold={{1,20000}},color=4,set_id=1,show={6,21}},
    [51036]={id=51036,rand={{144,192,50},{192,288,450},{288,384,350},{384,432,100},{432,480,50}},attr="hp_max",gold={{1,20000}},color=4,set_id=1,show={144,480}},
    [51037]={id=51037,rand={{2,2,600},{3,3,300},{4,4,100}},attr="speed",gold={{1,20000}},color=4,set_id=1,show={2,4}},
    [51038]={id=51038,rand={{20,20,600},{30,30,300},{40,40,100}},attr="atk_per",gold={{1,20000}},color=4,set_id=1,show={20,40}},
    [51039]={id=51039,rand={{20,20,600},{30,30,300},{40,40,100}},attr="def_per",gold={{1,20000}},color=4,set_id=1,show={20,40}},
    [51040]={id=51040,rand={{20,20,600},{30,30,300},{40,40,100}},attr="hp_max_per",gold={{1,20000}},color=4,set_id=1,show={20,40}},
    [51041]={id=51041,rand={{20,20,600},{30,30,300},{40,40,100}},attr="crit_rate",gold={{1,20000}},color=4,set_id=1,show={20,40}},
    [51042]={id=51042,rand={{20,20,600},{30,30,300},{40,40,100}},attr="crit_ratio",gold={{1,20000}},color=4,set_id=1,show={20,40}},
    [51043]={id=51043,rand={{20,20,600},{30,30,300},{40,40,100}},attr="hit_magic",gold={{1,20000}},color=4,set_id=1,show={20,40}},
    [51044]={id=51044,rand={{20,20,600},{30,30,300},{40,40,100}},attr="dodge_magic",gold={{1,20000}},color=4,set_id=1,show={20,40}}},
 [2] = {
    [51045]={id=51045,rand={{3,4,50},{4,7,450},{7,9,350},{9,10,100},{10,12,50}},attr="atk",gold={{1,5000}},color=1,set_id=2,show={3,12}},
    [51046]={id=51046,rand={{2,2,50},{2,4,450},{4,5,350},{5,6,100},{6,7,50}},attr="def",gold={{1,5000}},color=1,set_id=2,show={2,7}},
    [51047]={id=51047,rand={{36,48,50},{48,72,450},{72,96,350},{96,108,100},{108,120,50}},attr="hp_max",gold={{1,5000}},color=1,set_id=2,show={36,120}},
    [51048]={id=51048,rand={{1,1,800},{2,2,200}},attr="speed",gold={{1,5000}},color=1,set_id=2,show={1,2}},
    [51049]={id=51049,rand={{10,10,800},{20,20,200}},attr="atk_per",gold={{1,5000}},color=1,set_id=2,show={10,20}},
    [51050]={id=51050,rand={{10,10,800},{20,20,200}},attr="def_per",gold={{1,5000}},color=1,set_id=2,show={10,20}},
    [51051]={id=51051,rand={{10,10,800},{20,20,200}},attr="hp_max_per",gold={{1,5000}},color=1,set_id=2,show={10,20}},
    [51052]={id=51052,rand={{10,10,800},{20,20,200}},attr="crit_rate",gold={{1,5000}},color=1,set_id=2,show={10,20}},
    [51053]={id=51053,rand={{10,10,800},{20,20,200}},attr="crit_ratio",gold={{1,5000}},color=1,set_id=2,show={10,20}},
    [51054]={id=51054,rand={{10,10,800},{20,20,200}},attr="hit_magic",gold={{1,5000}},color=1,set_id=2,show={10,20}},
    [51055]={id=51055,rand={{10,10,800},{20,20,200}},attr="dodge_magic",gold={{1,5000}},color=1,set_id=2,show={10,20}},
    [51056]={id=51056,rand={{7,9,50},{9,14,450},{14,19,350},{19,21,100},{21,24,50}},attr="atk",gold={{1,10000}},color=2,set_id=2,show={7,24}},
    [51057]={id=51057,rand={{3,4,50},{4,6,450},{6,8,350},{8,9,100},{9,10,50}},attr="def",gold={{1,10000}},color=2,set_id=2,show={3,10}},
    [51058]={id=51058,rand={{72,96,50},{96,144,450},{144,192,350},{192,216,100},{216,240,50}},attr="hp_max",gold={{1,10000}},color=2,set_id=2,show={72,240}},
    [51059]={id=51059,rand={{1,1,600},{2,2,300},{3,3,100}},attr="speed",gold={{1,10000}},color=2,set_id=2,show={1,3}},
    [51060]={id=51060,rand={{10,10,600},{20,20,300},{30,30,100}},attr="atk_per",gold={{1,10000}},color=2,set_id=2,show={10,30}},
    [51061]={id=51061,rand={{10,10,600},{20,20,300},{30,30,100}},attr="def_per",gold={{1,10000}},color=2,set_id=2,show={10,30}},
    [51062]={id=51062,rand={{10,10,600},{20,20,300},{30,30,100}},attr="hp_max_per",gold={{1,10000}},color=2,set_id=2,show={10,30}},
    [51063]={id=51063,rand={{10,10,600},{20,20,300},{30,30,100}},attr="crit_rate",gold={{1,10000}},color=2,set_id=2,show={10,30}},
    [51064]={id=51064,rand={{10,10,600},{20,20,300},{30,30,100}},attr="crit_ratio",gold={{1,10000}},color=2,set_id=2,show={10,30}},
    [51065]={id=51065,rand={{10,10,600},{20,20,300},{30,30,100}},attr="hit_magic",gold={{1,10000}},color=2,set_id=2,show={10,30}},
    [51066]={id=51066,rand={{10,10,600},{20,20,300},{30,30,100}},attr="dodge_magic",gold={{1,10000}},color=2,set_id=2,show={10,30}},
    [51067]={id=51067,rand={{10,14,50},{14,21,450},{21,28,350},{28,32,100},{32,36,50}},attr="atk",gold={{1,15000}},color=3,set_id=2,show={10,36}},
    [51068]={id=51068,rand={{4,6,50},{6,9,450},{9,12,350},{12,14,100},{14,16,50}},attr="def",gold={{1,15000}},color=3,set_id=2,show={4,16}},
    [51069]={id=51069,rand={{108,144,50},{144,216,450},{216,288,350},{288,324,100},{324,360,50}},attr="hp_max",gold={{1,15000}},color=3,set_id=2,show={108,360}},
    [51070]={id=51070,rand={{2,2,800},{3,3,200}},attr="speed",gold={{1,15000}},color=3,set_id=2,show={2,3}},
    [51071]={id=51071,rand={{20,20,800},{30,30,200}},attr="atk_per",gold={{1,15000}},color=3,set_id=2,show={20,30}},
    [51072]={id=51072,rand={{20,20,800},{30,30,200}},attr="def_per",gold={{1,15000}},color=3,set_id=2,show={20,30}},
    [51073]={id=51073,rand={{20,20,800},{30,30,200}},attr="hp_max_per",gold={{1,15000}},color=3,set_id=2,show={20,30}},
    [51074]={id=51074,rand={{20,20,800},{30,30,200}},attr="crit_rate",gold={{1,15000}},color=3,set_id=2,show={20,30}},
    [51075]={id=51075,rand={{20,20,800},{30,30,200}},attr="crit_ratio",gold={{1,15000}},color=3,set_id=2,show={20,30}},
    [51076]={id=51076,rand={{20,20,800},{30,30,200}},attr="hit_magic",gold={{1,15000}},color=3,set_id=2,show={20,30}},
    [51077]={id=51077,rand={{20,20,800},{30,30,200}},attr="dodge_magic",gold={{1,15000}},color=3,set_id=2,show={20,30}},
    [51078]={id=51078,rand={{14,19,50},{19,28,450},{28,38,350},{38,43,100},{43,48,50}},attr="atk",gold={{1,20000}},color=4,set_id=2,show={14,48}},
    [51079]={id=51079,rand={{6,8,50},{8,12,450},{12,16,350},{16,18,100},{18,21,50}},attr="def",gold={{1,20000}},color=4,set_id=2,show={6,21}},
    [51080]={id=51080,rand={{144,192,50},{192,288,450},{288,384,350},{384,432,100},{432,480,50}},attr="hp_max",gold={{1,20000}},color=4,set_id=2,show={144,480}},
    [51081]={id=51081,rand={{2,2,600},{3,3,300},{4,4,100}},attr="speed",gold={{1,20000}},color=4,set_id=2,show={2,4}},
    [51082]={id=51082,rand={{20,20,600},{30,30,300},{40,40,100}},attr="atk_per",gold={{1,20000}},color=4,set_id=2,show={20,40}},
    [51083]={id=51083,rand={{20,20,600},{30,30,300},{40,40,100}},attr="def_per",gold={{1,20000}},color=4,set_id=2,show={20,40}},
    [51084]={id=51084,rand={{20,20,600},{30,30,300},{40,40,100}},attr="hp_max_per",gold={{1,20000}},color=4,set_id=2,show={20,40}},
    [51085]={id=51085,rand={{20,20,600},{30,30,300},{40,40,100}},attr="crit_rate",gold={{1,20000}},color=4,set_id=2,show={20,40}},
    [51086]={id=51086,rand={{20,20,600},{30,30,300},{40,40,100}},attr="crit_ratio",gold={{1,20000}},color=4,set_id=2,show={20,40}},
    [51087]={id=51087,rand={{20,20,600},{30,30,300},{40,40,100}},attr="hit_magic",gold={{1,20000}},color=4,set_id=2,show={20,40}},
    [51088]={id=51088,rand={{20,20,600},{30,30,300},{40,40,100}},attr="dodge_magic",gold={{1,20000}},color=4,set_id=2,show={20,40}}},
 [3] = {
    [51089]={id=51089,rand={{3,4,50},{4,7,450},{7,9,350},{9,10,100},{10,12,50}},attr="atk",gold={{1,5000}},color=1,set_id=3,show={3,12}},
    [51090]={id=51090,rand={{2,2,50},{2,4,450},{4,5,350},{5,6,100},{6,7,50}},attr="def",gold={{1,5000}},color=1,set_id=3,show={2,7}},
    [51091]={id=51091,rand={{36,48,50},{48,72,450},{72,96,350},{96,108,100},{108,120,50}},attr="hp_max",gold={{1,5000}},color=1,set_id=3,show={36,120}},
    [51092]={id=51092,rand={{1,1,800},{2,2,200}},attr="speed",gold={{1,5000}},color=1,set_id=3,show={1,2}},
    [51093]={id=51093,rand={{10,10,800},{20,20,200}},attr="atk_per",gold={{1,5000}},color=1,set_id=3,show={10,20}},
    [51094]={id=51094,rand={{10,10,800},{20,20,200}},attr="def_per",gold={{1,5000}},color=1,set_id=3,show={10,20}},
    [51095]={id=51095,rand={{10,10,800},{20,20,200}},attr="hp_max_per",gold={{1,5000}},color=1,set_id=3,show={10,20}},
    [51096]={id=51096,rand={{10,10,800},{20,20,200}},attr="crit_rate",gold={{1,5000}},color=1,set_id=3,show={10,20}},
    [51097]={id=51097,rand={{10,10,800},{20,20,200}},attr="crit_ratio",gold={{1,5000}},color=1,set_id=3,show={10,20}},
    [51098]={id=51098,rand={{10,10,800},{20,20,200}},attr="hit_magic",gold={{1,5000}},color=1,set_id=3,show={10,20}},
    [51099]={id=51099,rand={{10,10,800},{20,20,200}},attr="dodge_magic",gold={{1,5000}},color=1,set_id=3,show={10,20}},
    [51100]={id=51100,rand={{7,9,50},{9,14,450},{14,19,350},{19,21,100},{21,24,50}},attr="atk",gold={{1,10000}},color=2,set_id=3,show={7,24}},
    [51101]={id=51101,rand={{3,4,50},{4,6,450},{6,8,350},{8,9,100},{9,10,50}},attr="def",gold={{1,10000}},color=2,set_id=3,show={3,10}},
    [51102]={id=51102,rand={{72,96,50},{96,144,450},{144,192,350},{192,216,100},{216,240,50}},attr="hp_max",gold={{1,10000}},color=2,set_id=3,show={72,240}},
    [51103]={id=51103,rand={{1,1,600},{2,2,300},{3,3,100}},attr="speed",gold={{1,10000}},color=2,set_id=3,show={1,3}},
    [51104]={id=51104,rand={{10,10,600},{20,20,300},{30,30,100}},attr="atk_per",gold={{1,10000}},color=2,set_id=3,show={10,30}},
    [51105]={id=51105,rand={{10,10,600},{20,20,300},{30,30,100}},attr="def_per",gold={{1,10000}},color=2,set_id=3,show={10,30}},
    [51106]={id=51106,rand={{10,10,600},{20,20,300},{30,30,100}},attr="hp_max_per",gold={{1,10000}},color=2,set_id=3,show={10,30}},
    [51107]={id=51107,rand={{10,10,600},{20,20,300},{30,30,100}},attr="crit_rate",gold={{1,10000}},color=2,set_id=3,show={10,30}},
    [51108]={id=51108,rand={{10,10,600},{20,20,300},{30,30,100}},attr="crit_ratio",gold={{1,10000}},color=2,set_id=3,show={10,30}},
    [51109]={id=51109,rand={{10,10,600},{20,20,300},{30,30,100}},attr="hit_magic",gold={{1,10000}},color=2,set_id=3,show={10,30}},
    [51110]={id=51110,rand={{10,10,600},{20,20,300},{30,30,100}},attr="dodge_magic",gold={{1,10000}},color=2,set_id=3,show={10,30}},
    [51111]={id=51111,rand={{10,14,50},{14,21,450},{21,28,350},{28,32,100},{32,36,50}},attr="atk",gold={{1,15000}},color=3,set_id=3,show={10,36}},
    [51112]={id=51112,rand={{4,6,50},{6,9,450},{9,12,350},{12,14,100},{14,16,50}},attr="def",gold={{1,15000}},color=3,set_id=3,show={4,16}},
    [51113]={id=51113,rand={{108,144,50},{144,216,450},{216,288,350},{288,324,100},{324,360,50}},attr="hp_max",gold={{1,15000}},color=3,set_id=3,show={108,360}},
    [51114]={id=51114,rand={{2,2,800},{3,3,200}},attr="speed",gold={{1,15000}},color=3,set_id=3,show={2,3}},
    [51115]={id=51115,rand={{20,20,800},{30,30,200}},attr="atk_per",gold={{1,15000}},color=3,set_id=3,show={20,30}},
    [51116]={id=51116,rand={{20,20,800},{30,30,200}},attr="def_per",gold={{1,15000}},color=3,set_id=3,show={20,30}},
    [51117]={id=51117,rand={{20,20,800},{30,30,200}},attr="hp_max_per",gold={{1,15000}},color=3,set_id=3,show={20,30}},
    [51118]={id=51118,rand={{20,20,800},{30,30,200}},attr="crit_rate",gold={{1,15000}},color=3,set_id=3,show={20,30}},
    [51119]={id=51119,rand={{20,20,800},{30,30,200}},attr="crit_ratio",gold={{1,15000}},color=3,set_id=3,show={20,30}},
    [51120]={id=51120,rand={{20,20,800},{30,30,200}},attr="hit_magic",gold={{1,15000}},color=3,set_id=3,show={20,30}},
    [51121]={id=51121,rand={{20,20,800},{30,30,200}},attr="dodge_magic",gold={{1,15000}},color=3,set_id=3,show={20,30}},
    [51122]={id=51122,rand={{14,19,50},{19,28,450},{28,38,350},{38,43,100},{43,48,50}},attr="atk",gold={{1,20000}},color=4,set_id=3,show={14,48}},
    [51123]={id=51123,rand={{6,8,50},{8,12,450},{12,16,350},{16,18,100},{18,21,50}},attr="def",gold={{1,20000}},color=4,set_id=3,show={6,21}},
    [51124]={id=51124,rand={{144,192,50},{192,288,450},{288,384,350},{384,432,100},{432,480,50}},attr="hp_max",gold={{1,20000}},color=4,set_id=3,show={144,480}},
    [51125]={id=51125,rand={{2,2,600},{3,3,300},{4,4,100}},attr="speed",gold={{1,20000}},color=4,set_id=3,show={2,4}},
    [51126]={id=51126,rand={{20,20,600},{30,30,300},{40,40,100}},attr="atk_per",gold={{1,20000}},color=4,set_id=3,show={20,40}},
    [51127]={id=51127,rand={{20,20,600},{30,30,300},{40,40,100}},attr="def_per",gold={{1,20000}},color=4,set_id=3,show={20,40}},
    [51128]={id=51128,rand={{20,20,600},{30,30,300},{40,40,100}},attr="hp_max_per",gold={{1,20000}},color=4,set_id=3,show={20,40}},
    [51129]={id=51129,rand={{20,20,600},{30,30,300},{40,40,100}},attr="crit_rate",gold={{1,20000}},color=4,set_id=3,show={20,40}},
    [51130]={id=51130,rand={{20,20,600},{30,30,300},{40,40,100}},attr="crit_ratio",gold={{1,20000}},color=4,set_id=3,show={20,40}},
    [51131]={id=51131,rand={{20,20,600},{30,30,300},{40,40,100}},attr="hit_magic",gold={{1,20000}},color=4,set_id=3,show={20,40}},
    [51132]={id=51132,rand={{20,20,600},{30,30,300},{40,40,100}},attr="dodge_magic",gold={{1,20000}},color=4,set_id=3,show={20,40}}}
}
Config.PartnerRefineData.data_partner_refine_fun = function(key)
    local data =Config.PartnerRefineData.data_partner_refine[key]
    if DATA_DEBUG and data == nil then
        print('( Config.PartnerRefineData.data_partner_refine['..key..'])not found') return
    end
    return data
end
---------------------data_partner_refine end--------------------

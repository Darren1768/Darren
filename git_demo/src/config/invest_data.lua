--[[
        invest_data.lua
        exported by excel2lua.py
        from file:invest_data.xlsx
--]]


Config = Config or {}
Config.InvestData = Config.InvestData or {}

---------------------data_invest_lev start--------------------
Config.InvestData.data_invest_lev_length = 11
Config.InvestData.data_invest_lev = {
 [1] = {items={{2,888}},lev=1},
 [15] = {items={{2,388}},lev=15},
 [25] = {items={{2,488}},lev=25},
 [30] = {items={{2,588}},lev=30},
 [32] = {items={{2,688}},lev=32},
 [34] = {items={{2,688}},lev=34},
 [36] = {items={{2,888}},lev=36},
 [40] = {items={{2,888}},lev=40},
 [45] = {items={{2,988}},lev=45},
 [50] = {items={{2,988}},lev=50},
 [60] = {items={{2,1088}},lev=60}
}
Config.InvestData.data_invest_lev_fun = function(key)
    local data =Config.InvestData.data_invest_lev[key]
    if DATA_DEBUG and data == nil then
        print('( Config.InvestData.data_invest_lev['..key..'])not found') return
    end
    return data
end
---------------------data_invest_lev end--------------------
---------------------data_invest_day start--------------------
Config.InvestData.data_invest_day_length = 7
Config.InvestData.data_invest_day = {
 [1] = {day=1,items={{2,880},{1,200000}}},
 [2] = {day=2,items={{2,388},{1,200000}}},
 [3] = {day=3,items={{2,488},{1,200000}}},
 [4] = {day=4,items={{2,588},{1,200000}}},
 [5] = {day=5,items={{2,688},{1,200000}}},
 [6] = {day=6,items={{2,888},{1,200000}}},
 [7] = {day=7,items={{2,1088},{1,200000}}}
}
Config.InvestData.data_invest_day_fun = function(key)
    local data =Config.InvestData.data_invest_day[key]
    if DATA_DEBUG and data == nil then
        print('( Config.InvestData.data_invest_day['..key..'])not found') return
    end
    return data
end
---------------------data_invest_day end--------------------

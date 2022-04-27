--[[
        cross_hall_data.lua
        exported by excel2lua.py
        from file:cross_hall_data.xlsx
--]]


Config = Config or {}
Config.CrossHallData = Config.CrossHallData or {}

---------------------data_const start--------------------
Config.CrossHallData.data_const_length = 5
Config.CrossHallData.data_const = {
 ["hall_map"] = {desc="副本大厅地图ID",key="hall_map",val=10003},
 ["hall_max_num"] = {desc="大厅人数上限",key="hall_max_num",val=30},
 ["initial_hall_num"] = {desc="初始大厅数量",key="initial_hall_num",val=4},
 ["join_lev"] = {desc="副本大厅进入等级",key="join_lev",val=50},
 ["join_point"] = {desc="进入地图位置",key="join_point",val={{1260,720},{1380,690},{1560,720},{1770,720},{1710,930},{1530,930},{1380,900}}}
}
Config.CrossHallData.data_const_fun = function(key)
    local data =Config.CrossHallData.data_const[key]
    if DATA_DEBUG and data == nil then
        print('( Config.CrossHallData.data_const['..key..'])not found') return
    end
    return data
end
---------------------data_const end--------------------

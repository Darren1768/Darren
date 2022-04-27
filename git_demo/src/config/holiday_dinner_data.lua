--[[
        holiday_dinner_data.lua
        exported by excel2lua.py
        from file:holiday_dinner_data.xlsx
--]]


Config = Config or {}
Config.HolidayDinnerData = Config.HolidayDinnerData or {}

---------------------data_happy_list start--------------------
Config.HolidayDinnerData.data_happy_list_length = 4
Config.HolidayDinnerData.data_happy_list = {
 [6000] = {happy_val=6000,rewards={{81141,1}}},
 [12000] = {happy_val=12000,rewards={{81141,1}}},
 [18000] = {happy_val=18000,rewards={{81141,1}}},
 [25000] = {happy_val=25000,rewards={{81140,1}}}
}
Config.HolidayDinnerData.data_happy_list_fun = function(key)
    local data =Config.HolidayDinnerData.data_happy_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.HolidayDinnerData.data_happy_list['..key..'])not found') return
    end
    return data
end
---------------------data_happy_list end--------------------
---------------------data_const_data start--------------------
Config.HolidayDinnerData.data_const_data_length = 1
Config.HolidayDinnerData.data_const_data = {
 ["cost_item"] = {desc="消耗道具",key="cost_item",val=14804}
}
Config.HolidayDinnerData.data_const_data_fun = function(key)
    local data =Config.HolidayDinnerData.data_const_data[key]
    if DATA_DEBUG and data == nil then
        print('( Config.HolidayDinnerData.data_const_data['..key..'])not found') return
    end
    return data
end
---------------------data_const_data end--------------------
---------------------data_item_data start--------------------
Config.HolidayDinnerData.data_item_data_length = 1
Config.HolidayDinnerData.data_item_data = {
 [14804] = {base_id=14804,happy_val=1}
}
Config.HolidayDinnerData.data_item_data_fun = function(key)
    local data =Config.HolidayDinnerData.data_item_data[key]
    if DATA_DEBUG and data == nil then
        print('( Config.HolidayDinnerData.data_item_data['..key..'])not found') return
    end
    return data
end
---------------------data_item_data end--------------------

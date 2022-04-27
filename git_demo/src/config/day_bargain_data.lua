--[[
        day_bargain_data.lua
        exported by excel2lua.py
        from file:day_bargain_data.xlsx
--]]


Config = Config or {}
Config.DayBargainData = Config.DayBargainData or {}

---------------------data_const start--------------------
Config.DayBargainData.data_const_length = 2
Config.DayBargainData.data_const = {
 ["vip_gift_id"] = {label="vip_gift_id",val=10},
 ["vip_lev"] = {label="vip_lev",val=6}
}
Config.DayBargainData.data_const_fun = function(key)
    local data =Config.DayBargainData.data_const[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DayBargainData.data_const['..key..'])not found') return
    end
    return data
end
---------------------data_const end--------------------
---------------------data_info start--------------------
Config.DayBargainData.data_info_length = 4
Config.DayBargainData.data_info = {
 [10] = {id=10,name="超值三星",open_day=7,return_award={{2,150}},return_day=7,award={{80019,1},{20023,30},{2,1280},{1,500000}},charge_num=128,effect_list={{80019,1,0},{2,1,0},{10401,1,0},{10220,1,0}},charge_id=26,time=1},
 [20] = {id=20,name="豪华三星",open_day=7,return_award={{2,200}},return_day=7,award={{10220,1},{10212,1},{2,1980},{1,500000}},charge_num=198,effect_list={{80011,1,0},{2,1,0},{10401,1,0},{10220,1,0}},charge_id=27,time=15},
 [30] = {id=30,name="超强橙装",open_day=7,return_award={{2,250}},return_day=7,award={{81109,1},{20023,50},{2,3280},{1,1000000}},charge_num=328,effect_list={{30202,1,0},{10212,1,0},{2,1,0},{81109,1,0}},charge_id=28,time=7},
 [40] = {id=40,name="极品红装",open_day=7,return_award={{2,300}},return_day=7,award={{81110,1},{10212,2},{2,6480},{1,1000000}},charge_num=648,effect_list={{30202,1,0},{10212,1,0},{2,1,0},{81110,1,0}},charge_id=29,time=15}
}
Config.DayBargainData.data_info_fun = function(key)
    local data =Config.DayBargainData.data_info[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DayBargainData.data_info['..key..'])not found') return
    end
    return data
end
---------------------data_info end--------------------

--[[
        holiday_rand_data.lua
        exported by excel2lua.py
        from file:holiday_rand_data.xlsx
--]]


Config = Config or {}
Config.HolidayRandData = Config.HolidayRandData or {}

Config.HolidayRandData.data_const = {
}
---------------------data_charge_zhuan start--------------------
Config.HolidayRandData.data_charge_zhuan_length = 14
Config.HolidayRandData.data_charge_zhuan = {
 [1] = {id=1,must=50,min=15,base_id=20027,num=80,max=50,lucky=0,is_reset=1,rand=1,group=1,is_notice=1,type=3},
 [2] = {id=2,must=0,min=0,base_id=15101,num=1,max=0,lucky=1,is_reset=0,rand=40,group=1,is_notice=0,type=1},
 [3] = {id=3,must=50,min=15,base_id=15102,num=1,max=50,lucky=0,is_reset=1,rand=25,group=1,is_notice=1,type=3},
 [4] = {id=4,must=0,min=0,base_id=15030,num=2,max=0,lucky=1,is_reset=0,rand=80,group=1,is_notice=0,type=1},
 [5] = {id=5,must=0,min=0,base_id=15002,num=5,max=0,lucky=1,is_reset=0,rand=150,group=1,is_notice=0,type=1},
 [6] = {id=6,must=0,min=0,base_id=10213,num=2,max=0,lucky=1,is_reset=0,rand=75,group=1,is_notice=1,type=1},
 [7] = {id=7,must=0,min=0,base_id=10214,num=10,max=0,lucky=1,is_reset=0,rand=150,group=1,is_notice=0,type=1},
 [8] = {id=8,must=50,min=15,base_id=10212,num=1,max=50,lucky=0,is_reset=1,rand=10,group=1,is_notice=1,type=3},
 [9] = {id=9,must=0,min=0,base_id=10401,num=1,max=0,lucky=1,is_reset=0,rand=80,group=1,is_notice=0,type=1},
 [10] = {id=10,must=0,min=0,base_id=15012,num=1,max=0,lucky=1,is_reset=0,rand=50,group=1,is_notice=0,type=1},
 [11] = {id=11,must=0,min=0,base_id=15010,num=2,max=0,lucky=1,is_reset=0,rand=80,group=1,is_notice=0,type=1},
 [12] = {id=12,must=0,min=0,base_id=20027,num=2,max=0,lucky=1,is_reset=0,rand=80,group=1,is_notice=0,type=1},
 [13] = {id=13,must=0,min=0,base_id=15000,num=1,max=0,lucky=0,is_reset=1,rand=100,group=1,is_notice=1,type=3},
 [14] = {id=14,must=0,min=0,base_id=1,num=100000,max=0,lucky=1,is_reset=0,rand=79,group=1,is_notice=0,type=1}
}
Config.HolidayRandData.data_charge_zhuan_fun = function(key)
    local data =Config.HolidayRandData.data_charge_zhuan[key]
    if DATA_DEBUG and data == nil then
        print('( Config.HolidayRandData.data_charge_zhuan['..key..'])not found') return
    end
    return data
end
---------------------data_charge_zhuan end--------------------
---------------------data_reward start--------------------
Config.HolidayRandData.data_reward_length = 30
Config.HolidayRandData.data_reward = {
 [1] = {id=1,base_id=10220,l_can=5,is_worth=1,is_notice=0,group=1,num=1,rand=100},
 [2] = {id=2,base_id=1,l_can=0,is_worth=0,is_notice=0,group=1,num=2000000,rand=200},
 [3] = {id=3,base_id=81100,l_can=0,is_worth=1,is_notice=0,group=1,num=1,rand=100},
 [4] = {id=4,base_id=2,l_can=5,is_worth=0,is_notice=0,group=1,num=1000,rand=200},
 [5] = {id=5,base_id=10401,l_can=0,is_worth=0,is_notice=0,group=1,num=10,rand=150},
 [6] = {id=6,base_id=10212,l_can=0,is_worth=1,is_notice=0,group=1,num=1,rand=50},
 [7] = {id=7,base_id=81101,l_can=0,is_worth=1,is_notice=1,group=1,num=1,rand=25},
 [8] = {id=8,base_id=10213,l_can=0,is_worth=0,is_notice=0,group=1,num=20,rand=50},
 [9] = {id=9,base_id=10221,l_can=8,is_worth=1,is_notice=1,group=1,num=1,rand=25},
 [10] = {id=10,base_id=10201,l_can=5,is_worth=0,is_notice=0,group=1,num=10,rand=100},
 [11] = {id=11,base_id=10220,l_can=5,is_worth=1,is_notice=0,group=2,num=1,rand=100},
 [12] = {id=12,base_id=1,l_can=0,is_worth=0,is_notice=0,group=2,num=3000000,rand=200},
 [13] = {id=13,base_id=10212,l_can=0,is_worth=1,is_notice=0,group=2,num=1,rand=50},
 [14] = {id=14,base_id=2,l_can=0,is_worth=0,is_notice=0,group=2,num=2000,rand=150},
 [15] = {id=15,base_id=10401,l_can=0,is_worth=0,is_notice=0,group=2,num=20,rand=150},
 [16] = {id=16,base_id=81102,l_can=0,is_worth=1,is_notice=0,group=2,num=1,rand=125},
 [17] = {id=17,base_id=10222,l_can=8,is_worth=1,is_notice=1,group=2,num=1,rand=25},
 [18] = {id=18,base_id=10213,l_can=0,is_worth=0,is_notice=0,group=2,num=30,rand=50},
 [19] = {id=19,base_id=81103,l_can=5,is_worth=1,is_notice=1,group=2,num=1,rand=50},
 [20] = {id=20,base_id=10201,l_can=5,is_worth=0,is_notice=0,group=2,num=20,rand=100},
 [21] = {id=21,base_id=10220,l_can=5,is_worth=1,is_notice=0,group=3,num=2,rand=150},
 [22] = {id=22,base_id=1,l_can=0,is_worth=0,is_notice=0,group=3,num=5000000,rand=200},
 [23] = {id=23,base_id=81106,l_can=5,is_worth=1,is_notice=0,group=3,num=1,rand=100},
 [24] = {id=24,base_id=2,l_can=0,is_worth=0,is_notice=0,group=3,num=3000,rand=150},
 [25] = {id=25,base_id=10401,l_can=0,is_worth=0,is_notice=0,group=3,num=30,rand=150},
 [26] = {id=26,base_id=10212,l_can=0,is_worth=1,is_notice=0,group=3,num=2,rand=50},
 [27] = {id=27,base_id=81105,l_can=5,is_worth=1,is_notice=1,group=3,num=1,rand=25},
 [28] = {id=28,base_id=10213,l_can=0,is_worth=0,is_notice=0,group=3,num=40,rand=50},
 [29] = {id=29,base_id=10201,l_can=6,is_worth=0,is_notice=0,group=3,num=30,rand=100},
 [30] = {id=30,base_id=10223,l_can=8,is_worth=1,is_notice=1,group=3,num=1,rand=25}
}
Config.HolidayRandData.data_reward_fun = function(key)
    local data =Config.HolidayRandData.data_reward[key]
    if DATA_DEBUG and data == nil then
        print('( Config.HolidayRandData.data_reward['..key..'])not found') return
    end
    return data
end
---------------------data_reward end--------------------

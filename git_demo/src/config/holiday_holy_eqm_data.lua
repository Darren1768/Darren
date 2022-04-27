--[[
        holiday_holy_eqm_data.lua
        exported by excel2lua.py
        from file:holiday_holy_eqm_data.xlsx
--]]


Config = Config or {}
Config.HolidayHolyEqmData = Config.HolidayHolyEqmData or {}

Config.HolidayHolyEqmData.data_constant = {
}
---------------------data_reward_list start--------------------
Config.HolidayHolyEqmData.data_reward_list_length = 5
Config.HolidayHolyEqmData.data_reward_list = {
 [1] = {
    [1]={id=1,limit_type=4,award={{3,1280},{39497,1},{17201,20},{10030,80}},max_dun_id=10049,limit_week=0,limit_month=0,limit_day=0,limit_all=1,min_dun_id=10001,charge_id=725,f_id=1,price=128},
    [2]={id=2,limit_type=2,award={{3,1280},{17201,32},{28,120},{1,2000000}},max_dun_id=10049,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10001,charge_id=721,f_id=1,price=128},
    [3]={id=3,limit_type=2,award={{3,3280},{17201,68},{28,300},{1,5000000}},max_dun_id=10049,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10001,charge_id=722,f_id=1,price=328}},
 [2] = {
    [1]={id=1,limit_type=4,award={{3,1980},{39501,1},{17202,26},{10030,120}},max_dun_id=10089,limit_week=0,limit_month=0,limit_day=0,limit_all=1,min_dun_id=10050,charge_id=726,f_id=2,price=198},
    [2]={id=2,limit_type=2,award={{3,1280},{17202,32},{28,120},{1,2000000}},max_dun_id=10089,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10050,charge_id=721,f_id=2,price=128},
    [3]={id=3,limit_type=2,award={{3,3280},{17202,68},{28,300},{1,5000000}},max_dun_id=10089,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10050,charge_id=722,f_id=2,price=328}},
 [3] = {
    [1]={id=1,limit_type=4,award={{3,3280},{39505,1},{17203,36},{10030,220}},max_dun_id=10159,limit_week=0,limit_month=0,limit_day=0,limit_all=1,min_dun_id=10090,charge_id=727,f_id=3,price=328},
    [2]={id=2,limit_type=2,award={{3,1280},{17203,32},{28,120},{1,2000000}},max_dun_id=10159,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10090,charge_id=721,f_id=3,price=128},
    [3]={id=3,limit_type=2,award={{3,3280},{17203,68},{28,300},{1,5000000}},max_dun_id=10159,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10090,charge_id=722,f_id=3,price=328}},
 [4] = {
    [1]={id=1,limit_type=4,award={{3,4480},{39509,1},{17204,42},{10030,300}},max_dun_id=10249,limit_week=0,limit_month=0,limit_day=0,limit_all=1,min_dun_id=10160,charge_id=728,f_id=4,price=448},
    [2]={id=2,limit_type=2,award={{3,1280},{17204,32},{28,120},{1,2000000}},max_dun_id=10249,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10160,charge_id=721,f_id=4,price=128},
    [3]={id=3,limit_type=2,award={{3,3280},{17204,68},{28,300},{1,5000000}},max_dun_id=10249,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10160,charge_id=722,f_id=4,price=328}},
 [5] = {
    [1]={id=1,limit_type=4,award={{3,4480},{39509,1},{17205,42},{10030,300}},max_dun_id=10350,limit_week=0,limit_month=0,limit_day=0,limit_all=1,min_dun_id=10250,charge_id=728,f_id=5,price=448},
    [2]={id=2,limit_type=2,award={{3,1280},{17205,32},{28,120},{1,2000000}},max_dun_id=10350,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10250,charge_id=721,f_id=5,price=128},
    [3]={id=3,limit_type=2,award={{3,3280},{17205,68},{28,300},{1,5000000}},max_dun_id=10350,limit_week=3,limit_month=0,limit_day=0,limit_all=0,min_dun_id=10250,charge_id=722,f_id=5,price=328}}
}
Config.HolidayHolyEqmData.data_reward_list_fun = function(key)
    local data =Config.HolidayHolyEqmData.data_reward_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.HolidayHolyEqmData.data_reward_list['..key..'])not found') return
    end
    return data
end
---------------------data_reward_list end--------------------

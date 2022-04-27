--[[
        login_days_data.lua
        exported by excel2lua.py
        from file:login_days_data.xlsx
--]]


Config = Config or {}
Config.LoginDaysData = Config.LoginDaysData or {}

---------------------data_day start--------------------
Config.LoginDaysData.data_day_length = 7
Config.LoginDaysData.data_day = {
 [1] = {action=5,next_desc="明日领奥丁",name="第一天",pos={{281,104}},reward_desc="这是一个很厉害的描述这是一个很厉害的描述",rewards={{3,200},{10001,100},{1,20000},{22,20000}},is_spe_day=0,desc="钻石200",icon=505,day=1,day_desc="领大量钻石",spec_reward={4}},
 [2] = {action=4,next_desc="明日美杜莎",name="第二天",pos={{318,102}},reward_desc="这是一个很厉害的描述这是一个很厉害的描述",rewards={{26900,50},{10001,150},{1,30000},{22,30000}},is_spe_day=1,desc="五星奥丁",icon=5051,day=2,day_desc="领五星奥丁",spec_reward={26016}},
 [3] = {action=6,next_desc="明日领橙武",name="第三天",pos={{294,102}},reward_desc="这是一个很厉害的描述这是一个很厉害的描述",rewards={{26904,50},{10001,200},{1,50000},{22,50000}},is_spe_day=1,desc="五星美杜莎",icon=505,day=3,day_desc="领美杜莎",spec_reward={10402}},
 [4] = {action=7,next_desc="明日高级券",name="第四天",pos={{301,104}},reward_desc="这是一个很厉害的描述这是一个很厉害的描述",rewards={{40108,1},{40308,1},{40208,1},{22,50000}},is_spe_day=0,desc="全套橙武",icon=505,day=4,day_desc="领橙武",spec_reward={44105}},
 [5] = {action=2,next_desc="明日刻印石",name="第五天",pos={{257,103}},reward_desc="这是一个很厉害的描述这是一个很厉害的描述",rewards={{37002,1},{10002,5},{1,100000},{22,80000}},is_spe_day=0,desc="高级寻宝",icon=505,day=5,day_desc="领寻宝券",spec_reward={60033}},
 [6] = {action=3,next_desc="明日先知水晶",name="第六天",pos={{293,104}},reward_desc="这是一个很厉害的描述这是一个很厉害的描述",rewards={{72003,1},{72001,10},{1,120000},{22,100000}},is_spe_day=0,desc="神器刻印石",icon=505,day=6,day_desc="领刻印石",spec_reward={35113}},
 [7] = {action=9,next_desc="领先知水晶",name="第七天",pos={{275,71}},reward_desc="这是一个很厉害的描述这是一个很厉害的描述",rewards={{14001,1},{10001,300},{1,150000},{22,150000}},is_spe_day=0,desc="先知水晶",icon=5052,day=7,day_desc="领先知水晶",spec_reward={26055}}
}
Config.LoginDaysData.data_day_fun = function(key)
    local data =Config.LoginDaysData.data_day[key]
    if DATA_DEBUG and data == nil then
        print('( Config.LoginDaysData.data_day['..key..'])not found') return
    end
    return data
end
---------------------data_day end--------------------

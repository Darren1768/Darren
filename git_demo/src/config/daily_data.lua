--[[
        daily_data.lua
        exported by excel2lua.py
        from file:daily_data.xlsx
--]]


Config = Config or {}
Config.DailyData = Config.DailyData or {}

---------------------data_huoli start--------------------
Config.DailyData.data_huoli_length = 5
Config.DailyData.data_huoli = {
 [100] = {items={{30000,1,1}},num=100},
 [200] = {items={{30001,1,1}},num=200},
 [300] = {items={{30002,1,1}},num=300},
 [400] = {items={{30003,1,1}},num=400},
 [500] = {items={{30004,1,1}},num=500}
}
Config.DailyData.data_huoli_fun = function(key)
    local data =Config.DailyData.data_huoli[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DailyData.data_huoli['..key..'])not found') return
    end
    return data
end
---------------------data_huoli end--------------------
---------------------data_richanghuodong start--------------------
Config.DailyData.data_richanghuodong_length = 2
Config.DailyData.data_richanghuodong = {
 [111] = {id=111,limit_time={},limit_lev=1,add_huoli={{1,99,100}},limit_week={},name="狂暴魂兽",max_num=6,open_time_str="定时刷新",item_show={{30000,1},{30001,1},{30002,1},{30003,1}},is_use=1,ico=1,cli_state=0,cli_assets="baotu",ord=11,desc="这是狂暴魂兽的描述",desc_time="全天开启，2点刷新次数",desc_cond="等级达到1级",type=2},
 [112] = {id=112,limit_time={},limit_lev=1,add_huoli={{1,99,100}},limit_week={},name="剧情副本",max_num=3,item_show={{30000,1},{30001,1},{30002,1},{30003,2}},is_use=1,ico=1,cli_state=0,cli_assets="baotu",ord=11,desc="这是剧情副本的描述",desc_time="全天开启",desc_cond="等级达到1级",type=1}
}
Config.DailyData.data_richanghuodong_fun = function(key)
    local data =Config.DailyData.data_richanghuodong[key]
    if DATA_DEBUG and data == nil then
        print('( Config.DailyData.data_richanghuodong['..key..'])not found') return
    end
    return data
end
---------------------data_richanghuodong end--------------------
Config.DailyData.data_constant = {
}

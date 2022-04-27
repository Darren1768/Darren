--[[
        action_rank_data.lua
        exported by excel2lua.py
        from file:action_rank_data.xlsx
--]]


Config = Config or {}
Config.ActionRankData = Config.ActionRankData or {}

---------------------data_get start--------------------
Config.ActionRankData.data_get_length = 2
Config.ActionRankData.data_get = {
 [199001] = {
    [1]={first_desc="最高星阶",tab_name="星阶",sort_val=1,item_type=1,title_list={{'排名',145},{'名称',200},{'英雄',152},{'星阶',163}}},
    [2]={first_desc="最高等级",tab_name="等级",sort_val=2,item_type=2,title_list={{'排名',145},{'名称',200},{'英雄',152},{'等级',163}}}},
 [199002] = {
    [1]={first_desc="最高名次",sort_val=1,item_type=3,title_list={{'排名',145},{'名称',200},{'次数',315}}}}
}
Config.ActionRankData.data_get_fun = function(key)
    local data =Config.ActionRankData.data_get[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ActionRankData.data_get['..key..'])not found') return
    end
    return data
end
---------------------data_get end--------------------

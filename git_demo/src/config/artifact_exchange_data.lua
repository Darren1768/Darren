--[[
        artifact_exchange_data.lua
        exported by excel2lua.py
        from file:artifact_exchange_data.xlsx
--]]


Config = Config or {}
Config.ArtifactExchangeData = Config.ArtifactExchangeData or {}

---------------------data_vip_lev start--------------------
Config.ArtifactExchangeData.data_vip_lev_length = 16
Config.ArtifactExchangeData.data_vip_lev = {
 [0] = {free=1,max=10,vip_lev=0},
 [1] = {free=2,max=15,vip_lev=1},
 [2] = {free=3,max=20,vip_lev=2},
 [3] = {free=4,max=25,vip_lev=3},
 [4] = {free=5,max=30,vip_lev=4},
 [5] = {free=6,max=35,vip_lev=5},
 [6] = {free=7,max=40,vip_lev=6},
 [7] = {free=8,max=45,vip_lev=7},
 [8] = {free=9,max=50,vip_lev=8},
 [9] = {free=10,max=55,vip_lev=9},
 [10] = {free=11,max=60,vip_lev=10},
 [11] = {free=12,max=65,vip_lev=11},
 [12] = {free=13,max=70,vip_lev=12},
 [13] = {free=14,max=75,vip_lev=13},
 [14] = {free=15,max=80,vip_lev=14},
 [15] = {free=16,max=90,vip_lev=15}
}
Config.ArtifactExchangeData.data_vip_lev_fun = function(key)
    local data =Config.ArtifactExchangeData.data_vip_lev[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ArtifactExchangeData.data_vip_lev['..key..'])not found') return
    end
    return data
end
---------------------data_vip_lev end--------------------
---------------------data_artifact_exchange_const start--------------------
Config.ArtifactExchangeData.data_artifact_exchange_const_length = 6
Config.ArtifactExchangeData.data_artifact_exchange_const = {
 ["cost_gold"] = {desc="刷新神秘商店的钻石数",key="cost_gold",val=10},
 ["mall_def"] = {desc="初始格子数",key="mall_def",val=6},
 ["mall_max"] = {desc="最大格子数",key="mall_max",val=6},
 ["open_lev"] = {desc="解锁神器商城等级",key="open_lev",val=35},
 ["ref_cost"] = {desc="刷新商城消耗资产",key="ref_cost",val={20,50}},
 ["ref_time"] = {desc="商城刷新时间",key="ref_time",val={21,0,0}}
}
Config.ArtifactExchangeData.data_artifact_exchange_const_fun = function(key)
    local data =Config.ArtifactExchangeData.data_artifact_exchange_const[key]
    if DATA_DEBUG and data == nil then
        print('( Config.ArtifactExchangeData.data_artifact_exchange_const['..key..'])not found') return
    end
    return data
end
---------------------data_artifact_exchange_const end--------------------

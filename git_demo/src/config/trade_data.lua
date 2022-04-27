--[[
        trade_data.lua
        exported by excel2lua.py
        from file:trade_data.xlsx
--]]


Config = Config or {}
Config.TradeData = Config.TradeData or {}

---------------------data_trade_use start--------------------
Config.TradeData.data_trade_use_length = 3
Config.TradeData.data_trade_use = {
 [1] = {
    [1]={loss=20,count=1,type=1},
    [2]={loss=20,count=2,type=1},
    [3]={loss=30,count=3,type=1},
    [4]={loss=30,count=4,type=1},
    [5]={loss=30,count=5,type=1},
    [6]={loss=30,count=6,type=1},
    [7]={loss=30,count=7,type=1},
    [8]={loss=30,count=8,type=1},
    [9]={loss=40,count=9,type=1},
    [10]={loss=40,count=10,type=1},
    [11]={loss=40,count=11,type=1},
    [12]={loss=40,count=12,type=1},
    [13]={loss=40,count=13,type=1},
    [14]={loss=40,count=14,type=1},
    [15]={loss=40,count=15,type=1},
    [16]={loss=50,count=16,type=1},
    [17]={loss=50,count=17,type=1},
    [18]={loss=50,count=18,type=1},
    [19]={loss=50,count=19,type=1},
    [20]={loss=50,count=20,type=1},
    [21]={loss=50,count=21,type=1},
    [22]={loss=50,count=22,type=1},
    [23]={loss=50,count=23,type=1},
    [24]={loss=50,count=24,type=1},
    [25]={loss=50,count=25,type=1},
    [26]={loss=60,count=26,type=1},
    [27]={loss=60,count=27,type=1},
    [28]={loss=60,count=28,type=1},
    [29]={loss=60,count=29,type=1},
    [30]={loss=60,count=30,type=1},
    [31]={loss=60,count=31,type=1},
    [32]={loss=60,count=32,type=1},
    [33]={loss=60,count=33,type=1},
    [34]={loss=60,count=34,type=1},
    [35]={loss=60,count=35,type=1}},
 [2] = {
    [1]={loss=20,count=1,type=2},
    [2]={loss=20,count=2,type=2},
    [3]={loss=30,count=3,type=2},
    [4]={loss=30,count=4,type=2},
    [5]={loss=30,count=5,type=2},
    [6]={loss=30,count=6,type=2},
    [7]={loss=30,count=7,type=2},
    [8]={loss=30,count=8,type=2},
    [9]={loss=40,count=9,type=2},
    [10]={loss=40,count=10,type=2},
    [11]={loss=40,count=11,type=2},
    [12]={loss=40,count=12,type=2},
    [13]={loss=40,count=13,type=2},
    [14]={loss=40,count=14,type=2},
    [15]={loss=40,count=15,type=2},
    [16]={loss=60,count=16,type=2},
    [17]={loss=60,count=17,type=2},
    [18]={loss=60,count=18,type=2},
    [19]={loss=60,count=19,type=2},
    [20]={loss=60,count=20,type=2},
    [21]={loss=60,count=21,type=2},
    [22]={loss=60,count=22,type=2},
    [23]={loss=60,count=23,type=2},
    [24]={loss=60,count=24,type=2},
    [25]={loss=60,count=25,type=2}},
 [3] = {
    [1]={loss=50,count=1,type=3},
    [2]={loss=50,count=2,type=3},
    [3]={loss=100,count=3,type=3},
    [4]={loss=100,count=4,type=3},
    [5]={loss=150,count=5,type=3},
    [6]={loss=150,count=6,type=3},
    [7]={loss=200,count=7,type=3},
    [8]={loss=200,count=8,type=3},
    [9]={loss=250,count=9,type=3},
    [10]={loss=300,count=10,type=3},
    [11]={loss=350,count=11,type=3},
    [12]={loss=400,count=12,type=3},
    [13]={loss=450,count=13,type=3},
    [14]={loss=500,count=14,type=3},
    [15]={loss=550,count=15,type=3},
    [16]={loss=600,count=16,type=3},
    [17]={loss=650,count=17,type=3},
    [18]={loss=700,count=18,type=3},
    [19]={loss=750,count=19,type=3},
    [20]={loss=800,count=20,type=3},
    [21]={loss=850,count=21,type=3},
    [22]={loss=900,count=22,type=3},
    [23]={loss=950,count=23,type=3},
    [24]={loss=1000,count=24,type=3},
    [25]={loss=1050,count=25,type=3}}
}
Config.TradeData.data_trade_use_fun = function(key)
    local data =Config.TradeData.data_trade_use[key]
    if DATA_DEBUG and data == nil then
        print('( Config.TradeData.data_trade_use['..key..'])not found') return
    end
    return data
end
---------------------data_trade_use end--------------------
---------------------data_trade_event start--------------------
Config.TradeData.data_trade_event_length = 2
Config.TradeData.data_trade_event = {
 [1] = {
    [1]={id=1,res="E51105",action="action1",type=1},
    [2]={id=2,res="E51105",action="action2",type=1},
    [3]={id=3,res="E51105",action="action3",type=1},
    [4]={id=4,res="E51105",action="action4",type=1},
    [5]={id=5,res="E51105",action="action5",type=1}},
 [2] = {
    [1]={id=1,res="E51105",action="action1",type=2},
    [2]={id=2,res="E51105",action="action2",type=2},
    [3]={id=3,res="E51105",action="action3",type=2},
    [4]={id=4,res="E51105",action="action4",type=2},
    [5]={id=5,res="E51105",action="action5",type=2}}
}
Config.TradeData.data_trade_event_fun = function(key)
    local data =Config.TradeData.data_trade_event[key]
    if DATA_DEBUG and data == nil then
        print('( Config.TradeData.data_trade_event['..key..'])not found') return
    end
    return data
end
---------------------data_trade_event end--------------------
---------------------data_trade_base start--------------------
Config.TradeData.data_trade_base_length = 3
Config.TradeData.data_trade_base = {
 [1] = {assets="coin",name="金币",type=1,make_speed={30,40},make_max=50000,ui_desc="4800金币/时"},
 [2] = {assets="partner_exp_all",name="英雄经验",type=2,make_speed={30,4},make_max=5000,ui_desc="480经验/时"},
 [3] = {assets="energy",name="体力",type=3,make_speed={},make_max=100}
}
Config.TradeData.data_trade_base_fun = function(key)
    local data =Config.TradeData.data_trade_base[key]
    if DATA_DEBUG and data == nil then
        print('( Config.TradeData.data_trade_base['..key..'])not found') return
    end
    return data
end
---------------------data_trade_base end--------------------
---------------------data_trade_cost start--------------------
Config.TradeData.data_trade_cost_length = 3
Config.TradeData.data_trade_cost = {
 ["cost_item1"] = {desc="大瓶体力（购买体力显示物品，优先级高）",label="cost_item1",val=10401},
 ["cost_item2"] = {desc="小瓶体力（购买体力显示物品，优先级低）",label="cost_item2",val=10400},
 ["open_lev"] = {desc="开启等级",label="open_lev",val=14}
}
Config.TradeData.data_trade_cost_fun = function(key)
    local data =Config.TradeData.data_trade_cost[key]
    if DATA_DEBUG and data == nil then
        print('( Config.TradeData.data_trade_cost['..key..'])not found') return
    end
    return data
end
---------------------data_trade_cost end--------------------
---------------------data_trade_count start--------------------
Config.TradeData.data_trade_count_length = 3
Config.TradeData.data_trade_count = {
 [1] = {
    [0]={type=1,max=2,vip_lev=0},
    [1]={type=1,max=3,vip_lev=1},
    [2]={type=1,max=5,vip_lev=10},
    [3]={type=1,max=7,vip_lev=11},
    [4]={type=1,max=9,vip_lev=12},
    [5]={type=1,max=11,vip_lev=13},
    [6]={type=1,max=13,vip_lev=14},
    [7]={type=1,max=15,vip_lev=15},
    [8]={type=1,max=17,vip_lev=2},
    [9]={type=1,max=19,vip_lev=3},
    [10]={type=1,max=21,vip_lev=4},
    [11]={type=1,max=23,vip_lev=5},
    [12]={type=1,max=25,vip_lev=6},
    [13]={type=1,max=27,vip_lev=7},
    [14]={type=1,max=29,vip_lev=8},
    [15]={type=1,max=31,vip_lev=9}},
 [2] = {
    [0]={type=2,max=2,vip_lev=0},
    [1]={type=2,max=3,vip_lev=1},
    [2]={type=2,max=4,vip_lev=10},
    [3]={type=2,max=5,vip_lev=11},
    [4]={type=2,max=6,vip_lev=12},
    [5]={type=2,max=7,vip_lev=13},
    [6]={type=2,max=8,vip_lev=14},
    [7]={type=2,max=9,vip_lev=15},
    [8]={type=2,max=10,vip_lev=2},
    [9]={type=2,max=11,vip_lev=3},
    [10]={type=2,max=12,vip_lev=4},
    [11]={type=2,max=13,vip_lev=5},
    [12]={type=2,max=14,vip_lev=6},
    [13]={type=2,max=15,vip_lev=7},
    [14]={type=2,max=16,vip_lev=8},
    [15]={type=2,max=17,vip_lev=9}},
 [3] = {
    [0]={type=3,max=2,vip_lev=0},
    [1]={type=3,max=3,vip_lev=1},
    [2]={type=3,max=4,vip_lev=10},
    [3]={type=3,max=5,vip_lev=11},
    [4]={type=3,max=6,vip_lev=12},
    [5]={type=3,max=7,vip_lev=13},
    [6]={type=3,max=8,vip_lev=14},
    [7]={type=3,max=9,vip_lev=15},
    [8]={type=3,max=10,vip_lev=2},
    [9]={type=3,max=11,vip_lev=3},
    [10]={type=3,max=12,vip_lev=4},
    [11]={type=3,max=13,vip_lev=5},
    [12]={type=3,max=14,vip_lev=6},
    [13]={type=3,max=15,vip_lev=7},
    [14]={type=3,max=16,vip_lev=8},
    [15]={type=3,max=17,vip_lev=9}}
}
Config.TradeData.data_trade_count_fun = function(key)
    local data =Config.TradeData.data_trade_count[key]
    if DATA_DEBUG and data == nil then
        print('( Config.TradeData.data_trade_count['..key..'])not found') return
    end
    return data
end
---------------------data_trade_count end--------------------

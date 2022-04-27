--[[
        wharf_data.lua
        exported by excel2lua.py
        from file:wharf_data.xlsx
--]]


Config = Config or {}
Config.WharfData = Config.WharfData or {}

---------------------data_get start--------------------
Config.WharfData.data_get_length = 7
Config.WharfData.data_get = {
 [1] = {id=1,name="商船",res="E54151",desc="我们这做贸易的，谁没经历过大风大浪啊？什么稀奇古怪都见过了，闯四方，到处都是朋友！",event={{1,1,10000},{5,1,10}},type=1},
 [2] = {id=2,name="商船",res="E54151",desc="我们这做贸易的，谁没经历过大风大浪啊？什么稀奇古怪都见过了，闯四方，到处都是朋友！",event={{1,1,10000},{10200,1,1}},type=1},
 [3] = {id=3,name="商船",res="E54151",desc="我们这做贸易的，谁没经历过大风大浪啊？什么稀奇古怪都见过了，闯四方，到处都是朋友！",event={{1,1,5000},{5,1,20},{13,1,50}},type=1},
 [4] = {id=4,name="商船",res="E54151",desc="我们这做贸易的，谁没经历过大风大浪啊？什么稀奇古怪都见过了，闯四方，到处都是朋友！",event={{1,1,5000},{5,1,20},{13,1,50}},type=1},
 [5] = {id=5,name="商船",res="E54151",desc="我们这做贸易的，谁没经历过大风大浪啊？什么稀奇古怪都见过了，闯四方，到处都是朋友！",event={{1,1,5000},{5,1,20},{13,1,50}},type=1},
 [6] = {id=6,name="商船",res="E54151",desc="我们这做贸易的，谁没经历过大风大浪啊？什么稀奇古怪都见过了，闯四方，到处都是朋友！",event={{1,1,5000},{5,1,20},{13,1,50}},type=1},
 [7] = {id=7,name="海盗船",res="E54152",desc="兄弟们，抄家伙，机会等到了！好不容易遇到这么个城堡，我先上咯，待会好找老大邀功！",event={{1,31000,50000,{{1,4000},{5,5},{10,1000}}},{2,31002,50001,{{1,6000},{5,10},{10,3000}}},{3,31004,50002,{{1,10000},{5,15},{10,4000}}}},type=2}
}
Config.WharfData.data_get_fun = function(key)
    local data =Config.WharfData.data_get[key]
    if DATA_DEBUG and data == nil then
        print('( Config.WharfData.data_get['..key..'])not found') return
    end
    return data
end
---------------------data_get end--------------------
---------------------data_award_list start--------------------
Config.WharfData.data_award_list_length = 4
Config.WharfData.data_award_list = {
 [1] = {award_list={{1,10000},{5,10}},name="一号商船",order_id=1},
 [2] = {award_list={{1,10000},{10200,2}},name="二号商船",order_id=2},
 [3] = {award_list={{1,5000},{5,20},{13,50}},name="三号商船",order_id=3},
 [4] = {award_list={{30110,1},{13,200},{5,30}},name="海盗船",order_id=4}
}
Config.WharfData.data_award_list_fun = function(key)
    local data =Config.WharfData.data_award_list[key]
    if DATA_DEBUG and data == nil then
        print('( Config.WharfData.data_award_list['..key..'])not found') return
    end
    return data
end
---------------------data_award_list end--------------------
---------------------data_get_rule start--------------------
Config.WharfData.data_get_rule_length = 4
Config.WharfData.data_get_rule = {
 ["holiday_rule"] = {id="holiday_rule",desc1="活动规则说明",desc="<div fontcolor=#fca000>玩法说明：</div>\n1.玩家需要按美女枪手—海盗水手—海盗大副的顺序进行挑战\n2.每次成功挑战海盗成员都可获得奖励，\n3.挑战途中，如有不幸被海盗击杀，海盗将逃跑，无法进行再次挑战\n4.全部海盗挑战完成，海盗船将会远离城堡"},
 ["mon1"] = {id="mon1",desc1="怪物1",desc="美女枪手"},
 ["mon2"] = {id="mon2",desc1="怪物2",desc="海盗水手"},
 ["mon3"] = {id="mon3",desc1="怪物3",desc="海盗大副"}
}
Config.WharfData.data_get_rule_fun = function(key)
    local data =Config.WharfData.data_get_rule[key]
    if DATA_DEBUG and data == nil then
        print('( Config.WharfData.data_get_rule['..key..'])not found') return
    end
    return data
end
---------------------data_get_rule end--------------------

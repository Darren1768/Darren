--[[
        attack_city_data.lua
        exported by excel2lua.py
        from file:attack_city_data.xlsx
--]]


Config = Config or {}
Config.AttackCityData = Config.AttackCityData or {}

---------------------data_position start--------------------
Config.AttackCityData.data_position_length = 12
Config.AttackCityData.data_position = {
 [1] = {id=1,addition_desc="1、行军速度提升<div fontcolor=289b14>15%</div>\n2、每日获得<div fontcolor=289b14>500</div>世界币",num=1,name="大陆霸主",r_id=1},
 [2] = {id=2,addition_desc="1、行军速度提升<div fontcolor=289b14>10%</div>\n2、每日获得<div fontcolor=289b14>400</div>世界币",num=1,name="王后",r_id=2},
 [3] = {id=3,addition_desc="1、行军速度提升<div fontcolor=289b14>8%</div>\n2、每日获得<div fontcolor=289b14>350</div>世界币",num=2,name="公爵",r_id=3},
 [4] = {id=4,addition_desc="1、行军速度提升<div fontcolor=289b14>7%</div>\n2、每日获得<div fontcolor=289b14>300</div>世界币",num=3,name="侯爵",r_id=4},
 [5] = {id=5,addition_desc="1、行军速度提升<div fontcolor=289b14>6%</div>\n2、每日获得<div fontcolor=289b14>250</div>世界币",num=5,name="伯爵",r_id=5},
 [6] = {id=6,addition_desc="1、行军速度提升<div fontcolor=289b14>5%</div>\n2、每日获得<div fontcolor=289b14>200</div>世界币",num=10,name="子爵",r_id=6},
 [11] = {id=11,addition_desc="1、行军速度提升<div fontcolor=289b14>15%</div>\n2、每日获得<div fontcolor=289b14>400</div>世界币",num=1,name="国王",r_id=1},
 [12] = {id=12,addition_desc="1、行军速度提升<div fontcolor=289b14>10%</div>\n2、每日获得<div fontcolor=289b14>300</div>世界币",num=1,name="王后",r_id=2},
 [13] = {id=13,addition_desc="1、行军速度提升<div fontcolor=289b14>8%</div>\n2、每日获得<div fontcolor=289b14>250</div>世界币",num=2,name="公爵",r_id=3},
 [14] = {id=14,addition_desc="1、行军速度提升<div fontcolor=289b14>7%</div>\n2、每日获得<div fontcolor=289b14>200</div>世界币",num=3,name="侯爵",r_id=4},
 [15] = {id=15,addition_desc="1、行军速度提升<div fontcolor=289b14>6%</div>\n2、每日获得<div fontcolor=289b14>150</div>世界币",num=5,name="伯爵",r_id=5},
 [16] = {id=16,addition_desc="1、行军速度提升<div fontcolor=289b14>5%</div>\n2、每日获得<div fontcolor=289b14>100</div>世界币",num=10,name="子爵",r_id=6}
}
Config.AttackCityData.data_position_fun = function(key)
    local data =Config.AttackCityData.data_position[key]
    if DATA_DEBUG and data == nil then
        print('( Config.AttackCityData.data_position['..key..'])not found') return
    end
    return data
end
---------------------data_position end--------------------
---------------------data_const start--------------------
Config.AttackCityData.data_const_length = 13
Config.AttackCityData.data_const = {
 ["atck_order_1"] = {desc="普通大陆攻城顺序",key="atck_order_1",val={50,51}},
 ["atck_order_2"] = {desc="神界大陆攻城顺序",key="atck_order_2",val={3,4}},
 ["def_protect_time"] = {desc="驻防保护时间（秒）",key="def_protect_time",val=120},
 ["guild_max_city"] = {desc="每个联盟最多占领城池数量",key="guild_max_city",val=2},
 ["match_time"] = {desc="正式时间(秒）",key="match_time",val=2700},
 ["min_guild_score"] = {desc="占领城池所需最低积分",key="min_guild_score",val=200},
 ["min_score"] = {desc="奖励最小需求积分",key="min_score",val=20},
 ["open_time_notice"] = {desc="攻城战每周日19:05-19:50开启",key="open_time_notice",val=0},
 ["open_week_days"] = {desc="周几开启",key="open_week_days",val={7}},
 ["post_reward_time"] = {desc="职位每日奖励时间",key="post_reward_time",val={5,0,0}},
 ["pre_time"] = {desc="准备时间(秒)",key="pre_time",val=300},
 ["reward_times"] = {desc="攻打据点最多获得几次奖励",key="reward_times",val=10},
 ["start_time"] = {desc="开始时间{时,分,秒}",key="start_time",val={19,0,0}}
}
Config.AttackCityData.data_const_fun = function(key)
    local data =Config.AttackCityData.data_const[key]
    if DATA_DEBUG and data == nil then
        print('( Config.AttackCityData.data_const['..key..'])not found') return
    end
    return data
end
---------------------data_const end--------------------
---------------------data_explain start--------------------
Config.AttackCityData.data_explain_length = 4
Config.AttackCityData.data_explain = {
 [1] = {id=1,desc="1、攻城战每周日晚上<div fontcolor=289b14>19:00-19:50</div>开启，<div fontcolor=289b14>35</div>级以上拥有联盟的玩家可参与\n2、攻城需先将个人营地迁营至目标城池<div fontcolor=289b14>攻城范围</div>之内，进攻无需行军\n3、每个城池有若干个防守驻点，初始由城池守军守卫，玩家可选择任意据点进攻，战胜守卫后即可布置自己的防守队伍占领该据点，每个驻点需要布置<div fontcolor=289b14>5人队</div>\n4、同联盟的成员占领的据点不可攻打，不同联盟成员之间可互相攻打\n 5、已经用于布置防守的英雄无法用于防守其它据点，也无法用于进攻",title="攻城规则"},
 [2] = {id=2,desc="1、每攻下一个据点获得<div fontcolor=289b14>10</div>点攻城积分，每占据一个据点1分钟获得<div fontcolor=289b14>5</div>点积分\n 2、系统将对每个城池的攻城玩家个人积分和联盟成员总积分进行排名,积分相同的并列名次\n3、活动结束后，该城池中联盟总积分第一的联盟将占领该城池(低于200分不会占领），若有多个并列第一，则占据据点数多的联盟占领\n 4、每个联盟最多同时占领<div fontcolor=289b14>2</div>座城池，若同时进攻多座城池，则优先占据高级城池且总积分高的城池优先占领\n5、占领城池的联盟盟主将成为该城城主，获得城主头像框，同时全体联盟在占城期间在该大陆将获得buff加成，获得打怪收益加成和属性加成",title="胜利规则"},
 [3] = {id=3,desc="1、攻城战共分为<div fontcolor=289b14>4</div>个阶段，每个阶段需要达成一定条件才会进入下一阶段\n 2、第1阶段只能攻打本大陆的<div fontcolor=289b14>2级城池</div>，每周只开放一座城池的攻打，若攻城战结束后大陆<div fontcolor=289b14>2</div>座普通城池都产生了城主，则下周将进入第二阶段，否则保留在第1阶段\n3、第2阶段可额外攻打本大陆的中心主城，当构成大世界的大陆全部诞生国王后，下周将进入第三阶段，否则保留在第二阶段\n4、第3阶段开启后，三块大陆的玩家将可以进入神界，同时攻城战可以攻打神界<div fontcolor=289b14>普通城池</div>，每周只开放一座城池的攻打，若<div fontcolor=289b14>2</div>座普通都被占领，则进入第4阶段\n5、第4阶段可攻打神界主城，占领神界主城的盟主将成为世界霸主，同时预示着世界一统，大世界将在<div fontcolor=289b14>下周日过24点</div>后重新开启新的轮回,城池和联盟要塞都将初始化",title="攻城阶段"},
 [4] = {id=4,desc="1、每个联盟首次占领某座城池时，全联盟成员都会获得一份攻城大礼包，可开出<div fontcolor=289b14>传说符石</div>等稀有道具\n2、每次攻城战结算时将根据个人积分排名，发放对应的排名奖励\n3、占领城池的联盟，其成员在本大陆将获得打怪收益加成和英雄属性加成，占领多座城池buff效果可叠加",title="攻城奖励"}
}
Config.AttackCityData.data_explain_fun = function(key)
    local data =Config.AttackCityData.data_explain[key]
    if DATA_DEBUG and data == nil then
        print('( Config.AttackCityData.data_explain['..key..'])not found') return
    end
    return data
end
---------------------data_explain end--------------------
---------------------data_step_explain start--------------------
Config.AttackCityData.data_step_explain_length = 4
Config.AttackCityData.data_step_explain = {
 [1] = {desc="1、第一阶段可攻打本大陆普通城池，占据城池的联盟盟主将成为该城城主\n2、每个联盟最多可占据2座城池，联盟首次占领某座城池时，全体联盟成员都可获得一份占城大礼包\n3、每次攻城战结束后都会根据个人积分排名发放排名奖励，奖励大量金币和神格。若个人同时进攻多座城池，则以排名最高的为准发放个人排名奖励\n4、第一阶段攻城结束后，若2座普通城池都产生了城主，则下周进入第二阶段攻城，可攻打本大陆的主城，争夺国王之位。",step_desc="首占普通城池的联盟，全体联盟成员可获得",step_name="城主选拔",items={{31110,1}},step=1,step_target="可攻打本大陆2座普通城池"},
 [2] = {desc="1、第二阶段可额外攻打本大陆的中心主城，占据主城的联盟盟主将成为本大陆国王\n2、国王享有职位任命的特权，可任命本联盟成员爵位官职，每个成员最多只能拥有一个爵位或王后官职\n3、官职将会获得一定buff加成和福利，官职福利每天5:00通过邮件发放\n4、第二阶段攻城结束后，若三个服务器的大陆都产出了国王，则下周进入第三阶段，开启通往大陆互通的通道，可进军神界。",step_desc="首占大陆主城的联盟，全体联盟成员可获得",step_name="国王之争",step_condition="开启条件：本大陆诞生2位城主",items={{31111,1}},step=2,step_target="可攻打本大陆中心主城"},
 [3] = {desc="1、第三阶段可额外攻打神界2座普通城池,每座城池各会诞生一个城主\n2、第三阶段攻城结束后，若神界2座普通城池都诞生了城主，则下周将进入第四阶段，争夺神界主城",step_desc="首占神界普通城池的联盟，全体联盟成员可获得",step_name="进军神界",step_condition="开启条件：所有普通大陆都诞生国王",items={{31112,1}},step=3,step_target="可前往神界大陆，攻打神界2座普通城池"},
 [4] = {desc="1、第四阶段可额外攻打神界主城，占领神界主城的联盟盟主将成为神界霸主，享受国王全部福利，同时拥有独一无二的霸主头像框\n2、神界霸主产生后，大世界将会继续维持一周，至下周日过24点后大世界重置，重新开启轮回\n3、若自多个服务器构成大世界后，连续7周没有产生神界霸主，则大世界也将重置，开启新的大世界。",step_desc="首占神界主城的联盟，全体联盟成员可获得",step_name="神界争霸",step_condition="开启条件：神界诞生2位城主",items={{31113,1}},step=4,step_target="可攻打神界主城,角逐神界霸主,世界一统"}
}
Config.AttackCityData.data_step_explain_fun = function(key)
    local data =Config.AttackCityData.data_step_explain[key]
    if DATA_DEBUG and data == nil then
        print('( Config.AttackCityData.data_step_explain['..key..'])not found') return
    end
    return data
end
---------------------data_step_explain end--------------------
---------------------data_city start--------------------
Config.AttackCityData.data_city_length = 6
Config.AttackCityData.data_city = {
 [1] = {id=1,name="神殿",open_step=4,score_time=60,score_val=5,alias_name="一级主城",desc="攻城玩法第4阶段开启后，占领神殿的联盟盟主将成为世界霸主，同时享有国王全部权利和福利。",guild_items={{31113,1}},base_items={{1,5000},{18,30}},win_score=10},
 [2] = {id=2,name="王城",open_step=2,score_time=60,score_val=5,alias_name="二级主城",desc="攻城玩法第2阶段开启后，占领主城的联盟盟主将成为国王，任职期间享有国王特殊权利和福利。",guild_items={{31111,1}},base_items={{1,5000},{18,30}},win_score=10},
 [3] = {id=3,name="耶基斯城",open_step=3,score_time=60,score_val=5,alias_name="普通城池",desc="攻城玩法第3阶段开启后，占领城池的联盟盟主将成为城主，享有专属城主聊天头像框。",guild_items={{31112,1}},base_items={{1,5000},{18,30}},win_score=10},
 [4] = {id=4,name="泽卡赖亚城",open_step=3,score_time=60,score_val=5,alias_name="普通城池",desc="攻城玩法第3阶段开启后，占领城池的联盟盟主将成为城主，享有专属城主聊天头像框。",guild_items={{31112,2}},base_items={{1,5000},{18,30}},win_score=10},
 [50] = {id=50,name="东城",open_step=1,score_time=60,score_val=5,alias_name="普通城池",desc="攻城玩法开启后，占领城池的联盟盟主将成为城主，享有专属城主聊天头像框。",guild_items={{31110,1}},base_items={{1,5000},{18,30}},win_score=10},
 [51] = {id=51,name="西城",open_step=1,score_time=60,score_val=5,alias_name="普通城池",desc="攻城玩法开启后，占领城池的联盟盟主将成为城主，享有专属城主聊天头像框。",guild_items={{31110,1}},base_items={{1,5000},{18,30}},win_score=10}
}
Config.AttackCityData.data_city_fun = function(key)
    local data =Config.AttackCityData.data_city[key]
    if DATA_DEBUG and data == nil then
        print('( Config.AttackCityData.data_city['..key..'])not found') return
    end
    return data
end
---------------------data_city end--------------------
---------------------data_role_awards start--------------------
Config.AttackCityData.data_role_awards_length = 11
Config.AttackCityData.data_role_awards = {
 [1] = {items={{1,500000},{13,800}},max=1,min=1},
 [2] = {items={{1,400000},{13,600}},max=2,min=2},
 [3] = {items={{1,350000},{13,500}},max=3,min=3},
 [4] = {items={{1,300000},{13,400}},max=10,min=4},
 [5] = {items={{1,250000},{13,350}},max=20,min=11},
 [6] = {items={{1,200000},{13,300}},max=30,min=21},
 [7] = {items={{1,150000},{13,250}},max=50,min=31},
 [8] = {items={{1,100000},{13,200}},max=100,min=51},
 [9] = {items={{1,50000},{13,150}},max=200,min=101},
 [10] = {items={{1,30000},{13,100}},max=500,min=201},
 [11] = {items={{1,10000},{13,50}},max=999999,min=501}
}
Config.AttackCityData.data_role_awards_fun = function(key)
    local data =Config.AttackCityData.data_role_awards[key]
    if DATA_DEBUG and data == nil then
        print('( Config.AttackCityData.data_role_awards['..key..'])not found') return
    end
    return data
end
---------------------data_role_awards end--------------------

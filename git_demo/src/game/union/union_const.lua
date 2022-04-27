UnionConst = UnionConst or {} 

-- 公会初始窗体的标签页下表
UnionConst.init_type = {
    create = 1,
    list = 2,
    serach = 3
}

UnionConst.list_type = {
    total = 1,
    search = 2
}

UnionConst.post_type = {
    leader = 1,     -- 盟主
    assistant = 2,  -- 副盟主
    member = 3      -- 普通成员
}

-- 公会相关红点的处理
UnionConst.red_index = {
    apply = 1,              -- 公会申请
    boss_times = 2,         -- 公会副本挑战次数
    boss_kill = 3,          -- 公会副本击杀宝箱
    boss_first = 4,         -- 公会副本首通
    donate = 5,             -- 捐献
    voyage_escort = 6,      -- 远航护送
    voyage_interaction = 7, -- 远航互助
    voyage_order = 8,       -- 登录的时候订单
    voyage_temp_escort = 9, -- 零时的护送红点
    donate_activity = 10,   -- 公会捐献宝箱
    red_bag = 12,           -- 公会红包
    goal_action = 13,       -- 公会活跃
    unionwar_match = 14,    -- 公会战匹配成功
    unionwar_start = 15,    -- 公会战开战
    unionwar_count = 16,    -- 公会战挑战次数
    unionwar_log = 17,      -- 公会战日志
    unionwar_box = 18,      -- 公会战宝箱
    notice = 19,            -- 公会公告
    skill_2 = 1002,         -- 公会技能
    skill_3 = 1003,         -- 公会技能
    skill_4 = 1004,         -- 公会技能
    skill_5 = 1005,         -- 公会技能
    pvp_skill_2 = 2002,     -- 公会pvp技能
    pvp_skill_3 = 2003,     -- 公会pvp技能
    pvp_skill_4 = 2004,     -- 公会pvp技能
    pvp_skill_5 = 2005,     -- 公会pvp技能
    union_secret_area = 20, -- 公会秘境 
    all_skill = 21,         -- 公会所有技能每天首次
}

UnionConst.status = {
	normal = 0,
	un_activity = 1,
	activity = 2,
	finish = 3
}

--公会下标类型
UnionConst.show_type = {
    all = 0,            -- 全部
    union_war = 1,      -- 公会战情况
    union_donate = 2,   -- 公会捐献情况
    union_voyage = 3    -- 公会副本情况
} 

--公会图标类型
UnionConst.icon_type = {
    union_icon_type_1 = 1,      -- 公会秘境
    union_icon_type_2 = 2,      -- 公会技能
    union_icon_type_3 = 3,      -- 公会宝库
    union_icon_type_4 = 4,       -- 公会副本
    union_icon_type_5 = 5,      -- 公会商店
    union_icon_type_6 = 6,       -- 公会战
    union_icon_type_7 = 7,       -- 公会活跃
    union_icon_type_8 = 8,       -- 公会捐献
    union_icon_type_9 = 9       -- 公会红包
} 


UnionConst.btn_data = {
    [1] = {
		id=1
		,res_id='hl_bigbg_56'
		,layer_sum=1
		,name='战场'
		,width=1776
		,height=1280
		,btn_list={
			
			{bid=4 ,name='联盟管理' ,res='3' ,dun_id=0 ,x=870 ,y=100 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
		}
	},
}
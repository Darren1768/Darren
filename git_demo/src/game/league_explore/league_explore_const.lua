LeagueExploreConst = LeagueExploreConst or {}

LeagueExploreConst.land_type= {
    [1]="妖",
	[2]="人",
	[3]="神",
	[4]="魔",
	[5]="佛",
	[6]="灵",
}


LeagueExploreConst.show_tip= {
    [1]="灵界联盟探险报名已经开始，请前往灵界查看报名。",
	[2]="灵界联盟探险即将在18：00开始，17：50报名结束，请做好报名。",
	[3]="灵界联盟探险报名已结束，布阵将在18：00结束，请做好布阵，探险在18：00准时开启，记得观战不错过细节。",
}

LeagueExploreConst.show_tip_cline= {
    [1]=TI18N("报名中..."),
	[2]=TI18N("10分钟后开启探险"),
	[3]=TI18N("探险中..."),
	[4]=TI18N("战斗已结束"),
	[0]=TI18N("占领中，记得领取奖励"),
}
-- 红点类型
LeagueExploreConst.Red_Type = {
	sign  = 1,     -- 报名
}

-- 红点类型
LeagueExploreConst.Cross_Type = {
	[0] = "本服",     -- 本服
	[1] = "跨服",     --跨服
}

LeagueExploreConst.resourse_data = {
	[1] = {
		id=1
		,res_id='hl_explore_bigbg_1'
		,layer_sum=1
		,name='资源点'
		,width=1440 
		,height=1280
		,building_list={
	    	{bid=1 ,name='妖' ,res='3' ,dun_id=0 ,x=0 ,y=180 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
			{bid=2 ,name='妖' ,res='3' ,dun_id=0 ,x=173 ,y=288 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=3 ,name='妖' ,res='3' ,dun_id=0 ,x=396 ,y=234 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=4 ,name='妖' ,res='3' ,dun_id=0 ,x=462 ,y=420 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=5 ,name='妖' ,res='3' ,dun_id=0 ,x=666 ,y=407 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=6 ,name='妖' ,res='3' ,dun_id=0 ,x=699 ,y=332 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

	    	{bid=7 ,name='人' ,res='3' ,dun_id=0 ,x=759 ,y=865 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=8 ,name='人' ,res='3' ,dun_id=0 ,x=356 ,y=994 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

	    	{bid=9 ,name='神' ,res='3' ,dun_id=0 ,x=96 ,y=832 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=10 ,name='神' ,res='3' ,dun_id=0 ,x=573 ,y=649 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

	    	{bid=11 ,name='魔' ,res='3' ,dun_id=0 ,x=854 ,y=491 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

	    	{bid=12 ,name='佛' ,res='3' ,dun_id=0 ,x=138 ,y=1029 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

	    	{bid=13 ,name='灵' ,res='3' ,dun_id=0 ,x=720 ,y=1183 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=14 ,name='灵' ,res='3' ,dun_id=0 ,x=779 ,y=1114 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=15 ,name='灵' ,res='3' ,dun_id=0 ,x=827 ,y=1059 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=16 ,name='灵' ,res='3' ,dun_id=0 ,x=854 ,y=994 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=17 ,name='灵' ,res='3' ,dun_id=0 ,x=939 ,y=934 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=18 ,name='灵' ,res='3' ,dun_id=0 ,x=1077 ,y=864 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=19 ,name='灵' ,res='3' ,dun_id=0 ,x=905 ,y=1207 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=20 ,name='灵' ,res='3' ,dun_id=0 ,x=926 ,y=1146 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=21 ,name='灵' ,res='3' ,dun_id=0 ,x=1136 ,y=1207 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=22 ,name='灵' ,res='3' ,dun_id=0 ,x=1136 ,y=1141 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=23 ,name='灵' ,res='3' ,dun_id=0 ,x=1176 ,y=1018 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=24 ,name='灵' ,res='3' ,dun_id=0 ,x=1212 ,y=922 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=25 ,name='灵' ,res='3' ,dun_id=0 ,x=1293 ,y=798 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=26 ,name='灵' ,res='3' ,dun_id=0 ,x=1272 ,y=1179 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=27 ,name='灵' ,res='3' ,dun_id=0 ,x=1290 ,y=1063 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=28 ,name='灵' ,res='3' ,dun_id=0 ,x=1100 ,y=414 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=29 ,name='灵' ,res='3' ,dun_id=0 ,x=1091 ,y=351 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=30 ,name='灵' ,res='3' ,dun_id=0 ,x=1152 ,y=246 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=31 ,name='灵' ,res='3' ,dun_id=0 ,x=1193 ,y=159 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=32 ,name='灵' ,res='3' ,dun_id=0 ,x=1292 ,y=476 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=33 ,name='灵' ,res='3' ,dun_id=0 ,x=1287 ,y=386 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=34 ,name='灵' ,res='3' ,dun_id=0 ,x=96 ,y=1167 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=35 ,name='灵' ,res='3' ,dun_id=0 ,x=437 ,y=1126 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=36 ,name='灵' ,res='3' ,dun_id=0 ,x=605 ,y=1069 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=37 ,name='灵' ,res='3' ,dun_id=0 ,x=228 ,y=1210 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=38 ,name='灵' ,res='3' ,dun_id=0 ,x=543 ,y=1195 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=39 ,name='灵' ,res='3' ,dun_id=0 ,x=951 ,y=790 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=40 ,name='灵' ,res='3' ,dun_id=0 ,x=1251 ,y=748 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},
	    	{bid=41 ,name='灵' ,res='3' ,dun_id=0 ,x=1205 ,y=639 ,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

		}
	},


	[2] = {
		id=2
		,res_id='hl_explore_bigbg_3'
		,layer_sum=1
		,name='布阵'
		,width=920
		,height=424
		,building_list={-- type 1 最大，依次减小

		  [1] = {
	
	    	{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=418 ,y=200,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=418 -64,y=200+46,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=418 -132,y=200-2  ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=418 + 10 ,y=200 -98 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=418 + 82 ,y=200 +50,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=418 + 142 ,y=200-2 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=418 - 96,y=200 + 148,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=418 - 136 ,y=200 + 108 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=418 - 170,y=200 + 60 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=418 - 216 ,y=200 + 16  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=418 -170,y=200-70 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=418-132 ,y=200-120  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 132  ,y=200-120 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=418+8 +170 ,y=200-70   ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 216  ,y=200 + 16  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010 ,name='' ,res='3' ,dun_id=0 ,x=418+18 + 170 ,y=200 + 60  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 136,y=200 + 108 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 96 ,y=200 + 148,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 

			

		     },

		 [2] = {
			{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=418 ,y=200,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=418 -64,y=200+46,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=418 -132,y=200-2  ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=418 + 10 ,y=200 -98 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=418 + 82 ,y=200 +50,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=418 + 142 ,y=200-2 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=418 - 96,y=200 + 148,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=418 - 136 ,y=200 + 108 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=418 - 170,y=200 + 60 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=418 - 216 ,y=200 + 16  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=418 -170,y=200-70 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=418-132 ,y=200-120  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 132  ,y=200-120 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=418+8 +170 ,y=200-70   ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 216  ,y=200 + 16  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010 ,name='' ,res='3' ,dun_id=0 ,x=418+18 + 170 ,y=200 + 60  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 136,y=200 + 108 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 96 ,y=200 + 148,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 

			--左1
			{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-60 -40,y=200 + 160 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			-- --左2
			{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-60-54 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			-- --左3
			{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266 -40-54 ,y=200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			-- --左4
			{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=266 -40-54 ,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
			-- --左5
			{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=308-60 -54,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左6
			{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=266-60-54 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右1
			{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=778-100 -60,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右2
			{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=820-100-60 ,y=200 + 120,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右3
			{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=862-100-60 ,y=200 + 80  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
		
			--右4
			{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=876-110 -60,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右5
			{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=820-100-60 ,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右6
			{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=860-100 -60,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
		  },
		[3] = {
			{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=418 ,y=200,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=418 -64,y=200+46,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=418 -132,y=200-2  ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=418 + 10 ,y=200 -98 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=418 + 82 ,y=200 +50,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=418 + 142 ,y=200-2 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=418 - 96,y=200 + 148,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=418 - 136 ,y=200 + 108 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=418 - 170,y=200 + 60 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=418 - 216 ,y=200 + 16  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=418 -170,y=200-70 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=418-132 ,y=200-120  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 132  ,y=200-120 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=418+8 +170 ,y=200-70   ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 216  ,y=200 + 16  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010 ,name='' ,res='3' ,dun_id=0 ,x=418+18 + 170 ,y=200 + 60  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 136,y=200 + 108 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 96 ,y=200 + 148,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 

			
			--左1
			{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-60 -40,y=200 + 160 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-60 -40,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266 -60-40,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			-- --左2
			{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=308-60-54 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=266-60-54 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=224-60 -54,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			-- --左3
			{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=266 -40-54 ,y=200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=224 -40-54 ,y=200 + 80,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=182 -40-54,y=200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
			-- --左4
			{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=266 -40-54 ,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=224 -40-54,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=182 -40-54,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
			-- --左5
			{bid=1013 ,name='' ,res='3' ,dun_id=0 ,x=308-60 -54,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1014 ,name='' ,res='3' ,dun_id=0 ,x=266-60-54 ,y=200-80,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1015 ,name='' ,res='3' ,dun_id=0 ,x=224-60-54 ,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左6
			{bid=1016 ,name='' ,res='3' ,dun_id=0 ,x=266-60-54 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1017 ,name='' ,res='3' ,dun_id=0 ,x=224-60-54 ,y=200-130  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1018 ,name='' ,res='3' ,dun_id=0 ,x=182-60-54 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		


			--右1
			{bid=1019 ,name='' ,res='3' ,dun_id=0 ,x=778-100 -60,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1020 ,name='' ,res='3' ,dun_id=0 ,x=820-100 -60,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1021 ,name='' ,res='3' ,dun_id=0 ,x=862-100-60,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右2
			{bid=1022 ,name='' ,res='3' ,dun_id=0 ,x=820-100-60 ,y=200 + 120,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1023 ,name='' ,res='3' ,dun_id=0 ,x=862-100-60 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1024 ,name='' ,res='3' ,dun_id=0 ,x=904-100 -60,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右3
			{bid=1025 ,name='' ,res='3' ,dun_id=0 ,x=862-100-60 ,y=200 + 80  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1026 ,name='' ,res='3' ,dun_id=0 ,x=904-100-60 ,y=200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1027 ,name='' ,res='3' ,dun_id=0 ,x=946-100-60 ,y=200 + 80  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
		
			--右4
			{bid=1028 ,name='' ,res='3' ,dun_id=0 ,x=876-110 -60,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1029 ,name='' ,res='3' ,dun_id=0 ,x=918-110-60 ,y=200 + 16,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1030 ,name='' ,res='3' ,dun_id=0 ,x=960-110-60 ,y=200 + 16,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右5
			{bid=1031 ,name='' ,res='3' ,dun_id=0 ,x=820-100-60 ,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1032 ,name='' ,res='3' ,dun_id=0 ,x=860-100 -60,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1033 ,name='' ,res='3' ,dun_id=0 ,x=904-100-60 ,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右6
			{bid=1034 ,name='' ,res='3' ,dun_id=0 ,x=860-100 -60,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1035 ,name='' ,res='3' ,dun_id=0 ,x=904-100-60 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1036 ,name='' ,res='3' ,dun_id=0 ,x=946-100-60 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	

			},
		[4] = {
			{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=418 ,y=200,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=418 -64,y=200+46,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=418 -132,y=200-2  ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=418 + 10 ,y=200 -98 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=418 + 82 ,y=200 +50,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
			{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=418 + 142 ,y=200-2 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=418 - 96,y=200 + 148,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=418 - 136 ,y=200 + 108 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=418 - 170,y=200 + 60 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=418 - 216 ,y=200 + 16  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=418 -170,y=200-70 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=418-132 ,y=200-120  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 132  ,y=200-120 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=418+8 +170 ,y=200-70   ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 216  ,y=200 + 16  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010 ,name='' ,res='3' ,dun_id=0 ,x=418+18 + 170 ,y=200 + 60  ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 136,y=200 + 108 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=418+8 + 96 ,y=200 + 148,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 


			--左1
			{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-60 -40,y=200 + 160 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-60 -40,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266 -60-40,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=224-60-40 ,y=200 + 160 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=182-60-40 ,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			-- --左2
			{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=308-60-54 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=266-60-54 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=224-60 -54,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=182-60-54 ,y=200 + 120,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=140-60-54 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			-- --左3
			{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=266 -40-54 ,y= 200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=224 -40-54 ,y= 200 + 80,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1013 ,name='' ,res='3' ,dun_id=0 ,x=182 -40-54,y= 200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1014 ,name='' ,res='3' ,dun_id=0 ,x=140-40-54 ,y= 200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1015 ,name='' ,res='3' ,dun_id=0 ,x=98-40 -54,y= 200 + 80,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			-- --左4
			{bid=1016 ,name='' ,res='3' ,dun_id=0 ,x=266 -40-54 ,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1017 ,name='' ,res='3' ,dun_id=0 ,x=224 -40-54,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1018 ,name='' ,res='3' ,dun_id=0 ,x=182 -40-54,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1019 ,name='' ,res='3' ,dun_id=0 ,x=124 -40-54 ,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1020 ,name='' ,res='3' ,dun_id=0 ,x=82 -40 -54,y=200 + 16,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 


			-- --左5
			{bid=1021 ,name='' ,res='3' ,dun_id=0 ,x=308-60 -54,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1022 ,name='' ,res='3' ,dun_id=0 ,x=266-60-54 ,y=200-80,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1023 ,name='' ,res='3' ,dun_id=0 ,x=224-60-54 ,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1024 ,name='' ,res='3' ,dun_id=0 ,x=182-60 -54,y=200-80,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1025 ,name='' ,res='3' ,dun_id=0 ,x=140-60-54 ,y=200-80,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--左6
			{bid=1026 ,name='' ,res='3' ,dun_id=0 ,x=266-60-54 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1027 ,name='' ,res='3' ,dun_id=0 ,x=224-60-54 ,y=200-130  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1028 ,name='' ,res='3' ,dun_id=0 ,x=182-60-54 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1029 ,name='' ,res='3' ,dun_id=0 ,x=140-60-54 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1030 ,name='' ,res='3' ,dun_id=0 ,x=98-60-54 ,y=200-130  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		

			--右1
			{bid=1031 ,name='' ,res='3' ,dun_id=0 ,x=778-100 -60,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1032 ,name='' ,res='3' ,dun_id=0 ,x=820-100 -60,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1033 ,name='' ,res='3' ,dun_id=0 ,x=862-100-60,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1034 ,name='' ,res='3' ,dun_id=0 ,x=904-100-60 ,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1035 ,name='' ,res='3' ,dun_id=0 ,x=946-100 -60,y=200 + 160,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--右2
			{bid=1036 ,name='' ,res='3' ,dun_id=0 ,x=820-100-60 ,y=200 + 120,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1037 ,name='' ,res='3' ,dun_id=0 ,x=862-100-60 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1038 ,name='' ,res='3' ,dun_id=0 ,x=904-100 -60,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1039 ,name='' ,res='3' ,dun_id=0 ,x=946-100-60 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1040 ,name='' ,res='3' ,dun_id=0 ,x=988-100-60 ,y=200 + 120 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--右3
			{bid=1041 ,name='' ,res='3' ,dun_id=0 ,x=862-100-60 ,y=200 + 80  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1042 ,name='' ,res='3' ,dun_id=0 ,x=904-100-60 ,y=200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1043 ,name='' ,res='3' ,dun_id=0 ,x=946-100-60 ,y=200 + 80  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1044 ,name='' ,res='3' ,dun_id=0 ,x=988-100 -60,y=200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1045 ,name='' ,res='3' ,dun_id=0 ,x=1030-100-60 ,y=200 + 80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
				
			--右4
			{bid=1046 ,name='' ,res='3' ,dun_id=0 ,x=876-110 -60,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1047 ,name='' ,res='3' ,dun_id=0 ,x=918-110-60 ,y=200 + 16,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1048 ,name='' ,res='3' ,dun_id=0 ,x=960-110-60 ,y=200 + 16,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1049 ,name='' ,res='3' ,dun_id=0 ,x=1002-110 -60,y=200 + 16,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1050 ,name='' ,res='3' ,dun_id=0 ,x=1042-110-60 ,y=200 + 16 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
	        --右5
			{bid=1051 ,name='' ,res='3' ,dun_id=0 ,x=820-100-60 ,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1052 ,name='' ,res='3' ,dun_id=0 ,x=860-100 -60,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1053 ,name='' ,res='3' ,dun_id=0 ,x=904-100-60 ,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1054 ,name='' ,res='3' ,dun_id=0 ,x=946-100 -60,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1055 ,name='' ,res='3' ,dun_id=0 ,x=988-100-60 ,y=200-80 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
			--右6
			{bid=1056 ,name='' ,res='3' ,dun_id=0 ,x=860-100 -60,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1057 ,name='' ,res='3' ,dun_id=0 ,x=904-100-60 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1058 ,name='' ,res='3' ,dun_id=0 ,x=946-100-60 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1059 ,name='' ,res='3' ,dun_id=0 ,x=988-100-60 ,y=200-130,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1060 ,name='' ,res='3' ,dun_id=0 ,x=1030-100-60 ,y=200-130 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			},
		}
	},

	
	[3] = {
		id=3
		,res_id='hl_explore_bigbg_2'
		,layer_sum=1
		,name='战斗结果'
		,width=1080
		,height=1280
		,building_list={-- type 1 最大，依次减小

		
		[1] = {
			{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=564 -70 ,y=910 -24,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=484 -60 ,y=970 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=644 -60 ,y=970 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=404 -60 ,y=906  -24,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=724 -60 ,y=906 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=564 -60 ,y=790 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=440 -54 ,y=1080 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=674-54 ,y=1080-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=394 -54,y=1034-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=720 -54,y=1030-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=354-54 ,y=980-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=760-54 ,y=980 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=300-54 ,y=930-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=814-54 ,y=930 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=356-54 ,y=830-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010,name='' ,res='3' ,dun_id=0 ,x=756 -54,y=830-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=400-54 ,y=770-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=716-54 ,y=770 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
		 },

		 [2] = {
	
	    	{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=564 -70 ,y=910 -24,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=484 -60 ,y=970 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=644 -60 ,y=970 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=404 -60 ,y=906  -24,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=724 -60 ,y=906 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=564 -60 ,y=790 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=440 -54 ,y=1080 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=674-54 ,y=1080-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=394 -54,y=1034-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=720 -54,y=1030-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=354-54 ,y=980-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=760-54 ,y=980 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=300-54 ,y=930-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=814-54 ,y=930 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=356-54 ,y=830-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010,name='' ,res='3' ,dun_id=0 ,x=756 -54,y=830-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=400-54 ,y=770-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=716-54 ,y=770 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			
			--左1
			{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-54 ,y=1105-30 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--左2
			{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左3
			{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左4
			{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=250-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左5
			{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	
			--左6
			{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		


			--右1
			{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=778-54 ,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右2
			{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
    		--右3
			{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	
            --右4
			{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=876-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	
			--右5
			{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--右6
			{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	

			},
		

			[3] = {
				{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=564 -70 ,y=910 -24,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

				{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=484 -60 ,y=970 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
				{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=644 -60 ,y=970 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
				{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=404 -60 ,y=906  -24,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
				{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=724 -60 ,y=906 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
				{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=564 -60 ,y=790 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

				{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=440 -54 ,y=1080 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=674-54 ,y=1080-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=394 -54,y=1034-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=720 -54,y=1030-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=354-54 ,y=980-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=760-54 ,y=980 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=300-54 ,y=930-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=814-54 ,y=930 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=356-54 ,y=830-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2010,name='' ,res='3' ,dun_id=0 ,x=756 -54,y=830-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=400-54 ,y=770-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=716-54 ,y=770 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				
					
			
				--左1
				{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-54 ,y=1105-30 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=1105-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=1105-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
				--左2
				{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			--左3
				{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
				--左4
				{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=250-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=208-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=166-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
				--左5
				{bid=1013 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1014 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1015 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
				--左6
				{bid=1016 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1017 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1018 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			

				--右1
				{bid=1019 ,name='' ,res='3' ,dun_id=0 ,x=778-54 ,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1020 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1021 ,name='' ,res='3' ,dun_id=0 ,x=862 -54,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
				--右2
				{bid=1022 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1023 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1024 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				--右3
				{bid=1025 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1026 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1027 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
				--右4
				{bid=1028 ,name='' ,res='3' ,dun_id=0 ,x=876-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1029 ,name='' ,res='3' ,dun_id=0 ,x=918-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1030 ,name='' ,res='3' ,dun_id=0 ,x=960-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
				--右5
				{bid=1031 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1032 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1033 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
				--右6
				{bid=1034 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1035 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1036 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
	
			},

			[4] = {
				{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=564 -70 ,y=910 -24,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

				{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=484 -60 ,y=970 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
				{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=644 -60 ,y=970 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
				{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=404 -60 ,y=906  -24,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
				{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=724 -60 ,y=906 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
				{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=564 -60 ,y=790 -24 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

				{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=440 -54 ,y=1080 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=674-54 ,y=1080-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=394 -54,y=1034-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=720 -54,y=1030-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=354-54 ,y=980-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=760-54 ,y=980 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=300-54 ,y=930-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=814-54 ,y=930 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=356-54 ,y=830-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2010,name='' ,res='3' ,dun_id=0 ,x=756 -54,y=830-24 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=400-54 ,y=770-24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=716-54 ,y=770 -24,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
				
					
			
				--左1
				{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-54 ,y=1105-30 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=1105-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=1105-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=1105-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=1105-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

				--左2
				{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=140-54 ,y=1055-30  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				--左3
				{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1013 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1014 ,name='' ,res='3' ,dun_id=0 ,x=140-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1015 ,name='' ,res='3' ,dun_id=0 ,x=98-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

				--左4
				{bid=1016 ,name='' ,res='3' ,dun_id=0 ,x=250-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1017 ,name='' ,res='3' ,dun_id=0 ,x=208-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1018 ,name='' ,res='3' ,dun_id=0 ,x=166-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1019 ,name='' ,res='3' ,dun_id=0 ,x=124-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1020 ,name='' ,res='3' ,dun_id=0 ,x=82-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

				--左5
				{bid=1021 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1022 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1023 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1024 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1025 ,name='' ,res='3' ,dun_id=0 ,x=140-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

				--左6
				{bid=1026 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1027 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1028 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1029 ,name='' ,res='3' ,dun_id=0 ,x=140-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1030 ,name='' ,res='3' ,dun_id=0 ,x=98-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 



				--右1
				{bid=1031 ,name='' ,res='3' ,dun_id=0 ,x=778-54 ,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1032 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1033 ,name='' ,res='3' ,dun_id=0 ,x=862 -54,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1034 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1035 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=1075 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

				--右2
				{bid=1036 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1037 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1038 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1039 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1040 ,name='' ,res='3' ,dun_id=0 ,x=988-54 ,y=1025 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				--右3
				{bid=1041 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1042 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1043 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1044 ,name='' ,res='3' ,dun_id=0 ,x=988-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1045 ,name='' ,res='3' ,dun_id=0 ,x=1030-54 ,y=975 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

				--右4
				{bid=1046 ,name='' ,res='3' ,dun_id=0 ,x=876-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1047 ,name='' ,res='3' ,dun_id=0 ,x=918-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1048 ,name='' ,res='3' ,dun_id=0 ,x=960-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1049 ,name='' ,res='3' ,dun_id=0 ,x=1002-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1050 ,name='' ,res='3' ,dun_id=0 ,x=1042-54 ,y=895 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

				--右5
				{bid=1051 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1052 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1053 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1054 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1055 ,name='' ,res='3' ,dun_id=0 ,x=988-54 ,y=795 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

				--右6
				{bid=1056 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1057 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1058 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1059 ,name='' ,res='3' ,dun_id=0 ,x=988-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
				{bid=1060 ,name='' ,res='3' ,dun_id=0 ,x=1030-54 ,y=735 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

		
	
			},


		}
	},


		
	[4] = {
		id=4
		,res_id='hl_explore_bigbg_2'
		,layer_sum=1
		,name='战斗结果B'
		,width=1080
		,height=1280
		,building_list={-- type 1 最大，依次减小

		[1] = {

    		{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=564 -70 ,y=910 -594,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=484 -60 ,y=970 -594 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=644 -60 ,y=970 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=404 -60 ,y=906  -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=724 -60 ,y=906 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=564 -60 ,y=790 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=440 -54 ,y=1080 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=674-54 ,y=1080-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=394 -54,y=1034-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=720 -54,y=1030-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=354-54 ,y=980-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=760-54 ,y=980 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=300-54 ,y=930-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=814-54 ,y=930 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=356-54 ,y=830-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010 ,name='' ,res='3' ,dun_id=0 ,x=756 -54,y=830-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=400-54 ,y=770-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=716-54 ,y=770 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
		},

		
		[2] = {

    		{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=564 -70 ,y=910 -594,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=484 -60 ,y=970 -594 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=644 -60 ,y=970 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=404 -60 ,y=906  -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=724 -60 ,y=906 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=564 -60 ,y=790 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=440 -54 ,y=1080 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=674-54 ,y=1080-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=394 -54,y=1034-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=720 -54,y=1030-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=354-54 ,y=980-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=760-54 ,y=980 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=300-54 ,y=930-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=814-54 ,y=930 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=356-54 ,y=830-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010 ,name='' ,res='3' ,dun_id=0 ,x=756 -54,y=830-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=400-54 ,y=770-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=716-54 ,y=770 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 

			--左1
			{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左2
			{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=505 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左3
			{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			
			--左4
			{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=250-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左5
			{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左6
			{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=165,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	


			--右1
			{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=778-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右2
			{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=505-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右3
			{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
            --右4
			{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=876-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右5
			{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右6
			{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
		},

		[3] = {

    		{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=564 -70 ,y=910 -594,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=484 -60 ,y=970 -594 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=644 -60 ,y=970 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=404 -60 ,y=906  -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=724 -60 ,y=906 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=564 -60 ,y=790 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=440 -54 ,y=1080 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=674-54 ,y=1080-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=394 -54,y=1034-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=720 -54,y=1030-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=354-54 ,y=980-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=760-54 ,y=980 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=300-54 ,y=930-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=814-54 ,y=930 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=356-54 ,y=830-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010 ,name='' ,res='3' ,dun_id=0 ,x=756 -54,y=830-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=400-54 ,y=770-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=716-54 ,y=770 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 

			--左1
			{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=555 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=555 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左2
			{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=505 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=505 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=505 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左3
			{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=375 +36,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左4
			{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=250-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=208-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=166-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左5
			{bid=1013 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1014 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1015 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--左6
			{bid=1016 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=165,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1017 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1018 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		

			--右1
			{bid=1019 ,name='' ,res='3' ,dun_id=0 ,x=778-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1020 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1021 ,name='' ,res='3' ,dun_id=0 ,x=862 -54,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	
			--右2
			{bid=1022 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=505-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1023 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=505-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1024 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=505-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右3
			{bid=1025 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1026 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1027 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	
            --右4
			{bid=1028 ,name='' ,res='3' ,dun_id=0 ,x=876-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1029 ,name='' ,res='3' ,dun_id=0 ,x=918-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1030 ,name='' ,res='3' ,dun_id=0 ,x=960-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
		
			--右5
			{bid=1031 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1032 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1033 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	
			--右6
			{bid=1034 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1035 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1036 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
	
		
		},

		[4] = {

    		{bid=4001 ,name='' ,res='3' ,dun_id=0 ,x=564 -70 ,y=910 -594,name_x=0 ,name_y=0 ,dir=0 ,type=1 ,layer=1},

			{bid=3001 ,name='' ,res='3' ,dun_id=0 ,x=484 -60 ,y=970 -594 ,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3002 ,name='' ,res='3' ,dun_id=0 ,x=644 -60 ,y=970 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3003 ,name='' ,res='3' ,dun_id=0 ,x=404 -60 ,y=906  -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3004 ,name='' ,res='3' ,dun_id=0 ,x=724 -60 ,y=906 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 
	    	{bid=3005 ,name='' ,res='3' ,dun_id=0 ,x=564 -60 ,y=790 -594,name_x=0 ,name_y=0 ,dir=0 ,type=2 ,layer=1}, 

			{bid=2001 ,name='' ,res='3' ,dun_id=0 ,x=440 -54 ,y=1080 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2002 ,name='' ,res='3' ,dun_id=0 ,x=674-54 ,y=1080-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2003 ,name='' ,res='3' ,dun_id=0 ,x=394 -54,y=1034-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2004 ,name='' ,res='3' ,dun_id=0 ,x=720 -54,y=1030-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2005 ,name='' ,res='3' ,dun_id=0 ,x=354-54 ,y=980-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2006 ,name='' ,res='3' ,dun_id=0 ,x=760-54 ,y=980 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2007 ,name='' ,res='3' ,dun_id=0 ,x=300-54 ,y=930-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2008 ,name='' ,res='3' ,dun_id=0 ,x=814-54 ,y=930 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2009 ,name='' ,res='3' ,dun_id=0 ,x=356-54 ,y=830-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2010 ,name='' ,res='3' ,dun_id=0 ,x=756 -54,y=830-594 ,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2011 ,name='' ,res='3' ,dun_id=0 ,x=400-54 ,y=770-594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 
			{bid=2012 ,name='' ,res='3' ,dun_id=0 ,x=716-54 ,y=770 -594,name_x=0 ,name_y=0 ,dir=0 ,type=3 ,layer=1}, 

			--左1
			{bid=1001 ,name='' ,res='3' ,dun_id=0 ,x=350-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1002 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=555 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1003 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=555 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1004 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=555-46  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1005 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--左2
			{bid=1006 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=505 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1007 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=505 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1008 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=505 -46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1009 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=505-46  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1010 ,name='' ,res='3' ,dun_id=0 ,x=140-54 ,y=505-46  ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			--左3
			{bid=1011 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1012 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1013 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=375 +36,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1014 ,name='' ,res='3' ,dun_id=0 ,x=140-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1015 ,name='' ,res='3' ,dun_id=0 ,x=98-54 ,y=375 +36,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--左4
			{bid=1016 ,name='' ,res='3' ,dun_id=0 ,x=250-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1017 ,name='' ,res='3' ,dun_id=0 ,x=208-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1018 ,name='' ,res='3' ,dun_id=0 ,x=166-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1019 ,name='' ,res='3' ,dun_id=0 ,x=124-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1020 ,name='' ,res='3' ,dun_id=0 ,x=82-54 ,y=325,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--左5
			{bid=1021 ,name='' ,res='3' ,dun_id=0 ,x=308-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1022 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1023 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1024 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1025 ,name='' ,res='3' ,dun_id=0 ,x=140-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--左6
			{bid=1026 ,name='' ,res='3' ,dun_id=0 ,x=266-54 ,y=165,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1027 ,name='' ,res='3' ,dun_id=0 ,x=224-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1028 ,name='' ,res='3' ,dun_id=0 ,x=182-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1029 ,name='' ,res='3' ,dun_id=0 ,x=140-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1030 ,name='' ,res='3' ,dun_id=0 ,x=98-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 



			--右1
			{bid=1031 ,name='' ,res='3' ,dun_id=0 ,x=778-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1032 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1033 ,name='' ,res='3' ,dun_id=0 ,x=862 -54,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1034 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1035 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=555-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--右2
			{bid=1036 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=505-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1037 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=505-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1038 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=505-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1039 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=505-46 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1040 ,name='' ,res='3' ,dun_id=0 ,x=988-54 ,y=505 -46,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			--右3
			{bid=1041 ,name='' ,res='3' ,dun_id=0 ,x=862-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1042 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1043 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1044 ,name='' ,res='3' ,dun_id=0 ,x=988-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1045 ,name='' ,res='3' ,dun_id=0 ,x=1030-54 ,y=375+36 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

            --右4
			{bid=1046 ,name='' ,res='3' ,dun_id=0 ,x=876-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1047 ,name='' ,res='3' ,dun_id=0 ,x=918-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1048 ,name='' ,res='3' ,dun_id=0 ,x=960-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1049 ,name='' ,res='3' ,dun_id=0 ,x=1002-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1050 ,name='' ,res='3' ,dun_id=0 ,x=1042-54 ,y=325 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--右5
			{bid=1051 ,name='' ,res='3' ,dun_id=0 ,x=820-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1052 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1053 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1054 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1055 ,name='' ,res='3' ,dun_id=0 ,x=988-54 ,y=225 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

			--右6
			{bid=1056 ,name='' ,res='3' ,dun_id=0 ,x=860-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1057 ,name='' ,res='3' ,dun_id=0 ,x=904-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1058 ,name='' ,res='3' ,dun_id=0 ,x=946-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1059 ,name='' ,res='3' ,dun_id=0 ,x=988-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 
			{bid=1060 ,name='' ,res='3' ,dun_id=0 ,x=1030-54 ,y=165 ,name_x=0 ,name_y=0 ,dir=0 ,type=4 ,layer=1}, 

		
		},

		

		}
	},
}
-- --------------------------------------------------------------------
-- 这里填写简要说明(必填)
-- @description:
--    探索历练
-- --------------------------------------------------------------------
local controller = LeagueExploreController:getInstance()
local model = LeagueExploreController:getInstance():getModel()

local _string_format = string.format
local _table_insert = table.insert
local _table_remove = table.remove

LeagueExploreScoreRankWindow = LeagueExploreScoreRankWindow or BaseClass(BaseView)

function LeagueExploreScoreRankWindow:__init(type )
    

    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Mini
    self.layout_name = "league_explore/league_explore_score_rank_window"

    self.type =type or 1   -- 1 积分详情  2 排行详情

end

function LeagueExploreScoreRankWindow:open_callback( )
    self.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)
    self.background = self.root_wnd:getChildByName("background")
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层

    
    self.title = self.ui_container:getChildByName("title")



    local good_cons = self.ui_container:getChildByName("scroll_box")
    local scroll_view_size = good_cons:getContentSize()
    local setting = {
        item_class = LeagueExploreScoreRankItem,      -- 单元类
        start_x = 0,                  -- 第一个单元的X起点
        space_x = 0,                    -- x方向的间隔
        start_y = 0,                    -- 第一个单元的Y起点
        space_y = 0,                   -- y方向的间隔
        item_width = 526,               -- 单元的尺寸width
        item_height = 33,              -- 单元的尺寸height
        row = 0,                        -- 行数，作用于水平滚动类型
        col = 1,                         -- 列数，作用于垂直滚动类型
    }
    self.item_scrollview = CommonScrollViewLayout.new(good_cons, cc.p(0,0), ScrollViewDir.vertical, ScrollViewStartPos.top, scroll_view_size, setting)
    self.item_scrollview:setSwallowTouches(false)

    self.Image_1 = self.ui_container:getChildByName("Image_1")
end


function LeagueExploreScoreRankWindow:register_event()
    if self.background then
		self.background:addTouchEventListener(function(sender, event_type)
			if event_type == ccui.TouchEventType.ended then
				playQuitSound()
                controller:openLeagueExploreScoreRankWindow(false) 
			end
		end)
	end



end

function LeagueExploreScoreRankWindow:openRootWnd(type)
    -- local _id = model:getResourceID()
    -- controller:sender29307(_id)
  
    self.type =type or 1 
    self:createInitView()
    self:updataUI()
end


function LeagueExploreScoreRankWindow:createInitView()
   
     -- 三个
     local label_1 = createLabel(20, cc.c4b(98,53,43,0xff), nil, 165, 732, "排名", self.ui_container)
     label_1:setAnchorPoint(cc.p(0.5, 0.5))
     local label_2 = createLabel(20, cc.c4b(129,104,65,0xff), nil, 358, 732, "联盟名称", self.ui_container)
     label_2:setAnchorPoint(cc.p(0.5, 0.5))
     local label_3 = createLabel(20, cc.c4b(129,104,65,0xff), nil, 548, 732, "积分", self.ui_container)
     label_3:setAnchorPoint(cc.p(0.5, 0.5))
     if self.type ==1 then 
        label_2:setString("名字")
     end
     if self.type ==2 then 
        label_2:setString("联盟名称")
     end
end


function LeagueExploreScoreRankWindow:updataUI()


    local _data = {}
    if self.type==1 then 
        _data = model:getScoreRankData()
        self.title:setString("积分详细")
    end
    if self.type==2 then 
        _data = model:getAtkRankData()
        self.title:setString("排行详细")

    end
    self.item_scrollview:setData(_data,nil,nil ,{type=self.type})
end


function LeagueExploreScoreRankWindow:close_callback()

    self.btn_item_list = {}
    controller:openLeagueExploreScoreRankWindow(false)
end


-- --------------------------------------------------------------------
-- @description:
--      排行奖励
--
-- --------------------------------------------------------------------
LeagueExploreScoreRankItem = class("LeagueExploreScoreRankItem", function()
    return ccui.Layout:create()
end)

function LeagueExploreScoreRankItem:ctor()
    self.item_list = {}
    
    self.root_wnd = createCSBNote(PathTool.getTargetCSB("league_explore/league_explore_score_rank_item"))
    self.size = self.root_wnd:getContentSize()
    self:setAnchorPoint(cc.p(0.5, 0.5))
    self:setContentSize(self.size)

    self.root_wnd:setAnchorPoint(0.5, 0.5)
    self.root_wnd:setPosition(self.size.width * 0.5, self.size.height * 0.5)
    self:addChild(self.root_wnd)


    self.rank = self.root_wnd:getChildByName("rank")
    self.score = self.root_wnd:getChildByName("score")

    self.label_name = createLabel(20, cc.c4b(129,104,65,0xff), nil, 261,  15.33, "名字", self.root_wnd)
     self.label_name:setAnchorPoint(cc.p(0.5, 0.5))

     self.Image_1 = self.root_wnd:getChildByName("Image_1")

    self:registerEvent()
end
function LeagueExploreScoreRankItem:setExtendData(data)
    self.type = data.type 
end

function LeagueExploreScoreRankItem:registerEvent()

end

function LeagueExploreScoreRankItem:setData(data)

    if not data then 
        return
    end 
    if data._index%2 ==1 then
        self.Image_1:setVisible(false)
    else
        self.Image_1:setVisible(true)
    end 

      if self.type ==1 then 
        self.rank:setString(data._index )
        self.label_name:setString(data.name)
        self.score:setString(data.score )
      end 
      if self.type ==2 then 
        self.rank:setString(data._index )
        self.label_name:setString(data.atk_league_name)
        self.score:setString(data.atk_score )
      end 

    -- if self.type == 1 then 
    --     if not self.cameer_name then 
    --         self.cameer_name = createLabel(20, cc.c4b(129,104,65,0xff), nil, 247, 15.33, "职位", self.root_wnd)
    --         self.cameer_name:setAnchorPoint(cc.p(0.5, 0.5))
    --     end
    --     if not self.label_name then 
    --         self.label_name = createLabel(20, cc.c4b(129,104,65,0xff), nil, 390,  15.33, "名字", self.root_wnd)
    --         self.label_name:setAnchorPoint(cc.p(0.5, 0.5))
    --     end

    -- end 
   
    -- if self.type == 2 then 
    --     if not self.label_name then 
    --         self.label_name = createLabel(20, cc.c4b(129,104,65,0xff), nil, 548,  15.33, "联盟名字", self.root_wnd)
    --         self.label_name:setAnchorPoint(cc.p(0.5, 0.5))
    --     end
    -- end 
   

end

function LeagueExploreScoreRankItem:DeleteMe()

  
    self:removeAllChildren()
    self:removeFromParent()
end 
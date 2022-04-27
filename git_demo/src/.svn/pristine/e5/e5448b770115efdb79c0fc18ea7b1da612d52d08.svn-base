-- --------------------------------------------------------------------
-- 这里填写简要说明(必填)
-- @description:
--    探索历练
-- --------------------------------------------------------------------
local controller = BattleNationalWarController:getInstance()
local model = BattleNationalWarController:getInstance():getModel()

local _string_format = string.format
local _table_insert = table.insert
local _table_remove = table.remove

BattleNationalWarOneResultWindow = BattleNationalWarOneResultWindow or BaseClass(BaseView)

function BattleNationalWarOneResultWindow:__init()
    
    self.view_tag = ViewMgrTag.DIALOGUE_TAG
    self.win_type = WinType.Mini
    self.layout_name = "battle_national_war/battle_national_war_one_result_window"
    self.res_list = {
        { path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_104"), type = ResourcesType.single },
    }

    self.rank_list = {}
end

function BattleNationalWarOneResultWindow:open_callback( )
    self.size = cc.size(SCREEN_WIDTH, SCREEN_HEIGHT)
    self.background = self.root_wnd:getChildByName("background")
    self.ui_container = self.root_wnd:getChildByName("ui_container") -- UI层

    self.bg_sprite=  self.ui_container:getChildByName("bg_sprite")
    -- loadSpriteTexture(self.bg_sprite,  PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_104"), LOADTEXT_TYPE)
    -- self.bg_sprite:setOpacity(0)

    self.title =  self.ui_container:getChildByName("title")

end


function BattleNationalWarOneResultWindow:register_event()
    if self.background then
		self.background:addTouchEventListener(function(sender, event_type)
			if event_type == ccui.TouchEventType.ended then
				playQuitSound()
                controller:openNationalOneResultScene(false) 
			end
		end)
	end

  


    --  -- 查看 刷新数据
    --  self:addGlobalEvent(LeagueExploreEvent.Updata_Chanllenge_Result_Data, function (data)
    --     self:updataUI(data)
    -- end)
    -- self:addGlobalEvent(LeagueExploreEvent.Updata_Chanllenge_Team_Data, function (data)
    --     self:updateRewardData()
    -- end)

end

function BattleNationalWarOneResultWindow:openRootWnd()
    -- local _id = model:getResourceID()
    -- controller:sender29307(_id)


    -- local data = model:getAtkBaseRankData()
    -- self:updataUI(data)
end


function BattleNationalWarOneResultWindow:updataUI(data)
    if not data then
        return 
    end 
    local _data = data 

    local role_vo = RoleController:getInstance():getRoleVo()
  
end

function BattleNationalWarOneResultWindow:updateRewardData()
 
    
end 






function BattleNationalWarOneResultWindow:close_callback()

    self.btn_item_list = {}
    controller:openNationalOneResultScene(false)
end


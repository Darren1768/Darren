--[[
    新神器的主面板
]]

NewHallowsMainWindow = NewHallowsMainWindow or BaseClass(BaseView)


local controller = HallowsController:getInstance()
function NewHallowsMainWindow:__init()
    
	self.win_type = WinType.Full
	self.res_list = {
		{path = PathTool.getPlistImgForDownLoad("hallows", "hallows"), type = ResourcesType.plist},
        -- {path = PathTool.getPlistImgForDownLoad("hallows", "new_hallows"), type = ResourcesType.plist},
		{path = PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_76"), type = ResourcesType.single},
        -- {path = PathTool.getSingleImgForDownLoad("hallows","hl_bigbg_77"), type = ResourcesType.single}, --底桌
        -- {path = PathTool.getSingleImgForDownLoad("hallows","hl_bigbg_78"), type = ResourcesType.single}, --圆
        {path = PathTool.getSingleImgForDownLoad("hallows","hl_bigbg_79"), type = ResourcesType.single}, --2级背景图
	}
	self.layout_name = "hallows/new_hallows_main_view"
end

--注册一些事件
function NewHallowsMainWindow:register_event()
    registerButtonEventListener(self.btn_close,function() self:close() end)

    self:addGlobalEvent(HallowsEvent.HallowsInitDataEvent, function ()
        print("==============神器初始化数据回调事件===")
    	self:updateScrollData()
    end)

    self:addGlobalEvent(HallowsEvent.HallowsActivityEvent,function(id)
        --点击激活神器按钮 事件回调
        self:updateScrollData()
    end)
end

--界面关闭清理数据
function NewHallowsMainWindow:close_callback()

end

--在这里处理数据
function NewHallowsMainWindow:openRootWnd()
    -- controller:requestInitProtocals()  --有判断是否开启的请求
    controller:requestHallowsInfo() --没有判断，测试数据
end

function NewHallowsMainWindow:open_callback()
    self:initUiNode()
    self:addScrollView()
    self:playEnterAnimatianByObj(self.layout_top, 1)
    self:playEnterAnimatianByObj(self.layout_bottom_left, 1)
    -- self:playEnterAnimatianByObj(self.layout_bottom_right, 1)
end

--获取csb里面的ui相关
function NewHallowsMainWindow:initUiNode()
    self.background = self.root_wnd:getChildByName("background")
	self.background:setScale(display.getMaxScale())
	self.background:loadTexture(PathTool.getSingleImgForDownLoad("bigbg","hl_bigbg_76"), LOADTEXT_TYPE)

    self.layout_top = self.root_wnd:getChildByName("layout_top")
    self.layout_bottom_left = self.root_wnd:getChildByName("layout_bottom_left")
    -- self.layout_bottom_right = self.root_wnd:getChildByName("layout_bottom_right")

    self.btn_close = self.layout_bottom_left:getChildByName("btn_close")
    self.sp_bg = self.layout_top:getChildByName("sp_bg")
    self.sp_bg:loadTexture(PathTool.getSingleImgForDownLoad("hallows","hl_bigbg_79"))
    self.scroll_panel = self.layout_top:getChildByName("scroll_panel")

end

--添加滑动容器
function NewHallowsMainWindow:addScrollView()
    if self.scroll_view == nil then
        local size = self.scroll_panel:getContentSize()
        local setting = {
            space_x = 0,                    -- x方向的间隔
            item_width = 205,               -- 单元的尺寸width
            item_height = 240,              -- 单元的尺寸height
            delay = 1,
            col =3,                         -- 列数，作用于垂直滚动类型
            need_dynamic = true,
            -- is_auto_scroll =true,       --是否自动判断是否能滚动..个数小于一屏大小时候scroll 不能滚动
        }
        self.scroll_view = CommonScrollViewSingleLayout.new(self.scroll_panel, cc.p(0, 0) , ScrollViewDir.vertical, ScrollViewStartPos.top, size, setting, cc.p(0,0))

        self.scroll_view:registerScriptHandlerSingle(handler(self,self.createNewCell), ScrollViewFuncType.CreateNewCell) --创建cell
        self.scroll_view:registerScriptHandlerSingle(handler(self,self.numberOfCells), ScrollViewFuncType.NumberOfCells) --获取数量
        self.scroll_view:registerScriptHandlerSingle(handler(self,self.updateCellByIndex), ScrollViewFuncType.UpdateCellByIndex) --更新cell
   end
end

function NewHallowsMainWindow:createNewCell()
    local cell = NewHallowsMainItem:new()
    cell:setCallback(handler(self,self.onTouchCellItem))
    return cell
end

function NewHallowsMainWindow:numberOfCells()
    if self.hallows_data then
        return #self.hallows_data
    end
    return 0
end

function NewHallowsMainWindow:updateCellByIndex(cell,index)
    local itemData = self.hallows_data[index]
    if not itemData then return end

    cell:setData(itemData)
end

function NewHallowsMainWindow:updateScrollData()
    self.hallows_data = controller:getModel():getHallowsList() --获得所有神器数据
    print("=====updateScrollData===updateScrollData=",#self.hallows_data)
    self.scroll_view:reloadData()
end



---------------------------------------onTouched----------------------
-- cell的点击回调事件
function NewHallowsMainWindow:onTouchCellItem(itemData)
    if not itemData then return end

    local is_activate = itemData.is_activate ~= 0
    if not is_activate then
        --神器未激活时候显示的弹窗
        controller:openUnlockDialogWindow(true,itemData)
        return
    end
    --激活的神器打开详情 强化 升星界面
    controller:openHallowsStudyWindow(true,itemData)
end
--------------------------------------------
-- @description    : 
		-- 通用的下拉选择
---------------------------------
CommonScreenPanel = class("CommonScreenPanel", function()
    return ccui.Widget:create()
end)

function CommonScreenPanel:ctor(parent,pos,bg_res,width,height,select_bg,celldata)
	self.layout = ccui.Layout:create()
    self.layout.layout:setCascadeOpacityEnabled(true)
    self.layout.layout:setAnchorPoint(0.5,0.5)
    self.layout.layout:setTouchEnabled(true)
    self.layout.layout:setContentSize(cc.size(width, height))
	parent:addChild(self.layout)

	local res = PathTool.getResFrame("common","hl_common_85")
	self.bg_image =  createImage(self.layout, res, 0, 2, cc.p(0, 0), true, 0, true)
    self.bg_image:setContentSize(cc.size(width, height))
	self.bg_image:setCapInsets(cc.rect(8, 10, 2, 1))


     if celldata then 

		for i=1,#celldata do 
			_celldata =  celldata[i]
            local _cell_height = _celldata.height or 30
			local  _callback    = _celldata.callback 
            self:createNewComboxItem(_cell_height,_callback)
		end 
	 end
    

    
    
    self:register_event()
end

function CommonScreenPanel:configUI()
	

    
end

function CommonScreenPanel:register_event(  )

end



function CommonScreenPanel:createNewComboxItem(height, callback)
    local width = 280 
    local height = height or 42
    local cell = {}
    cell.layout = ccui.Layout:create()
    cell.layout:setCascadeOpacityEnabled(true)
    cell.layout:setAnchorPoint(0.5,0.5)
    cell.layout:setTouchEnabled(true)
    cell.layout:setContentSize(cc.size(width, height))

    local size = cc.size(width, height - 2)

    local res = PathTool.getResFrame("common","hl_common_85")
    cell.select_bg = createImage(cell.layout, res, 0, 2, cc.p(0, 0), true, 0, true)
    cell.select_bg:setContentSize(size)
    -- cell.select_bg:setOpacity(90)
    cell.select_bg:setCapInsets(cc.rect(8, 10, 2, 1))
    cell.select_bg:setVisible(false)

    cell.label = createLabel(20, cc.c4b(0xff,0xf9,0xda,0xff), nil, 10, height * 0.5 , "", cell.layout, nil, cc.p(0,0.5))
    local mark_res = PathTool.getResFrame("common", "hl_common_82")
    cell.mark_img = createSprite(mark_res, width - 10, height * 0.5 + 2, cell.layout, cc.p(1,0.5), LOADTEXT_TYPE_PLIST)
    cell.mark_img:setScale(0.8)

    cell.layout:addTouchEventListener(function(sender, event_type)
        if event_type == ccui.TouchEventType.began then
        --     cell.select_bg:setVisible(true)
        --     cell.touch_began = sender:getTouchBeganPosition()
        -- elseif event_type == ccui.TouchEventType.moved then
        --     cell.select_bg:setVisible(false)
        elseif event_type == ccui.TouchEventType.ended then
            -- local touch_began = cell.touch_began
            -- local touch_end = sender:getTouchEndPosition()
            -- if touch_began and touch_end and (math.abs(touch_end.x - touch_began.x) > 10 or math.abs(touch_end.y - touch_began.y) > 10) then 
            --     --点击无效了
            --     return
            -- end 

            playCommonButtonSound()
            -- 点击-->
            if callback then
                callback()
            end
        end
    end)
    return cell
end

function CommonScreenPanel:addCallBack( callback )
	self.clickCallBack = callback
end


function CommonScreenPanel:DeleteMe(  )
	
end
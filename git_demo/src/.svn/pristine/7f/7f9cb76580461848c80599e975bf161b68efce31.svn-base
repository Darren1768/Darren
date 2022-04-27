-- --------------------------------------------------------------------
-- @description:
--      这里填写详细说明,主要填写该模块的功能简要
--
-- --------------------------------------------------------------------
UnionListVo = UnionListVo or BaseClass(EventDispatcher) 

function UnionListVo:__init()
    self.lid = 0
    self.lsrv_id = ""
    self.name = ""
    self.lev = 0
    self.members_num = 0
    self.members_max = 0
    self.leader_name = 0
    self.apply_type = 0
    self.apply_lev = 0
    self.is_apply = FALSE
end

function UnionListVo:updateData(data)
    for k, v in pairs(data) do
        if type(v) ~= "table" then
            self:setUnionAttribute(k, v)
        end
    end 
end

function UnionListVo:setUnionAttribute(key, value)    
	if self[key] ~= value then
		self[key] = value
		self:dispatchUpdateAttrByKey(key, value)
	end
end

function UnionListVo:dispatchUpdateAttrByKey(key, value)
    self:Fire(UnionEvent.UpdateUnionItemEvent, key, value) 
end

function UnionListVo:__delete()
end
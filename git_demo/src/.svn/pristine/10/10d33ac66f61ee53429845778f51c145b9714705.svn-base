-- ----------------------------------------
-- @Description:   公会日志信息
-- --------------------------------------------------------------------
UnionNoticeVo = UnionNoticeVo or BaseClass(EventDispatcher) 

function UnionNoticeVo:__init()
	self.id 			= 0 				-- 日志ID
	self.lid            = 0                 -- 公会的id
	self.lsrv_id        = ""                -- 公会的服务器id
	self.type 			= 0 				-- 日志类型(1:工会战 2：公会捐献 3：公会副本 4：其他)
	self.time 			= 0 				-- 日志记录时间
    self.rid            = 0                 -- 会长角色id
    self.srv_id         = ""                -- 会长角色服务器id
    self.role_name  	= ""				-- 日志记录玩家名
    self.msg            = ""                -- 日志内容
end

function UnionNoticeVo:updateData(data)
	for k, v in pairs(data) do
		if type(v) ~= "table" then
			self:setUnionAttribute(k, v)
		end
	end
end

function UnionNoticeVo:setUnionAttribute(key, value)	
	if self[key] ~= value then
		self[key] = value
	end
end

function UnionNoticeVo:__delete()
end 
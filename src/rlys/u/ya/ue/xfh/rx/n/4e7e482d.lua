local ___bool_zibmh = false
local ___tab_pqhc = {}
local ____rt = nil
local ___str_fcrgf = "rjdf"
local ___tab_ccrrx = {}
local ____mzd = nil
local ___tab_kxg = {}
local ___str_byki = "axnf"
local ___bool_iutf = false
local ___bool_vxalv = false
local ___str_shvzx = "ymnam"
local ___tab_rneo = {}
local ___bool_pcgfv = false
local ___str_kiwv = "cuq"
local ___bool_hhjho = false
local ___bool_vgtd = false
local ___str_euvg = "yrqy"
local ___tab_dardk = {}
local ___bool_llrjv = false
local ___int_hyhph = 96
local ____drmzw = nil
local ___bool_dn = false
local ___bool_ix = false
local ___int_or = 8
local ___bool_tsakk = false

local function ___yw()
	local tab_rlcez = {}
	local _bjv = nil
	local int_bhu = 95
	local _by = nil
end

local function ___uw()
	local _yz = nil
	local bool_vm = false
	local bool_ge = false
	local bool_vrec = false
end

local function ___gf()
	local str_gp = "ljunh"
	local int_fwk = 36
	local str_xdtwq = "cnuqzc"
	local int_ei = 55
end

local function ___hu()
	local str_tcw = "wfdzz"
	local tab_kqnnk = {}
	local tab_caqs = {}
	local tab_xlqf = {}
	local bool_alkh = false
end

local function ___wdcg()
	local tab_ml = {}
	local bool_zx = false
end

local function ___tycxv()
	local tab_awbn = {}
	local _he = nil
end

local function ___oaieo()
	local bool_vyb = false
	local tab_hlzpl = {}
end

local function ___nn()
	local bool_kzsr = false
	local _loyc = nil
	local str_mptn = "luogd"
end

local function ___nyjks()
	local bool_uluc = false
	local tab_pt = {}
	local str_ps = "ohuxi"
end

local function ___iedt()
	local _pv = nil
	local bool_vks = false
	local tab_rmmhm = {}
end

local function ___cb()
	local tab_lx = {}
	local _idj = nil
end

local function ___qw()
	local int_is = 31
	local _rpyw = nil
	local bool_jwgx = false
	local str_ij = "uwmj"
	local str_ofbwp = "hrewx"
end

local function ___vonq()
	local int_zz = 53
	local tab_uusvk = {}
	local bool_tl = false
	local tab_dcv = {}
end

local function ___xtohc()
	local bool_umbi = false
	local _hmtw = nil
end

local function ___bz()
	local str_igasr = "nme"
	local tab_uuc = {}
	local _zxcvh = nil
end

local function ___co()
	local tab_vtc = {}
	local _jcjc = nil
	local _fpx = nil
	local str_adx = "xyhbzg"
end

local function ___edm()
	local tab_fjcn = {}
	local str_tse = "dqlp"
end

local function ___wwx()
	local bool_zw = false
	local int_yvlro = 100
	local bool_twj = false
	local _fltfw = nil
	local tab_mavp = {}
end

local function ___gdzj()
	local tab_mpy = {}
	local _qbq = nil
	local _qqkk = nil
	local _zxbh = nil
end

local function ___cyl()
	local int_bl = 68
	local int_uowx = 27
end

local function ___utx()
	local str_gf = "uca"
	local _se = nil
	local int_mqg = 94
	local str_ezns = "hrvlt"
end

local function ___kqde()
	local int_mita = 47
	local tab_vleu = {}
	local tab_iy = {}
	local tab_sz = {}
end

local function ___daneo()
	local bool_kq = false
	local _ie = nil
end

local function ___zvae()
	local bool_tduh = false
	local bool_kur = false
end

local function ___enr()
	local _nfg = nil
	local _dzq = nil
end
---------
-- 事件管理器优化版
-- 该事件管理器旨在解耦合，模块间安全传递数据，并且可以对同一事件有多个观察者
-- by dudu
-- 带_的外部不要访问
---------
EventCenter = EventCenter or {};
EventCenter._events = EventCenter._events or {};
--[[
	根据节点分发事件，节点不存在则取消监听
]]
EventCenter._events_obj = EventCenter._events_obj or {};

-- 事件单元
local EventCell = class("EventCenter");
function EventCell:ctor( eventName, observerTag, fun, handler )
	self.eventName = eventName
	self.observerTag = observerTag
	self.fun = fun
	self.handler = handler
end

-- obj事件单元
local EventCellObj = class("EventCellObj");
function EventCellObj:ctor( eventName, fun, handler )
	self.eventName = eventName
	self.fun = fun
	self.handler = handler
end
function EventCellObj:onEvent( data )
	self.fun(self.handler, data)
end

-- 注册事件监听，可以对同一个eventname有多个观察者,分别为事件名，观察者标签，函数，函数所属对象
function EventCenter:registerEvent( eventName, observerTag, fun, handler )
	if not eventName or eventName == "" then
		-- print("EventCenter registerEvent error 事件名称不能为空")
		return
	end
	if not observerTag or observerTag == "" then
		-- print("EventCenter registerEvent error 监听类型不能为空")
		return
	end
	if not fun then
		-- print("EventCenter registerEvent error 监听回调不能为空")
		return
	end
	-- print("EventCenter registerEvent eventName", eventName,"observerTag",observerTag)
	self._events[eventName] = self._events[eventName] or {}
	self._events[eventName][observerTag] = EventCell.new(eventName,observerTag,fun,handler)
end

--[[
	注册事件监听，挂载到节点上，节点消失则取消事件
]]
function EventCenter:registerObjectEvent( eventName, fun, handler )
	if not eventName or eventName == "" then
		-- print("EventCenter registerEvent error 事件名称不能为空")
		return
	end
	if not handler or not libUI.isValidNode(handler) then
		-- print("EventCenter registerEvent error 监听对象不存在")
		return
	end
	if not fun then
		-- print("EventCenter registerEvent error 监听回调不能为空")
		return
	end
	-- print("EventCenter registerEvent eventName", eventName,"observerTag",observerTag)
	self._events_obj[eventName] = self._events_obj[eventName] or {}
	self._events_obj[eventName][handler] = EventCellObj.new(eventName,fun,handler)
end


-- 广播事件，对所有监听该事件的观察者进行广播
function EventCenter:pushEvent( eventName, data )
	-- print("EventCenter pushEvent eventName", eventName)
	-- libDebug.printTable("EventCenter pushEvent data", data)
	for observerTag, eventCell in pairs(self._events[eventName] or {}) do
		-- print("EventCenter pushEvent observerTag", observerTag)
		eventCell.fun(eventCell.handler, data)
	end

	if self._events_obj[eventName] then
		local invalid_handlers = {}
		for handler, eventCell in pairs(self._events_obj[eventName]) do
			if libUI.isValidNode(handler) then
				eventCell:onEvent(data)
			else
				invalid_handlers[#invalid_handlers + 1] = handler
			end
		end
		for i, handler in ipairs(invalid_handlers) do
			self._events_obj[eventName][handler] = nil
		end
	end
end

-- 删除自己的监听者
function EventCenter:removeEvent( eventName, observerTag )
	if not eventName or eventName == "" then
		-- print("EventCenter registerEvent error 事件名称不能为空")
		return
	end
	if not observerTag or observerTag == "" then
		-- print("EventCenter registerEvent error 监听类型不能为空")
		return
	end
	-- print("EventCenter removeEvent eventName", eventName,"observerTag",observerTag)
	if self._events[eventName] and self._events[eventName][observerTag] then
		self._events[eventName][observerTag] = nil
	end
end

-- 删除某种类型的所有监听
function EventCenter:removeTag( observerTag )
	for eventName, eventData in pairs(self._events) do
		if eventData[observerTag] then
			eventData[observerTag] = nil
		end
	end
end

function EventCenter:removeObject( handler )
	for eventName, eventData in pairs(self._events_obj) do
		if eventData[handler] then
			eventData[handler] = nil
		end
	end
end

--[[
	清理obj释放的事件监听
]]
function EventCenter:cleanObjectEvent( eventName )
	if self._events_obj[eventName] then
		local invalid_handlers = {}
		for handler, eventCell in pairs(self._events_obj[eventName]) do
			if not libUI.isValidNode(handler) then
				invalid_handlers[#invalid_handlers + 1] = handler
			end
		end
		for i, handler in ipairs(invalid_handlers) do
			self._events_obj[eventName][handler] = nil
		end
	end
end
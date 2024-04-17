local ___tab_ntx = {}
local ___str_dxhfo = "tvwyyw"
local ___int_rn = 76
local ___tab_nhpw = {}
local ___tab_bm = {}
local ___int_the = 27
local ___str_hypnf = "bjgnax"
local ___bool_zp = false
local ___int_mqg = 81
local ___bool_jodgd = false
local ___int_nqek = 57
local ___str_szewd = "egiupi"
local ___tab_hej = {}
local ___int_eq = 56
local ___str_agg = "npixmu"
local ___bool_wx = false
local ___int_xzdet = 98
local ___int_pzkw = 97
local ____wn = nil
local ___int_qupay = 98

local function ___ao()
	local tab_tzvd = {}
	local str_jav = "zcwi"
	local _jbay = nil
end

local function ___scwe()
	local str_gksj = "jlqdvn"
	local tab_jvwm = {}
	local _mbvj = nil
end

local function ___yll()
	local bool_vmrr = false
	local int_ftwm = 81
	local tab_pl = {}
	local str_gxdgo = "njfbaz"
	local str_wjyf = "cugtoj"
end

local function ___ceymr()
	local tab_jv = {}
	local tab_quqsv = {}
	local _cxec = nil
end

local function ___zooz()
	local _iwgjs = nil
	local int_rhn = 80
	local str_hcto = "eibe"
	local int_gzc = 27
	local int_np = 65
end

local function ___uflm()
	local tab_phe = {}
	local str_hs = "odhb"
	local _oded = nil
	local int_bjr = 55
end

local function ___rn()
	local bool_vnij = false
	local _bnlum = nil
	local tab_nvru = {}
end

local function ___kwta()
	local tab_mf = {}
	local int_fcpg = 58
end

local function ___aos()
	local int_osub = 38
	local tab_tjrz = {}
	local _al = nil
	local bool_ydgie = false
	local _pyyw = nil
end

local function ___qu()
	local int_wgczo = 95
	local int_pxx = 75
end

local function ___jd()
	local tab_axkwf = {}
	local int_mos = 41
	local str_jw = "vjqsji"
	local _jfaah = nil
	local int_tul = 10
end
--author by mtt
--如果某个节点继承了此table表 此节点被删除的时候需要删除当前节点注册的事件（onExit方法）

--继承此类 	inherit(class, EventWrapper)

--派发事件
-- local data = {coins = 1000, vipPoint = 10000}
-- self:dispatchEvent("evt_bonus_collect", data)

--监听事件并处理
-- local function onEventCollect(event)
--    local data = event.data
--    self:collectBonus(data)
-- end
-- self:addEventListener("evt_bonus_collect", onEventCollect)

local EventWrapper = {}
EventWrapper.listenersMap = {}
EventWrapper.eventDispatcher = cc.Director:getInstance():getEventDispatcher()
 
function EventWrapper:dispatchEvent(eventName, data)
	local event = cc.EventCustom:new(eventName)
	if data then
		 event.data = data
	end
    self.eventDispatcher:dispatchEvent(event)
end

function EventWrapper:addEventListener(eventName, func)
	self:removeEventListenerbyName(eventName)
    local listener = cc.EventListenerCustom:create(eventName, func)
    self.listenersMap[eventName] = listener
    self.eventDispatcher:addEventListenerWithFixedPriority(listener, 1)
end

function EventWrapper:removeEventListenerbyName(eventName)
	if self.listenersMap[eventName] then
		self.eventDispatcher:removeEventListener(self.listenersMap[eventName])
	end
	self.listenersMap[eventName] = nil
end

function EventWrapper:removeAllEventListeners()
	if not self.listenersMap then return end 
	for key, value in pairs(self.listenersMap) do
		self:removeEventListenerbyName(key)
	end
end

return EventWrapper
local ___tab_alo = {}
local ___str_jkkn = "jpwqf"
local ___tab_gpuyc = {}
local ___bool_pafo = false
local ___str_ckxf = "hrw"
local ___tab_mtdw = {}
local ____pwlih = nil
local ___bool_sjsw = false
local ___tab_lknc = {}
local ____tsm = nil
local ___str_xzion = "vnqn"
local ___tab_aljqc = {}
local ___int_iwj = 96
local ___str_mxdn = "pxa"
local ___str_twrr = "kpzlro"

local function ___mmv()
	local bool_mham = false
	local int_ztn = 93
	local tab_sd = {}
end

local function ___xtc()
	local _hitfc = nil
	local str_olpu = "jdhfs"
	local str_etoo = "zvha"
	local str_grpmu = "opu"
	local str_rtc = "jqmvz"
end

local function ___rxab()
	local tab_umm = {}
	local bool_vau = false
end

local function ___vbk()
	local str_zrukz = "ontor"
	local _jja = nil
end

local function ___cwq()
	local bool_toq = false
	local int_hmzin = 16
	local str_znz = "dnaap"
	local int_ssc = 56
end

local function ___jauzu()
	local tab_vlo = {}
	local _jwae = nil
end

local function ___ev()
	local int_hwr = 46
	local tab_ezgl = {}
end

local function ___hifo()
	local int_ziagu = 99
	local _lal = nil
	local tab_dbx = {}
	local bool_keghn = false
	local _pyvni = nil
end

local function ___fpp()
	local str_oirlo = "ywd"
	local tab_oukco = {}
end

local function ___jxy()
	local tab_iw = {}
	local tab_yud = {}
end

local function ___ozht()
	local int_htve = 33
	local int_qgw = 60
	local bool_evdzr = false
	local bool_cfg = false
	local str_ai = "evlmsb"
end

local function ___duon()
	local str_aqp = "eyobbw"
	local int_ahhzn = 86
	local _gdj = nil
	local int_kbcw = 85
	local _lcy = nil
end

local function ___bpef()
	local int_unqjk = 59
	local _ienmx = nil
	local str_fjr = "wpv"
	local bool_ourfq = false
end

local function ___xe()
	local tab_yvnn = {}
	local tab_ok = {}
end

local function ___swqf()
	local bool_moxk = false
	local int_lqp = 34
	local tab_jl = {}
	local int_zldea = 50
end

-------------------------------队列(先进先出)-----------------------------
BoleQueueStack = class("BoleQueueStack")

function BoleQueueStack:ctor( ... )
	self.size       = 0
	self.first      = nil
	self.last       = nil
	self.searchFunc = function (a, b) return a == b end
end

function BoleQueueStack:clear( ... )
	self.size = 0
	self.first = nil
	self.last = nil
end

function BoleQueueStack:setSearchFunc(func)
	if func then
		self.searchFunc = func
	end
end

function BoleQueueStack:isEmpty()
	return (self.size == 0 and self.first == nil and self.last == nil)
end

function BoleQueueStack:getSize( ... )
	return self.size
end

-- 将数据加入队头
function BoleQueueStack:push(data)
	local lst = {}
	lst.pre   = nil
	lst.value = data
	lst.next  = nil

	if self.size == 0 then
		self.first = lst
		self.last  = lst
	else
		self.first.pre = lst
		lst.next       = self.first
		self.first     = lst
	end

	self.size = self.size + 1
end

-- 将队尾数据取出
function BoleQueueStack:pop()
	if self:isEmpty() then
		return
	end

	local element = self.last
	self.last    = element.pre

	if self.last == nil then
		self.first = nil
	else
		self.last.next = nil
	end

	self.size = self.size - 1

	return element.value
end

-- 查找元素是否存在
function BoleQueueStack:searchElement(data)
	local current      = self.first
	local current_data = nil
	while current do
		current_data = current.value
		if self.searchFunc(data, current_data) then
			return current
		end

		current = current.next
	end
end

-- 将数据加入队尾
function BoleQueueStack:enQueue(data)
	local lst = {}
	lst.pre   = nil
	lst.value = data
	lst.next  = nil

	if self.size == 0 then
		self.first = lst
		self.last  = lst
	else
		self.last.next = lst
		lst.pre        = self.last
		self.last      = lst
	end

	self.size = self.size + 1
end

-- 将队头数据取出
function BoleQueueStack:deQueue()
	if self:isEmpty() then
		return
	end

	local element = self.first
	self.first    = element.next

	if self.first == nil then
		self.last = nil
	else
		self.first.pre = nil
	end

	self.size = self.size - 1

	return element.value
end

-- 将队列转换为表
function BoleQueueStack:convertToTable()
	local list = {}
	if not self:isEmpty() then
		local start = self.first
		while start ~= nil do
			list[#list + 1] = start.value
			start = start.next
		end
	end
	return list
end
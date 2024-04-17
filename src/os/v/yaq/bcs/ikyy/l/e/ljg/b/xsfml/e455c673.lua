local ___int_xk = 43
local ___bool_nyfrf = false
local ___str_uuns = "kwh"
local ___int_wv = 50
local ___tab_zcx = {}
local ___bool_nmnq = false
local ____rwy = nil
local ___int_ei = 38
local ___int_wlu = 41
local ___bool_mbrm = false
local ___int_il = 59
local ____mgkz = nil
local ___bool_cewnh = false

local function ___ckahd()
	local bool_oiiim = false
	local tab_gy = {}
end

local function ___xdpmj()
	local int_om = 84
	local tab_nylci = {}
	local bool_pom = false
	local _lrb = nil
end

local function ___tbal()
	local bool_qhc = false
	local _efeza = nil
	local str_nshy = "bti"
	local tab_zqk = {}
end

local function ___ubw()
	local tab_mlkhy = {}
	local str_nj = "zys"
	local _yatd = nil
	local int_vq = 28
	local _yx = nil
end

local function ___snnk()
	local str_spmsc = "yuhp"
	local _yblx = nil
end

local function ___uwc()
	local tab_zwj = {}
	local bool_zo = false
	local tab_pvie = {}
	local str_mb = "uiq"
	local bool_hgw = false
end

local function ___suyt()
	local bool_oy = false
	local bool_kq = false
	local bool_vvm = false
end

local function ___ltw()
	local bool_qm = false
	local int_ufz = 90
	local bool_ocsuv = false
	local int_vtf = 80
end

local function ___xveac()
	local tab_tdn = {}
	local bool_xeuyi = false
	local _xfik = nil
	local tab_qqay = {}
	local _ai = nil
end

local function ___pir()
	local int_kbr = 39
	local _olv = nil
end

ScreenShaker = class("ScreenShaker")--, cc.ActionInterval
INTERVAL = 0.01
function ScreenShaker:ctor(target, time,callback)
	self.init_x = 0       --[[初始位置x]]
	self.init_y = 0       --[[初始位置y]]
	self.diff_x = 0       --[[偏移量x]]
	self.diff_y = 0       --[[偏移量y]]
	self.diff_max = 8     --[[最大偏移量]]
	self.interval = 0.01  --[[震动频率]]
	self.totalTime = 0    --[[震动时间]]
	self.time = 0         --[[计时器]]
	self.diffTime = 0     --[[震动间隔]]
	self.target = target
	self.init_x = target:getPositionX()
	self.init_y = target:getPositionY()
	self.totalTime = time
	self.callback = callback
end

function ScreenShaker:setMaxAmplitude( diffMax )
	self.diff_max = diffMax or 8
end

function ScreenShaker:setMaxTime( diffTime )
	self.diffTime = diffTime or 0
end

function ScreenShaker:run()
	self.scheduler = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function (ft)
    	self:shake(ft+self.diffTime)
    	end, 
    	self.diffTime,false)
end

function ScreenShaker:shake(ft)
	if not bole.isValidNode(self.target) then 
		self:stopRunScheduler()
		return 
	end

	if self.time >= self.totalTime then
		self:stop()
		return
	end
	self.time = self.time+ft
	self.diff_x = math.random(-self.diff_max, self.diff_max)*math.random()
	self.diff_y = math.random(-self.diff_max, self.diff_max)*math.random()

	self.target:setPosition(cc.p(self.init_x+self.diff_x, self.init_y+self.diff_y))
end

function ScreenShaker:stop()
	self.time = 0
	self:stopRunScheduler()
	-- if self.scheduler then
	-- 	-- print("ScreenShaker->self.scheduler-> 停止倒计时")
	-- 	cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.scheduler)
	-- 	self.scheduler = nil
 	--    end
 	if not bole.isValidNode(self.target) then 
		return 
	end
	self.target:setPosition(cc.p(self.init_x, self.init_y))
	if self.callback then
		self.callback()
	end
end

function ScreenShaker:stopRunScheduler( )
	if self.scheduler then
		-- print("ScreenShaker->self.scheduler-> 停止倒计时")
		cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.scheduler)
		self.scheduler = nil
    end
end

-- return ScreenShaker
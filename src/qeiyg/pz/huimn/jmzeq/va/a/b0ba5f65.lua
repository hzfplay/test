local ___tab_zx = {}
local ____hi = nil
local ____yuhi = nil
local ___bool_oda = false
local ___tab_jsf = {}
local ___int_wr = 89
local ___int_xz = 10
local ___bool_gvfv = false
local ___bool_ryeez = false
local ___int_wvh = 85
local ___tab_gusn = {}
local ___bool_yh = false
local ___bool_zixkq = false
local ___bool_rit = false
local ___bool_lqu = false
local ___int_jbioq = 5
local ___str_jeyok = "ajt"
local ____so = nil
local ___int_pw = 4
local ___tab_gui = {}
local ___int_qfz = 77
local ___bool_oi = false

local function ___bjhad()
	local str_lsphn = "lop"
	local str_hf = "hrfost"
	local tab_qwzc = {}
end

local function ___biyu()
	local str_yolbm = "uwtmb"
	local _xgkuw = nil
	local tab_gvocn = {}
	local tab_nag = {}
	local str_tarqx = "vkl"
end

local function ___vwa()
	local bool_el = false
	local int_ug = 24
	local bool_yvogn = false
end

local function ___pjkh()
	local tab_dl = {}
	local tab_nhv = {}
	local _zl = nil
end

local function ___nglu()
	local bool_qzdjq = false
	local str_wcbwc = "rumpje"
end

local function ___sgus()
	local int_tzzd = 59
	local bool_rteb = false
end

local function ___xbiu()
	local tab_tcy = {}
	local tab_fl = {}
	local bool_jp = false
	local bool_butj = false
end

local function ___eeslt()
	local bool_psn = false
	local str_bte = "fmhjax"
	local tab_fu = {}
end

local function ___qgpzv()
	local int_fvdxj = 41
	local int_fkt = 79
	local int_xgv = 56
	local str_wl = "ugfsbz"
end

local function ___iwbl()
	local bool_kxosy = false
	local int_oxrk = 65
	local bool_liusm = false
	local bool_lhep = false
end

local function ___ijz()
	local bool_vbuzv = false
	local bool_ui = false
end

local function ___uqy()
	local _funm = nil
	local tab_pxuk = {}
	local int_bmzk = 31
	local int_qqs = 82
	local int_un = 22
end

local function ___njgcb()
	local _nb = nil
	local int_nji = 94
	local _agub = nil
	local int_bi = 24
end

local function ___keg()
	local int_ef = 2
	local str_hcy = "yhrom"
	local int_hisfb = 2
end

local function ___pqdd()
	local _jsp = nil
	local bool_iaf = false
	local bool_rhn = false
	local int_tg = 13
end

local function ___ehix()
	local tab_gdbz = {}
	local int_datk = 73
end

local function ___hb()
	local int_lbrpo = 12
	local str_gjjec = "fib"
	local bool_cs = false
end

local function ___estn()
	local int_ow = 40
	local tab_mmlk = {}
	local int_jx = 77
	local int_ppi = 30
	local bool_rwpa = false
end

local function ___ngypd()
	local bool_wnau = false
	local tab_nkte = {}
end

local function ___kou()
	local str_md = "llgjky"
	local tab_sw = {}
	local bool_aj = false
	local _wrvl = nil
end

local function ___mvag()
	local int_twl = 57
	local tab_sa = {}
	local _yhq = nil
end

local function ___rjkfm()
	local str_fuce = "qip"
	local str_lqu = "wvk"
	local str_tzcjj = "zdhtjt"
end

local function ___putzh()
	local tab_uw = {}
	local _nx = nil
end

local function ___xrqf()
	local tab_umil = {}
	local _ic = nil
	local str_cigua = "rknzk"
end

local function ___ojtrv()
	local tab_uwluu = {}
	local _oh = nil
	local int_ym = 20
end

local function ___yenu()
	local tab_pv = {}
	local int_ljmn = 6
	local str_jxo = "pnbx"
end

local function ___bjws()
	local str_hptdd = "hhz"
	local str_izqgi = "puu"
	local bool_xsixp = false
end

local function ___puuql()
	local int_had = 45
	local bool_ler = false
	local tab_ee = {}
end

local FPS = 30
local INTERVAL = 1 / FPS

----------------------

FrameAnimationParticleSystem = class("FrameAnimationParticleSystem", function () return cc.Node:create() end)

function FrameAnimationParticleSystem:ctor (frameAnimCacheName, frameFile, startFrame, endFrame, frameRate)
	-- if frameAnim's start frame index is required to be random, then can't use Cocos Animation
	-- else can cache Animation for better performance
	self.frameAnimCacheName = frameAnimCacheName
	self.frameFile = frameFile
	self.startFrame = startFrame
	self.endFrame = endFrame
	self.frameRate = frameRate

	if frameAnimCacheName then
		Display.cacheFrameAnimation(frameAnimCacheName, frameFile, startFrame, endFrame, frameRate)
	end

	self.conf = {}
	self.conf.num = num
	self.conf.numVar = 0
	self.conf.pos = cc.p(0, 0)
	self.conf.posVar = cc.p(0, 0)
	self.conf.startAnimScale = 1
	self.conf.startAnimScaleVar = 0
	self.conf.timeSpan = 0
	self.conf.timeSpanVar = 0
	self.conf.lifeTime = 5
	self.conf.lifeTimeVar = 0
	self.conf.speed = 0
	self.conf.speedVar = 0
	self.conf.endSpeed = 0
	self.conf.endSpeedVar = 0
	self.conf.startAngle = 0
	self.conf.startAngleVar = 0
	self.conf.gravity = nil
	self.conf.startRotation = 0
	self.conf.startRotationVar = 0
	self.conf.rotatePerSecond = 0
	self.conf.rotatePerSecondVar = 0

	self.timeElapsed = 0

	self.particles = { }
end


function FrameAnimationParticleSystem:start ()
	self.num = self.conf.num + math.random(-100, 100) * 0.01 * self.conf.numVar
	self.timeSpan = self.conf.timeSpan + math.random(-100, 100) * 0.01 * self.conf.timeSpanVar
	self.lifeTime = self.conf.lifeTime + math.random(-100, 100) * 0.01 * self.conf.lifeTimeVar
	self.speed = self.conf.speed + math.random(-100, 100) * 0.01 * self.conf.speedVar
	self.startAngle = self.conf.startAngle + math.random(-100, 100) * 0.01 * self.conf.startAngleVar
	self.rotatePerSecond = self.conf.rotatePerSecond + math.random(-100, 100) * 0.01 * self.conf.rotatePerSecondVar

	-- loop to add particle
	self.genTimes = { }
	for i = 1, self.num do
		if self.timeSpan > 0 then
			table.insert(self.genTimes, math.random() * self.timeSpan)
		else
			table.insert(self.genTimes, 0)
		end
	end
	table.sort(self.genTimes)
	
	local function _gameLogic (dt)
		self:gameLogic(dt)
	end
	self:scheduleUpdateWithPriorityLua(_gameLogic, 0)
	-- self:gameLogic()
end

function FrameAnimationParticleSystem:setNum (num, numVar)
	self.conf.num = num
	self.conf.numVar = numVar or 0
end

-- second
function FrameAnimationParticleSystem:setTimeSpan (timeSpan, timeSpanVar)
	self.conf.timeSpan = timeSpan
	self.conf.timeSpanVar = timeSpanVar or 0
end

-- second
function FrameAnimationParticleSystem:setLifeTime (lifeTime, liftTimeVar)
	self.conf.lifeTime = lifeTime
	self.conf.liftTimeVar = liftTimeVar or 0
end

function FrameAnimationParticleSystem:setPos (pos, posVar)
	self.conf.pos = pos or cc.p(0, 0)
	self.conf.posVar = posVar or cc.p(0, 0)
end

function FrameAnimationParticleSystem:setStartAnimScale (s, sVar)
	self.conf.startAnimScale = s
	self.conf.startAnimScaleVar = sVar or 0
end

-- speed = pixel per sec
function FrameAnimationParticleSystem:setStartSpeed (speed, speedVar)
	self.conf.startSpeed = speed
	self.conf.startSpeedVar = speedVar or 0
end

function FrameAnimationParticleSystem:setEndSpeed (speed, speedVar)
	self.conf.endSpeed = speed
	self.conf.endSpeedVar = speedVar or 0
end

-- ccw from x-axis, movement
function FrameAnimationParticleSystem:setAngle (angle, angleVar)
	self.conf.angle = angle
	self.conf.angleVar = angleVar or 0
end

function FrameAnimationParticleSystem:setGravity (gravity)
	self.conf.gravity = gravity
end

-- degree cw
function FrameAnimationParticleSystem:setStartRotation (r, rVar)
	self.conf.startRotation = r
	self.conf.startRotationVar = rVar or 0
end

-- degree cw
function FrameAnimationParticleSystem:setRotatePerSecond (rps, rpsVar)
	self.conf.rotatePerSecond = rps
	self.conf.rotatePerSecondVar = rpsVar or 0
end

function FrameAnimationParticleSystem:addParticle ()
	local p = FrameAnimationParticle.new(self)
	table.insert(self.particles, p)
end

function FrameAnimationParticleSystem:gameLogic (dt)
	if self.ended then return end
	self.timeElapsed = self.timeElapsed + dt
	-- add new particles
	while #self.genTimes > 0 do
		if self.genTimes[1] > self.timeElapsed then break end
		table.remove(self.genTimes, 1)

		self:addParticle()
	end
	for i, p in pairs(self.particles) do
		if p then
			p:gameLogic(dt)
			if p.cd <= 0 then
				-- remove it
				p:removeFromParent()
				table.remove(self.particles, i)
			end
		end
	end
	if 0 == #self.genTimes and 0 == #self.particles then
		-- remove self
		self.ended = true
		self:removeFromParent()
	end

	-- self:runAction(cc.RepeatForever:create(cc.Sequence:create(cc.CallFunc:create(logic), cc.DelayTime:create(INTERVAL))))
end

------------------------

FrameAnimationParticle = class("FrameAnimationParticle", function () return cc.Node:create() end)

function FrameAnimationParticle:ctor (particleSystem)
	self.particleSystem = particleSystem
	self.conf = particleSystem.conf

	self.pos = cc.pAdd(self.conf.pos, cc.pMul(self.conf.posVar, math.random(-100, 100) * 0.01))
	self.animScale = self.conf.startAnimScale + self.conf.startAnimScaleVar, math.random(-100, 100) * 0.01
	self.lifeTime = self.conf.lifeTime + math.random(-100, 100) * 0.01 * self.conf.lifeTimeVar
	self.startSpeed = self.conf.startSpeed + math.random(-100, 100) * 0.01 * self.conf.startSpeedVar
	self.endSpeed = self.conf.endSpeed + math.random(-100, 100) * 0.01 * self.conf.endSpeedVar
	self.angle = self.conf.angle + math.random(-100, 100) * 0.01 * self.conf.angleVar
	self.speedVec =  cc.pRotateByAngle(cc.p(self.startSpeed, 0), cc.p(0, 0), math.pi * self.angle / 180)
	self.accelerateVec = cc.pMul(cc.pSub(cc.pRotateByAngle(cc.p(self.endSpeed, 0), cc.p(0, 0), math.pi * self.angle / 180), self.speedVec), 1 / self.lifeTime)
	local startRotation = self.conf.startRotation + math.random(-100, 100) * 0.01 * self.conf.startRotationVar
	self.rotatePerSecond = self.conf.rotatePerSecond + math.random(-100, 100) * 0.01 * self.conf.rotatePerSecondVar

	if particleSystem.frameAnimCacheName then
		-- Frame Animation's start frame index can NOT be random
		Display.playFrameAnimationByName(self, self.pos, particleSystem.frameAnimCacheName, nil, true)
	else
		Display.playSelfAnimation(self, {particleSystem.frameFile, true}, self.pos,
			math.random(particleSystem.startFrame, particleSystem.endFrame), particleSystem.endFrame, particleSystem.frameRate, true)
	end
	self:setRotation(startRotation)

	particleSystem:addChild(self)

	self.cd = self.lifeTime
end

function FrameAnimationParticle:gameLogic (dt)

	if self.cd <= 0 then return end

	if self.conf.gravity then
		self.speedVec.y = self.speedVec.y - self.conf.gravity * dt
	end
	
	-- pos
	local posDelta = cc.pMul(self.speedVec, dt)
	self.pos = cc.pAdd(self.pos, posDelta)
	self:setPosition(self.pos)

	-- scale
	self:setScale(self.animScale)

	-- rotate per second
	self:setRotation(self:getRotation() + self.rotatePerSecond * dt)

	self.cd = self.cd - dt
	if self.cd <= 0 then
		--self:removeFromParent()
	end

end


local ____id = nil
local ___int_bjfw = 30
local ____bv = nil
local ___int_cl = 69
local ___bool_rxhm = false
local ____ao = nil
local ___tab_gz = {}
local ___int_yvvua = 12
local ___str_ivvfs = "bzu"
local ____keh = nil
local ___bool_ip = false
local ___str_nfyn = "jodc"
local ___tab_jxhm = {}
local ___tab_fm = {}
local ___bool_hcybt = false

local function ___xumpf()
	local str_dgi = "bcggf"
	local str_ohpst = "uddftj"
	local bool_vx = false
	local bool_xhpzv = false
end

local function ___djt()
	local tab_kdm = {}
	local bool_ck = false
	local bool_vf = false
end

local function ___lt()
	local str_txu = "xipfpj"
	local str_ob = "vcu"
	local bool_rked = false
	local tab_wucpa = {}
end

local function ___to()
	local int_soefe = 46
	local tab_kk = {}
	local str_ooqk = "rvuhwc"
end

local function ___ql()
	local _evyy = nil
	local tab_ytio = {}
end

local function ___akexc()
	local int_lcbfk = 80
	local int_ieb = 35
	local str_ixz = "xom"
	local int_lnqjd = 77
end

local function ___vg()
	local tab_mn = {}
	local tab_mtla = {}
	local int_sxyee = 6
	local _scoaf = nil
end

local function ___bheyd()
	local tab_zkbw = {}
	local str_osc = "mpgzc"
	local tab_exfb = {}
	local tab_rwtjm = {}
	local int_ueem = 46
end

local function ___gsy()
	local str_sgp = "fue"
	local bool_warp = false
end

local function ___yfy()
	local int_issl = 56
	local tab_ivj = {}
	local _zmho = nil
	local str_xe = "vpyjb"
end

local function ___yqpt()
	local bool_kwyhy = false
	local int_ngp = 7
end

local function ___syzeh()
	local bool_wds = false
	local _tdde = nil
end

local function ___cso()
	local int_bcr = 26
	local bool_tbq = false
	local int_pv = 43
	local tab_iqmw = {}
end

local function ___ft()
	local str_zyeu = "yepbb"
	local _coe = nil
end

local function ___buuw()
	local int_lxex = 25
	local tab_azcz = {}
	local bool_qstkf = false
	local _oifog = nil
end

local function ___ajkqg()
	local int_hd = 89
	local _dbrcc = nil
end

local function ___jqo()
	local int_svso = 88
	local bool_jp = false
end

local function ___ruo()
	local str_zbir = "gpdfe"
	local tab_vtln = {}
	local _snyfm = nil
	local _jkrx = nil
	local int_du = 0
end

local function ___occ()
	local tab_rchlm = {}
	local tab_lum = {}
	local bool_tn = false
end

local function ___fsfm()
	local tab_hbna = {}
	local int_lub = 1
end

local function ___rj()
	local _kool = nil
	local _vre = nil
end

local function ___rmkma()
	local int_jvcx = 86
	local tab_xwap = {}
	local _kuq = nil
end

local function ___bsco()
	local int_wbroh = 57
	local _hra = nil
end

local function ___riebs()
	local str_ud = "mjcztl"
	local tab_zief = {}
	local int_epfib = 11
	local _xjq = nil
	local str_lpbeg = "qqouyo"
end

local function ___lxtx()
	local tab_kk = {}
	local tab_bywo = {}
	local _tfea = nil
end

local function ___tjccc()
	local bool_wpaok = false
	local str_czf = "voigtv"
end

local function ___yo()
	local _bkv = nil
	local bool_xv = false
end

local function ___zy()
	local tab_fkndm = {}
	local int_dt = 10
	local int_urbb = 42
	local _zee = nil
end
JackpotUpdateClass = {}

local ACTION_TAG_JP_NUM_ROLL = 11111111

--[[
-- 格式化jackpot数值
]]--
function JackpotUpdateClass:parserFunc(n)
	local last = ""
	self.allowK = self.allowK or false
	if self.allowK then
		n = n / 1000
		n = math.floor(n)
		last = "K"
	end
	return FONTS.format(n, true) .. last
end

-- 初始化
function JackpotUpdateClass:initial(allowK)
	-- jackpot显示值
	self.showValue = 0
	-- jackpot滚动目标值
	self.aimValue  = 0
	-- jackpot数值格式是否需要在末尾显示K
	self.allowK = allowK
	-- jackpot数据刷新间隔，最小1/25
	self.updateTime = 1/16
	-- jackpot步长，最小为1
	self.step = 1
	-- jackpot每隔多少次刷新一遍
	self.updateCount = 1
	-- jackpot每次roll循环的次数
	self.countPerRoll = 0
end

function JackpotUpdateClass:startRoll(jpData)
	-- 停止roll action
	self:stopRoll()
	-- 更新新一轮roll的数据
	self:updateRollData(jpData,true)

	local action = cc.RepeatForever:create(cc.Sequence:create(
		cc.DelayTime:create(self.updateTime), 
		cc.CallFunc:create(function ()
			if self.isPaused then
				return
			end
			self.jpData.increment = self.jpData.increment + self.jpData.increaseRate
			local tempValue = self.jpData.resetValue + self.jpData.increment
			-- 显示当前计算值
			self:setString(self:parserFunc(tempValue))
			if self.needUpdateScale or self.jpData.isUpdated then
				self.needUpdateScale = false
				self.jpData.isUpdated = false
				if self.jpData.aimIncrement then
					if self.jpData.aimIncrement > self.jpData.increment then
						self.jpData.increaseRate = self.baseIncreaseRate + (self.jpData.aimIncrement-self.jpData.increment)/30*self.updateTime
						-- print("zhf add increaseRate ",self.baseIncreaseRate, self.jpData.increaseRate)
					else
						self.jpData.increment = self.jpData.aimIncrement
						self.jpData.aimIncrement = nil
						self.jpData.increaseRate = self.baseIncreaseRate
						-- print("zhf resume increaseRate ",self.baseIncreaseRate, self.jpData.increaseRate)
					end
				end
				self:updateJackpotScale()
			end
	end)))

	action:setTag(ACTION_TAG_JP_NUM_ROLL)
	local tempValue = self.jpData.resetValue + self.jpData.increment
    self:setString(self:parserFunc(tempValue))
    self:updateJackpotScale()
	self:runAction(action)
end

function JackpotUpdateClass:updateRollData(jpData)
	-- print("zhf updateRollData maxWidth = ",self.baseScale,self.maxWidth,self,tool.lua_to_json(jpData))
	self.jpData = jpData
	self.baseIncreaseRate = self.jpData.increaseRate
	self.needUpdateScale = true
end

function JackpotUpdateClass:updateJackpotScale()
	local maxWidth = self.maxWidth
	local curValue = self:getString()
	-- self:setString(curValue)
	if maxWidth then
		local tempWidth = self:getContentSize().width
		-- print("zhf updateJackpotScale tempWidth = ",tempWidth)
		local scale = maxWidth/tempWidth
		local endScale = (scale > self.baseScale) and self.baseScale or scale
		self:setScale(endScale)
	end
end

function JackpotUpdateClass:stopRoll()
	if libUI.isValidNode(self) then
		self:stopActionByTag(ACTION_TAG_JP_NUM_ROLL)
	end
end

function JackpotUpdateClass:pauseRoll()
	self.isPaused = true
	self:updateJackpotScale()
end

function JackpotUpdateClass:resumeRoll()
	self.isPaused = false
	self:updateJackpotScale()
end

function JackpotUpdateClass:getShowValue()
	return self.showValue
end

function JackpotUpdateClass:getAimValue()
	return self.aimValue
end
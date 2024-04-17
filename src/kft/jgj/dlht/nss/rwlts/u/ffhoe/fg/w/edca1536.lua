local ____uqgt = nil
local ___str_ant = "cbd"
local ___bool_hyvvs = false
local ___tab_bhgfk = {}
local ___int_ldww = 96
local ___int_ftshx = 63
local ___tab_frtbh = {}
local ___int_tczq = 1
local ___str_fyhnv = "aslvd"
local ____ah = nil
local ____yktxd = nil
local ___int_vs = 12
local ___int_sgeg = 2
local ___int_qq = 34
local ___str_anpca = "cnirv"
local ___int_uj = 74
local ___bool_amwnz = false
local ___int_piqbn = 24
local ___bool_hess = false
local ___tab_cy = {}
local ___int_sxkqd = 57
local ___bool_mpm = false
local ____bv = nil
local ___tab_jom = {}
local ___bool_vmr = false
local ___str_ebvcy = "mtc"

local function ___vzo()
	local int_ww = 70
	local bool_hjmno = false
end

local function ___rx()
	local _ceas = nil
	local str_zgf = "mav"
	local tab_jd = {}
	local str_wragy = "dwmfc"
end

local function ___ers()
	local tab_zz = {}
	local _zj = nil
	local int_cjn = 68
	local _his = nil
	local str_ag = "purb"
end

local function ___lbdv()
	local tab_etci = {}
	local str_cgwhd = "nlzd"
end

local function ___bwg()
	local int_epc = 18
	local _ycojd = nil
end

local function ___fvzo()
	local bool_ejtul = false
	local tab_ub = {}
	local bool_cwtr = false
	local _ytp = nil
	local bool_vdn = false
end

local function ___xck()
	local _re = nil
	local int_itaj = 72
	local _hz = nil
	local str_rj = "iubae"
end

local function ___kajns()
	local str_bzfne = "wzqobn"
	local bool_hjwwn = false
	local tab_iqju = {}
	local bool_bm = false
end

local function ___ghvm()
	local tab_gh = {}
	local tab_ns = {}
	local str_vghw = "orx"
end

local function ___kjnqp()
	local tab_cb = {}
	local bool_wvk = false
end

local function ___faxvy()
	local _ersym = nil
	local _aogws = nil
	local _thlh = nil
	local bool_nofcc = false
	local _cdxy = nil
end

local function ___xj()
	local tab_em = {}
	local int_vpbot = 3
	local str_jgt = "gvqgr"
	local str_zg = "dgqc"
	local str_sju = "ireks"
end

local function ___zzms()
	local int_zhhj = 26
	local bool_br = false
	local str_jow = "xznhp"
	local _zatfd = nil
	local str_yyuup = "rnfqel"
end

local ACTION_TAG_NUM_ROLL = 10101010

LabelNumRoll = {}

function LabelNumRoll:nrInit (beginNum, secFrame, parserFunc)
	self.nrCurValue = beginNum or 0
	self.nrSecFrame = secFrame or 25
	self.nrParserFunc = parserFunc or bole.dealValueToRetString
end

function LabelNumRoll:nrStartRoll (beginNum, endNum, playDur, parserFunc, nrValueFunc)
	if beginNum then -- set beginNum
		self.nrCurValue = beginNum
	end
	self.nrEndNum = endNum
	self.nrPlayDur = playDur
	if parserFunc then
		self.nrParserFunc = parserFunc
	end

	local addSumNum 	= self.nrEndNum - self.nrCurValue
	
	local minAddValue   = 1
	local changeCnt 	= math.ceil(self.nrPlayDur*self.nrSecFrame)
	self.nrOffset 		= math.floor(addSumNum/changeCnt)
    if math.abs(self.nrOffset) < minAddValue then
    	self.nrOffset = minAddValue
    end
    self.randomValue 	= math.floor(math.abs(self.nrOffset) * 0.2)
    if math.abs(self.randomValue) < minAddValue then
    	self.randomValue = 0
    end

    if self:getActionByTag(ACTION_TAG_NUM_ROLL) then
    	return
    end

    local action = cc.RepeatForever:create(cc.Sequence:create(cc.DelayTime:create(1/self.nrSecFrame), cc.CallFunc:create(function ()
		if self.nrCurValue == self.nrEndNum then return end

		self.nrCurValue = self.nrCurValue + self.nrOffset + math.random(-self.randomValue, self.randomValue)
		if (self.nrOffset > 0 and self.nrCurValue > self.nrEndNum) or (self.nrOffset < 0 and self.nrCurValue < self.nrEndNum) then
			self.nrCurValue = self.nrEndNum
		end
		self:setString(self.nrParserFunc(self.nrCurValue))
		if nrValueFunc then 
			nrValueFunc(self.nrCurValue)
		end
	end)))
	action:setTag(ACTION_TAG_NUM_ROLL)
	self:setString(self.nrParserFunc(self.nrCurValue))
	libUI.runAction(self,action)
	-- self:runAction(action)
end

function LabelNumRoll:nrStopRoll ()
	self:stopActionByTag(ACTION_TAG_NUM_ROLL)
end

function LabelNumRoll:nrOverRoll ()
	self:stopActionByTag(ACTION_TAG_NUM_ROLL)
	self:setString(self.nrParserFunc(self.nrEndNum))
end

function LabelNumRoll:nrSetCurValue (val, parser)
	self.nrCurValue = val
	self.nrEndNum = val
	parser = parser or self.nrParserFunc
    self:setString(parser(self.nrCurValue))
end

bole.cleanLabelNumRoll = function (label)
	if label.nrStopRoll then
		label:nrStopRoll()
	end
end

bole.dealValueToRetString = function( theValue, abbrMinValue, decimalMaxValue, deZero)
	abbrMinValue    = abbrMinValue or 100000000
	decimalMaxValue = decimalMaxValue or 1000
	local retString = ""
	if abbrMinValue ~= -1 and theValue >= abbrMinValue then
	    retString = FONTS.format(theValue, false, true)
	else
		if decimalMaxValue ~= -1 and theValue >= decimalMaxValue then
			retString = FONTS.format(theValue, true, false)
		else
			retString = FONTS.format(theValue, true, true)
			-- if retString == "0" then
			--      retString = "0.00"
		   	-- end
		end
	end

	if deZero == nil then deZero = true end
	if deZero and not string.match(retString, "%u") then
		if string.match(retString, "%.0+$") then
			retString = string.match(retString, "[^%.]+")
		end
		if string.match(retString, "%.%d0$") then
			retString = string.match(retString, ".*%.%d")
		end
	end
	return retString
end

bole.parseValueWithKB = function(value,count)
    local last = ""
	local maxValue = math.pow(10,count)
    if value > maxValue*1000000000 then
        value = value / 1000000000
        value = math.floor(value)
        last = "B"
        return FONTS.format(value, true) .. last
    elseif value > maxValue*1000000 then
        value = value / 1000000
        value = math.floor(value)
        last = "M"
        return FONTS.format(value, true) .. last
    elseif value > maxValue*1000 then
        value = value / 1000
        value = math.floor(value)
        last = "K"
        return FONTS.format(value, true) .. last
    end
    return FONTS.format(value, true)
end

bole.parseValueWithoutKB = function(value)
    return FONTS.format(value, true)
end


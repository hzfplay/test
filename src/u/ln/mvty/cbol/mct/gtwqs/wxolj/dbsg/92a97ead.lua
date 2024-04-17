local ___tab_qqw = {}
local ____ewzem = nil
local ____bnv = nil
local ___str_mdckv = "yxh"
local ___int_hjxod = 12
local ___tab_yhmy = {}
local ___bool_dz = false
local ___int_ub = 76
local ___str_mom = "wdc"
local ____bzfsa = nil

local function ___iij()
	local tab_fpvd = {}
	local int_zangm = 33
end

local function ___ah()
	local int_ra = 80
	local _kz = nil
	local str_lav = "fqkuup"
	local int_cdhn = 85
end

local function ___wqkdf()
	local tab_fkln = {}
	local bool_uvc = false
	local str_ucks = "egvqp"
end

local function ___dm()
	local _eg = nil
	local int_puu = 33
end

local function ___sdzp()
	local tab_jgsua = {}
	local int_jvb = 97
	local _ss = nil
	local str_dk = "iiapw"
end

local function ___jf()
	local bool_djqd = false
	local tab_uuq = {}
	local tab_xr = {}
	local int_uom = 63
	local tab_wuyc = {}
end

local function ___rstn()
	local tab_oxfax = {}
	local int_gun = 28
	local _wzm = nil
	local _qgsw = nil
end

local function ___amlv()
	local bool_fynrl = false
	local int_ly = 55
end

local function ___xdlva()
	local tab_omfat = {}
	local _ct = nil
	local int_aglp = 25
	local bool_vp = false
	local int_ex = 83
end

local function ___nmrm()
	local str_rftyp = "wrehug"
	local int_sz = 41
	local _olf = nil
end

local function ___aytc()
	local int_mcke = 6
	local int_jr = 76
	local bool_mvw = false
	local int_wql = 89
end

local function ___zmb()
	local int_ys = 56
	local bool_pqf = false
end

local function ___zlbq()
	local bool_xsorh = false
	local int_sophn = 69
	local _ruyi = nil
	local tab_rm = {}
end

local function ___dapen()
	local str_biu = "dkgu"
	local int_ew = 78
	local int_wd = 35
	local tab_cule = {}
end
---
--- @program src 
--- @description:  
--- @author: rwb 
---@create: : 2021/02/22 19:00:00
local cls = class("PrizePoolView")
function cls:ctor(ctl, parent, flyNode)
    self.ctl = ctl
    self.node = parent
end
function cls:initRoot()
    self.prizePoolLabel = self.node:getChildByName("label_jp1")
    inherit(self.prizePoolLabel, LabelNumRoll)
    local function parseValue(num)
        return FONTS.formatByCount4(num, 17, true, true)
    end
    self.prizePoolLabel:nrInit(0, 24, parseValue)
    local middleNode = self.node:getChildByName("bg_loop")
    local data = {}
    data.file = self.ctl:getSpineFile("prize_pool")
    data.parent = middleNode
    data.isLoop = true
    bole.addAnimationSimple(data)
end
function cls:updatePrizePool(endValue, startValue, isAnimate)
    startValue = startValue or self.newPrizeValue or 0
    endValue = endValue or 0
    if isAnimate then
        if self.prizePoolLabel.nrStopRoll then
            self.prizePoolLabel:nrStopRoll()
        end
        self.prizePoolLabel:nrStartRoll(startValue, endValue, 6)
    else
        self.prizePoolLabel:setString(self.prizePoolLabel.nrParserFunc(endValue))
    end
    self.newPrizeValue = endValue
end
return cls






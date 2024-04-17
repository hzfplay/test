local ___int_tx = 53
local ___int_jrfb = 16
local ___bool_wasu = false
local ___str_nekan = "vhvmp"
local ___int_ll = 85
local ___str_fzqso = "zhsm"
local ___int_fhfa = 86
local ___bool_jzn = false
local ____sknvg = nil
local ____jj = nil
local ___str_nd = "wah"
local ____gyhzm = nil
local ___bool_wmjaz = false
local ____xhbln = nil
local ___int_mye = 49
local ___tab_dmpm = {}
local ____ocdmt = nil
local ___tab_re = {}
local ___bool_kc = false
local ___str_xkwz = "vorzbv"
local ___bool_yc = false
local ___str_ats = "frb"
local ___str_sqon = "ktikuf"
local ____acsg = nil
local ___str_fvc = "ukeuxc"
local ____mnfwq = nil
local ___bool_pbw = false

local function ___awzc()
	local int_kn = 18
	local bool_vead = false
	local tab_qawh = {}
end

local function ___rkk()
	local str_aq = "uqyero"
	local _zdn = nil
end

local function ___qmvi()
	local tab_mxdx = {}
	local _afz = nil
end

local function ___stt()
	local _gwgyy = nil
	local _fsvp = nil
	local int_oj = 1
	local bool_gkppk = false
	local tab_bobrz = {}
end

local function ___hfqku()
	local int_bobu = 20
	local int_ycvpn = 5
	local str_vdby = "dpqzhl"
end

local function ___oco()
	local int_znem = 0
	local str_hqcpd = "gwjnr"
	local tab_xgedl = {}
end

local function ___tksia()
	local int_xcr = 98
	local int_xm = 36
	local int_nubrl = 88
end

local function ___aznov()
	local tab_jvhq = {}
	local int_nfs = 70
end

local function ___ffroo()
	local str_bmmv = "yqr"
	local int_exgab = 1
	local bool_eqm = false
	local int_zah = 35
	local str_nou = "dmux"
end

local function ___dgi()
	local _nawcq = nil
	local tab_kblew = {}
	local int_fikz = 58
end

local function ___bymfi()
	local bool_ko = false
	local str_fcp = "qgl"
end

local function ___qz()
	local tab_bjz = {}
	local int_bqp = 91
	local int_fkyv = 26
	local str_yb = "vetlsa"
end

local function ___czj()
	local str_pg = "oljm"
	local str_deft = "zidarb"
	local int_vajfs = 84
end

local function ___hdawi()
	local str_avl = "evw"
	local int_clq = 12
	local tab_oqltw = {}
	local str_lhkhq = "isvr"
end

local function ___ndvjs()
	local int_mwkpr = 92
	local _hgxd = nil
	local _nki = nil
end

local function ___gag()
	local str_ep = "beelge"
	local int_zvhih = 91
end

local function ___oyqz()
	local bool_vdrz = false
	local tab_zf = {}
end

local function ___rwp()
	local _erd = nil
	local bool_dk = false
	local _vu = nil
	local str_uk = "edjzxo"
end

local function ___wnwit()
	local _hrgnq = nil
	local _ilxl = nil
end

local function ___btv()
	local tab_qrowa = {}
	local _eeobb = nil
	local str_osk = "hxgvg"
end

local function ___qdy()
	local _mcb = nil
	local int_aoyo = 47
	local _cv = nil
	local str_qtapy = "drdxbp"
end

local function ___jwq()
	local str_oqxvs = "kke"
	local str_dc = "qqcw"
	local bool_yzed = false
	local _awyrg = nil
	local _ragy = nil
end

local function ___ik()
	local bool_htpx = false
	local tab_nbjz = {}
	local bool_rhyt = false
end

local function ___lj()
	local tab_ugsjm = {}
	local int_zfcsi = 73
	local tab_yejeq = {}
	local bool_gxrj = false
	local tab_yppsr = {}
end

local function ___oc()
	local str_jgjyr = "akh"
	local tab_mzmk = {}
	local _tmupa = nil
end

local function ___fm()
	local tab_gcql = {}
	local str_rudu = "qsszbn"
	local _ika = nil
	local bool_rrij = false
	local str_zf = "ltrr"
end

local function ___upm()
	local int_bbgb = 82
	local _pjqn = nil
	local bool_kjed = false
	local bool_sq = false
end
User = class("User")


function User:ctor()
	self.coins = bole.getTotalCoin()
	self.diamond = bole.getTotalDiamond() 
	self.name = "Master"
	self.level = 1
	self.__inst = nil
	self.header = nil
end


function User:setHeader( h )
	if self.header ~= h then
		self.header = h	
	end 
end

function User:getInstance( ... )
	
	if not self.__inst then
		self.__inst = User.new()
	end
	return self.__inst
end

function User:setCoins( coins ,ignoreHeader)
	if coins and self.coins then
		-- print("zhf setCoins ", coins - self.coins)
		self:addCoins(coins - self.coins,ignoreHeader)
	end
end

function User:addCoins(off, ignoreHeader)
	off = off or 0
	ignoreHeader = ignoreHeader or 0
	local tt = self.coins + off
	if tt < 0 then return false end
	if libUI.isValidNode(self.header) and ignoreHeader ~= 1 then
		self.header:addCoins(self.coins, off)
	end
	self.coins = tt
	return true
end

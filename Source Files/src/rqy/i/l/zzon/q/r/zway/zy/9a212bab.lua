local ___int_van = 42
local ___bool_xigi = false
local ____rnlze = nil
local ____xk = nil
local ____xms = nil
local ____ztp = nil
local ___int_hc = 27
local ___bool_nxeb = false
local ___int_il = 24
local ____kmvw = nil
local ___tab_nntp = {}
local ___int_mqv = 45
local ___str_eojl = "fphva"
local ___int_zhyvv = 60
local ___bool_wz = false
local ___bool_xtb = false
local ___int_tapo = 76
local ___int_pu = 19
local ___tab_gtcv = {}
local ___tab_lt = {}
local ___bool_etxm = false
local ___int_xnlea = 96
local ___tab_xl = {}
local ___str_msou = "goduug"
local ___str_ifwj = "bmei"
local ___bool_ayz = false
local ____ivprs = nil
local ____uxbgz = nil
local ____wk = nil
local ___str_hhy = "bbjf"

local function ___aqgzb()
	local bool_xaikh = false
	local bool_jc = false
	local str_xnqd = "hady"
	local int_jwh = 20
	local bool_ktub = false
end

local function ___upsl()
	local int_qio = 3
	local _pe = nil
	local int_zksxp = 86
end

local function ___lmdf()
	local _sfucs = nil
	local bool_mybuz = false
	local bool_csymn = false
end

local function ___ngin()
	local int_hjlgy = 55
	local _qfe = nil
	local str_lo = "ccsn"
end

local function ___erk()
	local _ubz = nil
	local tab_miwjy = {}
end

local function ___bdy()
	local bool_orbdg = false
	local str_vu = "njb"
	local bool_ro = false
	local str_fic = "zgw"
end

local function ___gf()
	local int_nfv = 80
	local tab_xjae = {}
	local str_sdox = "olwecg"
	local str_kqpx = "mxojqh"
	local bool_pbs = false
end

local function ___fyoj()
	local _mfjn = nil
	local int_hyjr = 59
end

local function ___zsw()
	local _brh = nil
	local tab_tqx = {}
	local int_la = 94
	local bool_xl = false
	local _apaua = nil
end

local function ___zqm()
	local bool_qkw = false
	local _ibgz = nil
	local int_nm = 20
	local tab_td = {}
end

local function ___txbej()
	local tab_lmq = {}
	local bool_ujk = false
	local _rbbdg = nil
	local _whp = nil
end

local function ___awrv()
	local int_jyclk = 36
	local bool_qicv = false
	local tab_qvq = {}
end

local function ___xgvw()
	local tab_hgbmd = {}
	local str_gmhc = "tzck"
	local tab_ftnr = {}
	local _dovn = nil
end

local function ___zxgd()
	local _lth = nil
	local int_xyhh = 58
	local bool_tzn = false
	local tab_tmbev = {}
end

local function ___ysm()
	local tab_awwma = {}
	local tab_lgzk = {}
	local tab_srp = {}
	local tab_eck = {}
	local _go = nil
end

local function ___ie()
	local str_jys = "zbqauk"
	local str_ska = "iylv"
end

local function ___bj()
	local _mffg = nil
	local tab_hcv = {}
end

local function ___vx()
	local int_dthma = 57
	local int_prz = 70
end

local function ___ofdie()
	local str_ry = "qoqir"
	local bool_phtpa = false
	local bool_kyvc = false
end

local function ___bruh()
	local str_ho = "fwnhnf"
	local str_sdt = "mrrz"
	local bool_swsm = false
end

local function ___vbqt()
	local int_srk = 93
	local int_ttg = 53
end

local function ___zb()
	local int_otd = 49
	local tab_cl = {}
	local tab_ett = {}
end

local function ___szb()
	local str_thf = "mkoif"
	local bool_xivvr = false
end

local function ___snl()
	local tab_wyh = {}
	local int_efbt = 64
	local int_ki = 46
	local str_kaki = "clfiv"
end

local function ___mhyyp()
	local int_tra = 21
	local _cajh = nil
end

local function ___qsxfs()
	local _dbg = nil
	local _pud = nil
	local int_ayfgp = 41
	local int_flyf = 64
end

local function ___cgsbs()
	local str_mcole = "kyho"
	local str_ag = "kato"
	local _jdazo = nil
	local bool_jeu = false
end

local function ___adyt()
	local bool_vuku = false
	local tab_iv = {}
	local bool_isdzc = false
end
--- @program src
--- @description: theme2010 collect ctl
--- @author: rwb
---@create: : 2021/02/22 19:00:00
local parentClass = require "Themes/TournCash/Common/ThemeTournCashDelegate"
local cls = class("PrizePoolControl", parentClass)
local view = require "Themes/TournCash/Common/PrizePool/PrizePoolView"

function cls:ctor(mainCtl, commonCtl)
    parentClass.ctor(self, commonCtl)
    self.themeCtl = mainCtl
    self.tcCommonCtl = commonCtl
end
function cls:initLayout(parentNode)
    self.prizePoolView = view.new(self, parentNode)
    self.prizePoolView:initRoot()
end
function cls:updatePrizePool(...)
    if not self.prizePoolView then
        return
    end
    self.prizePoolView:updatePrizePool(...)
end

return cls



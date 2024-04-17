local ___bool_kv = false
local ___tab_zhogo = {}
local ___int_gkla = 9
local ___bool_zrg = false
local ___tab_qjn = {}
local ___tab_ekjtq = {}
local ___tab_sfmig = {}
local ___tab_ct = {}
local ___tab_wjcc = {}
local ___tab_yr = {}
local ___str_fojns = "lgkx"
local ___str_ntt = "lwuh"
local ___int_onp = 96
local ___str_ilrk = "cuped"
local ___str_cual = "sbbhiy"
local ___tab_wsqvw = {}
local ___str_imgde = "oyf"
local ____sna = nil
local ____azv = nil
local ___int_tnyd = 90
local ___tab_tdu = {}
local ___bool_uj = false
local ___bool_vigqs = false
local ___bool_afq = false
local ___tab_we = {}
local ___str_ih = "fhcjos"
local ___int_yz = 10
local ____syvr = nil
local ___str_qgy = "sjav"
local ___str_mppb = "dxaaj"

local function ___gajmr()
	local str_dkks = "nha"
	local str_eo = "flmayf"
	local _gs = nil
end

local function ___eq()
	local int_yu = 27
	local _ixr = nil
	local str_dc = "pjeq"
	local str_gzc = "wlghtw"
end

local function ___dtdwj()
	local tab_ft = {}
	local tab_rzi = {}
	local tab_iu = {}
	local bool_dv = false
	local _nimpb = nil
end

local function ___kssq()
	local bool_zi = false
	local _depyk = nil
	local int_ku = 70
	local str_sm = "hfl"
end

local function ___gew()
	local int_qze = 83
	local str_cxis = "ajbsk"
end

local function ___gu()
	local tab_insw = {}
	local str_quao = "nxp"
	local _vmfih = nil
end

local function ___nsde()
	local tab_vu = {}
	local bool_twe = false
	local tab_ctmta = {}
	local str_knutl = "dmpvdj"
	local tab_vl = {}
end

local function ___ew()
	local bool_zi = false
	local int_gge = 35
	local bool_pufu = false
	local int_myj = 90
end

local function ___ywcf()
	local tab_qn = {}
	local str_ux = "ogdt"
	local int_lfap = 89
	local _mvrwu = nil
end

local function ___pgz()
	local str_oudpn = "tuyx"
	local tab_tuhbt = {}
end

local function ___vujw()
	local str_rzm = "fevmvn"
	local _aq = nil
end

local function ___mlqox()
	local int_pnhb = 15
	local _jks = nil
	local int_mpoqv = 43
	local str_jmdfa = "ifiuta"
end

local function ___lss()
	local int_wf = 54
	local str_kkgdi = "tfhb"
	local bool_jfhk = false
	local int_wzthe = 73
	local tab_hsv = {}
end

local function ___eah()
	local int_zl = 70
	local tab_oplsn = {}
	local int_ud = 27
end

local function ___aejw()
	local int_opn = 42
	local bool_mib = false
	local str_ny = "edilon"
	local int_eclhd = 92
end

local function ___xs()
	local tab_vi = {}
	local str_qvyy = "jqjr"
end

function schedule(node, callback, delay)
    local delay = cc.DelayTime:create(delay)
    local sequence = cc.Sequence:create(delay, cc.CallFunc:create(callback))
    local action = cc.RepeatForever:create(sequence)
    node:runAction(action)
    return action
end

function performWithDelay(node, callback, delay)
    local delay = cc.DelayTime:create(delay)
    local sequence = cc.Sequence:create(delay, cc.CallFunc:create(callback))
    node:runAction(sequence)
    return sequence
end

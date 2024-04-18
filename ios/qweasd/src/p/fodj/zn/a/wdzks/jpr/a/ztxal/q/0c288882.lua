local ___int_omb = 18
local ____ldmvz = nil
local ____xo = nil
local ___bool_zt = false
local ___tab_qkcty = {}
local ___tab_gj = {}
local ___bool_efu = false
local ___int_kpyt = 50
local ___tab_scn = {}
local ___str_mpqfq = "hiqwx"
local ____if = nil
local ___int_bfe = 7
local ___int_qaqbt = 0
local ____eunh = nil
local ___int_pkb = 55
local ___str_klrvx = "vmaqm"
local ___str_rob = "mirbz"
local ___tab_itsv = {}
local ___bool_tabsw = false
local ___bool_juauq = false
local ___tab_dvhb = {}
local ____wgfk = nil
local ___str_cpwf = "nndoo"

local function ___mpz()
	local _jgr = nil
	local bool_chzdi = false
	local _yf = nil
	local str_pyql = "nucb"
end

local function ___rtfa()
	local str_zrw = "hfiurv"
	local int_qyhqg = 4
end

local function ___nvims()
	local tab_yofif = {}
	local int_spuw = 19
	local int_rlrg = 50
	local tab_nsmc = {}
end

local function ___rydfi()
	local bool_gxgv = false
	local bool_gc = false
	local bool_qeson = false
	local int_wli = 47
end

local function ___uwlf()
	local _robi = nil
	local int_bgj = 38
	local str_aykio = "knvho"
	local tab_fs = {}
	local int_rj = 71
end

local function ___skr()
	local bool_lnd = false
	local _nc = nil
	local _lfsc = nil
	local _qnj = nil
end

local function ___zrs()
	local str_imcxj = "wxbrvb"
	local tab_ackax = {}
	local bool_bn = false
	local bool_mwo = false
end

local function ___flxl()
	local tab_etixc = {}
	local _bxcl = nil
	local bool_kqvj = false
	local _nddu = nil
end

local function ___aqfzb()
	local _mja = nil
	local int_ssz = 75
end

local function ___tcdvq()
	local tab_vrvu = {}
	local tab_twg = {}
	local tab_fb = {}
	local bool_ir = false
	local str_ojofy = "yft"
end

local function ___iq()
	local int_sa = 47
	local int_itfl = 55
	local str_zl = "nnj"
	local _qgxt = nil
end

local function ___kpzj()
	local bool_din = false
	local _plb = nil
	local _ge = nil
	local bool_qsl = false
end

local function ___aj()
	local int_ezrxa = 99
	local tab_jlezu = {}
	local str_fnv = "mipvl"
end

local function ___hl()
	local str_dytas = "ctozuf"
	local bool_ng = false
end
if nil == cc.CCBProxy then
	return
end
-- This is the DeprecatedCocosBuilderClass

DeprecatedCocosBuilderClass = {} or DeprecatedCocosBuilderClass

--tip
local function deprecatedTip(old_name,new_name)
    print("\n********** \n"..old_name.." was deprecated please use ".. new_name .. " instead.\n**********")
end

--CCBReader class will be Deprecated,begin
function DeprecatedCocosBuilderClass.CCBReader()
    deprecatedTip("CCBReader","cc.BReader")
    return cc.BReader
end
_G["CCBReader"] = DeprecatedCocosBuilderClass.CCBReader()
--CCBReader class will be Deprecated,end

--CCBAnimationManager class will be Deprecated,begin
function DeprecatedCocosBuilderClass.CCBAnimationManager()
    deprecatedTip("CCBAnimationManager","cc.BAnimationManager")
    return cc.BAnimationManager
end
_G["CCBAnimationManager"] = DeprecatedCocosBuilderClass.CCBAnimationManager()
--CCBAnimationManager class will be Deprecated,end

--CCBProxy class will be Deprecated,begin
function DeprecatedCocosBuilderClass.CCBProxy()
    deprecatedTip("CCBProxy","cc.CCBProxy")
    return cc.CCBProxy
end
_G["CCBProxy"] = DeprecatedCocosBuilderClass.CCBProxy()
--CCBProxy class will be Deprecated,end

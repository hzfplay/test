local ___str_lxfzi = "axghqj"
local ___int_ks = 86
local ____kbedd = nil
local ___tab_yreq = {}
local ____bt = nil
local ___bool_cbjo = false
local ____vdon = nil
local ____gcj = nil
local ___tab_kyg = {}
local ___str_jksma = "jxqsc"
local ___str_cfvi = "ttrq"
local ___tab_ihosi = {}
local ___bool_ywet = false
local ___str_np = "cbs"
local ___str_rjb = "wyml"
local ___tab_ph = {}
local ____fheib = nil
local ___tab_bz = {}
local ___int_htmy = 52
local ____pwta = nil
local ___tab_va = {}
local ____pyeax = nil
local ___bool_xtqvg = false
local ___int_hi = 46
local ___bool_xozku = false
local ___int_imc = 83
local ___tab_oxquw = {}
local ___bool_iip = false
local ___bool_gv = false
local ___str_co = "kglzma"

local function ___itut()
	local bool_cd = false
	local str_haa = "ytvrd"
	local int_pke = 16
	local tab_ncv = {}
end

local function ___lpitn()
	local int_ezmp = 29
	local str_bvxhn = "hna"
end

local function ___sibh()
	local int_fjzzu = 7
	local bool_nj = false
	local str_uyf = "mpqhpa"
	local bool_sep = false
end

local function ___yvvo()
	local int_yl = 25
	local tab_xpq = {}
	local _lz = nil
	local tab_txcs = {}
end

local function ___nlg()
	local str_ovz = "jfaiyl"
	local tab_xplvb = {}
	local tab_uavh = {}
	local tab_uq = {}
end

local function ___rwl()
	local _ble = nil
	local bool_tagqc = false
end

local function ___tc()
	local int_vv = 82
	local str_zpj = "wdatjf"
	local tab_rj = {}
	local _mec = nil
end

local function ___bnply()
	local bool_wq = false
	local tab_suxq = {}
	local int_hwead = 63
	local str_ij = "adxs"
end

local function ___cv()
	local bool_lm = false
	local tab_ttgh = {}
	local str_fk = "zefrjh"
end

local function ___efar()
	local _zl = nil
	local _zf = nil
	local tab_reviu = {}
end

local function ___ucv()
	local _dxqwg = nil
	local tab_dmpk = {}
	local bool_wimma = false
	local str_vjkt = "ana"
	local bool_xpwl = false
end

local function ___kgod()
	local int_mrthn = 88
	local tab_zqalu = {}
	local bool_apati = false
	local tab_qfaa = {}
	local bool_ely = false
end

local function ___lctz()
	local tab_oy = {}
	local tab_rb = {}
	local str_srxu = "apnc"
	local int_gfqq = 4
end

local function ___cqvk()
	local str_ed = "djmjua"
	local int_exxsp = 59
	local _stum = nil
	local str_lo = "ydbxq"
	local str_shk = "tmwei"
end

local function ___mcw()
	local _tnoh = nil
	local tab_jwksb = {}
	local bool_mlw = false
	local _cx = nil
end

local function ___cd()
	local int_ypg = 86
	local tab_lt = {}
	local tab_ci = {}
	local int_ddl = 5
	local _auel = nil
end

local function ___gjtce()
	local int_bhy = 7
	local _zvptf = nil
	local tab_jiv = {}
end

local function ___ufoay()
	local bool_uzsqd = false
	local bool_guh = false
end

local function ___zue()
	local tab_eimm = {}
	local bool_de = false
	local _sbz = nil
end

local function ___aws()
	local int_yrgyq = 47
	local tab_ua = {}
end

local function ___rsgvq()
	local _wrht = nil
	local _olt = nil
	local tab_mqzuv = {}
	local tab_na = {}
end

local function ___zqvnz()
	local bool_tzt = false
	local tab_qysg = {}
	local int_sycm = 76
end

local function ___uv()
	local str_tlqxg = "tatip"
	local int_rcfe = 98
	local bool_pbexf = false
end

local function ___kdtk()
	local tab_ghw = {}
	local _ztl = nil
	local _uegtl = nil
	local int_obu = 41
end

local function ___yk()
	local str_ls = "wmbedc"
	local tab_uua = {}
	local str_vt = "hakvt"
end

local function ___od()
	local bool_qlc = false
	local _px = nil
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/01/18 15:00
---

local cls = class("ThemeGRII_MultiItem")
function cls:ctor(parentNode, index)

    self.parent = parentNode
    self.index = index
    self.labelNum = parentNode:getChildByName("num")
end
function cls:setString(str)
    self.labelNum:setString(tostring(str))
end
function cls:setVisible(status)
    self.parent:setVisible(status)
end
function cls:setMultiWinAni()
    self.parent:setVisible(true)
    local fs = 60
    local animate = cc.Sequence:create(
            cc.Spawn:create(
                    cc.ScaleTo:create(10 / 30, 1.1),
                    cc.MoveTo:create(10 / 30, cc.p(0, 217))
            ),
            cc.DelayTime:create(30 / 30),
            cc.Spawn:create(
                    cc.ScaleTo:create(10 / 30, 1),
                    cc.MoveTo:create(10 / 30, cc.p(0, 200))
            ),
            cc.Hide:create()
    )
    self.parent:runAction(animate)
end
return cls
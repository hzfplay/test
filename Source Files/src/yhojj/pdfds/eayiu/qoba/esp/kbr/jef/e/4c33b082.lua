local ___tab_axczo = {}
local ____wkt = nil
local ___int_bt = 76
local ___int_icb = 56
local ___int_uat = 76
local ___int_txur = 58
local ___str_cc = "horbkl"
local ___tab_ufflk = {}
local ____nm = nil
local ____xxvdw = nil
local ____mre = nil
local ___str_qsq = "joqul"
local ___bool_wvq = false
local ___bool_boacx = false
local ____yo = nil
local ___str_romxr = "gmbdu"
local ___bool_tkzml = false
local ___bool_lhx = false
local ___str_yh = "zwbxc"
local ___bool_il = false
local ___bool_kujir = false
local ___tab_txx = {}
local ____cftd = nil
local ___bool_rcqv = false
local ___bool_qkb = false
local ___bool_lf = false

local function ___sxyfc()
	local _witx = nil
	local bool_pob = false
	local tab_ts = {}
	local tab_fgsi = {}
	local str_pm = "igpjq"
end

local function ___kle()
	local tab_np = {}
	local bool_ddkdx = false
end

local function ___aa()
	local bool_aqsxy = false
	local int_qj = 37
	local bool_rdcc = false
	local tab_rpk = {}
	local int_akdve = 86
end

local function ___vp()
	local tab_mqep = {}
	local _dtluk = nil
	local _tghtv = nil
	local str_rhw = "slqv"
	local bool_ali = false
end

local function ___ro()
	local str_cqt = "ivbd"
	local tab_tom = {}
	local str_zsz = "zsgx"
end

local function ___scxwr()
	local bool_esj = false
	local int_obw = 1
end

local function ___dnqs()
	local bool_akuet = false
	local bool_ww = false
end

local function ___ahv()
	local str_bos = "pqgtaa"
	local tab_dsmkv = {}
	local bool_wjv = false
	local tab_qmts = {}
	local bool_wfvfi = false
end

local function ___luwz()
	local tab_xl = {}
	local bool_qlxsf = false
	local bool_euh = false
	local int_wd = 58
	local tab_azmxc = {}
end

local function ___ehna()
	local str_gnwe = "igeugo"
	local str_gakm = "tbifn"
	local tab_oqgw = {}
end

local function ___rl()
	local int_qrd = 67
	local bool_iz = false
end

local function ___awhoo()
	local _mx = nil
	local int_xevk = 80
	local str_huvy = "avio"
	local bool_jp = false
	local tab_lqauh = {}
end

local function ___mvd()
	local bool_mb = false
	local _jqgv = nil
	local str_oaqo = "gfdqb"
	local bool_dyzk = false
end

local function ___wq()
	local int_ixl = 64
	local _va = nil
	local str_wgp = "jkwnog"
	local bool_czq = false
end

local function ___mwmp()
	local str_vpbje = "fkl"
	local tab_kdoc = {}
	local bool_eibyi = false
	local _mz = nil
	local bool_hjpar = false
end

local function ___daksd()
	local int_qlpl = 26
	local int_rcymw = 99
	local str_uf = "ympv"
end

local function ___ry()
	local int_yiwnw = 46
	local tab_xyo = {}
	local _fbu = nil
	local tab_mqxd = {}
	local bool_aevcq = false
end

local function ___hkfr()
	local _ew = nil
	local str_psfs = "neofe"
	local tab_wlfrq = {}
end

local function ___kyu()
	local _ejnz = nil
	local tab_qla = {}
end

local function ___tngfo()
	local tab_cv = {}
	local tab_ondm = {}
	local tab_ns = {}
	local _bpo = nil
end

local function ___sidor()
	local str_gtopj = "dpue"
	local str_kbc = "rhac"
	local int_od = 41
end

local function ___mzoge()
	local int_ndfa = 29
	local int_sf = 18
	local _cn = nil
	local bool_vrl = false
end

local function ___ordn()
	local _scc = nil
	local bool_ucpfm = false
end

local function ___lc()
	local str_pwlp = "vnai"
	local tab_zjhzv = {}
	local int_lq = 19
end

local function ___xvao()
	local tab_uptud = {}
	local str_yhqu = "zgss"
	local str_ggft = "zdoof"
end

local function ___rux()
	local str_iuzyj = "cmzw"
	local tab_glwc = {}
	local _cetq = nil
	local _rmws = nil
end

--[[

Copyright (c) 2014-2017 Chukong Technologies Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

]]

local EditBox = ccui.EditBox

function EditBox:onEditHandler(callback)
    self:registerScriptEditBoxHandler(function(name, sender)
        local event = {}
        event.name = name
        event.target = sender
        callback(event)
    end)
    return self
end

function EditBox:removeEditHandler()
    self:unregisterScriptEditBoxHandler()
    return self
end

local ___bool_svprq = false
local ___bool_msyl = false
local ____ik = nil
local ___int_wib = 3
local ___str_bsph = "ckio"
local ____msqzj = nil
local ____phf = nil
local ___bool_xwj = false
local ___tab_zpv = {}
local ___tab_io = {}
local ____sdpaz = nil
local ___int_wa = 32
local ___str_ia = "obb"
local ___tab_dufdx = {}
local ___int_pj = 42
local ___bool_zs = false
local ___str_uwdp = "hvjcdd"

local function ___zmfbd()
	local _lds = nil
	local tab_dj = {}
	local bool_enp = false
	local str_pz = "hjyxg"
	local bool_ujod = false
end

local function ___ffn()
	local tab_hoh = {}
	local bool_rbdd = false
	local tab_yfi = {}
end

local function ___jt()
	local bool_uzkq = false
	local tab_ng = {}
	local bool_vr = false
end

local function ___ilr()
	local bool_kzk = false
	local tab_xma = {}
	local bool_ppm = false
end

local function ___uaa()
	local _ev = nil
	local bool_kwfgf = false
	local tab_po = {}
	local tab_dy = {}
end

local function ___gl()
	local int_jgmb = 9
	local str_rf = "foepy"
	local tab_brn = {}
	local _ytrct = nil
end

local function ___mfws()
	local int_qewyk = 27
	local bool_rpel = false
	local str_vncr = "tjx"
end

local function ___vlkyf()
	local tab_cc = {}
	local bool_pnsb = false
	local tab_ar = {}
	local bool_ies = false
	local _wc = nil
end

local function ___iuspg()
	local str_ja = "qfyir"
	local int_oq = 6
end

local function ___ti()
	local _glklw = nil
	local tab_ca = {}
end

local function ___ohps()
	local tab_bfy = {}
	local tab_gh = {}
	local str_zy = "gza"
end

local function ___id()
	local tab_ly = {}
	local int_xm = 33
	local int_tuq = 58
end

local function ___puyuk()
	local _fp = nil
	local str_fo = "kznhej"
	local int_grr = 23
end

local function ___ccsax()
	local str_xktlt = "hcmvol"
	local tab_dhdb = {}
	local str_seun = "misoe"
	local int_ny = 36
end

local function ___kha()
	local _aaplr = nil
	local bool_srndn = false
	local int_mqh = 67
	local tab_np = {}
end

local function ___mty()
	local tab_gy = {}
	local str_pjq = "ioi"
end

local function ___qafn()
	local _oi = nil
	local _rq = nil
end

local function ___iwy()
	local str_bmkfs = "lyrgu"
	local int_sotc = 96
	local str_ur = "ztje"
end

local function ___eaqfd()
	local bool_zqsz = false
	local int_fsxe = 64
	local bool_zn = false
end

local function ___rsx()
	local bool_umti = false
	local bool_twlvl = false
	local int_nf = 85
	local str_kw = "hrtj"
end

local function ___hy()
	local int_juzyu = 15
	local _fighi = nil
end

local function ___vmic()
	local int_mgcri = 17
	local tab_efvi = {}
	local bool_tvyp = false
end

local function ___nvcs()
	local _uw = nil
	local int_ikxxv = 68
	local _uacs = nil
end

local function ___ibais()
	local str_ipqgn = "flx"
	local str_vvcht = "zfkt"
	local _zj = nil
end

local function ___yfs()
	local str_jn = "piespt"
	local tab_anhml = {}
	local _bmqir = nil
	local tab_ea = {}
	local int_xu = 41
end

local function ___pb()
	local int_swtg = 74
	local int_afz = 89
	local int_twzx = 39
	local str_re = "uzpok"
end

local function ___gob()
	local int_dkz = 18
	local str_vgtvn = "olr"
	local tab_tlwsz = {}
end

local function ___tu()
	local _szni = nil
	local int_urzb = 40
	local str_mx = "eed"
end

local function ___qm()
	local str_ios = "qka"
	local bool_ypat = false
	local bool_zy = false
	local tab_rfko = {}
end

local function ___zw()
	local int_wlg = 87
	local int_orzpo = 98
	local tab_plv = {}
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

local ScrollView = ccui.ScrollView

function ScrollView:onEvent(callback)
    self:addEventListener(function(sender, eventType)
        local event = {}
        if eventType == 0 then
            event.name = "SCROLL_TO_TOP"
        elseif eventType == 1 then
            event.name = "SCROLL_TO_BOTTOM"
        elseif eventType == 2 then
            event.name = "SCROLL_TO_LEFT"
        elseif eventType == 3 then
            event.name = "SCROLL_TO_RIGHT"
        elseif eventType == 4 then
            event.name = "SCROLLING"
        elseif eventType == 5 then
            event.name = "BOUNCE_TOP"
        elseif eventType == 6 then
            event.name = "BOUNCE_BOTTOM"
        elseif eventType == 7 then
            event.name = "BOUNCE_LEFT"
        elseif eventType == 8 then
            event.name = "BOUNCE_RIGHT"
        elseif eventType == 9 then
            event.name = "CONTAINER_MOVED"
        elseif eventType == 10 then
            event.name = "AUTOSCROLL_ENDED"
        end
        event.target = sender
        callback(event)
    end)
    return self
end

ScrollView.onScroll = ScrollView.onEvent

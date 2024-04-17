local ___bool_pqow = false
local ____jrxp = nil
local ___tab_nesrj = {}
local ___int_yf = 90
local ___str_vpu = "lulw"
local ___bool_qeb = false
local ___tab_rv = {}
local ___int_iu = 78
local ___int_xah = 39
local ___int_xz = 15
local ____gb = nil
local ___str_uamr = "meh"
local ___tab_datm = {}
local ___tab_qcn = {}
local ___tab_ar = {}
local ___str_tqdji = "jljo"

local function ___dcgqi()
	local _ni = nil
	local bool_wor = false
	local _fxqb = nil
	local bool_inocl = false
end

local function ___bjeri()
	local bool_prh = false
	local int_rdh = 37
end

local function ___yf()
	local bool_buk = false
	local bool_rb = false
	local int_bzqx = 38
	local _wz = nil
end

local function ___cax()
	local int_zkdy = 6
	local str_jkyu = "uuzo"
	local bool_mvigr = false
	local int_yqke = 15
end

local function ___gqwtl()
	local str_hijm = "mkoju"
	local int_geaop = 77
	local int_jpvt = 100
end

local function ___eycpr()
	local tab_aqq = {}
	local bool_ugh = false
	local _dvmq = nil
end

local function ___zz()
	local tab_gzk = {}
	local tab_cgeg = {}
	local bool_gtyq = false
	local int_niew = 7
end

local function ___uqz()
	local _gspay = nil
	local int_ey = 28
	local str_dual = "wue"
	local int_tlkaf = 57
end

local function ___zvlcv()
	local tab_tbzti = {}
	local int_istxi = 95
	local str_caav = "yamj"
	local tab_fu = {}
end

local function ___iceq()
	local int_xpkew = 5
	local bool_awr = false
	local bool_gtbs = false
	local _lzai = nil
end

local function ___aamz()
	local tab_hkylv = {}
	local bool_vula = false
	local _gllp = nil
	local bool_zmtaj = false
end

local function ___kgxv()
	local tab_eovoo = {}
	local str_yxxr = "wqhdk"
	local bool_ntff = false
	local _fxj = nil
end

local function ___ht()
	local str_gzg = "rtvfsi"
	local str_qh = "tslxi"
	local _aq = nil
end

local function ___fjv()
	local _hfxc = nil
	local _bopwj = nil
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

local CheckBox = ccui.CheckBox

function CheckBox:onEvent(callback)
    self:addEventListener(function(sender, eventType)
        local event = {}
        if eventType == 0 then
            event.name = "selected"
        else
            event.name = "unselected"
        end
        event.target = sender
        callback(event)
    end)
    return self
end

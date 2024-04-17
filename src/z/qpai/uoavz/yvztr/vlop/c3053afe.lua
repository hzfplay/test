local ___bool_sawbj = false
local ___tab_ae = {}
local ____uj = nil
local ___bool_rshlv = false
local ___bool_hvga = false
local ____pyi = nil
local ___tab_lh = {}
local ___str_pd = "wzp"
local ____khgw = nil
local ___int_iaq = 43
local ____ao = nil
local ____te = nil
local ___bool_xva = false
local ____sl = nil
local ___tab_unnit = {}
local ___str_zkink = "fnjsr"
local ____iwga = nil
local ___str_cutuj = "yjum"
local ___str_ykmhm = "tlskvf"
local ___bool_vi = false

local function ___xgta()
	local tab_hx = {}
	local str_ctzie = "ljdii"
	local _sem = nil
	local str_yztvr = "dwbx"
	local int_bsa = 28
end

local function ___rw()
	local str_mqcd = "ugp"
	local tab_bjeja = {}
	local bool_mj = false
	local tab_xgayx = {}
	local str_mes = "fcrz"
end

local function ___kmw()
	local _ay = nil
	local bool_fdeug = false
	local str_subjm = "wtetj"
end

local function ___gf()
	local bool_yh = false
	local tab_hc = {}
end

local function ___cof()
	local tab_cof = {}
	local int_jl = 83
end

local function ___nkxi()
	local tab_zp = {}
	local bool_rorfc = false
	local str_bvtmo = "gikuqt"
end

local function ___ubmws()
	local bool_ghje = false
	local tab_uigwv = {}
end

local function ___bslh()
	local tab_tdyty = {}
	local str_jfpvg = "vjqfl"
end

local function ___gekt()
	local bool_khjsr = false
	local _lpa = nil
	local tab_irw = {}
	local _hobnz = nil
	local tab_sfail = {}
end

local function ___akc()
	local tab_bvtf = {}
	local tab_cmw = {}
end

local function ___cd()
	local str_ic = "uugb"
	local int_rkz = 13
	local int_lx = 68
	local _haslj = nil
end

local function ___cxv()
	local _vbgb = nil
	local _ecwog = nil
	local str_bfo = "tohr"
end

local function ___bkas()
	local int_ezifu = 16
	local _obf = nil
	local _qx = nil
	local tab_vprh = {}
end

local function ___vgqc()
	local str_vz = "xbwxqx"
	local int_kudwh = 95
end

local function ___qbvj()
	local _jwmzz = nil
	local tab_zos = {}
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

local Widget = ccui.Widget

function Widget:onTouch(callback)
    self:addTouchEventListener(function(sender, state)
        local event = {x = 0, y = 0}
        if state == 0 then
            event.name = "began"
        elseif state == 1 then
            event.name = "moved"
        elseif state == 2 then
            event.name = "ended"
        else
            event.name = "cancelled"
        end
        event.target = sender
        callback(event)
    end)
    return self
end

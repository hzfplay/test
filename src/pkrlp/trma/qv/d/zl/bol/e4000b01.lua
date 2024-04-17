local ___str_fu = "tbv"
local ___str_azc = "stwlzr"
local ___bool_eow = false
local ____rx = nil
local ___int_pij = 77
local ___int_udish = 18
local ___bool_fuvxm = false
local ___tab_voc = {}
local ____ua = nil
local ___int_ty = 59
local ___tab_qa = {}
local ___tab_ewz = {}
local ___bool_fjl = false
local ___bool_abkto = false
local ___int_vn = 73
local ____swpg = nil
local ___int_uwhjz = 20
local ___str_jrb = "hjnh"
local ___bool_ot = false
local ___bool_zuhxs = false
local ___str_kzy = "lryd"
local ___int_slrf = 52

local function ___zi()
	local bool_ffm = false
	local int_cot = 90
	local _zj = nil
	local _ugc = nil
end

local function ___dpnt()
	local bool_edkd = false
	local _zcn = nil
	local bool_uqbnp = false
	local _hq = nil
end

local function ___cgr()
	local bool_tnmq = false
	local str_wa = "lmphn"
	local int_cq = 96
end

local function ___jz()
	local bool_ya = false
	local int_tkki = 16
end

local function ___tavg()
	local bool_nxwfu = false
	local _hcz = nil
end

local function ___nbq()
	local int_whsr = 53
	local tab_duhab = {}
end

local function ___tugxi()
	local _nclrf = nil
	local int_nc = 79
	local tab_ydm = {}
	local tab_dvur = {}
end

local function ___wafh()
	local bool_bjkpy = false
	local tab_ucg = {}
	local tab_ml = {}
	local tab_mt = {}
	local _ir = nil
end

local function ___gmca()
	local _lc = nil
	local str_iefem = "bkaow"
	local _dunym = nil
	local str_qtrw = "schg"
end

local function ___eej()
	local _ymxah = nil
	local str_atftm = "aelmp"
	local _pn = nil
	local str_ehx = "uvaav"
end

local function ___ttpnv()
	local tab_kamll = {}
	local bool_bnp = false
	local tab_gfnm = {}
	local int_cpfpw = 74
end

local function ___rti()
	local int_fmbyy = 52
	local int_cdhg = 75
end

local function ___bowuh()
	local str_xho = "mhulyj"
	local int_oqb = 57
	local int_iz = 63
end

local function ___jd()
	local _bttth = nil
	local tab_da = {}
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

local PageView = ccui.PageView

function PageView:onEvent(callback)
    self:addEventListener(function(sender, eventType)
        local event = {}
        if eventType == 0 then
            event.name = "TURNING"
        end
        event.target = sender
        callback(event)
    end)
    return self
end

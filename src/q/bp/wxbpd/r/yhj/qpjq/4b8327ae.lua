local ___str_fgq = "oqeu"
local ___int_izxz = 33
local ___int_dzs = 49
local ___str_zxeoz = "ouourv"
local ___int_crq = 62
local ____lg = nil
local ___int_qiq = 17
local ___int_msaw = 66
local ___tab_qxft = {}
local ____sgle = nil
local ____tgqg = nil
local ___bool_hmz = false
local ___int_xf = 55
local ___bool_waw = false
local ___tab_dp = {}
local ___bool_dd = false
local ___tab_ytdun = {}
local ___bool_thv = false
local ___str_vcnm = "ckzypr"
local ____wsp = nil

local function ___kacpk()
	local str_bz = "nlqut"
	local _bgdqq = nil
end

local function ___bgu()
	local _rmbfz = nil
	local _awz = nil
	local tab_odbn = {}
	local tab_ecvn = {}
	local str_ta = "rmytfj"
end

local function ___gzl()
	local str_yk = "njdlze"
	local str_lty = "gimrc"
	local tab_ho = {}
	local _by = nil
end

local function ___rpap()
	local bool_hgunu = false
	local str_bcall = "tfv"
	local _bpb = nil
	local bool_vpmw = false
end

local function ___nj()
	local _kq = nil
	local str_pe = "xnm"
	local bool_gd = false
	local int_eoq = 15
	local int_qi = 0
end

local function ___nne()
	local _fvrbe = nil
	local _yty = nil
end

local function ___pk()
	local int_ofhnu = 11
	local tab_pve = {}
	local str_xi = "gcfc"
	local tab_fnj = {}
	local bool_xqhgx = false
end

local function ___kvp()
	local bool_ak = false
	local tab_gmdlz = {}
	local bool_vv = false
	local bool_wy = false
end

local function ___sqg()
	local str_cgvc = "zhlqru"
	local tab_ros = {}
	local int_bvjj = 45
	local tab_swex = {}
end

local function ___gptw()
	local str_aoya = "rkxjvl"
	local bool_knepi = false
	local bool_at = false
	local _agoyh = nil
	local bool_kqa = false
end

local function ___uzcc()
	local tab_wie = {}
	local str_bcfh = "tnwgt"
	local str_yjin = "oqdas"
	local _lda = nil
end

local function ___yvty()
	local bool_loej = false
	local int_newcb = 90
	local str_kterj = "glauig"
	local tab_hcc = {}
end

local function ___zskbs()
	local _ajst = nil
	local _qqp = nil
	local _qg = nil
	local str_em = "cfkzw"
end

local function ___aydn()
	local bool_xl = false
	local int_jzqje = 14
	local str_llzin = "szgxi"
	local tab_rnhmc = {}
end

local function ___deufn()
	local tab_ifque = {}
	local int_hq = 7
end

local function ___crc()
	local tab_kn = {}
	local str_iex = "adlmfs"
	local tab_cv = {}
	local tab_xbo = {}
end

local function ___ddyo()
	local _jq = nil
	local tab_fh = {}
	local bool_gdbii = false
	local int_zqeo = 60
end

local function ___htlsi()
	local str_jszo = "pkhaqt"
	local str_xtgp = "wreufo"
	local tab_sn = {}
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

local Slider = ccui.Slider

function Slider:onEvent(callback)
    self:addEventListener(function(sender, eventType)
        local event = {}
        if eventType == 0 then
            event.name = "ON_PERCENTAGE_CHANGED"
        end
        event.target = sender
        callback(event)
    end)
    return self
end

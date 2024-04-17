local ___str_jeaem = "dhxcem"
local ___tab_apkio = {}
local ___tab_xpswe = {}
local ___int_tg = 33
local ___bool_xk = false
local ___str_evmc = "mnmhf"
local ___str_ds = "nmv"
local ____kv = nil
local ___str_shgj = "ujjp"
local ___tab_tcl = {}
local ___str_wqyz = "itpq"
local ___int_sd = 98
local ___bool_rht = false

local function ___argzx()
	local int_etb = 6
	local bool_netc = false
	local bool_hcmtn = false
end

local function ___nrg()
	local tab_shn = {}
	local bool_bb = false
	local str_ysn = "ycp"
	local bool_rcuod = false
end

local function ___kzxs()
	local str_dxp = "hawbow"
	local str_gdnl = "cvy"
	local tab_ew = {}
end

local function ___ugsw()
	local bool_exqu = false
	local _dojx = nil
	local int_cr = 0
end

local function ___pmiz()
	local int_sd = 41
	local int_mw = 71
	local int_jb = 79
	local tab_rj = {}
	local bool_sb = false
end

local function ___ufvgk()
	local int_tfd = 85
	local tab_vel = {}
	local str_yhbdd = "uxivan"
end

local function ___tqqd()
	local _usrkx = nil
	local bool_erltw = false
end

local function ___kt()
	local int_pnt = 63
	local str_yoc = "buyq"
	local bool_soq = false
	local tab_tnad = {}
	local tab_pbrie = {}
end

local function ___jum()
	local _ajlt = nil
	local bool_vh = false
	local bool_mdd = false
end

local function ___spor()
	local bool_dw = false
	local str_tey = "sgdj"
	local bool_lg = false
	local _hybc = nil
	local bool_tg = false
end

local function ___rbp()
	local tab_kh = {}
	local _yr = nil
end

local function ___xy()
	local _recxt = nil
	local str_juqmw = "cnuxzc"
	local _ri = nil
	local _hdsjt = nil
end

local function ___ssuo()
	local _qj = nil
	local _lblug = nil
	local int_bdgpu = 61
	local int_bna = 96
	local str_hn = "nfz"
end

local function ___fa()
	local int_cf = 49
	local str_vx = "lmp"
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

local TextField = ccui.TextField

function TextField:onEvent(callback)
    self:addEventListener(function(sender, eventType)
        local event = {}
        if eventType == 0 then
            event.name = "ATTACH_WITH_IME"
        elseif eventType == 1 then
            event.name = "DETACH_WITH_IME"
        elseif eventType == 2 then
            event.name = "INSERT_TEXT"
        elseif eventType == 3 then
            event.name = "DELETE_BACKWARD"
        end
        event.target = sender
        callback(event)
    end)
    return self
end

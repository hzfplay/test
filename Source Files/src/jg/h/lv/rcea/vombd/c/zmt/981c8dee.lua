local ___bool_ooric = false
local ___int_gjeph = 39
local ___int_msc = 27
local ___int_nkcdb = 45
local ___bool_kxo = false
local ___tab_lmsnc = {}
local ___str_htbru = "aoxzzt"
local ___str_rbd = "hnlzk"
local ___bool_ppk = false
local ___tab_clrsv = {}
local ____stqp = nil
local ____afc = nil
local ___bool_yfgg = false
local ___int_mjc = 17
local ____vghrr = nil
local ____kh = nil
local ___str_lsn = "edfbf"
local ____fv = nil
local ___int_ao = 25
local ___bool_yzwso = false
local ___str_dmb = "kql"
local ___bool_ovxw = false
local ___int_ilm = 76
local ___bool_epw = false

local function ___yu()
	local str_an = "cjbha"
	local str_myyng = "tmm"
	local int_hhqm = 76
	local _dgpc = nil
	local _dxvg = nil
end

local function ___uzjz()
	local tab_xqn = {}
	local _pl = nil
	local _afg = nil
	local tab_dhda = {}
	local tab_hjyqk = {}
end

local function ___ejd()
	local tab_alvc = {}
	local str_dfvy = "bkdnin"
	local str_ddq = "lami"
end

local function ___aps()
	local int_pj = 49
	local bool_ectr = false
	local int_myv = 5
	local bool_kshwn = false
	local bool_awu = false
end

local function ___jzh()
	local str_mjo = "yuuo"
	local str_kbex = "scss"
	local _jy = nil
	local bool_ahmi = false
end

local function ___nt()
	local _fzi = nil
	local tab_saso = {}
	local _jcu = nil
end

local function ___wokhd()
	local bool_utcq = false
	local _hio = nil
	local tab_drrdw = {}
	local str_rgg = "oaxe"
	local tab_trldo = {}
end

local function ___pfoe()
	local str_rpsh = "wfj"
	local str_lh = "rhvs"
	local int_svzb = 16
	local int_bofy = 9
	local _qtgd = nil
end

local function ___jthi()
	local int_svrpi = 75
	local _hduld = nil
end

local function ___gmo()
	local bool_skz = false
	local _qwio = nil
end

local function ___ls()
	local str_hnuv = "gbtndu"
	local bool_yi = false
	local _ndtsr = nil
end

local function ___oq()
	local int_ay = 32
	local bool_ozt = false
	local str_dr = "xqcwr"
end

local function ___motj()
	local str_nq = "jqipd"
	local str_rbe = "hjwg"
	local int_jqkf = 39
	local _bfo = nil
	local _xi = nil
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

local ListView = ccui.ListView

function ListView:onEvent(callback)
    self:addEventListener(function(sender, eventType)
        local event = {}
        if eventType == 0 then
            event.name = "ON_SELECTED_ITEM_START"
        else
            event.name = "ON_SELECTED_ITEM_END"
        end
        event.target = sender
        callback(event)
    end)
    return self
end

function ListView:onScroll(callback)
    self:addScrollViewEventListener(function(sender, eventType)
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

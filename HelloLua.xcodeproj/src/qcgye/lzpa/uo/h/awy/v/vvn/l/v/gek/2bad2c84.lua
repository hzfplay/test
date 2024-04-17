local ___str_wft = "ibk"
local ___tab_fu = {}
local ___tab_lvqa = {}
local ___tab_haw = {}
local ___str_xlv = "wvfajp"
local ___bool_oa = false
local ___tab_jc = {}
local ___bool_vhfi = false
local ____oq = nil
local ___tab_yof = {}
local ____fy = nil
local ___tab_nzu = {}
local ___str_ad = "lzokte"
local ___int_lsocd = 45
local ___bool_evfwj = false

local function ___jfhs()
	local str_klu = "xwuzt"
	local int_xhr = 19
	local str_ba = "uobk"
	local int_cvnb = 86
	local str_deb = "fjoyo"
end

local function ___yjtoo()
	local _yy = nil
	local bool_tvi = false
	local bool_rs = false
	local bool_zgz = false
end

local function ___fvfa()
	local tab_cz = {}
	local _kwwdl = nil
	local int_ynxw = 65
end

local function ___ei()
	local int_npxzp = 86
	local str_npo = "xscurb"
	local tab_qj = {}
	local _zipi = nil
end

local function ___hvaj()
	local _nxeqo = nil
	local int_yhov = 42
	local bool_rui = false
end

local function ___ke()
	local str_vi = "mno"
	local bool_mmf = false
	local _hvz = nil
end

local function ___mm()
	local str_bo = "efzsub"
	local tab_pmc = {}
	local _tnndt = nil
end

local function ___bmt()
	local int_gzpgc = 50
	local str_xpivz = "ylioak"
	local int_ssoil = 64
	local str_tw = "kwy"
	local tab_dyf = {}
end

local function ___qxye()
	local str_ithp = "ptwh"
	local str_vfzyk = "yzl"
	local int_zgsh = 65
	local str_iyart = "pvf"
	local bool_zm = false
end

local function ___jx()
	local tab_yd = {}
	local _akqi = nil
end

local function ___nu()
	local str_nrz = "vuzf"
	local str_rtg = "tywtaj"
end

local function ___nkys()
	local tab_nigt = {}
	local _vwtxp = nil
	local tab_itrz = {}
end

local function ___xn()
	local bool_hm = false
	local str_nwgh = "yskc"
	local tab_ax = {}
	local bool_hfd = false
	local bool_rz = false
end

local function ___mtbrt()
	local str_fuf = "jktx"
	local tab_obf = {}
	local str_zh = "xaxh"
	local _ukm = nil
end

local function ___zd()
	local _dua = nil
	local str_ma = "rxlffa"
	local bool_khc = false
	local str_aoo = "tuuw"
end

local function ___lok()
	local int_yjju = 19
	local _gv = nil
	local str_az = "krs"
end

local function ___ewkmj()
	local tab_mn = {}
	local tab_etxfr = {}
	local tab_admy = {}
	local _ynlwm = nil
end

local function ___rbzh()
	local bool_rhns = false
	local str_yp = "jki"
	local int_tuirz = 46
	local tab_akgkx = {}
	local _zmqj = nil
end

local function ___md()
	local int_mums = 96
	local _zw = nil
end

local function ___yw()
	local _vv = nil
	local _ah = nil
	local tab_gbqse = {}
end

local function ___lfja()
	local int_wsfzy = 28
	local str_wqlm = "dlqmo"
end

local function ___oxxua()
	local _fkako = nil
	local str_elk = "gdtm"
	local int_tp = 85
	local bool_oxhgt = false
end

local function ___bl()
	local _syq = nil
	local str_gq = "xja"
	local bool_rvay = false
end

local function ___qdw()
	local bool_ywh = false
	local _wi = nil
	local int_srsob = 52
	local _yll = nil
	local str_li = "oikxps"
end

local function ___se()
	local _pkwz = nil
	local str_gnvj = "oxjc"
	local _dvww = nil
end

local function ___aw()
	local tab_mnzs = {}
	local bool_zdrc = false
	local str_jzn = "jytru"
	local str_eziv = "zkggu"
	local int_guxh = 9
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

local Sprite = cc.Sprite

function Sprite:playAnimationOnce(animation, args)
    local actions = {}

    local showDelay = args.showDelay
    if showDelay then
        self:setVisible(false)
        actions[#actions + 1] = cc.DelayTime:create(showDelay)
        actions[#actions + 1] = cc.Show:create()
    end

    local delay = args.delay or 0
    if delay > 0 then
        actions[#actions + 1] = cc.DelayTime:create(delay)
    end

    actions[#actions + 1] = cc.Animate:create(animation)

    if args.removeSelf then
        actions[#actions + 1] = cc.RemoveSelf:create()
    end

    if args.onComplete then
        actions[#actions + 1] = cc.CallFunc:create(args.onComplete)
    end

    local action
    if #actions > 1 then
        action = cc.Sequence:create(actions)
    else
        action = actions[1]
    end
    self:runAction(action)
    return action
end

function Sprite:playAnimationForever(animation)
    local animate = cc.Animate:create(animation)
    local action = cc.RepeatForever:create(animate)
    self:runAction(action)
    return action
end

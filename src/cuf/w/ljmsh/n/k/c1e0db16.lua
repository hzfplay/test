local ___bool_ajez = false
local ___tab_ybfr = {}
local ___str_buuln = "xxzog"
local ___tab_yfc = {}
local ___str_iu = "ocfqqg"
local ___bool_qu = false
local ___bool_jli = false
local ___bool_vuix = false
local ___str_tw = "exjwm"
local ___int_rfevp = 53
local ___str_tps = "fdwzh"

local function ___llb()
	local _jjxc = nil
	local _zm = nil
	local bool_hj = false
end

local function ___ea()
	local bool_fluta = false
	local _uiw = nil
	local _gw = nil
	local str_qv = "ydlf"
end

local function ___gzey()
	local tab_vyrg = {}
	local bool_ejzhm = false
	local int_oeo = 0
end

local function ___lfq()
	local bool_gtbi = false
	local _rijdl = nil
	local _wltca = nil
	local int_cjgte = 56
end

local function ___iokw()
	local int_rsnqm = 91
	local bool_qxpr = false
	local str_ea = "hbyyd"
	local _nal = nil
end

local function ___vso()
	local tab_bbzlu = {}
	local tab_qhw = {}
	local tab_gtre = {}
	local int_xqj = 71
end

local function ___wfybh()
	local int_om = 24
	local tab_iz = {}
	local int_vce = 24
	local str_auz = "vvfuzb"
end

local function ___rabi()
	local int_gxqco = 0
	local tab_drgp = {}
	local tab_ar = {}
end

local function ___ur()
	local str_lko = "nguvq"
	local str_hwyhx = "fbd"
	local bool_vaug = false
	local tab_ali = {}
	local _hadl = nil
end

local function ___ztyh()
	local tab_vmmay = {}
	local str_fcn = "jtfxwk"
	local bool_ntitf = false
end

local function ___se()
	local _jym = nil
	local tab_gmq = {}
	local _broq = nil
	local bool_slxk = false
	local tab_qpfp = {}
end

local function ___qhwc()
	local int_udcie = 34
	local tab_xha = {}
	local tab_pjx = {}
	local str_bb = "qrow"
	local tab_jt = {}
end

local function ___zp()
	local str_kgobj = "boy"
	local str_niu = "cbmv"
	local bool_wg = false
	local _norc = nil
	local str_taswk = "hcjo"
end

local function ___sk()
	local tab_vdvm = {}
	local int_cap = 23
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

if type(DEBUG) ~= "number" then DEBUG = 0 end

-- load framework
printInfo("")
printInfo("# DEBUG                        = " .. DEBUG)
printInfo("#")

device     = require("cocos.framework.device")
display    = require("cocos.framework.display")
audio      = require("cocos.framework.audio")
transition = require("cocos.framework.transition")

require("cocos.framework.extends.NodeEx")
require("cocos.framework.extends.SpriteEx")
require("cocos.framework.extends.LayerEx")
require("cocos.framework.extends.MenuEx")

if ccui then
require("cocos.framework.extends.UIWidget")
require("cocos.framework.extends.UICheckBox")
require("cocos.framework.extends.UIEditBox")
require("cocos.framework.extends.UIListView")
require("cocos.framework.extends.UIPageView")
require("cocos.framework.extends.UIScrollView")
require("cocos.framework.extends.UISlider")
require("cocos.framework.extends.UITextField")
end

require("cocos.framework.package_support")

-- register the build-in packages
cc.register("event", require("cocos.framework.components.event"))

-- export global variable
local __g = _G
cc.exports = {}
setmetatable(cc.exports, {
    __newindex = function(_, name, value)
        rawset(__g, name, value)
    end,

    __index = function(_, name)
        return rawget(__g, name)
    end
})

-- disable create unexpected global variable
function cc.disable_global()
    setmetatable(__g, {
        __newindex = function(_, name, value)
            error(string.format("USE \" cc.exports.%s = value \" INSTEAD OF SET GLOBAL VARIABLE", name), 0)
        end
    })
end

if CC_DISABLE_GLOBAL then
    cc.disable_global()
end

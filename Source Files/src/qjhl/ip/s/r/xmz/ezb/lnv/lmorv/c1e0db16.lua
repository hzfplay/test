local ___bool_rzcz = false
local ___int_xa = 56
local ____lm = nil
local ____ectco = nil
local ___int_neqpn = 58
local ___str_ttlsx = "onyw"
local ___str_uwxqv = "wtkk"
local ___tab_oan = {}
local ____dasb = nil
local ___int_ax = 57
local ___str_xzdh = "tcqdz"
local ___str_leash = "pfv"

local function ___behza()
	local str_htv = "fms"
	local tab_uxxhg = {}
	local tab_bkuj = {}
end

local function ___tmlsv()
	local int_eiae = 18
	local int_hfrrr = 95
	local _uugyh = nil
	local tab_bg = {}
end

local function ___wzxv()
	local _ls = nil
	local bool_pq = false
	local _dxqry = nil
end

local function ___dhp()
	local bool_krudh = false
	local tab_sku = {}
end

local function ___bc()
	local _dqqcd = nil
	local _qzx = nil
	local int_ngcv = 40
end

local function ___otet()
	local int_zi = 39
	local bool_nqcsl = false
	local _ebp = nil
end

local function ___no()
	local int_pjzwd = 89
	local tab_lrq = {}
end

local function ___exabv()
	local bool_hsy = false
	local _pbofv = nil
	local _dy = nil
	local int_hlf = 97
	local int_suuq = 75
end

local function ___tvqv()
	local _darcy = nil
	local tab_tzv = {}
	local tab_zqniv = {}
	local tab_de = {}
	local bool_wl = false
end

local function ___ny()
	local _bb = nil
	local tab_xvjq = {}
end

local function ___hm()
	local str_vpe = "ekzbrc"
	local tab_ed = {}
	local int_evr = 33
end

local function ___im()
	local str_dzld = "hnuvw"
	local int_xc = 74
	local int_ci = 42
	local str_eqz = "ogtcof"
end

local function ___rbzoq()
	local _giwa = nil
	local _sh = nil
end

local function ___cdtka()
	local bool_cyd = false
	local str_oz = "vonzc"
end

local function ___lmrjb()
	local str_xcezf = "dpn"
	local tab_qf = {}
	local bool_qbczr = false
	local _zjgs = nil
	local tab_mhi = {}
end

local function ___zgfn()
	local str_fdim = "lyl"
	local tab_vtx = {}
	local bool_lqtj = false
	local bool_jvau = false
end

local function ___ohz()
	local bool_kq = false
	local tab_iyu = {}
	local str_mjpl = "sbazo"
	local str_vvkns = "crmv"
	local str_qyp = "uiw"
end

local function ___om()
	local tab_glhlm = {}
	local int_dqjn = 55
	local _hx = nil
	local tab_qmraj = {}
	local str_rc = "fkzen"
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

require "cocos.cocos2d.Cocos2d"
require "cocos.cocos2d.Cocos2dConstants"
require "cocos.cocos2d.functions"


local breakSocketHandle, debugXpCall = require("LuaDebugjit")("localhost", 7003)
cc.Director:getInstance():getScheduler():scheduleScriptFunc(breakSocketHandle, 0.3, false)
_G.debugXpCall = debugXpCall

__G__TRACKBACK__ = function(msg)
    local msg = debug.traceback(msg, 3)
    print(msg)
    return msg
end

-- opengl
require "cocos.cocos2d.Opengl"
require "cocos.cocos2d.OpenglConstants"
-- audio
require "cocos.cocosdenshion.AudioEngine"
-- cocosstudio
if nil ~= ccs then
    require "cocos.cocostudio.CocoStudio"
end
-- ui
if nil ~= ccui then
    require "cocos.ui.GuiConstants"
    require "cocos.ui.experimentalUIConstants"
end

-- extensions
require "cocos.extension.ExtensionConstants"
-- network
require "cocos.network.NetworkConstants"
-- Spine
if nil ~= sp then
    require "cocos.spine.SpineConstants"
end

require "cocos.cocos2d.deprecated"
require "cocos.cocos2d.DrawPrimitives"

-- Lua extensions
require "cocos.cocos2d.bitExtend"

-- CCLuaEngine
require "cocos.cocos2d.DeprecatedCocos2dClass"
require "cocos.cocos2d.DeprecatedCocos2dEnum"
require "cocos.cocos2d.DeprecatedCocos2dFunc"
require "cocos.cocos2d.DeprecatedOpenglEnum"

-- register_cocostudio_module
if nil ~= ccs then
    require "cocos.cocostudio.DeprecatedCocoStudioClass"
    require "cocos.cocostudio.DeprecatedCocoStudioFunc"
end


-- register_cocosbuilder_module
require "cocos.cocosbuilder.DeprecatedCocosBuilderClass"

-- register_cocosdenshion_module
require "cocos.cocosdenshion.DeprecatedCocosDenshionClass"
require "cocos.cocosdenshion.DeprecatedCocosDenshionFunc"

-- register_extension_module
require "cocos.extension.DeprecatedExtensionClass"
require "cocos.extension.DeprecatedExtensionEnum"
require "cocos.extension.DeprecatedExtensionFunc"

-- register_network_module
require "cocos.network.DeprecatedNetworkClass"
require "cocos.network.DeprecatedNetworkEnum"
require "cocos.network.DeprecatedNetworkFunc"

-- register_ui_module
if nil ~= ccui then
    require "cocos.ui.DeprecatedUIEnum"
    require "cocos.ui.DeprecatedUIFunc"
end

-- cocosbuilder
require "cocos.cocosbuilder.CCBReaderLoad"

-- physics3d
require "cocos.physics3d.physics3d-constants"

if CC_USE_FRAMEWORK then
    require "cocos.framework.init"
end

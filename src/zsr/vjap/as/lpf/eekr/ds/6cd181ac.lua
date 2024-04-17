local ___int_ibko = 11
local ___str_stibw = "uefsf"
local ___str_fne = "vua"
local ___str_tc = "vdjzt"
local ____tysnw = nil
local ____cs = nil
local ___bool_eufll = false
local ___bool_xny = false
local ___str_ib = "gokf"
local ___int_fizz = 84
local ___str_qsgxh = "iyqb"
local ___bool_wne = false
local ___tab_qw = {}
local ___tab_pmajc = {}
local ____sk = nil
local ___str_kv = "gxhoc"
local ___str_ggllt = "tojcx"
local ___int_ov = 16
local ___bool_wo = false
local ____btyta = nil
local ___int_bmwq = 68
local ___bool_tg = false
local ____oqojz = nil
local ___str_wer = "vseqs"
local ___str_gg = "ldf"
local ___str_nk = "fpxo"
local ___tab_asrxt = {}
local ____ofo = nil
local ___bool_by = false

local function ___vitu()
	local int_ekxt = 26
	local bool_jj = false
end

local function ___cykh()
	local bool_mwsu = false
	local bool_vdfcg = false
	local _ydk = nil
	local bool_ict = false
end

local function ___vlm()
	local int_ndo = 11
	local int_okenx = 21
	local tab_rwyg = {}
	local _bs = nil
	local tab_jnl = {}
end

local function ___lbsmh()
	local _egpxw = nil
	local tab_yxkc = {}
	local int_bye = 28
end

local function ___xh()
	local int_rud = 93
	local tab_avu = {}
	local _bz = nil
	local bool_txsw = false
	local _cjdi = nil
end

local function ___pnokq()
	local _ibqok = nil
	local _ckosv = nil
	local int_zti = 49
	local _hpqtu = nil
end

local function ___nl()
	local _xgn = nil
	local bool_hmp = false
end

local function ___ubht()
	local bool_ie = false
	local int_oyvpw = 92
	local bool_ehd = false
	local str_yy = "buppgq"
end

local function ___svian()
	local tab_kt = {}
	local str_rijqz = "vkp"
	local _rj = nil
	local str_ss = "oczac"
end

local function ___fffr()
	local tab_te = {}
	local str_rigvk = "atuif"
	local str_otcth = "gyvyfi"
end

local function ___fc()
	local _osth = nil
	local tab_rzzhx = {}
	local int_enwmw = 62
	local bool_oyfz = false
end

local function ___mrb()
	local bool_gszoe = false
	local int_vo = 64
end

local function ___pijof()
	local str_krujj = "wni"
	local int_wpsr = 11
	local tab_jsw = {}
	local _apkd = nil
	local bool_pd = false
end

local function ___eaa()
	local bool_kfqz = false
	local int_lej = 94
end

local function ___sy()
	local int_ppfj = 52
	local str_etbi = "dwd"
end

local function ___zirh()
	local _sohw = nil
	local tab_yypva = {}
	local _qcfr = nil
	local tab_fi = {}
	local int_loeca = 18
end

local function ___ftbj()
	local bool_ug = false
	local str_ugn = "qbr"
	local bool_xwlu = false
end

local function ___yjy()
	local str_agfp = "nbbs"
	local _uewxc = nil
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

local Layer = cc.Layer

function Layer:onTouch(callback, isMultiTouches, swallowTouches)
    if type(isMultiTouches) ~= "boolean" then isMultiTouches = false end
    if type(swallowTouches) ~= "boolean" then swallowTouches = false end

    self:registerScriptTouchHandler(function(state, ...)
        local args = {...}
        local event = {name = state}
        if isMultiTouches then
            args = args[1]
            local points = {}
            for i = 1, #args, 3 do
                local x, y, id = args[i], args[i + 1], args[i + 2]
                points[id] = {x = x, y = y, id = id}
            end
            event.points = points
        else
            event.x = args[1]
            event.y = args[2]
        end
        return callback( event )
    end, isMultiTouches, 0, swallowTouches)
    self:setTouchEnabled(true)
    return self
end

function Layer:removeTouch()
    self:unregisterScriptTouchHandler()
    self:setTouchEnabled(false)
    return self
end

function Layer:onKeypad(callback)
    self:registerScriptKeypadHandler(callback)
    self:setKeyboardEnabled(true)
    return self
end

function Layer:removeKeypad()
    self:unregisterScriptKeypadHandler()
    self:setKeyboardEnabled(false)
    return self
end

function Layer:onAccelerate(callback)
    self:registerScriptAccelerateHandler(callback)
    self:setAccelerometerEnabled(true)
    return self
end

function Layer:removeAccelerate()
    self:unregisterScriptAccelerateHandler()
    self:setAccelerometerEnabled(false)
    return self
end

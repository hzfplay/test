local ___tab_tqg = {}
local ___str_ncnh = "wvks"
local ___int_gyugr = 22
local ___tab_uoru = {}
local ___str_zod = "vxqtsj"
local ____yob = nil
local ___int_dsz = 60
local ___tab_nero = {}
local ___tab_rlyf = {}
local ___str_jmak = "jrzso"
local ___tab_lvd = {}
local ___tab_fx = {}
local ___tab_uxru = {}
local ___int_nke = 11

local function ___rucl()
	local bool_mebjz = false
	local str_niuy = "gvhjxj"
	local tab_gg = {}
	local tab_nhy = {}
end

local function ___qgqg()
	local tab_qrh = {}
	local tab_kffhn = {}
	local bool_ghin = false
	local int_qugvu = 1
	local int_ucrv = 50
end

local function ___ulsv()
	local bool_gjfeb = false
	local bool_izm = false
	local _gobvq = nil
	local _ollee = nil
end

local function ___amfxn()
	local int_luq = 66
	local int_bidm = 72
	local bool_ihliz = false
	local tab_eq = {}
end

local function ___ssukz()
	local tab_buc = {}
	local _sn = nil
	local tab_lgz = {}
end

local function ___clztq()
	local str_hcj = "vkd"
	local tab_rbvp = {}
end

local function ___lnj()
	local bool_lmitf = false
	local tab_ospk = {}
	local tab_dvf = {}
end

local function ___wgnu()
	local int_lx = 32
	local tab_rvr = {}
	local bool_ejb = false
end

local function ___jk()
	local _xdmsn = nil
	local bool_hr = false
	local int_nfhu = 2
end

local function ___odd()
	local int_yh = 74
	local int_mc = 62
	local bool_gg = false
	local bool_ml = false
end

local function ___yvjy()
	local _etht = nil
	local str_krfap = "hxtu"
	local tab_gck = {}
	local tab_fd = {}
end

local function ___tut()
	local int_grogu = 27
	local _fhnag = nil
	local str_qip = "fus"
	local int_eusce = 24
end

local function ___sfxns()
	local bool_pwrx = false
	local tab_eynwe = {}
	local bool_hihnm = false
	local tab_ectdt = {}
	local str_prmtl = "gvceu"
end

local function ___dgp()
	local _hpjj = nil
	local bool_mz = false
	local _cbn = nil
	local bool_mtwtt = false
	local _zhhi = nil
end

local function ___iwo()
	local _abcev = nil
	local bool_cjy = false
	local int_ytb = 57
	local tab_mx = {}
end

local function ___gbrif()
	local int_fvz = 46
	local int_hgcm = 8
	local bool_imuj = false
	local bool_vz = false
	local _gy = nil
end

local function ___ue()
	local str_dk = "pzwj"
	local str_sjem = "pymvs"
	local tab_ukqo = {}
	local str_ejy = "adoec"
end

local function ___ujr()
	local _iuis = nil
	local str_tzn = "xrxm"
	local str_bchly = "ajgmum"
	local _ctcl = nil
	local tab_thwhw = {}
end

local function ___hymtm()
	local tab_nzj = {}
	local int_ppxg = 75
	local int_jqt = 74
	local bool_vpd = false
end

local function ___unqr()
	local str_udru = "raz"
	local int_bzhxs = 11
	local tab_trdl = {}
	local int_fl = 21
	local str_yzks = "yng"
end

local function ___fndfi()
	local _cqe = nil
	local bool_vwzq = false
	local bool_aqmup = false
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

-- Cocos2d-Lua core functions
cc.loaded_packages = {}
local loaded_packages = cc.loaded_packages

function cc.register(name, package)
    cc.loaded_packages[name] = package
end

function cc.load(...)
    local names = {...}
    assert(#names > 0, "cc.load() - invalid package names")

    local packages = {}
    for _, name in ipairs(names) do
        assert(type(name) == "string", string.format("cc.load() - invalid package name \"%s\"", tostring(name)))
        if not loaded_packages[name] then
            local packageName = string.format("packages.%s.init", name)
            local cls = require(packageName)
            assert(cls, string.format("cc.load() - package class \"%s\" load failed", packageName))
            loaded_packages[name] = cls

            if DEBUG > 1 then
                printInfo("cc.load() - load module \"packages.%s.init\"", name)
            end
        end
        packages[#packages + 1] = loaded_packages[name]
    end
    return unpack(packages)
end

local load_ = cc.load
local bind_
bind_ = function(target, ...)
    local t = type(target)
    assert(t == "table" or t == "userdata", string.format("cc.bind() - invalid target, expected is object, actual is %s", t))
    local names = {...}
    assert(#names > 0, "cc.bind() - package names expected")

    load_(...)
    if not target.components_ then target.components_ = {} end
    for _, name in ipairs(names) do
        assert(type(name) == "string" and name ~= "", string.format("cc.bind() - invalid package name \"%s\"", name))
        if not target.components_[name] then
            local cls = loaded_packages[name]
            for __, depend in ipairs(cls.depends or {}) do
                if not target.components_[depend] then
                    bind_(target, depend)
                end
            end
            local component = cls:create()
            target.components_[name] = component
            component:bind(target)
        end
    end

    return target
end
cc.bind = bind_

function cc.unbind(target, ...)
    if not target.components_ then return end

    local names = {...}
    assert(#names > 0, "cc.unbind() - invalid package names")

    for _, name in ipairs(names) do
        assert(type(name) == "string" and name ~= "", string.format("cc.unbind() - invalid package name \"%s\"", name))
        local component = target.components_[name]
        assert(component, string.format("cc.unbind() - component \"%s\" not found", tostring(name)))
        component:unbind(target)
        target.components_[name] = nil
    end
    return target
end

function cc.setmethods(target, component, methods)
    for _, name in ipairs(methods) do
        local method = component[name]
        target[name] = function(__, ...)
            return method(component, ...)
        end
    end
end

function cc.unsetmethods(target, methods)
    for _, name in ipairs(methods) do
        target[name] = nil
    end
end

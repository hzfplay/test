local ____lug = nil
local ____dlcd = nil
local ___tab_tjvyr = {}
local ___bool_nvh = false
local ___int_irqkm = 75
local ___str_ijrp = "rviuch"
local ___tab_kcwg = {}
local ___int_bfcj = 85
local ____mx = nil
local ___bool_lcwwh = false
local ____fjjs = nil
local ___int_oupc = 26
local ___str_zcscs = "lsmi"

local function ___hl()
	local tab_kcln = {}
	local tab_fjh = {}
	local str_zkc = "qvswh"
end

local function ___inw()
	local _jmeve = nil
	local _mrd = nil
end

local function ___kbj()
	local _tt = nil
	local bool_agyjm = false
	local int_hy = 10
	local int_zz = 78
end

local function ___oaknf()
	local bool_zq = false
	local tab_ut = {}
	local _zf = nil
	local tab_lhjsk = {}
end

local function ___vyr()
	local bool_znrkq = false
	local str_ge = "cqew"
	local str_gnou = "msm"
	local bool_wa = false
	local bool_fl = false
end

local function ___mv()
	local _fcte = nil
	local str_ygfr = "moof"
	local tab_hgg = {}
end

local function ___kn()
	local int_xz = 69
	local str_jev = "nehf"
	local int_bcn = 100
end

local function ___rc()
	local int_tsii = 24
	local int_oem = 53
	local int_cui = 30
	local tab_wqkf = {}
	local int_ykk = 38
end

local function ___phsi()
	local int_qrpo = 67
	local _erdy = nil
	local tab_gdqs = {}
	local _dbbuo = nil
	local bool_sh = false
end

local function ___bqyu()
	local int_muqfm = 8
	local bool_hpbsw = false
	local tab_zg = {}
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/05/10 14:28
---
local ThemeTournCashDelegate = class("ThemeTournCashDelegate")
local cls = ThemeTournCashDelegate
function cls:ctor(ctl)
    self.tcCommonCtl = ctl
    self.themeCtl = self.tcCommonCtl.themeCtl
    self.gameConfig = self.tcCommonCtl.gameConfig
end
function cls:getCommonConfig()
    return self.tcCommonCtl:getCommonConfig()
end
function cls:getPic(name)
    return string.format("theme_tourn_cash/%s", name)
end
function cls:getSpineFile(file_name, notPathSpine)
    local path2 = self.gameConfig.spine_path[file_name]
    --libDebug.printTable("rwb_spine_path", self.gameConfig.spine_path)
    local path = string.format("theme_tourn_cash/spine/%s", path2)
    return path
end
function cls:getFntFilePath(file_name)
    local path = string.format("theme_tourn_cash/font/%s", file_name)
    return path
end
function cls:getParticleFile(file_name)
    local path2 = self.gameConfig.particle_path[file_name]
    local path = string.format("theme_tourn_cash/particle/%s", path2)
    return path
end
function cls:getCsbPath(file_name)
    local path2 = self.gameConfig.csb_list[file_name]
    local path = string.format("theme_tourn_cash/csb/%s", path2)
    return path
end
function cls:getCellPos(...)
    return self.themeCtl:getCellPos(...)
end
function cls:laterCallBack(...)
    self.themeCtl:laterCallBack(...)
end
function cls:playMusicByName(file_name, singleton, loop)
    if self.tcCommonCtl.audio_list and self.tcCommonCtl.audio_list[file_name] then
        self.themeCtl:playCommonMusic(self.tcCommonCtl.audio_list[file_name], singleton, loop)
    end
end
function cls:stopMusicByName(file_name, isCleanSingle)
    if self.tcCommonCtl.audio_list and self.tcCommonCtl.audio_list[file_name] then
        self.themeCtl:stopCommonMusic(self.tcCommonCtl.audio_list[file_name], isCleanSingle)
    end
end

return cls
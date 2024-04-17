local ____kt = nil
local ___bool_uo = false
local ____sqxaw = nil
local ___tab_pwi = {}
local ___int_dfprs = 70
local ___bool_pxgl = false
local ___tab_eu = {}
local ___bool_oq = false
local ___str_tg = "qcsadh"
local ___int_gbsvi = 26
local ____ia = nil
local ____uz = nil
local ___bool_cznf = false
local ___str_xxvl = "ujk"
local ____mu = nil

local function ___nn()
	local str_va = "nbmrs"
	local int_sfe = 88
end

local function ___sz()
	local _nll = nil
	local bool_tyf = false
	local bool_jkw = false
	local bool_wjj = false
	local str_zbc = "ruvm"
end

local function ___pte()
	local _cgol = nil
	local str_bq = "dzq"
	local str_tszvw = "fxf"
	local bool_cvheg = false
end

local function ___mh()
	local int_hrc = 72
	local int_iv = 31
	local str_mlj = "dvptor"
	local tab_jj = {}
end

local function ___yw()
	local str_gm = "zbvmlq"
	local bool_exr = false
	local int_css = 43
end

local function ___cfuhy()
	local int_zmur = 68
	local _zw = nil
	local bool_aom = false
	local str_lutlu = "yyre"
	local tab_ahjrb = {}
end

local function ___scfc()
	local _ixodz = nil
	local tab_gicj = {}
	local int_ovmk = 49
end

local function ___ijkr()
	local str_tak = "rflhnx"
	local str_svx = "zygf"
	local tab_dk = {}
end

local function ___gd()
	local tab_gx = {}
	local bool_veq = false
end

local function ___wpuyw()
	local _jrf = nil
	local str_eys = "wkz"
	local bool_pkgrn = false
	local str_xkpa = "xhbs"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/01/20 13:30
---
local config = {}
local machine_status = {
    start   = 1,
    current = 2,
    collect = 3
}
config.machine_status = machine_status
config.spine_path = {
    popup_window = "spine/popup_window/spine",
    btn_start    = "spine/btn_start/spine",
    btn_collect  = "spine/btn_collect/spine",
    bg_light     = "spine/bg_light/spine",
    line_kuang   = "spine/win_kuang/mini_lhj",
}
config.audioList = {
    slot_popup   = "audio/slot_popup.mp3",
    slot_spin    = "audio/slot_spin.mp3",
    slot_win     = "audio/slot_win.mp3",
    common_click = "audio/click.mp3",
}
config.theme_config = {
    pays     = {
        12500000, 100000, 62500, 30000, 37500, 30000, 20000, 10000
    },
    reelKey  = {
        102, 103, 104, 105, 106, 107, 108, 109
    },
    base_bet = 5000,
}
config.dialog_config = {
    [1] = {

    },
    [3] = {
        baseScale = 0.85,
        maxWidth  = 480
    }
}
return config

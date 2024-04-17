local ___tab_oc = {}
local ___str_mvy = "lyf"
local ___tab_zrsy = {}
local ____jhat = nil
local ___str_qgvm = "hrcv"
local ___bool_cmd = false
local ___tab_fnxm = {}
local ___tab_fmu = {}
local ____jhpg = nil
local ___bool_uqg = false
local ___tab_kvr = {}
local ___tab_wtsr = {}
local ___int_fozle = 68
local ___tab_uvzbp = {}
local ___bool_dg = false
local ___tab_cv = {}

local function ___totxm()
	local str_kov = "czl"
	local int_gjhtd = 25
	local str_wurd = "xxul"
	local bool_rtcly = false
	local _hx = nil
end

local function ___jhlq()
	local int_ubfc = 49
	local tab_wcksg = {}
	local _sbjti = nil
	local tab_lq = {}
	local str_gagz = "gxztz"
end

local function ___cdkpo()
	local str_xcsh = "ubi"
	local bool_rjx = false
	local bool_cfgms = false
	local str_ux = "ivoppx"
	local _up = nil
end

local function ___ve()
	local _pl = nil
	local tab_isomj = {}
	local _psgl = nil
end

local function ___unzc()
	local str_anc = "xvcfzd"
	local tab_qrwa = {}
	local str_pfeyt = "uhny"
end

local function ___sjha()
	local str_osw = "rhcuir"
	local tab_fp = {}
	local bool_wxkas = false
end

local function ___za()
	local tab_gaaj = {}
	local str_dih = "nai"
	local bool_wxds = false
end

local function ___hft()
	local tab_kjrh = {}
	local str_lyyc = "rtw"
	local bool_rciv = false
	local int_ckh = 95
	local bool_zc = false
end

local function ___gww()
	local str_qhvv = "wmprq"
	local str_yo = "tlfc"
end

local function ___tcki()
	local bool_kn = false
	local _xn = nil
	local tab_okyi = {}
	local str_dxm = "swkw"
	local tab_wcw = {}
end

local function ___ybs()
	local int_voyi = 55
	local tab_of = {}
end

local function ___tyndw()
	local str_kiopz = "ezdrh"
	local _nfc = nil
	local int_awu = 70
end

local function ___dt()
	local int_spzzb = 32
	local _wbvp = nil
end

local function ___ijls()
	local _vflk = nil
	local tab_hjry = {}
	local _nc = nil
	local bool_qatq = false
	local bool_yfg = false
end

local function ___sav()
	local bool_dvur = false
	local tab_uoozr = {}
end

local function ___kwsts()
	local int_plgf = 74
	local bool_vtus = false
	local int_rcbbm = 43
	local bool_cff = false
end

local function ___iat()
	local str_xzx = "afqp"
	local bool_kzjsc = false
end
--[[
Author: xiongmeng
Date: 2021-03-25 18:39:37
LastEditors: xiongmeng
LastEditTime: 2021-04-26 21:32:11
Description: 
--]]
local config = {}
local machine_status = {
    start   = 1,
    current = 2,
    collect = 3
}
config.machine_status = machine_status
config.spine_path = {
    btn_common    = "spine/btn_common/spine",
    bg_light     = "spine/bg_light/spine",
    line_kuang   = "spine/win_kuang/xlhjzhongjiang",
    dialog_free  = "spine/dialog/spine",
}
config.csb_list = {
    dialog = "csb/slot_machine_v_popup.csb",
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
    ["dailog_start"] = {
        bg         = {
            name        = "dialog_free",
            startAction = { "animation2", false },
            loopAction  = { "animation2_1", true },
            endAction   = { "animation2_2", false },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 18 / 30, 0 }, { 12 / 30, 1.2 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 13 / 30, 1.12 }, { 6 / 30, 0 } },
        },
        btn        = {
            name    = "btn_common",
            aniName = "animation",
        },
    },
    ["dailog_collect"] = {
        bg         = {
            name        = "dialog_free",
            startAction = { "animation1", false },
            loopAction  = { "animation1_1", true },
            endAction   = { "animation1_2", false },
        },
        label_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 8 / 30, 0 }, { 7 / 30, 1.12 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.24 }, { 7 / 30, 0 } },

            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 18 / 30, 255 }, { 7 / 30, 0 } },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 12 / 30, 0.5 }, { 9 / 30, 1.13 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1.13 }, { 8 / 30, 0.5 } },

            stepFade     = { { 0 }, { 12 / 30, 0 }, { 5 / 30, 255 } },
            stepEndFade  = { { 255 }, { 13 / 30, 255 }, { 5 / 30, 0 } },
        },
        btn        = {
            name    = "btn_common",
            aniName = "animation",
        },
        maxWidth   = 675,
    },
    ["black_common"] = {
        stepFade     = { { 0 },  { 8 / 30, 200 } },
        stepEndFade  = { { 200 }, { 8 / 30, 0 } },
    }
}
return config
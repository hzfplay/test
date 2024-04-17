local ___tab_tc = {}
local ____mskdf = nil
local ____whzyg = nil
local ___str_ixbpx = "vfg"
local ___int_nvta = 41
local ___bool_bns = false
local ___str_jv = "txmw"
local ___tab_pulq = {}
local ___tab_bxe = {}
local ___str_zckuz = "bdeqj"
local ____tmvr = nil
local ___bool_zreqk = false
local ___int_irbp = 48
local ___tab_lj = {}
local ___int_do = 55
local ___int_ukpzi = 82
local ___int_mgek = 48
local ___int_dngg = 2
local ____johsz = nil
local ___int_jpcj = 7
local ___str_xdq = "ait"
local ___str_ury = "hfbx"

local function ___ncxb()
	local str_ouhb = "xrdfra"
	local tab_jziww = {}
	local int_ag = 17
end

local function ___eon()
	local tab_uirq = {}
	local bool_ucpby = false
	local int_ox = 86
	local str_dv = "lzk"
	local str_ramzg = "sjunm"
end

local function ___ntjrj()
	local str_yn = "gclby"
	local bool_tmd = false
	local str_rjtp = "nifubl"
	local str_el = "hxnee"
	local tab_afdwr = {}
end

local function ___axruf()
	local tab_ycw = {}
	local str_nsdzg = "zncbm"
end

local function ___mb()
	local int_qpnie = 99
	local _kq = nil
	local int_lgbv = 95
end

local function ___agwlo()
	local bool_bzhd = false
	local int_bhh = 19
	local str_gnc = "xqqtmi"
	local bool_is = false
end

local function ___tr()
	local int_kiz = 81
	local _ji = nil
	local bool_pfyj = false
	local bool_vk = false
	local _swxha = nil
end

local function ___ueq()
	local _hhoh = nil
	local int_zayh = 67
end

local function ___tagl()
	local tab_vg = {}
	local _szn = nil
	local str_huag = "cagnow"
end

local function ___rj()
	local _nx = nil
	local str_gzs = "maie"
	local int_dkjw = 78
	local str_tai = "xziyd"
end

local function ___ocbex()
	local _bdcf = nil
	local bool_idskp = false
	local int_sec = 14
end

local function ___dmf()
	local str_vtwi = "chsk"
	local tab_def = {}
	local str_mzmib = "gibz"
	local tab_xx = {}
end

local function ___pqx()
	local _dwr = nil
	local bool_dukx = false
	local bool_xgogm = false
end

local function ___yhhl()
	local tab_wcscp = {}
	local _tdj = nil
	local bool_tsahn = false
	local str_ojpib = "nem"
	local tab_hyws = {}
end

local function ___mqf()
	local tab_aqd = {}
	local int_hty = 82
	local bool_fywfa = false
end

local function ___udau()
	local bool_sogq = false
	local int_th = 73
	local int_jkntf = 46
	local _hdv = nil
	local str_kavj = "lkvwmv"
end

local function ___ltt()
	local _qsc = nil
	local str_jc = "ogdja"
end

local function ___xtopf()
	local tab_ksnpq = {}
	local bool_rxsub = false
	local str_xgsn = "tadll"
end

local function ___uxzx()
	local tab_xmv = {}
	local tab_gz = {}
	local bool_mm = false
	local bool_qkqc = false
end

local function ___ggwm()
	local bool_dintm = false
	local tab_wcmhm = {}
end

local function ___izzzj()
	local _kan = nil
	local str_hprdc = "tilgps"
	local str_onhji = "jxuh"
	local int_tzicj = 10
end

local function ___ggts()
	local int_bor = 62
	local bool_gso = false
	local bool_zf = false
end

local function ___dnawe()
	local tab_tep = {}
	local int_fl = 13
	local tab_ih = {}
	local bool_dw = false
end

local function ___brjxo()
	local int_pn = 54
	local str_wc = "ket"
	local str_pty = "ngxfoi"
end

local function ___xxkxd()
	local int_um = 33
	local int_wo = 21
	local tab_pnx = {}
	local _eqn = nil
end

local function ___watxg()
	local bool_fmgsu = false
	local tab_zdu = {}
	local int_kurs = 32
	local str_em = "food"
end

local function ___nrkxg()
	local int_aazh = 16
	local _su = nil
	local str_tosf = "bmuv"
end
--[[
Author: xiongmeng
Date: 2020-11-19 16:05:16
LastEditors: xiongmeng
LastEditTime: 2020-12-24 11:58:08
Description: 
--]]
local config = {}
config.fs_show_type = {
    start = 1,
    more = 2,
    collect = 3,
}

config.csb_list = {
    dialog_free = "csb/dialog_free.csb",
    dialog_wheel = "csb/dialog_wheel.csb",
    dialog_booster = "csb/dialog_booster.csb",
    dialog_mapfree = "csb/map_free.csb",
    dialog_jp = "csb/dialog_jp.csb",
    dialog_gameMaster = "csb/master_start.csb",
}

config.dialog_config = {
    ["gamemaster"] = {
        bg         = {
            name        = "dialog_wheel",
            startAction = { "animation3", false },
            loopAction  = { "animation3_1", true },
            endAction   = { "animation3_2", false },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 18 / 30, 0 }, { 12 / 30, 1.2 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 13 / 30, 1.12 }, { 6 / 30, 0 } },
        },
        btn        = {
            name    = "dialog_btn",
            aniName = "animation",
        },
    },
    ["free_start"] = {
        bg         = {
            name        = "dialog_free",
            startAction = { "animation%s", false },
            loopAction  = { "animation%s_1", true },
            endAction   = { "animation%s_2", false },
            formatname = true
        },
        label_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 3 / 30, 0 }, { 9 / 30, 1.08 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 5 / 30, 1 }, { 8 / 30, 1.08 }, { 6 / 30, 0 } },

            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 13 / 30, 255 }, { 7 / 30, 0 } },    
        },
        ad_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 6 / 30, 0}, { 9 / 30, 1.08 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.08 }, { 7 / 30, 0 } },

            stepFade     = { { 0 }, { 6 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 15 / 30, 255 }, { 7 / 30, 0 } },
        },
        pig_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 6 / 30, 0}, { 9 / 30, 1.08 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.08 }, { 7 / 30, 0 } },

            stepFade     = { { 0 }, { 6 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 15 / 30, 255 }, { 7 / 30, 0 } },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 11 / 30, 0 }, { 7 / 30, 1.08 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 10 / 30, 1.08 }, { 8 / 30, 0 } },
        },
        btn        = {
            name    = "dialog_btn",
            aniName = "animation",
        },
    },
    ["free_more"] = {
        bg         = {
            name        = "dialog_free",
            startAction = { "animation%s", false },
            loopAction  = { "animation%s_1", true },
            endAction   = { "animation%s_2", false },
            formatname = true
        },
        label_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 3 / 30, 0 }, { 9 / 30, 1.08 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 5 / 30, 1 }, { 8 / 30, 1.08 }, { 6 / 30, 0 } },

            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 13 / 30, 255 }, { 7 / 30, 0 } },    
        },
    },
    ["free_collect"] = {
        bg         = {
            name        = "dialog_free",
            startAction = { "animation%s", false },
            loopAction  = { "animation%s_1", true },
            endAction   = { "animation%s_2", false },
            formatname = true
        },
        label_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 3 / 30, 0 }, { 9 / 30, 1.08 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 5 / 30, 1 }, { 8 / 30, 1.08 }, { 6 / 30, 0 } },

            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 13 / 30, 255 }, { 7 / 30, 0 } },    
        },
        ad_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 11 / 30, 0 }, { 7 / 30, 1.08 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 10 / 30, 1.08 }, { 8 / 30, 0 } },

            stepFade     = { { 0 }, { 6 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 15 / 30, 255 }, { 7 / 30, 0 } },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 11 / 30, 0 }, { 7 / 30, 1.08 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 10 / 30, 1.08 }, { 8 / 30, 0 } },
        },
        btn        = {
            name    = "dialog_btn",
            aniName = "animation",
        },
        maxWidth   = 505,
    },
    ["wheel_start"] = {
        bg         = {
            name        = "dialog_wheel",
            startAction = { "animation5", false },
            loopAction  = { "animation5_1", true },
            endAction   = { "animation5_2", false },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 18 / 30, 0 }, { 12 / 30, 1.2 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 13 / 30, 1.12 }, { 6 / 30, 0 } },
        },
        btn        = {
            name    = "dialog_btn",
            aniName = "animation",
        },
    },
    ["wheel_collect"] = {
        bg         = {
            name        = "dialog_wheel",
            startAction = { "animation%s", false },
            loopAction  = { "animation%s_1", true },
            endAction   = { "animation%s_2", false },
            formatname = true
        },
        label_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 8 / 30, 0 }, { 7 / 30, 1.12 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.24 }, { 7 / 30, 0 } },
            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 18 / 30, 255 }, { 7 / 30, 0 } },
        },
        label_content = {
            isAction     = true,
            stepScale    = { { 0 }, { 8 / 30, 0 }, { 7 / 30, 1.12 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.24 }, { 7 / 30, 0 } },
            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 18 / 30, 255 }, { 7 / 30, 0 } },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 18 / 30, 0 }, { 12 / 30, 1.2 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 13 / 30, 1.12 }, { 6 / 30, 0 } },
        },
        ad_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 18 / 30, 0 }, { 12 / 30, 1.2 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 13 / 30, 1.12 }, { 6 / 30, 0 } },
        },
        btn        = {
            name    = "dialog_btn",
            aniName = "animation",
        },
        maxWidth   = 650,
    },
    ["map_free_start"] = {
        bg         = {
            name        = "dialog_wheel",
            startAction = { "animation%s", false },
            loopAction  = { "animation%s_1", true },
            endAction   = { "animation%s_2", false },
            formatname = true
        },
        label_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 8 / 30, 0 }, { 7 / 30, 1.12 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.24 }, { 7 / 30, 0 } },
            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 18 / 30, 255 }, { 7 / 30, 0 } },
        },
        booster_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 8 / 30, 0 }, { 7 / 30, 1.12 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.24 }, { 7 / 30, 0 } },
            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 18 / 30, 255 }, { 7 / 30, 0 } },
        },
        pig_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 8 / 30, 0 }, { 7 / 30, 1.12 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.24 }, { 7 / 30, 0 } },
            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 18 / 30, 255 }, { 7 / 30, 0 } },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 18 / 30, 0 }, { 12 / 30, 1.2 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 13 / 30, 1.12 }, { 6 / 30, 0 } },
        },
        btn        = {
            name    = "dialog_btn",
            aniName = "animation",
        },
    },
    ["map_free_collect"] = {
        bg         = {
            name        = "dialog_wheel",
            startAction = { "animation%s", false },
            loopAction  = { "animation%s_1", true },
            endAction   = { "animation%s_2", false },
            formatname = true
        },
        label_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 8 / 30, 0 }, { 7 / 30, 1.12 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.24 }, { 7 / 30, 0 } },
            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 18 / 30, 255 }, { 7 / 30, 0 } },
        },
        booster_node = {
            isAction     = true,
            stepScale    = { { 0 }, { 8 / 30, 0 }, { 7 / 30, 1.12 }, { 7 / 30, 1 } },
            stepEndScale = { { 1 }, { 8 / 30, 1 }, { 7 / 30, 1.24 }, { 7 / 30, 0 } },
            stepFade     = { { 0 }, { 5 / 30, 0 }, { 7 / 30, 255 } },
            stepEndFade  = { { 255 }, { 18 / 30, 255 }, { 7 / 30, 0 } },
        },
        btn_node   = {
            isAction     = true,
            stepScale    = { { 0 }, { 18 / 30, 0 }, { 12 / 30, 1.2 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 13 / 30, 1.12 }, { 6 / 30, 0 } },
        },
        btn        = {
            name    = "dialog_btn",
            aniName = "animation",
        },
        maxWidth   = 674,
    },
    ["jp_collect"] = {
        bg         = {
            name        = "dialog_jp",
            startAction = { "animation%s", false },
            loopAction  = { "animation%s_1", true },
            endAction   = { "animation%s_2", false },
            formatname = true
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
            stepScale    = { { 0 }, { 18 / 30, 0 }, { 12 / 30, 1.2 }, { 10 / 30, 1 } },
            stepEndScale = { { 1 }, { 13 / 30, 1.12 }, { 6 / 30, 0 } },
        },
        btn        = {
            name    = "dialog_btn",
            aniName = "animation",
        },
        maxWidth   = 674,
    },
    ["black_common"] = {
        stepFade     = { { 0 },  { 8 / 30, 200 } },
        stepEndFade  = { { 200 }, { 8 / 30, 0 } },
    }
}

config.spine_path = {
    dialog_free = "dialog/freetanchuang",
    dialog_wheel = "dialog/xiaozhutanchuang",
    dialog_btn   = "dialog/anniu",
    dialog_jp    = "dialog/jptanchuang",

}
return config




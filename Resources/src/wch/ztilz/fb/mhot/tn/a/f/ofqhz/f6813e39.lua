local ___tab_veh = {}
local ___tab_izi = {}
local ___tab_wvj = {}
local ___int_mlqlc = 88
local ___int_ce = 2
local ___int_abyti = 23
local ____rq = nil
local ___int_wfak = 34
local ___int_mah = 27
local ___str_riq = "mwm"
local ____ne = nil
local ___tab_jlcen = {}
local ___int_qm = 19
local ___tab_veyil = {}

local function ___zccp()
	local bool_cerc = false
	local tab_ncjq = {}
	local tab_qf = {}
	local bool_ofz = false
	local bool_anf = false
end

local function ___glfla()
	local int_kty = 30
	local str_cnfpm = "upgp"
	local tab_ujhkv = {}
	local bool_kbkao = false
end

local function ___pi()
	local str_ww = "yhsk"
	local _pt = nil
	local bool_dpgw = false
	local str_dqww = "nla"
end

local function ___uuyl()
	local str_zyhjm = "ypahfm"
	local int_yh = 32
	local str_lt = "ukq"
	local tab_nrqyb = {}
	local tab_jlv = {}
end

local function ___as()
	local str_pdsnf = "gmqakc"
	local tab_vh = {}
	local int_llc = 4
	local int_jra = 28
end

local function ___glum()
	local int_jrz = 3
	local str_xx = "sxgvy"
	local int_igj = 41
	local int_miueb = 24
end

local function ___xtz()
	local str_pnp = "rsz"
	local str_jnu = "hhcph"
	local bool_kj = false
	local tab_kxbn = {}
	local tab_emq = {}
end

local function ___res()
	local int_ifhhg = 16
	local int_gm = 30
end

local function ___xuf()
	local int_bmw = 72
	local tab_ktrbt = {}
	local bool_dtmi = false
	local int_cohr = 95
end

local function ___ze()
	local tab_wf = {}
	local tab_wjoo = {}
	local _tgpc = nil
	local bool_wb = false
end

local function ___iq()
	local tab_dxqf = {}
	local tab_whvwg = {}
	local _igfv = nil
	local tab_skfky = {}
	local int_tdnir = 18
end

local function ___hcoo()
	local _kufe = nil
	local str_sbcfn = "hnueu"
	local str_bvr = "dbtos"
	local _uqqoz = nil
	local _pge = nil
end

local function ___solpw()
	local str_nkw = "itn"
	local int_ugywd = 47
end

local function ___pti()
	local bool_ci = false
	local tab_sj = {}
	local int_qecn = 73
	local bool_pnixy = false
	local tab_ojqf = {}
end

local function ___uszep()
	local int_hgi = 69
	local int_ndysp = 81
	local str_ng = "vwhsr"
end

local function ___amjyz()
	local str_cai = "klatl"
	local bool_cjjpt = false
	local bool_mnbs = false
	local bool_pqln = false
end

local function ___mpb()
	local _kfk = nil
	local tab_kkbq = {}
	local int_ubah = 50
	local _bjmdm = nil
	local tab_andlg = {}
end

local function ___zgbo()
	local tab_wyfj = {}
	local tab_njxzw = {}
	local bool_rx = false
end
local ThemeLoadingConfig = {}

ThemeLoadingConfig.srcConfig =  -- loading_page1 全部解锁， loading_page2 部分解锁
{
    [188] = {"theme_loading/image/loading_page2.csb", "theme_loading/image/tip/loading_new2_active_takeorleave.png","#theme188_loading01_lbl.png"},
}

ThemeLoadingConfig.loading2_config = { -- logo 位置
    [2010] = { -- 使用默认图片
        logo = {
            path = "theme_loading/theme2010/loading2/bonus_loading_2010.png", 
            pos = cc.p(0, -29)
        }
    },
    [2013] = {
        logo = {
            path = "theme_loading/theme2013/loading2/bonus_loading_2013.png", 
            pos = cc.p(-4, -26)
        }
    },
    [2014] = {
        logo = {
            path = "theme_loading/theme2014/loading2/bonus_loading_2014.png", 
            pos = cc.p(-4, -26)
        }
    },
}

ThemeLoadingConfig.loading_logo_config = {
    
}

ThemeLoadingConfig.loading_bar_config = {
    [188] = {
        width      = 511,
        height     = 30,
        pos_bar    = cc.p(0, 10),
        bar_spine  = "theme_desktop/theme188/login/spines/bolt/spine"
    }
}

return ThemeLoadingConfig

local ___str_oon = "siiyh"
local ___int_oc = 71
local ___tab_gxz = {}
local ___int_qlr = 76
local ___tab_qcg = {}
local ___bool_bw = false
local ____ne = nil
local ___int_gh = 94
local ___tab_aqf = {}
local ___bool_wiq = false
local ___str_skk = "fbef"
local ___bool_cx = false
local ___bool_vhf = false
local ___str_ss = "htr"
local ___str_twot = "pedr"
local ____jf = nil
local ___str_gmeer = "gkvks"
local ____rqak = nil
local ___tab_sl = {}
local ___int_ia = 44
local ____uql = nil
local ___tab_ophwx = {}

local function ___jkugh()
	local bool_nxj = false
	local int_sj = 94
	local bool_rw = false
	local str_ndfs = "uhjmy"
end

local function ___dja()
	local int_zjlaz = 56
	local tab_hstnh = {}
	local int_gs = 2
	local str_znzw = "utmm"
end

local function ___brr()
	local _gpa = nil
	local _af = nil
end

local function ___jhid()
	local _iyn = nil
	local tab_uoyen = {}
	local int_pe = 41
end

local function ___hf()
	local tab_drz = {}
	local bool_jush = false
end

local function ___zbpxl()
	local bool_hwh = false
	local _lhclr = nil
end

local function ___ervin()
	local int_iwc = 40
	local int_dfim = 35
	local str_spe = "isv"
	local bool_cw = false
end

local function ___tew()
	local tab_sjtvt = {}
	local _iu = nil
	local bool_amv = false
	local tab_wromd = {}
end

local function ___sd()
	local str_jk = "vfc"
	local _qbyz = nil
	local str_ghtp = "atgiax"
end

local function ___ptijj()
	local bool_ymoa = false
	local tab_umad = {}
	local _wvp = nil
	local str_jvaf = "hcwjj"
	local _crx = nil
end

local function ___gifje()
	local str_ukg = "wtz"
	local bool_gwyy = false
	local str_ueqdk = "yiwgj"
end

local function ___hrw()
	local int_myrcx = 92
	local _wmi = nil
	local _lnyn = nil
	local tab_fzcva = {}
	local _qgs = nil
end

local function ___qa()
	local bool_ps = false
	local _xczkh = nil
	local bool_imb = false
	local int_ko = 40
end

local function ___rmk()
	local int_pfbn = 17
	local str_cieat = "npasga"
end

local function ___cpr()
	local tab_wfrjw = {}
	local bool_sfrju = false
end

local LobbyThemeConfig = {}

local JP_SIZE = {
	GRAND = 234,
	MAJOR = 184,
	MINI = 164
}

FEATURE_CLASS = {
	ULTRA_RESPIN = "ultra_respin",
	EPIC_LINK = "epic_link",
	RAPID_PAY = "rapid_pay",
	LUCKY_PUZZLE = "lucky_puzzle",
	-- LUCKY_PUZZLE2 = "lucky_puzzle2",
	SUPER_BONUS = "super_bonus",
}

THEME_TYPE = {
	NORMAL = "normal",
	NEW = "new",
	SOON = "comming soon",
	POPULAR = "popular",
	SPECIAL = "special",
	PROGRESSIVE = "progressive"
}

THEME_STYLE = {
	SMALL = 1,
    LONG = 2,
    HUGE = 3
}

LOBBY_TYPE = {
	LOBBY = 1,
	FAVORITE = 2,
	VIP = 3
}

SAVED_LOBBY_OFFSET = 0
SAVED_LOUNGE_OFFSET = 0

SHOW_PIGGY_TIPS = false

LobbyThemeConfig.themeAttributes =
{
	Normal = 0,
	NewTheme = 1, -- new
	ComingSoon = 2, -- coming soon
	Hot = 3, -- hot
	OnlyInQuest = 4, -- only in quest
	Maintainess = 5, -- maintainess
	NeedUpdate = 6, -- update app
}

LobbyThemeConfig.themeConfig =
{
	[188] =
	{
		jpLoading =
		{
    		{"grand", 65},
			{"major", 49},
			{"minor", 49},
    	},
    	lobbyConfig =
    	{
	        lobby_type         = 0,
	        animation_list     = {"animation"},
	        play_frame         = {},
	        preload_spine      = "188_icon_01",
	  --       feature_logo       = true,
			-- feature_logo_themePath = "lucky_puzzle2",
	        useCommonJP = true,
	        lobby_bg_scale = 1,
	        --jackpot_label = "lobby_jackpot_purple",
	        jackpot_label_list =
	        {
	            {
	                level     = "grand",
	            },
	            {
	                level     = "major",
	            },
	            {
	                level     = "minor",
	            },
	        },
	    },
    },
}


return LobbyThemeConfig


local ___bool_rqqe = false
local ___int_nchtn = 0
local ___bool_qxwn = false
local ___bool_gya = false
local ____oj = nil
local ____ukj = nil
local ___tab_acwm = {}
local ___int_tgv = 90
local ___tab_tag = {}
local ___int_ts = 87
local ____qnfl = nil
local ___tab_rfra = {}
local ___str_frl = "rowsge"
local ____jq = nil
local ____tpu = nil
local ____zp = nil
local ____pcq = nil
local ___int_utb = 82

local function ___ov()
	local str_tdi = "voshed"
	local str_kqam = "brppgz"
	local str_xv = "carood"
end

local function ___vzlt()
	local int_obdco = 77
	local tab_za = {}
	local _id = nil
	local _piy = nil
	local int_icb = 45
end

local function ___hie()
	local bool_xjeef = false
	local tab_yfhu = {}
	local bool_nrsb = false
	local str_xtz = "shyniq"
	local bool_dvw = false
end

local function ___dnka()
	local _psunj = nil
	local str_qf = "osr"
end

local function ___smd()
	local str_ep = "vpvo"
	local _qu = nil
end

local function ___efslm()
	local int_svdv = 91
	local bool_gj = false
	local bool_ysvs = false
	local str_gyq = "aib"
	local tab_codwf = {}
end

local function ___pdk()
	local str_vceh = "hwnw"
	local _ad = nil
	local _oeukz = nil
end

local function ___slx()
	local int_jen = 81
	local _slk = nil
	local bool_bdd = false
	local tab_yacgf = {}
	local int_jv = 10
end

local function ___wzfou()
	local _wsde = nil
	local tab_ll = {}
	local bool_wqva = false
	local tab_cu = {}
end

local function ___mm()
	local int_kj = 83
	local bool_ceh = false
	local bool_bqn = false
end

local function ___ua()
	local str_mkwje = "otyzz"
	local _huxrh = nil
	local _zwdqe = nil
end

local function ___nmmn()
	local _xv = nil
	local str_qpr = "ssq"
	local bool_cbcc = false
	local bool_leyx = false
	local int_thg = 46
end

local function ___xbjs()
	local str_zwkjy = "wuvs"
	local tab_warh = {}
end

local function ___smhxf()
	local int_wruw = 65
	local tab_vqga = {}
	local bool_gkolt = false
end

local function ___luggf()
	local tab_urmi = {}
	local bool_cjju = false
	local str_kck = "vho"
	local int_zvbr = 66
end

local function ___un()
	local bool_oy = false
	local int_mztn = 53
end

local function ___airgv()
	local _gbebg = nil
	local int_biuby = 88
	local _nv = nil
	local _yggit = nil
end

local function ___bhzpe()
	local tab_ksic = {}
	local _jh = nil
	local tab_ddzk = {}
end

local function ___brncf()
	local bool_duej = false
	local bool_fkar = false
end

local function ___lxj()
	local bool_kp = false
	local bool_ky = false
	local bool_uixwo = false
	local bool_mztkw = false
	local int_hlflg = 45
end

local function ___cxhzh()
	local tab_xri = {}
	local _cj = nil
	local int_udej = 81
	local tab_wj = {}
end

local function ___lslbu()
	local bool_eapgu = false
	local int_dix = 37
end

local function ___avtwo()
	local _xyr = nil
	local int_vf = 6
	local bool_omhe = false
end

local function ___atuj()
	local int_vvp = 73
	local tab_pm = {}
	local tab_pix = {}
	local tab_peeo = {}
end

local function ___xtyu()
	local tab_gtqdw = {}
	local str_ca = "pbc"
	local int_sba = 48
	local bool_gzfa = false
	local tab_jnob = {}
end

local function ___ij()
	local int_okpi = 9
	local _vy = nil
	local str_ubwxa = "zbwmbn"
	local int_vuxn = 70
end

local function ___mkvgp()
	local int_fqu = 75
	local bool_oldgf = false
end

local function ___xzcjf()
	local bool_gcfjr = false
	local str_vf = "pdopm"
	local bool_zbinx = false
end
if nil == cc.SimpleAudioEngine then
    return
end
--tip
local function deprecatedTip(old_name,new_name)
    print("\n********** \n"..old_name.." was deprecated please use ".. new_name .. " instead.\n**********")
end

--functions of SimpleAudioEngine will be deprecated begin
local SimpleAudioEngineDeprecated = { }
function SimpleAudioEngineDeprecated.sharedEngine()
    deprecatedTip("SimpleAudioEngine:sharedEngine","SimpleAudioEngine:getInstance")
    return cc.SimpleAudioEngine:getInstance()
end
SimpleAudioEngine.sharedEngine = SimpleAudioEngineDeprecated.sharedEngine

function SimpleAudioEngineDeprecated.playBackgroundMusic(self,...)
    deprecatedTip("SimpleAudioEngine:playBackgroundMusic","SimpleAudioEngine:playMusic")
    return self:playMusic(...)
end
SimpleAudioEngine.playBackgroundMusic = SimpleAudioEngineDeprecated.playBackgroundMusic
--functions of SimpleAudioEngine will be deprecated end

local ___tab_jbd = {}
local ___bool_to = false
local ___int_zfn = 26
local ___bool_qyt = false
local ___bool_fjot = false
local ____pun = nil
local ___bool_ldc = false
local ___int_ho = 100
local ____skpe = nil
local ___str_ufe = "nxon"
local ___int_cpk = 25
local ___str_hb = "ntjn"
local ___int_vwymk = 1
local ___tab_pfgsg = {}
local ___tab_dnust = {}
local ___str_ew = "ndssb"
local ___str_asulb = "ommh"
local ___bool_kw = false
local ___tab_dfnx = {}

local function ___pckgt()
	local int_jtesj = 18
	local bool_kr = false
end

local function ___tmym()
	local int_xb = 30
	local str_qjsz = "edbr"
end

local function ___hohmr()
	local int_zqhj = 80
	local tab_hv = {}
	local tab_vewo = {}
end

local function ___oovjn()
	local _za = nil
	local int_wsi = 91
end

local function ___qzsly()
	local str_vhii = "prvaxy"
	local tab_kylf = {}
end

local function ___njx()
	local bool_kagp = false
	local bool_hpbt = false
	local tab_tpgm = {}
end

local function ___bx()
	local _ztuyi = nil
	local int_vtgyw = 74
	local bool_kof = false
	local str_xqh = "yrdl"
end

local function ___tks()
	local int_fb = 51
	local _is = nil
end

local function ___vxxr()
	local bool_ry = false
	local tab_opv = {}
	local int_wmv = 81
	local bool_rpugi = false
	local str_ryc = "cku"
end

local function ___ls()
	local tab_tabm = {}
	local str_jd = "gndm"
end

local function ___pfh()
	local str_carga = "nrs"
	local int_opxo = 25
end

local function ___uit()
	local tab_htpe = {}
	local bool_obqg = false
end

local function ___vnqu()
	local int_xryma = 14
	local bool_xuo = false
	local int_txs = 29
	local int_ooups = 80
end

local function ___sr()
	local bool_eiupd = false
	local str_cbpj = "gbrui"
	local bool_dd = false
end

local function ___jatdt()
	local tab_fokhs = {}
	local bool_pcb = false
	local bool_rt = false
	local bool_igxpa = false
end

local function ___rzck()
	local str_zy = "apy"
	local bool_ktsgy = false
end

local function ___zvi()
	local int_fh = 69
	local bool_ccj = false
	local _ees = nil
end

local function ___em()
	local bool_rfqb = false
	local _bod = nil
end

local function ___kqhww()
	local _ng = nil
	local tab_bx = {}
	local int_olbam = 1
end

local function ___irtd()
	local tab_nm = {}
	local int_kjjqv = 99
	local _vbmd = nil
	local _zw = nil
end

local function ___jfbl()
	local str_beq = "ezyget"
	local int_aik = 82
end

local function ___dcig()
	local _kixuq = nil
	local tab_fk = {}
end

local function ___bwvj()
	local str_cdz = "etf"
	local int_vwgt = 74
end

local function ___sbcb()
	local _wsct = nil
	local tab_ojtnj = {}
	local bool_jyh = false
end

local function ___vukuq()
	local _qtr = nil
	local int_vxxz = 57
end

local function ___iivs()
	local _oc = nil
	local str_qno = "ocbkq"
	local str_hen = "wpu"
end

local function ___imk()
	local str_mkx = "xsut"
	local tab_yq = {}
	local bool_atg = false
end

local function ___jkg()
	local bool_rzb = false
	local tab_pmuho = {}
	local str_vuav = "kvbvg"
end
if nil == cc.SimpleAudioEngine then
    return
end
--Encapsulate SimpleAudioEngine to AudioEngine,Play music and sound effects.
local M = {}

function M.stopAllEffects()
    cc.SimpleAudioEngine:getInstance():stopAllEffects()
end

function M.getMusicVolume()
    return cc.SimpleAudioEngine:getInstance():getMusicVolume()
end

function M.isMusicPlaying()
    return cc.SimpleAudioEngine:getInstance():isMusicPlaying()
end

function M.getEffectsVolume()
    return cc.SimpleAudioEngine:getInstance():getEffectsVolume()
end

function M.setMusicVolume(volume)
    cc.SimpleAudioEngine:getInstance():setMusicVolume(volume)
end

function M.stopEffect(handle)
    cc.SimpleAudioEngine:getInstance():stopEffect(handle)
end

function M.stopMusic(isReleaseData)
    local releaseDataValue = false
    if nil ~= isReleaseData then
        releaseDataValue = isReleaseData
    end
    cc.SimpleAudioEngine:getInstance():stopMusic(releaseDataValue)
end

function M.playMusic(filename, isLoop)
    local loopValue = false
    if nil ~= isLoop then
        loopValue = isLoop
    end
    cc.SimpleAudioEngine:getInstance():playMusic(filename, loopValue)
end

function M.pauseAllEffects()
    cc.SimpleAudioEngine:getInstance():pauseAllEffects()
end

function M.preloadMusic(filename)
    cc.SimpleAudioEngine:getInstance():preloadMusic(filename)
end

function M.resumeMusic()
    cc.SimpleAudioEngine:getInstance():resumeMusic()
end

function M.playEffect(filename, isLoop)
    local loopValue = false
    if nil ~= isLoop then
        loopValue = isLoop
    end
    return cc.SimpleAudioEngine:getInstance():playEffect(filename, loopValue)
end

function M.rewindMusic()
    cc.SimpleAudioEngine:getInstance():rewindMusic()
end

function M.willPlayMusic()
    return cc.SimpleAudioEngine:getInstance():willPlayMusic()
end

function M.unloadEffect(filename)
    cc.SimpleAudioEngine:getInstance():unloadEffect(filename)
end

function M.preloadEffect(filename)
    cc.SimpleAudioEngine:getInstance():preloadEffect(filename)
end

function M.setEffectsVolume(volume)
    cc.SimpleAudioEngine:getInstance():setEffectsVolume(volume)
end

function M.pauseEffect(handle)
    cc.SimpleAudioEngine:getInstance():pauseEffect(handle)
end

function M.resumeAllEffects(handle)
    cc.SimpleAudioEngine:getInstance():resumeAllEffects()
end

function M.pauseMusic()
    cc.SimpleAudioEngine:getInstance():pauseMusic()
end

function M.resumeEffect(handle)
    cc.SimpleAudioEngine:getInstance():resumeEffect(handle)
end

function M.getInstance()
    return cc.SimpleAudioEngine:getInstance()
end

function M.destroyInstance()
    return cc.SimpleAudioEngine:destroyInstance()
end

AudioEngine = M

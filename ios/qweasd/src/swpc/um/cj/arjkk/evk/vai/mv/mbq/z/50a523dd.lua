local ___str_brii = "hjdnae"
local ___str_bqp = "ghcd"
local ____gi = nil
local ___bool_gy = false
local ___int_kulr = 61
local ___bool_dwjd = false
local ___int_vy = 65
local ____dbkel = nil
local ___tab_lzt = {}
local ____pwcrs = nil
local ____azdx = nil
local ___int_epy = 73
local ___tab_bd = {}
local ___str_egmjd = "uae"
local ___str_tqroz = "meetzi"
local ___bool_ulez = false
local ____iup = nil
local ___int_npgmv = 86
local ___int_kz = 44
local ____rfaf = nil

local function ___ke()
	local _zljiu = nil
	local bool_zq = false
end

local function ___xrzo()
	local tab_utc = {}
	local _oe = nil
	local _ida = nil
	local bool_qzfmf = false
	local tab_vkmnd = {}
end

local function ___fxope()
	local _tz = nil
	local _cmocu = nil
end

local function ___xmcn()
	local bool_fxe = false
	local tab_ezn = {}
	local bool_up = false
end

local function ___iugok()
	local bool_kx = false
	local int_bal = 35
	local tab_bp = {}
end

local function ___ciz()
	local str_nlolr = "dson"
	local tab_nks = {}
end

local function ___ni()
	local bool_ij = false
	local int_mia = 1
	local str_kgb = "deo"
	local _jpb = nil
	local str_hmym = "nhndf"
end

local function ___blu()
	local tab_tj = {}
	local tab_xm = {}
	local str_ijptd = "odc"
	local str_fjft = "vgv"
end

local function ___mrd()
	local bool_ifabs = false
	local tab_tba = {}
	local _nr = nil
	local str_lhoe = "xpgv"
	local tab_hxb = {}
end

local function ___xx()
	local str_aw = "kaq"
	local tab_peywj = {}
	local str_sbekf = "qwcpi"
	local tab_fymg = {}
end

local function ___ef()
	local tab_ohg = {}
	local bool_mg = false
	local int_dlrt = 18
	local tab_nuq = {}
	local tab_nopee = {}
end

local function ___efdcc()
	local _qijn = nil
	local tab_nmzii = {}
	local bool_wafm = false
	local tab_wuws = {}
	local tab_mjvz = {}
end

local function ___vbq()
	local int_wfk = 38
	local int_xqhj = 97
	local _onz = nil
	local tab_xip = {}
	local str_ntdxm = "mmhn"
end

local function ___crh()
	local str_bwzgh = "zddrk"
	local bool_exl = false
	local int_lbnxd = 81
	local str_sf = "nqzell"
	local tab_qcon = {}
end

local function ___bunqg()
	local tab_zkls = {}
	local _od = nil
end

local function ___szgp()
	local tab_zlok = {}
	local bool_bofb = false
	local int_qj = 8
	local bool_cl = false
end

local function ___nnj()
	local str_ryq = "bllux"
	local tab_vohf = {}
	local int_ixca = 3
	local tab_klcxg = {}
end

local function ___esccl()
	local tab_bk = {}
	local str_liabs = "jed"
	local tab_mf = {}
	local tab_xkgq = {}
end

local function ___hujrs()
	local int_pxd = 16
	local int_izjcz = 46
end

local function ___ldgza()
	local _valh = nil
	local bool_ijste = false
	local int_hudn = 82
	local int_svdd = 9
end

local function ___afdmr()
	local _galu = nil
	local tab_qjvgq = {}
end

local function ___lcbi()
	local bool_uylg = false
	local tab_blz = {}
end

local function ___muan()
	local _hwhk = nil
	local int_fdc = 2
end

local function ___ho()
	local str_kdv = "iys"
	local bool_duqup = false
	local bool_hbs = false
end

local function ___eer()
	local str_wdn = "xkqzm"
	local tab_odz = {}
	local _gef = nil
	local bool_wbyti = false
end

local function ___pgv()
	local tab_uuhup = {}
	local bool_vy = false
	local _bpxaz = nil
	local tab_azj = {}
	local str_pag = "zlfd"
end
local BLControllerBase  = require("UI/CreatorUI/BLControllerBase")
local AnimeController   = require("UI/CreatorUI/AnimeController")
local Clip              = require("UI/CreatorUI/Clip")

local Controller = class("Controller", BLControllerBase)

function Controller:ctor()
    self.__clipList = {}
    self.__currentClipName = {}
    self.__running = false
end

function Controller:getClipData(name)
    local clipData = require(name)
    if clipData then
        return clipData
    end
    return nil
end

function Controller:createAnimeWithClip(clipFileName, targetNode)
    local clipLuaData = self:getClipData(clipFileName)
    if clipLuaData == nil then
        return nil
    end
    
    local ac = AnimeController:create()

    local clip = Clip:create()
    clip:setLuaData(clipLuaData)

    ac:setClip(clip)
    ac:setTargetNode(targetNode)
    return ac, clipLuaData._name
end

function Controller:initUI()
    local ui = self.ui
    self.__root = self:getRoot();
    local config = self.__config
    self.__currentClipName = config.clipList[1]

    for _, clipName in ipairs(config.clipList) do
        local ac, name = self:createAnimeWithClip(clipName, self.__root)
        if ac then
            self.__clipList[name] = ac;

            if config.defaultClip == clipName then
                self.__currentClipName = name
            end

        end

    end

    if config.playOnLoad then
        self:play(self.__currentClipName)
    end
end

function Controller:update(dt)
    local clip = self.__clipList[self.__currentClipName]
    if nil == clip then
        return
    end

    if false == self.__running then
        return
    end

    clip:update(dt)

    if not clip:isRunning() then
        -- self:stopAll()
        self:stopUpdate()
    end

end

function Controller:stop()
    self.__running = false

    local clip = self.__clipList[self.__currentClipName]
    if nil == clip then
        return
    end

    self:stopUpdate()
    clip:stop()
end

function Controller:stopAll()
    self.__running = false

    for _, clip in pairs(self.__clipList) do
        clip:stop()
    end

    self:stopUpdate()
end

function Controller:startUpdate()
    -- local root = self:getRoot()
    self.__root:startUpdate()
end

function Controller:stopUpdate()
    -- local root = self:getRoot()
    self.__root:stopUpdate()
end

function Controller:playCurrent()
    return self:play(self.__currentClipName)
end

function Controller:play(clipName)

    local clip = self.__clipList[clipName]
    if clip == nil then
        -- print("clip : ", clipName, "not found")
        return
    end
    self.__currentClipName = clipName;
    -- 停止 所有 
    self:stopAll()
    self:startUpdate()
    self.__running = true
    -- 开启 对应的 内容
    return clip:playDefault(true)
end

function Controller:playFromToByName(fn, tn, dir)
    local clip = self.__clipList[self.__currentClipName]

    self:stopAll()
    self:startUpdate()
    self.__running = true
    -- 开启 对应的 内容
    return clip:playFromNameToName(fn, tn, dir)
end

function Controller:playFromToByNameAutoDirection(fn, tn)
    local clip = self.__clipList[self.__currentClipName]

    self:stopAll()
    self:startUpdate()
    self.__running = true
    -- 开启 对应的 内容
    return clip:playFromNameToNameAutoDirection(fn, tn)
end

-- 从某个时间开始播放到某个时间
function Controller:playByTimeToTime(st, et, dir)
    local clip = self.__clipList[self.__currentClipName]
    self:stopAll()
    self:startUpdate()
    self.__running = true
    -- 开启 对应的 内容
    return clip:playByTimeToTime(st, et, dir, 0)
end

-- 从某个时间开始播放
function Controller:playFromTime( st )
    local clip = self.__clipList[self.__currentClipName]
    self:stopAll()
    self:startUpdate()
    self.__running = true
    -- 开启 对应的 内容
    return clip:playFromTime(st)
end

function Controller:getClipByName(name)
    return self.__clipList[name]
end

function Controller:getCurrentClip()
    return self.__clipList[self.__currentClipName]
end

return Controller

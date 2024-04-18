local ___tab_djki = {}
local ___tab_lvsz = {}
local ____ugf = nil
local ___str_djxy = "ilvup"
local ___bool_he = false
local ____lnpj = nil
local ___tab_sqz = {}
local ___tab_zfn = {}
local ____vezh = nil
local ___bool_iv = false
local ___tab_axr = {}
local ___int_jszq = 79
local ___str_ltj = "lfphag"
local ___tab_mzo = {}

local function ___ac()
	local _kemp = nil
	local _vbc = nil
	local bool_khe = false
	local _qi = nil
end

local function ___srbb()
	local _vkuss = nil
	local tab_al = {}
	local _mh = nil
	local int_gxxjg = 11
	local bool_uzt = false
end

local function ___qxrn()
	local bool_zzar = false
	local bool_exigf = false
	local _ndp = nil
end

local function ___kab()
	local str_bhm = "iti"
	local bool_wgosd = false
	local int_ebkve = 81
end

local function ___yvsll()
	local tab_imv = {}
	local bool_kll = false
	local _eoi = nil
end

local function ___skovb()
	local str_qjzak = "lacfao"
	local str_vwl = "zhehpj"
end

local function ___tx()
	local tab_ikfc = {}
	local tab_pvt = {}
end

local function ___xjfi()
	local tab_gcz = {}
	local int_pk = 12
	local tab_lg = {}
	local int_pu = 69
	local bool_yn = false
end

local function ___vou()
	local str_ftee = "eojfz"
	local _mxcxe = nil
	local int_pavs = 9
	local bool_mnctz = false
end

local function ___uki()
	local bool_qvw = false
	local int_zx = 43
	local int_gpjyn = 30
	local int_rlxx = 85
	local str_jk = "esvam"
end

local function ___bfb()
	local bool_dgyn = false
	local str_nthwv = "hjbd"
end

local function ___xq()
	local bool_qoa = false
	local _owpm = nil
	local int_ewt = 27
end

local function ___sjwor()
	local bool_kr = false
	local _ynzx = nil
end

local function ___etf()
	local str_ltetu = "xofa"
	local bool_xj = false
	local str_mfw = "melb"
end

local function ___nnedf()
	local str_sdns = "dcpaav"
	local _cgl = nil
end

local function ___xl()
	local tab_rqafu = {}
	local int_bmz = 69
	local tab_moka = {}
end

local function ___co()
	local str_pqryr = "khjwt"
	local bool_xual = false
	local int_rfkts = 27
	local _ptusx = nil
	local str_lhcx = "lcjlsz"
end

local function ___ox()
	local tab_asy = {}
	local int_fbj = 86
	local str_gjkji = "hocyfj"
	local tab_nr = {}
	local bool_dbmum = false
end

local function ___vijr()
	local str_guce = "dov"
	local bool_xkmy = false
end

local function ___bqr()
	local str_whya = "ushvd"
	local str_nle = "ypuk"
end

local function ___ymy()
	local tab_ig = {}
	local bool_hdmcw = false
end

local function ___nskmv()
	local bool_kgaoe = false
	local bool_qvpa = false
	local int_bhbjy = 6
end
--- @program src
--- @description: theme2010 collect ctl
--- @author: rwb
---@create: : 2021/02/22 19:00:00


local parentClass = require "Themes/TournCash/Common/ThemeTournCashDelegate"
local cls = class("TCCollectControl", parentClass)
local view = require "Themes/TournCash/Common/Collect/TCCollectView"
function cls:ctor(mainCtl, tcCommonCtl)
    parentClass.ctor(self, tcCommonCtl)
    self.themeCtl = mainCtl
    self.tcCommonCtl = tcCommonCtl
end
function cls:initLayout(parentNode, flyNode)

    self.collectView = view.new(self, parentNode, flyNode)
    self.collectView:initCollectRoot()
end
function cls:getCollectNodeWorldPos()
    return self.collectView:getCollectNodeWorldPos()
end
function cls:getCommonConfig()
    return self.tcCommonCtl:getCommonConfig()
end
function cls:getCollectConfig()
    return self:getCommonConfig().collect_config
end
function cls:getCollectMaxPoint()
    return self:getCollectConfig().max_point
end
function cls:getCollectMaxLevel()
    return self:getCollectConfig().max_level
end
function cls:updateCollectCount(newCount, beforeCount, isAnimate)
    self.collectView:updateCollectCount(newCount, beforeCount, isAnimate)
end
function cls:setMapInfo(mapinfo)
    self.mapInfo = mapinfo
    self:setMapPoints(self.mapInfo.map_points)
end
function cls:getMapPoints()
    return self.featurePoints or 0
end
function cls:setMapPoints(map_point)
    self.featurePoints = map_point
end
function cls:addMapPoints(add_count)
    self:setMapPoints(self:getMapPoints() + add_count)
end
function cls:dealFlyCollectItem(_flyClawList, addCount)
    if self.isLockFeature then
        return
    end
    local old_map_point = self:getMapPoints()
    if #_flyClawList <= 0 then
        return
    end
    --local addCount = #_flyClawList * self:getUnitCount()
    self:addMapPoints(addCount)
    --self:setMapPoints(newCount)
    local new_map_point = self:getMapPoints()
    self:playMusicByName("collect_fly")
    self.collectView:flyItemActions(_flyClawList)
    self:laterCallBack(self.collectView:getFlyTime(), function()
        self:updateCollectCount(new_map_point, old_map_point, true)

    end
    )
end
function cls:getFlyItemList(cItemList)
    local _flyClawList = {}
    local collectID = self:getCollectConfig().collect_id
    for col = 1, #cItemList do
        for row = 1, #cItemList[col] do
            local storeCoinCount = cItemList[col][row]
            if storeCoinCount % 100 == collectID then
                local pos = self:getCellPos(col, row)
                table.insert(_flyClawList, { col, row, pos })
            end
        end
    end
    return _flyClawList
end

return cls



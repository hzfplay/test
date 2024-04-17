local ___int_cyi = 88
local ___int_mxx = 12
local ___int_ks = 18
local ___int_jn = 4
local ___str_jc = "guvrcs"
local ___tab_gglza = {}
local ___int_kjlno = 90
local ____xav = nil
local ___tab_arx = {}
local ___bool_auvyf = false
local ___str_cuwda = "msdyf"
local ___str_wuh = "xeks"
local ___str_ton = "gixkbg"
local ___bool_kog = false
local ___tab_wdg = {}
local ___int_bmc = 79
local ___str_lwhhu = "hcimch"

local function ___kzcqq()
	local int_nh = 11
	local _rqhnq = nil
	local tab_zr = {}
end

local function ___upso()
	local int_qtemr = 3
	local tab_ayrve = {}
	local int_wsm = 32
	local int_akf = 16
end

local function ___yy()
	local str_qycih = "oaqg"
	local bool_lv = false
end

local function ___qb()
	local tab_vyv = {}
	local bool_vspmm = false
	local bool_ulj = false
end

local function ___gt()
	local bool_fk = false
	local str_lojic = "smtj"
	local bool_qeg = false
end

local function ___de()
	local int_ntf = 69
	local tab_odce = {}
	local bool_oreo = false
	local str_fqcin = "feeolr"
	local bool_jgdx = false
end

local function ___ncrw()
	local _wzfk = nil
	local bool_sjbjy = false
	local tab_ikle = {}
end

local function ___rgx()
	local tab_hysr = {}
	local int_ea = 90
	local str_nnr = "givv"
	local str_bw = "zvrf"
	local _rg = nil
end

local function ___otdib()
	local tab_norn = {}
	local str_krjtd = "qyw"
	local tab_uq = {}
	local str_aafpi = "msrnrz"
	local str_uii = "qbaier"
end

local function ___mcjo()
	local tab_mqhhf = {}
	local str_sqc = "nkmdi"
	local _yacxz = nil
end

local function ___sjr()
	local _sdi = nil
	local _qfw = nil
end

local function ___vlwta()
	local str_xvzp = "tjnn"
	local bool_sv = false
	local str_gylto = "epjrg"
	local int_uspna = 7
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/02/25 14:34
---
local parentClass = require "Themes/TournCash/Common/ThemeTournCashDelegate"
local BalloonItem = require("Themes/TournCash/Common/Balloon/BalloonItem")
local cls = class("BalloonControl", parentClass)
function cls:ctor(themeCtl, tcCommonCtl)
    parentClass.ctor(self, tcCommonCtl)
    self.themeCtl = themeCtl
    self.tcCommonCtl = tcCommonCtl
    self.isCreateIng = false
    self.createIndex = 1
    self.initBalloonList = {}
    self.flyingBalloonList = {}
end

function cls:initLayout(flyNode)
    self.flyNode = flyNode
end
function cls:addBalloonList(addList)
    for key, item in pairs(addList) do
        local index = tonumber(key)
        local find = false
        for i = 1, #self.initBalloonList do
            if self.initBalloonList[i].index == index then
                find = true
                break
            end
        end
        if not find then
            for j = 1, #self.flyingBalloonList do
                if self.flyingBalloonList[j].index == index then
                    find = true
                    break
                end
            end
        end
        if not find then
            if type(item) == "number" then
                table.insert(self.initBalloonList, { map_points = item, index = index })
            else
                table.insert(self.initBalloonList, { type   = item.type,
                                                     value  = item.value,
                                                     index  = index,
                                                     s_type = item.s_type }

                )
            end
        end
    end
    if not self.isCreateIng then
        self.isCreateIng = true
        self:playCreateBalloon()
    end
end
function cls:playCreateBalloon()
    if self.initBalloonList and #self.initBalloonList > 0 then
        local info = table.remove(self.initBalloonList, 1)
        table.insert(self.flyingBalloonList, info)
        self.createIndex = self.createIndex % 3 + 1
        BalloonItem.new(self, info, self.createIndex, self.flyNode)
        self:laterCallBack(1, function()
            self:playCreateBalloon()
        end)
    else
        self.isCreateIng = false
    end
end
function cls:clickBalloon(balloonInfo, status)
    local sendData = {
        status = status,
        index  = balloonInfo.index
    }
    self.themeCtl:collectCoins(2, sendData)
    self:removeFlyBalloon(balloonInfo)
end
function cls:removeFlyBalloon(balloonInfo)
    for j = 1, #self.flyingBalloonList do
        if self.flyingBalloonList[j] then
            if self.flyingBalloonList[j].index == balloonInfo.index then
                table.remove(self.flyingBalloonList, j)
                break
            end
        end
    end

end
function cls:removeAllBalloon()
    for i = 1, #self.flyingBalloonList do
        local balloonInfo = self.flyingBalloonList[i]
        if balloonInfo then
            self:clickBalloon(balloonInfo, 0)
        end
    end
    for i = 1, #self.initBalloonList do
        local balloonInfo = self.initBalloonList[i]
        if balloonInfo then
            self:clickBalloon(balloonInfo, 0)
        end
    end
    self.initBalloonList = {}
    self.flyingBalloonList = {}
    self.flyNode:removeAllChildren()
end
function cls:getBonusID()
    return self.themeCtl:getSpecialSymbol().bonusSymbol
end
function cls:addMapPoint(map_points)
    local base_score = self.tcCommonCtl:getCollectViewCtl():getMapPoints()
    self.tcCommonCtl:getCollectViewCtl():addMapPoints(map_points)
    local new_point = self.tcCommonCtl:getCollectViewCtl():getMapPoints()
    self.tcCommonCtl:getCollectViewCtl():updateCollectCount(new_point, base_score, true)
end
function cls:getStartPosY()
    local scale = bole.getAdaptScale()
    local extraMoveY = self.themeCtl:adaptMoveDownY()
    local moveY = -FRAME_HEIGHT / 2 / scale + extraMoveY
    return moveY
end
function cls:getEndY()
    local scale = bole.getAdaptScale()
    local extraMoveY = self.themeCtl:adaptMoveDownY()
    local moveY = FRAME_HEIGHT / 2 / scale + extraMoveY
    return moveY
end
function cls:getCollectPos()
    local worldPos = self.tcCommonCtl:getCollectViewCtl():getCollectNodeWorldPos()
    local nodePos = self.flyNode:convertToNodeSpace(worldPos)
    return nodePos
end

function cls:addRankPoints(score, pickPos)
    self.tcCommonCtl:addCoinsToScore(score, 3, pickPos)
end
function cls:getThemeResourceId()
    return self.themeCtl:getThemeResourceId()
end
function cls:addMultiPoints(multi)
    self.tcCommonCtl:playMultiPointsByBalloon(8, multi)
end
function cls:getMultiPos()
    local worldPos = self.tcCommonCtl:getMultiNodeWorldPos()
    local nodePos = self.flyNode:convertToNodeSpace(worldPos)
    return nodePos
end
return cls


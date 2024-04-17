local ___tab_od = {}
local ___tab_pk = {}
local ___bool_knie = false
local ___str_zy = "rcxpe"
local ___str_gwazy = "tylvn"
local ___str_kp = "zqwqk"
local ___bool_jwcq = false
local ___str_kdbov = "hspdh"
local ___tab_cju = {}
local ___tab_udrha = {}
local ___tab_yzjlm = {}
local ___tab_dmf = {}
local ___str_udr = "btm"
local ___bool_xrro = false

local function ___hq()
	local tab_ihs = {}
	local str_jej = "ejp"
	local str_jydc = "wwy"
end

local function ___gbhqc()
	local int_lkfd = 90
	local int_xgnse = 30
	local bool_hzhj = false
	local int_bv = 10
end

local function ___vuxdp()
	local str_ugb = "stzxw"
	local tab_csxji = {}
	local _zl = nil
	local str_qs = "spdymy"
end

local function ___ltvv()
	local int_wxr = 68
	local _oyl = nil
	local bool_wr = false
	local tab_wcbnd = {}
end

local function ___pbze()
	local _crfm = nil
	local str_usr = "pwa"
end

local function ___tjz()
	local int_tgq = 29
	local int_lmwf = 80
	local int_bb = 60
	local int_opzeb = 22
	local str_ryi = "iulnya"
end

local function ___tz()
	local tab_ro = {}
	local _vwquz = nil
	local bool_qat = false
end

local function ___izhi()
	local tab_ljea = {}
	local int_njfup = 71
	local int_igdet = 66
end

local function ___if()
	local str_ok = "gojuw"
	local str_fmshg = "oss"
end

local function ___cuklb()
	local bool_hxbcg = false
	local _uwehp = nil
end

local function ___xznxl()
	local str_xfsi = "yualju"
	local _ccify = nil
end

local function ___fdq()
	local bool_ok = false
	local _lwdos = nil
	local _tbwqd = nil
	local bool_utva = false
	local tab_mbuu = {}
end

local function ___ja()
	local str_op = "juwst"
	local int_bt = 27
	local tab_hru = {}
end

local function ___knj()
	local bool_twxo = false
	local _qbeeb = nil
	local int_wyc = 99
	local int_msx = 16
	local bool_yrfb = false
end

local function ___jqf()
	local int_jhwl = 68
	local tab_ftwy = {}
	local _bvilj = nil
	local str_cerq = "mkkxx"
end

local function ___dqo()
	local _hoqk = nil
	local int_irpwb = 44
	local str_scitk = "uby"
	local tab_ctk = {}
end

local function ___gyej()
	local _gb = nil
	local str_bn = "xvej"
	local _yydy = nil
	local _vqjg = nil
	local int_ewivq = 71
end

local function ___khs()
	local bool_gikh = false
	local _kz = nil
end

local function ___qn()
	local str_rfo = "iteaw"
	local bool_cop = false
end
--- @program src
--- @description: theme230 collect ctl
--- @author: rwb
--- @create: 2020/12/29 20:46


local parentClass = ThemeBaseViewControlDelegate
local cls = class("ThemeGRII_CollectControl", parentClass)
local view = require (bole.getDesktopFilePath("Theme/ThemeGRII_CollectView")) 
function cls:ctor(mainCtl)
    parentClass.ctor(self, mainCtl)
end
function cls:initLayout(parentNode, flyNode)

    self.collectView = view.new(self, parentNode, flyNode)
    self.collectView:initCollectRoot()
end
function cls:getIsLockFeature()
    return self.isLockFeature
end
function cls:getTipBetList()
    return self._mainViewCtl.tipBetList
end

---@desc click map btn
function cls:clickUnLockBtn()
    if not self._mainViewCtl:getCanTouchFeature() then
        return
    end
    if self.isLockFeature then
        local unLockBetList = self:getGameConfig().unlockBetList
        self._mainViewCtl:featureUnlockBtnClickEvent(unLockBetList["Collect"])
    else
        self.collectView:changeStoreTipState()
    end


end
--@collect unlock
function cls:clickMapBtn()
    if not self._mainViewCtl:getCanTouchFeature() then
        return
    end
    if self.isLockFeature then
        self:clickUnLockBtn()
    end
    self:playMusicByName("common_click")
    self._mainViewCtl:showMapScene()
end
--@changeBet
function cls:changeCollectBet(theBet)
    local tipBetList = self:getTipBetList()
    local unLockBetList = self.gameConfig.unlockBetList
    local tipBet = tipBetList[unLockBetList.Collect]
    if self.isLockFeature == nil then
        self.isLockFeature = false
    end
    local isLock = theBet < tipBet
    if self.isLockFeature ~= isLock then
        self.isLockFeature = isLock
        self.collectView:setCollectPartState(isLock, true)
    end

end
function cls:changeStoreTipState(...)
    self.collectView:changeStoreTipState(...)
end
function cls:checkCollectBtnCanTouch(...)
    return self._mainViewCtl:getCanTouchFeature()
end
function cls:setCollectPartState(isLock, isAnimate)
    self.collectView:setCollectPartState(isLock, isAnimate)
end
function cls:getCollectConfig()
    return self:getGameConfig().collect_config
end
function cls:getCollectMaxPoint()
    return self:getCollectConfig().max_point
end
function cls:getCollectMaxLevel()
    return self:getCollectConfig().max_level
end
function cls:updateCollectCount(newCount, beforeCount, isAnimate)
    self.featurePoints = newCount
    self.collectView:updateCollectCount(newCount, beforeCount, isAnimate)
end
function cls:getMapPoint()
    return self.featurePoints or 0
end
function cls:dealFlyCollectItem(specialData)
    if self.isLockFeature then
        return
    end
    local old_map_point = self.featurePoints
    local collectID = self:getCollectConfig().collect_id
    local _flyClawList = self:_getFlyItemList(specialData.item_list, collectID)
    if #_flyClawList <= 0 then
        return
    end
    self.featurePoints = specialData.theme_info.map_info.collect_count
    local max_point = self:getCollectMaxPoint()
    if self.featurePoints > max_point then
        self.featurePoints = max_point
    end
    self:playMusicByName("collect_fly")
    self.collectView:flyItemActions(_flyClawList)
    self.node:runAction(
            cc.Sequence:create(
                    cc.DelayTime:create(18 / 30),
                    cc.CallFunc:create(function()
                        self:updateCollectCount(self.featurePoints, old_map_point, true)
                    end)
            )
    )
end
function cls:_getFlyItemList(cItemList, collectID)
    local _flyClawList = {}
    for col = 1, 5 do
        for row = 1, 4 do
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



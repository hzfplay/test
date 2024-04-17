local ___int_njzt = 97
local ___bool_mb = false
local ___bool_bymsk = false
local ___int_gjot = 71
local ___str_oqxjj = "sstem"
local ____fp = nil
local ___tab_gs = {}
local ___tab_zl = {}
local ___bool_lam = false
local ____rbyrp = nil
local ___bool_gf = false
local ____hy = nil

local function ___ekt()
	local int_omvq = 66
	local int_dznjf = 93
	local _xtv = nil
end

local function ___qlxpy()
	local _gx = nil
	local tab_ocmc = {}
	local tab_ov = {}
end

local function ___rwb()
	local tab_fmrc = {}
	local bool_elxat = false
	local _ahdae = nil
	local tab_cu = {}
	local int_ze = 38
end

local function ___rq()
	local tab_owey = {}
	local _gblvt = nil
	local _xctf = nil
end

local function ___il()
	local bool_ipoxj = false
	local bool_fccxy = false
end

local function ___bqn()
	local int_lxq = 57
	local bool_ed = false
end

local function ___ieryp()
	local str_wr = "jsl"
	local _mst = nil
	local _nyafx = nil
	local _fqfto = nil
end

local function ___ugxl()
	local bool_jdup = false
	local _eo = nil
	local bool_dq = false
	local str_rgac = "fsmqok"
end

local function ___likp()
	local _exay = nil
	local int_bnla = 86
	local bool_kw = false
	local int_wzp = 28
	local int_xnh = 22
end

local function ___xcrga()
	local int_eukw = 41
	local bool_ecesr = false
	local _xtv = nil
	local bool_kcun = false
end

local function ___lxub()
	local bool_yzvp = false
	local bool_xzs = false
	local str_sesy = "wybvu"
end

local function ___cbwr()
	local bool_uivj = false
	local tab_hofoq = {}
end

local function ___tg()
	local tab_ls = {}
	local tab_lsvw = {}
	local tab_egqwo = {}
	local _vh = nil
end

local function ___jp()
	local bool_qjtti = false
	local bool_ivy = false
end

local function ___qey()
	local int_jwo = 62
	local _om = nil
	local bool_tljlj = false
	local _xewk = nil
	local str_ax = "jocf"
end

local function ___vgfv()
	local _uk = nil
	local _njve = nil
	local bool_lel = false
	local _qrnxm = nil
	local bool_mrvj = false
end

local function ___zac()
	local _jeu = nil
	local tab_pfpei = {}
	local tab_vx = {}
end

local function ___li()
	local str_xq = "tfkhp"
	local _yya = nil
end

local function ___legb()
	local _inpo = nil
	local int_sx = 6
	local bool_yyl = false
end

local function ___nqlm()
	local bool_ekb = false
	local str_dy = "ryi"
	local _iqwdb = nil
	local str_euppb = "lnape"
end

local function ___psbjj()
	local int_gpo = 61
	local tab_xal = {}
end

local function ___ofksi()
	local tab_qy = {}
	local bool_njppn = false
	local int_dzvw = 45
end

local function ___xr()
	local bool_rwxqi = false
	local str_bo = "uplq"
	local _xn = nil
	local str_ieiyd = "ugx"
	local bool_nwnal = false
end

local function ___jfmqe()
	local tab_nuteo = {}
	local tab_zwdqd = {}
	local str_pzg = "mlgns"
	local tab_gm = {}
	local tab_aamo = {}
end

local function ___hca()
	local tab_ipxk = {}
	local _spij = nil
	local _vimh = nil
	local tab_pi = {}
	local str_xdc = "xbo"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/01/20 13:20
---
local parentClass = ThemeBaseViewControlDelegate
local slotViewV = require("Themes/base/component/SlotMachineV/ThemeSlotMachineVView")
local slotConfig = require("Themes/base/component/SlotMachineV/ThemeSlotMachineVConfig")

local cls = class("ThemeSlotMachineVControl", parentClass)

function cls:ctor(bonus, _mainViewCtl, data, bonus_key)
    self.themeResourceId = _mainViewCtl:getThemeSmallSlot()
    parentClass.ctor(self, _mainViewCtl)

    self.themeCtl = _mainViewCtl
    self.bonus = bonus
    self.data = data
    self.slotMachineData = self.data.core_data[bonus_key]
    self.avgBet = self.slotMachineData.avg_bet or 10000
    self.machineStatus = self:getSlotMachineStatus()
    self.saveDataKey = bonus_key
    self.tryResume = self.bonus.data[self.saveDataKey] and true or false
    self.gameData = tool.tableClone(self.bonus.data[self.saveDataKey]) or {}
    self.lastItemList = self.data.core_data["item_list"] or self.themeCtl.item_list
end
function cls:getLoadMusicList()
    return slotConfig.audioList
end
function cls:addData(key, value)
    self.gameData[key] = value
    self:saveBonus()
end
function cls:saveBonus()
    self.bonus:addData(self.saveDataKey, self.gameData)
end
function cls:getBaseBet()

    if self.themeCtl.getSmallSlotBaseBet then
        return self.themeCtl:getSmallSlotBaseBet()
    end
    return slotConfig.theme_config.base_bet

end
function cls:dealWithData(tryResume)
    self.themeCtl.rets = self.themeCtl.rets or {}
    self.themeCtl.cacheSpinRet = self.themeCtl.cacheSpinRet or self.themeCtl.rets -- 快停按钮显示相关
    self.themeCtl.rets["theme_respin"] = tool.tableClone(self.slotMachineData["theme_respin"])
    self.slotRespinData = tool.tableClone(self.slotMachineData["theme_respin"])
    self.allSpinCounts = #self.slotRespinData
    self.gameData.machineStatus = self.gameData.machineStatus or self.machineStatus.start
    self.gameData.useSpinCounts = self.gameData.useSpinCounts or 0
    self.resultIndex = self.slotMachineData.result_index or 8
    self.totalWin = self.slotMachineData.base_win or 0
end
function cls:enterBonusGame(tryResume)
    self:setPics()
    self:initLayout()
    self:showSlotMachineScene(tryResume)
end
function cls:initLayout()
    local slotView = slotViewV
    if self.themeResourceId == 2009 then
        --slotView = slotViewH
    end
    self.slotMachineView = slotView.new(self, self.themeCtl:getMapParentNode())
    self.slotMachineView:updatePaytable(self:getPays()) --更新pays
end
-- slot_machine
function cls:getPic(name)
    return string.format("theme_resource/theme%d/%s", self.themeResourceId, name)
end
function cls:getSpineFile(name)
    local spine_file = slotConfig.spine_path[name]
    return string.format("theme_resource/theme%d/%s", self.themeResourceId, spine_file)
end
function cls:playMusicByName(name, singleton, loop)
    local path = slotConfig.audioList[name]
    local audioFile = self:getPic(path)
    AudioControl:playEffect(audioFile, loop, singleton)
end
function cls:stopMusicByName(name, singleton, loop)
    local path = slotConfig.audioList[name]
    local audioFile = self:getPic(path)
    AudioControl:stopEffect(audioFile, loop, singleton)
end
function cls:getPays(...)
    return slotConfig.theme_config.pays
end
function cls:getReelKeys(...)
    return slotConfig.theme_config.reelKey
end
function cls:getSlotMachineStatus(...)

    return slotConfig.machine_status
end
function cls:getLabelInfo(...)
    return slotConfig.dialog_config[3]
end
function cls:changeRootNodeParent(toMain, newParent)
    self.themeCtl:changeRootNodeParent(toMain, newParent)
end
function cls:showSlotMachineScene(tryResume)

    local parent = self.slotMachineView:getReelParent()
    self.themeCtl:changeRootNodeParent(false, parent)
    if self.avgBet then
        self.themeCtl:setPointBet(self.avgBet)
    end
    self:changeSpinLayer()
    if not tryResume then
        self.themeCtl.spinning = false
    end
    self:setBoard()
    self:dealWithData(tryResume)
    self:showSlotMachineStep(self.gameData.machineStatus)
end
function cls:changeSpinLayer()
    self.themeCtl:showSmallSlotUI()
end
function cls:setBoard(item_list)
    local item_list = item_list or {}
    if #item_list == 0 then
        for i = 1, 3 do
            item_list[i] = { math.random(102, 109) }
        end
    end
    if self:getReelKeys() then
        self.themeCtl:resetBoardCellsByCreateList(self:getReelKeys())
    end
    self.themeCtl:resetBoardCellsByItemList(item_list)
end
function cls:handleResult()
    self:laterCallBack(1, function(...)
        self.themeCtl:handleResult()
    end)
end
function cls:showSlotMachineStep(step)
    if step == self.machineStatus.start then
        self:showSlotMachineStart()
    elseif step == self.machineStatus.collect then
        self:recoverLastBoard()
        self:showSlotMachineCollect()
    else
        self:themeReSpin()
    end
end
function cls:themeReSpin(...)
    local item_list = nil
    if self.gameData.useSpinCounts > 0 and self.gameData.useSpinCounts <= self.allSpinCounts then
        self.themeCtl.rets["theme_respin"] = tool.tableClone(self.slotMachineData["theme_respin"])
        local removeCount = self.gameData.useSpinCounts
        for i = 1, removeCount do
            table.remove(self.themeCtl.rets["theme_respin"], 1)
        end
        item_list = self.slotRespinData[self.gameData.useSpinCounts]
        self:recoverLastBoard(item_list)
    end
    if self.gameData.useSpinCounts < self.allSpinCounts then
        self:handleResult()
    else
        self.themeCtl.rets["theme_respin"] = nil
        self:showSlotMachineCollect()
    end
end
function cls:recoverLastBoard(item_list)
    item_list = item_list or self.slotRespinData[#self.slotRespinData]
    self.themeCtl:resetBoardCellsByItemList(item_list)
end
function cls:showSlotMachineStart()
    self.slotMachineView:showSMStartDialog()
end
function cls:showSlotMachineCollect(...)
    self:changeMachineState(self.machineStatus.collect)
    self.slotMachineView:showSMColletDialog()
end
function cls:changeMachineState(state)
    if self.gameData.machineStatus ~= state then
        self.gameData.machineStatus = state
        self:saveBonus()
    end
end
function cls:onRespinStart(...)
    self.gameData.useSpinCounts = self.gameData.useSpinCounts + 1
    self:saveBonus()
    self:stopMusicByName("slot_spin")
    self:playMusicByName("slot_spin", true)
end
function cls:onMapRepsinAllReelStop()
    self:stopMusicByName("slot_spin")
end

function cls:drawWinLineSymbols(...)
    self.slotMachineView:drawWinLineSymbols()
end
function cls:onRespinFinish()
    local animationTime = 4.5
    self.node:runAction(cc.Sequence:create(
            cc.CallFunc:create(function()
                self:drawWinLineSymbols()
            end),
            cc.DelayTime:create(animationTime),
            cc.CallFunc:create(function()
                self:showSlotMachineCollect()
            end)
    ))
end
function cls:setPics(...)
    self.pics = table.copy(self.themeCtl.pics)
end
function cls:setFooterBtnsEnable(enable)
    self.themeCtl:setFooterBtnsEnable(enable)
end
function cls:collectNotice(...)
    self.bonus.themeCtl:collectCoins(1)
    self.bonus.data["end_game"] = true
    self.bonus:saveBonus()
end
-- 
function cls:exitSlotMachineScene(...)
    local trans = self:getGameConfig().transition_config["map"]
    self.themeCtl:playTransition(nil, "map")
    local a1 = cc.DelayTime:create(trans.onCover)
    local a2 = cc.CallFunc:create(function(...)
        self:recoverNormalBoard()
        self:onExit()
        self.slotMachineView = nil
    end)
    local a3 = cc.DelayTime:create(trans.onEnd - trans.onCover)
    local a4 = cc.CallFunc:create(function(...)

        self.bonus:overSlotMachineScene(self.totalWin)
    end)
    local a5 = cc.Sequence:create(a1, a2, a3, a4)
    self.node:runAction(a5)
end
function cls:recoverNormalBoard(...)
    self.bonus:recoverBaseGame(self.saveDataKey)
    self.themeCtl:changeRootNodeParent(true, false)
end
function cls:onExit(...)
    if self.slotMachineView then
        self.slotMachineView:onExit()
    end
    self.slotMachineView = nil
end
return cls


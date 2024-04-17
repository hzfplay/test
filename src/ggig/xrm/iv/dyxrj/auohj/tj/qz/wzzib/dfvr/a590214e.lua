local ____kno = nil
local ___tab_gd = {}
local ___bool_tb = false
local ___bool_wfrl = false
local ___bool_iz = false
local ___str_qorf = "jwjkin"
local ___bool_sr = false
local ___int_dhvm = 45
local ___bool_nud = false
local ____pkd = nil
local ___int_tum = 13
local ___bool_ul = false
local ___tab_fr = {}
local ___int_lce = 24
local ___bool_xju = false
local ___str_fwjl = "nwnk"

local function ___dey()
	local bool_kvak = false
	local bool_cfi = false
	local bool_eehi = false
	local bool_ftam = false
end

local function ___rtabf()
	local int_ulin = 62
	local tab_mgr = {}
	local int_lofg = 96
end

local function ___psou()
	local tab_klgy = {}
	local tab_jtzp = {}
	local bool_fanyc = false
end

local function ___ziqmk()
	local bool_ismbz = false
	local int_zt = 27
	local bool_luj = false
	local _ugiqa = nil
	local str_tqvd = "tdgor"
end

local function ___lauam()
	local _dvgfe = nil
	local bool_ln = false
	local bool_bmzyy = false
end

local function ___yq()
	local bool_lnj = false
	local _eqoqh = nil
	local str_vd = "ilkpgh"
end

local function ___mha()
	local str_bwj = "ocrrh"
	local int_roypj = 51
	local tab_ipo = {}
	local _zti = nil
	local str_pa = "rbogzq"
end

local function ___kwi()
	local str_xcx = "drdw"
	local bool_tffaz = false
	local _yj = nil
	local int_lrnwi = 9
	local bool_ap = false
end

local function ___mhjw()
	local tab_ckn = {}
	local str_blwek = "yzswfo"
	local int_oq = 59
	local bool_jgi = false
end

local function ___tgdkg()
	local _vxr = nil
	local str_ss = "vexmg"
	local str_cltke = "rckmne"
	local str_ss = "dbnjgh"
end

local function ___nlt()
	local _hmp = nil
	local bool_uo = false
	local bool_fpd = false
	local _yrb = nil
end

local function ___xawb()
	local tab_iam = {}
	local tab_fibmn = {}
	local _ws = nil
	local _oe = nil
	local _juy = nil
end

local function ___kg()
	local tab_kobh = {}
	local str_oh = "dpjlv"
	local str_iu = "ojc"
	local _cf = nil
	local int_fp = 85
end

local function ___rvex()
	local str_gcey = "srwrhe"
	local bool_dq = false
end

local function ___hgrl()
	local str_belxu = "xdftn"
	local int_zelq = 43
	local str_iylhh = "rnp"
	local bool_twhl = false
	local tab_gkbou = {}
end

local function ___ppp()
	local tab_qmds = {}
	local bool_ohnms = false
	local str_rcob = "wtp"
end

local function ___ixll()
	local tab_xe = {}
	local bool_rrnnr = false
	local _dvjy = nil
	local int_jmdp = 83
end

local function ___ohe()
	local bool_poq = false
	local str_cm = "syor"
	local bool_ol = false
	local str_ccyt = "khty"
end

local function ___dpw()
	local _ihfia = nil
	local tab_bvvf = {}
	local str_wfor = "xsb"
	local tab_hz = {}
	local int_ov = 9
end

local function ___my()
	local bool_hb = false
	local str_kmgfz = "robr"
	local str_no = "ghxi"
end

local function ___uaf()
	local int_ht = 18
	local str_btwic = "ufnz"
	local _ng = nil
	local str_nb = "ddhzq"
	local _qlhzh = nil
end

local function ___fkw()
	local tab_ll = {}
	local tab_wnwjo = {}
	local tab_mpiy = {}
	local bool_nkqz = false
	local _qmx = nil
end
---@program src
---@description:  theme230
---@author: rwb
---@create: : 2020/12/29 20:46
local jpViewCenter = require (bole.getDesktopFilePath("Theme/ThemeGRII_JpView")) 
 
local cls = class("ThemeGRII_JpControl", ThemeBaseJackpotControl)
function cls:ctor(mainCtl)
    ThemeBaseJackpotControl.ctor(self, mainCtl)
    self.gameConfig = self._mainViewCtl:getGameConfig()
    self.jpConfig = self.gameConfig.jackpot_config
    self.audiList = self.gameConfig.audioList
    self.audioCtl = self._mainViewCtl:getAudioCtl()
    self.jpLockStatus = {}
end

function cls:initLayout(jpRoot, jpTipRoot)
    self.jpView = jpViewCenter.view.new(self, jpRoot, jpTipRoot)
    self:initialJackpotNode() -- jp的显示
end

function cls:jpBtnClickEvent(index)
    index = index or 1
    if self._mainViewCtl:getCanTouchFeature() then
        local unLockBetList = self.gameConfig.unlockBetList
        self._mainViewCtl:featureUnlockBtnClickEvent(unLockBetList["Jackpot" .. index])
    end
end
function cls:addWinJpAni(index)
    self.jpView:addWinJpAni(index)
end
function cls:removeJpAni(index)
    self.jpView:removeJpAni(index)
end
function cls:resetProgressiveList(tail_list)
    local link_config = self._mainViewCtl:getThemeJackpotConfig().link_config
    local jpLabels = self.jpView:getJackpotLabels()
    if tail_list then
        for i = 1, #tail_list do
            if jpLabels[i] then
                local jackpotNum = self:getJackpotNum(link_config[i])
                if tail_list[i] then
                    jackpotNum = jackpotNum + tail_list[i]
                end
                jpLabels[i]:setString(self:formatJackpotMeter(jackpotNum))
                bole.shrinkLabel(jpLabels[i], jpLabels[i].maxWidth, jpLabels[i].baseScale)
            end
        end
    end
end
function cls:getJackpotNum(jpIndex)
    local name =jpIndex
    if type(name) == "number" then
         name = self:getJackpotConfig().name[jpIndex]
    end
    local jackpotController = JackpotControl:getInstance()
    local multi = jackpotController:getJackpotMulti(self._mainViewCtl.themeid, name)
    return self._mainViewCtl:getCurTotalBet() * multi
end

---@desc change
---@param theBet /:current bet
function cls:changeUnlockJpBet(theBet)
    local unlock_count = 0
    local lock_count = 0
    local unlock_status = false
    local lock_status = false
    local _AllJpCount = self.jpConfig.count
    local _tipBetList = self._mainViewCtl.tipBetList
    local UNLOCK_BET_LIST = self.gameConfig.unlockBetList
    local status = self:_getLockStatus(self.beforeBet, theBet)
    for key = 1, _AllJpCount do
        local jackpot = key
        local betKey = "Jackpot" .. jackpot
        local tipBet = _tipBetList[UNLOCK_BET_LIST[betKey]]
        local lockStatus = self.jpLockStatus[key]
        if theBet < tipBet then
            lock_count = lock_count + 1
            if not lockStatus then
                lock_status = true
                self.jpView:setJackpotPartState(key, true)
            end
        else
            if lockStatus then
                unlock_status = true
                self.jpView:setJackpotPartState(key, false)
            end
            unlock_count = unlock_count + 1
        end
        self.jpLockStatus[key] = theBet < tipBet
    end
    if status == 1 or status == 2 then
        self:setJackPotTipState(status, lock_status, lock_count)
    else
        self:setJackPotTipState(status, unlock_status, lock_count)
    end
    self.beforeBet = theBet
end
function cls:_getLockStatus(beforeBet, theBet)
    local status = 0
    if not beforeBet then
        status = 1
    elseif beforeBet > theBet then
        status = 2
    else
        status = 3
    end
    return status
end
function cls:setJackPotTipState(status, status2, count)
    if status == 1 then
        if status2 then
            self.jpView:showjpTipNode(count, 1)
        end
    elseif status == 2 then
        if status2 then
            self.jpView:showjpTipNode(count, 1)
            self:playMusicByName("jp_lock")
        end
    elseif status == 3 then
        if status2 then
            local jpIndex = count
            self.jpView:showjpTipNode(jpIndex + 1, 2)
            self:playMusicByName("jp_unlock")
        end
    end
end
function cls:getGameConfig(...)
    return self.gameConfig
end

--function cls:getPic(name)
--    return self._mainViewCtl:getPic(name)
--end

--function cls:playMusicByName(name, singleton, loop)
--    self._mainViewCtl:playMusicByName(name, singleton, loop)
--end
function cls:playMusicByOnce(file_name)
    self._mainViewCtl:playMusicByOnce(file_name)
end

--function cls:getSpineFile(file_name)
--    return self._mainViewCtl:getSpineFile(file_name)
--end

function cls:getFntFilePath(file_name)
    return self._mainViewCtl:getFntFilePath(file_name)
end
function cls:getCsbPath(file_name)
    return self._mainViewCtl:getCsbPath(file_name)
end
--function cls:getGameConfig()
--    return self._mainViewCtl:getGameConfig()
--end
function cls:getJackpotConfig()
    local gameConfig = self:getGameConfig()
    return gameConfig.jackpot_config
end

function cls:checkJackpotBtnCanTouch(...)
    return self._mainViewCtl:getCanTouchFeature()
end
return cls

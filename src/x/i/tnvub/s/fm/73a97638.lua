local ____ajz = nil
local ____rxqoc = nil
local ___bool_zco = false
local ____wex = nil
local ___str_ms = "xleahy"
local ____cdk = nil
local ___bool_uof = false
local ____yf = nil
local ____fwrw = nil
local ___bool_zoag = false
local ___tab_igz = {}
local ___tab_rg = {}
local ___str_srgx = "gfu"
local ___int_vgb = 30
local ___int_qik = 67
local ___int_tl = 36
local ___tab_dyhot = {}
local ___int_qz = 52
local ___tab_sxxum = {}
local ___tab_zism = {}
local ___str_axdx = "nnvp"
local ____qxj = nil
local ___int_bmti = 48
local ___str_tr = "lyo"
local ___bool_brogi = false
local ___bool_jibw = false
local ____xe = nil

local function ___gejbl()
	local bool_nkqy = false
	local str_vci = "jau"
	local int_bt = 14
	local bool_xzuat = false
	local str_lgy = "shq"
end

local function ___qc()
	local str_iguww = "rjw"
	local _rv = nil
end

local function ___fyu()
	local bool_lmyt = false
	local int_fdyi = 91
end

local function ___mzvm()
	local str_na = "wqwyp"
	local str_ggcr = "ctwibg"
	local int_biwv = 39
end

local function ___ezhb()
	local tab_vy = {}
	local tab_yk = {}
end

local function ___riil()
	local tab_dm = {}
	local _nbail = nil
	local tab_mxpw = {}
	local tab_ttaex = {}
	local _ss = nil
end

local function ___ykaft()
	local str_kfj = "ituynp"
	local _fzbwm = nil
	local _osal = nil
end

local function ___pzj()
	local bool_iqk = false
	local _ikvse = nil
	local str_wg = "rtzga"
	local _vpffb = nil
end

local function ___dp()
	local _gwjaa = nil
	local bool_nf = false
	local int_zth = 38
	local str_cu = "zcu"
end

local function ___gsb()
	local bool_tfr = false
	local str_cydz = "dckf"
	local _xtdfr = nil
end

local function ___jinp()
	local int_if = 44
	local _whv = nil
	local int_xb = 65
	local int_khgus = 17
end

local function ___dx()
	local bool_rtw = false
	local bool_dweqh = false
	local str_zvo = "vvtdkz"
	local str_enyr = "vlq"
end

local function ___ooznr()
	local bool_lcdf = false
	local tab_iwxb = {}
	local str_uwzr = "jgqr"
	local bool_hox = false
end

local function ___taa()
	local bool_gwu = false
	local str_lkuxv = "uec"
	local _lvrdi = nil
end

local function ___ae()
	local _ira = nil
	local int_lgg = 10
	local _mfye = nil
end

local function ___ys()
	local bool_fzoq = false
	local tab_ajpm = {}
	local _xzxj = nil
end

local function ___xfc()
	local tab_ckvy = {}
	local int_ksdsa = 39
	local bool_tc = false
	local bool_lui = false
	local str_mrsq = "hdryx"
end

local function ___zje()
	local tab_qdce = {}
	local tab_rr = {}
	local int_jzvwm = 88
	local tab_fdp = {}
	local str_wgzt = "rvrkp"
end

local function ___iuob()
	local _mo = nil
	local _gk = nil
end

local function ___vmvn()
	local bool_hu = false
	local tab_fh = {}
	local _qxdk = nil
	local _mnwkv = nil
end

local function ___gmshv()
	local bool_uvd = false
	local str_xkzzx = "zzmjuu"
	local str_qz = "zmu"
end

local function ___zmjl()
	local bool_hi = false
	local _kf = nil
end

local function ___lis()
	local _sd = nil
	local _udwi = nil
	local _ybgap = nil
	local str_hhpt = "voln"
	local tab_ljfth = {}
end

local function ___xhh()
	local _ht = nil
	local tab_jewoc = {}
end
---
--- @program src 
--- @description:
--- @author: rwb 
--- @create: 2021/03/15 14:50
---
---
local cls = class("ThemeJackpotItem")
function cls:ctor(jpCtl, node, index, label)
    self.ctl = jpCtl
    self.node = node
    self.index = index
    self.jackpotLabel = label
    local jackpot_config = self.ctl:getJackpotConfig()
    local width = jackpot_config.width[self.index]
    local scale = jackpot_config.scale[self.index]
    self.jackpotLabel.baseScale = scale
    self.jackpotLabel.maxWidth = width
    self.lockNode = node:getChildByName("bg_lock")
    self.unlockNode = node:getChildByName("bg_normal")
    self.bgLoop = self.unlockNode:getChildByName("bg_loop")
    self.btn = self.lockNode:getChildByName("btn")

    self.unlockSpineNode = self.unlockNode:getChildByName("bg_loop")
    self:_creatJpClickEvent()
    self.basePos = bole.getPos(self.node)
    self.node:setLocalZOrder(self.index)
    self.jackpotLabel:setLocalZOrder(self.index + 10)
    self.lockNode:setVisible(false)
    self:_addLoopAni()
end
function cls:_creatJpClickEvent()

    local function onTouchJp(obj, eventType)
        if eventType == ccui.TouchEventType.ended then
            self.ctl:jpBtnClickEvent(self.index)
        end
    end
    self.btn:addTouchEventListener(onTouchJp)
    self.btn:setTouchEnabled(false)
end
function cls:_addLoopAni()
    local data = {}
    data.parent = self.unlockSpineNode
    data.file = self.ctl:getSpineFile("jackpot_loop")
    data.isLoop = true
    local win_ani = self.ctl:getSpineAniList().jp_loop_ani
    data.animateName = string.format(win_ani, self.index)
    local _, s = bole.addAnimationSimple(data)
    self.loopAni = s
end
function cls:addWinJpAni()
    local data = {}
    self.node:setLocalZOrder(100)
    self.jackpotLabel:setLocalZOrder(100 + 10)
    if self.isLock then
        return
    end
    if not self.unlockSpineNode:getChildByName("jp_win") then
        data.parent = self.unlockSpineNode
        data.file = self.ctl:getSpineFile("jackpot_win")
        data.isLoop = true
        local win_ani = self.ctl:getSpineAniList().jp_win_ani
        data.animateName = string.format(win_ani, self.index)
        local _, s = bole.addAnimationSimple(data)
        s:setName("jp_win")
    end
end
function cls:removeJpAni()
    self.node:setLocalZOrder(self.index)
    self.jackpotLabel:setLocalZOrder(self.index + 10)
    local jp_win = self.unlockSpineNode:getChildByName("jp_win")
    if jp_win and bole.isValidNode(jp_win) then
        jp_win:removeFromParent()
    end
end
function cls:getParentNode()
    return self.node
end
function cls:changeJpStyle(isLock)

    if self.isLock and self.isLock == isLock then
        return
    end
    self.lockNode:setVisible(isLock)
    self.unlockNode:setVisible(not isLock)
    local jackpot_config = self.ctl:getJackpotConfig()
    local font
    if isLock then
        font = jackpot_config.fnt.lock
    else
        font = jackpot_config.fnt.unlock
    end
    if font then
        self.jackpotLabel:setFntFile(self.ctl:getFntFilePath(font))
    end
    self.isLock = isLock
end
function cls:setBtnTouchEnable(enable)
    self.btn:setTouchEnabled(enable)
end
function cls:addLockSpine(parent, base_pos, lock_ani)
    local file = self.ctl:getSpineFile("jackpot_lock")
    local _, s = bole.addSpineAnimation(parent, -1, file, base_pos, lock_ani, nil, nil, nil, true, false)
    self.lockSpine = s
end
function cls:playLockSpine(parent)
    local lock_ani = self.ctl:getSpineAniList().lock
    lock_ani = string.format(lock_ani, self.index)
    if not self.lockSpine then
        self:addLockSpine(parent, self.basePos, lock_ani)
    else
        self.lockSpine:setAnimation(0, lock_ani, false)
    end
    self.ctl:playMusicByOnce("jp_lock")
    self:delayForChangeStyle(true)
end

function cls:playUnLockSpine(parent)
    local unlock_ani = self.ctl:getSpineAniList().unlock
    unlock_ani = string.format(unlock_ani, self.index)
    if not self.lockSpine then
        self:addLockSpine(parent, self.basePos, unlock_ani)
    else
        self.lockSpine:setAnimation(0, unlock_ani, false)
    end
    self.ctl:playMusicByOnce("jp_unlock")
    self:delayForChangeStyle(false)
end
function cls:delayForChangeStyle(isLock)
    local delay = 0
    if isLock then
        delay = self.ctl:getSpineDelay("lock")
    else
        delay = self.ctl:getSpineDelay("unlock")
    end
    self.node:stopActionByTag(1001)
    local a1 = cc.DelayTime:create(delay)
    local a2 = cc.CallFunc:create(function()
        self:changeJpStyle(isLock)
    end)
    local a3 = cc.Sequence:create(a1, a2)
    a3:setTag(1001)
    self.node:runAction(a3)
end
return cls
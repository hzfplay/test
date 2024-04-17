local ___bool_svv = false
local ___bool_pvhhx = false
local ___str_pdjr = "cqp"
local ___tab_tsiax = {}
local ___int_dq = 73
local ___bool_djw = false
local ____edf = nil
local ___int_ws = 99
local ___int_tcld = 33
local ____ykk = nil
local ___bool_an = false
local ___bool_bftjd = false
local ___bool_qwji = false
local ___str_bgfyj = "hpuu"
local ___bool_hiaa = false
local ____xxwq = nil
local ___bool_yoye = false
local ___str_gqd = "kvjuw"
local ___int_gldq = 5
local ____axuo = nil
local ___tab_poguo = {}
local ___tab_buizh = {}
local ___str_vycw = "swhuxz"
local ___int_nrcl = 85
local ____jl = nil

local function ___wc()
	local str_jmofs = "kda"
	local _ukd = nil
	local int_zfee = 50
end

local function ___ziywt()
	local tab_aku = {}
	local str_qxcr = "ymx"
	local _ds = nil
end

local function ___grhxr()
	local str_vt = "earwr"
	local str_hfjp = "lqgj"
	local _tm = nil
	local int_uy = 49
	local bool_ukp = false
end

local function ___qkbsf()
	local bool_fbrtp = false
	local _hhfw = nil
	local str_ym = "xxsccv"
	local str_agvu = "jjiai"
	local str_xx = "ioknb"
end

local function ___pj()
	local bool_yhu = false
	local int_whj = 97
	local str_nfqv = "uedw"
	local _gl = nil
	local int_oj = 66
end

local function ___siv()
	local tab_vbiw = {}
	local _pnwvl = nil
	local str_os = "mufwvn"
	local tab_xlig = {}
end

local function ___cz()
	local bool_kdg = false
	local int_rrf = 74
	local int_ome = 40
	local tab_de = {}
	local int_xnlp = 16
end

local function ___ipt()
	local _iwwgn = nil
	local int_apn = 3
	local str_ywohj = "fafm"
	local tab_epvn = {}
	local bool_jo = false
end

local function ___xm()
	local bool_wsuvk = false
	local _rfd = nil
end

local function ___sts()
	local str_gyr = "nuyye"
	local _kqshb = nil
	local bool_squo = false
	local int_dhel = 62
end

local function ___qegrl()
	local _jke = nil
	local str_myk = "fmfoqp"
	local _cq = nil
end

local function ___fy()
	local tab_gu = {}
	local bool_sbp = false
end

local function ___kj()
	local str_kxuh = "cvwxky"
	local tab_vvvb = {}
	local bool_njrx = false
end

local function ___dhar()
	local tab_ux = {}
	local str_aepll = "mpkgi"
	local int_cup = 53
	local tab_qeiy = {}
end

local function ___yp()
	local _ufqkz = nil
	local bool_xo = false
	local bool_ghfmm = false
	local str_mvb = "vsqp"
end

local function ___begyu()
	local _ybbla = nil
	local bool_jkp = false
	local _oyeh = nil
	local int_qyc = 18
	local bool_npkvy = false
end

local function ___tbz()
	local bool_te = false
	local int_lnuu = 52
	local _edwe = nil
	local tab_oeb = {}
end

local function ___dd()
	local bool_rgn = false
	local tab_xty = {}
	local tab_qyi = {}
	local int_lahll = 17
	local int_efiel = 21
end

local function ___cmd()
	local _guz = nil
	local str_labq = "ccej"
end

local function ___qz()
	local int_vjpj = 58
	local int_pjio = 97
	local int_kjmn = 66
	local tab_zjdf = {}
end

local function ___ttfll()
	local int_whs = 14
	local _qzq = nil
end
---@program src
---@description:  theme230
---@author: rwb
---@create: : 2020/12/29 20:46
local jackpotTipItem = require (bole.getDesktopFilePath("Theme/Jackpot/jackpotTipItem")) 
local jackpotItem = require (bole.getDesktopFilePath("Theme/Jackpot/jackpotItem")) 
 
local cls = class("ThemeGRII_JpView")
function cls:ctor(jpCtl, jpRoot, jpTipRoot)
    self.jpCtl = jpCtl
    self.gameConfig = self.jpCtl:getGameConfig()
    self.node = jpRoot
    self.parentTip = jpTipRoot
    self.hasJackpotNode = false
    self:_initLayout()
end
function cls:_initLayout(...)

    self.jackpotSpine = self.node:getChildByName("bg_spine")
    local jackpot_config = self.jpCtl:getGameConfig().jackpot_config
    self.jackpotNodes = {}
    for i = 1, jackpot_config.count do
        self.jackpotNodes[i] = {}

        local node = self.node:getChildByName("node_" .. i)
        self.jackpotNodes[i].node = node
        local label = self.node:getChildByName("label_jp" .. i)
        local jackpotItemNode = jackpotItem.new(self.jpCtl, node, i, label)
        self.jackpotNodes[i].jpNode = jackpotItemNode
        local tipNode = jackpotTipItem.new(self.jpCtl, i, self.parentTip)
        self.jackpotNodes[i].tipNode = tipNode
    end
end
function cls:getJackpotLabel(index)
    return self.jackpotNodes[index].jpNode.jackpotLabel
end
function cls:getJackpotLabels()
    if not self.jackpotLabels then
        self.jackpotLabels = self.jackpotLabels or {}
        for key = 1, #self.jackpotNodes do
            self.jackpotLabels[key] = self:getJackpotLabel(key)
        end
    end
    return self.jackpotLabels

end
function cls:setJackpotPartState(index, isLock)
    local jpNode = self.jackpotNodes[index].jpNode
    local parent = jpNode
    local base_pos = jpNode.basePos

    jpNode:setBtnTouchEnable(isLock)

    if isLock then
        local lock_ani = "animation%s_1"
        lock_ani = string.format(lock_ani, index)
        if not parent.lockSpine then
            local file = self.jpCtl:getSpineFile("jackpot_lock")
            local _, s = bole.addSpineAnimation(self.parentTip, -1, file, base_pos, lock_ani, nil, nil, nil, true, false)
            parent.lockSpine = s
        else
            bole.spChangeAnimation(parent.lockSpine, lock_ani, false)
        end
        self.jpCtl:playMusicByOnce("jp_lock")
        local action = cc.Sequence:create(
                cc.DelayTime:create(30 / 30),
                cc.CallFunc:create(
                        function()
                            if parent.isLocked then
                                bole.spChangeAnimation(parent.lockSpine, "animation1", true)
                            end
                        end
                )
        )
        action:setTag(1001)
        parent.lockSpine:runAction(action)
    else
        local unlock_ani = "animation%s_2"
        unlock_ani = string.format(unlock_ani, index)
        if not parent.lockSpine then
            local file = self.jpCtl:getSpineFile("jackpot_lock")
            local _, s = bole.addSpineAnimation(self.parentTip, -1, file, base_pos, unlock_ani, nil, nil, nil, true, false)
            parent.lockSpine = s
        else
            bole.spChangeAnimation(parent.lockSpine, unlock_ani, false)
        end
        self.jpCtl:playMusicByOnce("jp_unlock")

    end
    if parent.lockSpine then
        parent.lockSpine:stopActionByTag(1001)
    end
    self:changeJpStyle(index, isLock)
end
function cls:changeJpStyle(index, isLock)

    local jpNode = self.jackpotNodes[index].jpNode

    local delay = 0
    if isLock then
        delay = 5 / 30
    else
        delay = 17 / 30
    end
    local action = cc.Sequence:create(
            cc.DelayTime:create(delay),
            cc.CallFunc:create(
                    function()
                        self.jackpotNodes[index].jpNode:changeJpStyle(isLock)
                    end)
    )
    action:setTag(1001)
    jpNode.lockSpine:runAction(action)
end

function cls:showjpTipNode(index, status)
    local showNode = self.jackpotNodes[index].tipNode
    if self.showjpTipCacheNode then
        self.showjpTipCacheNode:hideTipNode()
    end
    showNode:showjpTipNode(status)
    self.showjpTipCacheNode = showNode
end
function cls:addWinJpAni(jpIndex)
    self.jackpotNodes[jpIndex].jpNode:addWinJpAni()
end
function cls:removeJpAni(jpIndex)
    self.jackpotNodes[jpIndex].jpNode:removeJpAni()
end

local viewCenter = {}
viewCenter.view = cls

return viewCenter

local ____sco = nil
local ____vkvj = nil
local ___tab_leyq = {}
local ___str_lmwiy = "icyuy"
local ___tab_lxrbe = {}
local ___int_pltgj = 19
local ___tab_cuwjo = {}
local ____lugq = nil
local ___tab_ow = {}
local ____qzil = nil
local ___int_va = 2
local ___int_bo = 39
local ____boee = nil
local ___tab_rls = {}
local ___bool_iwww = false
local ___tab_en = {}
local ____iuui = nil
local ___int_hnhwn = 63
local ___tab_cse = {}
local ___str_wko = "gqyhev"

local function ___lxine()
	local int_wx = 97
	local str_ygwul = "tex"
	local bool_dfd = false
end

local function ___uvpch()
	local _fvdym = nil
	local bool_zygah = false
	local _bf = nil
	local tab_prj = {}
end

local function ___cokxu()
	local _oa = nil
	local str_vp = "xmbg"
	local str_np = "dafkwq"
	local int_cw = 24
end

local function ___oiudb()
	local bool_tg = false
	local str_ksb = "mnm"
end

local function ___cgk()
	local _ea = nil
	local bool_fhst = false
end

local function ___watyl()
	local str_kfr = "vuxg"
	local bool_bndse = false
	local tab_kxaxd = {}
end

local function ___vhcms()
	local bool_amyl = false
	local _hsua = nil
	local str_frle = "xpo"
	local _pud = nil
	local int_hu = 87
end

local function ___pzjc()
	local bool_zpmj = false
	local tab_cp = {}
	local bool_uo = false
	local _fnlzk = nil
end

local function ___rqcae()
	local _in = nil
	local int_qa = 41
	local int_vkr = 32
end

local function ___ys()
	local int_ts = 61
	local int_gb = 46
	local _dnlxm = nil
end

local function ___okjku()
	local _ocifl = nil
	local int_ro = 0
	local str_febrh = "psxo"
end

local function ___exynt()
	local _yvrkb = nil
	local tab_ybnwj = {}
	local bool_yk = false
	local int_wg = 38
	local tab_ipw = {}
end

local function ___ymcf()
	local tab_lsu = {}
	local tab_dlwex = {}
	local tab_eu = {}
	local bool_ro = false
end

local function ___rljlx()
	local bool_lsjsa = false
	local str_ytrd = "nzqtix"
end

local function ___yyrxj()
	local _kj = nil
	local bool_nlhey = false
	local str_zbjmm = "gfnu"
	local bool_dzv = false
end

local function ___pn()
	local tab_dgthx = {}
	local tab_pnvpc = {}
	local tab_rcwke = {}
	local str_ctrbv = "ovat"
	local tab_bkrr = {}
end

local function ___wgnab()
	local str_gp = "thij"
	local bool_oo = false
end

local function ___zar()
	local tab_qaf = {}
	local int_cq = 56
end

local function ___dgn()
	local bool_wmyg = false
	local str_ga = "wgi"
	local tab_jbbu = {}
end

local function ___mej()
	local int_at = 95
	local bool_ydl = false
	local tab_ehyw = {}
end

local function ___gbj()
	local str_mnx = "wglmzk"
	local int_sw = 85
	local str_lnmh = "nztqfi"
end

local function ___he()
	local bool_vv = false
	local tab_txh = {}
	local str_fghgy = "uwsrtd"
	local bool_ae = false
end

local function ___af()
	local str_foge = "cujz"
	local tab_fljp = {}
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/01/25 21:52
---
local cls = class("ThemeEaster_JackpotItem")
function cls:ctor(jpCtl, node, index, label)
    self.jpCtl = jpCtl
    self.node = node
    self.index = index
    self.jackpotLabel = label
    local jackpot_config = self.jpCtl:getJackpotConfig()
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
            self.jpCtl:jpBtnClickEvent(self.index)
        end
    end
    self.btn:addTouchEventListener(onTouchJp)
    self.btn:setTouchEnabled(false)
end
function cls:_addLoopAni()
    local data = {}
    data.parent = self.unlockSpineNode
    data.file = self.jpCtl:getSpineFile("jackpot_loop")
    data.isLoop = true
    local win_ani = self.jpCtl:getJackpotConfig().jp_loop_ani
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
    data.parent = self.unlockSpineNode
    data.file = self.jpCtl:getSpineFile("jackpot_win")
    data.isLoop = true
    local win_ani = self.jpCtl:getJackpotConfig().jp_win_ani
    data.animateName = string.format(win_ani, self.index)
    local _, s = bole.addAnimationSimple(data)
    s:setName("jp_win")
end
function cls:removeJpAni()
    self.node:setLocalZOrder(self.index)
    self.jackpotLabel:setLocalZOrder(self.index + 10)
    local jp_win = self.unlockSpineNode:getChildByName("jp_win")
    if jp_win and bole.isValidNode(jp_win) then
        jp_win:removeFromParent()
    end
end
function cls:changeJpStyle(isLock)

    if self.isLock and self.isLock == isLock then
        return
    end
    self.lockNode:setVisible(isLock)
    self.unlockNode:setVisible(not isLock)
    local jackpot_config = self.jpCtl:getJackpotConfig()
    local font
    if isLock then
        font = jackpot_config.lock_fnt
    else
        font = jackpot_config.unlock_fnt
    end
    self.jackpotLabel:setFntFile(self.jpCtl:getFntFilePath(font))
    self.isLock = isLock
end
function cls:setBtnTouchEnable(enable)
    self.btn:setTouchEnabled(enable)
end
return cls
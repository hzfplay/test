local ___tab_dno = {}
local ___int_mqbp = 49
local ___int_ij = 61
local ___str_zlalh = "xhps"
local ___tab_ywa = {}
local ___bool_rx = false
local ___tab_fb = {}
local ___int_jmm = 40
local ___str_wrkbg = "dhqdpo"
local ___bool_kyg = false
local ___bool_urbw = false
local ___str_xqh = "uti"
local ___bool_iv = false
local ___str_drfhc = "fwb"
local ___bool_rqh = false
local ___str_xzu = "panhuf"
local ___int_avu = 16
local ___tab_pzk = {}

local function ___rjv()
	local str_vcvdc = "pyak"
	local bool_oih = false
	local int_bvzp = 9
end

local function ___ubb()
	local int_ysrs = 2
	local _awgsy = nil
end

local function ___drpni()
	local tab_svu = {}
	local int_lhirw = 88
	local bool_dciat = false
	local _vjoir = nil
end

local function ___swb()
	local _lwk = nil
	local int_gvwk = 21
	local tab_zzbcy = {}
	local _xwbgp = nil
	local int_az = 9
end

local function ___gmwwn()
	local bool_fry = false
	local str_cdjwr = "ofli"
	local bool_nw = false
	local bool_pord = false
	local tab_olhnx = {}
end

local function ___bp()
	local tab_mfc = {}
	local bool_flk = false
	local str_djmu = "pcz"
	local tab_krikh = {}
	local tab_eewq = {}
end

local function ___dhqca()
	local bool_hn = false
	local tab_df = {}
	local str_bsqf = "irlhtv"
	local bool_mtbq = false
end

local function ___kp()
	local _rvilx = nil
	local bool_rbj = false
	local tab_cvcrj = {}
	local bool_fn = false
end

local function ___it()
	local tab_tlzak = {}
	local bool_nqjz = false
end

local function ___trejy()
	local str_yb = "jdqqlf"
	local tab_ccfd = {}
end

local function ___auw()
	local _ak = nil
	local _nttrt = nil
	local str_ntcl = "ouh"
	local _tul = nil
	local bool_fixzp = false
end

local function ___cwwr()
	local int_wckn = 32
	local bool_oj = false
	local bool_ux = false
	local tab_bgjhn = {}
	local str_ef = "acrj"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/03/15 14:50
---
local cls = class("JackpotItemTip", function()
    return cc.Node:create()
end)
function cls:ctor(jpCtl, index, parent)
    self.parent = parent
    self.ctl = jpCtl
    self.index = index
    self.csb = self.ctl:getCsbPath("jp_tip")
    self.node = cc.CSLoader:createNode(self.csb)
    self:addChild(self.node)
    self:loadControls()

end
function cls:loadControls()

    local jackpot_config = self.ctl:getJackpotConfig()
    local lock_img = jackpot_config.tip.lock_jp_img
    local unlock_img = jackpot_config.tip.unlock_jp_img
    local str_lock = string.format(lock_img, self.index)
    local str_unlock = string.format(unlock_img, self.index)
    local base_pos = jackpot_config.jp_tip_pos[self.index]
    self.rootNode = self.node:getChildByName("root")
    self.unlockNode = self.rootNode:getChildByName("unlock")
    self.unlockNode:setVisible(false)

    self.lockNode = self.rootNode:getChildByName("lock")
    self.lockNode:setVisible(false)

    local jackpot1 = self.unlockNode:getChildByName("img")
    bole.updateSpriteWithFile(jackpot1, str_unlock)

    local jackpot2 = self.lockNode:getChildByName("img")
    bole.updateSpriteWithFile(jackpot2, str_lock)

    self.parent:addChild(self)
    self:setPosition(base_pos)
end
function cls:showJpTipNode(status)
    local showNode = self.lockNode
    if status == 2 then
        showNode = self.unlockNode
        self.lockNode:stopAllActions()
        self.lockNode:setVisible(false)
    else
        self.unlockNode:stopAllActions()
        self.unlockNode:setVisible(false)
    end
    showNode:setVisible(true)
    showNode:setScale(0)
    showNode:runAction(
            cc.Sequence:create(
                    cc.ScaleTo:create(0.1, 1.1),
                    cc.ScaleTo:create(0.1, 1),
                    cc.DelayTime:create(1),
                    cc.ScaleTo:create(0.1, 1, 1.1),
                    cc.ScaleTo:create(0.1, 0),
                    cc.Hide:create()
            )
    )
end
function cls:hideTipNode()
    if self.lockNode:isVisible() then
        self.lockNode:stopAllActions()
        self.lockNode:runAction(
                cc.Sequence:create(
                        cc.ScaleTo:create(0.1, 0),
                        cc.Hide:create()
                )
        )
    end
    if self.unlockNode:isVisible() then
        self.unlockNode:stopAllActions()
        self.unlockNode:runAction(
                cc.Sequence:create(
                        cc.ScaleTo:create(0.1, 0),
                        cc.Hide:create()
                )
        )
    end
end
return cls
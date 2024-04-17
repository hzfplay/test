local ___tab_hb = {}
local ___str_tmuct = "eodyhs"
local ___str_au = "jmfe"
local ___bool_jg = false
local ___bool_kgwd = false
local ___bool_uvz = false
local ___int_ppybs = 10
local ___str_vyqv = "fzyf"
local ___tab_lfwlv = {}
local ___tab_jbrhk = {}
local ___int_plqa = 60
local ____zcpf = nil
local ___bool_ts = false
local ___str_pvsj = "ahnsvk"
local ___str_hrq = "cgmiep"

local function ___jzaf()
	local tab_llm = {}
	local _izov = nil
end

local function ___zd()
	local str_gl = "jmht"
	local tab_ozep = {}
	local int_mrowp = 5
	local bool_agky = false
	local bool_pbdah = false
end

local function ___gjrq()
	local bool_fuak = false
	local bool_lkrn = false
	local tab_xmm = {}
	local str_bt = "nvgzmz"
	local str_fm = "slv"
end

local function ___iju()
	local bool_vjfqj = false
	local bool_vxdwo = false
	local str_cuklf = "fievih"
end

local function ___cgi()
	local _jihr = nil
	local str_mthv = "laefws"
	local int_xk = 33
	local bool_nolig = false
end

local function ___kqqcl()
	local int_deugn = 47
	local tab_ysy = {}
end

local function ___vyr()
	local _ff = nil
	local bool_bwlln = false
	local str_obtz = "itjpbx"
end

local function ___har()
	local tab_se = {}
	local bool_dcgmj = false
	local bool_wlrbr = false
	local _ce = nil
	local int_mrvfe = 42
end

local function ___hfuwz()
	local str_pgfd = "zoeml"
	local int_yikz = 12
end

local function ___clu()
	local str_ushq = "ofqezn"
	local int_tooy = 25
	local int_wjft = 57
end

local function ___amrdj()
	local bool_yis = false
	local int_rkzir = 58
end

local function ___wjyz()
	local int_xa = 74
	local int_zqttu = 50
	local int_jri = 72
	local str_wavr = "cya"
	local bool_our = false
end

local function ___vj()
	local bool_hrfmd = false
	local str_cor = "yeemco"
	local _zxb = nil
end

local function ___odq()
	local str_ulbb = "jkp"
	local tab_nji = {}
	local _cty = nil
	local tab_pxlse = {}
	local bool_jqo = false
end

local function ___ebjv()
	local tab_fgwxs = {}
	local tab_snhm = {}
	local str_zp = "kmjhni"
end

local function ___wl()
	local bool_ac = false
	local bool_ok = false
	local _fozi = nil
end

local function ___ra()
	local str_yz = "zpo"
	local str_nyutz = "dpfoxq"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/01/25 21:49
---  
local cls = class("ThemeGRII_JackpotTipItem", function()
    return cc.Node:create()
end)
function cls:ctor(jpCtl, index, parent)
    self.parent = parent
    self.jpCtl = jpCtl
    self.index = index
    self.csb = self.jpCtl:getCsbPath("jp_tip")
    self.node = cc.CSLoader:createNode(self.csb)
    self:addChild(self.node)
    self:loadControls()

end
function cls:loadControls()

    local jackpot_config = self.jpCtl:getJackpotConfig()
    local light_img = jackpot_config.light_jp_img
    local str = string.format(light_img, self.index)
    local base_pos = jackpot_config.jp_tip_pos[self.index]
    self.rootNode = self.node:getChildByName("root")
    self.unlockNode = self.rootNode:getChildByName("unlock")
    self.unlockNode:setVisible(false)

    self.lockNode = self.rootNode:getChildByName("lock")
    self.lockNode:setVisible(false)

    local jackpot1 = self.unlockNode:getChildByName("img")
    bole.updateSpriteWithFile(jackpot1, str)

    local jackpot2 = self.lockNode:getChildByName("img")
    bole.updateSpriteWithFile(jackpot2, str)

    self.parent:addChild(self)
    self:setPosition(base_pos)
end
function cls:showjpTipNode(status)
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
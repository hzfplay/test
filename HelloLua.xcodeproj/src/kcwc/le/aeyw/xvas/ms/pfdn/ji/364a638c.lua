local ____qv = nil
local ___bool_xobfj = false
local ___int_hduvd = 21
local ___bool_oahbi = false
local ___bool_pwx = false
local ___bool_yt = false
local ___tab_nou = {}
local ___int_hfeek = 66
local ___bool_mwnlx = false
local ___bool_hrfak = false
local ____ceyq = nil
local ___tab_pym = {}

local function ___vl()
	local tab_wiiho = {}
	local int_abif = 56
end

local function ___mgp()
	local tab_onc = {}
	local _aknw = nil
	local bool_so = false
	local tab_jpmb = {}
	local bool_auck = false
end

local function ___rli()
	local _al = nil
	local int_dyj = 45
end

local function ___dh()
	local str_gc = "gvhsy"
	local int_qef = 78
	local _wo = nil
end

local function ___vzpk()
	local tab_rtyru = {}
	local _ap = nil
	local bool_sz = false
end

local function ___fea()
	local bool_wsimp = false
	local str_ixmi = "ifkl"
end

local function ___bi()
	local str_hm = "kqff"
	local tab_zfhhj = {}
	local bool_pi = false
	local str_pup = "hvnn"
end

local function ___ie()
	local bool_ghfi = false
	local tab_esue = {}
	local tab_danyu = {}
end

local function ___ldpj()
	local tab_nxpm = {}
	local str_uuj = "oixos"
end

local function ___pde()
	local str_zum = "hkuvuu"
	local _yqhp = nil
	local bool_xmxsy = false
end

local function ___umv()
	local bool_pfnee = false
	local tab_cmfp = {}
end

local function ___zpp()
	local _nvc = nil
	local bool_bxb = false
	local str_fn = "rolqb"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
--- @create: 2021/02/24 11:10
---

local cls = class("TCRankHeadItem")

function cls:ctor(ctl, node, isSelf)

    self.ctl = ctl
    self.node = node
    self.isSelf = isSelf
    self.teamID = 0
    self:init()
end
function cls:init()
    self.frame = self.node:getChildByName("frame")
    self.headNode = self.node:getChildByName("head")
    self.headBg = self.node:getChildByName("bg")
    self.flagNode = self.node:getChildByName("flag_node")
    self.flagBg = self.flagNode:getChildByName("bg")
    self.spineNode = self.node:getChildByName("spine_node")
end
function cls:setFrameStyle(color)
    local head_frame = self.ctl:getRankConfig().head_frame
    local show_frame = head_frame[color]
    bole.updateSpriteWithFile(self.frame, show_frame)
end
function cls:getFrameColor(rankInfo)
    local teamType = self.ctl:getTeamTypeByInfo(rankInfo)
    local color = "blue"
    if teamType and teamType > 0 then
        if teamType == self.ctl:getTeamType().BLUE then
            color = "blue"
        else
            color = "red"
        end
    elseif rankInfo.rank == 0 then
        color = "purple"
    else
        color = "blue"
    end
    return color

end
function cls:setHeadStyle(rankInfo)
    local isSelf = self.ctl:checkIsSelf(rankInfo)
    local teamType = self.ctl:getTeamTypeByInfo(rankInfo)
    self.isSelf = isSelf
    self.teamID = teamType
    local color = self:getFrameColor(rankInfo)
    if self.showColor and self.showColor == color then
        return
    end
    self.showColor = color
    self:setFrameStyle(color)
    if self.flagCell and bole.isValidNode(self.flagCell) then
        self.flagCell:updateNodeColor(color)
    end
end
function cls:updateHeadFrame(rankInfo)
    self:setHeadStyle(rankInfo)
end
function cls:updateIcon(rankInfo, isSelf)
    local data = {}
    data.facebook_id = rankInfo.facebook_id == "bolegames" and "" or rankInfo.facebook_id
    data.user_icon_id = rankInfo.icon_id
    data.head_size = 180
    data.head_id = rankInfo.head_id
    data.stencil_sp = self.headBg
    libUI.updateCommonHead(self.headNode, data)
    if rankInfo.geo_code then
        local class = TournCashController:getInstance():getDialogClass("TournCashNationalFlagNode")
        self.flagCell = class.new()
        self.flagNode:addChild(self.flagCell)
        self.flagCell:updateNode(self:getFrameColor(rankInfo), rankInfo.geo_code)
    else
        self.flagNode:setVisible(false)
    end
end
function cls:addLoopAni()
    local data = {}
    data.file = self.ctl:getSpineFile("rank_frame")
    data.parent = self.spineNode
    data.isLoop = true
    data.animateName = "animation1"
    local _, s = bole.addAnimationSimple(data)
    --s:setScale(0.55)
end
return cls
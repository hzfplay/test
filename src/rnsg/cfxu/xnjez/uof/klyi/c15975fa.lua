local ___tab_pqzza = {}
local ___str_zhoi = "mqjny"
local ____dl = nil
local ___str_vlxvv = "yxad"
local ___int_rtz = 55
local ____rdnym = nil
local ___int_hd = 77
local ___tab_cywj = {}
local ___tab_yxlso = {}
local ___int_tsop = 3
local ___bool_exup = false
local ____pszjq = nil
local ___tab_bd = {}
local ____asjv = nil
local ___tab_mymb = {}
local ___bool_tu = false
local ____on = nil
local ___bool_xxms = false
local ___int_nhoe = 94
local ___tab_hi = {}
local ___str_fucfa = "sdnl"
local ___int_tvsgp = 60
local ___str_aml = "rpbd"
local ____ri = nil

local function ___jby()
	local int_mwexe = 28
	local str_klbyj = "fkezp"
	local int_fkt = 74
end

local function ___ywwgg()
	local _lau = nil
	local _jov = nil
end

local function ___jpvq()
	local tab_pkl = {}
	local _ws = nil
	local int_pgpgp = 27
	local int_qhpze = 26
	local bool_pkqwv = false
end

local function ___zh()
	local int_mwv = 17
	local bool_izfsz = false
	local bool_krgav = false
end

local function ___vma()
	local int_ifysc = 87
	local str_tn = "riq"
	local _yc = nil
	local tab_apclp = {}
	local bool_ohozn = false
end

local function ___qe()
	local _lh = nil
	local bool_lpgfp = false
end

local function ___jp()
	local str_lj = "bhugp"
	local _ovca = nil
	local int_awpvf = 90
	local bool_qbkio = false
	local _pagbe = nil
end

local function ___bn()
	local bool_pfg = false
	local int_osgj = 49
	local str_bxm = "vaovfi"
	local tab_hl = {}
	local tab_nss = {}
end

local function ___lywst()
	local _migci = nil
	local int_mq = 90
end

local function ___mbtl()
	local int_tv = 19
	local tab_mzzf = {}
end

local function ___hegrs()
	local bool_kvfi = false
	local _jxdc = nil
	local int_tlo = 60
	local tab_ehq = {}
	local str_zvwn = "qagnv"
end

local function ___kujv()
	local _ea = nil
	local str_rs = "doz"
	local int_tma = 19
end

local function ___ac()
	local int_gcnj = 79
	local int_rzt = 28
	local bool_qxln = false
	local tab_pher = {}
end

local function ___rupwk()
	local _czgts = nil
	local str_vber = "dekbz"
	local _lngxl = nil
end

local function ___bohkq()
	local str_ftn = "mgz"
	local _nczye = nil
	local str_pwv = "prpg"
	local str_ira = "iemgqy"
	local str_cgv = "kii"
end

local function ___gwsm()
	local int_ezpne = 64
	local tab_rpcs = {}
	local bool_wlvny = false
	local int_qrnp = 76
end

local function ___lb()
	local bool_om = false
	local int_crewc = 6
	local tab_burzo = {}
	local bool_aec = false
end

local function ___cn()
	local bool_ywn = false
	local _zly = nil
	local int_ilcju = 81
end

local function ___tjau()
	local int_rljvc = 35
	local bool_lkfh = false
	local tab_vog = {}
	local bool_aq = false
end
--[[

Copyright (c) 2014-2017 Chukong Technologies Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

]]

local Node = cc.Node

function Node:add(child, zorder, tag)
    if tag then
        self:addChild(child, zorder, tag)
    elseif zorder then
        self:addChild(child, zorder)
    else
        self:addChild(child)
    end
    return self
end

function Node:addTo(parent, zorder, tag)
    if tag then
        parent:addChild(self, zorder, tag)
    elseif zorder then
        parent:addChild(self, zorder)
    else
        parent:addChild(self)
    end
    return self
end

function Node:removeSelf()
    self:removeFromParent()
    return self
end

function Node:align(anchorPoint, x, y)
    self:setAnchorPoint(anchorPoint)
    return self:move(x, y)
end

function Node:show()
    self:setVisible(true)
    return self
end

function Node:hide()
    self:setVisible(false)
    return self
end

function Node:move(x, y)
    if y then
        self:setPosition(x, y)
    else
        self:setPosition(x)
    end
    return self
end

function Node:moveTo(args)
    transition.moveTo(self, args)
    return self
end

function Node:moveBy(args)
    transition.moveBy(self, args)
    return self
end

function Node:fadeIn(args)
    transition.fadeIn(self, args)
    return self
end

function Node:fadeOut(args)
    transition.fadeOut(self, args)
    return self
end

function Node:fadeTo(args)
    transition.fadeTo(self, args)
    return self
end

function Node:rotate(rotation)
    self:setRotation(rotation)
    return self
end

function Node:rotateTo(args)
    transition.rotateTo(self, args)
    return self
end

function Node:rotateBy(args)
    transition.rotateBy(self, args)
    return self
end

function Node:scaleTo(args)
    transition.scaleTo(self, args)
    return self
end

function Node:onUpdate(callback)
    self:scheduleUpdateWithPriorityLua(callback, 0)
    return self
end

Node.scheduleUpdate = Node.onUpdate

function Node:onNodeEvent(eventName, callback)
    if "enter" == eventName then
        self.onEnterCallback_ = callback
    elseif "exit" == eventName then
        self.onExitCallback_ = callback
    elseif "enterTransitionFinish" == eventName then
        self.onEnterTransitionFinishCallback_ = callback
    elseif "exitTransitionStart" == eventName then
        self.onExitTransitionStartCallback_ = callback
    elseif "cleanup" == eventName then
        self.onCleanupCallback_ = callback
    end
    self:enableNodeEvents()
end

function Node:enableNodeEvents()
    if self.isNodeEventEnabled_ then
        return self
    end

    self:registerScriptHandler(function(state)
        if state == "enter" then
            self:onEnter_()
        elseif state == "exit" then
            self:onExit_()
        elseif state == "enterTransitionFinish" then
            self:onEnterTransitionFinish_()
        elseif state == "exitTransitionStart" then
            self:onExitTransitionStart_()
        elseif state == "cleanup" then
            self:onCleanup_()
        end
    end)
    self.isNodeEventEnabled_ = true

    return self
end

function Node:disableNodeEvents()
    self:unregisterScriptHandler()
    self.isNodeEventEnabled_ = false
    return self
end


function Node:onEnter()
end

function Node:onExit()
end

function Node:onEnterTransitionFinish()
end

function Node:onExitTransitionStart()
end

function Node:onCleanup()
end

function Node:onEnter_()
    self:onEnter()
    if not self.onEnterCallback_ then
        return
    end
    self:onEnterCallback_()
end

function Node:onExit_()
    self:onExit()
    if not self.onExitCallback_ then
        return
    end
    self:onExitCallback_()
end

function Node:onEnterTransitionFinish_()
    self:onEnterTransitionFinish()
    if not self.onEnterTransitionFinishCallback_ then
        return
    end
    self:onEnterTransitionFinishCallback_()
end

function Node:onExitTransitionStart_()
    self:onExitTransitionStart()
    if not self.onExitTransitionStartCallback_ then
        return
    end
    self:onExitTransitionStartCallback_()
end

function Node:onCleanup_()
    self:onCleanup()
    if not self.onCleanupCallback_ then
        return
    end
    self:onCleanupCallback_()
end

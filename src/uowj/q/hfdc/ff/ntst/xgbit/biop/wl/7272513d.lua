local ___int_vnqju = 32
local ___tab_hg = {}
local ___bool_davo = false
local ___bool_abbo = false
local ___bool_ih = false
local ___bool_ugwm = false
local ___int_hpzaz = 50
local ___tab_ihj = {}
local ___int_bko = 12
local ___int_phlhd = 48
local ____ijeyd = nil
local ___int_yepro = 90

local function ___tclda()
	local tab_xwlmm = {}
	local int_yrc = 9
	local bool_dagsh = false
	local str_jpj = "hytk"
end

local function ___rhwjc()
	local int_weruy = 51
	local tab_kdlhf = {}
end

local function ___jjcic()
	local bool_hnzo = false
	local str_ww = "rsy"
	local _ymqpd = nil
	local int_qbqe = 1
end

local function ___tn()
	local _eduy = nil
	local tab_ab = {}
	local int_ieu = 22
	local bool_bzk = false
	local str_hbbrl = "lice"
end

local function ___ic()
	local tab_ytho = {}
	local bool_dr = false
end

local function ___npnh()
	local bool_rsjf = false
	local _ro = nil
end

local function ___gaa()
	local bool_pot = false
	local _zi = nil
	local tab_wlr = {}
	local tab_ino = {}
end

local function ___gw()
	local int_lvbf = 77
	local int_wjq = 85
	local str_bxmmo = "sakrz"
	local bool_ixju = false
end

local function ___sf()
	local bool_lugrq = false
	local str_ym = "kaj"
	local str_wuyoc = "cacu"
	local int_ir = 36
	local tab_iks = {}
end

local function ___pnoh()
	local bool_gqi = false
	local tab_mwrvq = {}
end

local function ___ajv()
	local _rqmg = nil
	local str_npt = "rsq"
	local str_zeyex = "jecl"
	local str_ay = "wqpib"
	local _ts = nil
end

local function ___at()
	local tab_ian = {}
	local bool_tug = false
end

local function ___hwi()
	local int_dem = 68
	local tab_xj = {}
	local _whswg = nil
	local _uwn = nil
end

local function ___oukzp()
	local _scdva = nil
	local _tcf = nil
	local int_gomz = 91
	local int_fkt = 74
end

local function ___gcgq()
	local tab_cxa = {}
	local _px = nil
end

local function ___qznaa()
	local str_ig = "roellj"
	local int_ttkyz = 83
end

local function ___gq()
	local tab_loah = {}
	local str_gnh = "kyjg"
	local str_ab = "tphmif"
	local str_pvckv = "bavt"
end

local function ___nal()
	local tab_my = {}
	local int_pcxe = 53
	local bool_nmlx = false
end

local function ___hm()
	local str_zewbg = "vgwj"
	local _oth = nil
end

local function ___pdl()
	local str_xdh = "oiqsv"
	local tab_gsty = {}
end

local function ___idg()
	local tab_cl = {}
	local bool_ojpu = false
	local str_wh = "dmcjt"
	local _jyod = nil
	local str_fru = "iih"
end

local function ___yzjkh()
	local tab_kyc = {}
	local int_bhe = 68
	local bool_njvbo = false
end

local function ___bnjxj()
	local str_xetb = "dtnay"
	local str_ezqp = "yncwua"
end

local function ___diks()
	local str_jwzv = "rcrr"
	local _qa = nil
	local int_ok = 52
end

local function ___npcx()
	local _evocc = nil
	local tab_cpfv = {}
	local int_gznr = 85
	local tab_xwvep = {}
end

local function ___jeqt()
	local str_gmfo = "uys"
	local str_eoisx = "omnr"
	local int_vxfer = 15
	local bool_tifmm = false
	local str_by = "qmx"
end

local function ___kts()
	local str_ln = "nlwp"
	local bool_hk = false
	local str_fkhm = "nspn"
	local int_mcwb = 73
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

local transition = {}

local ACTION_EASING = {}
ACTION_EASING["BACKIN"]           = {cc.EaseBackIn, 1}
ACTION_EASING["BACKINOUT"]        = {cc.EaseBackInOut, 1}
ACTION_EASING["BACKOUT"]          = {cc.EaseBackOut, 1}
ACTION_EASING["BOUNCE"]           = {cc.EaseBounce, 1}
ACTION_EASING["BOUNCEIN"]         = {cc.EaseBounceIn, 1}
ACTION_EASING["BOUNCEINOUT"]      = {cc.EaseBounceInOut, 1}
ACTION_EASING["BOUNCEOUT"]        = {cc.EaseBounceOut, 1}
ACTION_EASING["ELASTIC"]          = {cc.EaseElastic, 2, 0.3}
ACTION_EASING["ELASTICIN"]        = {cc.EaseElasticIn, 2, 0.3}
ACTION_EASING["ELASTICINOUT"]     = {cc.EaseElasticInOut, 2, 0.3}
ACTION_EASING["ELASTICOUT"]       = {cc.EaseElasticOut, 2, 0.3}
ACTION_EASING["EXPONENTIALIN"]    = {cc.EaseExponentialIn, 1}
ACTION_EASING["EXPONENTIALINOUT"] = {cc.EaseExponentialInOut, 1}
ACTION_EASING["EXPONENTIALOUT"]   = {cc.EaseExponentialOut, 1}
ACTION_EASING["IN"]               = {cc.EaseIn, 2, 1}
ACTION_EASING["INOUT"]            = {cc.EaseInOut, 2, 1}
ACTION_EASING["OUT"]              = {cc.EaseOut, 2, 1}
ACTION_EASING["RATEACTION"]       = {cc.EaseRateAction, 2, 1}
ACTION_EASING["SINEIN"]           = {cc.EaseSineIn, 1}
ACTION_EASING["SINEINOUT"]        = {cc.EaseSineInOut, 1}
ACTION_EASING["SINEOUT"]          = {cc.EaseSineOut, 1}

local actionManager = cc.Director:getInstance():getActionManager()

function transition.newEasing(action, easingName, more)
    local key = string.upper(tostring(easingName))
    local easing
    if ACTION_EASING[key] then
        local cls, count, default = unpack(ACTION_EASING[key])
        if count == 2 then
            easing = cls:create(action, more or default)
        else
            easing = cls:create(action)
        end
    end
    return easing or action
end

function transition.create(action, args)
    args = checktable(args)
    if args.easing then
        if type(args.easing) == "table" then
            action = transition.newEasing(action, unpack(args.easing))
        else
            action = transition.newEasing(action, args.easing)
        end
    end

    local actions = {}
    local delay = checknumber(args.delay)
    if delay > 0 then
        actions[#actions + 1] = cc.DelayTime:create(delay)
    end
    actions[#actions + 1] = action

    local onComplete = args.onComplete
    if type(onComplete) ~= "function" then onComplete = nil end
    if onComplete then
        actions[#actions + 1] = cc.CallFunc:create(onComplete)
    end

    if args.removeSelf then
        actions[#actions + 1] = cc.RemoveSelf:create()
    end

    if #actions > 1 then
        return transition.sequence(actions)
    else
        return actions[1]
    end
end

function transition.execute(target, action, args)
    assert(not tolua.isnull(target), "transition.execute() - target is not cc.Node")
    local action = transition.create(action, args)
    target:runAction(action)
    return action
end

function transition.moveTo(target, args)
    assert(not tolua.isnull(target), "transition.moveTo() - target is not cc.Node")
    local x = args.x or target:getPositionX()
    local y = args.y or target:getPositionY()
    local action = cc.MoveTo:create(args.time, cc.p(x, y))
    return transition.execute(target, action, args)
end

function transition.moveBy(target, args)
    assert(not tolua.isnull(target), "transition.moveBy() - target is not cc.Node")
    local x = args.x or 0
    local y = args.y or 0
    local action = cc.MoveBy:create(args.time, cc.p(x, y))
    return transition.execute(target, action, args)
end

function transition.fadeIn(target, args)
    assert(not tolua.isnull(target), "transition.fadeIn() - target is not cc.Node")
    local action = cc.FadeIn:create(args.time)
    return transition.execute(target, action, args)
end

function transition.fadeOut(target, args)
    assert(not tolua.isnull(target), "transition.fadeOut() - target is not cc.Node")
    local action = cc.FadeOut:create(args.time)
    return transition.execute(target, action, args)
end

function transition.fadeTo(target, args)
    assert(not tolua.isnull(target), "transition.fadeTo() - target is not cc.Node")
    local opacity = checkint(args.opacity)
    if opacity < 0 then
        opacity = 0
    elseif opacity > 255 then
        opacity = 255
    end
    local action = cc.FadeTo:create(args.time, opacity)
    return transition.execute(target, action, args)
end

function transition.scaleTo(target, args)
    assert(not tolua.isnull(target), "transition.scaleTo() - target is not cc.Node")
    local action
    if args.scale then
        action = cc.ScaleTo:create(checknumber(args.time), checknumber(args.scale))
    elseif args.scaleX or args.scaleY then
        local scaleX, scaleY
        if args.scaleX then
            scaleX = checknumber(args.scaleX)
        else
            scaleX = target:getScaleX()
        end
        if args.scaleY then
            scaleY = checknumber(args.scaleY)
        else
            scaleY = target:getScaleY()
        end
        action = cc.ScaleTo:create(checknumber(args.time), scaleX, scaleY)
    end
    return transition.execute(target, action, args)
end

function transition.rotateTo(target, args)
    assert(not tolua.isnull(target), "transition.rotateTo() - target is not cc.Node")
    local rotation = args.rotation or target:getRotation()
    local action = cc.RotateTo:create(args.time, rotation)
    return transition.execute(target, action, args)
end

function transition.rotateBy(target, args)
    assert(not tolua.isnull(target), "transition.rotateTo() - target is not cc.Node")
    local rotation = args.rotation or 0
    local action = cc.RotateBy:create(args.time, rotation)
    return transition.execute(target, action, args)
end

function transition.sequence(actions)
    if #actions < 1 then return end
    if #actions < 2 then return actions[1] end
    return cc.Sequence:create(actions)
end

function transition.removeAction(action)
    if not tolua.isnull(action) then
        actionManager:removeAction(action)
    end
end

function transition.stopTarget(target)
    if not tolua.isnull(target) then
        actionManager:removeAllActionsFromTarget(target)
    end
end

function transition.pauseTarget(target)
    if not tolua.isnull(target) then
        actionManager:pauseTarget(target)
    end
end

function transition.resumeTarget(target)
    if not tolua.isnull(target) then
        actionManager:resumeTarget(target)
    end
end

return transition

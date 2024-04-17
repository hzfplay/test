local ___tab_lpi = {}
local ___int_qwbin = 22
local ___str_tyk = "qis"
local ___int_adol = 52
local ___str_ktct = "hqkzu"
local ___bool_egh = false
local ___tab_qsxdj = {}
local ___tab_ukpmh = {}
local ___int_vjvj = 75
local ___int_ik = 47
local ___str_od = "nxcms"
local ___bool_tpgpk = false
local ___str_muzsy = "ggn"
local ____gj = nil
local ___int_uvi = 47
local ____ok = nil
local ____blwv = nil
local ___int_ship = 71
local ___int_nad = 76
local ___bool_zuls = false
local ___str_jebn = "scl"
local ___int_sve = 29
local ____wtr = nil
local ___str_pk = "ofkyc"
local ____trekn = nil
local ____vfx = nil
local ____mmgim = nil
local ___str_jng = "jzsjdn"

local function ___vtf()
	local tab_kk = {}
	local int_zsu = 43
	local str_ttrxj = "xfv"
end

local function ___ukn()
	local bool_ygu = false
	local str_ukbxl = "dkri"
	local _fzbdf = nil
	local int_ytv = 3
	local _dzky = nil
end

local function ___oxkt()
	local tab_njpr = {}
	local bool_mpsdk = false
end

local function ___hkl()
	local bool_dcymq = false
	local bool_is = false
end

local function ___sij()
	local bool_mw = false
	local int_ynzfi = 37
	local _rpgzy = nil
	local str_wa = "hcgzv"
	local _cr = nil
end

local function ___szvbj()
	local _yg = nil
	local _zmor = nil
	local _bdqw = nil
	local _yvjx = nil
	local tab_hdpav = {}
end

local function ___kokmg()
	local _xg = nil
	local str_lxu = "xgan"
	local int_wg = 2
	local int_gc = 15
end

local function ___uwvp()
	local tab_fxeu = {}
	local bool_ffjnu = false
end

local function ___po()
	local _bczp = nil
	local tab_jbeh = {}
	local int_mtjpd = 46
	local int_gkcq = 60
	local tab_lkedn = {}
end

local function ___sbbw()
	local bool_ptuqt = false
	local tab_ltz = {}
	local int_blux = 35
	local bool_bakk = false
	local tab_mb = {}
end

local function ___ltut()
	local int_lxhod = 34
	local int_zlfh = 2
	local _jzhno = nil
	local _fiod = nil
end

local function ___yjv()
	local str_ohybx = "eie"
	local int_lwxb = 55
	local tab_zvfg = {}
end

local function ___qt()
	local int_utcnq = 24
	local bool_xchyi = false
	local int_um = 69
	local _vpl = nil
end

local function ___enym()
	local _pgi = nil
	local int_bnvxj = 98
	local str_ykkb = "iopt"
	local str_hbpyx = "czfmio"
	local int_pzlnm = 77
end

local function ___gbyrx()
	local tab_fise = {}
	local _rlmai = nil
	local str_mjmrs = "iaogv"
	local int_wiymp = 44
	local _dry = nil
end

local function ___tj()
	local bool_vt = false
	local str_wir = "urr"
end

local function ___ds()
	local bool_entz = false
	local tab_xqx = {}
end

local function ___ttgh()
	local _whe = nil
	local bool_vykti = false
end

local function ___lz()
	local int_cog = 90
	local str_jvq = "gptj"
	local _mss = nil
end

local function ___jmzb()
	local int_xy = 9
	local int_clxx = 69
	local int_qwyou = 38
end

local function ___kepd()
	local int_uv = 76
	local _ebo = nil
end

local function ___yh()
	local _pnei = nil
	local _mryr = nil
	local int_hpzv = 54
	local _qfts = nil
end

local Event = class("Event")

local EXPORTED_METHODS = {
    "addEventListener",
    "dispatchEvent",
    "removeEventListener",
    "removeEventListenersByTag",
    "removeEventListenersByEvent",
    "removeAllEventListeners",
    "hasEventListener",
    "dumpAllEventListeners",
}

function Event:init_()
    self.target_ = nil
    self.listeners_ = {}
    self.nextListenerHandleIndex_ = 0
end

function Event:bind(target)
    self:init_()
    cc.setmethods(target, self, EXPORTED_METHODS)
    self.target_ = target
end

function Event:unbind(target)
    cc.unsetmethods(target, EXPORTED_METHODS)
    self:init_()
end

function Event:on(eventName, listener, tag)
    assert(type(eventName) == "string" and eventName ~= "",
        "Event:addEventListener() - invalid eventName")
    eventName = string.upper(eventName)
    if self.listeners_[eventName] == nil then
        self.listeners_[eventName] = {}
    end

    self.nextListenerHandleIndex_ = self.nextListenerHandleIndex_ + 1
    local handle = tostring(self.nextListenerHandleIndex_)
    tag = tag or ""
    self.listeners_[eventName][handle] = {listener, tag}

    if DEBUG > 1 then
        printInfo("%s [Event] addEventListener() - event: %s, handle: %s, tag: \"%s\"",
                  tostring(self.target_), eventName, handle, tostring(tag))
    end

    return self.target_, handle
end

Event.addEventListener = Event.on

function Event:dispatchEvent(event)
    event.name = string.upper(tostring(event.name))
    local eventName = event.name
    if DEBUG > 1 then
        printInfo("%s [Event] dispatchEvent() - event %s", tostring(self.target_), eventName)
    end

    if self.listeners_[eventName] == nil then return end
    event.target = self.target_
    event.stop_ = false
    event.stop = function(self)
        self.stop_ = true
    end

    for handle, listener in pairs(self.listeners_[eventName]) do
        if DEBUG > 1 then
            printInfo("%s [Event] dispatchEvent() - dispatching event %s to listener %s", tostring(self.target_), eventName, handle)
        end
        -- listener[1] = listener
        -- listener[2] = tag
        event.tag = listener[2]
        listener[1](event)
        if event.stop_ then
            if DEBUG > 1 then
                printInfo("%s [Event] dispatchEvent() - break dispatching for event %s", tostring(self.target_), eventName)
            end
            break
        end
    end

    return self.target_
end

function Event:removeEventListener(handleToRemove)
    for eventName, listenersForEvent in pairs(self.listeners_) do
        for handle, _ in pairs(listenersForEvent) do
            if handle == handleToRemove then
                listenersForEvent[handle] = nil
                if DEBUG > 1 then
                    printInfo("%s [Event] removeEventListener() - remove listener [%s] for event %s", tostring(self.target_), handle, eventName)
                end
                return self.target_
            end
        end
    end

    return self.target_
end

function Event:removeEventListenersByTag(tagToRemove)
    for eventName, listenersForEvent in pairs(self.listeners_) do
        for handle, listener in pairs(listenersForEvent) do
            -- listener[1] = listener
            -- listener[2] = tag
            if listener[2] == tagToRemove then
                listenersForEvent[handle] = nil
                if DEBUG > 1 then
                    printInfo("%s [Event] removeEventListener() - remove listener [%s] for event %s", tostring(self.target_), handle, eventName)
                end
            end
        end
    end

    return self.target_
end

function Event:removeEventListenersByEvent(eventName)
    self.listeners_[string.upper(eventName)] = nil
    if DEBUG > 1 then
        printInfo("%s [Event] removeAllEventListenersForEvent() - remove all listeners for event %s", tostring(self.target_), eventName)
    end
    return self.target_
end

function Event:removeAllEventListeners()
    self.listeners_ = {}
    if DEBUG > 1 then
        printInfo("%s [Event] removeAllEventListeners() - remove all listeners", tostring(self.target_))
    end
    return self.target_
end

function Event:hasEventListener(eventName)
    eventName = string.upper(tostring(eventName))
    local t = self.listeners_[eventName]
    for _, __ in pairs(t) do
        return true
    end
    return false
end

function Event:dumpAllEventListeners()
    print("---- Event:dumpAllEventListeners() ----")
    for name, listeners in pairs(self.listeners_) do
        printf("-- event: %s", name)
        for handle, listener in pairs(listeners) do
            printf("--     listener: %s, handle: %s", tostring(listener[1]), tostring(handle))
        end
    end
    return self.target_
end

return Event

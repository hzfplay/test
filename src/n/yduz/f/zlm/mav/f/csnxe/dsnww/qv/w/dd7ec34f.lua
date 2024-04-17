local ____wcj = nil
local ___str_ffext = "fxsn"
local ___str_ujqy = "lgva"
local ___bool_nsxd = false
local ___int_rxqwi = 98
local ___int_fadt = 38
local ___str_vf = "wofz"
local ___int_gj = 38
local ___bool_hz = false
local ___int_rmvzx = 24
local ____otuxx = nil
local ___tab_jgzi = {}
local ___bool_rbr = false
local ___tab_rvx = {}
local ___str_pz = "fwucc"
local ___bool_cx = false
local ___str_tee = "hwnij"
local ___bool_ko = false
local ____bdc = nil
local ___int_be = 61
local ___str_uqbus = "lykmv"

local function ___ir()
	local int_uqz = 33
	local tab_nhji = {}
end

local function ___jcz()
	local int_xzwkd = 100
	local tab_qklsd = {}
end

local function ___qvcm()
	local str_sy = "autngb"
	local _nzef = nil
end

local function ___md()
	local int_xvfu = 25
	local str_nqrq = "lmo"
	local bool_vey = false
	local str_it = "vdwph"
end

local function ___jhgzr()
	local tab_ek = {}
	local int_jymjd = 34
	local _um = nil
	local str_mcco = "ukhw"
	local bool_zk = false
end

local function ___ipsn()
	local int_ic = 23
	local int_pcdf = 66
	local tab_thol = {}
	local bool_hir = false
	local tab_pgl = {}
end

local function ___bsefi()
	local _ekv = nil
	local tab_zieu = {}
	local str_mnmyz = "pdwib"
end

local function ___onuc()
	local bool_chmul = false
	local tab_pou = {}
	local int_abdxx = 1
end

local function ___ulrg()
	local tab_sll = {}
	local int_dyxtb = 24
	local int_frw = 77
	local tab_uy = {}
end

local function ___radqj()
	local tab_vf = {}
	local str_lcykf = "zcy"
	local tab_rxdms = {}
	local _dvzki = nil
end

local function ___gc()
	local _pe = nil
	local tab_zq = {}
	local _mo = nil
	local bool_kgjv = false
	local int_rcawr = 23
end

local function ___xhoel()
	local str_tuk = "yacbjs"
	local str_nxenr = "qos"
end

local function ___deqai()
	local bool_asb = false
	local tab_tv = {}
end

local function ___dcq()
	local str_nbo = "tpxtsb"
	local bool_phe = false
	local int_qh = 7
	local _wu = nil
end

local function ___fh()
	local bool_yr = false
	local _hpp = nil
end

local function ___mre()
	local _dxt = nil
	local tab_my = {}
end

local function ___jaa()
	local _sngiy = nil
	local int_fh = 72
	local tab_pd = {}
	local int_uhze = 82
end

local function ___fzly()
	local tab_etr = {}
	local bool_wjisp = false
	local int_ll = 23
	local tab_otz = {}
end

local function ___ibr()
	local _xv = nil
	local tab_koc = {}
end

local function ___hd()
	local bool_lobc = false
	local _sgply = nil
	local _cii = nil
end

local function ___syst()
	local bool_asl = false
	local bool_fxhzp = false
	local tab_cr = {}
	local bool_tmh = false
end

local function ___deq()
	local tab_idksv = {}
	local int_ab = 1
	local tab_xi = {}
	local str_tz = "ugikn"
	local int_jemfm = 37
end

local function ___sl()
	local tab_esn = {}
	local bool_xrcs = false
	local int_xnhw = 72
	local _rnwa = nil
end

local function ___ekanj()
	local tab_szg = {}
	local int_cgb = 69
	local int_fbdb = 10
	local bool_lmkc = false
end

local function ___jsu()
	local bool_hot = false
	local bool_xvu = false
	local int_gzbr = 98
	local str_qhjr = "cgt"
end

local function ___sxcw()
	local tab_yij = {}
	local bool_qz = false
	local _npq = nil
	local _ta = nil
end

local function ___rc()
	local _mg = nil
	local int_hjn = 31
end

local function ___oosou()
	local str_teom = "agmqn"
	local int_xv = 89
	local bool_nwk = false
	local bool_wv = false
	local _szwok = nil
end

local function ___cqrmv()
	local _uh = nil
	local bool_ahfs = false
	local tab_lpa = {}
end
libSpine = {}

-- 创建spine
libSpine.createSpine = function ( file )
    if cc.FileUtils:getInstance():isFileExist(file..".json")
    and cc.FileUtils:getInstance():isFileExist(file..".atlas") then
		return sp.SkeletonAnimation:createWithJsonFile(file..".json", file..".atlas", 1)
    end
end

-- 获取slot挂载节点
libSpine.getNodeForSlot = function ( spine, slotName )
    if not libUI.isValidNode(spine) then return end

    if spine.getNodeForSlot then
        return spine:getNodeForSlot(slotName)
    end
end

-- event.loopCount表示循环次数
-- 完成事件
libSpine.listenCompleteEvent = function ( spine, animationName, callback )
    if not libUI.isValidNode(spine) then return end

    spine:registerSpineEventHandler(function (event)
        if event
        and event.animation == animationName then
            if callback then
                callback(event)
            end
        end
    end, sp.EventType.ANIMATION_COMPLETE)
end
-- 用户事件
libSpine.listenUserEvent = function ( spine, animationName, eventName, callback )
    if not libUI.isValidNode(spine) then return end

    libSpine._registUserEvent(spine)
    spine._userEventCb[animationName] = spine._userEventCb[animationName] or {}
    spine._userEventCb[animationName][eventName] = callback
end
libSpine._registUserEvent = function ( spine )
    if not libUI.isValidNode(spine) then return end
    
    if not spine._userEventCb then
        spine._userEventCb = {}
        spine:registerSpineEventHandler(function (event)
            if event then
                local animationName =  event.animation
                local eventName = (event.eventData or {}).name
                if animationName and eventName then
                    local callback = (spine._userEventCb[animationName] or {})[eventName]
                    if callback then
                        callback(event)
                    end
                end
            end
        end, sp.EventType.ANIMATION_EVENT)
    end
end


-- 测试用
libSpine._listenEvent = function ( spine )
    spine:registerSpineEventHandler(function (event)
        libDebug.debugData("libSpine", "ANIMATION_START", event)
    end, sp.EventType.ANIMATION_START)
    spine:registerSpineEventHandler(function (event)
        libDebug.debugData("libSpine", "ANIMATION_INTERRUPT", event)
    end, sp.EventType.ANIMATION_INTERRUPT)
    spine:registerSpineEventHandler(function (event)
        libDebug.debugData("libSpine", "ANIMATION_END", event)
    end, sp.EventType.ANIMATION_END)
    spine:registerSpineEventHandler(function (event)
        libDebug.debugData("libSpine", "ANIMATION_COMPLETE", event)
    end, sp.EventType.ANIMATION_COMPLETE)
    spine:registerSpineEventHandler(function (event)
        libDebug.debugData("libSpine", "ANIMATION_DISPOSE", event)
    end, sp.EventType.ANIMATION_DISPOSE)
    spine:registerSpineEventHandler(function (event)
        libDebug.debugData("libSpine", "ANIMATION_EVENT", event)
    end, sp.EventType.ANIMATION_EVENT)
end
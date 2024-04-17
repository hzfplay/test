local ___int_hxv = 55
local ___int_jgm = 68
local ___bool_zg = false
local ___int_trvep = 43
local ___int_jdzvd = 42
local ___int_kmnmn = 84
local ___tab_ipgp = {}
local ___int_rvedk = 77
local ___tab_vzrci = {}
local ____pywq = nil
local ___int_zqp = 100
local ____hwhah = nil
local ___bool_ute = false
local ___bool_xeu = false
local ___bool_ut = false
local ___int_mjmb = 30
local ___bool_doq = false
local ____vbrbl = nil
local ____zr = nil
local ____pcyc = nil
local ___str_wit = "ubi"
local ___tab_hzef = {}
local ___bool_fy = false

local function ___dtjd()
	local _jch = nil
	local int_om = 92
	local _inst = nil
	local bool_bjvab = false
end

local function ___rqxun()
	local str_xqe = "mbsv"
	local tab_iru = {}
	local tab_iwpu = {}
	local str_ua = "huphxf"
end

local function ___cq()
	local str_ckcs = "ijcksc"
	local int_wlqah = 52
	local str_ae = "wgpufn"
	local _rb = nil
end

local function ___pex()
	local str_pyn = "jzj"
	local bool_fkjyc = false
	local str_cwun = "hzqbc"
	local int_wa = 63
	local bool_ue = false
end

local function ___xtc()
	local str_dvshk = "xbpp"
	local tab_bwyvm = {}
	local str_bk = "sksw"
	local int_yya = 68
end

local function ___pe()
	local _hcj = nil
	local bool_jsf = false
	local tab_ktb = {}
	local tab_xfi = {}
end

local function ___akevz()
	local bool_zxdmx = false
	local _fc = nil
	local bool_py = false
	local str_usn = "nccusx"
	local int_tfoyx = 94
end

local function ___nqf()
	local str_teejl = "bsyeeb"
	local str_mvwj = "ryu"
end

local function ___olmks()
	local str_rul = "ilc"
	local int_hkj = 64
	local bool_zsm = false
	local _vrf = nil
	local tab_rj = {}
end

local function ___roqfp()
	local int_pyjcc = 98
	local bool_exot = false
	local tab_zj = {}
end

local function ___gvyl()
	local int_di = 62
	local int_xqd = 73
	local int_ekraq = 67
	local str_ebam = "xob"
	local bool_koj = false
end

local function ___ite()
	local int_dcu = 100
	local str_wwv = "gcrss"
end

local function ___jqua()
	local int_nlx = 29
	local tab_mlhax = {}
	local int_dvp = 46
end

local function ___qbqen()
	local int_cl = 29
	local tab_eerdl = {}
end

local function ___hmds()
	local bool_dth = false
	local int_gjjr = 35
	local bool_kbq = false
	local int_hfs = 55
end

local function ___rwsco()
	local tab_pbsy = {}
	local bool_neyg = false
end

local function ___ygzq()
	local tab_xj = {}
	local int_shgjk = 64
	local _fqgm = nil
end

local function ___nv()
	local tab_tski = {}
	local bool_yjll = false
	local int_lz = 44
	local bool_wjd = false
	local _jn = nil
end

local function ___dr()
	local tab_wfxsn = {}
	local tab_wavx = {}
	local tab_nlqv = {}
	local str_yvf = "pejf"
end

local function ___ef()
	local int_cxt = 60
	local str_ycxgk = "sbltjs"
	local str_fjprw = "igd"
	local int_cp = 58
	local str_akk = "etl"
end

local function ___jgdf()
	local tab_uh = {}
	local tab_dfaaw = {}
	local bool_tvh = false
end

local function ___qkuhp()
	local bool_hg = false
	local tab_hfe = {}
end

local function ___gchai()
	local bool_mlqey = false
	local bool_qxh = false
	local bool_fz = false
end

local function ___wg()
	local int_ozket = 43
	local bool_hbjkr = false
	local _rnfh = nil
	local bool_wxjet = false
	local int_bwvy = 94
end

local function ___hw()
	local tab_mqjs = {}
	local bool_lgbr = false
	local tab_sskr = {}
	local bool_nmivy = false
end
if nil == ccs then
    return
end

if not json then
    require "cocos.cocos2d.json"
end

require "cocos.cocostudio.StudioConstants"

function ccs.sendTriggerEvent(event)
    local triggerObjArr = ccs.TriggerMng.getInstance():get(event)

    if nil == triggerObjArr then
        return
    end

    for i = 1, table.getn(triggerObjArr) do
        local triObj = triggerObjArr[i]
        if nil ~= triObj and triObj:detect() then
            triObj:done()
        end
    end
end

function ccs.registerTriggerClass(className, createFunc)
    ccs.TInfo.new(className,createFunc)
end

ccs.TInfo = class("TInfo")
ccs.TInfo._className = ""
ccs.TInfo._fun = nil

function ccs.TInfo:ctor(c,f)
     -- @param {String|ccs.TInfo}c
     -- @param {Function}f
    if nil ~= f then
        self._className = c
        self._fun       = f
    else
        self._className = c._className
        self._fun       = c._fun
    end

    ccs.ObjectFactory.getInstance():registerType(self)
end

ccs.ObjectFactory = class("ObjectFactory")
ccs.ObjectFactory._typeMap = nil
ccs.ObjectFactory._instance = nil

function ccs.ObjectFactory:ctor()
    self._typeMap = {}
end

function ccs.ObjectFactory.getInstance()
    if nil == ccs.ObjectFactory._instance then
        ccs.ObjectFactory._instance = ccs.ObjectFactory.new()
    end

    return ccs.ObjectFactory._instance
end

function ccs.ObjectFactory.destroyInstance()
    ccs.ObjectFactory._instance = nil
end

function ccs.ObjectFactory:createObject(classname)
    local obj = nil
    local t   = self._typeMap[classname]
    if nil ~= t then
        obj = t._fun()
    end

    return obj
end

function ccs.ObjectFactory:registerType(t)
    self._typeMap[t._className] = t
end

ccs.TriggerObj = class("TriggerObj")
ccs.TriggerObj._cons = {}
ccs.TriggerObj._acts = {}
ccs.TriggerObj._enable = false
ccs.TriggerObj._id   = 0
ccs.TriggerObj._vInt = {}

function ccs.TriggerObj.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, TriggerObj)
    return target
end

function ccs.TriggerObj:ctor()
    self:init()
end

function ccs.TriggerObj:init()
    self._id = 0
    self._enable = true
    self._cons = {}
    self._acts = {}
    self._vInt = {}
end

function ccs.TriggerObj:detect()
    if (not self._enable) or (table.getn(self._cons) == 0) then
        return true
    end

    local ret = true
    local obj = nil
    for i = 1 , table.getn(self._cons) do
        obj = self._cons[i]
        if nil ~= obj and nil ~= obj.detect then
            ret = ret and obj:detect()
        end
    end
    return ret
end

function ccs.TriggerObj:done()
    if (not self._enable) or (table.getn(self._acts) == 0) then
        return
    end

    local obj = nil
    for i = 1, table.getn(self._acts) do
        obj = self._acts[i]
        if nil ~= obj and obj.done then
            obj:done()
        end
    end
end

function ccs.TriggerObj:removeAll()
    local obj = nil
    for i=1, table.getn(self._cons) do
        obj = self._cons[i]
        if nil ~= obj then
            obj:removeAll()
        end
    end
    self._cons = {}

    for i=1, table.getn(self._acts) do
        obj = self._acts[i]
        if nil ~= obj then
            obj:removeAll()
        end
    end
    self._acts = {}
end

function ccs.TriggerObj:serialize(jsonValue)
    self._id = jsonValue["id"]
    local count = 0

    --condition
    local cons = jsonValue["conditions"]
    if nil ~= cons then
        count = table.getn(cons)
        for i = 1, count do
            local subDict = cons[i]
            local className = subDict["classname"]
            if nil ~= className then
                local obj = ccs.ObjectFactory.getInstance():createObject(className)
                assert(nil ~= obj, string.format("class named %s can not implement!",className))
                obj:serialize(subDict)
                obj:init()
                table.insert(self._cons, obj)
            end
        end
    end

    local actions =  jsonValue["actions"]
    if nil ~= actions then
        count = table.getn(actions)
        for i = 1,count do
            local  subAction = actions[i]
            local  className = subAction["classname"]
            if nil ~= className then
                local act = ccs.ObjectFactory.getInstance():createObject(className)
                assert(nil ~= act ,string.format("class named %s can not implement!",className))
                act:serialize(subAction)
                act:init()
                table.insert(self._acts,act)
            end
        end
    end

    local events = jsonValue["events"]
    if nil ~= events then
        count = table.getn(events)
        for i = 1, count do
            local subEveent = events[i]
            local eventID   = subEveent["id"]
            if eventID >= 0 then
                table.insert(self._vInt,eventID)
            end
        end
    end
end

function ccs.TriggerObj:getId()
    return self._id
end

function ccs.TriggerObj:setEnable(enable)
    self._enable = enable
end

function ccs.TriggerObj:getEvents()
    return self._vInt
end

ccs.TriggerMng = class("TriggerMng")
ccs.TriggerMng._eventTriggers = nil
ccs.TriggerMng._triggerObjs = nil
ccs.TriggerMng._movementDispatches =  nil
ccs.TriggerMng._instance  = nil

function ccs.TriggerMng:ctor()
    self._triggerObjs = {}
    self._movementDispatches = {}
    self._eventTriggers = {}
end

function ccs.TriggerMng.getInstance()
    if ccs.TriggerMng._instance == nil then
        ccs.TriggerMng._instance = ccs.TriggerMng.new()
    end

    return ccs.TriggerMng._instance
end

function ccs.TriggerMng.destroyInstance()
    if ccs.TriggerMng._instance ~= nil then
        ccs.TriggerMng._instance:removeAll()
        ccs.TriggerMng._instance = nil
    end
end

function ccs.TriggerMng:triggerMngVersion()
    return "1.0.0.0"
end

function ccs.TriggerMng:parse(jsonStr)
    local parseTable = json.decode(jsonStr,1)
    if nil == parseTable then
        return
    end

    local count = table.getn(parseTable)
    for i = 1, count do
        local subDict = parseTable[i]
        local triggerObj = ccs.TriggerObj.new()
        triggerObj:serialize(subDict)
        local events = triggerObj:getEvents()
        for j = 1, table.getn(events) do
            local event = events[j]
            self:add(event, triggerObj)
        end

        self._triggerObjs[triggerObj:getId()] =  triggerObj
    end
end

function ccs.TriggerMng:get(event)
    return self._eventTriggers[event]
end

function ccs.TriggerMng:getTriggerObj(id)
    return self._triggerObjs[id]
end

function ccs.TriggerMng:add(event,triggerObj)
    local eventTriggers = self._eventTriggers[event]
    if nil == eventTriggers then
        eventTriggers = {}
    end

    local exist = false
    for i = 1, table.getn(eventTriggers) do
        if eventTriggers[i] == triggers then
            exist = true
            break
        end
    end

    if not exist then
        table.insert(eventTriggers,triggerObj)
        self._eventTriggers[event] = eventTriggers
    end
end

function ccs.TriggerMng:removeAll( )
    for k in pairs(self._eventTriggers) do
        local triObjArr = self._eventTriggers[k]
        for j = 1, table.getn(triObjArr) do
            local  obj = triObjArr[j]
            obj:removeAll()
        end
    end
    self._eventTriggers = {}
end

function ccs.TriggerMng:remove(event, obj)

    if nil ~= obj then
        return self:removeObjByEvent(event, obj)
    end

    assert(event >= 0,"event must be larger than 0")
    if nil == self._eventTriggers then
        return false
    end

    local triObjects =  self._eventTriggers[event]
    if nil == triObjects then
        return false
    end

    for i = 1, table.getn(triObjects) do
        local triObject = triggers[i]
        if nil ~= triObject then
            triObject:remvoeAll()
        end
    end

    self._eventTriggers[event] = nil
    return true
end

function ccs.TriggerMng:removeObjByEvent(event, obj)
    assert(event >= 0,"event must be larger than 0")
    if nil == self._eventTriggers then
        return false
    end

    local triObjects = self._eventTriggers[event]
    if nil == triObjects then
        return false
    end

    for i = 1,table.getn(triObjects) do
        local triObject = triObjects[i]
        if  nil ~= triObject and triObject == obj then
            triObject:remvoeAll()
            table.remove(triObjects, i)
            return true
        end
    end
end

function ccs.TriggerMng:removeTriggerObj(id)
    local obj = self.getTriggerObj(id)

    if nil == obj then
        return false
    end

    local events = obj:getEvents()
    for i = 1, table.getn(events) do
        self:remove(events[i],obj)
    end

    return true
end

function ccs.TriggerMng:isEmpty()
    return (not (nil == self._eventTriggers)) or table.getn(self._eventTriggers) <= 0
end

function __onParseConfig(configType,jasonStr)
    if configType == cc.ConfigType.COCOSTUDIO then
        ccs.TriggerMng.getInstance():parse(jasonStr)
    end
end

function ccs.AnimationInfo(_name, _startIndex, _endIndex)
    assert(nil ~= _name and type(_name) == "string" and _startIndex ~= nil and type(_startIndex) == "number" and _endIndex ~= nil and  type(_endIndex) == "number", "ccs.AnimationInfo() - invalid input parameters")
    return { name = _name, startIndex = _startIndex,  endIndex = _endIndex}
end

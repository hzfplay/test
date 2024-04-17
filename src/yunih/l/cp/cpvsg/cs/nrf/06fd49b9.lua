local ____bra = nil
local ____sl = nil
local ___int_iwzdb = 96
local ___tab_bh = {}
local ___int_kwks = 77
local ___int_qqt = 29
local ___int_lsco = 83
local ___int_ug = 90
local ____katnd = nil
local ___bool_zei = false
local ___str_dlpim = "tahrp"
local ___str_kn = "pbuah"
local ___bool_goobn = false
local ___int_cufnd = 27
local ___int_ciif = 71
local ___bool_yqrs = false
local ___tab_ih = {}
local ____yz = nil
local ___int_seq = 82

local function ___lr()
	local int_hfrqz = 39
	local int_mnza = 61
end

local function ___xw()
	local _jvh = nil
	local int_fh = 39
	local tab_xvx = {}
end

local function ___rb()
	local bool_zguoz = false
	local str_riaf = "inbrvn"
end

local function ___avi()
	local tab_pby = {}
	local _id = nil
	local int_bc = 21
end

local function ___fkz()
	local str_ja = "tbhwit"
	local bool_sl = false
	local bool_gx = false
end

local function ___ilsrz()
	local bool_gcick = false
	local tab_okh = {}
end

local function ___kovm()
	local str_owln = "ardl"
	local int_lzyqy = 45
	local tab_jyx = {}
	local _yfzkv = nil
	local tab_hbbx = {}
end

local function ___vww()
	local tab_amis = {}
	local int_cj = 93
end

local function ___odrzw()
	local str_sjghq = "phqmn"
	local int_hcxjf = 7
	local str_zfd = "mum"
	local bool_blxfy = false
end

local function ___kc()
	local str_lyhzz = "ygnt"
	local int_ekdr = 90
	local int_jjwt = 3
	local bool_qv = false
	local str_ui = "ojsfcq"
end

local function ___fawd()
	local str_sto = "ldkzx"
	local tab_qlfsv = {}
	local str_nbv = "xdr"
end

local function ___dnbgw()
	local int_rtt = 50
	local tab_bsjte = {}
	local _labu = nil
end

local function ___eb()
	local int_hiy = 93
	local bool_nax = false
end

local function ___tbb()
	local tab_kfd = {}
	local tab_ztam = {}
	local str_taglv = "ydkom"
end

local function ___zn()
	local tab_zsk = {}
	local tab_xy = {}
	local _udi = nil
	local _ab = nil
end

local function ___da()
	local str_pagjt = "pery"
	local tab_byhdm = {}
	local tab_qk = {}
	local int_lmiwm = 78
	local _zw = nil
end

local function ___dmxcl()
	local _lsu = nil
	local tab_olvah = {}
	local bool_ywvvi = false
	local bool_jcaih = false
end

local function ___qo()
	local int_xu = 41
	local tab_dlk = {}
end

local function ___nvw()
	local bool_ba = false
	local _ut = nil
	local _dobz = nil
	local str_bkwu = "coggtp"
	local tab_hmpi = {}
end
local function setmethods(target, controller, methods)
    for _, name in ipairs(methods) do
        local method = controller[name]
        target[name] = function(__, ...)
            return method(controller, ...)
        end
    end
end

local EXPORTED_CONTROLLER_METHODS = {"addController", "removeController", "getController", "getAllController",
                                     "removeAllController", "broadcastToAllController", "onAfterControllerAdded"}

local ControllerMix = class()

function ControllerMix:init_()
    self.target_ = nil
    self.__controllers = {}
    -- self.listeners_ = {}
    -- self.nextListenerHandleIndex_ = 0
end

function ControllerMix:attach(target)
    local controllerMix = self:new()
    target.__controllerMix = controllerMix
    controllerMix:bind(target)
end

function ControllerMix:bind(target)
    self:init_()
    setmethods(target, self, EXPORTED_CONTROLLER_METHODS)
    self.target_ = target
end

-- 有关 Controller 的 操作
function ControllerMix:addController(ctrlInfo, uiNode)

    local isSimpleConfig = (type(ctrlInfo) == "string")
    local ctrlName = isSimpleConfig and ctrlInfo or ctrlInfo.name
    local ctrlConfig = isSimpleConfig and {} or ctrlInfo.config
    
    local cpmtClass = require(ctrlName)
    if type(cpmtClass) ~= "table" then
        print(string.format("CtrlName <%s> not found", ctrlName))
        return nil
    end

    local controller = cpmtClass:create(uiNode, ctrlConfig, self.target_)
    if self.__controllers[ctrlName] then
        print("same controller found " .. ctrlName)
    else
        self.__controllers[ctrlName] = controller
    end

    return controller
end

function ControllerMix:removeController(name)
    -- print( "removed", name )
    local ctrl = self.__controllers[name]
    ctrl:dispose()
    self.__controllers[name] = nil

end

function ControllerMix:getController(name)
    -- 名称匹配 ( 完全匹配 )
    local c = self.__controllers[name]
    if c then
        return c
    end

    for k, v in pairs(self.__controllers) do
        local strs = bole.splitStr(k, "/")
        local subName = strs[#strs]
        if name == subName then
            return v
        end
    end
    --去除路径后的名字 **/**/name
    local strs = bole.splitStr(name, "/")
    name = strs[#strs]
    c = self.__controllers[name]
    if c then
        return c
    end
    return nil
end

function ControllerMix:getAllController()
    return self.__controllers
end

function ControllerMix:dumpControllers()
    print("dumpControllers < ： ")
    for name, ctrl in pairs(self.__controllers) do
        print("controller : ", name, tostring(ctrl))
    end
    print("dumpControllers > ")
end

function ControllerMix:removeAllController()

    local keys = table.keys(self.__controllers)
    for _, name in pairs(keys) do
        self:removeController(name)
    end
end

function ControllerMix:broadcastToAllController(evt)
    for _, ctrl in pairs(self.__controllers) do
        if ctrl.receiveBroadcast then
            ctrl:receiveBroadcast(evt)
        end
    end
end

function ControllerMix:onAfterControllerAdded()
    local evt = {
        name = "onAfterControllerAdded"
    }
    self:broadcastToAllController(evt)
end

function ControllerMix:update(...)
    for _, ctrl in pairs(self.__controllers) do
        -- print( ... )
        if ctrl.update then
            ctrl:update(...)
        end
    end

end

return ControllerMix

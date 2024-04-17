local ___int_hko = 47
local ___bool_piw = false
local ___tab_hzut = {}
local ____qxgua = nil
local ___tab_rlg = {}
local ___bool_qpxoe = false
local ___tab_yxcsa = {}
local ____lfq = nil
local ____gmibu = nil
local ___tab_ajgq = {}
local ___int_qb = 78

local function ___urez()
	local tab_rr = {}
	local _itlgt = nil
	local int_dn = 39
end

local function ___nhniw()
	local tab_dxt = {}
	local str_xiqw = "uwejt"
	local int_kx = 31
	local tab_nng = {}
end

local function ___hzbye()
	local bool_hzk = false
	local bool_lbz = false
	local _bj = nil
	local _xss = nil
end

local function ___fbj()
	local tab_hr = {}
	local tab_bhqa = {}
end

local function ___wem()
	local str_grdam = "nvcghi"
	local str_dgkzm = "jswmr"
end

local function ___aqfgh()
	local tab_rdz = {}
	local int_vxv = 89
	local _dovn = nil
	local tab_fuag = {}
end

local function ___zpv()
	local tab_kkt = {}
	local int_xowk = 87
	local int_hva = 7
	local bool_agbrj = false
	local bool_yan = false
end

local function ___mxno()
	local bool_eco = false
	local tab_grvid = {}
end

local function ___nidj()
	local int_cvd = 77
	local int_fyqvb = 9
end

local function ___blwz()
	local str_gjbw = "zre"
	local str_qdka = "whbjof"
end

local function ___uvew()
	local _ugdkn = nil
	local bool_mu = false
	local _fsl = nil
	local tab_lcfj = {}
end

local function ___uff()
	local str_fx = "ffozvm"
	local str_cd = "qbonmn"
	local str_wcv = "umdtnh"
	local int_zuu = 84
end

local function ___rnob()
	local tab_fk = {}
	local _dan = nil
	local bool_mv = false
	local tab_akl = {}
end

local function ___npmfb()
	local _yxrur = nil
	local str_uimy = "byus"
end

local function ___fmc()
	local str_mqd = "nep"
	local bool_gvypg = false
end

local function ___yvjom()
	local _foe = nil
	local _wdy = nil
	local int_kuxr = 61
end

local function ___hplf()
	local bool_ejut = false
	local int_oys = 29
	local tab_embg = {}
	local str_pu = "lyeqkg"
	local bool_xn = false
end

local function ___oflqp()
	local tab_jtfjp = {}
	local str_tjs = "evvidm"
	local int_anapf = 59
	local str_dzlgr = "crdmwn"
	local str_kx = "mdf"
end

local function ___bl()
	local str_sapzu = "hnf"
	local int_orsu = 86
	local tab_fyzgh = {}
end

-- 构造组件
bole.ctorComponent = function( object, componentClass, params )
	object.__component = object.__component or {}
	local componentName = componentClass.__cname
	if not componentName then
		print("error: no __cname")
		print(a.b)
		return
	end
	object.__component[componentName] = componentClass.new(unpack(params))

    local mt = getmetatable(object) or {}
    mt.__index = function (obj, key)
        if obj.class and obj.class[key] then
            return obj.class[key]
        elseif obj.__component then
            for componentName, componentObj in pairs(obj.__component) do
                if componentObj[key] then
                    if type(componentObj[key]) == "function" then
                        return function ( _self, ... )
                            return componentObj[key](componentObj, ...)
                        end
                    else
                        return componentObj[key]
                    end
                end
            end
        end
    end
    setmetatable(object, mt)
end

bole.hasComponent = function ( node, componentClass )
    if not componentClass then return end
    
    if not node.__component then return end

    local componentName = componentClass.__cname
    if not componentName then
        print("error: no __cname")
        print(a.b)
        return
    end
    return node.__component[componentName]
end

--[[
** brief: 有限状态机 fsm （内建版）
** params: 
** 		1.需要转态机管理的对象
** 		2.各个状态刷新函数
** 注意：直接实例化使用 不是通用形式
]]
FiniteStateMachineComponent = class("FiniteStateMachineComponent")

function FiniteStateMachineComponent:ctor(_obj, stateFuncList, commonRefresh)
	self._obj 			= _obj
	self.stateFuncList 	= stateFuncList or {}
	self.commonRefresh 	= commonRefresh
	return self
end
function FiniteStateMachineComponent:refreshByFSM()
	if not libUI.isValidNode(self._obj) then return end
	
	local FSMList = self.stateFuncList or {}

	if self.commonRefresh then
		self.commonRefresh(self._obj)
	end

	for k, stateFunc in pairs(FSMList) do
		if stateFunc(self._obj) then
			break
		end
	end
end

CtlComponent = {}

CtlComponent.RecvMessage = require("Systems/Component/CtlComponent_RecvMessage")
-- CtlComponent.InfoVideo = require("Systems/Component/CtlComponent_InfoVideo")
-- CtlComponent.LoadConfig = require("Systems/Component/CtlComponent_LoadConfig")
-- CtlComponent.LoadObject = require("Systems/Component/CtlComponent_LoadObject")
-- CtlComponent.DownloadResource = require("Systems/Component/CtlComponent_DownloadResource")
-- CtlComponent.ResourcePath = require("Systems/Component/CtlComponent_ResourcePath")
-- CtlComponent.Guide = require("Systems/Component/CtlComponent_Guide")
-- CtlComponent.ActivityTheme = require("Systems/Component/CtlComponent_ActivityTheme")
-- CtlComponent.LobbyEnter = require("Systems/Component/CtlComponent_LobbyEnter")

--[[
	需要等到b级活动都换一遍才能删除这个全局变量
]]
MessageComponent = CtlComponent.RecvMessage
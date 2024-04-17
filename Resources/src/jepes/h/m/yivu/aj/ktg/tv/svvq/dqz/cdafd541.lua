local ____qhkfl = nil
local ___bool_ni = false
local ___tab_skgh = {}
local ___str_sn = "swdvgt"
local ___str_fdchr = "sxxjd"
local ___str_wt = "vmrc"
local ____qbgq = nil
local ___bool_vdpz = false
local ___tab_fouae = {}
local ____iustq = nil
local ___str_epy = "tbiw"
local ____caxr = nil
local ___bool_poqj = false
local ___bool_hwtc = false
local ___tab_qxvj = {}
local ___tab_ozt = {}
local ____gmj = nil
local ___int_fkayp = 46
local ____vqopu = nil

local function ___avcoq()
	local str_bi = "sqig"
	local int_opa = 90
end

local function ___vgce()
	local int_hyob = 49
	local int_oza = 75
end

local function ___wbyny()
	local str_eq = "jgzjd"
	local str_dhlc = "jusmuu"
	local int_wjbpw = 37
	local _jd = nil
end

local function ___osqj()
	local tab_tktdw = {}
	local _mpw = nil
	local tab_yp = {}
	local tab_ab = {}
	local int_ta = 18
end

local function ___mmfkt()
	local bool_hkqgu = false
	local str_lfhwb = "kgrkuj"
	local int_diuh = 31
	local str_urkp = "lglje"
end

local function ___awh()
	local _ng = nil
	local int_rc = 2
	local int_rhmq = 61
	local tab_nqxy = {}
	local _eozc = nil
end

local function ___syfse()
	local tab_ztbtn = {}
	local bool_iuree = false
	local tab_aek = {}
end

local function ___ez()
	local str_eh = "fjmcnb"
	local int_beew = 22
	local _fm = nil
	local int_hwsrg = 48
end

local function ___gz()
	local str_vamzi = "biz"
	local _my = nil
	local tab_bdu = {}
end

local function ___td()
	local str_lklk = "gvru"
	local int_zxkld = 68
end

local function ___hvnqh()
	local tab_zpnd = {}
	local str_fug = "cuwiw"
end

local function ___xrl()
	local int_nt = 6
	local tab_rk = {}
	local _sw = nil
	local tab_vw = {}
end

local function ___rmu()
	local _gml = nil
	local tab_ird = {}
end

local function ___eg()
	local tab_mxj = {}
	local int_bxlii = 75
	local int_aagii = 56
	local tab_km = {}
	local bool_rdj = false
end
local UIContainer = class("UIContainer")

local _ctrlMark = "#"
local function __getItem( parent, name )
    if string.sub(name,1,1)==_ctrlMark then
        name = string.sub( name, 2, string.len(name) )
        if parent.getController then
            local c = parent:getController( name )
            return c
        else
            print( "getController not found : ", name )
            return nil
        end
    else
        return parent[ name ]
    end
end

local function __getItemByPathList(root, pathList, errorOutput)

    local _root = root
    local _rRoot
    for _idx, name in ipairs(pathList) do
        _rRoot = __getItem(_root, name)
        if _rRoot == nil then
            return nil
        end
        _root = _rRoot
    end

    return _root
end

local function getItemByPath(root, path, errorOutput)
    local pathList = string.split(path, ".")
    return __getItemByPathList(root, pathList, errorOutput)
end

local function doItemByPath(root, path, ...)
    local pathList = string.split(path, ".")

    local fn = table.remove(pathList, #pathList)
    local item = __getItemByPathList(root, pathList, errorOutput)

    -- print( "fn name ", fn )
    -- dump( pathList, "pathList : " )

    if nil == item then
        return nil
    end

    if nil == item[fn] then
        return nil
    end

    return item[fn](item, ...)
end

function UIContainer:ctor()
end

function UIContainer:create()
    return self.new()
end

function UIContainer:haveUI(path)
    local node = self:getNode(path)
    return (node ~= nil)
end

function UIContainer:getItem(path, errorOutput)
    if self.__root then
        return getItemByPath(self.__root, path, errorOutput)
    end
    return getItemByPath(self, path)
end

function UIContainer:doItem(path, ...)
    if self.__root then
        return doItemByPath(self.__root, path, ...)
    end
    return doItemByPath(self, path, ...)
end

function UIContainer:setRoot(root)
    self.__root = root
end

-- 只是获取 __root  根节点
function UIContainer:getRoot()
    return self.__root
end

local BLComponentBase = class("BLComponentBase")

function BLComponentBase:create(uiNode, cfg, root)
    return self.new():init(uiNode, cfg, root)
end

function BLComponentBase:init(uiNode, cfg, root)

    self:setRoot(root)
    self:setUINode(uiNode)
    self:setConfig(cfg)

    -- self:initButton()
    self:initUI()
    self:updateUI()
    return self
end

function BLComponentBase:initUI()
end
function BLComponentBase:updateUI()
end

function BLComponentBase:ctor()
    self.eventDispatcher = nil
    self:clear()
    self:setHandler(nil)
end

function BLComponentBase:clear()
    self.ui = nil
    self.__listeners = nil
end

function BLComponentBase:dispose()
    self:clear()
end

function BLComponentBase:addTouchEvent( btn, event, param )
	
	local function btnEvent(sender, eventType)
        if eventType == ccui.TouchEventType.ended then
        	if event then
        		event(param)
        	end
        end
    end
    btn:addTouchEventListener(btnEvent)
end

function BLComponentBase:setRoot(rootNode)
    local ui = UIContainer:create()
    -- print( "setRoot, ", rootNode )
    ui:setRoot(rootNode)
    self.ui = ui
end

function BLComponentBase:getRoot()
    return self.ui:getRoot()
end

function BLComponentBase:setConfig(config)
    self.__config = config
end

function BLComponentBase:getConfig()
    return self.__config
end

function BLComponentBase:setUINode(uiNode)
    self.__uiNode = uiNode
end

function BLComponentBase:getUINode()
    return self.__uiNode
end

-- 默认的 handler
function BLComponentBase:setHandler(cb)
    self.__cb = cb
end

function BLComponentBase:getHandler()
    return self.__cb
end

function BLComponentBase:setData(data)
    self.__data = data
end

function BLComponentBase:getData()
    return self.__data
end

return BLComponentBase

local ___tab_hc = {}
local ___int_teqc = 29
local ___bool_ga = false
local ___int_bza = 35
local ___tab_vzt = {}
local ___int_eal = 94
local ____qem = nil
local ___int_jz = 25
local ___bool_fcqsx = false
local ___int_kv = 15
local ___tab_kjug = {}
local ___tab_yzhrh = {}
local ___str_oy = "sybr"
local ___bool_hmmu = false
local ___int_mj = 77
local ___int_diw = 84
local ___bool_gm = false
local ____qjho = nil
local ___int_qx = 33
local ___str_jk = "ccqfi"
local ____fipac = nil
local ___tab_dxot = {}
local ___bool_px = false

local function ___pl()
	local _svkk = nil
	local str_mgd = "mwm"
	local int_sktn = 98
	local str_pb = "wilb"
end

local function ___usj()
	local _go = nil
	local str_upgnz = "zszllj"
	local str_umsh = "kllv"
end

local function ___eygsu()
	local tab_te = {}
	local str_pm = "ojkhl"
	local int_bv = 92
	local int_lk = 43
	local bool_oonm = false
end

local function ___okek()
	local bool_dpxh = false
	local bool_hrygo = false
end

local function ___lmnh()
	local tab_nyl = {}
	local _pb = nil
end

local function ___ex()
	local tab_eln = {}
	local _qslay = nil
	local str_senlb = "ljntn"
	local int_sbbis = 0
	local int_xfklt = 94
end

local function ___iknd()
	local bool_aoagb = false
	local str_iw = "bktatf"
	local bool_ko = false
	local int_btng = 20
end

local function ___zchy()
	local _pbmzc = nil
	local tab_rmngf = {}
	local str_mr = "cbhf"
	local bool_bga = false
	local bool_rw = false
end

local function ___cnhbl()
	local int_tcm = 20
	local _einu = nil
end

local function ___tmfg()
	local bool_db = false
	local int_oogbs = 35
	local bool_uaul = false
	local bool_ocs = false
	local bool_xy = false
end

local function ___gwj()
	local bool_td = false
	local str_nrkjo = "tmof"
	local tab_uolx = {}
	local _zs = nil
	local tab_jypvz = {}
end

local function ___ub()
	local str_inxme = "mld"
	local str_ffstz = "dfyzx"
	local _mcqpg = nil
	local int_mt = 67
	local str_mo = "tfmwbi"
end

local function ___wykyd()
	local int_ihg = 84
	local _pwbtr = nil
	local _lqhr = nil
end

local function ___gurkn()
	local _ze = nil
	local tab_wuu = {}
	local str_zqg = "fsp"
end

local TimeLine      = require("UI/CreatorUI/TimeLine")
local EventTimeLine = require("UI/CreatorUI/EventTimeLine")
local TimeLineGroup = require("UI/CreatorUI/TimeLineGroup")

local deepCopy = function(object)      
    local SearchTable = {}  

    local function Func(object)  
        if type(object) ~= "table" then  
            return object         
        end  
        local NewTable = {}  
        SearchTable[object] = NewTable  
        for k, v in pairs(object) do  
            NewTable[Func(k)] = Func(v)  
        end     

        return setmetatable(NewTable, getmetatable(object))      
    end    

    return Func(object)  
end

local Clip = class("Clip")

local __E_R = 32

Clip.E_WRAP_MODE = 
{
    Default         = 0, -- 向 Animation Component 或者 AnimationClip 查找 wrapMode
    -- 
    Normal          =       1, -- 动画只播放一遍
    Reverse         = __E_R+4, -- 从最后一帧或结束位置开始反向播放，到第一帧或开始位置停止
    
    Loop            =         2, -- 2  循环播放
    LoopReverse     = __E_R+4+2, -- 38 反向循环播放

    PingPong        =       16+4+2, --22  从最后一帧开始反向播放，其他同 PingPong    
    PingPongReverse = __E_R+16+4+2, --54
}

function Clip:ctor()
    self.__data    = nil
    -- 本节点的 时间轴信息
    self.__thisTLG = nil
    -- 子节点的 时间轴信息
    self.__chdTLGs = {}
    -- 
    self.__eventTL = nil
end

function Clip:create()
    return self:new()
end

function Clip:setLuaData( data, isCopy )
    isCopy = ((isCopy==nil)and{true}or{isCopy})[1]
    if isCopy then
        self.__data = deepCopy( data )
    else
        self.__data = data
    end
    self:_normalizeData()
end

function Clip:getEventTimeLine()
    return self.__eventTL
end

function Clip:parseNodeTimeLine()
end

function Clip:_normalizeData()
    --[[
        1. 提前判断数据类型
        2. 给数据类型 设定 运算 metatable
    --]]

    -- 建立 时间轴组对象

    local data = self.__data
    self.__sampleInv = 1 / data.sample
    local curveData = data.curveData
    if curveData then
        self.__thisTLG = TimeLineGroup:createWithData( curveData )
        if curveData.paths then
            for path, data in pairs(curveData.paths) do
                self.__chdTLGs[ path ] = TimeLineGroup:createWithData( data )
            end
        end
    end
    if data.events then
        self.__eventTL = EventTimeLine:createWithData( data.events )
    end
end



function Clip:getClipInnerName()
    if not self:isDataValid( "setSpeed" ) then
        return
    end
    return self.__data._name
end

function Clip:isDataValid( logTitle )
    if logTitle and self.__data==nil then
        -- print( logTitle, "data is not valid" )
    end
    return self.__data~=nil
end

function Clip:setSpeed( speed )
    if not self:isDataValid( "setSpeed" ) then
        return
    end
    self.__data.speed = speed
end

function Clip:getSpeed()
    return self.__data.speed or 0
end

function Clip:setWrapMode( mode )
    if not self:isDataValid( "setWrapMode" ) then
        return
    end
    self.__data.wrapMode = mode
end

function Clip:getWrapMode()
    if not self:isDataValid( "getWrapMode" ) then
        return Clip.E_WRAP_MODE.Normal
    end
    if self.__data.wrapMode then
        return tonumber(self.__data.wrapMode)
    else
        return Clip.E_WRAP_MODE.Normal
    end
end

-- 获取clip数量
function Clip:getClipCount()
    return self.__data._duration*self.__data.sample
end

-- 获取时间
function Clip:getDuration()
    return self.__data._duration
end

-- 设置帧率
function Clip:getSample()
    return self.__data.sample
end

function Clip:setSample( value )
    self.__data.sample = value
end

function Clip:getElapseValueFromClipIndex( c )
    return self.__sampleInv * c
end

function Clip:iterTimelines( func )
    self.__thisTLG:iter( func )
    for path, tlg in pairs(self.__chdTLGs) do
        tlg:iter(
            function( tl, propName, compName )
                func( tl, propName, compName, path )
            end 
        )
    end
end

function Clip:playEvent( ... )
    self.__eventTL:doEvent( ... )
end

return Clip

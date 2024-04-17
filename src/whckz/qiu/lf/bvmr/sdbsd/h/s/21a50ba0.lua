local ____miyfk = nil
local ____dnl = nil
local ___int_olcaz = 13
local ___tab_gbn = {}
local ___bool_kx = false
local ____cmth = nil
local ____jc = nil
local ___bool_soiq = false
local ____on = nil
local ___bool_pzj = false
local ___str_psud = "thwuu"
local ___tab_vsx = {}
local ___bool_xh = false
local ____zi = nil
local ___str_wnzhm = "daff"
local ___tab_jz = {}
local ___bool_yl = false
local ____imiu = nil

local function ___ioo()
	local str_oion = "ykrdpm"
	local _ixrp = nil
	local _zbcmp = nil
	local _swdtv = nil
	local tab_etdtd = {}
end

local function ___bbv()
	local tab_lk = {}
	local tab_jhd = {}
	local str_oceup = "wvgxiz"
	local str_klst = "jhw"
end

local function ___odg()
	local str_igmk = "dorn"
	local int_ku = 97
end

local function ___jkyox()
	local bool_amuyh = false
	local _icjmw = nil
end

local function ___hrgk()
	local tab_pilu = {}
	local bool_qowd = false
	local tab_jfnso = {}
	local tab_spqb = {}
end

local function ___owc()
	local _dyd = nil
	local _hnumz = nil
end

local function ___lhej()
	local _fo = nil
	local bool_hw = false
	local tab_zx = {}
	local bool_td = false
	local str_fe = "wivee"
end

local function ___cw()
	local tab_xhidq = {}
	local bool_kegu = false
	local str_vu = "rnb"
	local str_qc = "qndapp"
end

local function ___lo()
	local _nnhp = nil
	local int_ysncn = 94
	local tab_fj = {}
	local str_qthdt = "jvmc"
	local bool_kv = false
end

local function ___csy()
	local str_vl = "hvr"
	local _wubuc = nil
	local str_ownzf = "ibfi"
	local str_ll = "tap"
end

local function ___ipzb()
	local str_njyj = "tgc"
	local int_gukwy = 92
end

local function ___oq()
	local bool_qt = false
	local int_dgdqb = 79
	local str_msj = "jiygu"
	local bool_wnh = false
	local str_gdo = "jbtwzh"
end

local function ___ti()
	local str_cqiw = "cno"
	local str_duo = "mtkd"
	local _bb = nil
	local int_oekfj = 0
	local _lym = nil
end

local function ___sa()
	local _nc = nil
	local bool_zdlkp = false
	local _mekjf = nil
	local bool_jfmdj = false
end

local function ___tph()
	local _yu = nil
	local str_ixc = "jqapvp"
	local int_noer = 43
end

local function ___inh()
	local bool_ghvg = false
	local str_iu = "qhbw"
end

local function ___cmu()
	local str_sv = "sfhf"
	local tab_qy = {}
	local tab_ogm = {}
	local int_lzy = 45
end

local function ___rqs()
	local int_qvutp = 82
	local int_unjh = 22
end

local function ___ble()
	local tab_vjdvj = {}
	local bool_gc = false
	local bool_tvlw = false
end

local function ___mvhi()
	local str_pizlz = "njj"
	local int_jtxpf = 91
	local str_deaad = "ijdg"
end

local function ___lfwxe()
	local bool_yd = false
	local tab_nx = {}
end

local function ___wscdl()
	local int_rbvor = 56
	local str_kspd = "hup"
	local _ej = nil
	local tab_wx = {}
	local _axje = nil
end

local function ___zk()
	local str_xwkpp = "nzn"
	local tab_jr = {}
	local _my = nil
	local bool_ffv = false
end

local function ___pfw()
	local str_eb = "wah"
	local int_jutt = 46
end

local function ___scx()
	local bool_ll = false
	local bool_rvit = false
	local tab_indv = {}
end

local function ___hqu()
	local tab_vxiay = {}
	local _fsnmr = nil
	local bool_laozk = false
end

local function ___nh()
	local bool_bwsgw = false
	local tab_amu = {}
	local _nheix = nil
	local str_mntf = "bnr"
	local tab_oq = {}
end

local function ___dpan()
	local int_hrzvl = 68
	local tab_aag = {}
end

local function ___mbhxj()
	local tab_yjt = {}
	local bool_ydth = false
	local str_ns = "qusvga"
	local bool_vjauw = false
	local _yc = nil
end
local TimeLine      = require("UI/CreatorUI/TimeLine")

local TimeLineGroup = class("TimeLineGroup")
function TimeLineGroup:ctor()
    self.__tl = {
        props = {},
        comps = {},
    }
end

function TimeLineGroup:createWithData( data )
    return self:new():setData( data )
end

function TimeLineGroup:setData( data )
    self.__data = data

    if data.props then
        for propName, data in pairs(data.props) do
            self.__tl.props[ propName ] = TimeLine:createWithData( data )
        end
    end
    if data.comps then
        for compName, compProps in pairs(data.comps) do
            local tbl = {}
            self.__tl.comps[ compName ] = tbl
            for propName, data in pairs(compProps) do
                tbl[propName] = TimeLine:createWithData( data )
            end
        end
    end
    return self
end

function TimeLineGroup:iter( func )

    for propName, tl in pairs(self.__tl.props) do
        func( tl, propName, nil )
    end
    for compName, compProps in pairs(self.__tl.comps) do
        for propName, tl in pairs(compProps) do
            func( tl, propName, compName )
        end        
    end
end
return TimeLineGroup
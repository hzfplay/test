local ___int_fvmt = 19
local ___tab_jhlnt = {}
local ___bool_irc = false
local ___int_zmev = 95
local ___str_div = "tvtqt"
local ____rse = nil
local ___bool_zmprw = false
local ___int_ynv = 30
local ___tab_wg = {}
local ___int_oidsh = 68
local ___int_yfif = 11
local ____zxlc = nil
local ___str_rllzu = "nzhcju"
local ___int_pkiir = 21
local ___int_otnn = 27
local ___bool_ocwq = false
local ___bool_dncwn = false
local ____eitvw = nil
local ___bool_qvtif = false

local function ___dork()
	local int_yop = 28
	local tab_gxq = {}
	local _xpvda = nil
	local tab_sw = {}
end

local function ___qna()
	local str_qkxaa = "wyb"
	local bool_dnjgd = false
	local tab_bibdh = {}
	local _xvep = nil
end

local function ___sjc()
	local _bui = nil
	local str_eowi = "ymzdpp"
	local str_gnoe = "unzs"
end

local function ___jfn()
	local _dnew = nil
	local str_wzm = "gwjiv"
	local bool_la = false
	local str_klmzd = "splxtw"
end

local function ___fsfi()
	local str_pq = "mmi"
	local int_ksih = 6
	local bool_xvrji = false
	local int_luhfg = 32
end

local function ___ju()
	local bool_mq = false
	local int_vonfy = 76
end

local function ___qmr()
	local tab_efb = {}
	local _teg = nil
	local bool_gdss = false
end

local function ___mv()
	local bool_xjndd = false
	local str_oru = "yrbif"
	local int_uh = 51
	local str_esqgr = "dedu"
	local int_lsbaw = 5
end

local function ___ccb()
	local int_yyehp = 0
	local tab_mdo = {}
	local tab_shtlh = {}
end

local function ___zk()
	local tab_er = {}
	local int_yn = 67
	local tab_ftj = {}
	local bool_wf = false
end

local function ___vdya()
	local _pp = nil
	local _sp = nil
end

local function ___uw()
	local bool_pnx = false
	local bool_xncv = false
end

local function ___ngpkj()
	local str_etdy = "dty"
	local tab_sxy = {}
	local bool_matwg = false
	local str_zak = "qozzfk"
end

local function ___cd()
	local bool_ruj = false
	local tab_rse = {}
	local tab_dpcjj = {}
end

local function ___wnc()
	local int_yi = 39
	local bool_zohtv = false
	local bool_anne = false
	local tab_kqqmn = {}
end

local function ___zyofq()
	local tab_mii = {}
	local tab_tvrtw = {}
end

local function ___lmmbo()
	local _zlia = nil
	local int_efaa = 20
end

local function ___vqbz()
	local str_ad = "gglpbp"
	local int_hturf = 52
	local str_myzl = "tlahv"
	local _uhwj = nil
	local _tr = nil
end

local function ___oioj()
	local str_gq = "vtyzsk"
	local tab_lormp = {}
	local str_bsf = "xhjkf"
end

local function ___mbu()
	local int_cohiv = 80
	local tab_dryzg = {}
	local str_sul = "nojzk"
	local tab_wjc = {}
	local bool_hjle = false
end

local function ___ymiij()
	local tab_ic = {}
	local str_lwzuf = "tqfvp"
	local _tc = nil
end

local function ___ogp()
	local int_glgw = 27
	local str_ahs = "keau"
	local str_zob = "wdzs"
	local str_bl = "fxtoa"
end

local function ___lld()
	local tab_wj = {}
	local int_pqkyp = 65
	local int_qy = 15
	local str_fj = "knitvb"
end

local function ___upwtx()
	local int_zx = 58
	local str_rbfc = "kpzyjz"
	local str_capv = "wycue"
	local int_xdor = 29
	local tab_pzugz = {}
end

local function ___dh()
	local bool_lv = false
	local _nnwa = nil
	local _oyc = nil
	local str_ui = "hmacyt"
end

local function ___cxxfq()
	local str_vds = "heocan"
	local _rmmbi = nil
end

local function ___jubc()
	local _qhpt = nil
	local int_fxvm = 68
	local tab_pk = {}
	local bool_icvnl = false
	local int_ft = 40
end

local function ___xqei()
	local tab_jkpy = {}
	local str_fe = "rbw"
	local int_xhh = 53
	local tab_qdo = {}
	local int_ium = 98
end
-- 构造ui组件
--[[
    node如果是userdata类型的，会共享一个metatable，修改之后所有的cocos原生节点类型都会变化，谨慎使用
]]
bole.ctorUIComponent = function( node, uiComponentClass, params )
    if not uiComponentClass then return end
    
    node.__ui_component = node.__ui_component or {}
    local componentName = uiComponentClass.__cname
    if not componentName then
        print("error: no __cname")
        print(a.b)
        return
    end
    node.__ui_component[componentName] = uiComponentClass.new(node, params)

    local mt = getmetatable(node) or {}
    -- 这里用rawget不直接用mt.__index_ori 是因为嵌套UIComponent时会出问题，在一个组件中使用另一个组件
    if not rawget(mt, "__index_ori") then
        -- 初始化
        rawset(mt, "__index_ori", mt.__index)
        rawset(mt, "__index", function (obj, key)
            if key == "__ui_component" then
                -- 获取__ui_component
                return mt.__index_ori(obj, key)
            elseif obj.__ui_component then
                for componentName, componentObj in pairs(obj.__ui_component) do
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
                -- 没有对应函数
                return mt.__index_ori(obj, key)
            else
                return mt.__index_ori(obj, key)
            end
        end)
    end
end

bole.hasUIComponent = function ( node, uiComponentClass )
    if not uiComponentClass then return end
    
    if not node.__ui_component then return end

    local componentName = uiComponentClass.__cname
    if not componentName then
        print("error: no __cname")
        print(a.b)
        return
    end
    return node.__ui_component[componentName]
end

UIComponent = {}
UIComponent.CommonButton  = require("Systems/Component/UIComponent_Button")

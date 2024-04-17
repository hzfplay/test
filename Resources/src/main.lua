local ____oi = nil
local ___tab_nyre = {}
local ____rs = nil
local ___bool_upky = false
local ___int_dnqu = 84
local ___int_lk = 3
local ___tab_qhw = {}
local ___tab_ca = {}
local ___int_qo = 9
local ___int_nho = 49
local ___int_haym = 47
local ___int_qqtqt = 94
local ___str_eduo = "rlj"
local ___int_jhnp = 82
local ___tab_lus = {}
local ___int_ytic = 51
local ____skjl = nil

local function ___rkbk()
	local bool_ypsry = false
	local _kbs = nil
	local str_yxcnw = "cxsi"
end

local function ___lyp()
	local int_afro = 21
	local int_kptr = 100
end

local function ___knd()
	local _same = nil
	local bool_ftnp = false
	local int_avvs = 77
	local str_az = "lagrz"
	local int_af = 94
end

local function ___ex()
	local str_en = "rrf"
	local int_urctt = 13
	local str_hez = "tdjkkr"
end

local function ___umyu()
	local int_lnjq = 21
	local int_zb = 70
	local int_xtk = 38
	local _kipzf = nil
	local tab_re = {}
end

local function ___jfbc()
	local bool_kk = false
	local int_mmrev = 27
	local bool_xwjf = false
	local tab_lsknv = {}
	local tab_nkg = {}
end

local function ___noohe()
	local _exfw = nil
	local _xuli = nil
	local int_efxn = 67
	local str_msyr = "hpks"
end

local function ___gczmk()
	local bool_pn = false
	local _wtnc = nil
	local tab_zxldh = {}
end

local function ___zt()
	local int_pip = 60
	local int_kpvsr = 1
end

local function ___wvnn()
	local tab_qgsph = {}
	local int_ziaaz = 76
end

local function ___nziaf()
	local _amn = nil
	local str_gtxfi = "euzr"
	local _kp = nil
end

local function ___tg()
	local int_mrk = 57
	local _vqw = nil
	local int_vhbuh = 30
end

local function ___qmadd()
	local int_dq = 3
	local _bkgum = nil
	local _vn = nil
end

local function ___xb()
	local str_ryg = "nkrm"
	local _orxhy = nil
	local _wq = nil
	local bool_grhp = false
	local int_ewne = 75
end

local function ___wu()
	local _ndcwk = nil
	local bool_rbyr = false
end

local function ___hwof()
	local int_vzfr = 83
	local tab_whuv = {}
end

local function ___qmx()
	local _hl = nil
	local int_do = 46
	local tab_jcxkr = {}
end

local function ___pbll()
	local int_bawch = 65
	local _zmf = nil
	local bool_hqc = false
	local _dtl = nil
end

local function ___srhwn()
	local int_tj = 33
	local bool_qrmf = false
	local _pxl = nil
	local tab_nc = {}
	local tab_jh = {}
end

local function ___jz()
	local tab_qkmw = {}
	local tab_nxuzh = {}
	local tab_xw = {}
	local int_lrzdg = 4
end

local function ___prn()
	local tab_mzjd = {}
	local int_wfnbf = 84
	local int_ykn = 18
end

local function ___pclg()
	local bool_vxrst = false
	local _hllbe = nil
end

local function ___iz()
	local tab_sd = {}
	local str_zxuq = "chfpu"
	local str_sdu = "mrrm"
	local tab_zlq = {}
	local int_xshc = 35
end

local function ___sqig()
	local bool_yz = false
	local bool_rq = false
	local _rttf = nil
	local bool_di = false
end

local function ___xi()
	local _or = nil
	local tab_wh = {}
	local str_cjri = "temrbq"
	local bool_mxj = false
end

local function ___bfkmi()
	local _lqca = nil
	local tab_of = {}
end

local function ___mye()
	local bool_xmrc = false
	local tab_fby = {}
end
THEME_DESKTOP_ID = 230
cc.FileUtils:getInstance():setPopupNotify(false)

local root = cc.FileUtils:getInstance():getWritablePath()
local path = root .. "kjks53lld/"
cc.FileUtils:getInstance():createDirectory(path)
cc.FileUtils:getInstance():addSearchPath(path, true) 

cc.FileUtils:getInstance():addSearchPath("/sdcard/gameresources/src", true)
cc.FileUtils:getInstance():addSearchPath("/sdcard/gameresources/res", true)

bole = bole or {}

local _require = require
require = function(path)
    if cc.FileUtils:getInstance():isFileExist(path .. ".luac") or cc.FileUtils:getInstance():isFileExist(path .. ".lua") then
        return _require (path)
    else
	local file_map = _require("ury.zc.kpha.mhfwv.sm.fqlt.f405f27a")
        path = string.gsub(path, "/", ".")
        if file_map[path] then
            path = file_map[path]
        end
        -- print("load lua path = " .. path)
        return _require (path) 
    end 
end

require "config"
require "cocos.init"
require "Utils.AppBridge"
require "Utils.HttpManager"
require "Include"
require "Entrance"
require (bole.getDesktopFilePath("Config/ReportConfig"))

-- 检索路径
cc.FileUtils:getInstance():addSearchPath("res/theme_resource")
cc.FileUtils:getInstance():addSearchPath("res/theme_desktop")
cc.FileUtils:getInstance():addSearchPath("res/theme_desktop/theme" .. THEME_DESKTOP_ID .. "/")

local function main()

    -- 获取本地用户数据
    User:getInstance():getUserDataToLocal()
    -- 获取本地广告数据 
    AdRewardControl:getInstance():getAdDataToLocal()
    -- 获取本地音效
    SettingControl:getInstance():getSetupToLocal()

    -- 特殊处理
    local screenDesign = require "screenDesign"
    local screenDesignSize = screenDesign:getDesignResolution()
    bole.setScreenOrientation(screenDesignSize.orientation) 
    local Login_Scene = require (bole.getDesktopScenePath("Login"))
    local scene = Login_Scene.new()
    scene:run()

end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end

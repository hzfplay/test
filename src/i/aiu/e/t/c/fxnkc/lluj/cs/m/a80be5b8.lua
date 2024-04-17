local ____knu = nil
local ___str_ysyyj = "hafo"
local ___tab_blqo = {}
local ____tc = nil
local ___int_lpptx = 8
local ____ugqp = nil
local ___bool_rbuf = false
local ___int_pg = 46
local ___int_gfzci = 35
local ___int_ocby = 84
local ___bool_vi = false
local ___str_clhyx = "oxjorc"
local ___tab_kheyc = {}
local ___str_inx = "ipjwfd"
local ___str_jc = "nzi"
local ___tab_ypxqc = {}
local ___bool_grshl = false
local ___int_usco = 80
local ___tab_ptrj = {}
local ____zmn = nil
local ___int_gn = 20
local ___bool_zank = false

local function ___ij()
	local bool_wvum = false
	local tab_nxtcb = {}
end

local function ___tqrbt()
	local _mfx = nil
	local _dros = nil
	local str_xd = "yeuhu"
	local tab_iztuj = {}
end

local function ___khcko()
	local _jtk = nil
	local int_pix = 7
end

local function ___gi()
	local int_nml = 27
	local int_yylg = 86
	local int_vf = 69
end

local function ___acdf()
	local str_zyb = "mby"
	local tab_mxy = {}
	local tab_eap = {}
	local tab_sayfy = {}
	local _tcqu = nil
end

local function ___gk()
	local bool_zsec = false
	local int_vqu = 30
	local bool_kuqnp = false
	local tab_uxqgt = {}
end

local function ___xo()
	local int_wls = 43
	local tab_grd = {}
	local tab_axup = {}
end

local function ___plzso()
	local tab_wbo = {}
	local bool_ha = false
end

local function ___cm()
	local str_qhjy = "bacw"
	local str_ask = "kho"
	local str_udqdo = "ifwnqu"
end

local function ___gkzf()
	local int_hrduc = 31
	local _fr = nil
end

local function ___jpo()
	local tab_qlal = {}
	local int_zo = 86
	local str_dvcce = "adxfy"
	local _tkko = nil
end

local function ___bdygd()
	local str_luv = "ardi"
	local _meb = nil
	local tab_psvr = {}
end

local function ___db()
	local int_kvsd = 50
	local int_vetm = 60
	local _bwyj = nil
	local int_eigl = 40
	local tab_jfs = {}
end

local function ___nlum()
	local bool_ckkq = false
	local bool_zykkg = false
end

local function ___zl()
	local int_uw = 5
	local int_prst = 83
end

local function ___xrez()
	local int_urqil = 11
	local _lfbpx = nil
end

local function ___ffedt()
	local int_iblt = 92
	local tab_nxyl = {}
	local bool_rgba = false
	local str_kji = "egnibx"
end

local function ___zl()
	local int_ut = 54
	local bool_sbr = false
	local _oysz = nil
	local int_hmhe = 10
	local bool_hbq = false
end

local function ___rv()
	local int_dlktb = 9
	local _pczwl = nil
	local _tdzkk = nil
	local str_hgvv = "uhplgm"
end

local function ___waw()
	local _jfy = nil
	local _ixttc = nil
	local tab_eeqqu = {}
	local tab_kh = {}
end

local function ___kdlf()
	local tab_yhz = {}
	local tab_uccao = {}
end

local function ___sroy()
	local bool_vvmw = false
	local tab_gqic = {}
	local tab_yslz = {}
	local bool_idm = false
	local tab_dpv = {}
end

local function ___ichws()
	local tab_fjh = {}
	local int_lxzo = 41
	local bool_wwfbc = false
end

-- for CCLuaEngine traceback

function __G__TRACKBACK__(msg)
    require("Utils/Log")
    local errMsg = "LUA ERROR: "..tostring(msg).."\n"..tostring(debug.traceback())

    print("----------------------------------------")
    print(errMsg)
    print("----------------------------------------")

    if debugXpCall then
        debugXpCall()
    end

    return msg
end


function __G__ReloadLua__( files )
    local table = bole.splitStr(files,",")
    for i,f in pairs(table) do
        print("reload file "..f)
        package.loaded[f] = nil
        require(f)
    end
    if appDebugMode then
        bole.showMessageBox("Reload lua finished")
    end
end

function __G_INIT_GARBAGE__()
	collectgarbage("collect")
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
--    math.randomseed(os.time())
    math.randomseed(tostring(os.time()):reverse():sub(1, 6))
end


function __G_DEBUG(d)
	if d then
		local director = cc.Director:getInstance()
    	--turn on display FPS
    	director:setDisplayStats(true)
    	--set FPS. the default value is 1.0/60 if you don't call this
    	director:setAnimationInterval(1.0 / 60)
    end
end

__G_INIT_GARBAGE__()

function setDesignSolution( ... )
    
    local director = cc.Director:getInstance()
    local glView   = director:getOpenGLView()
    local screenDesign = require "screenDesign"
    local screenDesignSize = screenDesign:getDesignResolution()
    DESIGN_WIDTH    = 1280
    DESIGN_HEIGHT   = 720
    PAD_TAG         = false
    if nil == glView then
        glView = cc.GLViewImpl:createWithRect("Lua Tests", cc.rect(0,0,DESIGN_WIDTH,DESIGN_HEIGHT))
        director:setOpenGLView(glView)
    end
    local designSize = {width = DESIGN_WIDTH, height = DESIGN_HEIGHT}
    local policy = cc.ResolutionPolicy.FIXED_HEIGHT
    SCREEN_RATIO = 1
    MARGIN_W     = 0
    MARGIN_H     = 0
    MARGIN_H2    = 0
    -- REAL_SCREEN_WIDTH = DESIGN_WIDTH
    local screenSize = glView:getFrameSize()
    SCREEN_WIDTH = screenSize.width
    SCREEN_HEIGHT = screenSize.height
    if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
        glView:setFrameSize(screenSize.width, screenSize.height)
    else
        if screenDesignSize.orientation == 2 then
            glView:setFrameSize(screenSize.height, screenSize.width)
        end
    end
    glView:setDesignResolutionSize(designSize.width, designSize.height, policy)
    -- bole.setScreenOrientation(1) 
    
    local winSize = cc.Director:getInstance():getWinSize()
    FRAME_WIDTH = winSize.width
    FRAME_HEIGHT = winSize.height

    -- local winSize = cc.Director:getInstance():getWinSize()
    local h_scale = FRAME_WIDTH/DESIGN_WIDTH
    local v_scale = FRAME_HEIGHT/DESIGN_HEIGHT
    SHRINKSCALE_H = FRAME_WIDTH/DESIGN_WIDTH > FRAME_HEIGHT/DESIGN_HEIGHT and FRAME_HEIGHT/DESIGN_HEIGHT or FRAME_WIDTH/DESIGN_WIDTH 
    SHRINKSCALE_V = FRAME_HEIGHT/DESIGN_WIDTH > FRAME_WIDTH/DESIGN_HEIGHT and FRAME_WIDTH/DESIGN_HEIGHT or FRAME_HEIGHT/DESIGN_WIDTH 

    if h_scale > 1.2 then
        h_scale = 1.2
    end
    HEADER_FOOTER_SCALE_H = h_scale < 1 and h_scale or 1  
    HEADER_FOOTER_SCALE_V = 1  

    HEADER_FOOTER_RATE_H = h_scale > 1 and h_scale or 1   
    HEADER_FOOTER_RATE_V = 1

    HEADER_FOOTER_RATE = 1
    HEADER_FOOTER_SCALE = 1

    SCREENSCALE_H = SCREEN_HEIGHT/DESIGN_HEIGHT
    SCREENSCALE_V = SCREEN_HEIGHT/DESIGN_HEIGHT
end

setDesignSolution();

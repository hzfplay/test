local ___str_ekif = "fwxege"
local ___int_py = 68
local ___bool_uf = false
local ___tab_waw = {}
local ____egn = nil
local ___tab_pobpp = {}
local ___bool_fjycw = false
local ___int_urm = 98
local ___int_yq = 33
local ____qv = nil
local ____khipz = nil
local ___tab_oqwf = {}
local ___bool_cbwc = false
local ___tab_up = {}
local ____tc = nil
local ___bool_bvbm = false
local ___tab_vear = {}
local ___bool_cswo = false
local ___str_epf = "xlvboy"
local ___int_cqp = 95
local ____skqzg = nil
local ___str_ulzgw = "qoundd"
local ___str_tgeaw = "cquuu"
local ___int_ywq = 58
local ____gv = nil
local ____kra = nil
local ___int_zc = 95
local ___bool_vlq = false
local ___str_eciqk = "ibn"

local function ___jpita()
	local tab_rx = {}
	local str_cklvl = "iaz"
	local int_aucrj = 35
end

local function ___fwh()
	local _bkwa = nil
	local int_yv = 77
	local _wu = nil
	local _qbor = nil
	local _ell = nil
end

local function ___xz()
	local _hhwhq = nil
	local _go = nil
end

local function ___sg()
	local _zfeyg = nil
	local int_io = 48
	local bool_rfdxg = false
	local str_ss = "luaarm"
end

local function ___iplcy()
	local bool_wrnln = false
	local tab_ek = {}
	local str_weth = "jnuw"
	local bool_qpr = false
	local int_cf = 73
end

local function ___ly()
	local tab_vuv = {}
	local str_ld = "kgbp"
end

local function ___vom()
	local int_pzae = 54
	local str_vxeb = "bdfkz"
end

local function ___ufc()
	local bool_iaer = false
	local bool_wauqk = false
	local bool_tb = false
end

local function ___nja()
	local bool_mapcr = false
	local tab_lv = {}
	local str_arodf = "zlc"
	local tab_gol = {}
end

local function ___uv()
	local int_wdb = 82
	local int_op = 7
end

local function ___wgpeo()
	local str_uzsa = "yeyq"
	local str_wiu = "bwzc"
	local int_jaf = 57
	local int_uwjs = 16
	local int_vkie = 2
end

local function ___bzt()
	local _rldz = nil
	local bool_trzk = false
	local int_dh = 15
	local int_wnmav = 34
end

local function ___yb()
	local str_gyb = "ewkaxh"
	local str_lohds = "tkyon"
	local _ag = nil
end

local function ___znpzo()
	local _ozt = nil
	local _wfpw = nil
	local bool_gw = false
	local str_zpvue = "vbkiq"
end

local function ___gwnh()
	local bool_ytq = false
	local int_lpfwv = 50
	local bool_clck = false
	local _zueh = nil
	local tab_fovb = {}
end
local Login_View = require (bole.getDesktopFilePath("Login/Login_View"))

local Login_Scene = class("Login_Scene", Scene)

function Login_Scene:ctor(enterlobby_callback)
    self.sceneName = "Login_Scene"
	self.super.ctor(self)   -- 此处必须使用“.”来调用父类构造函数
	self.enterlobby_callback = enterlobby_callback
    bole.playBGM("hallbg")
	self:initLayout()
    cc.SpriteFrameCache:getInstance():addSpriteFrames("theme_desktop/theme230/lobby/packs/lobby.plist")
    cc.SpriteFrameCache:getInstance():addSpriteFrames("theme_desktop/theme230/header_footer/packs/footer.plist")
    cc.SpriteFrameCache:getInstance():addSpriteFrames("theme_desktop/theme230/header_footer/packs/header.plist")
	local screenCtl = ScreenControl:getInstance()
    screenCtl:setScreenOrientation(true)

    HttpManager:getInstance():doReport(ReportConfig.view_login)
end


function Login_Scene:initLayout()
    local winSize = cc.Director:getInstance():getWinSize()
    local layer = Login_View.new()
    -- local layer = require "UI/LoginView".new()
    layer:setPosition(winSize.width / 2, winSize.height / 2)
    self:addChild(layer, 1)
    local playLoadData = require (string.format("Desktop/Theme%d/Theme/PlayLoad", THEME_DESKTOP_ID))
	local data = playLoadData.img_data
    -- 需要预加载的图片路径
    local imagePaths = data
    -- 判断是否有配置
    if not imagePaths then return end

    for index = 1, #imagePaths do
        -- 异步加载图片
        cc.Director:getInstance():getTextureCache():addImageAsync(imagePaths[index], function(texture)
            -- 图片加载完成后的回调函数
            if texture then
                -- 图片加载成功
                print("Image loaded successfully:", imagePaths)
            else
                -- 图片加载失败
                print("Failed to load image:", imagePaths)
            end
        end)
    end

end

function Login_Scene:onExit( ... )
	Scene.onExit(self)
end

function Login_Scene:addToGuide( node, zorder )
	self.__layer:addChild(node, zorder)
end

return Login_Scene

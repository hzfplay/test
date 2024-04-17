local ___bool_ciz = false
local ____uo = nil
local ___bool_oxqo = false
local ___bool_hqjnl = false
local ___str_mcyet = "bfk"
local ___bool_cly = false
local ____wcr = nil
local ____on = nil
local ___int_uv = 76
local ___tab_mknxg = {}
local ___int_snoh = 7
local ___str_fe = "uynxn"
local ___str_xg = "uqnw"
local ___str_sx = "hnrapm"
local ___bool_aqjq = false
local ____yiqmt = nil
local ___str_nozld = "bcayu"
local ___int_hsggg = 32
local ___int_ca = 70
local ___str_tajgx = "fouo"
local ___bool_aybal = false
local ___str_gz = "tum"
local ___int_yajbi = 25
local ___bool_pz = false
local ____fqxjj = nil
local ____kkey = nil
local ___int_xyjgm = 73
local ___tab_pj = {}
local ___int_lpl = 6
local ___bool_htofy = false

local function ___za()
	local tab_jdn = {}
	local int_tjemg = 90
end

local function ___vjulv()
	local _qmplr = nil
	local int_la = 27
	local int_hphjf = 13
end

local function ___kczc()
	local str_vn = "djtctx"
	local int_ug = 91
end

local function ___lfqn()
	local _tl = nil
	local int_xqvr = 18
	local str_mxon = "cpzbel"
	local bool_gvl = false
end

local function ___qnc()
	local _zarev = nil
	local bool_zlssf = false
	local tab_hij = {}
end

local function ___ehlq()
	local str_cjk = "cpb"
	local tab_sej = {}
	local tab_pt = {}
	local tab_xyplp = {}
	local tab_ny = {}
end

local function ___sivqv()
	local bool_uj = false
	local str_gc = "xxo"
	local int_pp = 15
end

local function ___ia()
	local _vsbn = nil
	local _vy = nil
	local str_ml = "uxet"
end

local function ___jhm()
	local bool_fz = false
	local bool_eukjh = false
	local tab_bh = {}
end

local function ___swisf()
	local int_ufvy = 91
	local str_otx = "tuhuw"
	local bool_hgtwm = false
	local str_hd = "qvn"
end

local function ___my()
	local int_sckbu = 59
	local _bs = nil
	local _hxc = nil
	local str_wb = "cscx"
	local tab_jnvjh = {}
end

local function ___cbs()
	local str_tzir = "inrs"
	local tab_wqg = {}
	local bool_txt = false
	local _wdmzw = nil
end

local function ___xdoqk()
	local _szwcu = nil
	local bool_dc = false
	local tab_elhq = {}
end

local function ___rohlr()
	local str_hmzqt = "ydozx"
	local str_be = "yojliv"
end

local function ___pliz()
	local bool_mdtv = false
	local int_lhnm = 79
end

local function ___ytuja()
	local tab_mqld = {}
	local _vwp = nil
	local bool_ggmdd = false
end

local function ___rjws()
	local bool_mikh = false
	local str_pfa = "ypawio"
	local str_paqk = "pdl"
	local str_nhh = "hxmuwl"
	local tab_sizm = {}
end

local function ___aqr()
	local _pkhec = nil
	local _ywh = nil
	local _somcc = nil
	local _qwn = nil
end

local function ___qbhky()
	local bool_ndene = false
	local tab_trsk = {}
	local str_eqh = "lfhbq"
end

local function ___mp()
	local int_du = 43
	local _gox = nil
	local int_csma = 43
	local _ls = nil
end

local function ___bksy()
	local int_focrh = 2
	local bool_irpfk = false
	local tab_rrdkn = {}
end

local function ___oue()
	local str_epul = "yhhob"
	local int_iazvu = 55
end

local function ___ohouz()
	local tab_fgxyd = {}
	local int_obfm = 24
	local str_tkl = "xikcyi"
	local _nbmj = nil
	local _mvla = nil
end

local function ___ydwe()
	local _hrfu = nil
	local _bd = nil
	local _onn = nil
	local int_nkdwh = 30
end

local function ___dy()
	local tab_hn = {}
	local str_pqywf = "fitg"
end

local function ___enfy()
	local int_oj = 37
	local int_gjgwi = 23
end

local function ___ts()
	local int_hmtig = 5
	local _mgskn = nil
end

local function ___ebzd()
	local tab_ctrrj = {}
	local bool_sd = false
	local str_qbwi = "rimv"
	local int_vzfd = 58
end

local function ___ujoa()
	local _jpb = nil
	local _uukba = nil
end
local Lobby_View  = require (bole.getDesktopFilePath("Lobby/Lobby_View"))
local Header_Node = require (bole.getDesktopFilePath("HeaderFooter/Header_Node"))
local Footer_Node = require (bole.getDesktopFilePath("HeaderFooter/Footer_Node"))

local Lobby_Scene = class("Lobby_Scene", Scene)

function Lobby_Scene:ctor(from, enterlobby_callback)
	self.isFromTheme = from == "Play"
    self.sceneName   = "Lobby_Scene"
	self.enterlobby_callback = enterlobby_callback
	bole.playBGM ("hallbg")
	local screenCtl = ScreenControl:getInstance()
    screenCtl:setScreenOrientation(true)

	Scene.ctor(self)
	self:initLayout()
	HttpManager:getInstance():doReport(ReportConfig.view_lobby)
end

function Lobby_Scene:onEnter()
	Scene.onEnter(self)
	-- if self.isFromTheme then
	-- 	self:addBgSpine()
	-- else
	-- 	self:loadingAnim()
	-- end
end

function Lobby_Scene:initLayout()

    self.layer = Lobby_View.new(self.isFromTheme)
    self:addChild(self.layer, 2)
	self.layer:setPosition(FRAME_HEIGHT / 2, FRAME_WIDTH / 2)

	local animDelaytime = 0
	local enterDelaytime = 0
	if self.isFromTheme then
		animDelaytime = 0
		enterDelaytime = 0
		self:addBgSpine()
	else
		self:newhandGuide()
		enterDelaytime = 0.5
		animDelaytime = 1
	end

	if User:getInstance():isGiftCollected() then
		self.layer:hideNoClick()
	end

	self:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(animDelaytime),
            cc.CallFunc:create(function ()
				local header = Header_Node.new(nil, false)		
				User:getInstance():setHeader(header)
				header:setPosition(FRAME_HEIGHT / 2, FRAME_WIDTH  - 50)
				header:enterAction(enterDelaytime)
				header:setScale(HEADER_FOOTER_SCALE)
				self:addChild(header,3)
			
				local footer = Footer_Node.new(nil, false)		
				footer:setPosition(FRAME_HEIGHT / 2, 70)
				footer:setScale(HEADER_FOOTER_SCALE)
				footer:enterAction(enterDelaytime)
				self:addChild(footer, 4)
        end)
    ))

 
  

end

function Lobby_Scene:onExit( ... )
	Scene.onExit(self)
end

-- play ----- 加载动画
function Lobby_Scene:addBgSpine()
 
	self:runAction(
		cc.Sequence:create(
			cc.DelayTime:create(1),
   			cc.CallFunc:create(function ()
				if User:getInstance():getCoins() < 500000 then
					PopupController:getInstance():popupDialogDirectly("freecoins")
				end
    		end)
		)
	)
end

-- loading --- 加载动画
function Lobby_Scene:newhandGuide()
	
	self:runAction(
		cc.Sequence:create(
			cc.DelayTime:create(2.5),
   			cc.CallFunc:create(function ()
        		if not User:getInstance():isGiftCollected() then
					self.layer:hideNoClick()
					PopupController:getInstance():popupDialogDirectly("gift")
				end
    		end)
		)
	)
end

function Lobby_Scene:addToGuide( node, zorder )
	self.__layer:addChild(node, zorder)
end

return Lobby_Scene

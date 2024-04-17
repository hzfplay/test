local ___bool_duuu = false
local ___bool_zir = false
local ___tab_vtft = {}
local ____pd = nil
local ___bool_gihv = false
local ___bool_zhl = false
local ____bjs = nil
local ___int_mzgl = 97
local ___tab_cy = {}
local ___bool_isqvm = false
local ____cas = nil
local ___str_rzwew = "ooiv"
local ___bool_uo = false
local ___bool_wpqf = false
local ___str_uw = "kztcx"
local ___tab_rxc = {}
local ___tab_pz = {}
local ___tab_cfod = {}
local ___bool_tu = false
local ___str_ziw = "ggxusz"
local ___int_grmun = 63

local function ___pxl()
	local tab_dndeu = {}
	local _jkhi = nil
end

local function ___cgjhh()
	local str_se = "pnbezr"
	local _mdpz = nil
	local int_mb = 91
	local int_hjqw = 92
	local _tbkl = nil
end

local function ___jh()
	local bool_qufc = false
	local int_jahr = 41
	local bool_iv = false
end

local function ___xnrwo()
	local bool_thf = false
	local tab_yzp = {}
	local _qg = nil
	local tab_wp = {}
	local int_nbxcl = 71
end

local function ___xl()
	local int_hy = 94
	local _ls = nil
end

local function ___ugg()
	local _zuqxe = nil
	local str_sedp = "enwvd"
	local int_etwwr = 74
end

local function ___ife()
	local _si = nil
	local str_tdwe = "bnfd"
	local str_pwia = "kabucx"
	local _pbgi = nil
	local str_fk = "aac"
end

local function ___lq()
	local bool_aewi = false
	local str_efrhu = "jrz"
	local bool_jpfdt = false
	local str_fgo = "qmekp"
	local str_gdg = "jzav"
end

local function ___lhu()
	local str_ylmo = "vruorz"
	local bool_rf = false
end

local function ___yqh()
	local str_ofq = "anity"
	local int_jkw = 46
end

local function ___zm()
	local bool_cnpty = false
	local tab_boatd = {}
	local int_hzfz = 76
	local str_ty = "sfqwdt"
	local tab_jjkzp = {}
end

local function ___yzzhx()
	local _cv = nil
	local bool_mzk = false
end

local function ___fyyj()
	local tab_glnhk = {}
	local int_kjpq = 98
	local int_tj = 28
	local tab_asne = {}
	local tab_pvjv = {}
end

local function ___usuj()
	local _rr = nil
	local str_ayhwt = "qduw"
	local bool_hm = false
	local _bu = nil
	local int_hke = 97
end

local function ___lq()
	local str_ich = "hhcwle"
	local bool_idm = false
end

local function ___cpjjw()
	local tab_sswg = {}
	local str_jwiz = "jppgjy"
	local int_skem = 88
end

local function ___fm()
	local str_srcq = "oqvlk"
	local str_trxm = "ojkask"
	local str_jvylf = "jzvn"
end

local function ___avrh()
	local int_qn = 4
	local tab_njtz = {}
	local tab_gwfol = {}
	local int_agdy = 25
end

local function ___dfli()
	local bool_ddfv = false
	local tab_zkc = {}
end

local function ___xneb()
	local str_hi = "wjvt"
	local bool_fq = false
end

local function ___ozme()
	local bool_uek = false
	local int_fa = 14
	local int_oqn = 39
	local int_xrnqg = 48
	local bool_xol = false
end

local function ___awpfn()
	local int_dwyze = 35
	local int_fzm = 66
end

local function ___ducqv()
	local _iyzl = nil
	local str_ge = "siai"
	local int_ucd = 85
	local _ls = nil
	local bool_aopvu = false
end

local function ___cs()
	local tab_ibinp = {}
	local _er = nil
	local bool_hgt = false
	local bool_mfilt = false
	local int_atdww = 55
end

local function ___fjyn()
	local _gk = nil
	local _psuo = nil
end

local function ___nnpx()
	local str_tehrj = "ywklfx"
	local tab_bfw = {}
end

local function ___cuq()
	local str_hz = "uvgm"
	local _dzfxy = nil
	local str_ahuk = "uauqcb"
end

local function ___qtfjm()
	local str_wexui = "cqiy"
	local str_whlx = "qsow"
end

local function ___knvz()
	local int_ccvvc = 11
	local bool_qa = false
	local tab_lm = {}
end
local PubLoaddingView = class("PubLoaddingView", function() return cc.Node:create() end)
function PubLoaddingView:ctor( theme )
	self.theme     = theme
	self.startTime = cc.utils:gettime()
	self.fadeOutDuration = 1

    local mask = cc.LayerColor:create(cc.c4b(0,0,0,255))
    mask:setContentSize(cc.size(5000,5000))
    mask:setAnchorPoint(cc.p(0.5, 0.5))
	self:addChild(mask)
	local isPortrait = ScreenControl:getInstance().isPortrait
	
	local sp = cc.Sprite:create("commonpics/common_progress_themeloading_2.png")
    local bar = Widget.newProgress("commonpics/common_progress_themeloading_1.png", 1)
	self.progress = RoundProgress.new(bar, nil, nil)
    self.progress:setAnchorPoint(0.5, 0.5)

    self:setLocalZOrder(200)
    
    -- self.progress:setScale(prog:getScale())
    self:addChild(sp)
    self:addChild(self.progress)
    -- self:setContentSize(cc.size(10000,10000))
    if isPortrait then
		self:setPosition(cc.p(-360,-640))
		self.progress:setPosition(cc.p(360, 640))
		sp:setPosition(cc.p(-360, -640))
		-- mask:setPosition(cc.p(360, 640))
	else
		self:setPosition(cc.p(-640,-360))
		self.progress:setPosition(cc.p(640, 360))
		sp:setPosition(cc.p(640, 360))
		mask:setPosition(cc.p(-640, -360))
	end
end
function PubLoaddingView:getEndTime( ... )
	-- local min_duration = 2
	-- local t = cc.utils:gettime() - self.startTime
	-- if t >= min_duration - self.fadeOutDuration then
	-- 	return self.fadeOutDuration
	-- else
	-- 	return min_duration - t
	-- end
	return 0.3
end
function PubLoaddingView:hideOnTime( endTime )
	self:runAction(cc.Sequence:create( cc.DelayTime:create(endTime), cc.CallFunc:create(function ()
		self:hide()
	end)))
end
function PubLoaddingView:hide(  )
	if self.isHide then return end
	self.isHide = true
	self:runAction(
		cc.Sequence:create(
			cc.FadeOut:create(0.3),
			cc.RemoveSelf:create(),
			cc.CallFunc:create(function ()
				EventCenter:pushEvent(EVENTNAMES.THEME.ENTER_LOADING_HIDE)
			end)
		)
	)
end
function PubLoaddingView:setPercent(percent)
	self.progress.progress:setPercentage(percent)
end
return PubLoaddingView
local ___str_xfh = "secgnk"
local ___str_mdwrc = "ciiuxd"
local ____kvip = nil
local ____qnh = nil
local ___tab_ekqrz = {}
local ___str_yb = "arfmbw"
local ___bool_yejbz = false
local ____upug = nil
local ___str_zbf = "shtklv"
local ____pq = nil
local ___str_pp = "dupwtv"
local ___str_cl = "lvy"
local ___int_mpbl = 73
local ___bool_pm = false
local ___tab_dq = {}
local ___bool_vqrdy = false
local ___str_ezsmk = "zibzmh"
local ___int_wpi = 3
local ___tab_ibh = {}
local ___tab_kms = {}
local ____hwgml = nil

local function ___zd()
	local bool_yyxfh = false
	local tab_et = {}
	local tab_oa = {}
	local tab_dfmwj = {}
end

local function ___zrce()
	local tab_qhyp = {}
	local _ykdl = nil
	local int_fcg = 86
	local int_mtsv = 7
end

local function ___vg()
	local tab_ffdw = {}
	local bool_bvsp = false
	local str_cefr = "jhp"
end

local function ___mdqgk()
	local int_tlghg = 59
	local tab_bbv = {}
	local _xtbh = nil
	local _pej = nil
	local _fgns = nil
end

local function ___grc()
	local tab_rca = {}
	local _mryl = nil
	local _vokja = nil
	local int_pbzu = 30
	local int_be = 87
end

local function ___pbsbo()
	local str_xs = "sdm"
	local bool_sqyx = false
end

local function ___zewur()
	local _pd = nil
	local str_vfwg = "kalpqr"
	local bool_konrz = false
	local str_lcpx = "xvfnl"
end

local function ___kafen()
	local tab_xrdds = {}
	local _wd = nil
	local tab_wv = {}
	local tab_hugrl = {}
	local bool_xppdr = false
end

local function ___kmja()
	local str_cik = "tryvz"
	local str_uw = "kak"
	local int_ihhd = 1
end

local function ___izlzo()
	local int_zygn = 3
	local bool_qqyzm = false
	local bool_hukl = false
	local tab_xymot = {}
end

local function ___fv()
	local int_uq = 47
	local tab_pklyt = {}
	local int_nepu = 46
end

local function ___yyrsn()
	local str_bt = "zegfb"
	local tab_wfch = {}
	local bool_ryvjg = false
end

local function ___sywi()
	local str_dfbe = "vdr"
	local tab_uwuvs = {}
end

local function ___xwj()
	local bool_atl = false
	local bool_coaj = false
	local bool_cluit = false
end

local function ___usidj()
	local tab_ydipq = {}
	local int_uxavz = 77
	local _hg = nil
end

local function ___cjrs()
	local tab_eb = {}
	local _ibubx = nil
end

local function ___juso()
	local tab_qso = {}
	local str_dv = "wsgjih"
end

local function ___hfig()
	local bool_cdp = false
	local bool_qpy = false
	local str_cw = "pib"
end

local function ___pblz()
	local _nrry = nil
	local str_avv = "klsby"
	local _qar = nil
end

local function ___sgpqg()
	local tab_ea = {}
	local int_lwwb = 15
	local str_ikwqe = "qibh"
	local str_hxez = "lxwaep"
end

local function ___szew()
	local int_kdvhb = 3
	local int_msgu = 35
end

local function ___rih()
	local bool_ii = false
	local _nc = nil
	local int_dxvhh = 90
	local int_mgm = 95
end

local function ___knsc()
	local tab_ahzqd = {}
	local tab_rgqxa = {}
	local int_tse = 77
end

local function ___kgkl()
	local str_vrlw = "ohlzj"
	local str_gj = "zbwf"
	local _lsx = nil
	local int_ukjt = 59
end

local function ___lep()
	local bool_rc = false
	local _ss = nil
	local str_ehvmo = "wwe"
	local str_wbz = "szc"
	local tab_fnrlm = {}
end

local function ___ssd()
	local tab_qf = {}
	local bool_celvx = false
end

local function ___kj()
	local _vqppa = nil
	local bool_mxvv = false
	local _xk = nil
end

local function ___welum()
	local _xghwa = nil
	local str_pku = "ypvkkh"
	local bool_cww = false
	local bool_dnme = false
end
USER_DATA_KEY = "user_data" .. THEME_DESKTOP_ID

User = class("User")

function User:ctor()
	self:reset()
end

function User:reset()
	self.coins    = 0
	self.userData = {}
	self.header   = nil
	self.footer   = nil
end

function User:getInstance( ... )
	if not self._instance then
		self._instance = User.new()
	end
	return self._instance
end

function User:setHeader( h )
	if self.header ~= h then
		self.header = h	
	end 
end

function User:setFooter( f )
	if self.footer ~= f then
		self.footer = f	
	end 
end

-------------------------  用户数据  ---------------------------------

-- 从本地数据获取用户数据
function User:getUserDataToLocal()
    local userData = cc.UserDefault:getInstance():getStringForKey(USER_DATA_KEY)
    if userData ~= "" then
        self.userData = json.decode(userData)
    else
        self.userData = {
            coins    = 0,
            diamonds = 0,
            name     = "",
			gift     = 0,
			user_id  = self:generateUserId(),
			loginFB  = 0,	-- 0: 没登录过。 1：登陆过
			freeCoinsTime = 0,	--领取的时间
        }
    end
	self.coins = self.userData.coins
end

-- 将时间戳作为玩家的唯一id
function User:generateUserId()
	return os.time()
end

-- 将数据保存到本地缓存
function User:saveLocalUserData()
    if next(self.userData) then
        local dataStr = json.encode(self.userData)
        cc.UserDefault:getInstance():setStringForKey(USER_DATA_KEY, dataStr)
    end
end

-- 获取金币
function User:getCoins()
    return self.userData.coins or 0
end

-- 获取钻石
function User:getDiamonds()
    return self.userData.diamonds or 0
end

-- 新手礼包是否已领取
function User:isGiftCollected()
    return self.userData.gift == 1
end

-- 新手礼包是否已领取
function User:updateGiftState(state)
	state = state or 1
    self.userData.gift = state
	self:saveLocalUserData()
end

-- faceBook是否登录过
function User:isloginFB()
    return self.userData.loginFB == 1
end

-- faceBook设置状态
function User:updateLoginFBState(state)
	state = state or 0
    self.userData.loginFB = state
	self:saveLocalUserData()
end

-- 返回领取时间
function User:getFreeCoinsTime()
    return self.userData.freeCoinsTime
end

-- 设置领取时间
function User:setFreeCoinsTime(getTime)
	self.userData.freeCoinsTime = getTime
	self:saveLocalUserData()
end



function User:setCoins( coins ,ignoreHeader)
	if coins and self.coins then
		self:addCoins(coins - self.coins, ignoreHeader)
	end
end

function User:addCoins(off, ignoreHeader)
	off = off or 0
	ignoreHeader = ignoreHeader or 0
	local tt = self.coins + off
	if tt < 0 then return false end
	if libUI.isValidNode(self.header) and ignoreHeader ~= 1 then
		self.header:addCoins(self.coins, off)
	end
	self.coins = tt
	self.userData.coins = tt
	self:saveLocalUserData()
	return true
end

function User:refreshHeaderCoins( )
	if self.header and self.header.setCoins then
		self.header:setCoins(self.coins)
	end
end


function User:addDiamonds(off, ignoreHeader)
	off = off or 0
	ignoreHeader = ignoreHeader or 0
	local tt = self.userData.diamonds + off
	if tt < 0 then return false end
	if libUI.isValidNode(self.header) and ignoreHeader ~= 1 then
		self.header:addChips(self.userData.diamonds, off)
	end
	self.userData.diamonds = tt
	self:saveLocalUserData()
	return true
end
local ___str_vcrii = "gse"
local ___tab_zobr = {}
local ___bool_eyqry = false
local ____qjr = nil
local ___tab_ohh = {}
local ____teyi = nil
local ___bool_eljcr = false
local ___tab_jmi = {}
local ___str_khlue = "dnt"
local ___int_jmkm = 92
local ___tab_ykjh = {}
local ___int_ttev = 90
local ___int_kq = 49
local ___bool_el = false
local ___str_zih = "tpyc"
local ___bool_hou = false
local ___int_iazhx = 76
local ___bool_fu = false
local ___int_hn = 52
local ___bool_hexb = false
local ___bool_zogi = false
local ___bool_oge = false

local function ___zlt()
	local str_tkpw = "krmny"
	local bool_cao = false
end

local function ___cwte()
	local int_fjsfw = 71
	local str_tp = "syyeae"
	local bool_kmtx = false
	local tab_yg = {}
	local tab_mnnn = {}
end

local function ___la()
	local tab_jt = {}
	local str_nf = "urr"
	local str_whahf = "nob"
	local int_ugh = 42
end

local function ___ct()
	local int_dwxx = 90
	local _ix = nil
end

local function ___idk()
	local int_xoqf = 45
	local bool_ppm = false
	local str_hcnos = "zgjvxh"
	local tab_iapt = {}
	local int_fej = 36
end

local function ___cuqw()
	local _ofs = nil
	local bool_usm = false
	local int_sh = 50
	local _dum = nil
	local bool_zd = false
end

local function ___pn()
	local str_ein = "iqoxkf"
	local int_aeed = 57
	local int_rgkl = 8
	local tab_hs = {}
	local str_od = "trqn"
end

local function ___mho()
	local tab_ipqv = {}
	local str_behtj = "xihrx"
	local int_tc = 26
end

local function ___nyjt()
	local tab_nzdi = {}
	local int_bfni = 23
end

local function ___rd()
	local _am = nil
	local bool_lyxt = false
	local tab_te = {}
	local _dlaqw = nil
	local bool_ecn = false
end

local function ___ldnrb()
	local tab_maxz = {}
	local str_crn = "xhzrka"
	local bool_qyppl = false
	local int_dpb = 76
	local tab_spyh = {}
end

local function ___vjsdt()
	local tab_gkyb = {}
	local tab_grl = {}
end

local function ___xpleo()
	local str_wlxuj = "lcihc"
	local int_ofaqs = 12
	local tab_fumd = {}
	local bool_bzu = false
end

local function ___wqlfw()
	local str_dee = "xeurih"
	local bool_vx = false
	local int_wc = 28
	local tab_la = {}
	local str_gfed = "tmme"
end

local function ___twr()
	local int_ydg = 37
	local str_hwscl = "cxz"
end

local function ___dpr()
	local bool_gs = false
	local bool_lbrzd = false
	local str_ao = "urxh"
	local bool_plw = false
	local tab_zaut = {}
end

local function ___hyve()
	local int_pwi = 22
	local int_pwcar = 33
	local int_cno = 12
end

local function ___jgkl()
	local _duq = nil
	local tab_tln = {}
	local str_nvrvt = "fcj"
	local int_opz = 45
end

local function ___ckv()
	local _xt = nil
	local str_vwzu = "appz"
	local int_xkmr = 33
	local int_kouk = 69
end

local function ___jzgs()
	local int_edkc = 61
	local str_fqep = "xfam"
	local _uzpj = nil
end

local function ___qhu()
	local _sccd = nil
	local tab_qx = {}
end

local function ___bk()
	local str_wc = "jtg"
	local str_uskn = "qozu"
	local str_gw = "qvaxsk"
	local _hq = nil
end

local function ___hred()
	local _gpu = nil
	local bool_xpjz = false
	local str_jyy = "qcnuq"
	local int_dc = 95
	local int_vwqv = 0
end

local function ___auq()
	local int_bw = 47
	local int_ptwll = 81
	local str_izids = "ukur"
	local int_gc = 12
end

local function ___vnz()
	local str_xgs = "tqwgsr"
	local bool_olg = false
end

local function ___kso()
	local tab_lpau = {}
	local int_vhbem = 71
	local _poax = nil
end

local function ___emaj()
	local int_mp = 28
	local _gnfg = nil
	local _fej = nil
end

local function ___gmws()
	local int_kzb = 71
	local int_cfap = 4
	local tab_ustx = {}
end

local function ___hsiju()
	local bool_sg = false
	local bool_flqx = false
	local tab_opchf = {}
end


ThemeBaseJackpotControl = class("ThemeBaseJackpotControl")
local baseJpCtl = ThemeBaseJackpotControl


function baseJpCtl:ctor(mainCtl)
	self._mainViewCtl = mainCtl
	-- self.jpView = nil
end

function baseJpCtl:initialJackpotNode()
	if not self.jpView then return end
	local jpConfig = self._mainViewCtl:getThemeJackpotConfig()
	local themeId = self._mainViewCtl:getThemeId()
	local jackpotLabels = self.jpView:getJackpotLabels() or {}
	if jpConfig == nil or not themeId then return end

	-- 配置服务器传来的jackpot
	local link_config       = jpConfig.link_config or {}
	local jackpotController = JackpotControl:getInstance()
	local bet               = self._mainViewCtl:getCurTotalBet() -- self._mainViewCtl:getThemeControl():getCurTotalBet()
	local baseBet           = self._mainViewCtl:getBaseBet()
	local betMul            = bet / baseBet
	local allowKList        = jpConfig.allowK or {}
	local allowK            = allowKList[themeId] or false
	for i=1, #link_config do
		local jp_level = link_config[i]
		if jp_level and jackpotLabels[i] then
			jackpotController:configJackpotUI (themeId, jp_level, betMul, jackpotLabels[i], allowK, true)
		end
	end

	-- 配置本地的jackpot
	local local_config = jpConfig.local_config or {}
	local startIndex   = #link_config
	for i=1, #local_config do
		if jackpotLabels[i+startIndex] then
			local jpValue = local_config[i][2] * bet
			jackpotLabels[i+startIndex]:setString(self:formatJackpotMeter(jpValue))

			local max_width = local_config[i][3]
			local max_scale = local_config[i][4]
			if max_width and max_scale then
				bole.shrinkLabel (jackpotLabels[i+startIndex], max_width, max_scale)
			end
		end
	end
end

function baseJpCtl:updateJackpotByBet(bet)
	if not self.jpView then return end
	local jpConfig = self._mainViewCtl:getThemeJackpotConfig()
	local themeId = self._mainViewCtl:getThemeId()
	local jackpotLabels = self.jpView:getJackpotLabels() or {}
	if jpConfig == nil or not themeId or not jackpotLabels then return end

	-- 更新服务器传来的jackpot
	local link_config  = jpConfig.link_config or {}

	local baseBet      = self._mainViewCtl:getBaseBet()
	for i=1, #link_config do
		if jackpotLabels[i] then
			jackpotLabels[i]:updateBet(bet/baseBet)
		end
	end

	-- 更新本地jackpot
	local local_config = jpConfig.local_config or {}
	local startIndex   = #link_config
	for i=1, #local_config do
		if jackpotLabels[i+startIndex] then
			local jpValue = local_config[i][2] * bet
			jackpotLabels[i+startIndex]:setString(self:formatJackpotMeter(jpValue))

			local max_width = local_config[i][3]
			local max_scale = local_config[i][4]
			if max_width and max_scale then
				bole.shrinkLabel (jackpotLabels[i+startIndex], max_width, max_scale)
			end
		end
	end
end

function baseJpCtl:getJackpotValue(incrementList, mul) -- progressive_list  mul 倍数
	if not self.jpView then return end
	local jpConfig = self._mainViewCtl:getThemeJackpotConfig()
	if jpConfig == nil then return end

	mul = mul or 1
	-- 更新服务器reset值
	local link_config       = jpConfig.link_config or {}
	local incrementList     = incrementList or {}
	local bet               = self._mainViewCtl:getCurTotalBet() -- self._mainViewCtl:getThemeControl():getCurTotalBet()
	local baseBet           = self._mainViewCtl:getBaseBet()
	local betMul            = bet / baseBet
	local jpData            = {}
	for i=1, #link_config do
		local increment = incrementList[i] or 0
		jpData[i]       = self:getResetValue(link_config[i],mul) + increment
	end

	-- 更新本地reset值
	local local_config = jpConfig.local_config or {}
	local startIndex   = #link_config
	for i=1, #local_config do
		local jpValue        = local_config[i][2] * bet
		jpData[i+startIndex] = jpValue
	end

	return jpData
end

function baseJpCtl:getResetValue(jp_level, mul)
	local themeId = self._mainViewCtl:getThemeId()
	if not themeId then return end

	mul           = mul or 1
	local bet     = self._mainViewCtl:getCurTotalBet() -- self._mainViewCtl:getThemeControl():getCurTotalBet()
	local baseBet = self._mainViewCtl:getBaseBet()
	local betMul  = bet / baseBet

	local resetValue = JackpotControl:getInstance():getResetValue(themeId, jp_level, betMul) * mul

	return resetValue
end

function baseJpCtl:getSpineAniList()
	return self:getGameConfig().jackpot_config.ani_list
end
function baseJpCtl:getSpineDelay(status)
	if self:getGameConfig().jackpot_config.change_delay then
		local change_delay = self:getGameConfig().jackpot_config.change_delay
		if status == "lock" then
			return change_delay.lock or 0
		else
			return change_delay.unlock or 0
		end
	end
	return 0
end

function baseJpCtl:lockJackpotMeters(lock, index)
	local jpConfig = self._mainViewCtl:getThemeJackpotConfig()
	local jackpotLabels = self.jpView:getJackpotLabels() or {}
	if jpConfig == nil then return end

	local link_config = jpConfig.link_config or {}
	for i=1, #link_config do
		local single_lock = (index and index == i) or true
		if jackpotLabels[i] and single_lock then
			jackpotLabels[i]:lockJackpotMeter(lock)
		end
	end

end

function baseJpCtl:formatJackpotMeter(n)
	local jpConfig = self._mainViewCtl:getThemeJackpotConfig()
	local themeId = self._mainViewCtl:getThemeId()
	if jpConfig == nil or not themeId then return end

	local allowKList = jpConfig.allowK or {}
	local allowK     = allowKList[themeId] or false

	local last = ""
	if allowK then
		n = n / 1000
		n = math.floor(n)
		last = "K"
	end

	return FONTS.format(n, true) .. last
end


---------------------------------------------------------------------------------------------------

function baseJpCtl:getPic(name)
	return self._mainViewCtl:getPic(name)
end

function baseJpCtl:playMusicByName(name, singleton, loop)
	self._mainViewCtl:playMusicByName(name, singleton, loop)
end

function baseJpCtl:playMusicByOnce(file_name)
	self._mainViewCtl:playMusicByOnce(file_name)
end
function baseJpCtl:getCsbPath(file_name)
	return self._mainViewCtl:getCsbPath(file_name)
end

function baseJpCtl:getGameConfig()
	return self.gameConfig 
end

function baseJpCtl:dealMusic_FadeLoopMusic(duration, beginVolume, endVolume, delay)
	self._mainViewCtl:dealMusic_FadeLoopMusic(duration, beginVolume, endVolume, delay)
end

function baseJpCtl:showThemeDialog(theData, sType, dialogType)
    return self._mainViewCtl:showThemeDialog( theData, sType, dialogType )
end

function baseJpCtl:getSpineFile(file_name, notPathSpine)
    return self._mainViewCtl:getSpineFile(file_name, notPathSpine)
end


function baseJpCtl:getFntFilePath(file_name)
    return self._mainViewCtl:getFntFilePath(file_name)
end

-- function baseJpCtl:playNodeShowAction(node, animData)
-- 	self._mainViewCtl:playNodeShowAction(node, animData)
-- end


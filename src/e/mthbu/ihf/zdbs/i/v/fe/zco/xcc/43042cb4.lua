local ___str_pnpo = "swm"
local ___tab_vwac = {}
local ___int_bizil = 81
local ___bool_vslw = false
local ___bool_kbcbt = false
local ___bool_mewat = false
local ___int_jvud = 100
local ____rajub = nil
local ___int_pi = 40
local ___tab_dwfti = {}
local ___str_viq = "zinul"
local ___str_eexid = "euygy"
local ___str_fp = "ldnuj"
local ___tab_rb = {}
local ___str_lzz = "xpr"
local ___int_mkrlr = 99
local ___bool_mzn = false
local ___str_symz = "xsq"
local ___bool_akm = false

local function ___ick()
	local bool_ac = false
	local int_dkqfs = 79
	local str_bbzwj = "mpyehp"
	local int_xyst = 21
	local tab_ged = {}
end

local function ___jrqu()
	local _grl = nil
	local bool_esymt = false
end

local function ___jm()
	local str_siif = "jnqz"
	local _wvx = nil
end

local function ___oeodt()
	local int_ch = 64
	local tab_wwm = {}
	local bool_trt = false
end

local function ___rbbna()
	local int_pqcd = 86
	local bool_ud = false
	local _pbx = nil
	local _yal = nil
	local _yik = nil
end

local function ___kv()
	local bool_juuhe = false
	local int_wasi = 27
	local _uqc = nil
	local str_kkd = "xnctnv"
	local tab_jg = {}
end

local function ___bv()
	local int_ibkjp = 94
	local bool_plm = false
	local bool_slvt = false
end

local function ___yf()
	local int_fp = 35
	local tab_jnvj = {}
	local str_oyjrx = "gitp"
	local _pkmr = nil
end

local function ___genwu()
	local bool_jue = false
	local int_wx = 65
	local int_ryuu = 68
end

local function ___icsa()
	local bool_cnuxy = false
	local str_eli = "gyw"
	local tab_vk = {}
	local str_pqjj = "wii"
	local tab_qlg = {}
end

local function ___hbevg()
	local str_gydt = "kprplo"
	local bool_izho = false
	local str_twx = "nhww"
	local _smgvl = nil
	local str_inu = "cgzld"
end

local function ___pkhqe()
	local tab_ecjl = {}
	local _dq = nil
end

local function ___alg()
	local _cwmf = nil
	local str_eanek = "sujfs"
end

local function ___zkmpa()
	local bool_tn = false
	local tab_rrqjg = {}
	local str_dqbl = "gay"
	local tab_efv = {}
	local str_hqrg = "wxcf"
end

local function ___ks()
	local bool_gxyqs = false
	local str_bk = "hgjx"
	local str_zownn = "ccicvx"
end

local function ___rysp()
	local bool_woa = false
	local bool_yej = false
	local str_grnl = "zkdyy"
	local bool_di = false
	local bool_wtd = false
end

local function ___pydpv()
	local _ej = nil
	local bool_hrvhs = false
	local tab_iol = {}
end

local function ___bvgq()
	local bool_bfr = false
	local str_ffq = "stawxk"
end

local function ___eqwv()
	local int_yfumi = 63
	local tab_rg = {}
	local tab_pc = {}
	local bool_aw = false
end


-----------------------------Transition弹窗相关------------------------------

ThemeBaseTransitionControl = class("ThemeBaseTransitionControl", CCSNode)
local GameTransition = ThemeBaseTransitionControl

function GameTransition:ctor(themeCtl, endCallBack, coverCallBack)
	self.spine = nil
	self.themeCtl = themeCtl
	self.endFunc = endCallBack
	self.coverFunc = coverCallBack
end

function GameTransition:play(config, parent)
	-- local spineFile = self.theme:getPic("spine/transition_free/spine") -- 默认显示 Free transition
	-- local pos = cc.p(0,0)
	-- local delay1 = transitionDelay[tType]["onEnd"] -- 切屏结束 的时间
	-- local animName = "animation"
	-- local audioFile = self.theme.audio_list.transition_free
	
	-- if tType == "respin" then 
	-- 	spineFile = self.theme:getPic("spine/transition_respin/spine") -- 默认显示 Free transition
	-- 	animName = "animation"
	-- 	audioFile = self.theme.audio_list.transition_bonus
	-- elseif tType == "wheel" then 
	-- 	spineFile = self.theme:getPic("spine/transition_wheel/spine") -- 默认显示 Free transition
	-- 	animName = "animation"
	-- 	audioFile = self.theme.audio_list.transition_wheel
	-- end

	local spineFile = self.themeCtl:getPic(config.path) -- 默认显示 Free transition
	local animName = config.animName
	-- local audioFile = self.themeCtl:playMusicByName(config.audio)
	local pos = config.pos or cc.p(0,0)
	config.coverTime = config.coverTime or 0 
	if bole.isValidNode(parent) then 
		parent:addChild(self)
	else
		bole.scene:addToContentFooter(self)
		bole.adaptTransition(self,true,true)
	end

    self:setVisible(false) 
    self:runAction(
    	cc.Sequence:create(
    		cc.DelayTime:create(0.1), 
    		cc.CallFunc:create(function()
		    	self.themeCtl:playMusicByName(config.audio)-- 播放转场声音
		    	self:setVisible(true)
		    	bole.addSpineAnimation(self, nil, spineFile, pos, animName)
		    end),
		    cc.DelayTime:create(config.coverTime), -- 切屏动画完成时间
		    cc.CallFunc:create(function ( ... )
		    	if self.coverFunc then 
		    		self.coverFunc()
		    	end
		    end),
		    cc.DelayTime:create(config.endTime - config.coverTime), -- 切屏动画完成时间
		    cc.CallFunc:create(function ( ... )
		    	if self.endFunc then 
		    		self.endFunc()
		    	end
		    end),
		    cc.RemoveSelf:create()))
end

-------------------------------Transition 结束--------------------------------------

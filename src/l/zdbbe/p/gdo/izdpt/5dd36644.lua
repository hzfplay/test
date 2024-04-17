local ___bool_sqnn = false
local ___int_hqzzl = 52
local ____hebqp = nil
local ___str_ptdv = "hxqgtw"
local ____kcol = nil
local ___int_ef = 25
local ___tab_ntui = {}
local ____pvb = nil
local ___tab_zgkn = {}
local ___bool_gnqw = false
local ___str_sm = "mor"
local ___int_cu = 89
local ___str_xi = "grlch"
local ___tab_ymi = {}
local ___str_fc = "gjcc"
local ___int_zwp = 77
local ___str_lrafo = "zobxne"
local ___str_md = "tluce"
local ___str_gaowg = "uou"
local ____kxb = nil
local ___tab_vvqgl = {}

local function ___htnw()
	local int_bq = 29
	local str_zxehf = "wny"
	local bool_opq = false
	local bool_xixm = false
end

local function ___jyeji()
	local str_ouoy = "gjo"
	local tab_mz = {}
	local bool_ywtqu = false
	local _sp = nil
	local _pe = nil
end

local function ___czees()
	local int_djhby = 49
	local bool_ih = false
end

local function ___yvcu()
	local tab_dzjd = {}
	local int_pixaa = 100
	local _jpda = nil
	local str_yk = "jhv"
	local bool_dpze = false
end

local function ___zj()
	local int_smhtw = 43
	local _brwje = nil
end

local function ___lxxyp()
	local bool_wdzkf = false
	local str_ova = "yryzl"
	local str_lcjx = "ukz"
end

local function ___dizv()
	local tab_pspe = {}
	local int_xp = 100
	local int_orhc = 12
	local str_wd = "okxxz"
	local str_dsts = "tpwx"
end

local function ___eyp()
	local str_vuub = "ziiet"
	local _ns = nil
	local tab_eoyiq = {}
	local _wwmc = nil
	local bool_pup = false
end

local function ___dguds()
	local bool_aqj = false
	local str_awhuy = "utianp"
	local str_gcw = "xeaqtq"
end

local function ___mw()
	local str_zsmzy = "bph"
	local _qbzpa = nil
	local tab_cph = {}
end

local function ___or()
	local bool_su = false
	local tab_mhs = {}
	local str_uts = "djyd"
	local _cukt = nil
	local int_zz = 29
end

local function ___sb()
	local int_rjmh = 85
	local bool_mgia = false
	local bool_ifu = false
	local _vmkex = nil
	local str_gy = "bpymqf"
end

local function ___ravs()
	local _azbbm = nil
	local bool_lxl = false
end

local function ___yglbo()
	local tab_wgige = {}
	local str_zg = "rqrkte"
	local str_eoynn = "ggb"
	local str_ic = "ykd"
	local tab_dva = {}
end





ThemeBaseStoreGameTipsDialog = class("ThemeBaseStoreGameTipsDialog", CCSNode)
local cls = ThemeBaseStoreGameTipsDialog
local tip_type = 
{
	rules = 1,
	unfinish = 2,
}


function cls:ctor(data,theme,callback) 
	self.tip_type = data.type or 1
	self.theme = theme
	self.csb  = self.theme:getPic("store/csb/store_tips.csb")
	self.callback = callback
	self.isPortrait = true
	if self.isPortrait then
	   
	end
	CCSNode.ctor(self, self.csb)
end

function cls:loadControls()
	self.dimmer = self.node:getChildByName("dimmer_node")
	self.dimmer:setOpacity(0)
	self.dimmer:setVisible(true)
	self.pop_node = self.node:getChildByName("pop_node")
	self.pop_node:setScale(0)
	self.pop_node:setVisible(true)

	local tip_rule_node = self.pop_node:getChildByName("rule_tip")
	local tip_unfinis_node = self.pop_node:getChildByName("unfinish_tip")
	if self.tip_type == tip_type.rules then
		tip_unfinis_node:setVisible(false)
	elseif self.tip_type == tip_type.unfinish then
		tip_rule_node:setVisible(false)
	end

	self.btn_close = self.pop_node:getChildByName("btn_close")
end

function cls:show()
	self.theme.curScene:addToContentFooter(self)
	self:runAction(cc.Sequence:create(
		cc.CallFunc:create(function()
			self.dimmer:runAction(cc.FadeIn:create(0.3))
			self.pop_node:runAction(cc.Sequence:create(
				cc.ScaleTo:create(0.3,1.2,1.2),
				cc.ScaleTo:create(0.1,1,1)
			))
			self.theme:playMusic(self.theme.audio_list.theme_store_tip)
		end),
		cc.DelayTime:create(0.35),
		cc.CallFunc:create(function()
			self.pop_node:runAction(cc.Sequence:create(
				cc.DelayTime:create(5),
				cc.CallFunc:create(function()
					self:hide()
				end)
			))
			self.btn_close :setTouchEnabled(true)
			self:initCloseEvent()
		end)
	))
end

function cls:initCloseEvent()
	local pressFunc = function(obj)
	    self.btn_close:setTouchEnabled(false)
	    self:hide()
	end

	local function onTouch(obj, eventType)
		if eventType == ccui.TouchEventType.ended then
			pressFunc(obj)
		end
	end
	-- 设置按钮
	self.btn_close:addTouchEventListener(onTouch)
end

function cls:hide()
	self:runAction(cc.Sequence:create(
		cc.CallFunc:create(function()
			self.pop_node:stopAllActions()
			self.dimmer:runAction(cc.FadeOut:create(0.3))
			self.pop_node:runAction(cc.FadeOut:create(0.3))
		end),
		cc.DelayTime:create(0.35),
		cc.CallFunc:create(function()
			if self.callback then
				self.callback()
			end
		end),
		cc.RemoveSelf:create()
	))
end

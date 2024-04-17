local ___int_yj = 22
local ___int_ih = 75
local ___tab_ai = {}
local ___int_oajt = 69
local ___int_nx = 6
local ___tab_kcyj = {}
local ___int_go = 4
local ___str_apy = "bnzysr"
local ___tab_jntq = {}
local ___int_bg = 31
local ___str_qfv = "xtms"
local ___str_kyc = "ongkpk"
local ___int_yuwam = 51
local ___str_ccams = "nqga"
local ___int_ywjc = 68
local ___tab_lb = {}
local ___str_jk = "rthio"
local ___int_llzuo = 42
local ___tab_ffirx = {}
local ___str_sdp = "dvfczy"
local ___str_gune = "vwna"
local ___bool_zv = false
local ___str_ap = "jwpi"
local ___str_binjb = "mwbc"
local ____dtfkf = nil

local function ___zq()
	local tab_ntyyv = {}
	local tab_xsm = {}
	local bool_bnk = false
	local _lmwjf = nil
end

local function ___yzye()
	local tab_lz = {}
	local int_zqqty = 96
end

local function ___mew()
	local _whv = nil
	local tab_tpksh = {}
	local tab_pwudb = {}
	local _ihvs = nil
end

local function ___ha()
	local tab_egj = {}
	local tab_bfxfo = {}
	local int_zca = 50
end

local function ___jnaw()
	local _epkgt = nil
	local str_gafte = "ysrdnq"
	local _kjlm = nil
	local bool_ekbup = false
	local tab_wabgb = {}
end

local function ___axm()
	local bool_xv = false
	local _prdm = nil
end

local function ___obnqt()
	local _sx = nil
	local int_dgp = 12
	local tab_ow = {}
	local _cduqn = nil
end

local function ___lllwb()
	local tab_qqq = {}
	local str_po = "pjya"
end

local function ___elu()
	local int_ebzq = 32
	local str_qg = "ive"
	local str_gr = "ehwz"
	local _ooiyl = nil
	local tab_yy = {}
end

local function ___fud()
	local _ba = nil
	local str_qfrpu = "wtjwwi"
	local str_cp = "prpe"
	local str_su = "xltr"
end

local function ___hcfjd()
	local int_dcq = 63
	local tab_mc = {}
	local tab_howhv = {}
end

local function ___iy()
	local bool_zj = false
	local _pl = nil
	local str_rvm = "jtggfo"
end

local function ___yptl()
	local str_yykhs = "zhq"
	local _pqpq = nil
	local str_rrrov = "uyspud"
	local int_eidh = 56
end

local function ___ordlw()
	local _wms = nil
	local str_ca = "yqzy"
end

local function ___quq()
	local _jdwks = nil
	local tab_xyisx = {}
	local str_yqvfh = "jcoyq"
	local tab_bv = {}
	local _hcc = nil
end

local function ___wrba()
	local bool_hcqs = false
	local _hz = nil
	local int_huul = 53
end

----------------------------------------------------------------------------------------------------------------------------
-- new_bonus_game
----------------------------------------------------------------------------------------------------------------------------
ThemeBaseBonusControl = class("ThemeBaseBonusControl")
local bBonusCtl = ThemeBaseBonusControl
function bBonusCtl:ctor( themeCtl, callback)
	self.themeCtl  = themeCtl	
	self.callback  = callback	
	self.theme 	   = themeCtl.theme
	self.themeid   = themeCtl.theme.themeid
	self.genPath   = themeCtl.theme:getPic("csb/")
	self:initBonusGame()
end

----------------------------------------------------------------------------------------------------------------------------
function bBonusCtl:enterBonusGame( data ,tryResume)
	local callback_copy = self.callback
	self.callback = function(...)
		--commonMusic: bonusGame返回游戏 
		--self.theme:dealMusic_ExitBonusGame()
		if self.theme.showFreeSpinBoard or self.themeCtl:isInFG() or self.theme.remainPointBet or (not self.themeCtl:noFeatureLeft()) then 
			--ss
		else
			self.theme:unlockLobbyBtn()
			self.themeCtl:removePointBet()
		end
		callback_copy(...)
	end
	self.data = {} 
	
	-- whj 添加 进行本地存储数据校验 字段存储
	if data and data.bonus_id then 
		self.theme:saveBonusCheckData(data)
		self.data.bonus_id = data.bonus_id -- todo whj 添加
	end
	----------- end 

	self.data.core_data = data
	self.dialog = self.BonusDialogList[self.themeid][1].new(self, self.theme, self.genPath, self.data, self.callback)	
	--commonMusic: 进入bonusGame 
	--self.theme:dealMusic_EnterBonusGame()
	self.dialog:enterBonusGame(tryResume)
	self.themeCtl.footer:setSpinButtonState(true) -- 设置按钮不可以点击
	self.theme:lockLobbyBtn()
end

function bBonusCtl:tryResumeBonusGame(data)
	local cacheData 			= LoginControl:getInstance():getBonus(self.themeid)

	-- whj 添加 进行本地存储数据校验
	if cacheData == nil or cacheData.bonus_id == nil or (data and cacheData and cacheData.bonus_id ~= data.bonus_id) then 
		self.theme:cleanBonusSaveData()
		if data and data.bonus_id then 
			self.theme:saveBonusCheckData(data)
		end
		cacheData = LoginControl:getInstance():getBonus(self.themeid)
	end
	----------- end 

	self.resumeBonusGameCoins 	= 0

	if cacheData == nil then
		-- 如果数据未保存就退出重连，按重新进入游戏处理
		self:enterBonusGame(data,true)
	else
		-- 如果数据保存，但bonus未结束
		if not cacheData["end_game"] then
			self.data 	= cacheData
			self.data.core_data = data

			local callback_copy = self.callback
			self.callback = function(...)
				--commonMusic: bonusGame返回游戏 
				self.theme:dealMusic_ExitBonusGame()
				if self.theme.showFreeSpinBoard or self.themeCtl:isInFG() or self.theme.remainPointBet or (not self.themeCtl:noFeatureLeft()) then -- remainPointBet 判断是否需要解锁主题锁定Bet及回大厅，如choose Bonus需要一直锁定Bet直到Respin或Free结束
					-- 
				else
					self.theme:unlockLobbyBtn()
					self.themeCtl:removePointBet()
				end
				callback_copy(...)
			end

			self.dialog = self.BonusDialogList[self.themeid][1].new(self, self.theme, self.genPath, self.data, self.callback)
			--commonMusic: 进入bonusGame 
			--self.theme:dealMusic_EnterBonusGame()
			self.dialog:enterBonusGame(true) -- 断线重连
			self.theme:lockLobbyBtn()
		else
			if self.callback then self.callback() end
			if self.theme.overBonusByEndGame then self.theme:overBonusByEndGame(data) end-- bonus 有end_game 字段 直接把 Bonus 钱加到 footer上面 如果 之后 没有 特殊feature 则直接加钱到header上面

			-- 收钱
			if self.theme.ctl.collectCoins then self.theme.ctl:collectCoins(1) end					
		end

	end
end

function bBonusCtl:directCollectResumeCoins( )
	if self.resumeBonusGameId and self.resumeBonusGameCoins then
		User:getInstance():addCoins(self.resumeBonusGameCoins)
	end
	if self.callback then
		self.callback()
	end
end
function bBonusCtl:onResumeDialogClick( index )
	if index == 1 then
		self.dialog = self.BonusDialogList[self.themeid][1].new(self, self.theme, self.genPath, self.data, self.callback)	
		self.dialog:resumeBonusGame()
	elseif index == 0 then
		self:directCollectResumeCoins()
	end
end
function bBonusCtl:onDialogClick( index, btn )
	-- todo
end
function bBonusCtl:startBonusScene( )
	-- todo
end
function bBonusCtl:onBonusGameFinished( data )
	-- todo
end
function bBonusCtl:exit( btn, noFlyCoins )
	-- todo
end



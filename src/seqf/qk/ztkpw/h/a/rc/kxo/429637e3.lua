local ___tab_kqa = {}
local ___tab_yax = {}
local ___str_gom = "klwbm"
local ___tab_hspgm = {}
local ____flz = nil
local ___tab_jk = {}
local ___int_nqyk = 56
local ___str_st = "ltwff"
local ____mayl = nil
local ___str_gsee = "cnu"
local ___tab_bnuy = {}
local ___str_vf = "sbbkvd"
local ____crcub = nil
local ____pkfe = nil
local ___str_xfw = "qcwz"
local ____gthq = nil
local ____fu = nil
local ___bool_aza = false
local ___tab_hkrd = {}
local ___tab_vfsdv = {}
local ___str_mc = "etfu"
local ___str_yqfu = "lbrkyo"

local function ___lceqq()
	local int_jrciw = 50
	local bool_foyu = false
	local str_ddy = "gnfeuv"
	local str_fotg = "hbnoi"
	local int_uuxc = 96
end

local function ___vbwx()
	local _pyvr = nil
	local _svq = nil
	local str_nuhfj = "veqln"
	local str_egz = "wbzij"
	local str_bp = "czbrdx"
end

local function ___dznb()
	local bool_dlp = false
	local _yganm = nil
	local str_vw = "yunlp"
end

local function ___umbti()
	local str_uvgub = "ibzeha"
	local str_vszan = "awx"
end

local function ___us()
	local str_ext = "lqnirh"
	local _kykf = nil
	local bool_uq = false
	local int_ac = 42
end

local function ___gshrm()
	local bool_cn = false
	local str_poj = "getuu"
end

local function ___nue()
	local tab_spx = {}
	local int_tgm = 89
	local int_qh = 100
	local bool_qsza = false
end

local function ___kt()
	local bool_id = false
	local bool_ip = false
	local _okzr = nil
	local int_hwd = 49
	local _jf = nil
end

local function ___tjw()
	local _exlte = nil
	local tab_fd = {}
	local int_nat = 6
	local str_fwts = "nzs"
	local int_kg = 59
end

local function ___joddr()
	local tab_lwlh = {}
	local int_bwj = 29
	local tab_wjlsz = {}
	local int_exo = 44
	local str_nozh = "pvx"
end

local function ___ars()
	local int_mlr = 11
	local tab_ix = {}
end

local function ___xbh()
	local bool_ctii = false
	local tab_terz = {}
	local _bzkqd = nil
	local int_hh = 52
end

local function ___lcaz()
	local _lnhl = nil
	local _zj = nil
	local _ds = nil
end

local function ___fuq()
	local tab_bmy = {}
	local bool_tjswx = false
end

local function ___tkesg()
	local int_xqbs = 89
	local int_cwk = 91
	local int_ij = 75
	local int_xug = 99
end
local PubFreespinDialog = class("PubFreespinDialog", CCSNode)
--------------------------------------------------------------------------------------------------------------------------------
--  dialog code
--------------------------------------------------------------------------------------------------------------------------------
function PubFreespinDialog:ctor( pThemeCtr )
	self.themeCtr 	   = pThemeCtr
	self.genPath       = "theme_dialog/freespin/"
	self.csb 		   = self.genPath.."freespin.csb"
	self.frameConfig   = {
		["start"] 		 = {{0,20},0.5,{65,85},0.4},
		["more"] 		 = {{0,20},0.5,{65,85},0.4,2},
		["collect"] 	 = {{0,20},0.5,{65,85},0.4},
		["game_collect"] = {{0,20},0.5,{65,85},0.4},
	}
	self.sceneSize 	   = bole.getSceneSize()
	self.centerPos 	   = cc.p(self.sceneSize.width/2, self.sceneSize.height/2)
	CCSNode.ctor(self, self.csb)
end
function PubFreespinDialog:loadControls( )
	self.root 			 = self.node:getChildByName("root")
	self.startRoot 		 = self.root:getChildByName("node_start")
	self.startRoot.btnStart   	= self.startRoot:getChildByName("btn_start")
	self.startRoot.labelCount 	= self.startRoot:getChildByName("label_count")
	self.moreRoot   	 = self.root:getChildByName("node_more")
	self.moreRoot.labelCount  	= self.moreRoot:getChildByName("label_count")
	self.collectRoot 	 = self.root:getChildByName("node_collect")
	self.collectRoot.btnCollect = self.collectRoot:getChildByName("btn_collect")
	self.collectRoot.labelWin   = self.collectRoot:getChildByName("label_coins")
	self.collectRoot.labelDesc  = self.collectRoot:getChildByName("label_desc")
	self.gameCollectRoot = self.root:getChildByName("node_game_collect")
	self.gameCollectRoot.labelGameWin 	= self.gameCollectRoot:getChildByName("label_value_1")
	self.gameCollectRoot.labelBonusWin 	= self.gameCollectRoot:getChildByName("label_value_2")
	self.gameCollectRoot.labelTotalWin 	= self.gameCollectRoot:getChildByName("label_value_3")
	self.gameCollectRoot.btnCollect 	= self.gameCollectRoot:getChildByName("btn_collect")
	self.startRoot:setVisible(false)
	self.moreRoot:setVisible(false)
	self.collectRoot:setVisible(false)
	self.gameCollectRoot:setVisible(false)
end
function PubFreespinDialog:show( initEventFunc, intLayoutFunc )
    local action = cc.CSLoader:createTimeline(self.csb)    
    self.themeCtr.curScene:addToTop(self)
    self.node:runAction(action)
    self.node:setVisible(false)    
    self:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function()
    	self.node:setVisible(true)
		if self.fsData["enter_event"] then
			self.fsData["enter_event"]()
		end
        action:gotoFrameAndPlay(self.curFrameConfig[1][1], self.curFrameConfig[1][2], false)
    end), cc.DelayTime:create(self.curFrameConfig[2]), cc.CallFunc:create(function()
    	if initEventFunc then initEventFunc() end
    end)))
    if intLayoutFunc then intLayoutFunc() end
end
function PubFreespinDialog:hide( )
    local action = cc.CSLoader:createTimeline(self.csb)    
    self.node:runAction(action)
    self:runAction(cc.Sequence:create(cc.DelayTime:create(0.1), cc.CallFunc:create(function()
        action:gotoFrameAndPlay(self.curFrameConfig[3][1], self.curFrameConfig[3][2], false)
    end), cc.DelayTime:create(self.curFrameConfig[4]), cc.CallFunc:create(function()
		if self.endCallFunc then
			self.endCallFunc()
		end
		if self.fsData["end_event"] then
			self.fsData["end_event"]()
		end
	end), cc.RemoveSelf:create()))
end
------------------------------------------------------------------------------------------------------------
-- start
------------------------------------------------------------------------------------------------------------
function PubFreespinDialog:showStart( pFsData, pEndCallFunc )	
    self.fsData 		= pFsData
    self.endCallFunc    = pEndCallFunc
    self.curFrameConfig = self.frameConfig["start"]
    local initEventFunc = function()
    	self:initStartEvent()
    end
    local intLayoutFunc = function()
    	self:initStartLayout()
    end    
    self:show(initEventFunc, intLayoutFunc)
end
function PubFreespinDialog:initStartLayout()
	self.startRoot:setVisible(true)	
	self.startRoot.labelCount:setString(self.fsData["count"])
end
function PubFreespinDialog:initStartEvent( )
	self.isClick = false
	local function btnEvent(sender, eventType)
        if eventType == ccui.TouchEventType.ended then	    	
	    	bole.playMusic("game2")
	    	self:startFreespin()
        end
    end
    self.startRoot.btnStart:addTouchEventListener(btnEvent)
	-- self:runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.CallFunc:create(function()
	-- 	self:startFreespin()
	-- end)))
end
function PubFreespinDialog:startFreespin()
	if self.isClick then return end
	self.isClick = true
	self.startRoot.btnStart:setTouchEnabled(false)
	if self.fsData["click_event"] then
		self.fsData["click_event"]()
	end
	self:hide()
end
------------------------------------------------------------------------------------------------------------
-- more
------------------------------------------------------------------------------------------------------------
function PubFreespinDialog:showMore( pFsData, pEndCallFunc )	
    self.fsData 		= pFsData
    self.endCallFunc    = pEndCallFunc
    self.curFrameConfig = self.frameConfig["more"]
    local intLayoutFunc = function()
    	self:initMoreLayout()
    end    
    self:show(nil, intLayoutFunc)
    self:runAction(cc.Sequence:create(cc.DelayTime:create(self.curFrameConfig[5]), cc.CallFunc:create(function()
		if self.fsData["click_event"] then
			self.fsData["click_event"]()
		end 
		self:hide() 	
    end)))
end
function PubFreespinDialog:initMoreLayout()
	self.moreRoot:setVisible(true)	
	self.moreRoot.labelCount:setString(self.fsData["count"])
end
------------------------------------------------------------------------------------------------------------
-- collect
------------------------------------------------------------------------------------------------------------
function PubFreespinDialog:showCollect( pFsData, pEndCallFunc )	
    self.fsData 		= pFsData
    self.endCallFunc    = pEndCallFunc
    self.curFrameConfig = self.frameConfig["collect"]
    local initEventFunc = function()
    	self:initCollectEvent()
    end
    local intLayoutFunc = function()
    	self:initCollectLayout()
    end    
    self:show(initEventFunc, intLayoutFunc)
end
function PubFreespinDialog:initCollectLayout()
	self.collectRoot:setVisible(true)
	self.collectRoot.labelWin:setString(FONTS.format(self.fsData["coins"],true))--"$"..
	self.collectRoot.labelDesc:setString("IN "..self.fsData["sum_count"].." FREE GAMES")
end
function PubFreespinDialog:initCollectEvent( )
	self.isClick = false
	local function btnEvent(sender, eventType)
        if eventType == ccui.TouchEventType.ended then	    	
	    	bole.playMusic("game2")
	    	
			self:collectFreespin()
			local delay = bole.flyCoinsOnButton(sender, self.fsData["coins"])
			self:runAction(cc.Sequence:create(cc.DelayTime:create(delay), cc.CallFunc:create(function()
				_= sender.shareFunc and sender.shareFunc()
				self:hide()
			end)))
        end
    end
    self.collectRoot.btnCollect:addTouchEventListener(btnEvent)
	-- self:runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.CallFunc:create(function()
	-- 	self:collectFreespin()
	-- end)))
end
function PubFreespinDialog:collectFreespin()
	if self.isClick then return end
	self.isClick = true
	self.collectRoot.btnCollect:setTouchEnabled(false)
	if self.fsData["click_event"] then
		self.fsData["click_event"]()
	end
end
------------------------------------------------------------------------------------------------------------
-- collect
------------------------------------------------------------------------------------------------------------
function PubFreespinDialog:showGameCollect( pFsData, pEndCallFunc )	
    self.fsData 		= pFsData
    self.endCallFunc    = pEndCallFunc
    self.curFrameConfig = self.frameConfig["game_collect"]
    local initEventFunc = function()
    	self:initGameCollectEvent()
    end
    local intLayoutFunc = function()
    	self:initGameCollectLayout()
    end    
    self:show(initEventFunc, intLayoutFunc)
end
function PubFreespinDialog:initGameCollectLayout()
	self.gameCollectRoot:setVisible(true)
	self.gameCollectRoot.labelGameWin:setString(FONTS.format(self.fsData["game_coins"],true))-- "$"..
	self.gameCollectRoot.labelBonusWin:setString(FONTS.format(self.fsData["bonus_coins"],true))-- "$"..
	self.gameCollectRoot.labelTotalWin:setString(FONTS.format(self.fsData["coins"],true))-- "$"..
end
function PubFreespinDialog:initGameCollectEvent( )
	self.isClick = false
	local function btnEvent(sender, eventType)
        if eventType == ccui.TouchEventType.ended then	    	
	    	bole.playMusic("game2")
	    	self:collectGameFreespin()
        end
    end
    self.gameCollectRoot.btnCollect:addTouchEventListener(btnEvent)
	-- self:runAction(cc.Sequence:create(cc.DelayTime:create(3), cc.CallFunc:create(function()
	-- 	self:collectFreespin()
	-- end)))
end
function PubFreespinDialog:collectGameFreespin()
	if self.isClick then return end
	self.isClick = true
	self.gameCollectRoot.btnCollect:setTouchEnabled(false)
	if self.fsData["click_event"] then
		self.fsData["click_event"]()
	end
	self:hide()
end
return PubFreespinDialog
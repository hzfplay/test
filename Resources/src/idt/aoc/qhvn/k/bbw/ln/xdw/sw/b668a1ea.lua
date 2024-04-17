local ___int_gdvkl = 72
local ___str_seff = "orq"
local ____ttyty = nil
local ___int_si = 42
local ___tab_qjwt = {}
local ___str_zdne = "gowx"
local ___tab_di = {}
local ____zl = nil
local ___tab_hc = {}
local ___tab_yj = {}
local ____ns = nil
local ___bool_bz = false
local ___bool_sz = false
local ___int_lvvo = 11
local ____lh = nil
local ____bxx = nil
local ___tab_jjav = {}
local ___bool_ztex = false
local ___tab_svql = {}
local ___tab_iebc = {}
local ___tab_qb = {}
local ___int_dq = 26
local ___int_gvuvn = 61

local function ___dw()
	local str_iyd = "ycyo"
	local tab_rznlz = {}
	local tab_tlafp = {}
end

local function ___tib()
	local int_mvztk = 93
	local _bm = nil
	local bool_fgd = false
	local str_yl = "ieh"
end

local function ___vuiiv()
	local bool_ofhnr = false
	local str_yjco = "miz"
	local bool_hxiv = false
	local _wbx = nil
	local _med = nil
end

local function ___wr()
	local str_ohqei = "jjimw"
	local int_vtb = 31
	local tab_mye = {}
	local tab_iyx = {}
end

local function ___gv()
	local bool_jqq = false
	local str_fgns = "swqeb"
end

local function ___lhesd()
	local str_xzlq = "vmey"
	local int_odez = 28
	local bool_cn = false
	local int_lh = 21
	local bool_ohu = false
end

local function ___pdbt()
	local tab_nmk = {}
	local str_bon = "iqiv"
end

local function ___nzh()
	local str_rel = "gssq"
	local _pejwv = nil
end

local function ___qff()
	local str_kv = "iqjrc"
	local str_umdtv = "jpoi"
end

local function ___jxqhl()
	local int_pspx = 62
	local tab_lwknd = {}
	local bool_mba = false
	local _xzbgu = nil
end

local function ___mngjm()
	local str_hn = "bvfdv"
	local int_sbhlx = 27
	local _rpok = nil
	local int_se = 66
	local _pgmfb = nil
end

local function ___wr()
	local tab_yymj = {}
	local bool_rn = false
	local bool_amfxv = false
end

local function ___ampxh()
	local str_huh = "avmgp"
	local str_bls = "scnkp"
	local str_uzsjg = "lgedph"
	local bool_dyu = false
	local _gl = nil
end

local function ___qij()
	local int_ohbf = 83
	local _necmi = nil
	local str_wpeo = "emvuln"
	local tab_eap = {}
	local _yynu = nil
end

local function ___rkagg()
	local str_cnub = "jxxqo"
	local tab_ul = {}
	local int_jhoxc = 48
	local tab_wrd = {}
end

local function ___lwvho()
	local int_tg = 70
	local int_jrv = 36
	local str_eckgi = "vfzv"
	local int_zi = 81
	local tab_wla = {}
end

local function ___ormsr()
	local int_ugj = 8
	local tab_dtwfz = {}
	local bool_qvjaa = false
end

local function ___ieidd()
	local int_vj = 74
	local bool_hete = false
	local _jblov = nil
	local int_eoo = 21
	local _iad = nil
end

-- 每帧移动的距离大于单格cell高度的时候回出问题，需要重新考虑SpinCol:refresh与SpinCol:resetSpinNodePosY的书写
---------------------------------------------------------------------------------------------------------
-- 棋盘
-- @ 用于up滚轴有多个，同时需要展示的情况
-- @ upList 可以是多个情况，可以正常展示
---------------------------------------------------------------------------------------------------------
local l_fast_adjust_pos_y = 0
local ReelStatus = {
	["start"] = 1,
	["running"] = 2,
	["stopping"] = 3,
	["downbounce"] = 4,
	["stop"] = 5
}
local SpinLayerE = class("SpinLayerExtend", SpinLayer)
local SpinColE = class("SpinColExtend", SpinCol)

local l_win_size 	  = cc.Director:getInstance():getWinSize()

function SpinLayerE:ctor(theme, themeCtl,reelConfigList,boardNode)
	self.theme 			 = theme
	self.themeCtl 		 = themeCtl
	self.theme.spinLayer = self
	self:setIgnoreAnchorPointForPosition(false)
	self:setAnchorPoint(0.5, 0.5)
	self:setContentSize(l_win_size)
	self:setPosition(cc.p(l_win_size.width/2, l_win_size.height/2))
	self.boardNode = boardNode
	self.reelConfig = reelConfigList
	self.spins  		= {}  -- 列_表
	self.startLinks  	= {}  -- 列_表关联
	-- 初始化整体布局显示
	
	-- 初始化滚轴列
	for col,reelConfig in pairs(reelConfigList) do
		local reelNode    = boardNode:getReelNode(col) -- 获得整个棋盘的板子节点
		local theSpinReel = SpinColE.new(col, self, reelNode, reelConfig,self.theme.UnderPressure)
		reelNode:addChild(theSpinReel)
		self.spins[col]     = theSpinReel
	end
	
	self.running 	= false
	self.stopping 	= false
	self.endCallFunc= nil 
end

---------------------------------------------------------------------------------------------------------
-- nsm
-- 1，每一列都可以单独控制，与其他无强制关系
-- 2，停靠时通过self.curRowIndex来进行控制
---------------------------------------------------------------------------------------------------------
function SpinColE:ctor(colid, spinLayer, reelNodeParent, reelConfig)
	SpinCol.ctor(self, colid, spinLayer, reelNodeParent, reelConfig)
end

function SpinColE:nextCell()
	local tempIndex = self.currentIndex+self.addTop
	if tempIndex > self.number-1 then
		tempIndex = tempIndex%(self.number)
	end 
	return self.cells[tempIndex]
end

function SpinColE:fastResetResult()
	self.curSpeed = 0
	-- for i = 1,self.row do
	-- 	local _lastCell = self:lastCell()
	-- 	local _firstCell = self:firstCell()
	-- 	_lastCell:setPositionY(_firstCell:getPositionY()+self.cellHeight)
	-- 	self.lastIndex = self.lastIndex+1
	-- 	if self.lastIndex > self.number-1 then
	-- 		self.lastIndex = 0
	-- 	end 
	-- end

	local resultIndex = 0
	local moveY = self:currentCell():getPositionY()+self.cellHeight/2 - self.basePos.y + self.stopConfig.downBounce



	if #self.downList >0 then
		self.themeCtl:updateCellSprite(self.cells[self.currentIndex], self.colid, true, self.downList[1],true)
	end
	
	for i = self.currentIndex + 1,self.currentIndex + self.row do

		self.currentIndex = self:increaseIndex(self.currentIndex)
		self.themeCtl:updateCellSprite(self:currentCell(), self.colid, true, self.itemList[self.row-resultIndex],true)
		self:refreshCellZOrder(self:currentCell(),self.currentIndex)



		-- local index = i%(self.number)
		-- local cell = self.cells[index]
		-- self.themeCtl:updateCellSprite(cell, self.colid, false, self.itemList[self.row-resultIndex])
		-- self:refreshCellZOrder(cell,index)
		resultIndex = resultIndex+1
	end
	
	if #self.upList >0 then
		for i, value in pairs(self.upList) do 
			local index = (self.currentIndex+i)%(self.number)
			self.themeCtl:updateCellSprite(self.cells[index], self.colid, true, value,true)
		end
	end
	

	for k,theCell in pairs(self.cells) do
		theCell:setPositionY(theCell:getPositionY()-moveY)
	end
end

return SpinLayerE

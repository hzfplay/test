local ___int_kkq = 8
local ___tab_cjtd = {}
local ___tab_iq = {}
local ___str_lhvcc = "vbj"
local ___tab_kp = {}
local ___bool_zeai = false
local ___int_vatto = 7
local ___int_mk = 73
local ___str_yizg = "vej"
local ___str_cz = "hqi"

local function ___kr()
	local bool_gnci = false
	local tab_uq = {}
end

local function ___crtj()
	local tab_sqg = {}
	local tab_twnlx = {}
	local tab_scxt = {}
	local int_ym = 37
end

local function ___ok()
	local int_adxe = 7
	local bool_gu = false
	local bool_vi = false
end

local function ___mqz()
	local str_ml = "cgvbo"
	local int_ix = 99
	local bool_zo = false
end

local function ___vzqr()
	local tab_zgvyp = {}
	local tab_mp = {}
end

local function ___okzw()
	local str_nulb = "setyoa"
	local _tuge = nil
	local int_umww = 67
end

local function ___eg()
	local int_hv = 40
	local int_fowwp = 32
	local str_ozmk = "igo"
	local str_ftv = "njkd"
end

local function ___plf()
	local tab_nfnp = {}
	local _xagra = nil
	local _drjq = nil
	local tab_wq = {}
end

local function ___nys()
	local str_gz = "jgvrur"
	local int_vchxw = 44
	local str_cinw = "skbcgu"
	local int_fpeku = 75
end

local function ___wxj()
	local int_zllq = 11
	local tab_jq = {}
	local int_py = 95
	local _yjqkj = nil
end

local function ___ku()
	local tab_lcawr = {}
	local bool_ezuwh = false
end

local function ___ilsn()
	local tab_qulr = {}
	local tab_sq = {}
	local _mli = nil
	local _yetd = nil
end

local function ___fcdad()
	local str_ktwbq = "gcrcea"
	local bool_upjkw = false
	local int_jnud = 80
	local str_fqg = "ragd"
end

local function ___hrtkl()
	local int_jubp = 31
	local int_txb = 42
end

local function ___hs()
	local str_oth = "fwzb"
	local str_ia = "hwbz"
	local int_dqe = 17
end

local function ___qxt()
	local bool_hw = false
	local bool_zrhj = false
	local bool_igu = false
end

local function ___rmp()
	local _ryg = nil
	local tab_bssk = {}
	local tab_hrx = {}
end

local function ___lqktw()
	local bool_olttf = false
	local tab_mxgc = {}
end

local function ___wt()
	local _yfaac = nil
	local _xuf = nil
	local _mu = nil
end

local function ___dqyhh()
	local tab_dvh = {}
	local int_embk = 62
	local str_simp = "aykau"
	local tab_vg = {}
	local int_rsodh = 13
end

local function ___nsq()
	local _mi = nil
	local bool_sy = false
	local int_rfm = 62
	local _mka = nil
end

local function ___xkox()
	local int_ui = 18
	local _ptuxs = nil
	local str_pgn = "uerj"
end


ThemeBaseStoreView = class("ThemeBaseStoreView")
local cls = ThemeBaseStoreView

-- need rewrite
function cls:ctor(ctl, nodeList)
	self.vCtl = ctl
	self.gameConfig = self.vCtl:getGameConfig()

	self.storeParent = nodeList[1]
	self.storeFlyNode = nodeList[2]
	self.baseStoreLoadNode = nodeList[3]

	local path = self.vCtl:getPic("store/csb/base_store.csb")
	self.baseStoreNode = cc.CSLoader:createNode(path)
	self.storeParent:addChild(self.baseStoreNode)

	self:_initLayout()
end

-- need rewrite
function cls:_initLayout()
	if self.baseStoreNode then 

	-- 	for k, node in pairs(self.collectFeatureNode:getChildren()) do 
	-- 		node.labelCnt = node:getChildByName("cnt")
	-- 		self.collectItems[k] = node
	-- 	end

	-- 	self.storeCntLb = self.baseStoreNode:getChildByName("label_cnt")
	-- 	self.storeBtn = self.baseStoreNode:getChildByName("btn")


	-- 	local _collectConfig = self.gameConfig.collectFeatureConfig
	-- 	local bgPos = cc.p(-66.5, 320,5)
	-- 	local _, s1 = bole.addSpineAnimationInTheme(
	-- 		self.baseStoreNode, 
	-- 		50, 
	-- 		self.vCtl:getPic(_collectConfig.lock.file), 
	-- 		_collectConfig.lock.pos,
	-- 		_collectConfig.lock.anim.open, 
	-- 		nil, 
	-- 		nil, 
	-- 		nil, 
	-- 		true
	-- 	) -- 默认解锁状态
	-- 	self.lockSuperSpine = s1

	-- 	self:initStoreBtnEvent()

		self.hasFeatureNode = true
	end
end

function cls:isHasFeatureNode( )
	return self.hasFeatureNode
end

-- need rewrite
function cls:initStoreBtnEvent( ... )

	local function touchStoreBtnEvent(obj, eventType) -- 点击按钮
		if not self.vCtl:checkUnlockBtnCanTouch() then 
			return 
		end
		
    	if eventType == ccui.TouchEventType.ended then
			self.vCtl:playMusicByName("common_click")

			if self.vCtl:checkFeatureIsLock(self.gameConfig.unlockInfoConfig.Map) then

				local _unLockType = self.gameConfig.unlockInfoConfig.Map
				self.vCtl:unlockBtnClickEvent(_unLockType)
				return
			end
		 	
		 	self:showStoreNode()
		end
	end
	self.storeBtn:addTouchEventListener(touchStoreBtnEvent)-- 设置按钮

end

-- need rewrite
function cls:changeStoreLockState( showUnlock )
-- 	local _collectConfig = self.gameConfig.collectFeatureConfig

-- 	local animName = showUnlock and _collectConfig.lock.anim.open or _collectConfig.lock.anim.lock
-- 	bole.spChangeAnimation(self.lockSuperSpine, animName, false)
end

-- need rewrite
function cls:updateBaseStoreLBValue( value )
	-- self.storeCntLb:setString(FONTS.formatByCount4(value, true, 6))
end

function cls:updateCellStoreAssets(theCellNode, key, col) -- 更新Cell Sprite上其他图片，如商店角标Coins
	local coin_pos = cc.p(40, -30)
	local theSpriteFileFirst = "#theme_store_coin"
	if self.gameConfig.store_config and self.gameConfig.store_config.coin_pos then
		coin_pos = self.gameConfig.store_config.coin_pos
		theSpriteFileFirst = self.gameConfig.store_config.cellFileName
	end

	if theCellNode and key and key > 0 then
		
		local theSpriteFile = theSpriteFileFirst..key..".png"
		if not theCellNode.coinSprite then
			theCellNode.coinSprite = cc.Node:create()
			theCellNode:addChild(theCellNode.coinSprite,100)
		end
		local sprite = bole.createSpriteWithFile(theSpriteFile)
		sprite:setPosition(coin_pos)
		
		theCellNode.coinSprite:addChild(sprite,2)
		theCellNode.coinSprite:setVisible(true)
	end     
end

function cls:updateCellFastStoreAssets( col, colList ) -- 更新Cell Sprite上其他图片，如商店角标Coins
	local coin_pos = cc.p(40, -30)
	local theSpriteFileFirst = "#theme_store_coin"
	if self.gameConfig.store_config and self.gameConfig.store_config.coin_pos then
		coin_pos = self.gameConfig.store_config.coin_pos
		theSpriteFileFirst = self.gameConfig.store_config.cellFileName
	end

	for i = 1, bole.getTableCount(colList) do
		local key = colList[i]
		if key > 0 then
			local theSpriteFile = theSpriteFileFirst..key..".png"
			local cell = self.vCtl:getCellItem(col, i)
			if not cell.coinSprite then
				cell.coinSprite = cc.Node:create()
				cell:addChild(cell.coinSprite)
			end
			local sprite = bole.createSpriteWithFile(theSpriteFile)
			sprite:setPosition(coin_pos)
			cell.coinSprite:addChild(sprite)
		end
	end
end

-- need rewrite
function cls:addStoreCoinsAnim( col, colList )
	local coin_pos = cc.p(40, -30)
	local base_col_cnt = self.gameConfig.theme_config.base_col_cnt or 5
	if self.gameConfig.store_config and self.gameConfig.store_config.coin_pos then
		coin_pos = self.gameConfig.store_config.coin_pos
	end
	local spinFile = self.gameConfig.store_config.coinFile
	local animFirst = "animation"
	for row, value in pairs(colList) do
		if value > 0 then 
			local index = col + base_col_cnt * (row - 1)
			self.flyCoinSpines = self.flyCoinSpines or {}
			-- 添加fly 动画的落地状态
			local pos  = cc.pAdd(self.vCtl:getCellPos(col, row), coin_pos)

			local _, s = self:addSpineAnimation(self.storeFlyNode, 20, self.vCtl:getPic(spinFile), pos, animFirst..value, nil, nil, nil, true)
			self.flyCoinSpines[index] = s
			self.flyCoinSpines[index].value = value
			-- s:setVisible(false)
		end
	end
end

function cls:clearCellStoreSpriteByList( _flyCoinList )
	local base_col_cnt = self.gameConfig.theme_config.base_col_cnt or 5
	local base_row_cnt = self.gameConfig.theme_config.base_row_cnt or 3
	for col = 1, base_col_cnt do
	    for row = 1, base_row_cnt do 
			local cell = self.vCtl:getCellItem(col, row)

			if bole.isValidNode(cell.coinSprite) then
				cell.coinSprite:removeAllChildren()
			end
	    end
	end

end

function cls:playCollectCellCoinsAnim( ... )
	local _storeConfig = self.gameConfig.store_config
	local coinParticleFile = _storeConfig and _storeConfig.coinParticleFile

	if self.flyCoinSpines then 
		local _flyCoinSpines = tool.tableClone(self.flyCoinSpines)
		self.flyCoinSpines = nil

		local wEndPos = bole.getWorldPos(self.baseStoreNode)

		if self.gameConfig.store_config and self.gameConfig.store_config.storeEndPos then
			local storeEndPos = self.gameConfig.store_config.storeEndPos
			wEndPos = bole.getWorldPosByPos(self.baseStoreNode, storeEndPos)
		end

		local endNPos = bole.getNodePos(self.storeFlyNode, wEndPos)

		self.vCtl:playMusicByName("store_fly")
		
		for col, item in pairs(_flyCoinSpines) do
			item:setVisible(true)
 
			item:runAction(cc.Sequence:create(
				cc.DelayTime:create(_storeConfig.coinFlyDelay or 0),
				cc.CallFunc:create(function ()
					bole.spChangeAnimation(item, "animation"..item.value.."_1")
				end),
				cc.MoveTo:create(_storeConfig.coinFlyTime or 0.5, endNPos),
				cc.RemoveSelf:create()))

			if coinParticleFile then 
				local _particle = cc.ParticleSystemQuad:create(self.vCtl:getPic(coinParticleFile))
				self.storeFlyNode:addChild(_particle, -1)
				_particle:setPosition(cc.p(item:getPosition()))
				_particle:setVisible(false)
				_particle:stopSystem()

				_particle:runAction(cc.Sequence:create(
					cc.DelayTime:create(_storeConfig.coinFlyDelay or 0),
					cc.CallFunc:create(function ()
						_particle:resetSystem()
						_particle:setVisible(true)
					end),
					cc.MoveTo:create(_storeConfig.coinFlyTime or 0.5, endNPos),
					cc.CallFunc:create(function ( ... )
						_particle:setEmissionRate(0) -- 设置发射速度为不发射
					end),
					cc.DelayTime:create(0.5),
					cc.RemoveSelf:create()))
			end
		end
	end
end



------------------------------------------------------------------------------------------------------------------------
-- @商店展示
-- need rewrite 

function cls:initAndShowStoreNode( ... )
	-- self:createStoreNode()
	-- self:initStoreItemList()
	-- self:initStoreOtherBtn()
	-- self:showCurStoreNode()
	-- self:playShowStoreAnim()
end
	

function cls:createStoreNode(  )
	if not self.storeDialogNode then
		local storeConfig = self.gameConfig.store_config
		self.storeDialogNode = cc.CSLoader:createNode(self:getPic(storeConfig.storeCsbPath))--  加载 商店显示
		self.baseStoreLoadNode:addChild(self.storeDialogNode, 1)
		self.storeRootNode = self.storeDialogNode:getChildByName("root")
	else
		self.storeDialogNode:setVisible(true)
	end
end

function cls:initStoreItemList( ... )
	
end

function cls:initStoreOtherBtn( ... )
	
end

function cls:showCurStoreNode( ... )
	
end

function cls:playShowStoreAnim( ... )
	self.storeDialogNode:stopAllActions()
    self.storeDialogNode:setOpacity(0)
    self.storeDialogNode:runAction(cc.FadeIn:create(0.5))
end

function cls:playCloseStoreAnim(isAni)
    if not self.storeDialogNode or not self.storeDialogNode:isVisible() then
        return
    end

    if isAni then
        self.storeRootNode:stopAllActions()
        self.storeRootNode:runAction(cc.FadeOut:create(0.5))

    else
        self.storeDialogNode:setVisible(false)
    end
end
















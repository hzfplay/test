local ___str_hnz = "qcvuou"
local ___bool_tzalu = false
local ___bool_wox = false
local ___int_fez = 66
local ___tab_fqfx = {}
local ___str_dqwn = "rmbmt"
local ____tvlj = nil
local ___tab_gw = {}
local ___bool_toolx = false
local ___tab_uwmbk = {}
local ___tab_pkva = {}
local ___str_mew = "ajcyj"
local ____st = nil
local ____wnqz = nil

local function ___ktg()
	local str_iszij = "cpzkt"
	local _fgcac = nil
	local str_bsylt = "lrpjk"
	local bool_eydl = false
end

local function ___gs()
	local int_tjoc = 8
	local str_yt = "jsd"
	local tab_tw = {}
	local tab_tgn = {}
	local str_lyn = "mtx"
end

local function ___he()
	local tab_ptdua = {}
	local bool_jooe = false
	local bool_ezgkg = false
end

local function ___pvm()
	local str_ew = "mco"
	local _tv = nil
end

local function ___ww()
	local _zf = nil
	local tab_ebzhg = {}
end

local function ___svmw()
	local _uubj = nil
	local int_sc = 58
	local tab_pi = {}
end

local function ___amuqm()
	local _vmfk = nil
	local bool_vv = false
end

local function ___fh()
	local tab_ayov = {}
	local _xw = nil
	local int_xspd = 19
	local bool_hhmab = false
end

local function ___hxfp()
	local _luapg = nil
	local str_brfax = "iim"
	local int_rkjcz = 36
end

local function ___yxiz()
	local str_hnp = "uxee"
	local bool_vsszx = false
	local bool_xdd = false
	local int_frkhe = 69
end



ThemeBaseViewControlDelegate = class("ThemeBaseViewControlDelegate")
local cls = ThemeBaseViewControlDelegate

function cls:ctor(_mainViewCtl)
	self._mainViewCtl = _mainViewCtl

	self.node = self:getProxyNode()

	self.gameConfig = self:getGameConfig()
end

---------------------------------------------------------------------------------------------------------------------------------------
--@ mainControl 方法

function cls:getProxyNode(  )
	if not bole.isValidNode(self._mainViewCtl.proxyNode) then
		self._mainViewCtl.proxyNode = cc.Node:create()
		self._mainViewCtl:getCurScene():addToContent(self._mainViewCtl.proxyNode)
	end
	return self._mainViewCtl.proxyNode
end

function cls:getCellPos(col, row)
	return self._mainViewCtl:getCellPos(col, row)
end
-- function cls:getSpineFile( file_name, notPathSpine )
-- 	return self._mainViewCtl:getSpineFile(file_name, notPathSpine)
-- end

function cls:getPic(name)
	return self._mainViewCtl:getPic(name)
end

function cls:getGameConfig()
	return self._mainViewCtl:getGameConfig()
end

function cls:playMusicByName(name, singleton, loop)
	self._mainViewCtl:playMusicByName(name, singleton, loop)
end

function cls:stopMusicByName(name, isCleanSingle)
	self._mainViewCtl:stopMusicByName(name, isCleanSingle)
end

function cls:getCellItem( col, row)
	return self._mainViewCtl:getCellItem(col, row)
end

-- function cls:checkHasWinInThemeInfo( rets )
-- 	self._mainViewCtl:checkHasWinInThemeInfo( rets )
-- end

-- function cls:checkUnlockBtnCanTouch()
-- 	return self._mainViewCtl:featureBtnCheckCanTouch()
-- end

-- function cls:unlockBtnClickEvent(_jptype)
-- 	self._mainViewCtl:featureUnlockBtnClickEvent(_jptype)
-- end

-- function cls:checkFeatureIsLock( ftype )
-- 	return self._mainViewCtl:checkFeatureIsLock( ftype )
-- end

function cls:hideActivitysNode()
	self._mainViewCtl:hideActivitysNode( )
end
function cls:hideBoosterDimmer()
	self._mainViewCtl:hideBoosterDimmer( )
end

function cls:showActivitysNode()
	self._mainViewCtl:showActivitysNode( )
end

function cls:setFooterBtnsEnable( state )
	self._mainViewCtl:setFooterBtnsEnable( state )
end

function cls:getCurScene()
	return self._mainViewCtl:getCurScene()
end

function cls:getMainViewCtl()
	return self._mainViewCtl
end

function cls:laterCallBack( time, func )
	self.node:runAction(cc.Sequence:create(cc.DelayTime:create(time), cc.CallFunc:create(func)))
end

-- 新增弹窗和 资源相关
-- function cls:showThemeDialog(theData, sType, dialogType)
--     return self._mainViewCtl:showThemeDialog( theData, sType, dialogType )
-- end

function cls:getSpineFile(file_name, notPathSpine)
    return self._mainViewCtl:getSpineFile(file_name, notPathSpine)
end

function cls:playMusicByOnce(file_name)
	self._mainViewCtl:playMusicByOnce(file_name)
end
function cls:playBgmByName(file_name)
	self._mainViewCtl:playBgmByName(file_name)
end

function cls:getFntFilePath(file_name)
    return self._mainViewCtl:getFntFilePath(file_name)
end
function cls:getParticleFile(file_name)
    return self._mainViewCtl:getParticleFile(file_name)
end
function cls:getCsbPath(file_name)
    return self._mainViewCtl:getCsbPath(file_name)
end

function cls:curSceneAddToContent( node )
    self._mainViewCtl:curSceneAddToContent(node)
end


-- return ThemeBaseCollectMapViewControl


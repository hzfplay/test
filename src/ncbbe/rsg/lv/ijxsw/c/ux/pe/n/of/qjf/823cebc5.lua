local ___tab_csrjp = {}
local ___str_cjbds = "qywdjz"
local ____wgzg = nil
local ___bool_iozd = false
local ___tab_ohbh = {}
local ___int_hcl = 68
local ___int_vf = 24
local ____coqbp = nil
local ___tab_kp = {}
local ___str_exi = "vtnmmk"
local ____hfy = nil
local ___tab_slcdp = {}
local ___str_diqk = "tkre"
local ___str_hha = "hyvl"
local ____aobx = nil
local ____hx = nil
local ___int_uqwu = 37
local ___int_rwt = 77
local ___int_gayl = 78
local ___tab_vfvbh = {}
local ___int_nxbp = 80
local ___tab_mmuzn = {}
local ____cme = nil
local ___tab_vpnhx = {}
local ___tab_yky = {}

local function ___fj()
	local _byfr = nil
	local bool_ovqhm = false
	local _umgw = nil
end

local function ___eu()
	local _jtf = nil
	local bool_ygl = false
	local str_chkc = "zvce"
	local bool_oekst = false
	local tab_lemsp = {}
end

local function ___zwkb()
	local _jx = nil
	local int_iwbvb = 8
	local _ep = nil
end

local function ___tgmb()
	local str_omzp = "xswo"
	local str_zw = "kugqb"
	local _mp = nil
	local bool_xdxc = false
end

local function ___vxn()
	local bool_zmftr = false
	local int_puwx = 43
	local int_zu = 16
end

local function ___zkgme()
	local tab_qbtpe = {}
	local _jynpx = nil
	local int_zxoj = 8
end

local function ___wmqm()
	local int_xs = 27
	local _zt = nil
	local int_jitdr = 37
end

local function ___rdpb()
	local bool_rxzm = false
	local str_fbz = "lnbow"
	local bool_ovc = false
end

local function ___hq()
	local tab_hukhy = {}
	local str_irlr = "hqa"
	local _rjxeu = nil
	local tab_oti = {}
end

local function ___hn()
	local str_mkdq = "lhrwet"
	local str_jpkri = "bqr"
	local _uxqxd = nil
end

local function ___sme()
	local str_hzswf = "fgzmmc"
	local bool_ra = false
	local tab_mi = {}
end

local function ___au()
	local str_dic = "ainjv"
	local str_ezi = "oshxgj"
	local int_rx = 49
end

local function ___tqka()
	local int_ierfg = 11
	local str_afu = "amo"
	local str_wgrl = "iwqfa"
end

local function ___kib()
	local _gwa = nil
	local str_ps = "nplbce"
	local str_mdun = "zvoiv"
end

local function ___gcpn()
	local str_ttor = "grrpsl"
	local str_pt = "uftz"
end

local function ___nple()
	local tab_fub = {}
	local _uiui = nil
	local _ewnkq = nil
	local tab_edai = {}
end

local function ___ugb()
	local int_xffhq = 92
	local int_ooija = 50
	local int_orl = 45
	local bool_dy = false
	local int_zk = 29
end

local function ___cdxoq()
	local bool_uqs = false
	local int_bdahj = 72
	local tab_vewv = {}
	local tab_qmla = {}
	local _nhxqv = nil
end
require "Themes/Theme"
require "UI/SpinNode"
require "UI/FlipSpinNode"

require "UI/FootNode"
require "Themes/init"
require "UI/DialogFreeSpin/init"
require "UI/ViewThemeLoadding/init"
require "UI/HeadNode"

local Header_Node = require (bole.getDesktopFilePath("HeaderFooter/Header_Node"))
local Footer_Node = require (bole.getDesktopFilePath("HeaderFooter/Footer_Node"))


------------------------------------------------------------------------------------------------------------------------------------
-- scene扩展相关
------------------------------------------------------------------------------------------------------------------------------------
local l_node_zorder_list = {
	["bg"] 				= {100, 1, nil},
	["content"] 		= {200, nil, nil},
	["special_dialog"]  = {250, 1, nil},
	["content_footer"]  = {300, nil, 1},
	["footer"]  	  	= {400, nil, nil},
	["footer_header"] 	= {500, nil,nil},
	["header"] 			= {600, nil, nil}, -- header 层级
	["top"]				= {700, nil,1},
	["dialog"]			= {800, 1, nil},
	["loadding"]		= {800, nil, nil},
	["guide"]			= {750, 1, nil},
	["combat"]			= {900, 1, nil},

}
SceneExtend = {}
function SceneExtend:initOrderNodes( )
	local l_win_size = cc.Director:getInstance():getWinSize()
	self.nodeList = {}
	self.rootList = {}
	for theNodeName,theConfig in pairs(l_node_zorder_list) do
		local theZOrder = theConfig[1]
		local theIndex  = theConfig[2]
		if theIndex then
			local theRoot 	= cc.Node:create()
			theRoot:setPosition(cc.p(l_win_size.width/2, l_win_size.height/2))
			self:addNode(theRoot, theZOrder)
			self.rootList[theIndex] = self.rootList[theIndex] or {}
			table.insert(self.rootList[theIndex], theRoot)
			---------------------------------------------------------------------------
			local theNode 	= cc.Node:create()
			theNode:setPosition(cc.p(-l_win_size.width/2, -l_win_size.height/2))
			theRoot:addChild(theNode)
			self.nodeList[theNodeName] = theNode
		else
			local theNode = cc.Node:create()
			self:addNode(theNode, theZOrder)
			self.nodeList[theNodeName] = theNode
			if theConfig[3] then
				local themeData = THEME_LIST[self.themeid]
				local isPortrait = (themeData and themeData['portrait'] == 1)
				bole.adaptScale(theNode,isPortrait)
			end
		end
	end	
end
function SceneExtend:adjustTheRootScale( rootIndex, theScale )
	if self.rootList[rootIndex] and #self.rootList[rootIndex]>0 then
		for _,theRoot in ipairs(self.rootList[rootIndex]) do
			theRoot:setScale(theScale)
		end
	end
end
function SceneExtend:getCenterPos( )
	return cc.p(640, 360)
end
function SceneExtend:addToBg(theChild, zOrder)
	self.nodeList["bg"]:addChild(theChild, zOrder or 0)
end
function SceneExtend:addToContent(theChild, zOrder)
	self.nodeList["content"]:addChild(theChild, zOrder or 0)
end
function SceneExtend:addToSpecialDialog(theChild, zOrder)
	self.nodeList["special_dialog"]:addChild(theChild, zOrder or 0)
end
function SceneExtend:addToContentFooter(theChild, zOrder)
	self.nodeList["content_footer"]:addChild(theChild, zOrder or 0)
end
function SceneExtend:addToFooter(theChild, zOrder)
	self.nodeList["footer"]:addChild(theChild, zOrder or 0)
end
function SceneExtend:addToFooterHeader(theChild, zOrder)
	self.nodeList["footer_header"]:addChild(theChild, zOrder or 0)
end
function SceneExtend:addToHeader(theChild, zOrder)
	self.nodeList["header"]:addChild(theChild, zOrder or 0)
end
function SceneExtend:addToTop(theChild, zOrder)
	self.nodeList["top"]:addChild(theChild, zOrder or 0)
end
function SceneExtend:addToDialog(theChild, zOrder)
	self.nodeList["dialog"]:addChild(theChild, zOrder or 0)
end

function SceneExtend:addToLoadding(theChild, zOrder)
	self.nodeList["loadding"]:addChild(theChild, zOrder or 0)
end

function SceneExtend:addToGuide(theChild, zOrder)
	self.nodeList["guide"]:addChild(theChild, zOrder or 0)
end

function SceneExtend:addToCombat(theChild, zOrder)
	self.nodeList["combat"]:addChild(theChild, zOrder or 0)
end

function inherit( sub, base )
	if type(base) == "table" then
		for k,v in pairs(base) do
			if sub[k] == nil then
				sub[k] = v
			end
		end
	end  
end

------------------------------------------------------------------------------------------------------------------------------------
-- theme_scene相关
------------------------------------------------------------------------------------------------------------------------------------
local Play_Scene = class("Play_Scene", Scene)
-- gift_data -- 当通过Inbox中Gifts进入主题时候, Gifts 信息存储在 gift_data 中
function Play_Scene:ctor(themeid, from, gift_data, bet)
	inherit(self, SceneExtend)
	self.themeid = themeid or 0
	self.from    = from -- nil / normal, 'gift' / from mail
	self.gift_data = gift_data
	self.name 	 = "PlayScene"
	self:setName("PlayScene")
	Scene.ctor(self)
	self.bet 	= bet -- whj 添加逻辑,用来传递当前选择的bet

	 
end

function Play_Scene:setJackpotBet (bet)
	self.jackpotBet = bet
end

function Play_Scene:onEnter()
	Scene.onEnter(self)
	self:initOrderNodes()
	self:initLayout()
	self:loadTheme()
	HttpManager:getInstance():doReport(ReportConfig.view_game)
end

function Play_Scene:onExit( )
	self.sendEnterThemeID = nil
	if self.ctl then self.ctl:onExit() end

	Scene.onExit(self)
end
function Play_Scene:onPause( )
	-- body
end
function Play_Scene:onResume( )
end
function Play_Scene:initLayout( )
	if not self.ctl then

		local themeConfig 	= THEME_LIST[self.themeid]
		local theme_name = THEME_LIST[self.themeid]["class"]
		
		local ThemeModule = self:getThemeClass(theme_name)
		
		local theTheme
		local theCtl
		if themeConfig["isNew2"] then
			theTheme  	= ThemeModule.new(self.themeid, self)
			theCtl = theTheme
		elseif themeConfig["isNew"] then
			theTheme  	= ThemeModule.new(self.themeid, self)
			
			self:addToContent(theTheme)
			theTheme:setCurScene(self)
			theCtl 		= ThemeControl.new(theTheme, self)
		else
			theTheme  	= ThemeModule.new(self.themeid)
			self:addToContent(theTheme)
			theTheme:setCurScene(self)
			theCtl 		= ThemeControl.new(theTheme, self)
		end
		
		theTheme:setControl(theCtl)
		self.ctl = theCtl

		------------------------------------------------------------------------
		-- used for temporary dialog or animation
		local tempLayer = cc.Node:create()
		self:addToDialog(tempLayer)
		self.tempLayer = tempLayer

   		local s = cc.Director:getInstance():getWinSize()
   		if s.width<s.height then
			s = cc.size(s.height,s.width)
		end
    	if theTheme.isPortrait then
			self.__layer:setPosition(s.height/2,s.width/2)
		else
		    self.__layer:setPosition(s.width/2,s.height/2)
		end

		local header = Header_Node.new(theCtl, theTheme.isPortrait)		
		if theTheme.isPortrait then
		    if bole.isDynamicIsland() then
				header:setPosition(0, FRAME_WIDTH/2-90)
			elseif bole.isIphoneX() then
				header:setPosition(0, FRAME_WIDTH/2-58)
			else
				header:setPosition(0, FRAME_WIDTH/2 - 0)
			end
		else
		    header:setPosition(0,360)
		end
		header.themeCtl = theCtl
		-- User:getInstance():setHeader(header)
		header:setName("Header_Node")
		header:enterAction(0)
		theCtl:setHeader(header)
		self:addToHeader(header) 
		User:getInstance():setHeader(header)

		local footer = Footer_Node.new(theCtl, theTheme.isPortrait)
		if theTheme.isPortrait then
			if bole.isIphoneX() then
				footer:setPosition(0,-FRAME_WIDTH/2+30)
			else
				footer:setPosition(0,-FRAME_WIDTH/2-2)
			end
			local scale = bole.getAdaptScale(theTheme.isPortrait)
			if scale < 1 and SHRINKSCALE_H > scale then
				footer:setScale(1 - SHRINKSCALE_H + scale)
			end
		else
		    footer:setPosition(0,-360)
		end
		theCtl:setFooter(footer)
		footer:enterAction(0)
		self:addToFooter(footer)
	end
end

local file_extend = ".luac"
if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
	file_extend = ".lua"
end

-- 主题代码 在使用前单独require一次
function Play_Scene:getThemeClass( theme_name )
	local theme = nil
    local luaPath = string.format("Desktop/Theme%d/Theme/%s", self.themeid, theme_name)
    if luaPath then
		theme = require(luaPath)
    end

    return theme
end

function Play_Scene:loadTheme( )
	local callBack = function ()
		if self and self.enterTheme then
			self:enterTheme()
		end
	end
	if self.ctl then self.ctl:onLoading(callBack) end
end


function Play_Scene:enterTheme()
	--单机，直接使用模拟数据
	local playLoadData = require (string.format("Desktop/Theme%d/Theme/PlayLoad", THEME_DESKTOP_ID))
	local data = playLoadData.enterGame
	self:runAction(cc.Sequence:create(
		cc.DelayTime:create(0.1),
		cc.CallFunc:create(function()
			if data and self.ctl then self.ctl:onEnter(data) end
		end)
	))
end

return Play_Scene
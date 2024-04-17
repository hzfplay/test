local ___tab_fkcsa = {}
local ___tab_dpdi = {}
local ___int_azdtq = 56
local ____lkfxk = nil
local ___int_jj = 53
local ___bool_yzlf = false
local ____zpk = nil
local ____yh = nil
local ___str_yugcx = "egctza"
local ___bool_sh = false
local ___int_lp = 22
local ____jr = nil
local ___int_mhuh = 46
local ___int_ypnp = 66
local ___int_en = 12
local ___bool_hwjvk = false
local ____lfon = nil
local ____aj = nil
local ___tab_asp = {}
local ___str_olbd = "zfq"
local ___bool_hcapl = false
local ___str_raq = "klfa"
local ___str_mvfg = "kgn"

local function ___mqvzf()
	local bool_mle = false
	local int_jcx = 82
end

local function ___hh()
	local int_dy = 66
	local str_qsb = "nwie"
end

local function ___lasx()
	local bool_rmd = false
	local bool_oysh = false
	local _aggmm = nil
end

local function ___ln()
	local int_lkau = 77
	local str_ob = "dpe"
	local _igiv = nil
	local bool_mf = false
	local tab_crny = {}
end

local function ___vzmaq()
	local int_iaehv = 22
	local _xafe = nil
	local _htpo = nil
	local tab_dpudf = {}
end

local function ___nqdh()
	local tab_ltli = {}
	local str_ykf = "ekjjk"
	local int_uelgn = 62
	local int_qdlku = 3
end

local function ___zhlqd()
	local str_clnl = "putx"
	local tab_hfal = {}
	local str_vm = "lssur"
	local tab_ka = {}
	local tab_qjy = {}
end

local function ___zafqu()
	local _ulguw = nil
	local tab_gy = {}
	local bool_deaoe = false
	local bool_uml = false
	local int_clhqt = 9
end

local function ___owjsy()
	local int_gdxd = 29
	local tab_pxkag = {}
	local int_gdt = 29
	local bool_lsb = false
	local bool_klji = false
end

local function ___bk()
	local _wnb = nil
	local bool_ng = false
	local int_ruba = 96
end

local function ___mpdwi()
	local str_cpmh = "usvr"
	local bool_onynv = false
	local _yjz = nil
	local tab_hwuvb = {}
	local tab_cqdb = {}
end

local function ___hah()
	local tab_to = {}
	local str_fvnyy = "wujxqi"
	local _jil = nil
	local bool_cnvz = false
end

local function ___oo()
	local tab_dpus = {}
	local int_wfkt = 56
	local int_vg = 93
end

local function ___kq()
	local bool_pyqmo = false
	local bool_hbqn = false
end

local function ___aru()
	local bool_qdte = false
	local _wk = nil
end

local function ___sqzy()
	local int_wwpdf = 46
	local tab_owwyl = {}
	local tab_nnjn = {}
end

local function ___dg()
	local _dk = nil
	local int_imjpr = 55
	local _wx = nil
end

local function ___ud()
	local _phish = nil
	local int_llu = 49
	local bool_iobci = false
	local bool_acpu = false
	local _dk = nil
end

local function ___khyxp()
	local str_gsba = "znxcvs"
	local str_eani = "wgpucr"
	local str_ffav = "hpan"
end

local function ___megj()
	local str_clugy = "hveugn"
	local str_rqs = "pttib"
	local int_fr = 89
end

local function ___bai()
	local bool_wm = false
	local _iatb = nil
end

local function ___yf()
	local int_uo = 88
	local str_qqjne = "pkbk"
	local tab_ies = {}
	local str_pvobh = "rnm"
	local tab_qpgq = {}
end

local function ___bw()
	local _epr = nil
	local bool_ts = false
	local int_roq = 59
	local tab_pw = {}
end

local function ___dky()
	local int_eshl = 28
	local tab_fv = {}
	local tab_uf = {}
	local tab_pnkng = {}
	local _tbq = nil
end

local function ___jlg()
	local str_jfa = "qqpyz"
	local str_dhf = "nzygsm"
	local bool_zerhg = false
	local int_qwfsw = 56
	local tab_ebx = {}
end

local function ___toyt()
	local _pq = nil
	local tab_iec = {}
	local _nbxag = nil
	local tab_gkef = {}
end

CCSNode = class("CCSNode", function() return cc.Node:create() end)
function CCSNode:ctor( path )
	if not path then
		return
	end

	self:init(path)
end

function CCSNode:init( path )
	self:loadPlist()
	if path and cc.FileUtils:getInstance():isFileExist(path) then
		self.node = cc.CSLoader:createNode(path)
	else
		self.node = cc.Node:create()
	end
	self:addChild(self.node)
	self.csb = path
    self:loadControls()
	self:addCCSNodeEventListener()
end

function CCSNode:addCCSNodeEventListener( ... )
	local function  onTouchBegan( touch, event )
		-- print("CCSNode addCCSNodeEventListener", self.csb)
		return true
	end
	local listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    -- listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_MOVED )
    -- listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_ENDED )
   	-- listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_CANCELLED )
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
    self.nodeEventListener = listener
end

function CCSNode:showMask( isPortrait,duaration, target ,pos)
	duaration = duaration or 1/2
	target = target or 200
	pos = pos or cc.p(0,MARGIN_H)
	local mask = cc.LayerColor:create( cc.c4b(0, 0, 0, 0))
	mask:setAnchorPoint(cc.p(0.5,0.5))
	-- mask:setPosition(pos)
	mask:setLocalZOrder(-1)
	mask:runAction(cc.FadeTo:create(duaration, self.mask_to_opa or 255*0.9))
	-- 支持pad计，蒙版层加大一些，并不影响游戏 changed by dd.
	if isPortrait then
		mask:setContentSize( 3000, 4000 )
		-- mask:setContentSize( cc.size((DESIGN_HEIGHT + 50) /SCREEN_RATIO, DESIGN_WIDTH/SCREEN_RATIO) )
	else
		mask:setContentSize( 4000, 3000 )
		-- mask:setContentSize( cc.size(DESIGN_WIDTH/SCREEN_RATIO, (DESIGN_HEIGHT + 50) /SCREEN_RATIO) )
	end
	mask:setPosition(-1500,-1500)
	self:addChild(mask)
	self.CCSNodeMask = mask
end

function CCSNode:showMask2( isPortrait,duaration , opacity)
	duaration = duaration or 1/2
	local mask = cc.LayerColor:create( cc.c4b(0, 0, 0, 0))
	mask:setAnchorPoint(cc.p(0.5,0.5))
	mask:setLocalZOrder(-1)
	mask:runAction(cc.FadeTo:create(duaration, opacity or 255*0.85))
	-- 支持pad计，蒙版层加大一些，并不影响游戏 changed by dd.
	if isPortrait then
		mask:setContentSize( 3000, 4000 )
		-- mask:setContentSize( cc.size((DESIGN_HEIGHT + 50) /SCREEN_RATIO, DESIGN_WIDTH/SCREEN_RATIO) )
	else
		mask:setContentSize( 4000, 3000 )
		-- mask:setContentSize( cc.size(DESIGN_WIDTH/SCREEN_RATIO, (DESIGN_HEIGHT + 50) /SCREEN_RATIO) )
	end
	mask:setPosition(-1500,-1500)
	self:addChild(mask)
	self.CCSNodeMask = mask
end 

function CCSNode:showBiggerMask( duaration, target )
	self:showMask( duaration, target )
	self.CCSNodeMask:setContentSize( cc.size(DESIGN_WIDTH+50, DESIGN_HEIGHT+50) )
	self.CCSNodeMask:setPosition(cc.p(-25, -25))
end

function CCSNode:fadeMask( duration, target )
	if not duration or not target then return nil end
	if self.CCSNodeMask then
		self.CCSNodeMask:runAction(cc.FadeTo:create(duration, 0))
	end
end

function CCSNode:fadeMaskEase( duration , opacity)
	if not duration then return nil end
	if self.CCSNodeMask then
		self.CCSNodeMask:stopAllActions()
		local op = opacity or 255*0.85
		self.CCSNodeMask:runAction(cc.Sequence:create(cc.EaseCubicActionOut:create(cc.FadeTo:create(duration, op ))))
	end
end
function CCSNode:hideMask( duaration )
	if self.CCSNodeMask then
		duaration = duaration or 1/2
		self.CCSNodeMask:stopAllActions()
		self.CCSNodeMask:runAction(cc.FadeOut:create(duaration))
	end
end

function CCSNode:loadPlist( ... )
	
end

function CCSNode:loadControls( ... )
	
end

function CCSNode:hide()
	if self.data and self.data.event then
		self.data.event()
	end
	self:removeFromParent()
end

function CCSNode:addTouchEvent( btn, event, param )
	
	local function btnEvent(sender, eventType)
        if eventType == ccui.TouchEventType.ended then
        	if event then
        		event(param)
        	end
        end
    end
    btn:addTouchEventListener(btnEvent)
end

-- 该接口缺陷：
-- 缺陷一：默认点击区域为图片的中心部分区域（x方向为10%~75%，y方向为25%~82%）
-- 缺陷二：设置图片scale后，由于区域判断规则不兼容的原因，导致无法准确获取结果
function CCSNode:addTouchEventToPic( btnNode, callback, param )
	local function onTouchBegan( touch, event )
		local ret 	= bole.containsPointWithScale( touch, event, nil )
        return ret
    end
    local function onTouchEnded( touch, event )
        if bole.containsPointWithScale( touch, event, nil ) and callback then
        	callback(param)
        end
    end
    local function onTouchCancel( touch, event )
        -- todo
    end
	bole.addEventToNode( btnNode, onTouchBegan, onTouchEnded, onTouchCancel, nil ) 	
end
-- 修改一，取消默认点击区域为图片的中心部分区域
-- 修改二：修复设置图片scale后，由于区域判断规则不兼容的原因，导致无法准确获取结果
function CCSNode:addNormalTouchEventToPic( btnNode, callback, param )
	local function onTouchBegan( touch, event )
		local ret 	= bole.containsPoint( touch, event, nil )
        return ret
    end
    local function onTouchEnded( touch, event )
        if bole.containsPoint( touch, event, nil ) and callback then
        	callback(param)
        end
    end
    local function onTouchCancel( touch, event )
        -- todo
    end
	bole.addEventToNode( btnNode, onTouchBegan, onTouchEnded, onTouchCancel, nil ) 	
end

function CCSNode:runTimeLine( startFrame, endFrame, loop, speed )
	
	local action = cc.CSLoader:createTimeline(self.csb)
	if not action then
		bole.send_codeInfo(Splunk_Type.Error, {error = "empty", msg = "CCSNode:runTimeLine.action", csb = self.csb}, false)
		return
	end
	
	if libUI.isValidNode(self.node) then
		self.node:runAction(action)
	else
		bole.send_codeInfo(Splunk_Type.Error, {error = "empty", msg = "CCSNode:runTimeLine.node", csb = self.csb}, false)
	end
	loop = loop or false
	if endFrame then
		action:gotoFrameAndPlay(startFrame, endFrame, loop)
	else
		action:gotoFrameAndPause(startFrame)
	end
	if speed then
		action:setTimeSpeed(speed)
	end
	self.currentTimeLine = action
end

function CCSNode:pauseTimeLine( ... )
	if self.currentTimeLine then
		self.currentTimeLine:pause()
	end
end

----------------------------------------------------
-- 功能：
-- 1）show时冻结主题，hide时解冻主题；
-- 2）弹窗生命期内，不允许其它弹窗出现；
function CCSNode:showActions( ... )
    -- 开始弹窗, 不允许其它弹窗出现
	PopupController:getInstance():setShowKey(self.csb)
	PopupController:getInstance():showActions()
end

function CCSNode:hideActions(flag, csb)
    -- 关闭弹窗, 允许其它弹窗出现
    local csb = csb or self.csb
	PopupController:getInstance():setHideKey(csb)
    PopupController:getInstance():hideActions()
end

ActivityBaseDialogEx = class("ActivityBaseDialogEx" , CCSNode)

function ActivityBaseDialogEx:ctor(...) 
	CCSNode.ctor(self, ...) 
end
-- 是否弃用点击功能
function ActivityBaseDialogEx:enableButtons(enable) 
	local clickNodeList = self:getClickNodeList()
	for key, btn in pairs(clickNodeList) do 
		if libUI.isValidNode(btn) and btn.setTouchEnabled then
			if btn.call then
				btn:setTouchEnabled(btn.call(enable))
			else
				btn:setTouchEnabled(enable)
			end
		end
	end 
end
-- 添加可点击节点到操作集合中
function ActivityBaseDialogEx:appendClickNodeToList(btn , callback) 
	if not btn then return end
	btn.call = callback
	self._clickNodeList = self._clickNodeList or {}
	table.insert(self._clickNodeList , btn)
end
-- 获取可点击节点集合
function ActivityBaseDialogEx:getClickNodeList() 
	self._clickNodeList = self._clickNodeList or {}
	return self._clickNodeList
end
-- 移除可点击节点
function ActivityBaseDialogEx:removeClickNodeList(node)  
	local remove_index = 0
	for i, v in ipairs(self._clickNodeList or {}) do
		if v == node then
			remove_index = i
			break
		end
	end
	if remove_index ~= 0 then
		table.remove(self._clickNodeList or {} , remove_index)
	end
end
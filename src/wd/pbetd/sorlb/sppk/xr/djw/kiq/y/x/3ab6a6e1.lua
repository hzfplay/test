local ____wprs = nil
local ___tab_urpj = {}
local ___tab_lsxuf = {}
local ___bool_ej = false
local ___str_bwztf = "wxvhbh"
local ____dspoo = nil
local ___str_rjoj = "gyptcb"
local ____er = nil
local ___int_czp = 53
local ____ynefe = nil
local ___int_cv = 31
local ___tab_nydou = {}
local ____cyxox = nil
local ____faav = nil
local ___str_jko = "fslyor"
local ____qskt = nil

local function ___bv()
	local _ergzt = nil
	local tab_kb = {}
	local int_tdn = 77
	local _ievsp = nil
	local bool_snw = false
end

local function ___tzqh()
	local tab_xhvoj = {}
	local bool_lm = false
	local bool_pcb = false
	local str_baonb = "llo"
	local tab_xnjx = {}
end

local function ___gxj()
	local tab_fbpof = {}
	local _oo = nil
	local tab_kqjal = {}
end

local function ___wb()
	local _arry = nil
	local _ph = nil
	local _wjlx = nil
	local _hzx = nil
end

local function ___lmt()
	local tab_fned = {}
	local _plyz = nil
	local int_xoik = 46
	local bool_ai = false
	local str_jy = "kxell"
end

local function ___quhzf()
	local str_mzns = "oidbp"
	local bool_angmq = false
	local str_ifha = "nineyi"
	local _kqkbn = nil
	local _nis = nil
end

local function ___yng()
	local str_de = "nec"
	local _onfyl = nil
	local bool_dif = false
	local _ywtg = nil
end

local function ___iau()
	local str_woy = "osggga"
	local bool_vou = false
end

local function ___dicx()
	local int_rosx = 92
	local tab_vde = {}
	local str_xju = "svqcti"
	local int_ryez = 10
	local tab_abdd = {}
end

local function ___mzcsg()
	local str_iwt = "ein"
	local tab_vz = {}
	local _qug = nil
	local bool_knqg = false
	local str_gdiey = "fzyouo"
end

local function ___jqql()
	local tab_om = {}
	local bool_jyo = false
	local int_bbesp = 42
	local tab_vsf = {}
	local bool_jbyp = false
end

local function ___mcvyg()
	local tab_tjbj = {}
	local int_ez = 68
	local int_wkmk = 26
end

local function ___tgmal()
	local bool_rz = false
	local int_aus = 71
	local tab_yy = {}
	local _whwet = nil
end

local function ___pk()
	local int_dc = 7
	local bool_artu = false
	local _krhq = nil
end

local function ___ekc()
	local bool_cto = false
	local int_xie = 44
	local _lqm = nil
end

local function ___jmj()
	local int_ku = 68
	local str_jsc = "xpff"
	local tab_fn = {}
end

local function ___esh()
	local str_czqe = "gbpe"
	local int_lfz = 44
end

local function ___mo()
	local str_rmf = "qmsz"
	local tab_dz = {}
	local bool_dz = false
	local tab_ksp = {}
	local bool_ram = false
end

local function ___kwm()
	local _zoyv = nil
	local int_xokka = 12
	local int_vqja = 48
end

local function ___yw()
	local bool_gdwn = false
	local int_ryrt = 19
	local bool_bmc = false
	local int_rkg = 65
end

local function ___iz()
	local tab_edgx = {}
	local str_xbxi = "oxyy"
end
local BLControllerBase = require("UI/CreatorUI/BLControllerBase")
local CreatorScrollBar = class("CreatorScrollBar", BLControllerBase)

function CreatorScrollBar:ctor()
    BLControllerBase.ctor(self)
end


function CreatorScrollBar:initUI()
    self._node = self:getRoot();
    self.bar = self._node.bar
    self.size = self._node:getContentSize()
    local barSize = self.bar:getContentSize()
    self.maxX = self.size.width - barSize.width;
    self.maxY = self.size.height - barSize.height;
    
    self.direction = self.maxX > self.maxY and 0 or 1
    local anchor = self.bar:getAnchorPoint()
    if self.direction == 0 then
        self.bar:setPositionX(0)
        self.bar:setAnchorPoint(cc.p(0,anchor.y))
    else
        self.bar:setPositionY(self.maxY)
        self.bar:setAnchorPoint(cc.p(anchor.x, 0))
    end
    self.currentPosition = 0
    self:addTouchEvent(self.bar, self.on_move_clicked)
end

function CreatorScrollBar:addTouchEvent( btn, event, param )
	local function btnEvent(sender, eventType)
       self:on_move_clicked(sender, eventType)
    end
    btn:addTouchEventListener(btnEvent)
end

function CreatorScrollBar:on_move_clicked(sender, eventType)
    if eventType == ccui.TouchEventType.began then
        if self.direction == 0 then
            self.currentPosition = self.bar:getPositionX()
        else
            self.currentPosition = self.bar:getPositionY()
        end
    else
        local beganPosition = sender:getTouchBeganPosition();
        local move = sender:getTouchMovePosition();
        if self.direction == 0 then
            local offsetX = self.currentPosition + move.x - beganPosition.x
            if offsetX < 0 then
                offsetX = 0
            elseif offsetX > self.maxX then
                offsetX = self.maxX
            end
            self.percent = offsetX / self.maxX
            self.bar:setPositionX(offsetX)
            self:updateScrollViewPositionX()
            local _ = self._callback and self._callback(self.percent * 100)
        else
            local offsetY = self.currentPosition + move.y - beganPosition.y
            if offsetY < 0 then
                offsetY = 0
            elseif offsetY > self.maxY then
                offsetY = self.maxY
            end
            self.percent = offsetY / self.maxY
            self.bar:setPositionY(offsetY)
            self:updateScrollViewPositionY()
            local _ = self._callback and self._callback(self.percent * 100)
        end
    end
end

function CreatorScrollBar:setScrollView(_node, _initEvent)
    self.scrollView = _node
    if _initEvent == true then
        self:initScrollViewEvent()
    end
    
end

function CreatorScrollBar:initScrollViewEvent( ... )
    self.scrollView:addEventListener(function(event, tag)
        self:on_scroll_view_event(event, tag)
    end)
end

function CreatorScrollBar:on_scroll_view_event(event, tag)
    if tag == ccui.ScrollviewEventType.containerMoved then
        local nodeSize = self.scrollView:getContentSize()
        local contentSize = self.scrollView:getInnerContainerSize()
        local pos = self.scrollView:getInnerContainerPosition()
        local percent = 0
        if self.direction == 0 then
            local maxX = contentSize.width - nodeSize.width;
            percent = maxX == 0 and 100 or -pos.x / maxX * 100
        else
            local maxY = contentSize.height - nodeSize.height;
            percent = maxY == 0 and 100 or -pos.y / maxY * 100
        end
        self:setPercent(percent)
    end
end

function CreatorScrollBar:updateScrollViewPositionX()
    if self.scrollView then
        local node = self.scrollView:getInnerContainer()
        local nodeSize = self.scrollView:getContentSize()
        local contentSize = node:getContentSize()
        local maxX = contentSize.width - nodeSize.width;
        self.scrollView:stopAutoScroll()
        node:setPositionX(self.percent * maxX * -1)
    end
end

function CreatorScrollBar:updateScrollViewPositionY()
    if self.scrollView then
        local node = self.scrollView:getInnerContainer()
        local nodeSize = self.scrollView:getContentSize()
        local contentSize = node:getContentSize()
        local maxY = contentSize.height - nodeSize.height;
        self.scrollView:stopAutoScroll()
        node:setPositionY(self.percent * maxY * -1)
    end
end

function CreatorScrollBar:setPercent(value)
    value = math.min(value, 100)
    value = math.max(value, 0)
    self.percent = value * 0.01
    if self.direction == 0 then
        self.bar:setPositionX(self.percent * self.maxX)
    else
        self.bar:setPositionY(self.percent * self.maxY)
    end
end

function CreatorScrollBar:setChangeCallback(callback)
    self._callback = callback
end

return CreatorScrollBar

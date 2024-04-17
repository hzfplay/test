local ____kygi = nil
local ___int_ly = 89
local ____eeto = nil
local ___int_xluk = 89
local ___str_jgh = "ywzqi"
local ___int_na = 57
local ___int_oiuej = 90
local ____mey = nil
local ___int_dv = 68
local ___tab_zr = {}
local ___str_hchn = "vmhf"
local ___int_wnuv = 50
local ____ugxdh = nil
local ___int_djhtp = 57
local ___str_ih = "cnvcga"
local ___str_he = "tkjxx"
local ___str_kposw = "qrkxc"
local ____ucs = nil
local ___bool_whhpo = false
local ____wtmb = nil
local ___str_bdzq = "hdl"
local ___bool_veb = false
local ____bizig = nil

local function ___hxxc()
	local int_yo = 56
	local int_nqhjn = 2
end

local function ___krypy()
	local tab_ffr = {}
	local _xgy = nil
	local tab_cxbvz = {}
	local tab_vt = {}
end

local function ___lgcvo()
	local _ynpb = nil
	local tab_ovla = {}
	local _pi = nil
	local _sm = nil
end

local function ___uw()
	local bool_zw = false
	local bool_wboza = false
	local bool_zuyki = false
	local str_vhw = "sxedx"
end

local function ___qyk()
	local bool_rakk = false
	local bool_cplh = false
	local _psb = nil
	local str_iijxa = "xtokkg"
end

local function ___gnu()
	local bool_brsql = false
	local _sv = nil
	local bool_ykdfd = false
	local int_jlin = 82
end

local function ___lbupf()
	local int_nirz = 17
	local bool_ql = false
end

local function ___yvp()
	local bool_his = false
	local int_how = 37
	local _xdvvn = nil
end

local function ___vm()
	local tab_jxk = {}
	local bool_af = false
	local int_wt = 87
	local _ur = nil
end

local function ___uno()
	local tab_ks = {}
	local str_atz = "vkpps"
	local _qf = nil
	local int_csmlx = 8
end

local function ___yum()
	local bool_grafw = false
	local int_tcxn = 50
	local tab_kqoos = {}
	local _fo = nil
	local tab_hz = {}
end

local function ___kil()
	local tab_fum = {}
	local str_wc = "isyng"
	local str_pf = "zlperi"
end

local function ___ngy()
	local int_ekzk = 5
	local int_dkbhz = 46
end

local function ___xul()
	local tab_lb = {}
	local int_jznof = 81
end

local function ___cke()
	local int_ieolv = 23
	local int_qitk = 54
	local _tfe = nil
	local _naz = nil
end

local function ___vby()
	local int_reigs = 27
	local str_hm = "xqnh"
end

local function ___ns()
	local bool_jn = false
	local bool_rs = false
	local tab_pp = {}
	local _jlm = nil
end

local function ___mvfhm()
	local _qrge = nil
	local int_lplj = 70
end

local function ___kadl()
	local int_zrft = 3
	local tab_ddhg = {}
	local int_pxr = 28
	local _ces = nil
end

local function ___md()
	local _ft = nil
	local str_kaysv = "xcel"
	local int_cx = 99
end

local function ___vpi()
	local bool_we = false
	local str_vc = "dtwtcy"
	local int_uyuj = 16
	local tab_uzcx = {}
	local bool_su = false
end

local function ___rkgub()
	local bool_yzj = false
	local _vhywc = nil
	local int_pitav = 64
end

local function ___wgc()
	local bool_vmd = false
	local bool_wry = false
	local _qx = nil
end

local function ___gzjm()
	local _xdx = nil
	local tab_vxc = {}
	local _im = nil
	local _uwg = nil
end
local BLControllerBase = require("UI/CreatorUI/BLControllerBase")

local CreatorWidget = class("CreatorWidget", BLControllerBase)

function CreatorWidget:ctor()
    BLControllerBase.ctor(self)
end

function CreatorWidget:setNode(_node)
    self.node = _node
end

function CreatorWidget:initUI()
    self._node = self:getRoot();
    self._widget = self:getConfig();
    self:updateAlignment();
end

function CreatorWidget:updateSize(_size)
    if self.__cname == "BLScrollView" then
        
    end
    self._node:setContentSize(_size)
    self:updateChildAlignment()
end

function CreatorWidget:updateChildAlignment()
    self._node = self:getRoot();
    local childs = self._node:getChildren()
    local ctrl = nil
    for i, node in ipairs(childs) do
        if node.getController then
            ctrl = node:getController("CreatorWidget")
            local _ = ctrl and ctrl:updateAlignment()
        end
    end
end

-- @property {_node} cc.Node
-- @property {widget} {}
function CreatorWidget:updateAlignment()
    local widget = self._widget
    local parent = self._node:getParent()
    if parent == nil then
        return
    end
    local anchor = self._node:getAnchorPoint()
    local windowSize = parent:getContentSize()
    if windowSize.width == 0 and windowSize.height == 0 then
        windowSize.width = FRAME_HEIGHT;
        windowSize.height = FRAME_WIDTH;
    end

    local size = self._node:getContentSize()
    local height = size.height
    local width = size.width
    local x,y = self._node:getPosition()

    if widget.top ~= nil or widget.bottom ~= nil then
        if widget.top ~= nil and widget.bottom ~= nil then
            height = windowSize.height - widget.top - widget.bottom
            y = widget.bottom + (height * anchor.y)
        elseif widget.top ~= nil then
            y = windowSize.height - widget.top - (height * (1- anchor.y))
        elseif widget.bottom ~= nil then
            y = widget.bottom + (height * anchor.y)
        end
    end

    if widget.right ~= nil or widget.left ~= nil then
        if widget.right ~= nil and widget.left ~= nil then
            width = windowSize.width - widget.right - widget.left
            x = widget.left + (width * anchor.x)
        elseif widget.right ~= nil then
            x = windowSize.width - widget.right - (width * (1 - anchor.x))
        elseif widget.left ~= nil then
            x = widget.left + (width * anchor.x)
        end
    end

    if widget.horizontalCenter then
        x = windowSize.width / 2 + widget.horizontalCenter
    end

    if widget.verticalCenter then
        y = windowSize.height / 2 + widget.verticalCenter
    end
    -- print("ok in ", self._node.name, x, y, width, height)
    self._node:setPosition(x, y)
    self:updateSize(cc.size(width, height))
end

function CreatorWidget:setWidget(_widget)
    self._widget = _widget
    self:updateAlignment()
end

return CreatorWidget

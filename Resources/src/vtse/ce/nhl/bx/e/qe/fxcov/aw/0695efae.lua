local ___str_wuz = "aglbew"
local ___tab_cjp = {}
local ___bool_ya = false
local ___str_kzezk = "skua"
local ___bool_lmo = false
local ___tab_et = {}
local ___int_jg = 2
local ___str_zl = "hpwwn"
local ____solg = nil
local ____vwg = nil
local ___int_vjo = 59
local ___int_hgnkg = 8
local ___int_gatg = 67
local ___str_smmvt = "vzge"

local function ___edz()
	local bool_snnob = false
	local bool_jj = false
	local int_pslei = 29
end

local function ___syh()
	local tab_gp = {}
	local _ny = nil
	local str_cetes = "umgo"
end

local function ___jzoru()
	local int_ln = 9
	local str_iro = "vgav"
	local tab_zxgl = {}
end

local function ___ziwdo()
	local _mdcq = nil
	local str_rgk = "zirvwh"
end

local function ___hkbpr()
	local int_yblf = 35
	local tab_aym = {}
	local _kpbhy = nil
	local int_bcr = 17
	local int_nhms = 78
end

local function ___jifqb()
	local int_ht = 31
	local tab_hcp = {}
	local bool_ctlkj = false
	local int_owv = 18
	local tab_pyy = {}
end

local function ___oylnv()
	local _ggk = nil
	local _nolu = nil
	local tab_oy = {}
	local int_vhskz = 25
end

local function ___sx()
	local int_moycg = 47
	local bool_kwgcu = false
	local str_apbo = "jpro"
end

local function ___refac()
	local tab_gpasv = {}
	local tab_mfvf = {}
	local _vkbu = nil
	local int_gz = 65
end

local function ___kh()
	local tab_mkeq = {}
	local bool_lx = false
	local bool_sezxs = false
	local int_uz = 62
	local _bowtq = nil
end

local function ___ug()
	local str_yo = "ofdwwz"
	local _hn = nil
end

local function ___ghui()
	local int_veub = 0
	local bool_yyfj = false
end

local function ___me()
	local str_itlu = "cbs"
	local _ym = nil
end

local function ___hg()
	local int_oghp = 62
	local tab_kv = {}
	local _dlrms = nil
	local _hsadb = nil
	local bool_baij = false
end

local function ___kx()
	local tab_ttcdx = {}
	local tab_ar = {}
	local tab_wt = {}
	local tab_ca = {}
end

local function ___px()
	local _cuns = nil
	local int_yvm = 91
	local _rsx = nil
end

local function ___sdcnz()
	local _zcvzg = nil
	local tab_dot = {}
end

local function ___rfirq()
	local int_bdnuy = 65
	local _lmlv = nil
	local tab_ak = {}
	local bool_szmx = false
	local str_lr = "vzppo"
end

local function ___kr()
	local int_xszdd = 40
	local tab_ceyx = {}
end

local function ___ymr()
	local _eish = nil
	local str_eaord = "gtxga"
	local bool_pdiga = false
end

local function ___mjz()
	local str_nivk = "hfem"
	local _calfa = nil
	local bool_gvkig = false
	local tab_coom = {}
end
-- 可绑定自定义Slider的ScrollView
local BLControllerBase = require("UI/CreatorUI/BLControllerBase")
local ScrollSliderView = class("ScrollSliderView", BLControllerBase)

function ScrollSliderView: reload()
    self:initUI()
end

function ScrollSliderView: setScrollViewMoveFunc(moved_func,bottom_func)
    self.scroll_view:addEventListener(function(event, tag)
        if not self.can_scroll then
            return
        elseif tag == ccui.ScrollviewEventType.containerMoved then
            self:updateSlider()
            if moved_func then moved_func() end        
        elseif tag == ccui.ScrollviewEventType.scrollToBottom then
            if bottom_func then bottom_func() end
        end
    end)
end

function ScrollSliderView: getScrollView()
    return self.scroll_view
end

function ScrollSliderView: getSlider()
    return self.slider
end

function ScrollSliderView: ctor()
    self.min_percent = 0
    self.max_percent = 100
    self.can_scroll = true
end

function  ScrollSliderView: initUI()
    self.node = self:getRoot();
    if self.node then
        self.slider_bg = self.node:getChildByName("real_bg")
        self:_setSliderNode(self.node:getChildByName("slider"))
        self:_setScrollViewNode(self.node:getChildByName("content_sv"))
        self:_configState()
        if self.can_scroll then
            self:_configSliderNode();
            self:updateSlider()
        end
    else
        print("ScrollSliderView: node not exist!")
    end
end

function ScrollSliderView: setNode(_node)
    self.node = _node;
end

function ScrollSliderView: _setSliderNode(_node)
    self.slider = _node;
end

function ScrollSliderView: _setScrollViewNode(_node)
    self.scroll_view = _node;
end

function ScrollSliderView: _configSliderNode()
    local function percentChangedEvent(sender,eventType)
        if eventType == ccui.SliderEventType.percentChanged then
            local slider_moved_percent = self.slider:getPercent()
            if slider_moved_percent > self.max_percent then
                self.slider:setPercent(self.max_percent)
            elseif slider_moved_percent < self.min_percent then
                self.slider:setPercent(self.min_percent)
            else
                local percent = (slider_moved_percent - self.min_percent) / (self.max_percent - self.min_percent)
                self.scroll_view:scrollToPercentVertical(percent, 0.01, true)
            end
        end
    end  
    self.slider:setTouchEnabled(true)
    self.slider:addEventListener(percentChangedEvent)
end

function ScrollSliderView: _configState()
    local size_height = self.scroll_view:getContentSize().height
    local height = self.scroll_view:getInnerContainerSize().height - size_height
    self.can_scroll = height > 0
    self.slider:setVisible(self.can_scroll)
    self.slider_bg:setVisible(self.can_scroll)
    self.scroll_view:setTouchEnabled(self.can_scroll)
    return self.can_scroll
end

function ScrollSliderView:updateSlider()
    if not self.scroll_view and self.slider then return end
    local size_height = self.scroll_view:getContentSize().height
    local height = self.scroll_view:getInnerContainerSize().height - size_height
    local pos_y = self.scroll_view:getInnerContainerPosition().y
    local temp_percent = math.floor((height - math.abs(pos_y))/height * 100)
    self.slider:setPercent(temp_percent) 
end

return ScrollSliderView

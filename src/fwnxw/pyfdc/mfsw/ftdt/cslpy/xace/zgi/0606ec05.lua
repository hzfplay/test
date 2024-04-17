local ___tab_qaz = {}
local ___tab_kd = {}
local ___bool_tm = false
local ___tab_wfr = {}
local ___int_bin = 22
local ___int_xwkls = 68
local ___tab_es = {}
local ___str_lvdf = "yoexfv"
local ___int_cdbay = 99
local ___bool_bm = false
local ___bool_xl = false
local ___bool_gmu = false
local ___tab_kqtg = {}
local ____yawz = nil
local ____arpx = nil

local function ___hx()
	local int_lk = 78
	local str_spzs = "ykp"
	local int_qwylf = 57
	local tab_mq = {}
	local int_siqz = 69
end

local function ___tqnt()
	local int_nta = 74
	local _ge = nil
	local _idsr = nil
end

local function ___ijn()
	local tab_wlnn = {}
	local _ga = nil
	local int_wgey = 96
	local str_onoy = "atrecv"
	local int_jx = 73
end

local function ___ptla()
	local int_gqh = 30
	local _mswlv = nil
	local bool_keta = false
	local _ij = nil
end

local function ___dnqd()
	local bool_adwd = false
	local tab_nzm = {}
	local int_iipwn = 26
	local int_aklqf = 30
	local int_szeb = 21
end

local function ___kajqu()
	local int_xw = 85
	local bool_cvil = false
	local tab_glmr = {}
end

local function ___ptc()
	local str_rnzqs = "gxwdy"
	local bool_zeco = false
end

local function ___wvpnz()
	local tab_urh = {}
	local tab_sik = {}
end

local function ___faoys()
	local _wv = nil
	local int_ziyn = 28
	local tab_duyh = {}
end

local function ___hgyx()
	local _thma = nil
	local bool_cluvh = false
	local str_eb = "cql"
	local _mjlgs = nil
end

local function ___fbi()
	local bool_gzxb = false
	local bool_zitaj = false
	local int_xxp = 1
	local str_icbf = "tcfrd"
	local tab_xdvl = {}
end

local function ___kg()
	local _jjp = nil
	local int_twn = 18
	local _blsg = nil
	local tab_kwmwq = {}
	local tab_vaecd = {}
end

local function ___uw()
	local str_hv = "zpc"
	local str_modvm = "nfu"
	local bool_du = false
	local bool_fu = false
end

local function ___sxa()
	local int_aojx = 89
	local bool_nw = false
end

local function ___guiww()
	local str_miy = "jqz"
	local int_mjsnn = 24
	local int_yvq = 74
	local int_yvvo = 16
end

local function ___uc()
	local int_cx = 78
	local int_hp = 16
	local _tzg = nil
end

local function ___vcio()
	local _qijfa = nil
	local _you = nil
	local tab_qwtuy = {}
	local str_jkvp = "tkysq"
end

local function ___zhqk()
	local _ft = nil
	local _ffukk = nil
end

local function ___cxloo()
	local int_hbot = 62
	local str_vam = "jqhepk"
end

local function ___ebnw()
	local _sa = nil
	local tab_mkmuz = {}
	local str_fatz = "cyigb"
	local str_mwssg = "dlx"
	local _wwhhj = nil
end

local function ___by()
	local bool_ba = false
	local int_cdkj = 51
	local str_ob = "wqssiy"
	local int_qowc = 71
end

local function ___nt()
	local tab_nhmkc = {}
	local _oilew = nil
	local int_jqz = 53
	local tab_pqfnz = {}
end

local function ___hkmql()
	local bool_rw = false
	local int_bizkv = 69
	local bool_gfskx = false
	local _uoft = nil
end

local function ___vabh()
	local bool_irrsf = false
	local int_ohlpu = 56
	local _yi = nil
	local int_vs = 54
end

local function ___tkbg()
	local str_dyn = "hqncu"
	local tab_vpnw = {}
	local bool_suhar = false
	local bool_fvmxj = false
	local _tojhi = nil
end
if nil == ccui then
    return
end

--tip
local function deprecatedTip(old_name,new_name)
    print("\n********** \n"..old_name.." was deprecated please use ".. new_name .. " instead.\n**********")
end

--functions of ccui.Text will be deprecated begin
local TextDeprecated = { }
function TextDeprecated.setText(self, str)
    deprecatedTip("ccui.Text:setText","ccui.Text:setString")
    return self:setString(str)
end
ccui.Text.setText = TextDeprecated.setText

function TextDeprecated.getStringValue(self)
    deprecatedTip("ccui.Text:getStringValue","ccui.Text:getString")
    return self:getString()
end
ccui.Text.getStringValue = TextDeprecated.getStringValue

--functions of ccui.Text will be deprecated begin

--functions of ccui.TextAtlas will be deprecated begin
local TextAtlasDeprecated = { }
function TextAtlasDeprecated.setStringValue(self, str)
    deprecatedTip("ccui.TextAtlas:setStringValue","ccui.TextAtlas:setString")
    return self:setString(str)
end
ccui.TextAtlas.setStringValue = TextAtlasDeprecated.setStringValue

function TextAtlasDeprecated.getStringValue(self)
    deprecatedTip("ccui.TextAtlas:getStringValue","ccui.TextAtlas:getString")
    return self:getString()
end
ccui.TextAtlas.getStringValue = TextAtlasDeprecated.getStringValue
--functions of ccui.TextAtlas will be deprecated begin


--functions of ccui.TextBMFont will be deprecated begin
local TextBMFontDeprecated = { }
function TextBMFontDeprecated.setText(self, str)
    deprecatedTip("ccui.TextBMFont:setText","ccui.TextBMFont:setString")
    return self:setString(str)
end
ccui.TextBMFont.setText =  TextBMFontDeprecated.setText

function TextBMFontDeprecated.getStringValue(self)
    deprecatedTip("ccui.Text:getStringValue","ccui.TextBMFont:getString")
    return self:getString()
end
ccui.Text.getStringValue = TextBMFontDeprecated.getStringValue
--functions of ccui.TextBMFont will be deprecated begin

--functions of cc.ShaderCache will be deprecated begin
local ShaderCacheDeprecated = { }
function ShaderCacheDeprecated.getProgram(self,strShader)
    deprecatedTip("cc.ShaderCache:getProgram","cc.ShaderCache:getGLProgram")
    return self:getGLProgram(strShader)
end
cc.ShaderCache.getProgram = ShaderCacheDeprecated.getProgram
--functions of ccui.TextBMFont will be deprecated begin

--functions of ccui.Widget will be deprecated begin
local UIWidgetDeprecated = { }
function UIWidgetDeprecated.getLeftInParent(self)
    deprecatedTip("ccui.Widget:getLeftInParent","ccui.Widget:getLeftBoundary")
    return self:getLeftBoundary()
end
ccui.Widget.getLeftInParent = UIWidgetDeprecated.getLeftInParent

function UIWidgetDeprecated.getBottomInParent(self)
    deprecatedTip("ccui.Widget:getBottomInParent","ccui.Widget:getBottomBoundary")
    return self:getBottomBoundary()
end
ccui.Widget.getBottomInParent = UIWidgetDeprecated.getBottomInParent

function UIWidgetDeprecated.getRightInParent(self)
    deprecatedTip("ccui.Widget:getRightInParent","ccui.Widget:getRightBoundary")
    return self:getRightBoundary()
end
ccui.Widget.getRightInParent = UIWidgetDeprecated.getRightInParent

function UIWidgetDeprecated.getTopInParent(self)
    deprecatedTip("ccui.Widget:getTopInParent","ccui.Widget:getTopBoundary")
    return self:getTopBoundary()
end
ccui.Widget.getTopInParent = UIWidgetDeprecated.getTopInParent

function UIWidgetDeprecated.getSize(self)
    deprecatedTip("ccui.Widget:getSize","ccui.Widget:getContentSize")
    return self:getContentSize()
end
ccui.Widget.getSize = UIWidgetDeprecated.getSize

function UIWidgetDeprecated.setSize(self, ...)
    deprecatedTip("ccui.Widget:setSize","ccui.Widget:setContentSize")
    return self:setContentSize(...)
end
ccui.Widget.setSize = UIWidgetDeprecated.setSize

--functions of ccui.Widget will be deprecated end

--functions of ccui.CheckBox will be deprecated begin
local UICheckBoxDeprecated = { }
function UICheckBoxDeprecated.addEventListenerCheckBox(self,handler)
    deprecatedTip("ccui.CheckBox:addEventListenerCheckBox","ccui.CheckBox:addEventListener")
    return self:addEventListener(handler)
end
ccui.CheckBox.addEventListenerCheckBox = UICheckBoxDeprecated.addEventListenerCheckBox

function UICheckBoxDeprecated.setSelectedState(self,flag)
   deprecatedTip("ccui.CheckBox:setSelectedState", "ccui.CheckBox:setSelected")
   return self:setSelected(flag)
end
ccui.CheckBox.setSelectedState = UICheckBoxDeprecated.setSelectedState

function UICheckBoxDeprecated.getSelectedState(self)
   deprecatedTip("ccui.CheckBox:getSelectedState", "ccui.CheckBox:getSelected")
   return self:getSelected()
end
ccui.CheckBox.getSelectedState = UICheckBoxDeprecated.setSelectedState

--functions of ccui.CheckBox will be deprecated end

--functions of ccui.Slider will be deprecated begin
local UISliderDeprecated = { }
function UISliderDeprecated.addEventListenerSlider(self,handler)
    deprecatedTip("ccui.Slider:addEventListenerSlider","ccui.Slider:addEventListener")
    return self:addEventListener(handler)
end
ccui.Slider.addEventListenerSlider = UISliderDeprecated.addEventListenerSlider
--functions of ccui.Slider will be deprecated end

--functions of ccui.TextField will be deprecated begin
local UITextFieldDeprecated = { }
function UITextFieldDeprecated.addEventListenerTextField(self,handler)
    deprecatedTip("ccui.TextField:addEventListenerTextField","ccui.TextField:addEventListener")
    return self:addEventListener(handler)
end
ccui.TextField.addEventListenerTextField = UITextFieldDeprecated.addEventListenerTextField

function UITextFieldDeprecated.setText(self, str)
    deprecatedTip("ccui.TextField:setText","ccui.TextField:setString")
    return self:setString(str)
end
ccui.TextField.setText = UITextFieldDeprecated.setText

function UITextFieldDeprecated.getStringValue(self)
    deprecatedTip("ccui.TextField:getStringValue","ccui.TextField:getString")
    return self:getString()
end
ccui.TextField.getStringValue = UITextFieldDeprecated.getStringValue
--functions of ccui.TextField will be deprecated end

--functions of ccui.PageView will be deprecated begin
local UIPageViewDeprecated = { }
function UIPageViewDeprecated.addEventListenerPageView(self,handler)
    deprecatedTip("ccui.PageView:addEventListenerPageView","ccui.PageView:addEventListener")
    return self:addEventListener(handler)
end
ccui.PageView.addEventListenerPageView = UIPageViewDeprecated.addEventListenerPageView

function UIPageViewDeprecated.addWidgetToPage(self, widget, pageIdx)
    deprecatedTip("ccui.PageView:addWidgetToPage","ccui.PageView:insertPage")
    return self:insertPage(widget, pageIdx)
end
ccui.PageView.addWidgetToPage = UIPageViewDeprecated.addWidgetToPage

function UIPageViewDeprecated.getCurPageIndex(self)
    deprecatedTip("ccui.PageView:getCurPageIndex","ccui.PageView:getCurrentPageIndex")
    return self:getCurrentPageIndex()
end
ccui.PageView.getCurPageIndex = UIPageViewDeprecated.getCurPageIndex

function UIPageViewDeprecated.setCurPageIndex(self, index)
    deprecatedTip("ccui.PageView:setCurPageIndex","ccui.PageView:setCurrentPageIndex")
    return self:setCurrentPageIndex(index)
end
ccui.PageView.setCurPageIndex = UIPageViewDeprecated.setCurPageIndex

function UIPageViewDeprecated.getPages(self)
    deprecatedTip("ccui.PageView:getPages","ccui.PageView:getItems")
    return self:getItems()
end
ccui.PageView.getPages = UIPageViewDeprecated.getPages

function UIPageViewDeprecated.getPage(self, index)
    deprecatedTip("ccui.PageView:getPage","ccui.PageView:getItem")
    return self:getItem(index)
end
ccui.PageView.getPage = UIPageViewDeprecated.getPage

function UIPageViewDeprecated.setCustomScrollThreshold(self)
    print("Since v3.9, this method has no effect.")
end
ccui.PageView.setCustomScrollThreshold = UIPageViewDeprecated.setCustomScrollThreshold

function UIPageViewDeprecated.getCustomScrollThreshold(self)
    print("Since v3.9, this method has no effect.")
end
ccui.PageView.getCustomScrollThreshold = UIPageViewDeprecated.getCustomScrollThreshold

function UIPageViewDeprecated.isUsingCustomScrollThreshold(self)
    print("Since v3.9, this method has no effect.")
end
ccui.PageView.isUsingCustomScrollThreshold = UIPageViewDeprecated.isUsingCustomScrollThreshold

function UIPageViewDeprecated.setUsingCustomScrollThreshold(self)
    print("Since v3.9, this method has no effect.")
end
ccui.PageView.setUsingCustomScrollThreshold = UIPageViewDeprecated.setUsingCustomScrollThreshold
--functions of ccui.PageView will be deprecated end

--functions of ccui.ScrollView will be deprecated begin
local UIScrollViewDeprecated = { }
function UIScrollViewDeprecated.addEventListenerScrollView(self,handler)
    deprecatedTip("ccui.ScrollView:addEventListenerScrollView","ccui.ScrollView:addEventListener")
    return self:addEventListener(handler)
end
ccui.ScrollView.addEventListenerScrollView = UIScrollViewDeprecated.addEventListenerScrollView
--functions of ccui.ScrollView will be deprecated end

--functions of ccui.ListView will be deprecated begin
local UIListViewDeprecated = { }
function UIListViewDeprecated.addEventListenerListView(self,handler)
    deprecatedTip("ccui.ListView:addEventListenerListView","ccui.ListView:addEventListener")
    return self:addEventListener(handler)
end
ccui.ListView.addEventListenerListView = UIListViewDeprecated.addEventListenerListView

function UIListViewDeprecated.requestRefreshView(self)
    deprecatedTip("ccui.ListView:requestRefreshView","ccui.ListView:forceDoLayout")
    return self:forceDoLayout()
end
ccui.ListView.requestRefreshView = UIListViewDeprecated.requestRefreshView

function UIListViewDeprecated.refreshView(self)
    deprecatedTip("ccui.ListView:refreshView","ccui.ListView:refreshView")
    return self:forceDoLayout()
end
ccui.ListView.refreshView = UIListViewDeprecated.refreshView
--functions of ccui.ListView will be deprecated end

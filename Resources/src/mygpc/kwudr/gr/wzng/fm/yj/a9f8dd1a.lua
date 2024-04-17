local ___bool_kkul = false
local ___bool_nnl = false
local ____apn = nil
local ___bool_cnbk = false
local ___tab_nzkpw = {}
local ___str_ghb = "lkp"
local ___int_lfrg = 83
local ___tab_sk = {}
local ____kl = nil
local ___bool_qaya = false
local ___int_hnulq = 75
local ___str_fr = "vhv"
local ___str_ccsom = "muzo"
local ____kee = nil
local ___int_xm = 60
local ___str_fl = "hozi"

local function ___onbj()
	local str_ilmr = "wtkf"
	local tab_bqwt = {}
end

local function ___cnh()
	local tab_ypvy = {}
	local int_eeji = 45
	local tab_xcw = {}
	local _rrd = nil
end

local function ___gb()
	local tab_vf = {}
	local str_paod = "uupz"
	local _stiwb = nil
	local _wb = nil
end

local function ___pv()
	local str_gr = "dmpk"
	local int_add = 65
	local str_dsh = "kxwuq"
	local tab_aysrq = {}
end

local function ___ctzwi()
	local _ctb = nil
	local _is = nil
	local _hbvm = nil
	local str_sy = "mgnjx"
end

local function ___pkho()
	local _geimw = nil
	local bool_coldr = false
	local str_bkc = "xlprt"
end

local function ___juq()
	local _aass = nil
	local str_wtyc = "nycgw"
	local tab_ww = {}
	local bool_rykeh = false
end

local function ___bfrkd()
	local bool_mf = false
	local int_yelyc = 85
	local str_xxbuy = "uoqkn"
	local _aosl = nil
	local tab_xh = {}
end

local function ___qsg()
	local int_uu = 30
	local int_re = 43
	local tab_damd = {}
	local str_lbha = "ifnu"
	local _xguz = nil
end

local function ___ncik()
	local str_nb = "jko"
	local tab_rak = {}
	local bool_hm = false
	local int_lguhi = 41
end

local function ___gusa()
	local _gysqb = nil
	local bool_ciz = false
	local int_mg = 95
	local _mcn = nil
	local bool_deuof = false
end

local function ___sg()
	local _pqdd = nil
	local str_pgdn = "ugpc"
	local int_ge = 65
	local str_wdat = "hfifvu"
end

local function ___iyb()
	local tab_yj = {}
	local tab_fe = {}
	local str_znt = "mwxshg"
end

local function ___fj()
	local tab_zcv = {}
	local int_qn = 0
	local tab_sfpim = {}
	local int_cyxx = 43
end

local function ___mh()
	local int_seoam = 38
	local str_dyjg = "yijksf"
end

local function ___ebo()
	local _csp = nil
	local str_imjdl = "unq"
end

local function ___adqhh()
	local bool_mow = false
	local tab_ynqu = {}
	local bool_cux = false
	local tab_zoxke = {}
	local str_ipis = "fdrd"
end

local function ___vzq()
	local bool_ipxs = false
	local str_zum = "job"
	local _rrnd = nil
end

local function ___ymntw()
	local str_lz = "zkllf"
	local int_rosc = 70
	local bool_upv = false
	local tab_eujtj = {}
	local _eop = nil
end

local function ___pn()
	local str_rc = "gmice"
	local int_laqzs = 5
	local tab_dx = {}
	local bool_lokz = false
end

local function ___lnoet()
	local int_fuwi = 27
	local tab_xkcrc = {}
	local bool_tfbe = false
end
--[[
    输入框
    textfield -> editbox
]]

BaseInput = class("BaseInput")

function BaseInput:ctor( parent, template )
    local size = template:getContentSize()
    local fontName = template:getFontName()
    local node = nil
    if true then
        -- node = ccui.EditBox:create(size, "commonImages/b_theme_bar.png")
        node = ccui.EditBox:create(size, "commonpics/kong.png")
        node:registerScriptEditBoxHandler(function(eventType, sender)
            if eventType == "began" then
                if self._callback_began then
                    self._callback_began()
                end
            elseif eventType == "changed" then
                if self._callback_changed then
                    self._callback_changed()
                end
            elseif eventType == "ended" then
                if self._callback_ended then
                    self._callback_ended()
                end
            elseif eventType == "return" then
                if self._callback_return then
                    self._callback_return()
                end
            end
        end)
        -- node:setFontName(fontName)
        node:setInputMode(cc.EDITBOX_INPUT_MODE_ANY)
        node:setInputFlag(cc.EDITBOX_INPUT_FLAG_INITIAL_CAPS_WORD)
        node:setReturnType(cc.KEYBOARD_RETURNTYPE_DONE)
    else
        node = ccui.TextField:create()
        node:addEventListener(function(sender, eventType)
            if eventType == ccui.TextFiledEventType.attach_with_ime then
                if self._callback_began then
                    self._callback_began()
                end
            elseif eventType == ccui.TextFiledEventType.detach_with_ime then
                if self._callback_ended then
                    self._callback_ended()
                end
            elseif eventType == ccui.TextFiledEventType.insert_text then
                if self._callback_changed then
                    self._callback_changed()
                end
            elseif eventType == ccui.TextFiledEventType.delete_backward then
                if self._callback_changed then
                    self._callback_changed()
                end
            end
        end)
        -- 需要先设置字体再设置光标
        node:setFontName(fontName)
        -- 显示末尾光标
        node:setCursorEnabled(true)
        -- 去掉开始光标
        libUI.initTextField(node)
        -- 固定大小
        node:ignoreContentAdaptWithSize(false)
        -- 限制长度
        node:setMaxLengthEnabled(true)
        -- 自动换行
        local render = node:getVirtualRenderer()
        if render then
            render = tolua.cast(render,"cc.Label")
            if render then
                render:setLineBreakWithoutSpace(true)
            end
        end
        -- 尺寸
        node:setContentSize(size)
    end
    self.__node = node
    self.__type = node[".classname"]
    parent:addChild(node)
    -- 元表，想实现函数检测优先级：1BaseInput 2node
    setmetatable(self, {__index = function (t, key)
        -- t.class=BaseInput
        if t.class[key] then
            return t.class[key]
        elseif self.__node[key] then
            return function ( _self, ... )
                self.__node[key](self.__node, ...)
            end
        end
    end})
    self:initByCsbTextField(template)
end

-- 是否可用
function BaseInput:isValidNode()
    if self.__type == "ccui.TextField" then
        return libUI.isValidNode(self.__node)
    elseif self.__type == "ccui.EditBox" then
        return libUI.isValidNode(self.__node)
    end
end

-- 获取字符串
function BaseInput:getString()
    if self.__type == "ccui.TextField" then
        return self.__node:getString()
    elseif self.__type == "ccui.EditBox" then
        return self.__node:getText()
    end
end
-- 设置字符串
function BaseInput:setString( str )
    if self.__type == "ccui.TextField" then
        return self.__node:setString(str)
    elseif self.__type == "ccui.EditBox" then
        return self.__node:setText(str)
    end
end
-- 显示隐藏键盘
function BaseInput:showKeyboard()
    if self.__type == "ccui.TextField" then
        return self.__node:attachWithIME()
    elseif self.__type == "ccui.EditBox" then

    end
end
function BaseInput:hideKeyboard()
    if self.__type == "ccui.TextField" then
        return self.__node:didNotSelectSelf()
    elseif self.__type == "ccui.EditBox" then

    end
end

-- 设置回调函数
-- 开始
function BaseInput:listenEventBegan( callback )
    self._callback_began = callback
end
-- 修改
function BaseInput:listenEventChanged( callback )
    self._callback_changed = callback
end
-- 结束
function BaseInput:listenEventEnded( callback )
    self._callback_ended = callback
end
-- 返回
function BaseInput:listenEventReturn( callback )
    self._callback_return = callback
end

function BaseInput:isEditBox()
    return self.__type == "ccui.EditBox"
end

function BaseInput:initByCsbTextField( node )
    self:setAnchorPoint(cc.p(node:getAnchorPoint()))
    self:setPosition(cc.p(node:getPosition()))
    self:setPlaceHolder(node:getPlaceHolder())
    self:setFontSize(node:getFontSize())
    self:setMaxLength(node:getMaxLength())
    self:setTouchEnabled(node:isTouchEnabled())
end
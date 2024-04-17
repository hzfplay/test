local ___str_fb = "xtnuxm"
local ___tab_qmtmf = {}
local ___str_sjf = "iyj"
local ___int_uk = 74
local ___tab_ms = {}
local ___tab_ttm = {}
local ___int_dpn = 48
local ___int_jbbrt = 33
local ____nmpae = nil
local ____cyg = nil
local ___bool_ufz = false
local ___int_ykpz = 95
local ___str_su = "lfzzmt"
local ___str_cts = "dnt"
local ____fkdxo = nil
local ___str_vx = "wcdti"
local ___bool_ocigq = false
local ___tab_mzkmd = {}

local function ___zo()
	local tab_fou = {}
	local str_oleve = "uzz"
	local _iwe = nil
	local str_cgto = "hgwtjh"
end

local function ___uq()
	local _zudoh = nil
	local _mxvwt = nil
	local int_detb = 75
	local tab_fp = {}
	local _ih = nil
end

local function ___hzul()
	local str_ae = "yjd"
	local _elzr = nil
	local int_xi = 100
	local bool_pp = false
	local _gqxg = nil
end

local function ___tevz()
	local str_dvb = "iiqsbj"
	local str_yaith = "wzr"
	local _aqb = nil
	local bool_ji = false
	local tab_yai = {}
end

local function ___ru()
	local tab_kjjw = {}
	local _omcs = nil
	local str_vzof = "wbdboa"
end

local function ___jywi()
	local bool_dr = false
	local _srkl = nil
	local bool_jq = false
end

local function ___qt()
	local _zrjsv = nil
	local int_rct = 99
	local bool_ih = false
	local _xzq = nil
end

local function ___gtaaw()
	local bool_lz = false
	local str_hyyt = "hgmk"
end

local function ___by()
	local tab_bvt = {}
	local str_kod = "rpcdq"
	local str_cqq = "onc"
end

local function ___zixx()
	local bool_vsjn = false
	local tab_eowhv = {}
	local bool_syhr = false
	local tab_wuxqb = {}
end

local function ___yv()
	local bool_mii = false
	local str_mh = "awhvyb"
	local bool_bvur = false
	local _clmw = nil
end

local function ___lilvc()
	local str_jnm = "lniewi"
	local bool_gxwxt = false
	local str_sebft = "vkzban"
	local tab_vgez = {}
end

local function ___supng()
	local tab_bglyd = {}
	local int_hp = 15
	local _uw = nil
end

local function ___lsw()
	local str_yn = "chkkkv"
	local str_qxjvt = "eic"
end

local function ___if()
	local str_wxju = "abrpyr"
	local _xe = nil
	local tab_valic = {}
end

local function ___fsczy()
	local tab_lbad = {}
	local bool_kmfz = false
	local tab_kj = {}
end

local function ___cq()
	local bool_ht = false
	local int_dcnu = 12
	local tab_fran = {}
	local tab_hgc = {}
	local bool_dhw = false
end

local function ___belmd()
	local int_vmkvf = 7
	local str_ohkcc = "xgygea"
	local _xoxve = nil
	local bool_datpl = false
end

local function ___fpm()
	local _bfel = nil
	local bool_frn = false
	local int_kjoxi = 22
end

local function ___drvu()
	local _lg = nil
	local _mh = nil
	local bool_icodh = false
	local _ftyx = nil
end

local function ___lpgvm()
	local str_zrrw = "vjcbzp"
	local tab_vcvp = {}
	local _ou = nil
	local int_nmnq = 86
end

local function ___wjj()
	local _wsjw = nil
	local _gdrpw = nil
end

local function ___fdc()
	local int_llfz = 82
	local int_fndq = 92
	local int_ag = 44
	local tab_ssgdq = {}
end

local function ___ok()
	local bool_lc = false
	local bool_rwr = false
	local int_yzb = 76
	local _tik = nil
end

local function ___qftk()
	local _gouph = nil
	local int_qzop = 82
	local tab_wgn = {}
end

local function ___zl()
	local int_ht = 94
	local str_xarfz = "ptlgz"
	local bool_vs = false
	local str_smqci = "uuzzb"
	local _sk = nil
end

local function ___hi()
	local str_mbk = "mrp"
	local tab_rdz = {}
	local int_bqg = 88
	local bool_oaxtq = false
	local str_aki = "zynwg"
end
--[[
    使用方法： style 按钮样式 | text 文本 | icon 图标路径 | callFunc 监听事件
    local data = {
        style    = 1
        text     = "INVITE", 
        icon     = "",
        callFunc = function (_self, btn) 
            
        end
    }
    UIButton.new(btn, self, data)
]]--

local UIButton = class("UIButton")

function UIButton:ctor(node, parent, data)
    if node[".classname"] ~= "ccui.Button" then
        self.button = node:getChildByName("btn")
    else
        self.button = node
    end

    if self.button then
        bole.ctorUIComponent(self.button, UIComponent.CommonButton)
        self.btnSize = self.button:getContentSize()  

        self.data    = data or {}
        self:setButtonStyle(self.data.style or 1)
        self:addTouchEvent(parent)
    end

end

------------------------------ 字体 ----------------------------
--设置按钮文本
function UIButton:setButtonText()
    if self.text and self.data.text then
        self.text:setString(self.data.text)
        self:shrinkButtonText()
    end
end

--限制字体最大长度
function UIButton:shrinkButtonText()
    if self.text then
        bole.shrinkLabel(self.text, self.btnSize.width * 0.8, self.text:getScale())
    end
end


------------------------------ 按钮样式 ----------------------------
--设置按钮样式
function UIButton:setButtonStyle(style)
    if style == 1 then       --纯文本
        self:buttonStylePureText()
    elseif style == 2 then   --左边文本+右边图标
        self:buttonStyleTextIcon()
    else
        self:buttonStylePureText()
    end
end
--样式一，纯文本
function UIButton:buttonStylePureText()
    if self.data and self.data.text then
        self.text    = self.button:getChildByName("text")
        self:setButtonText()
    end
end
--样式二，左边文本+右边图标
function UIButton:buttonStyleTextIcon()
    self:buttonStylePureText()
    local path = self.data.icon
    if path then
        local pos = cc.p(self.btnSize.width * 0.85, self.btnSize.height * 0.55)
        libUI.createSprite(self.button, path, pos)
    end
end

------------------------------ 事件 ----------------------------
--设置按钮监听事件
function UIButton:addTouchEvent(parent)
    if self.data and self.data.callFunc then
        bole.addTouchEvent(self.button, self.data.callFunc, parent, {self.button})
    end
end

function UIButton:setTouchEnabled(enabled)
    if self.button then
        self.button:setTouchEnabled(enabled)
    end
end

return UIButton
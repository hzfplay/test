local ___int_cps = 62
local ___bool_qji = false
local ___tab_vefts = {}
local ____wtk = nil
local ____gf = nil
local ___int_inj = 16
local ____gvptd = nil
local ___int_ssdie = 10
local ___tab_vv = {}
local ___tab_yq = {}
local ___int_be = 92
local ____pei = nil
local ___tab_dhh = {}
local ___bool_pes = false
local ___bool_few = false
local ____pov = nil
local ___str_ajhvf = "yvy"
local ____aqw = nil
local ____rdtau = nil
local ___bool_lk = false
local ____sbwur = nil
local ___tab_owt = {}
local ___tab_nepsq = {}

local function ___vp()
	local bool_wq = false
	local str_zudg = "snoj"
	local int_eih = 76
	local _pdcc = nil
	local tab_qw = {}
end

local function ___hckj()
	local bool_xemhf = false
	local str_psh = "naltn"
end

local function ___uzqn()
	local tab_xovvn = {}
	local str_rem = "kjmm"
end

local function ___svu()
	local str_ofsou = "zbthuo"
	local str_unioz = "tsypj"
	local int_wblq = 24
	local tab_idh = {}
	local str_bxxa = "kaiexv"
end

local function ___grmk()
	local int_tzhkv = 78
	local tab_qag = {}
	local str_pgnbl = "qmzx"
end

local function ___hr()
	local _yfv = nil
	local bool_ur = false
	local tab_hymlj = {}
end

local function ___bwyc()
	local _lnhr = nil
	local int_pwe = 60
	local bool_jfl = false
	local bool_xlmd = false
end

local function ___brcy()
	local int_slj = 82
	local bool_lx = false
	local str_ydbh = "ici"
	local tab_dkmg = {}
	local bool_nozkj = false
end

local function ___kxxj()
	local int_rh = 53
	local bool_rrhf = false
end

local function ___xa()
	local int_asw = 82
	local tab_hst = {}
	local tab_ny = {}
	local int_gbgng = 74
	local int_hqp = 56
end
local BLNode      = require("UI/CreatorUI/BLNode")

local Diamond_Node = class("Coin_Node", BLNode)

local getSpinePath = function(name)
	return string.format("theme_desktop/theme%d/lobby/%s/", THEME_DESKTOP_ID, name)
end

function Diamond_Node:ctor(isPortrait)
    self.isPortrait  = bole.isThemeScene()
    self.start_scale = 0.95
    self.width       = 179
    self.nPos        = self.isPortrait and cc.p(110, -38) or cc.p(127.474, 9)
    self.csb         = "ui/header_footer/diamond_node"
    self.node        = CreatorUITools:getInstance():createUi(self.csb);
    self:addChild(self.node)
    self:loadControls()
end

function Diamond_Node:loadControls()
    self.root = self.node.root
    print(self.isPortrait, "self.isPortraitself.isPortrait")
    self.diamond_node = self.root
    self.diamond_node  :setPosition(self.nPos)
    self.sp_diamond   = self.root.sp_diamond

    
    self.label_diamonds = self.root.label_diamonds

    local tongyongDi = self.root.kuang_3
    local diamond_bg = self.root.diamond_bg
    if  self.isPortrait then
        tongyongDi:setVisible(true)
        diamond_bg:setVisible(false)

        local file = getSpinePath("fonts2") .. "tip_num.fnt"
        self.label_diamonds:setFntFile(file)
    else
        tongyongDi:setVisible(false)
        diamond_bg:setVisible(true)

        local file = getSpinePath("fonts") .. "tip_num.fnt"
        self.label_diamonds:setFntFile(file)
    end
 
    local diamonds = User:getInstance():getDiamonds()
    self.label_diamonds:setString(FONTS.format(diamonds, true))

    inherit(self.label_diamonds, LabelNumRoll)
    local parserFunc = function (n)
        return FONTS.format(n, true)
    end
    self.label_diamonds:nrInit(diamonds, 25, parserFunc)
end


return Diamond_Node
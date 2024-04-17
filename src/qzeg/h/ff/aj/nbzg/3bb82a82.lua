local ___tab_yft = {}
local ___int_vbms = 97
local ____ou = nil
local ___int_fhvd = 91
local ___bool_rdg = false
local ___str_uidq = "gwj"
local ___str_aabpp = "beybwu"
local ____gqjln = nil
local ___tab_baabd = {}
local ____czgmz = nil

local function ___xkmpg()
	local bool_xcu = false
	local bool_olint = false
	local _lmsux = nil
	local tab_jqr = {}
end

local function ___ljo()
	local tab_fjgs = {}
	local bool_foy = false
end

local function ___gxfi()
	local bool_curp = false
	local bool_xh = false
end

local function ___txq()
	local bool_gvt = false
	local str_oqh = "zpb"
	local tab_adcs = {}
	local bool_bi = false
end

local function ___myp()
	local _ro = nil
	local _ijf = nil
	local tab_oyvhd = {}
	local str_oqbvs = "mlq"
	local int_hdb = 44
end

local function ___cigb()
	local _rk = nil
	local tab_im = {}
	local int_ftn = 37
	local bool_cm = false
end

local function ___jst()
	local str_hzmw = "dcwtvb"
	local _ow = nil
	local tab_te = {}
end

local function ___rh()
	local str_abm = "oxqx"
	local tab_goxx = {}
end

local function ___zrnk()
	local int_opdo = 52
	local int_wygg = 1
	local _lc = nil
	local _epya = nil
	local bool_vov = false
end

local function ___vpcz()
	local tab_gi = {}
	local tab_of = {}
	local str_thxkz = "klj"
	local str_kclgc = "ymb"
	local bool_tdjr = false
end

local function ___acf()
	local str_dena = "jswmk"
	local _pcejh = nil
	local tab_hd = {}
	local str_lmskj = "ydaf"
end

local function ___kzb()
	local int_bki = 13
	local int_xq = 47
end

local function ___yrzq()
	local int_ov = 17
	local bool_zj = false
	local str_zt = "rnoma"
end

local function ___xchdo()
	local _enmt = nil
	local str_zes = "wtyb"
end

local function ___nom()
	local tab_erc = {}
	local tab_yfxa = {}
end

local function ___jxx()
	local int_jxepl = 46
	local int_habb = 65
	local str_gezku = "rjjlua"
	local int_iyyy = 25
	local bool_hh = false
end

local function ___cbms()
	local tab_aocke = {}
	local str_sj = "gfllr"
	local str_xsp = "nnas"
	local str_jctwq = "bhu"
end

local function ___hfrgu()
	local tab_jkar = {}
	local bool_ojrb = false
end

local function ___kmes()
	local tab_nix = {}
	local tab_zy = {}
	local str_pi = "nidde"
end

local function ___ez()
	local bool_ty = false
	local str_inbmt = "lyato"
	local tab_hy = {}
	local str_bnyqd = "yrktc"
end

local function ___inrr()
	local str_yh = "zjoic"
	local bool_bpb = false
	local _unfau = nil
	local str_jrgq = "pelkcp"
end

local function ___vo()
	local int_zbykm = 96
	local tab_gmev = {}
	local bool_fkft = false
end

local function ___oj()
	local bool_wgl = false
	local tab_dosew = {}
	local int_ozozv = 45
	local str_jlxc = "sphs"
	local _uzysw = nil
end

local function ___mt()
	local int_yzl = 39
	local tab_kqt = {}
	local str_uolq = "lbzst"
	local str_rzf = "vip"
end

local function ___uxloh()
	local str_cyoim = "lhwg"
	local _lta = nil
end

local function ___wbenk()
	local _owzxr = nil
	local tab_jffr = {}
	local tab_haag = {}
	local int_rhr = 82
end

local function ___tnig()
	local str_ixxl = "jeykl"
	local int_exv = 58
	local tab_oiny = {}
	local int_ibv = 31
end

local function ___yy()
	local str_hsxw = "hwe"
	local bool_kxds = false
	local _py = nil
	local _bep = nil
	local int_lqoj = 50
end

local function ___rdlj()
	local _rtlm = nil
	local _hezkq = nil
end

local function ___wgx()
	local int_yi = 92
	local str_qicw = "gebhx"
	local str_veke = "gijiam"
	local int_qmhcg = 11
	local bool_cxtn = false
end
HeadNode = class("HeadNode", CCSNode)

function HeadNode:ctor(themeCtl, isPortrait, theme_id)
    self.themeCtl = themeCtl
    self.isPortrait = isPortrait
    self.theme_id = theme_id
    
    CCSNode.ctor(self, "head/csb/head.csb")
    
    local touchFunc = function (sender, eventType )
        if eventType == ccui.TouchEventType.ended then
            self:backToLobbyEvent()   
        end
    end
    local btnHome = self.node:getChildByName("btn_home")
    btnHome:addTouchEventListener(touchFunc)
end

function HeadNode:backToLobbyEvent()
    bole.playMusic("game2")

	self.themeCtl:unregisterPotpCmds()
	self.themeCtl.theme:unloadThemeMusics()
    LobbyControl:getInstance():initScene("PlayScene")
end
local ____vklzn = nil
local ___bool_jvf = false
local ___int_svlbi = 94
local ___int_uuiar = 64
local ____vfh = nil
local ___bool_iv = false
local ___str_nl = "mifb"
local ___str_phicx = "wnpl"
local ____qzmy = nil
local ___tab_mrk = {}
local ___bool_dw = false
local ____ebcy = nil
local ___int_vshlj = 83
local ___str_dwfk = "sxkxmq"
local ___tab_qp = {}
local ___bool_jtf = false
local ___bool_ao = false
local ___int_ryps = 1
local ____osdn = nil
local ___str_ajtv = "znzw"
local ___str_oupzt = "caro"
local ___tab_jiw = {}
local ___int_rb = 31
local ___bool_sr = false
local ____lbusv = nil
local ___bool_gxbf = false

local function ___kmg()
	local tab_cnjem = {}
	local int_pa = 83
	local int_efg = 52
end

local function ___ttvb()
	local int_zb = 83
	local tab_qbbvi = {}
	local int_zi = 65
	local bool_otfvd = false
end

local function ___vikw()
	local bool_xjmdy = false
	local _be = nil
	local _xe = nil
end

local function ___rt()
	local _valtx = nil
	local tab_lwhd = {}
end

local function ___bcfcw()
	local bool_xxkwi = false
	local tab_ciqo = {}
end

local function ___flj()
	local int_lmx = 93
	local _cc = nil
	local tab_osmsp = {}
	local tab_efr = {}
	local _jau = nil
end

local function ___ru()
	local int_zq = 14
	local _cxv = nil
	local int_ma = 56
	local int_dkqg = 12
	local _im = nil
end

local function ___rbbfw()
	local str_xjbb = "kol"
	local _yph = nil
end

local function ___wzb()
	local tab_au = {}
	local bool_nhvip = false
end

local function ___zbijx()
	local bool_smff = false
	local int_dwmc = 75
	local _gqqxq = nil
	local _fva = nil
end

local function ___oahaw()
	local int_rz = 26
	local tab_vak = {}
end

local function ___xnz()
	local _wfdep = nil
	local str_taqk = "lokh"
	local str_nc = "fxzd"
end

local function ___pstx()
	local str_ex = "mrzm"
	local str_nmyxw = "vfzg"
	local bool_prxp = false
	local int_scpr = 12
	local _kk = nil
end

local function ___emkxv()
	local str_wngix = "mfnmpp"
	local bool_hd = false
	local bool_zh = false
	local _kni = nil
end

local function ___mcvco()
	local str_zzn = "agunll"
	local int_ow = 1
end

local function ___ixpoy()
	local int_ruczj = 65
	local bool_rb = false
	local _qzg = nil
end

local function ___mj()
	local str_wtlbo = "expurc"
	local bool_ovs = false
end

local function ___vi()
	local bool_op = false
	local int_qimyi = 90
	local bool_gpkw = false
	local _evol = nil
end

local function ___bn()
	local bool_gxtxa = false
	local bool_fl = false
	local str_eix = "gjda"
	local bool_ovog = false
	local str_auymi = "ihvdu"
end

local function ___kpgvk()
	local str_nkhk = "zdlbn"
	local _ws = nil
	local tab_oxsi = {}
end

local function ___ogvm()
	local int_rpv = 6
	local _vvb = nil
	local _zy = nil
end

local function ___xa()
	local _okiv = nil
	local bool_thmqr = false
	local _pr = nil
	local tab_jb = {}
end

local function ___cz()
	local int_ns = 64
	local str_pcyeo = "xdcynz"
	local _snztr = nil
end

local function ___hrh()
	local tab_yseaq = {}
	local tab_ipj = {}
	local str_usqu = "mhyito"
end

local function ___hb()
	local _cjpj = nil
	local int_th = 42
end

local function ___mdljt()
	local bool_viwzg = false
	local int_zffxt = 46
	local int_nici = 22
	local tab_akwt = {}
	local str_km = "ewf"
end

local function ___dms()
	local _ecjm = nil
	local bool_yxuf = false
	local int_iw = 89
	local tab_dqkw = {}
	local _zhubo = nil
end

local function ___gp()
	local tab_wgwy = {}
	local int_xzg = 91
	local tab_ejbd = {}
end

local function ___cgtc()
	local tab_xkj = {}
	local tab_lrt = {}
	local int_stdkq = 76
	local tab_wuz = {}
	local str_is = "vdrd"
end
local Inspect_Ad_Dialog = class("Inspect_Ad_Dialog", CreatorNode)

function Inspect_Ad_Dialog:ctor(data, callback)
    self.isPortrait = ScreenControl:getInstance().isPortrait
    self.ctl        = AdRewardControl:getInstance()
    self.adCoins    = self.ctl:getAdRewardCoins()
	self.csb        = "ui/inspect/inspect_ad_pop"
    CreatorNode.ctor(self, self.csb)
    self:initButtonList(true)
end

function Inspect_Ad_Dialog:loadControls()
    self.root = self.node.root
    HttpManager:getInstance():doReport(ReportConfig.btn_inspect_ad_open)


    self:setVisible(false)
    self:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(0.1),
            cc.CallFunc:create(function ( ... )
                self:setVisible(true)
                bole.popWin_4(self.root, nil, 0.36, 1)
                self:showMask(self.isPortrait, 0.2)
        end)
    ))
end

function Inspect_Ad_Dialog:show( ... )
    
    if self.isPortrait then
        self.node:setScale(SHRINKSCALE_H)
        self:setPosition(FRAME_HEIGHT/2,FRAME_WIDTH/2)
    else
        self.node:setScale(SHRINKSCALE_H)
        self:setPosition(FRAME_WIDTH/2,FRAME_HEIGHT/2)
    end

    self:showActions()
    bole.scene:addChild(self, 1000)
    self:showMask(self.isPortrait, 0)
end

function Inspect_Ad_Dialog:hide()
    if self.isHiding then return end

    if self.callback then self.callback() end
    self:hideActions(true)
    HttpManager:getInstance():doReport(ReportConfig.btn_inspect_ad_close)
    bole.closeDialog(self, bole.popExitWin)
end


function Inspect_Ad_Dialog:onBtnCloseOkClicked()
    bole.playSounds("click")
    self:hide()
end

function Inspect_Ad_Dialog:onBtnCloseClicked()
    bole.playSounds("click")
    self:hide()
end

return Inspect_Ad_Dialog
local ___bool_ixdz = false
local ___int_bdqkx = 27
local ___str_nxdvm = "ymqj"
local ___str_rczs = "migsx"
local ___tab_atwb = {}
local ___bool_rjet = false
local ___bool_zg = false
local ___tab_dct = {}
local ___bool_vx = false
local ___bool_pgi = false
local ____pdgmd = nil
local ___str_ejxt = "khizy"
local ____bsom = nil
local ___bool_dqa = false
local ___str_xecd = "gdky"
local ___bool_qki = false
local ___tab_bjsme = {}
local ___bool_dqyt = false
local ___bool_ccj = false
local ___bool_xbk = false
local ____dtrt = nil
local ___tab_wgmt = {}
local ____alric = nil
local ___str_ugk = "whted"
local ___int_uek = 58

local function ___jbc()
	local tab_kyvk = {}
	local tab_rcomp = {}
	local str_txa = "fzyso"
	local tab_piwh = {}
	local int_zwil = 54
end

local function ___deh()
	local str_ls = "mhny"
	local str_uz = "impsbl"
	local tab_nqs = {}
	local bool_xzari = false
end

local function ___wl()
	local _ws = nil
	local tab_alhf = {}
	local bool_ernh = false
	local bool_vnvg = false
end

local function ___nxze()
	local _xvnel = nil
	local int_ldmna = 80
	local str_nby = "zbys"
	local str_uxg = "hhne"
end

local function ___dhrf()
	local bool_fmrhr = false
	local tab_xveb = {}
end

local function ___ophew()
	local int_jje = 80
	local int_lllus = 2
	local tab_fo = {}
	local bool_kswq = false
end

local function ___nwpsq()
	local str_qhv = "iaiij"
	local int_jifde = 11
	local str_tei = "iyfsfn"
end

local function ___saou()
	local int_qp = 94
	local int_geuq = 33
end

local function ___uvdl()
	local _qobfk = nil
	local _miyi = nil
	local str_yp = "ktcdq"
	local _cz = nil
	local str_ttec = "rwbstg"
end

local function ___bigx()
	local str_bmgb = "rcvgu"
	local tab_nztj = {}
end

local function ___tgdj()
	local _ws = nil
	local _ln = nil
	local str_wwj = "euco"
	local _nyxok = nil
	local bool_ncbs = false
end

local function ___jkdr()
	local _vx = nil
	local int_ix = 34
end

local function ___jf()
	local bool_wi = false
	local bool_ymd = false
end

local function ___wz()
	local str_uo = "lnfqil"
	local str_cfe = "pxjk"
end

local function ___bzup()
	local str_gqgk = "heyb"
	local _rrl = nil
end

local function ___houw()
	local int_hne = 6
	local str_bhmg = "xfuyrh"
	local tab_roei = {}
end

local function ___wd()
	local int_ozs = 1
	local str_jos = "mhoivy"
	local bool_rohl = false
	local _dq = nil
end

local function ___ab()
	local str_ipq = "nlhm"
	local tab_ktb = {}
	local _wpleb = nil
	local _jgd = nil
end

local function ___qwhz()
	local tab_bea = {}
	local _wybr = nil
	local _wdv = nil
	local _nkyh = nil
end

local function ___qh()
	local int_nt = 87
	local bool_utzdy = false
	local str_ytmgg = "fnsz"
end
local Inspect_facebook_Dialog = class("Inspect_facebook_Dialog", CreatorNode)

function Inspect_facebook_Dialog:ctor(data, callback)
    self.isPortrait = ScreenControl:getInstance().isPortrait
    self.ctl        = AdRewardControl:getInstance()
    self.adCoins    = self.ctl:getAdRewardCoins()
	self.csb        = "ui/inspect/inspect_facebook_pop"
    CreatorNode.ctor(self, self.csb )
    self:initButtonList(true)
end

function Inspect_facebook_Dialog:loadControls()
    self.root = self.node.root
    HttpManager:getInstance():doReport(ReportConfig.btn_inspect_fb_open)
end

function Inspect_facebook_Dialog:show( ... )
    
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

function Inspect_facebook_Dialog:hide()
    if self.isHiding then return end

    if self.callback then self.callback() end
    self:hideActions(true)
    bole.closeDialog(self, bole.popExitWin)
end


function Inspect_facebook_Dialog:onBtnCloseOkClicked()
    bole.playSounds("click")
    self:hide()
end

function Inspect_facebook_Dialog:onBtnCloseClicked()
    bole.playSounds("click")
    self:hide()
end

return Inspect_facebook_Dialog
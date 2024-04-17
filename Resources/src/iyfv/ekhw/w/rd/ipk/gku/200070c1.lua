local ___tab_ayeiv = {}
local ___tab_tzija = {}
local ___bool_aesl = false
local ___str_qm = "sddtsq"
local ___int_zdwc = 93
local ___bool_aw = false
local ___bool_mvphe = false
local ___tab_vmghi = {}
local ___bool_qttoi = false
local ___str_yruvw = "qbhuds"
local ___str_tar = "lhanwd"
local ____them = nil
local ___bool_isf = false
local ____emi = nil
local ___bool_jvloq = false
local ___int_xmqdn = 26
local ___bool_day = false
local ___int_yue = 39
local ____ihs = nil
local ___int_qsijj = 14
local ___tab_sn = {}
local ____pics = nil
local ___bool_kaml = false
local ___tab_fclfs = {}
local ___int_mvzzn = 65
local ___tab_slufp = {}
local ___bool_vzu = false
local ___str_gjp = "xdapb"
local ___bool_pfqr = false

local function ___vteb()
	local bool_ndclc = false
	local int_qy = 2
	local tab_oeq = {}
end

local function ___fytwv()
	local tab_xzz = {}
	local tab_xi = {}
	local int_xls = 34
	local int_qqr = 14
	local _ovlx = nil
end

local function ___azj()
	local int_ecnb = 9
	local tab_wiqnw = {}
	local int_jnwnk = 72
end

local function ___udsdc()
	local bool_hwm = false
	local int_pa = 59
	local str_sd = "mxv"
	local tab_wh = {}
end

local function ___gkyp()
	local tab_oolfb = {}
	local int_ejw = 76
	local bool_aif = false
	local tab_at = {}
	local tab_faal = {}
end

local function ___djwqp()
	local str_le = "zvreb"
	local bool_ix = false
	local tab_fxys = {}
end

local function ___hj()
	local tab_jgrj = {}
	local bool_jqrz = false
	local str_nru = "thpyd"
end

local function ___raup()
	local str_utap = "qlgc"
	local tab_qkt = {}
	local _zo = nil
	local tab_txgeh = {}
	local _eb = nil
end

local function ___cart()
	local str_wnwhk = "qrixrt"
	local _pi = nil
	local bool_hwbt = false
	local bool_ixnk = false
	local str_uri = "lbe"
end

local function ___nzcp()
	local _qbvhk = nil
	local int_axb = 32
	local bool_eoqk = false
end

local function ___pm()
	local str_ucruc = "kln"
	local tab_kl = {}
end

local function ___cd()
	local _sarjz = nil
	local tab_fwrp = {}
	local int_iwj = 9
end

local function ___qlsts()
	local tab_zc = {}
	local bool_jrpju = false
	local str_wwn = "xjas"
	local str_swptl = "zwclec"
end

local function ___zmojd()
	local bool_byuw = false
	local int_pyvj = 85
	local str_ul = "mfqhw"
end
--- @program src
--- @description: theme2010 collect ctl
--- @author: rwb
---@create: : 2021/02/22 19:00:00


local parentClass = require "Themes/TournCash/Common/ThemeTournCashDelegate"
local cls = class("TCStageControl", parentClass)
local view = require "Themes/TournCash/Common/Stage/TCStageView"

function cls:ctor(mainCtl, commonCtl)
    parentClass.ctor(self, commonCtl)
    self.themeCtl = mainCtl
    self.tcCommonCtl = commonCtl
end
function cls:initLayout(parentNode, flyNode)

    self.stageView = view.new(self, parentNode)
    self.stageView:initRoot()
end
function cls:setStartRound(...)
    self.stageView:setStartRound(...)
end
function cls:updateStageNode(...)
    self.stageView:updateStageNode(...)
end
function cls:resetStageTime(...)
    self.stageView:resetStageTime(...)
end
function cls:stageNumChange(...)
    self.stageView:stageNumChange(...)
end
function cls:getStageTime()
    return self.themeCtl:getStageTime()
end
function cls:configCountDownLabel(...)
    self.stageView:configCountDownLabel(...)
end
function cls:getRoundLeftTime()
    return self.themeCtl:getRoundLeftTime()
end
function cls:last10Second()
    self.themeCtl:last10Second()
end
function cls:finishRoundSpin()
    self.themeCtl:finishRoundSpin()
end

return cls



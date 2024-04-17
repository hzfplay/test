local ___str_srwlt = "yxfy"
local ___bool_odjn = false
local ___str_vxhuk = "xui"
local ___str_ignhf = "tya"
local ___str_nsy = "bvt"
local ____kyhk = nil
local ___tab_sfbn = {}
local ___str_vqpaj = "vvxr"
local ___tab_sqi = {}
local ___tab_ijhv = {}
local ___tab_muarv = {}
local ____yigkm = nil
local ____mr = nil
local ___tab_hzeb = {}
local ___str_wnz = "sph"
local ____jcpl = nil
local ___int_lrmp = 92
local ____ixsjc = nil

local function ___veeih()
	local int_mwx = 28
	local int_wgsjk = 10
	local tab_djhq = {}
	local str_bg = "bus"
	local int_epbi = 22
end

local function ___pgv()
	local int_pa = 51
	local bool_sls = false
	local int_pgwef = 52
	local _wy = nil
	local tab_fpcrs = {}
end

local function ___eqrs()
	local tab_ncqz = {}
	local int_bvk = 88
	local tab_pb = {}
	local tab_qqef = {}
end

local function ___pemy()
	local bool_tfcji = false
	local int_eu = 20
	local tab_hws = {}
end

local function ___rqv()
	local int_fs = 51
	local tab_fkjzr = {}
	local int_itzm = 84
	local int_sf = 78
	local int_als = 74
end

local function ___clup()
	local bool_wlq = false
	local int_gcnv = 35
	local int_ip = 58
	local tab_kmfx = {}
end

local function ___jpcqd()
	local str_ti = "ygy"
	local str_gvxnp = "gon"
	local bool_rvll = false
	local bool_zvdl = false
	local str_cb = "oitchi"
end

local function ___nvofp()
	local tab_zwxfw = {}
	local int_sxi = 8
	local int_geb = 67
	local tab_weg = {}
end

local function ___wdq()
	local _nzyyu = nil
	local _vx = nil
end

local function ___zan()
	local str_dva = "mhbjn"
	local _zehw = nil
	local str_bn = "aagt"
	local tab_lpect = {}
end

local function ___yruk()
	local tab_yavm = {}
	local str_zsb = "phkvt"
	local _smbed = nil
	local bool_ofn = false
end

local function ___sjya()
	local int_kuxc = 59
	local bool_dxt = false
end

local function ___foax()
	local _oghmk = nil
	local bool_wqbbx = false
end

local function ___bdduh()
	local tab_dtryt = {}
	local str_lhtc = "smzg"
	local bool_ao = false
	local int_lw = 88
	local bool_icsjf = false
end

local function ___das()
	local _lqf = nil
	local str_jpnc = "qzn"
	local bool_owfx = false
	local str_cmk = "kwjryq"
end

local function ___pl()
	local _yhlf = nil
	local _ly = nil
end

local function ___qyevm()
	local _ygb = nil
	local bool_mhort = false
	local tab_py = {}
	local bool_iqvhw = false
end

local function ___dbwap()
	local tab_acrcz = {}
	local bool_dkde = false
	local tab_hqbfo = {}
	local str_mv = "yydi"
end

local function ___ljtjw()
	local int_cfkdr = 22
	local int_zzxim = 12
	local int_uyjr = 70
end

local function ___xbl()
	local bool_lqk = false
	local _avt = nil
	local str_gzn = "wuhii"
end
if nil == cc.Control then
    return
end

--tip
local function deprecatedTip(old_name,new_name)
    print("\n********** \n"..old_name.." was deprecated please use ".. new_name .. " instead.\n**********")
end

--functions of CCControl will be deprecated end
local CCControlDeprecated = { }
function CCControlDeprecated.addHandleOfControlEvent(self,func,controlEvent)
    deprecatedTip("addHandleOfControlEvent","registerControlEventHandler")
    print("come in addHandleOfControlEvent")
    self:registerControlEventHandler(func,controlEvent)
end
CCControl.addHandleOfControlEvent = CCControlDeprecated.addHandleOfControlEvent
--functions of CCControl will be deprecated end

--Enums of CCTableView will be deprecated begin
CCTableView.kTableViewScroll = cc.SCROLLVIEW_SCRIPT_SCROLL
CCTableView.kTableViewZoom = cc.SCROLLVIEW_SCRIPT_ZOOM
CCTableView.kTableCellTouched = cc.TABLECELL_TOUCHED
CCTableView.kTableCellSizeForIndex = cc.TABLECELL_SIZE_FOR_INDEX
CCTableView.kTableCellSizeAtIndex = cc.TABLECELL_SIZE_AT_INDEX
CCTableView.kNumberOfCellsInTableView = cc.NUMBER_OF_CELLS_IN_TABLEVIEW
--Enums of CCTableView will be deprecated end

--Enums of CCScrollView will be deprecated begin
CCScrollView.kScrollViewScroll = cc.SCROLLVIEW_SCRIPT_SCROLL
CCScrollView.kScrollViewZoom = cc.SCROLLVIEW_SCRIPT_ZOOM
--Enums of CCScrollView will be deprecated end

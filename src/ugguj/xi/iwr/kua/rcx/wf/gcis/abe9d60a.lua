local ___int_dmezq = 30
local ___int_hbybw = 31
local ___str_nw = "xqrpxd"
local ___int_dx = 67
local ____wc = nil
local ___str_sog = "heg"
local ____eecb = nil
local ___str_mgdd = "ywd"
local ___int_fyeo = 92
local ____ilug = nil
local ___int_vzyt = 17
local ___int_ahg = 80

local function ___dkzt()
	local _mgjjy = nil
	local str_ltg = "qsywg"
	local tab_gkwk = {}
	local int_drn = 55
end

local function ___wl()
	local bool_lxtml = false
	local str_itmif = "zykg"
end

local function ___jjckp()
	local int_ibk = 57
	local bool_rcfnw = false
	local str_ien = "wheyg"
end

local function ___nsd()
	local bool_cz = false
	local int_furky = 10
	local tab_ktlfv = {}
	local str_kma = "bdj"
end

local function ___zu()
	local tab_zxszo = {}
	local tab_gmsf = {}
	local _anxcy = nil
	local int_tjols = 47
end

local function ___weqdm()
	local int_kzquf = 48
	local tab_go = {}
end

local function ___azl()
	local _sieu = nil
	local tab_hesse = {}
end

local function ___inffc()
	local str_wxk = "qpn"
	local tab_zebn = {}
end

local function ___yhfro()
	local str_qme = "aswbpf"
	local bool_pl = false
end

local function ___fmk()
	local _jxu = nil
	local int_ajq = 19
	local str_jgtk = "ftm"
end

local function ___lj()
	local str_epqhw = "qih"
	local tab_iooy = {}
	local str_ryfut = "nenk"
	local bool_vusde = false
end

local function ___mubxm()
	local bool_tl = false
	local bool_dzq = false
	local tab_wf = {}
end

local function ___jy()
	local int_kva = 94
	local tab_zr = {}
	local bool_alb = false
	local _lpl = nil
	local bool_ea = false
end

local function ___koan()
	local int_mrzoq = 14
	local tab_yjqf = {}
	local str_mpomz = "boe"
	local bool_uvofy = false
	local int_iok = 83
end

local function ___yzrux()
	local bool_uep = false
	local _rzfq = nil
end

local function ___aj()
	local str_saii = "gput"
	local str_gs = "rfwkem"
	local str_kwkth = "erbesq"
end

local function ___sgr()
	local bool_uxpf = false
	local str_kjn = "jjbs"
	local str_rgnhu = "wkrtn"
end

-- local parentClass = ThemeBaseViewControlDelegate
local ThemeBasePickViewControl = class("ThemeBasePickViewControl", parentClass)
local cls = ThemeBasePickViewControl

function cls:ctor(bonusParent, themeCtl, data, nodeList, callFunc)
    self.themeCtl = themeCtl
    self.bonusParent = bonusParent
    -- self.csb = self.themeCtl:getCsbPath(data.csb)
    
    self.callback = callFunc
    self.node = cc.Node:create()
    bole.scene:addToContentFooter(self.node)

    self:initPickData(data)

    self:initLayout(nodeList)


    -- parentClass.ctor(themeCtl)
end

function cls:initPickData( data )
    self.pickData = data
    self.pickConfig = data.config
end

function cls:initLayout(nodesList)
    -- self._view = ThemeBasePickView.new(self, nodesList,  self.pickConfig)
end

function cls:getItemPosList( count )
    return self.pickConfig.pos_list or {}
end


function cls:getPickItemState()
    -- return state_list
end

function cls:checkInFinshPick()
    return false
end

function cls:enterFeatureGame()
    self:initPickItems()
    
    self:showPickNode()
end

function cls:initPickItems( )
    local count = self.pickData.count
    local pos_list = self:getItemPosList(self.pickData.count)
    local state_list = self:getItemPosList()
    self._view:initPickNode(count, pos_list, state_list)
end

function cls:showPickNode( ... )
    local delay = self._view:showPickScreen() or 0.5

    self.node:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(delay),
            cc.CallFunc:create(function ( ... )
                self:openPickGame()
            end)))
end

function cls:openPickGame( ... )
    if self.haveLeft > 0 then 
        self._view:showPickGameTipAnim(true)
        self._view:initPickEvent()

        self:setTouchPickItem(true)
    else
        self:pickAllItemOver()
    end
end

function cls:pickAllItemOver(  )
    self._view:updateAllItem()
end

function cls:openOnePickItem( index )
    self._view:openOnePickItem( index )
end

function cls:canTouchPickItem()
    return self.canClickItem and self.haveLeft > 0
end
function cls:setTouchPickItem(status)
    self.canClickItem = status
end
function cls:setPickLeft(count)
    self.haveLeft = count
end
function cls:getPickLeft()
    return self.haveLeft
end

-- themeCtl 方法
function cls:getSpineFile(file_name)
    return self.themeCtl:getSpineFile(file_name)
end


function cls:getParticleFile(file_name)
    return self.themeCtl:getParticleFile(file_name)
end

function cls:getFntFilePath(file_name)
    return self.themeCtl:getFntFilePath(file_name)
end


function cls:playMusicByName(name, singleton, loop)
    self.themeCtl:playMusicByName(name, singleton, loop)
end


return ThemeBasePickViewControl
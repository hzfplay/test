local ___str_bboyq = "hrvi"
local ___int_euhmq = 24
local ___bool_tpfry = false
local ____yf = nil
local ___tab_undme = {}
local ___bool_auqw = false
local ____ylgok = nil
local ___bool_vaik = false
local ___int_axzus = 20
local ___int_lhf = 30
local ___bool_yv = false
local ___tab_gzaj = {}
local ___tab_ov = {}
local ____fb = nil
local ___int_gy = 45
local ___str_gxh = "dphr"
local ___int_eux = 85
local ____qrdr = nil
local ___str_pyl = "acu"
local ____chv = nil
local ___int_rfqe = 26
local ___tab_blb = {}

local function ___yruxl()
	local bool_luenb = false
	local int_eti = 78
	local _uuav = nil
	local int_sgcxl = 16
end

local function ___hflbf()
	local bool_idye = false
	local str_hkjgh = "tfokmt"
	local _zn = nil
	local int_fuz = 10
end

local function ___weie()
	local int_juc = 56
	local int_bx = 94
end

local function ___eyjms()
	local str_ljsa = "irc"
	local tab_tdqi = {}
	local str_ichwl = "fibr"
	local bool_byrvh = false
	local str_hxdx = "erwdl"
end

local function ___cgluh()
	local tab_sr = {}
	local _bntlt = nil
	local tab_un = {}
	local _yakue = nil
end

local function ___qaq()
	local _ffpm = nil
	local _nefz = nil
	local int_njr = 53
end

local function ___rx()
	local tab_zmbpj = {}
	local tab_escii = {}
	local tab_rdcd = {}
end

local function ___ojaa()
	local _dkrbt = nil
	local int_jote = 4
end

local function ___rgy()
	local int_aba = 38
	local int_ppr = 2
end

local function ___zlo()
	local bool_amjv = false
	local int_enj = 71
	local int_hpz = 37
	local bool_cenlh = false
end

local function ___nbwe()
	local int_chm = 33
	local int_xkcmb = 48
	local _lm = nil
	local int_nivxu = 94
	local _vj = nil
end

local function ___ocn()
	local int_xrhab = 27
	local _ffrl = nil
end

local function ___pkoog()
	local bool_yylst = false
	local str_mf = "sapvk"
end

local function ___gm()
	local bool_gj = false
	local tab_hay = {}
	local _vrcyf = nil
end

local function ___ql()
	local tab_ouui = {}
	local tab_fonql = {}
end

local function ___vt()
	local tab_vdjuj = {}
	local tab_ai = {}
end

local function ___rld()
	local tab_zkyhx = {}
	local int_nnye = 69
	local _bsfki = nil
end

local function ___yknhu()
	local tab_jp = {}
	local tab_gfwx = {}
	local _jmki = nil
	local tab_hnw = {}
	local bool_hte = false
end

local function ___erwkx()
	local _uilit = nil
	local int_az = 63
end

local function ___djppm()
	local str_rmcku = "gfqhs"
	local bool_pa = false
	local tab_zxzi = {}
end

local function ___isk()
	local bool_umj = false
	local bool_oeb = false
end

local function ___mojs()
	local str_af = "praea"
	local str_jjmoi = "eqclql"
	local bool_lc = false
	local tab_lj = {}
	local tab_omb = {}
end

local function ___vaj()
	local tab_jssw = {}
	local str_wrv = "inglyv"
	local str_ey = "zyjgb"
	local str_swbl = "yzkjed"
end

local function ___pwbfp()
	local int_fb = 18
	local str_rwacd = "vtkdg"
	local str_wbz = "yvvhrx"
	local str_qkeub = "huybig"
	local tab_audyf = {}
end

local function ___yp()
	local bool_hi = false
	local bool_ywvh = false
	local int_zwax = 95
	local bool_zmt = false
	local bool_ejrso = false
end

local function ___evsyd()
	local bool_cfe = false
	local str_jnmm = "tcvf"
end

local function ___euhy()
	local str_cfqcn = "bqax"
	local str_ccja = "ajfp"
end

local function ___gzhun()
	local bool_dy = false
	local str_bku = "vjjgjl"
	local str_cspuw = "ind"
	local _tcwok = nil
	local _lez = nil
end

local ThemeBasePickView = class("ThemeBasePickView")
local cls = ThemeBasePickView

function cls:ctor( vCtl, nodesList, config )
    self.vCtl = vCtl
    self.pickConfig = config
    self:_initLayout(nodesList)
end

function cls:_initLayout( nodeList )
    self.parent = nodeList[1]

    self.node = cc.Node:create()

    if self.node and self.pickConfig and self.pickConfig.csb then 
        self.csb = self.vCtl:getCsbPath(self.pickConfig.csb)
        self.pickRoot = cc.CSLoader:createNode(path)
        self.node:addChild(self.node)
    end

    self:loadControls()
end

function cls:loadControls()

end

function cls:initPickNode(count, pos_list, state_list)
    self.pickItemList = {}

    state_list = state_list or {}
    for i = 1, count do 
        self:_addPickItem(i, pos_list[i], state_list[i])
    end
end

function cls:showPickScreen()
    
    self.node:runAction(cc.FadeIn:create(0.2))
end

function cls:changePickGameTipState(isShow)
    self:setTipTextState(isShow)
    self:playLoopPickItems(isShow)
end

function cls:setTipTextState( isShow )
    
end

function cls:playLoopPickItems(isShow)
    -- if isShow then 
    --     self.loopIndex = 0
    --     local a1 = function()
    --         for key, node in ipairs(self.pickItemList) do
    --             if key % 3 == self.loopIndex then
    --                 node:playLoopAni(self.loopIndex)
    --             end
    --         end
    --         self.loopIndex = self.loopIndex + 1
    --         if self.loopIndex == 3 then
    --             self.loopIndex = 0
    --         end
    --     end
    --     self.node:runAction(
    --         cc.RepeatForever:create(
    --             cc.Sequence:create(
    --                 cc.CallFunc:create(a1),
    --                 cc.DelayTime:create(self.loopDelay)
    --             )
    --         )
    --     )
    -- else
    --     self.node:stopAllAction()
    -- end

end

function cls:_addPickItem(index, pos)

end

function cls:closePickScreen()
    self.node:runAction(cc.Sequence:create(
        cc.FadeOut:create(0.2),
        cc.removeSelf:create()))
end

function cls:pickOverItem(index, dataInfo, isOpenAni)
    self.pickItemList[index]:openPickItem(dataInfo, isOpenAni)
end

function cls:updateAllItem(pick_item_info, win_type)
    -- for key = 1, #self.pickItemList do
    --     self.pickItemList[key]:openPickItem(pick_item_info[key], false, pick_item_info[key] ~= win_type)
    -- end
end

function cls:initPickEvent()
    for key = 1, #self.pickItemList do
        local pickItem = self.pickItemList[key]
        pickItem:setTouchStatus(true)
    end
end

return ThemeBasePickView

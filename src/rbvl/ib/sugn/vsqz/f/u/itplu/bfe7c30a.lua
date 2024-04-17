local ____sr = nil
local ___int_lsq = 46
local ___tab_lvmb = {}
local ___str_smeyx = "zbgoj"
local ___str_to = "qvtmzf"
local ___str_oted = "joxnud"
local ___bool_rzee = false
local ___int_pjx = 40
local ____uabp = nil
local ___int_yok = 78
local ___str_rhb = "vmac"
local ___bool_uc = false
local ____kqo = nil

local function ___qa()
	local int_znwd = 1
	local _hqe = nil
	local bool_wmuqa = false
	local str_ui = "pnrjqc"
	local bool_fc = false
end

local function ___hzlc()
	local tab_uwxde = {}
	local bool_zxqcb = false
	local int_bu = 42
end

local function ___nigx()
	local int_tvs = 80
	local bool_cd = false
	local _iyssj = nil
	local str_gppov = "szajdg"
	local _afsg = nil
end

local function ___rmxy()
	local bool_wdjak = false
	local int_etyu = 97
	local str_dg = "dfyngv"
	local _zu = nil
	local _xzd = nil
end

local function ___pdnqq()
	local str_jbe = "ohhm"
	local bool_yl = false
	local bool_jkr = false
	local int_nd = 8
end

local function ___ejiq()
	local int_irdt = 81
	local tab_rqq = {}
	local str_zl = "dmk"
	local _ztrnk = nil
end

local function ___ll()
	local int_iflt = 47
	local int_xgluu = 21
end

local function ___vgk()
	local int_nc = 71
	local bool_uzdp = false
	local int_svgq = 16
	local tab_sc = {}
	local str_dkps = "zqlwfx"
end

local function ___dabiy()
	local bool_cfr = false
	local int_jfwh = 41
	local int_yosvr = 37
	local _vtz = nil
	local bool_ybw = false
end

local function ___wz()
	local _qa = nil
	local int_eorac = 100
	local int_wmnj = 10
end

local function ___gboe()
	local int_hesp = 93
	local int_nvtr = 90
	local tab_iv = {}
end

local function ___duqvh()
	local str_dwuks = "icwy"
	local int_oq = 14
	local tab_jrijb = {}
	local _ik = nil
end

local function ___bwdic()
	local tab_dto = {}
	local int_yh = 50
end

local function ___bcg()
	local bool_ohz = false
	local tab_exlhj = {}
	local bool_xl = false
	local _dlq = nil
end

local function ___yw()
	local str_iwxfm = "rjr"
	local bool_zmdaf = false
	local int_zg = 16
end

local function ___mm()
	local str_hx = "luzex"
	local str_slyh = "zzbtq"
end

local function ___tu()
	local bool_hsoy = false
	local _xad = nil
	local str_lf = "lsasq"
	local tab_hvts = {}
	local _engtg = nil
end

local function ___lq()
	local tab_hrps = {}
	local tab_scxz = {}
	local bool_fdpp = false
	local str_ak = "zonwk"
end

local function ___ullv()
	local str_dql = "dhz"
	local tab_dgsso = {}
	local tab_ms = {}
	local bool_vqaue = false
end

local function ___bjxh()
	local _yu = nil
	local str_fgj = "nvrfam"
	local bool_omoz = false
	local bool_opuj = false
	local bool_kj = false
end

local function ___paov()
	local bool_dpd = false
	local str_lk = "mbnyx"
end

local function ___uqvll()
	local bool_agyc = false
	local bool_chdb = false
end

local function ___yt()
	local tab_suzof = {}
	local bool_fmm = false
	local _meqim = nil
	local tab_krdpl = {}
	local _vnn = nil
end

local function ___kf()
	local bool_wzxda = false
	local tab_ybua = {}
	local int_nfpt = 98
	local str_wtvw = "xqg"
end

local function ___iu()
	local bool_okcw = false
	local _nrjt = nil
end

local function ___cpca()
	local bool_msv = false
	local int_btoa = 29
end
Slider = class("Slider", function () return cc.ClippingNode:create() end)

-- @params: 
-- float speed means how many seconds needed to move for 100 pixels
-- int offset mean how many pixel blank to put on the left and right of label
function Slider:ctor( child, width, speed, offset)
    
    self.child = child
    self.width = width
    self.speed = speed
    self.offset = offset or 20
    local a = child:getContentSize()
    self.childWidth = a.width
    self:addChild(child)
    self.child:setPosition(cc.p(self.offset, 0))
    self.child:setAnchorPoint(cc.p(0, 0))
    local vex = {cc.p(0,0), cc.p(width,0), cc.p(width, a.height), cc.p(0, a.height)}
    local stencil = cc.DrawNode:create()
    stencil:drawPolygon(vex, #vex, cc.c4f(1,1,1,1), 0, cc.c4f(1,1,1,1))
    self:setStencil(stencil)
    self:roll()
end


function Slider:roll( duration, startIndex)
    
    local len = math.abs(self.width - self.childWidth) + self.offset * 2
    local action = cc.MoveTo:create(self.speed * len / 100, cc.p(self.width - self.childWidth - self.offset, 0))
    local action1 = cc.MoveTo:create(self.speed * len / 1000, cc.p(self.offset, 0))
    action = cc.Sequence:create(action, action1)
    action = cc.RepeatForever:create(action)
    self.child:runAction(action)
end

function Slider:stop()
    
    self:cleanup()
    self.child:setPosition(cc.p(0, 0))
end

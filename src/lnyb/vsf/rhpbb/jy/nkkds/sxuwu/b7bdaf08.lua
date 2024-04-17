local ___bool_zoe = false
local ___int_uysj = 24
local ___int_ntsv = 2
local ___str_flar = "irtymt"
local ___tab_ikp = {}
local ___str_nkn = "kvrram"
local ___str_pa = "vbn"
local ___int_ar = 48
local ___str_jvzai = "zbsbc"
local ___bool_baj = false
local ___str_ojwgg = "ycp"
local ___str_ee = "ezan"
local ___str_zt = "fet"
local ___int_fisd = 90
local ___bool_ymzm = false
local ___str_ip = "qsejli"
local ___int_lwhbl = 23
local ____lsrf = nil
local ___int_vdi = 19
local ___bool_sn = false
local ____pb = nil
local ___tab_ifp = {}
local ___tab_ktn = {}
local ___int_qtxow = 51
local ___int_oksbw = 68
local ___bool_cz = false
local ___str_fzwn = "unj"
local ___bool_mdw = false

local function ___ubkk()
	local tab_tzzdh = {}
	local tab_ipk = {}
	local str_eisol = "qbv"
end

local function ___ubahw()
	local tab_gjde = {}
	local tab_yq = {}
	local bool_kkxyg = false
	local str_osv = "zssol"
end

local function ___dmq()
	local str_hr = "qxag"
	local _pplfd = nil
	local tab_yiz = {}
	local int_khxnc = 22
	local _uxgi = nil
end

local function ___nthu()
	local _je = nil
	local int_oq = 70
	local tab_mvv = {}
	local tab_dwl = {}
	local tab_gz = {}
end

local function ___spmeg()
	local str_bzi = "komgyq"
	local int_zmnc = 13
end

local function ___umfu()
	local tab_majr = {}
	local tab_ln = {}
end

local function ___ed()
	local int_fpfu = 79
	local int_fh = 83
	local tab_aaeoe = {}
	local bool_tnyxn = false
	local str_pwdo = "jtidir"
end

local function ___itc()
	local _op = nil
	local str_mv = "fbold"
	local str_dv = "ylqa"
	local int_sutjv = 20
	local str_nhipg = "gwjsd"
end

local function ___bxtu()
	local _fah = nil
	local _fciq = nil
	local _psvsh = nil
	local bool_crqqk = false
	local bool_srt = false
end

local function ___iiij()
	local bool_cgfl = false
	local _dmlwa = nil
end

local function ___vpoqs()
	local bool_pj = false
	local bool_sezmb = false
	local int_euehh = 2
	local _xnqar = nil
	local bool_no = false
end

local function ___nv()
	local _mnm = nil
	local _rlccj = nil
end

local function ___xcj()
	local str_ksf = "nmbl"
	local _pvq = nil
end

local function ___pbrp()
	local _lqp = nil
	local tab_xgzl = {}
	local bool_nah = false
	local _zohls = nil
end

local function ___uvf()
	local bool_fx = false
	local tab_vpqk = {}
	local int_agf = 12
	local _yljb = nil
end

local function ___iwn()
	local bool_lvar = false
	local tab_crny = {}
	local int_ufj = 11
	local int_vp = 40
end

local function ___bds()
	local _qnrt = nil
	local int_fnfa = 74
	local str_jo = "zoj"
	local _wyaqx = nil
	local str_gpqcg = "wkvpyy"
end

local function ___ab()
	local int_xvu = 27
	local _jjtdh = nil
	local _macj = nil
end

local function ___ea()
	local int_rav = 74
	local tab_zg = {}
end

local function ___dno()
	local tab_fz = {}
	local int_snpln = 72
	local int_xbqk = 50
	local int_zcew = 4
end

local function ___xbszs()
	local int_eo = 30
	local _gwzav = nil
end

local function ___ayblw()
	local tab_ciwkb = {}
	local _ot = nil
end

local function ___ad()
	local int_djzx = 99
	local tab_utz = {}
	local tab_gjdvq = {}
	local int_gvjp = 0
end

local function ___iucc()
	local bool_fa = false
	local _nolfj = nil
end

local function ___gtzn()
	local str_hnmp = "wlmbt"
	local tab_kw = {}
	local str_oqot = "nmssp"
	local str_ickg = "itkw"
end

local function ___puxsd()
	local tab_bgma = {}
	local _nzhj = nil
end

local function ___pkebw()
	local bool_sx = false
	local str_dbfon = "cvf"
	local str_fk = "mdo"
	local int_tuwl = 87
end

-- RollingDigit = class("RollingLabel", function () return cc.Node:create() end)
-- function RollingDigit:ctor( font, number, scale, x, y )
    
--     self.left = nil
--     self.right = nil
--     self.size = 22
--     self.x = x
--     self.y = y
--     for i = 1, 11 do
--         local label = FONTS.new(font, tostring((i - 2) % 10))
--         label:setScale(scale)
--         label:setPosition(cc.p(0, (1-i) * self.size))
--         self:addChild(label)
--     end
--     self:setNumber(number)
-- end

-- function RollingDigit:getPos( n )
    
--     n = n or self.number
--     return cc.p(self.x, (n + 1) * self.size + self.y)
-- end

-- function RollingDigit:setLeftDigit( left )
    
--     self.left = left
--     if self.left then
--         self.left.right = self
--     end
-- end

-- function RollingDigit:setNumber( number )
--     self.number = number
--     self:reset()
-- end

-- function RollingDigit:reset( ... )
--     self:cleanup()
--     self:setPosition(self:getPos())
-- end

-- function RollingDigit:destroySelf( ... ) -- 后续可能需要修改 $
--     if self.right then
--         self.right:setLeftDigit( nil )
--     end
--     local suffix = self:getParent():getChildByName("$")
--     if suffix then
--         suffix:setPosition(cc.p(self.x, self.y))
--     end
--     self:removeFromParent()
-- end

-- function RollingDigit:roll( duration )
--     self:reset()
--     local a = self.number - 1
--     if a == -1 then
--         if self.left then
--             self.left:roll( duration )
--         end
--     end
--     if a == 0 and not self.left then
--         self:destroySelf()
--         return
--     end
--     self.number = a

--     local action = cc.MoveTo:create(duration, self:getPos())
--     if self.number == -1 then
--         self.number = 9
--     end
--     action = cc.Sequence:create(action, cc.DelayTime:create(duration), cc.CallFunc:create( function() self:reset() end ))
--     self:runAction(action)
-- end

-- function RollingDigit:rollForever( duration )
--     -- self.number = 0
--     local action = cc.CallFunc:create( function() self:setPosition(self:getPos(9)) end )
--     action = cc.Sequence:create( action, cc.MoveTo:create(duration * 9, self:getPos(0)) )
--     action = cc.RepeatForever:create(action)
--     self:runAction(action)
-- end

-- function RollingDigit:stopRoll( ... )
    
--     self:reset()   
-- end

-- RollingLabel = class("RollingLabel", function () return cc.ClippingNode:create() end)
-- function RollingLabel:ctor( font, number, scale, offset, rightDigitDuration)
    
--     local formerDigit = nil
--     local index = 1
--     repeat
--         local d = RollingDigit.new(font, number % 10, scale, -index*scale*offset , 0)
--         self:addChild(d, 0, index)
--         if formerDigit then
--             formerDigit:setLeftDigit(d)
--         elseif rightDigitDuration and rightDigitDuration > 0 then
--             d:rollForever(rightDigitDuration)
--         end
--         formerDigit = d
--         index = index + 1
--         number = math.floor(number / 10)
--     until number == 0
--     local d = FONTS.new(font,"", scale) --  "$"
--     d:setScale(scale)
--     d:setPosition(cc.p(-index*scale*offset, 0))
--     d:setName("$")
--     self:addChild(d)
-- end

-- function RollingLabel:setNumber( number )
    
--     local a = self:getChildByTag(1)
--     while a do
--         a:setNumber(number % 10)
--         if a.left then
--             a = a.left
--             number = math.floor(number / 10)
--         else
--             if number % 10 == 0 then
--                 a:destroySelf()
--             end
--             a = nil
--         end
--     end
-- end

-- function RollingLabel:roll( duration, startIndex)
    
--     self:getChildByTag(startIndex):roll(duration)
--     self.isRolling = 1
-- end

-- function RollingLabel:stopRoll()
    
--     self:cleanup()
--     local digit = self:getChildByTag(1)
--     while(digit) do
--         digit:stopRoll()
--         digit = digit.left
--     end
-- end

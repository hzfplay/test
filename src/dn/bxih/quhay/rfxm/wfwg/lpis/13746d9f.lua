local ___tab_vbyj = {}
local ___bool_pdb = false
local ____qkka = nil
local ____ra = nil
local ___tab_vqtaz = {}
local ___str_zhvv = "dpzg"
local ___tab_vy = {}
local ____zqd = nil
local ___bool_kirap = false
local ___tab_ocqfa = {}
local ___int_limgl = 62
local ____nod = nil
local ___tab_efc = {}
local ___int_bo = 2
local ___tab_kb = {}

local function ___ffg()
	local int_ms = 9
	local _dcz = nil
	local tab_ghsxl = {}
	local int_ehph = 9
	local tab_sua = {}
end

local function ___ym()
	local bool_ytng = false
	local str_sg = "wagao"
end

local function ___zg()
	local int_lbi = 66
	local bool_ngfyy = false
	local bool_uo = false
end

local function ___cqf()
	local int_rhlib = 29
	local int_klz = 74
	local tab_bzioi = {}
	local bool_zwgab = false
end

local function ___smja()
	local int_dhbn = 60
	local str_hh = "xbw"
	local str_gl = "seb"
	local _ka = nil
	local int_owva = 89
end

local function ___hozr()
	local tab_fg = {}
	local int_ebz = 28
	local str_jsr = "moqsql"
end

local function ___wacjr()
	local tab_fzqce = {}
	local _evh = nil
	local bool_alfhb = false
	local bool_qo = false
end

local function ___ik()
	local tab_dra = {}
	local str_ks = "zpiqq"
	local int_arl = 39
	local _xg = nil
	local tab_gvtha = {}
end

local function ___mvhd()
	local int_pgh = 52
	local _pbeyo = nil
	local tab_lht = {}
	local int_anz = 10
end

local function ___wdkkk()
	local bool_zghlv = false
	local _larf = nil
end

local function ___ninwa()
	local _rpav = nil
	local _rqpp = nil
	local tab_qluct = {}
	local _tbgzq = nil
	local int_dbd = 46
end

local function ___fu()
	local bool_pf = false
	local str_bh = "myg"
	local bool_njei = false
	local bool_sftt = false
	local _jma = nil
end

local function ___ygykg()
	local bool_qbue = false
	local int_oq = 28
	local str_smfj = "mkxo"
	local str_dq = "wvw"
	local int_wjlt = 26
end

local function ___wga()
	local tab_crp = {}
	local _iuu = nil
	local bool_gfrn = false
end

local function ___ro()
	local int_rhbm = 0
	local int_ydx = 10
end

local function ___rp()
	local bool_pvhgq = false
	local tab_qlgz = {}
end

local function ___bcw()
	local _hn = nil
	local bool_lphd = false
	local _ywf = nil
end

local function ___xs()
	local tab_stss = {}
	local tab_piz = {}
end

local function ___dgqcw()
	local bool_jjfpz = false
	local _grmb = nil
	local _ayt = nil
	local _twyg = nil
end

local function ___tcc()
	local _ppe = nil
	local str_sre = "ssjx"
end

local function ___xgmq()
	local tab_nlnn = {}
	local int_zvbw = 77
	local str_pjap = "frdb"
	local int_mmie = 22
end

local function ___horkn()
	local bool_xwekp = false
	local int_dza = 5
	local int_zk = 14
	local tab_bhihr = {}
	local str_ja = "durxek"
end

local function ___tmp()
	local _eihyi = nil
	local _cddt = nil
	local _euda = nil
end
-- bit operation

bit = bit or {}
bit.data32 = {}

for i=1,32 do
    bit.data32[i]=2^(32-i)
end

function bit._b2d(arg)
    local nr=0
    for i=1,32 do
        if arg[i] ==1 then
            nr=nr+bit.data32[i]
        end
    end
    return  nr
end

function bit._d2b(arg)
    arg = arg >= 0 and arg or (0xFFFFFFFF + arg + 1)
    local tr={}
    for i=1,32 do
        if arg >= bit.data32[i] then
            tr[i]=1
            arg=arg-bit.data32[i]
        else
            tr[i]=0
        end
    end
    return   tr
end

function    bit._and(a,b)
    local op1=bit._d2b(a)
    local op2=bit._d2b(b)
    local r={}

    for i=1,32 do
        if op1[i]==1 and op2[i]==1  then
            r[i]=1
        else
            r[i]=0
        end
    end
    return  bit._b2d(r)

end

function    bit._rshift(a,n)
    local op1=bit._d2b(a)
    n = n <= 32 and n or 32
    n = n >= 0 and n or 0

    for i=32, n+1, -1 do
        op1[i] = op1[i-n]
    end
    for i=1, n do
        op1[i] = 0
    end

    return  bit._b2d(op1)
end

function bit._not(a)
    local op1=bit._d2b(a)
    local r={}

    for i=1,32 do
        if  op1[i]==1   then
            r[i]=0
        else
            r[i]=1
        end
    end
    return bit._b2d(r)
end

function bit._or(a,b)
    local op1=bit._d2b(a)
    local op2=bit._d2b(b)
    local r={}

    for i=1,32 do
        if op1[i]==1 or op2[i]==1  then
            r[i]=1
        else
            r[i]=0
        end
    end
    return bit._b2d(r)
end

bit.band   = bit.band or bit._and
bit.rshift = bit.rshift or bit._rshift
bit.bnot   = bit.bnot or bit._not

local ___int_hzkds = 59
local ____jedt = nil
local ___tab_gt = {}
local ___int_uxod = 21
local ___str_zv = "ztpj"
local ___str_mk = "nqm"
local ___int_fj = 46
local ___bool_xoi = false
local ___str_sxcb = "sxnjt"
local ___bool_eault = false
local ___int_xkj = 85
local ___int_cd = 76
local ___bool_iixs = false
local ___tab_ib = {}
local ___int_ikwzq = 69
local ___int_bgrl = 33

local function ___ngz()
	local str_qsc = "szou"
	local bool_toio = false
	local tab_njsgb = {}
end

local function ___nhqv()
	local int_ri = 46
	local str_tqb = "hylgzx"
	local int_iiun = 86
	local bool_oyg = false
end

local function ___gitk()
	local _rf = nil
	local tab_kamx = {}
	local bool_ksryd = false
	local tab_yrn = {}
	local _dv = nil
end

local function ___bzhs()
	local _shhpb = nil
	local tab_kyt = {}
	local int_sgslf = 24
	local bool_efjsm = false
	local _nb = nil
end

local function ___ayncx()
	local int_ybetn = 5
	local bool_qna = false
	local _tseu = nil
	local _ei = nil
	local str_zbxm = "fxpdct"
end

local function ___fklgg()
	local int_izy = 13
	local int_xd = 52
	local tab_fxpo = {}
end

local function ___wzqd()
	local _fiutv = nil
	local bool_czmv = false
end

local function ___kvtp()
	local tab_cfc = {}
	local _cc = nil
	local str_kov = "ekgayc"
	local str_dqq = "wrzmua"
end

local function ___tkr()
	local str_uvg = "mlluo"
	local tab_mqn = {}
end

local function ___ntxy()
	local _eoi = nil
	local bool_jt = false
	local int_lnub = 22
end

local function ___bk()
	local int_ke = 65
	local bool_ajv = false
	local bool_rxqfm = false
end

local function ___ktwc()
	local str_zpy = "zogjh"
	local _miwa = nil
	local _kdlca = nil
	local bool_qu = false
	local int_cd = 28
end

local function ___tyss()
	local _jrjuy = nil
	local int_gizi = 12
end

local function ___lmaa()
	local int_xnr = 17
	local int_izk = 21
	local int_qvvxt = 50
end

local function ___tdjs()
	local str_eujhg = "emqd"
	local int_cuti = 37
	local bool_nvz = false
	local str_okqmf = "vzp"
end

local function ___as()
	local str_toqd = "pkfh"
	local bool_slbih = false
	local int_ytfax = 83
	local tab_szdpj = {}
end

local function ___ny()
	local str_icrs = "ljzue"
	local _are = nil
	local bool_iyd = false
	local _danbs = nil
	local int_mk = 21
end

local function ___fs()
	local _pvi = nil
	local tab_uh = {}
end

local function ___llr()
	local tab_lwkff = {}
	local _owgn = nil
end

local function ___cc()
	local tab_um = {}
	local str_fcu = "cri"
	local str_pek = "mvtcng"
	local bool_xhd = false
end

local function ___ad()
	local bool_bwvu = false
	local _qi = nil
	local bool_rf = false
	local str_mtjm = "iia"
	local _aukz = nil
end

local function ___ajxs()
	local tab_jpu = {}
	local tab_qzuhn = {}
	local bool_bs = false
	local int_hngf = 96
	local bool_tcxmi = false
end

local function ___wvg()
	local bool_nt = false
	local int_bjrk = 67
end

local function ___jwc()
	local int_jmewj = 50
	local bool_ssev = false
	local tab_gutv = {}
end
if nil == cc.XMLHttpRequest then
    return
end

--tip
local function deprecatedTip(old_name,new_name)
    print("\n********** \n"..old_name.." was deprecated please use ".. new_name .. " instead.\n**********")
end

--functions of WebSocket will be deprecated begin
local targetPlatform = CCApplication:getInstance():getTargetPlatform()
if (kTargetIphone == targetPlatform) or (kTargetIpad == targetPlatform) or (kTargetAndroid == targetPlatform) or (kTargetWindows == targetPlatform) then
    local WebSocketDeprecated = { }
    function WebSocketDeprecated.sendTextMsg(self, string)
        deprecatedTip("WebSocket:sendTextMsg","WebSocket:sendString")
        return self:sendString(string)
    end
    WebSocket.sendTextMsg = WebSocketDeprecated.sendTextMsg

    function WebSocketDeprecated.sendBinaryMsg(self, table,tablesize)
        deprecatedTip("WebSocket:sendBinaryMsg","WebSocket:sendString")
        string.char(unpack(table))
        return self:sendString(string.char(unpack(table)))
    end
    WebSocket.sendBinaryMsg = WebSocketDeprecated.sendBinaryMsg
end
--functions of WebSocket will be deprecated end

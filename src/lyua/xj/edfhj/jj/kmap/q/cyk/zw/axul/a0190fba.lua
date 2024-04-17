local ___bool_iftzn = false
local ___bool_nhe = false
local ___tab_ipnak = {}
local ___str_fw = "cjhjq"
local ___str_svitp = "atu"
local ___tab_unpbp = {}
local ___bool_rryzb = false
local ___bool_fr = false
local ___str_zkrw = "mlvc"
local ___int_giq = 35
local ____ogqk = nil
local ___tab_zbvwf = {}
local ____bs = nil
local ____cikr = nil
local ___tab_yjlbf = {}
local ___tab_zwp = {}
local ___tab_geur = {}
local ___tab_msv = {}
local ___int_fqmwv = 85
local ___bool_rtzv = false
local ____ul = nil
local ___bool_xrfu = false
local ___int_qbyy = 33
local ___str_mmwij = "xqo"
local ___bool_hafsz = false
local ___tab_bh = {}

local function ___hmwxf()
	local str_bxjds = "ymp"
	local tab_kv = {}
end

local function ___oqxh()
	local _ix = nil
	local int_ggs = 50
	local tab_jdj = {}
end

local function ___zg()
	local _eysg = nil
	local bool_kp = false
	local tab_zbusz = {}
	local str_ka = "gkmo"
	local tab_bbrvg = {}
end

local function ___ug()
	local int_ya = 11
	local str_cd = "fjremt"
	local str_lmo = "lhqnp"
end

local function ___qjwng()
	local int_kxx = 1
	local bool_pqex = false
	local str_skfpx = "dsrkn"
end

local function ___ih()
	local _xnuqh = nil
	local _xpxde = nil
	local str_zovx = "cawzgn"
	local tab_wvo = {}
end

local function ___wrj()
	local _bxf = nil
	local _glsea = nil
	local int_hba = 76
	local tab_sxh = {}
	local str_hz = "dbuhzr"
end

local function ___tzi()
	local bool_qcow = false
	local bool_vh = false
end

local function ___qqnx()
	local _sz = nil
	local tab_gfhw = {}
	local str_uwip = "odqk"
	local str_umx = "xqrjx"
end

local function ___qoz()
	local int_yluop = 38
	local _ri = nil
end

local function ___nc()
	local str_ftrv = "evlqy"
	local str_nh = "alfle"
end

local function ___gpi()
	local int_wjlda = 100
	local str_lim = "quvx"
	local _xw = nil
	local tab_stier = {}
end

local function ___pwz()
	local bool_upa = false
	local bool_kzhw = false
	local int_hlwp = 94
	local str_gwffi = "fewqah"
	local str_kz = "atqk"
end

local function ___im()
	local bool_lmfi = false
	local bool_fmi = false
	local int_xf = 71
	local str_dmx = "shnsv"
end

local function ___svur()
	local str_yc = "eurc"
	local bool_hdcw = false
	local int_azbw = 96
end

local function ___boviz()
	local int_yowoy = 85
	local int_qmuo = 19
	local bool_fgeg = false
	local int_brrea = 29
end

local function ___krbh()
	local tab_lr = {}
	local bool_vh = false
	local _tzsw = nil
	local tab_jer = {}
end

local function ___pb()
	local tab_bs = {}
	local str_wlqjw = "ibck"
end

local function ___ndq()
	local tab_xx = {}
	local _mirqj = nil
	local bool_zoreu = false
end
if nil == ccs then
    return
end

--tip
local function deprecatedTip(old_name,new_name)
    print("\n********** \n"..old_name.." was deprecated please use ".. new_name .. " instead.\n**********")
end

--functions of GUIReader will be deprecated begin
local GUIReaderDeprecated = { }
function GUIReaderDeprecated.shareReader()
    deprecatedTip("GUIReader:shareReader","ccs.GUIReader:getInstance")
    return ccs.GUIReader:getInstance()
end
GUIReader.shareReader = GUIReaderDeprecated.shareReader

function GUIReaderDeprecated.purgeGUIReader()
    deprecatedTip("GUIReader:purgeGUIReader","ccs.GUIReader:destroyInstance")
    return ccs.GUIReader:destroyInstance()
end
GUIReader.purgeGUIReader = GUIReaderDeprecated.purgeGUIReader
--functions of GUIReader will be deprecated end

--functions of SceneReader will be deprecated begin
local SceneReaderDeprecated = { }
function SceneReaderDeprecated.sharedSceneReader()
    deprecatedTip("SceneReader:sharedSceneReader","ccs.SceneReader:getInstance")
    return ccs.SceneReader:getInstance()
end
SceneReader.sharedSceneReader = SceneReaderDeprecated.sharedSceneReader

function SceneReaderDeprecated.purgeSceneReader(self)
    deprecatedTip("SceneReader:purgeSceneReader","ccs.SceneReader:destroyInstance")
    return self:destroyInstance()
end
SceneReader.purgeSceneReader = SceneReaderDeprecated.purgeSceneReader
--functions of SceneReader will be deprecated end


--functions of ccs.GUIReader will be deprecated begin
local CCSGUIReaderDeprecated = { }
function CCSGUIReaderDeprecated.purgeGUIReader()
    deprecatedTip("ccs.GUIReader:purgeGUIReader","ccs.GUIReader:destroyInstance")
    return ccs.GUIReader:destroyInstance()
end
ccs.GUIReader.purgeGUIReader = CCSGUIReaderDeprecated.purgeGUIReader
--functions of ccs.GUIReader will be deprecated end

--functions of ccs.ActionManagerEx will be deprecated begin
local CCSActionManagerExDeprecated = { }
function CCSActionManagerExDeprecated.destroyActionManager()
    deprecatedTip("ccs.ActionManagerEx:destroyActionManager","ccs.ActionManagerEx:destroyInstance")
    return ccs.ActionManagerEx:destroyInstance()
end
ccs.ActionManagerEx.destroyActionManager = CCSActionManagerExDeprecated.destroyActionManager
--functions of ccs.ActionManagerEx will be deprecated end

--functions of ccs.SceneReader will be deprecated begin
local CCSSceneReaderDeprecated = { }
function CCSSceneReaderDeprecated.destroySceneReader(self)
    deprecatedTip("ccs.SceneReader:destroySceneReader","ccs.SceneReader:destroyInstance")
    return self:destroyInstance()
end
ccs.SceneReader.destroySceneReader = CCSSceneReaderDeprecated.destroySceneReader
--functions of ccs.SceneReader will be deprecated end

--functions of CCArmatureDataManager will be deprecated begin
local CCArmatureDataManagerDeprecated = { }
function CCArmatureDataManagerDeprecated.sharedArmatureDataManager()
    deprecatedTip("CCArmatureDataManager:sharedArmatureDataManager","ccs.ArmatureDataManager:getInstance")
    return ccs.ArmatureDataManager:getInstance()
end
CCArmatureDataManager.sharedArmatureDataManager = CCArmatureDataManagerDeprecated.sharedArmatureDataManager

function CCArmatureDataManagerDeprecated.purge()
    deprecatedTip("CCArmatureDataManager:purge","ccs.ArmatureDataManager:destoryInstance")
    return ccs.ArmatureDataManager:destoryInstance() 
end
CCArmatureDataManager.purge = CCArmatureDataManagerDeprecated.purge
--functions of CCArmatureDataManager will be deprecated end

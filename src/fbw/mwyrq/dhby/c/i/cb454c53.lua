local ____qyr = nil
local ___str_lh = "vqmpzu"
local ___tab_tefqy = {}
local ___bool_eez = false
local ___bool_agbm = false
local ____oogpf = nil
local ___bool_uh = false
local ___bool_ip = false
local ___tab_gtuy = {}
local ___bool_fugs = false
local ___str_gncin = "fbxq"
local ___bool_dkiz = false

local function ___zhoee()
	local _efxcc = nil
	local tab_mqvcx = {}
	local _zqv = nil
	local str_smm = "bgco"
end

local function ___kk()
	local _zmxyc = nil
	local bool_ih = false
	local int_ntist = 85
	local _li = nil
end

local function ___ujxx()
	local str_jjpt = "mhb"
	local str_brno = "mhnds"
	local bool_rokj = false
end

local function ___jalze()
	local tab_mqruq = {}
	local tab_qxz = {}
end

local function ___eksq()
	local bool_bje = false
	local _uweez = nil
	local str_cjf = "wxzy"
	local int_pwgl = 91
	local tab_lplvh = {}
end

local function ___oaw()
	local _zo = nil
	local bool_zu = false
	local _dglqn = nil
end

local function ___dt()
	local int_wm = 19
	local _peuc = nil
	local tab_jnfe = {}
end

local function ___gz()
	local tab_khg = {}
	local int_adrxx = 40
	local int_ffovx = 5
end

local function ___bh()
	local str_yerj = "jzcb"
	local str_xeq = "emo"
	local str_taxqb = "nwce"
	local bool_ggk = false
end

local function ___urh()
	local tab_nlqgn = {}
	local tab_yzyv = {}
end

local function ___rw()
	local str_rbzf = "mdow"
	local bool_mjej = false
	local str_afslr = "grocl"
	local str_ld = "xoizd"
	local tab_ykx = {}
end

local function ___fieow()
	local tab_lzomf = {}
	local tab_wkb = {}
end

local function ___pvwy()
	local tab_mm = {}
	local _ovh = nil
end

local function ___my()
	local _jlu = nil
	local int_mbtju = 0
	local int_krntw = 40
end

local function ___hvab()
	local tab_taj = {}
	local str_ggxm = "jixhxd"
	local tab_po = {}
	local bool_dcw = false
	local int_lvq = 4
end

local function ___xf()
	local int_rd = 25
	local bool_owvhn = false
	local bool_bfq = false
	local tab_tbtd = {}
	local _nn = nil
end

local function ___xwuor()
	local tab_dwli = {}
	local int_sch = 93
	local _try = nil
	local tab_gksn = {}
end

local function ___mdwbx()
	local bool_onef = false
	local str_haw = "wjvc"
end

local function ___zmetb()
	local _at = nil
	local int_vf = 97
	local bool_vq = false
	local bool_hbcj = false
	local tab_rnqxm = {}
end

local function ___vo()
	local bool_jdgt = false
	local _rw = nil
	local str_qvxb = "itbk"
	local int_daynb = 4
end

local function ___pr()
	local bool_umnos = false
	local bool_qsvyj = false
end

local function ___ce()
	local tab_hou = {}
	local tab_mxh = {}
	local bool_no = false
end

local function ___tzf()
	local str_iiuc = "mkv"
	local tab_nzuo = {}
	local tab_fkg = {}
	local bool_tvxgp = false
end

local function ___oww()
	local int_et = 28
	local tab_exemt = {}
end

local function ___sjux()
	local tab_psvpc = {}
	local bool_rokh = false
	local str_silvq = "wous"
	local str_gzn = "hcbu"
	local tab_gsd = {}
end

--add LuaScript to search path.
cc.FileUtils:getInstance():addSearchPath('LuaScript/')

-- used as metaTable
local luaExtend = {}

local function getChildInSubNodes(nodeTable, key)
    if #nodeTable == 0 then
        return nil
    end
    local child = nil
    local subNodeTable = {}
    for _, v in ipairs(nodeTable) do
        child = v:getChildByName(key)
        if (child) then
            return child
        end
    end
    for _, v in ipairs(nodeTable) do
        local subNodes = v:getChildren()
        if #subNodes ~= 0 then
            for _, v1 in ipairs(subNodes) do
                table.insert(subNodeTable, v1)
            end
        end
    end
    return getChildInSubNodes(subNodeTable, key)
end

luaExtend.__index = function(table, key)
local root = table.root
local child = root[key]
    if child then
        return child
    end

    child = root:getChildByName(key)
    if child then
        root[key] = child
        return child
    end

    child = getChildInSubNodes(root:getChildren(), key)
    if child then root[key] = child end
    return child
end
-- used as metaTable

-- PositionFrame create
luaExtend.CreatePositionFrame = function(frameIndex, tween, x, y, node)
    local frame = ccs.PositionFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setX(x)
    frame:setY(y)
    frame:setNode(node)
    return frame
end
-- PositionFrame create

-- VisibleFrame create
luaExtend.CreateVisibleFrame = function(frameIndex, tween, visible, node)
    local frame = ccs.VisibleFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setVisible(visible)
    frame:setNode(node)
    return frame
end
-- VisibleFrame create

-- ColorFrame create
luaExtend.CreateColorFrame = function(frameIndex, tween, color, node)
    local frame = ccs.ColorFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setColor(color)
    frame:setNode(node)
    return frame
end
-- ColorFrame create

-- EventFrame create
luaExtend.CreateEventFrame = function(frameIndex, tween, event, node)
    local frame = ccs.EventFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setEvent(event)
    frame:setNode(node)
    return frame
end
-- EventFrame create

-- InnerActionFrame create
luaExtend.CreateInnerActionFrame = function(frameIndex, tween, innerActionType, animationName,  singleFrameIndex, node)
    local frame = ccs.InnerActionFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setInnerActionType(innerActionType)
    if innerActionType == 2 then
    	frame:setSingleFrameIndex(singleFrameIndex)
    else
        frame:setEnterWithName(true)
        frame:setAnimationName(animationName)
    end

    frame:setNode(node)
    return frame
end
-- InnerActionFrame create

-- AlphaFrame create
luaExtend.CreateAlphaFrame = function(frameIndex, tween, alpha, node)
    local frame = ccs.AlphaFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setAlpha(alpha)
    frame:setNode(node)
    return frame
end
-- AlphaFrame create

-- ZOrderFrame create
luaExtend.CreateZOrderFrame = function(frameIndex, tween, zOrder, node)
    local frame = ccs.ZOrderFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setZOrder(zOrder)
    frame:setNode(node)
    return frame
end
-- ZOrderFrame create

-- ScaleFrame create
luaExtend.CreateScaleFrame = function(frameIndex, tween, scaleX, scaleY, node)
    local frame = ccs.ScaleFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setScaleX(scaleX)
    frame:setScaleY(scaleY)
    frame:setNode(node)
    return frame
end
-- ScaleFrame create

-- RotationSkewFrame create
luaExtend.CreateRotationSkewFrame = function(frameIndex, tween, skewX, skewY, node)
    local frame = ccs.RotationSkewFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setSkewX(skewX)
    frame:setSkewY(skewY)
    frame:setNode(node)
    return frame
end
-- RotationSkewFrame create

-- AnchorPointFrame create
luaExtend.CreateAnchorPointFrame = function(frameIndex, tween, anchorPoint, node)
    local frame = ccs.AnchorPointFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setAnchorPoint(anchorPoint)
    frame:setNode(node)
    return frame
end
-- AnchorPointFrame create

-- TextureFrame create
luaExtend.CreateTextureFrame = function(frameIndex, tween, textureFilePath, node)
    local frame = ccs.TextureFrame:create()
    frame:setFrameIndex(frameIndex)
    frame:setTween(tween)
    frame:setTextureName(textureFilePath)
    frame:setNode(node)
    return frame
end
-- TextureFrame create

return luaExtend

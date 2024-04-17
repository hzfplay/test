local ___bool_ehw = false
local ___int_vv = 75
local ___int_pzjpk = 51
local ___int_pa = 47
local ___tab_svbo = {}
local ___str_gio = "ijxur"
local ___int_gti = 79
local ___int_id = 11
local ___tab_ywlcm = {}
local ___bool_hfqmo = false
local ___tab_tvyii = {}
local ___int_tzw = 63
local ___str_whm = "ljbhj"
local ____miw = nil
local ___int_xu = 45
local ___str_xce = "hxxpm"

local function ___ku()
	local int_pqc = 41
	local _pbbgw = nil
end

local function ___dezvi()
	local _psfi = nil
	local bool_ia = false
	local int_pq = 5
	local int_pygi = 63
end

local function ___wna()
	local int_mj = 32
	local str_kxys = "fsrzo"
	local str_yeo = "wvwj"
end

local function ___nh()
	local int_ykr = 62
	local bool_hpd = false
	local int_gd = 80
	local tab_pfb = {}
end

local function ___afuju()
	local str_szu = "vvmv"
	local _kuoo = nil
end

local function ___eo()
	local bool_ysjna = false
	local tab_cq = {}
	local tab_mvxe = {}
end

local function ___aaruh()
	local tab_hvh = {}
	local _vzrt = nil
	local str_lg = "wovmx"
end

local function ___dbw()
	local bool_ahrf = false
	local int_bk = 27
end

local function ___cugcd()
	local int_co = 67
	local _quxp = nil
	local tab_abh = {}
	local int_foi = 1
end

local function ___tzix()
	local str_kunf = "ktcqc"
	local _drxke = nil
	local bool_xa = false
end
if nil == cc.CCBReader then
    return
end

ccb = ccb or {}

function CCBReaderLoad(strFilePath,proxy,owner)
    if nil == proxy then
        return nil
    end

    local ccbReader = proxy:createCCBReader()
    local node      = ccbReader:load(strFilePath)
    local rootName  = "" 
    --owner set in readCCBFromFile is proxy
    if nil ~= owner then
        --Callbacks
        local ownerCallbackNames = ccbReader:getOwnerCallbackNames() 
        local ownerCallbackNodes = ccbReader:getOwnerCallbackNodes()
        local ownerCallbackControlEvents = ccbReader:getOwnerCallbackControlEvents()
        local i = 1
        for i = 1,table.getn(ownerCallbackNames) do
            local callbackName =  ownerCallbackNames[i]
            local callbackNode =  tolua.cast(ownerCallbackNodes[i],"cc.Node")

            if "function" == type(owner[callbackName]) then
                proxy:setCallback(callbackNode, owner[callbackName], ownerCallbackControlEvents[i])
            else
                print("Warning: Cannot find owner's lua function:" .. ":" .. callbackName .. " for ownerVar selector")
            end

        end

        --Variables
        local ownerOutletNames = ccbReader:getOwnerOutletNames() 
        local ownerOutletNodes = ccbReader:getOwnerOutletNodes()

        for i = 1, table.getn(ownerOutletNames) do
            local outletName = ownerOutletNames[i]
            local outletNode = tolua.cast(ownerOutletNodes[i],"cc.Node")
            owner[outletName] = outletNode
        end
    end

    local nodesWithAnimationManagers = ccbReader:getNodesWithAnimationManagers()
    local animationManagersForNodes  = ccbReader:getAnimationManagersForNodes()

    for i = 1 , table.getn(nodesWithAnimationManagers) do
        local innerNode = tolua.cast(nodesWithAnimationManagers[i], "cc.Node")
        local animationManager = tolua.cast(animationManagersForNodes[i], "cc.CCBAnimationManager")
        local documentControllerName = animationManager:getDocumentControllerName()
        if "" == documentControllerName then
            
        end
        if nil ~=  ccb[documentControllerName] then
            ccb[documentControllerName]["mAnimationManager"] = animationManager
        end
        
        --Callbacks
        local documentCallbackNames = animationManager:getDocumentCallbackNames()
        local documentCallbackNodes = animationManager:getDocumentCallbackNodes()
        local documentCallbackControlEvents = animationManager:getDocumentCallbackControlEvents()

        for i = 1,table.getn(documentCallbackNames) do
            local callbackName = documentCallbackNames[i]
            local callbackNode = tolua.cast(documentCallbackNodes[i],"cc.Node")
            if "" ~= documentControllerName and nil ~= ccb[documentControllerName] then
                if "function" == type(ccb[documentControllerName][callbackName]) then
                    proxy:setCallback(callbackNode, ccb[documentControllerName][callbackName], documentCallbackControlEvents[i])
                else
                    print("Warning: Cannot found lua function [" .. documentControllerName .. ":" .. callbackName .. "] for docRoot selector")
                end
            end
        end

        --Variables
        local documentOutletNames = animationManager:getDocumentOutletNames()
        local documentOutletNodes = animationManager:getDocumentOutletNodes()

        for i = 1, table.getn(documentOutletNames) do
            local outletName = documentOutletNames[i]
            local outletNode = tolua.cast(documentOutletNodes[i],"cc.Node")
            
            if nil ~= ccb[documentControllerName] then
                ccb[documentControllerName][outletName] = tolua.cast(outletNode, proxy:getNodeTypeName(outletNode))
            end 
        end
        --[[
        if (typeof(controller.onDidLoadFromCCB) == "function")
            controller.onDidLoadFromCCB();
        ]]--
        --Setup timeline callbacks
        local keyframeCallbacks = animationManager:getKeyframeCallbacks()

        for i = 1 , table.getn(keyframeCallbacks) do
            local callbackCombine = keyframeCallbacks[i]
            local beignIndex,endIndex = string.find(callbackCombine,":")
            local callbackType    = tonumber(string.sub(callbackCombine,1,beignIndex - 1))
            local callbackName    = string.sub(callbackCombine,endIndex + 1, -1)
            --Document callback

            if 1 == callbackType and nil ~= ccb[documentControllerName] then
                local callfunc = cc.CallFunc:create(ccb[documentControllerName][callbackName])
                animationManager:setCallFuncForLuaCallbackNamed(callfunc, callbackCombine);
            elseif 2 == callbackType and nil ~= owner then --Owner callback
                local callfunc = cc.CallFunc:create(owner[callbackName])--need check
                animationManager:setCallFuncForLuaCallbackNamed(callfunc, callbackCombine)
            end
        end
        --start animation
        local autoPlaySeqId = animationManager:getAutoPlaySequenceId()
        if -1 ~= autoPlaySeqId then
            animationManager:runAnimationsForSequenceIdTweenDuration(autoPlaySeqId, 0)
        end
    end

    return node
end


local function CCBuilderReaderLoad(strFilePath,proxy,owner)
    print("\n********** \n".."CCBuilderReaderLoad(strFilePath,proxy,owner)".." was deprecated please use ".. "CCBReaderLoad(strFilePath,proxy,owner)" .. " instead.\n**********")
    return CCBReaderLoad(strFilePath,proxy,owner)
end
rawset(_G,"CCBuilderReaderLoad",CCBuilderReaderLoad)
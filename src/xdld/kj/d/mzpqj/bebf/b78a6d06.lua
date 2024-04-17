local ___bool_iku = false
local ___bool_vv = false
local ___str_tklh = "dxljw"
local ___str_zizrn = "wtakm"
local ___int_eh = 63
local ___bool_tc = false
local ___int_aih = 65
local ___str_iq = "kptiye"
local ___bool_dmjh = false
local ___int_lgu = 66
local ___bool_ng = false
local ____icbv = nil
local ____oa = nil
local ___bool_ymn = false
local ___bool_ptbt = false
local ___bool_vb = false
local ___str_lhlux = "ear"
local ___int_qdsem = 40
local ___str_nv = "wdt"
local ___tab_ln = {}
local ___str_ggtsq = "tjoxbz"
local ___str_pjcc = "drawpv"
local ____pej = nil
local ____gmtxi = nil

local function ___od()
	local tab_hkj = {}
	local bool_mo = false
	local bool_lgg = false
end

local function ___mdef()
	local _pnuhl = nil
	local int_ce = 37
	local int_trff = 13
	local str_vrzg = "dchz"
	local int_ejfd = 62
end

local function ___fvaq()
	local tab_tfcn = {}
	local _qmkgj = nil
	local _rkjy = nil
end

local function ___gsu()
	local int_kdqbu = 71
	local bool_ffyz = false
end

local function ___idfx()
	local bool_dh = false
	local int_nfuay = 42
	local _sfbr = nil
	local str_xsr = "pamhqe"
end

local function ___zstv()
	local bool_ghy = false
	local _snvh = nil
	local tab_hbmhh = {}
	local int_hbn = 64
end

local function ___un()
	local _qjmt = nil
	local _amyq = nil
	local _vib = nil
	local str_mruq = "ksomf"
	local bool_yngvs = false
end

local function ___xcszw()
	local _tg = nil
	local int_sehu = 57
end

local function ___ciq()
	local str_yx = "okrhya"
	local int_raezw = 72
	local _vsya = nil
end

local function ___tmxh()
	local tab_juhj = {}
	local tab_dfzw = {}
end

local function ___ncbkz()
	local _ezrut = nil
	local bool_ikcoq = false
	local int_asc = 24
end

local function ___ggelh()
	local bool_ayjsz = false
	local bool_sjp = false
end

local function ___biez()
	local int_vkk = 8
	local _dcem = nil
	local _ylbvs = nil
end
local Deferred = require("UI/CreatorUI/Deferred")
-- local fremeIndexer = resInfo.fremeIndexer

local Clip = require("UI/CreatorUI/Clip")
local E_WRAP_MODE = Clip.E_WRAP_MODE

local function defaultSafeCb(...)
    -- print( "parameter cb is not function" )
end

local safeCb = function (cb)
    if type(cb) == "function" then
        return cb
    else
        return defaultSafeCb
    end
end

local function trunc(v, l, h)
    return math.min(math.max(v, l), h)
end

local function sepStringBySlash(str)
    local parts = {}
    for part in string.gmatch(str, "[^/]+") do
        table.insert(parts, part)
    end
    -- dump( parts )
    return parts
end

local function defaultErrorOutput(idx, pName, parts)
    -- print(string.format( "path of : %s, nil at  %s",  idx, pName))
end

local function defaultNextItemFinder(item, key)
    return item[key]
end

local function getValueByPathList(root, pathList, errorOutput, nextItemFinder)
    errorOutput = errorOutput or defaultErrorOutput
    errorOutput = safeCb(errorOutput)
    nextItemFinder = nextItemFinder or defaultNextItemFinder

    local tbl = root
    for idx = 1, #pathList do
        local pName = pathList[idx]
        local numIdx = tonumber(pName)

        if numIdx then
            tbl = nextItemFinder(tbl, numIdx)
            if tbl == nil then
                errorOutput(idx, numIdx, pathList)
                return nil
            end
        else
            tbl = tbl[pName]
            if tbl == nil then
                errorOutput(idx, pName, pathList)
                return nil
            end
        end
    end
    return tbl
end

local function getValueByPath(root, infoPath, errorOutput)
    if nil == infoPath then
        -- print("path info is nil")
        return nil
    end
    errorOutput = safeCb(errorOutput or defaultErrorOutput)
    local pathList = sepStringBySlash(infoPath)

    return getValueByPathList(root, pathList, errorOutput)
end

local function localOutPut(...)
    -- print(...)
end

local AnimeController = class()

function AnimeController:ctor()
    self.__clip = nil
    self.__runData = {
        type = "",
        -- 累计时间
        elapse = 0,

        last_clipElapse = nil,
        -- clip 时间点
        clipElapse = 0,
        -- 1 正向， -1 负方向
        dir = 1,

        running = false
    }
    self:setHandler(nil)
end

function AnimeController:create()
    local item = self:new()
    return item
end

function AnimeController:setTargetNode(node)
    self.__node = node
end

function AnimeController:setClip(clip)
    self.__clip = clip
end

function AnimeController:getClip()
    return self.__clip
end

function AnimeController:setToClipIndex(intValue)
    -- localOutPut( "int clip value : ", intValue )
    -- localOutPut( "setToIntFrame  : ", self.__clipElapse )

    self.__runData.clipElapse = self.__clip:getElapseValueFromClipIndex(intValue)

    self:playAtClipElapse()
end

function AnimeController:playAtElapse(elapse)

    self.__runData.elapse = elapse
    self.__runData.clipElapse = elapse

    self:playAtClipElapse()
end

function AnimeController:getElapse()
    return self.__runData.elapse
end

function AnimeController:playAtClipElapse()
    if self.__clip == nil then
        -- print("clip is nil")
        return
    end

    self:playCurveData()
    -- self:playEvent()

end

function AnimeController:playCurveData()

    self.__clip:iterTimelines(handler(self, self.onIterTimeline))

    ---[[
    -- 动画事件
    self.__clip:playEvent(handler(self, self.onEvent), self.__runData.clipElapse, self.__runData.last_clipElapse,
        self.__runData.dir, self.__runData.looped)
    -- ]]
    -- 更新 经过的时间点
    self.__runData.last_clipElapse = self.__runData.clipElapse
end

function AnimeController:onEvent(data)
    local handler = self:getHandler()
    if type(handler) == "function" then
        handler(data.func)
    end
end

function AnimeController:onIterTimeline(timeline, pN, cN, path)

    local value = timeline:getInterPolatedValue(self.__runData.clipElapse)

    if value == nil then
        return
    end

    local node
    if path then
        node = getValueByPath(self.__node, path)
    else
        node = self.__node
    end

    if nil == node then
        -- print( "node not found" )
        return
    end
    if cN == nil then

        if pN == "active" then
            node:setVisible(value)
            -- print( self.__clip:getClipInnerName(), path, "active", value )

        elseif pN == "scale" then
            node:setScale(value.x, value.y)

        elseif pN == "scaleX" then
            node:setScaleX(value)

        elseif pN == "scaleY" then
            node:setScaleY(value)

        elseif pN == "position" then
            -- print( path, pN )
            -- dump( value, "value : ".. path )
            if value.x and value.y then
                node:setPosition(value.x, value.y)
            else
                node:setPosition(value[1], value[2])
            end

        elseif pN == "skewX" then
            node:setSkewX(value)

        elseif pN == "skewY" then
            node:setSkewY(value)

        elseif pN == "x" then
            node:setPositionX(value)

        elseif pN == "y" then
            node:setPositionY(value)

        elseif pN == "height" then
            local s = node:getContentSize()
            node:setContentSize(s.width, value)

        elseif pN == "width" then
            local s = node:getContentSize()
            node:setContentSize(value, s.height)

        elseif pN == "opacity" then
            node:setOpacity(value)

        elseif pN == "rotation" then
            node:setRotation(value)

        elseif pN == "angle" then
            node:setRotation(-value)

        elseif pN == "color" then
            local _ = node.setColor and node:setColor(value)

        elseif pN == "anchorX" then
            node:setAnchorX(value)

        elseif pN == "anchorY" then
            node:setAnchorY(value)

        end

    else
        if cN == "cc.Sprite" then
            if pN == "spriteFrame" then
                if cc.FileUtils:getInstance():isFileExist(value.__uuid__) then
                    node:setTexture(value.__uuid__)
                else
                    node:setSpriteFrame(value.__uuid__)
                end
            else

            end

        elseif cN == "cc.Label" then
            if pN == "string" then
                node:setString(value)
            end
        elseif cN == "cc.Button" then
            if pN == "enableAutoGrayEffect" then
                node:setEnabled(value)
            end

        elseif cN == "cc.ProgressBar" then
            if pN == "progress" then
                node:setPercentage(value * 99.999)
            end
        end
    end

end

-- set current frome to a event name position
function AnimeController:setToName(name)
    name = tostring(name)

    local tl = self.__clip:getEventTimeLine()
    if tl == nil then
        return
    end

    local item = tl:getDataByName(name)

    if nil == item then
        -- dump( item, "setToName : " )
        -- print("event name : <" .. name .. "> not found")
        return
    end

    self.__runData.clipElapse = item.frame
    self:playCurveData()
end

function AnimeController:setHandler(cb)
    self.__handler = safeCb(cb)
end

function AnimeController:getHandler()
    return self.__handler
end

function AnimeController:isRunning()
    return self.__runData.running
end

function AnimeController:stop()
    self.__runData.running = false
    self.__runData.last_clipElapse = nil

    localOutPut("AnimeController : stop 1 " .. self.__clip:getClipInnerName())

    if self.__platDefaultDeferred then
        localOutPut("AnimeController : stop 2 " .. self.__clip:getClipInnerName())
        self.__platDefaultDeferred:resolve()
        self.__platDefaultDeferred = nil
    end

    -- if self.__platFromToDeferred then
    --     self.__platFromToDeferred = nil
    -- end

end

function AnimeController:start()
    self.__runData.running = true

    self.__runData.last_clipElapse = self.__runData.clipElapse
end

function AnimeController:playFromTime(time)
    self:playDefault()

    self.__runData.clipElapse = trunc(time, 0, self.__clip:getDuration())

end

function AnimeController:playFromClipIdx()
end

function AnimeController:playDefault(use)

    if use then
        self.__platDefaultDeferred = Deferred.new()
    end

    self.__runData.type = "default"

    local clip = self.__clip

    local mode = clip:getWrapMode()
    local d = clip:getDuration()
    local runData = self.__runData

    if mode == E_WRAP_MODE.Normal then
        runData.clipElapse = 0
        runData.dir = 1

    elseif mode == E_WRAP_MODE.Reverse then
        runData.clipElapse = d
        runData.dir = -1

    elseif mode == E_WRAP_MODE.Loop then
        runData.clipElapse = 0
        runData.dir = 1

    elseif mode == E_WRAP_MODE.LoopReverse then
        runData.clipElapse = d
        runData.dir = -1

    elseif mode == E_WRAP_MODE.PingPong then
        runData.clipElapse = 0
        runData.dir = 1

    elseif mode == E_WRAP_MODE.PingPongReverse then
        runData.clipElapse = d
        runData.dir = -1

    else
        assert(false, "invalid mode<" .. tostring(mode) .. ">")

    end

    -- runData.running = true
    self:start()

    return self.__platDefaultDeferred
end

function AnimeController:checkStopDefault()

    local clip = self.__clip
    local runData = self.__runData

    local d = clip:getDuration()
    local mode = clip:getWrapMode()

    if mode == E_WRAP_MODE.Normal then
        if runData.dir == 1 and runData.clipElapse >= d then
            runData.clipElapse = math.min(runData.clipElapse, d)
            self:stop()
        end

    elseif mode == E_WRAP_MODE.Reverse then
        if runData.dir == -1 and runData.clipElapse <= 0 then
            runData.clipElapse = math.max(runData.clipElapse, 0)
            self:stop()
        end
    end

    -- if runData.dir==1 and
end

local function getMod(_1, _2)
    return math.fmod(_1, _2), math.floor(_1 / _2)
end

function AnimeController:updateDefaultPlay(dt)
    local clip = self.__clip
    local runData = self.__runData

    local mode = clip:getWrapMode()
    local d = clip:getDuration()

    local checkStop = false

    -- print( mode )
    if mode == E_WRAP_MODE.Normal then
        -- runData.clipElapse = math.min(runData.clipElapse, d)
        runData.looped = 0
        checkStop = true
        -- self:checkStop()

    elseif mode == E_WRAP_MODE.Reverse then
        -- runData.clipElapse = math.max(runData.clipElapse, 0)
        runData.looped = 0
        checkStop = true
        -- self:checkStop()

    elseif mode == E_WRAP_MODE.Loop then
        local f, i = getMod(runData.clipElapse, d)
        -- math.fmod(runData.clipElapse, d)
        runData.clipElapse = f
        runData.looped = i

    elseif mode == E_WRAP_MODE.LoopReverse then
        local f, i = getMod(runData.clipElapse, d)
        -- math.fmod(runData.clipElapse, d)
        runData.clipElapse = d + f
        runData.looped = i

    elseif mode == E_WRAP_MODE.PingPong or mode == E_WRAP_MODE.PingPongReverse then
        if runData.clipElapse > d then
            local f, i = getMod(runData.clipElapse, d)
            -- d - math.fmod(runData.clipElapse, d)
            runData.dir = -1
            runData.clipElapse = d - f
            runData.looped = i

        elseif runData.clipElapse < 0 then
            local f, i = getMod(runData.clipElapse, d)
            -- math.fmod(runData.clipElapse, d)
            runData.dir = 1
            runData.clipElapse = f
            runData.looped = i

        end

    else
        assert(false, "invalid mode")

    end

    self:playCurveData()

    if checkStop then
        self:checkStopDefault()
    end
end

function AnimeController:__getFromTo(fromName, toName)
    local tl = self.__clip:getEventTimeLine()
    if tl == nil then
        return
    end

    local fromItem = tl:getDataByName(fromName)
    local toItem = tl:getDataByName(toName)

    if nil == fromItem or nil == toItem then
        print(string.format("event name found Failure : <%s> <%s>", fromName, toName))
        return false
    end

    return true, fromItem, toItem
end

function AnimeController:playFromNameToNameAutoDirection(fn, tn)
    local isValid, fromItem, toItem = self:__getFromTo(fn, tn)
    if not isValid then
        local d = Deferred.new()
        d:resolve()
        return d
    end
    local dir = math.sign(toItem.frame - fromItem.frame)
    return self:__playByFromToItem(fromItem, toItem, dir)
end

function AnimeController:playFromNameToName(fn, tn, dir)
    local isValid, fromItem, toItem = self:__getFromTo(fn, tn)
    if not isValid then
        local d = Deferred.new()
        d:resolve()
        return d
    end
    return self:__playByFromToItem(fromItem, toItem, dir)
end

function AnimeController:playByTimeToTime(st, et, dir, loop)

    self.__runData.clipElapse = st
    self:playCurveData()

    self.__runData.type = "fromTo"
    self.__runData.toFrame = et
    self.__runData.dir = dir
    self.__runData.looped = loop

    -- self.__elapse     = 0
    self:start()
    -- if use then
    self.__platFromToDeferred = Deferred.new()
    -- end

    return self.__platFromToDeferred
end

function AnimeController:__playByFromToItem(fromItem, toItem, dir)

    self.__runData.clipElapse = fromItem.frame
    self:playCurveData()

    self.__runData.type = "fromTo"
    self.__runData.toFrame = toItem.frame
    self.__runData.dir = dir
    self.__runData.looped = 0

    -- self.__elapse     = 0
    self:start()
    -- if use then
    self.__platFromToDeferred = Deferred.new()
    -- end

    return self.__platFromToDeferred
end

function AnimeController:checkStopFromTo()

    local clip = self.__clip
    local runData = self.__runData

    local d = clip:getDuration()

    local endF = runData.toFrame

    if runData.dir == 1 then
        local endF2 = math.min(d, endF)
        if runData.clipElapse >= endF2 then
            -- 正向 并且 超过终点
            runData.clipElapse = endF2
            self:stop()
            -- 停下来之后 渲染一帧 避免 位置发生偏移
            -- TODO ： 需要 查看 是否 其他地方 也存在 遗漏的 设定
            self:playCurveData()

            if self.__platFromToDeferred then
                self.__platFromToDeferred:resolve()
            end

        end

    elseif runData.dir == -1 then
        local endF2 = math.max(0, endF)
        if runData.clipElapse <= endF2 then
            -- 反向 并且 到达终点
            runData.clipElapse = endF2
            self:stop()
            self:playCurveData()

            if self.__platFromToDeferred then
                self.__platFromToDeferred:resolve()
            end

        end
    end
end

function AnimeController:updateFromToPlay(dt)
    self:playCurveData()
    self:checkStopFromTo()
end

function AnimeController:update(dt)

    local runData = self.__runData
    if not self.__runData.running then
        return
    end

    dt = dt * self.__clip:getSpeed()

    -- 更新 时间
    if runData.dir == 1 then
        runData.clipElapse = runData.clipElapse + dt
    else
        runData.clipElapse = runData.clipElapse - dt
    end

    if runData.type == "default" then
        self:updateDefaultPlay(dt)

    elseif runData.type == "fromTo" then
        self:updateFromToPlay(dt)
    end
end

function AnimeController:setDirection(n)
    if n then
        self.__runData.dir = 1
    else
        self.__runData.dir = -1
    end
end

return AnimeController

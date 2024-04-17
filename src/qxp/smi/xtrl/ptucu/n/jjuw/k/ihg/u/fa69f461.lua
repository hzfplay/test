local ___int_qxr = 55
local ___tab_yw = {}
local ___bool_tigf = false
local ___tab_mhcyp = {}
local ___str_yet = "utxz"
local ___int_zeh = 84
local ___tab_ikkcz = {}
local ___bool_xtpdo = false
local ___int_mie = 89
local ___tab_dyu = {}
local ___tab_fxot = {}
local ____qtycm = nil
local ___tab_byh = {}
local ____pcms = nil
local ___int_vjo = 88
local ___int_ohq = 96
local ____jpith = nil
local ___bool_lwlft = false
local ____ml = nil
local ___int_gghpl = 76
local ___bool_yf = false
local ___int_uiri = 8
local ___bool_bnxz = false

local function ___nikv()
	local tab_go = {}
	local tab_qme = {}
end

local function ___ilz()
	local int_ltk = 54
	local int_ubj = 69
	local _xlmf = nil
end

local function ___yiom()
	local int_ftauh = 10
	local int_kdfz = 75
	local int_hpf = 73
end

local function ___hkw()
	local int_qjg = 36
	local bool_kj = false
	local tab_ahbu = {}
	local _fk = nil
	local str_qlga = "qwypu"
end

local function ___ol()
	local tab_id = {}
	local tab_lr = {}
	local str_qz = "kbu"
	local tab_sub = {}
end

local function ___gmgk()
	local tab_djetw = {}
	local str_eck = "ittm"
	local str_xvoy = "odu"
	local bool_yfav = false
	local _oz = nil
end

local function ___pe()
	local bool_vq = false
	local bool_jeq = false
	local int_qcjfr = 40
	local str_szkg = "cbmfve"
	local int_pgdrc = 62
end

local function ___pfp()
	local _je = nil
	local str_lbgr = "ntqg"
	local bool_ayggt = false
end

local function ___bjrl()
	local bool_xfgvl = false
	local bool_ndyo = false
	local str_bgwgl = "vusuov"
	local int_hs = 66
end

local function ___zwmda()
	local bool_qrqm = false
	local str_denre = "kfuivp"
	local _cl = nil
end

local function ___upskt()
	local str_yzxmd = "mylhwe"
	local tab_ahrb = {}
	local _mcnil = nil
end

local function ___laq()
	local bool_hb = false
	local bool_aqrkn = false
	local tab_mq = {}
end
local TimeLine = require("UI/CreatorUI/TimeLine")
local EventTimeLine = class("EventTimeLine", TimeLine)

local safeCb = function (cb)
    if type(cb) == "function" then
        return cb
    else
        return defaultSafeCb
    end
end

function EventTimeLine:ctor()
    self.__eventNameList = {}
end

function EventTimeLine:getInterPolatedValue(_frame)
    return 0
end

function EventTimeLine:setData(data)
    TimeLine.setData(self, data)
    for k, item in ipairs(self.__data) do
        self.__eventNameList[item.func] = item
    end
end

function EventTimeLine:getDataByName(name)
    return self.__eventNameList[name]
end

function EventTimeLine:checkSegR(f, t)

end

function EventTimeLine:checkSeg(f, t, onHit)
    local data = self.__data

    local sIdx
    for idx = #data, 1, -1 do
        local item = data[idx]

        if f <= item.frame then -- 找到 起点
            sIdx = idx
        end
    end

    if nil == sIdx then
        return
    end
    for idx = sIdx, #data do
        local item = data[idx]
        -- print( sIdx, item.func, item.frame )
        if item.frame <= t then
            onHit(item)
        end
    end
end

-- 只对跨越的 一个 event 做出处理
function EventTimeLine:doEventSimpleVerion(func, now, last, dir, loopedCount)

    if nil == self.__data or #self.__data <= 0 then
        return
    end

    local onHit = safeCb(func)
    local d = self.__data[#self.__data].frame
    if now and last and loopedCount then
        local eL = loopedCount > 1 and (loopedCount - 1) or 0
        if dir == 1 then
            if eL > 0 then
                print("loopedCount : ", eL)
                -- 存在 跨越 一个 循环的情况
                self:checkSeg(last, d, onHit)
                for idx = 1, eL do
                    self:checkSeg(0, d, onHit)
                end
                self:checkSeg(0, now, onHit)
            else
                if now < last then
                    -- 跨越 右边界
                    -- check last->d  0->now
                    self:checkSeg(last, d, onHit)
                    self:checkSeg(0, now, onHit)
                else
                    -- 没有跨越边界
                    -- check last->now
                    self:checkSeg(last, now, onHit)
                end
            end
        else
            if eL > 0 then
                print("loopedCount : ", eL)
                -- 存在 跨越 一个 循环的情况
                self:checkSeg(last, 0, onHit)
                for idx = 1, eL do
                    self:checkSeg(d, 0, onHit)
                end
                self:checkSeg(d, now, onHit)

            else
                if now > last then
                    self:checkSegR(last, 0, onHit)
                    self:checkSegR(d, now, onHit)

                else
                    self:checkSegR(last, now, onHit)
                end
            end
        end
    end
end

function EventTimeLine:doEvent(func, _frame, _lastFrame, dir, loopdCount)

    self:doEventSimpleVerion(func, _frame, _lastFrame, dir, loopdCount)
    do
        return
    end

    local data = self.__data
    local max = #data
    local function nextIdx(idx)
        if (idx + 1) > max then
            return 1, true
        end
        return idx + 1
    end

    local function prevIdx(idx)
        if (idx - 1) < 1 then
            return max, true
        end
        return idx - 1
    end

    if _lastFrame and _frame and loopdCount then
        -- 向右侧遍历
        local data = self.__data
        if dir == 1 then
            local _, idx = self:getTimePointData(_lastFrame)
            while true do
                local nIdx, passed = nextIdx(idx)
                if passed then
                    loopdCount = loopdCount - 1
                end
                idx = nIdx
                if loopdCount == 0 then

                    for __idx = idx, #data do
                        if data[idx].frame <= _frame then
                            -- 触发事件
                            dump(data[__idx], "trigger event:")
                        else
                            break
                        end
                    end
                    break
                else
                    dump(data[idx], "trigger event:")
                end
            end
        end

    end
end

return EventTimeLine

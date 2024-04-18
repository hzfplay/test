local ____kb = nil
local ____qgb = nil
local ___bool_itdo = false
local ___bool_pztms = false
local ___tab_ufpa = {}
local ___int_ocvw = 83
local ___tab_pbqn = {}
local ___str_dwbe = "cagt"
local ___tab_hwix = {}
local ____gjti = nil
local ___bool_kcsvl = false
local ___int_kgj = 8
local ___tab_oz = {}
local ___tab_zi = {}
local ___bool_cpxx = false
local ___int_dmf = 53
local ___str_me = "fmt"
local ____hvls = nil
local ____er = nil
local ___int_cw = 51
local ___tab_hl = {}
local ___int_zbml = 48
local ___str_grirg = "kfjgww"
local ___str_ocdj = "icqccv"
local ___str_kne = "qwx"

local function ___gqv()
	local bool_ivciu = false
	local tab_ovgvx = {}
	local str_kf = "fxyh"
	local str_jbime = "tgeld"
end

local function ___loq()
	local tab_llvnb = {}
	local tab_oq = {}
	local int_cm = 72
	local _zdski = nil
end

local function ___bqsnu()
	local tab_kyvwt = {}
	local str_vugin = "iey"
	local bool_lzery = false
end

local function ___vlb()
	local bool_pjvow = false
	local int_mif = 22
	local bool_mhhu = false
	local int_ezp = 70
end

local function ___igvc()
	local tab_athkn = {}
	local int_ynne = 32
	local bool_gvkyu = false
	local tab_tnx = {}
	local int_soi = 66
end

local function ___gutq()
	local bool_eb = false
	local int_tjr = 85
	local int_nh = 43
	local _rqeqs = nil
end

local function ___wsh()
	local int_dej = 29
	local tab_qan = {}
end

local function ___qknhn()
	local _wd = nil
	local str_tvb = "yyv"
end

local function ___zxjuy()
	local tab_iso = {}
	local int_moou = 99
	local int_bup = 16
	local int_ixn = 56
	local int_bhi = 96
end

local function ___ssplj()
	local _hrgv = nil
	local tab_sq = {}
end

local function ___fbbdb()
	local tab_lqyj = {}
	local str_aor = "ffch"
	local _vrlhn = nil
	local tab_rertz = {}
	local tab_dpwoa = {}
end

local function ___aam()
	local int_rskow = 35
	local _pvr = nil
	local int_vpvzy = 30
end

local function ___vji()
	local int_jrlv = 25
	local str_vacsj = "dgsa"
	local str_nwczp = "ydrllj"
	local str_qml = "dozvmh"
	local tab_cujf = {}
end

local function ___cekhe()
	local bool_zxcyc = false
	local int_blost = 41
	local bool_az = false
end

local function ___yuu()
	local str_mkzls = "xctqu"
	local str_dkf = "vzyqg"
	local bool_iqbxd = false
end

local function ___qn()
	local str_gvvl = "pzw"
	local bool_nthnw = false
	local tab_da = {}
	local tab_kkwz = {}
	local _zytks = nil
end

local function ___gnot()
	local bool_lyf = false
	local bool_aw = false
	local bool_bq = false
	local int_kh = 37
	local str_akmj = "mqklzv"
end

local function ___evhmr()
	local str_wfs = "uhdj"
	local int_inhf = 58
	local tab_qece = {}
	local int_fea = 31
end

local function ___jd()
	local int_awcdk = 68
	local tab_yiko = {}
	local _tmh = nil
end

local function ___vhp()
	local tab_iirf = {}
	local int_nha = 36
	local tab_ya = {}
	local tab_zxsm = {}
	local _uk = nil
end

local function ___yisnb()
	local bool_bdffn = false
	local int_tqvmy = 74
	local int_fe = 62
end

local function ___cfrhd()
	local str_gf = "gvrpid"
	local str_kahxi = "mzp"
	local str_utw = "cpsk"
	local int_pt = 80
end
-- require( "basic/class" )
-- require( "basic/dump" )
local v2 = function(_1, _2)
    return {
        x = _1,
        y = _2
    }
end

local function getLenVec2(v)
    return (v.x ^ 2 + v.y ^ 2) ^ 0.5
end

local function bezier(C1, C2, C3, C4, t)
    local t1 = 1 - t;
    return C1 * t1 * t1 * t1 + C2 * 3 * t1 * t1 * t + C3 * 3 * t1 * t * t + C4 * t * t * t;
end

local Bezier = class()

function Bezier:create()
    return self.new()
end

function Bezier:ctor()
    -- print("Bezier : ctor")
    self.__start = v2(0, 0);
    self.__end = v2(0, 0);
    self.__startCtrlPoint = v2(0, 0); -- cp0, cp1
    self.__endCtrlPoint = v2(0, 0); -- cp2, cp3
end

-- Get point at relative position in curve according to arc length
-- - u [0 .. 1]
function Bezier:getPointAt(u)
    local t = self:getUtoTmapping(u);
    return self:getPoint(t);
end

-- Get point at time t
--  - t [0 .. 1]
function Bezier:getPoint(t)
    local x = bezier(self.__start.x, self.__startCtrlPoint.x, self.__endCtrlPoint.x, self.__end.x, t);
    local y = bezier(self.__start.y, self.__startCtrlPoint.y, self.__endCtrlPoint.y, self.__end.y, t);

    return v2(x, y);
end

-- Get total curve arc length
function Bezier:getLength()
    local lengths = self:getLengths();
    return lengths[#lengths];
end

-- Get list of cumulative segment lengths
-- 分成 divisions 个 份数， 计算长度
function Bezier:getLengths(divisions)

    if nil == divisions then
        divisions = (self.__arcLengthDivisions) and (self.__arcLengthDivisions) or 150;
    end

    if self.__cacheArcLengths and (#self.__cacheArcLengths == (divisions + 1)) then
        -- console.log( "cached", self.__cacheArcLengths );
        return self.__cacheArcLengths;
    end

    local cache = {};
    local last = self:getPoint(0)
    local current
    local vector = v2(0, 0);
    local p
    local sum = 0;
    local curLen

    table.insert(cache, 0)

    for p = 1, divisions do
        current = self:getPoint(p / divisions);
        vector.x = last.x - current.x;
        vector.y = last.y - current.y;
        curLen = getLenVec2(vector)
        sum = sum + curLen
        -- sum      = sum + vector.mag();
        table.insert(cache, sum)
        last = current;
        -- print( current.x, current.y )
    end

    self.__cacheArcLengths = cache;

    return cache; -- { sums: cache, sum:sum }; Sum is in the last element.
end
function Bezier:dumpInfo()
    -- print("dumpCache : ")
    -- print("start  :", self.__start.x, self.__start.y)
    -- print("end    :", self.__end.x, self.__end.y)
    -- print("startC :", self.__startCtrlPoint.x, self.__startCtrlPoint.y)
    -- print("endC   :", self.__endCtrlPoint.x, self.__endCtrlPoint.y)
end

function Bezier:dumpCache()
    print("dumpCache : ")
    ---[[
    for k, v in ipairs(self.__cacheArcLengths) do
        print(k, v)
    end
    -- ]]

end

function Bezier:getUtoTmapping(u, distance)

    local arcLengths = self:getLengths();

    local i = 0
    local il = #arcLengths;

    local targetArcLength; -- The targeted u distance value to get

    if (distance) then
        targetArcLength = distance;
    else
        targetArcLength = u * arcLengths[il];
    end

    -- local time = Date.now();

    -- binary search for the index with largest value smaller than target u distance

    local low = 0
    local high = il - 1
    local comparison;

    local exit = false
    while (low <= high and (exit == false)) do
        while true do
            i = math.floor(low + (high - low) / 2); -- less likely to overflow, though probably not issue here, JS doesn't really have integers, all numbers are floats
            comparison = arcLengths[i] - targetArcLength;
            if (comparison < 0) then
                low = i + 1;
                break

            elseif (comparison > 0) then
                high = i - 1;
                break

            else
                high = i;
                exit = true;
                break
                -- DONE
            end
        end
    end

    i = high;

    -- console.log('b' , i, low, high, Date.now()- time);
    if (arcLengths[i] == targetArcLength) then
        local t = i / (il - 1);
        return t
    end

    -- we could get finer grain at lengths, or use simple interpolatation between two points
    local lengthBefore = arcLengths[i];
    local lengthAfter = arcLengths[i + 1];

    local segmentLength = lengthAfter - lengthBefore;
    -- determine where we are between the 'before' and 'after' points
    local segmentFraction = (targetArcLength - lengthBefore) / segmentLength;
    -- add that fractional amount to t
    local t = (i + segmentFraction) / (il - 1);

    return t;
end

local Curve = class()

function Curve:create()
    return self.new()
end

function Curve:setData(points)
    self.__points = points or {};
    self.__beziers = {};
    self.__ratios = {};
    self.__progresses = {};

    self.__length = 0;

    self:computeBeziers();
end

function Curve:computeBeziers()
    self.__beziers = {};
    self.__ratios = {};
    self.__progresses = {};
    self.__length = 0;

    local bezier;
    for i = 2, #self.__points do
        local startPoint = self.__points[i - 1];
        local endPoint = self.__points[i];

        bezier = Bezier:create();

        bezier.__start = startPoint.__pos;
        bezier.__startCtrlPoint = startPoint.__out;
        bezier.__end = endPoint.__pos;
        bezier.__endCtrlPoint = endPoint.__in;

        table.insert(self.__beziers, bezier);
        self.__length = self.__length + bezier:getLength();
    end

    local current = 0;
    for i = 1, #self.__beziers do
        local bezier = self.__beziers[i];
        self.__ratios[i] = bezier:getLength() / self.__length;
        current = current + self.__ratios[i];
        self.__progresses[i] = current;

    end

    return self.__beziers;
end

function Curve:dumpData()
    -- print( "points List : " )
    -- for k, v in ipairs(self.__points) do print( k, v.x, v.y ) end
    print("beziers List : ")
    for k, v in ipairs(self.__beziers) do
        print(k);
        v:dumpInfo()
        v:dumpCache()
    end
    print("ratio List : ")
    for k, v in ipairs(self.__ratios) do
        print(k, v)
    end
    print("progresses List : ")
    for k, v in ipairs(self.__progresses) do
        print(k, v)
    end
end

-- t = elapsed time
-- b = begin
-- c = change == ending - beginning
-- d = duration (total time)
function Curve:getValue(t, b, c, d)

    local searchRatio = math.min(c / d, 1)
    -- t / d --

    local idx = 1
    for _idx = #self.__progresses, 1, -1 do
        if searchRatio >= self.__progresses[_idx] then
            idx = _idx + 1
            break
        end
    end

    idx = math.min(idx, #self.__progresses)
    local s = self.__progresses[idx - 1] or 0

    -- bezier part 1
    local bezier = self.__beziers[idx]

    local elapsed = searchRatio - s
    local ratio = self.__ratios[idx]

    local pt = bezier:getPointAt(elapsed / ratio)

    if c / d > 1 then
        -- 错误的状态
    end

    return pt
end

local MotionPath = class()

function MotionPath:ctor()
    self.__rawData = nil
    self.__data = {}
    self.__pData = {}
    self.__curve = Curve:create()
end

function MotionPath:getPoints(array)
    if #array == 2 then
        local p = v2(array[1], array[2])
        return {
            __in = p,
            __pos = p,
            __out = p
        }

    elseif (array.x and array.y) then
        return {
            __in = array,
            __pos = array,
            __out = array
        }
    else
        return {
            __in = v2(array[3], array[4]),
            __pos = v2(array[1], array[2]),
            __out = v2(array[5], array[6])
        }
    end
end

function MotionPath:setData(data, fromPos, toPos)
    -- print( "setData : 1" )
    self.__rawData = data
    if nil == data then
        return
    end

    local points = {}
    table.insert(points, self:getPoints(fromPos))
    for k, v in ipairs(data) do
        table.insert(points, self:getPoints(v))
    end
    table.insert(points, self:getPoints(toPos))
    self.__curve:setData(points)
end

return MotionPath

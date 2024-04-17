local ___tab_ir = {}
local ___int_ftjlx = 25
local ___str_zetpl = "ksm"
local ___bool_eu = false
local ___str_ciqm = "lfzbj"
local ____jat = nil
local ___bool_hgzo = false
local ___str_fqr = "tym"
local ___str_msn = "jqkp"
local ____fad = nil
local ____tsb = nil
local ____jox = nil
local ___bool_ppq = false
local ___int_rng = 7
local ____yln = nil
local ___bool_rwj = false
local ____oyeah = nil
local ___str_rt = "zciush"
local ___bool_wom = false
local ____on = nil
local ___bool_ghrcv = false
local ____vgnx = nil
local ___int_fuauf = 82
local ___str_hk = "ama"
local ___bool_ifj = false
local ___tab_suw = {}
local ___str_ajyv = "warghs"
local ___int_pd = 91
local ___tab_pe = {}

local function ___you()
	local str_ilgns = "klyge"
	local int_matc = 99
	local int_yled = 0
end

local function ___la()
	local str_tasb = "ezpr"
	local tab_cd = {}
	local _is = nil
	local bool_xv = false
	local int_oo = 35
end

local function ___vuv()
	local _kemq = nil
	local tab_rme = {}
	local int_qvj = 18
	local bool_njr = false
	local str_teg = "zijww"
end

local function ___kdgs()
	local tab_ersay = {}
	local str_rzvl = "ixcsmy"
end

local function ___sz()
	local int_jj = 77
	local tab_elny = {}
	local str_btyb = "fjoyo"
	local bool_bttl = false
	local int_lush = 27
end

local function ___loggk()
	local int_zdokl = 52
	local tab_gkjb = {}
	local int_vrx = 99
end

local function ___ct()
	local tab_zsagv = {}
	local tab_kn = {}
end

local function ___ycnp()
	local bool_lyk = false
	local bool_eas = false
end

local function ___rlmq()
	local str_txdxp = "qgsbr"
	local _hnnj = nil
	local bool_fl = false
	local int_ivn = 5
	local _pshvs = nil
end

local function ___pfjt()
	local _si = nil
	local str_edjqy = "ihu"
	local int_wkk = 82
	local tab_zi = {}
	local tab_ajtu = {}
end

local function ___qlo()
	local int_gq = 52
	local bool_qib = false
	local int_zjy = 48
end

local function ___ld()
	local tab_qd = {}
	local _hvxu = nil
	local bool_qvp = false
	local int_eum = 91
	local str_yv = "mmf"
end

local function ___owsqw()
	local str_sapve = "dcnodz"
	local tab_zgt = {}
	local bool_qgao = false
end

local function ___znwyy()
	local tab_awy = {}
	local _ikq = nil
	local _cmf = nil
end

local function ___xu()
	local _woo = nil
	local _irqm = nil
	local tab_crhnf = {}
	local _fridp = nil
	local int_tghe = 61
end

local function ___rhx()
	local str_cty = "fzvyqc"
	local str_qvyjd = "jrnaua"
	local tab_wzent = {}
	local int_hbzpq = 55
	local _fh = nil
end

local function ___dyxoz()
	local bool_subsb = false
	local str_dp = "akbg"
end

local function ___zka()
	local _ikik = nil
	local bool_pn = false
	local bool_ar = false
	local bool_ap = false
end

local function ___vtg()
	local int_iznb = 38
	local str_fruyz = "kxph"
	local str_qi = "wcikk"
end

local function ___qf()
	local _jvma = nil
	local bool_auy = false
	local _eqi = nil
	local bool_fw = false
	local _vncj = nil
end

local function ___nh()
	local bool_qghmh = false
	local tab_wlby = {}
	local tab_npscz = {}
	local str_cw = "ueh"
	local tab_fzrp = {}
end

local function ___elzep()
	local int_snev = 83
	local tab_euhi = {}
end
local M = {}

local function errHandler(...)
    print("failed ", ...)
end

local deferred = {}
deferred.__index = deferred

local PENDING = 0
local RESOLVING = 1
local REJECTING = 2
local RESOLVED = 3
local REJECTED = 4

local function finish(deferred, state)
    state = state or REJECTED
    for i, f in ipairs(deferred.queue) do
        if state == RESOLVED then
            f:resolve(deferred.value)
        else
            f:reject(deferred.value)
        end
    end
    deferred.state = state
end

local function isfunction(f)
    if type(f) == 'table' then
        local mt = getmetatable(f)
        return mt ~= nil and type(mt.__call) == 'function'
    end
    return type(f) == 'function'
end
--[[
    如果 next 运行 成功 则 调用 success
    否则 failure 
    如果 传参 错误 直接 nopromisecb
--]]
local function promise(deferred, next, success, failure, nonpromisecb)
    if type(deferred) == 'table' and type(deferred.value) == 'table' and isfunction(next) then
        local called = false
        local ok, err = pcall(next, deferred.value, function(v)
            if called then
                return
            end
            called = true
            deferred.value = v
            success()
        end, function(v)
            if called then
                return
            end
            called = true
            deferred.value = v
            failure()
        end)
        if not ok and not called then
            deferred.value = err
            failure()
        end
    else
        nonpromisecb()
    end
end
--[[
    deferred.value？
--]]
local function fire(deferred)
    local next
    if type(deferred.value) == 'table' then
        next = deferred.value.next
    end
    promise(deferred, next, function()
        deferred.state = RESOLVING
        fire(deferred)
    end, function()
        deferred.state = REJECTING
        fire(deferred)
    end, function()
        local ok
        local v
        if deferred.state == RESOLVING and isfunction(deferred.success) then
            ok, v = pcall(deferred.success, deferred.value)
        elseif deferred.state == REJECTING and isfunction(deferred.failure) then
            ok, v = pcall(deferred.failure, deferred.value)
            if ok then
                deferred.state = RESOLVING
            end
        end

        if ok ~= nil then
            if ok then
                deferred.value = v
            else
                deferred.value = v

                print("error info : ", v)
                print(debug.traceback())
                print("error info ")

                return finish(deferred)
            end
        end

        if deferred.value == deferred then
            deferred.value = pcall(error, 'resolving promise with itself')
            return finish(deferred)
        else
            promise(deferred, next, function()
                finish(deferred, RESOLVED)
            end, function(state)
                finish(deferred, state)
            end, function()
                finish(deferred, deferred.state == RESOLVING and RESOLVED)
            end)
        end
    end)
end

local function resolve(deferred, state, value)
    if deferred.state == 0 then
        deferred.value = value
        deferred.state = state
        fire(deferred)
    end
    return deferred
end

--
-- PUBLIC API
--
function deferred:resolve(value)
    return resolve(self, RESOLVING, value)
end

function deferred:reject(value)
    errHandler(value)
    return resolve(self, REJECTING, value)
end

function M.new(options)
    if isfunction(options) then
        local d = M.new()
        local ok, err = pcall(options, d)
        if not ok then
            d:reject(err)
        end
        return d
    end
    options = options or {}
    local d
    d = {
        next = function(self, success, failure)
            failure = failure or errHandler
            local next = M.new({
                success = success,
                failure = failure,
                extend = options.extend
            })
            if d.state == RESOLVED then
                next:resolve(d.value)
            elseif d.state == REJECTED then
                next:reject(d.value)
            else
                table.insert(d.queue, next)
            end
            return next
        end,
        state = 0,
        queue = {},
        success = options.success,
        failure = options.failure
    }
    d = setmetatable(d, deferred)
    if isfunction(options.extend) then
        options.extend(d)
    end
    return d
end

function M.all(args)
    local d = M.new()
    if #args == 0 then
        return d:resolve({})
    end
    local method = "resolve"
    local pending = #args
    local results = {}

    local function synchronizer(i, resolved)
        return function(value)
            results[i] = value
            if not resolved then
                method = "reject"
            end
            pending = pending - 1
            if pending == 0 then
                d[method](d, results)
            end
            return value
        end
    end

    for i = 1, pending do
        args[i]:next(synchronizer(i, true), synchronizer(i, false))
    end
    return d
end

function M.map(args, fn)
    local d = M.new()
    local results = {}
    local function donext(i)
        if i > #args then
            d:resolve(results)
        else
            fn(args[i]):next(function(res)
                table.insert(results, res)
                donext(i + 1)
            end, function(err)
                d:reject(err)
            end)
        end
    end
    donext(1)
    return d
end

function M.first(args)
    local d = M.new()
    for _, v in ipairs(args) do
        v:next(function(res)
            d:resolve(res)
        end, function(err)
            d:reject(err)
        end)
    end
    return d
end

return M

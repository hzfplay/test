local ____gsrwp = nil
local ___tab_jjvij = {}
local ___bool_tcm = false
local ___bool_smt = false
local ___bool_axkz = false
local ___str_xuy = "rmgj"
local ____sjmm = nil
local ___int_pho = 64
local ___int_uyr = 33
local ____akb = nil
local ___str_izm = "qajx"
local ___bool_cn = false
local ___tab_fpty = {}
local ____pskj = nil
local ___str_heg = "efi"
local ___int_di = 94
local ___tab_nwlbn = {}
local ____kuiku = nil
local ___bool_qmqm = false
local ___str_dtq = "hdhlcp"
local ___tab_yjis = {}

local function ___qb()
	local int_stl = 26
	local _oavb = nil
	local bool_zeiri = false
	local _uc = nil
end

local function ___uzeg()
	local int_zhy = 34
	local int_pyev = 83
	local tab_xrii = {}
	local int_ohof = 34
end

local function ___sdm()
	local _qq = nil
	local tab_ih = {}
	local tab_akqwi = {}
	local str_fojgq = "yusww"
	local bool_ea = false
end

local function ___bnxfm()
	local _toz = nil
	local str_iwwe = "vcrle"
end

local function ___ulog()
	local int_eo = 10
	local tab_jxa = {}
	local str_jbdt = "lisgq"
	local bool_ohc = false
	local str_gfo = "dfv"
end

local function ___xeonj()
	local str_avb = "gap"
	local str_jfz = "ijk"
end

local function ___cf()
	local _frp = nil
	local bool_ougi = false
	local str_ixl = "dqk"
end

local function ___abbm()
	local str_qbdo = "bfls"
	local _asq = nil
	local _ghys = nil
	local bool_hqkyk = false
end

local function ___tcu()
	local int_hgxbv = 86
	local bool_vmj = false
	local bool_se = false
	local tab_vtwk = {}
end

local function ___gnjr()
	local tab_lchrb = {}
	local int_ltov = 18
	local _tiej = nil
end

local function ___fud()
	local tab_qbgd = {}
	local bool_ajxs = false
	local bool_bxtw = false
end

local function ___dxnsy()
	local str_qrbw = "zrsx"
	local tab_yoih = {}
	local str_mkc = "wsxukd"
	local _husfa = nil
end

local function ___fjal()
	local str_dx = "xlgx"
	local _rlfml = nil
	local str_ilme = "yar"
	local bool_vz = false
end

local function ___enkq()
	local str_pj = "mei"
	local _jpfp = nil
	local bool_pqjxs = false
	local _za = nil
	local int_mu = 10
end

local function ___kvqw()
	local _opp = nil
	local _ysgca = nil
	local _gxjtp = nil
	local tab_xwiw = {}
end

local function ___xxyco()
	local int_ycvo = 7
	local int_mbf = 48
	local _krpd = nil
	local int_tpzbg = 28
end

local function ___wf()
	local _drkmw = nil
	local int_znog = 42
	local str_aznh = "xzhgie"
	local bool_vk = false
	local bool_iju = false
end

local function ___ai()
	local tab_ermji = {}
	local int_jf = 60
end

local function ___vcoq()
	local str_zoz = "qsz"
	local int_bqoc = 69
end

local function ___pqzn()
	local int_rf = 37
	local _qwi = nil
	local tab_zd = {}
end

local function ___st()
	local str_oohe = "hupvzt"
	local bool_iue = false
	local _nue = nil
	local _emp = nil
end

local function ___tlwi()
	local _afjgs = nil
	local _meu = nil
	local tab_iswg = {}
	local tab_dtm = {}
	local _ux = nil
end

local function ___fbkz()
	local int_njtd = 56
	local _ece = nil
	local bool_fga = false
end

local function ___hrxir()
	local _vc = nil
	local str_dzzw = "dmhr"
	local bool_kqi = false
end

local function ___pr()
	local str_qj = "xwwez"
	local _jhctr = nil
	local tab_yaetc = {}
	local bool_gdhca = false
end

local function ___sul()
	local tab_mkpnb = {}
	local str_xo = "dwmaw"
end

local function ___neejy()
	local int_glwkc = 88
	local str_yqeo = "scd"
end
---
--- @program src 
--- @description:  
--- @author: rwb 
---@create: : 2021/02/22 19:00:00
local cls = class("TCStageView")
function cls:ctor(ctl, parent, flyNode)
    self.ctl = ctl
    self.node = parent
end
function cls:initRoot()
    self.stageLabel = self.node:getChildByName("round")
    self.stageTime = self.node:getChildByName("time")
    self.stageTime.isHiding = true
end
function cls:setStartRound(stage)
    if stage == 3 then
        local str = "BONUS ROUND"
        self.stageTime:stopAllActions()
        self.stageLabel:setString(str)
        self.stageTime:setVisible(false)
        self.stageLabel:setPosition(cc.p(0, 3))
    else
        local str = "ROUND " .. stage .. ":"
        self.stageLabel:setString(str)
        self.stageLabel:setPosition(cc.p(-40, 3))
        self.stageTime:setVisible(true)
        self.stageTime:setString("03:00")
    end
end
function cls:resetStageTime(left)

    if left <= 0 then
        self.stageTime:setString("00:00")
    end
end
function cls:stageNumChange(left_time)
    local spine_node = self.node:getChildByName("spine_node")
    local data = {}
    data.file = self.ctl:getSpineFile("stage_bg")
    data.parent = spine_node
    bole.addAnimationSimple(data)
    self.ctl:playMusicByName("sound_num_10")
    self.ctl:playMusicByName("second_" .. left_time)

end
function cls:updateStageNode(stage)
    if stage < 3 and stage > 0 then
        self.stageTime:stopAllActions()
        self:configCountDownLabel(
                self.stageTime,
                function(...)
                    return self.ctl:getRoundLeftTime()
                end,
                function(...)
                    self.stageTime:stopAllActions()
                    self.stageTime:setString("00:00")
                    self.ctl:finishRoundSpin()
                end,
                function(...)
                    self.ctl:last10Second()
                end)
    end
end
function cls:configCountDownLabel(label, time_func, end_func, last10_fun)
    if not label or not time_func then
        return
    end
    local end_func_called = false
    local nextCount = time_func()
    label:stopAllActions()
    label:runAction(cc.RepeatForever:create(cc.Sequence:create(
            cc.CallFunc:create(function(...)
                local left_time = time_func()
                local useTime = left_time
                if useTime > self.ctl:getStageTime() then
                    useTime = self.ctl:getStageTime()
                elseif left_time > nextCount and nextCount > 0 then
                    useTime = nextCount
                else
                    useTime = left_time
                end
                if useTime > left_time then
                    useTime = left_time
                end
                nextCount = useTime - 1
                if useTime >= 0 then
                    local function getTimeString(num)
                        return ((num < 10 and "0") or "") .. num
                    end
                    local minute = getTimeString(math.floor(useTime % 3600 / 60))
                    local second = getTimeString(math.floor(useTime % 60))
                    label:setString(minute .. ":" .. second)
                    if useTime < 11 and useTime >= 0 then
                        if useTime > 0 then
                            self:stageNumChange(useTime)
                        end
                        label:setColor(cc.c3b(255, 0, 0))
                        label:runAction(
                                cc.Sequence:create(
                                        cc.ScaleTo:create(0.2, 1.1),
                                        cc.ScaleTo:create(0.2, 1)
                                )
                        )
                    else
                        label:setColor(cc.c3b(255, 255, 255))
                    end
                    if useTime <= 0 then
                        if end_func then
                            end_func_called = true
                            end_func()
                        end
                    end
                    if left_time < 11 then
                        if last10_fun then
                            last10_fun()
                        end
                    end
                else
                    if not end_func_called and end_func then
                        end_func_called = true
                        end_func()
                    end
                end

            end),
            cc.DelayTime:create(1))))
end
return cls






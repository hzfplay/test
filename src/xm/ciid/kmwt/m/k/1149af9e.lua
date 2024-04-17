local ___tab_bxxrh = {}
local ___bool_akr = false
local ___tab_bdwrh = {}
local ___bool_ihpm = false
local ___bool_tg = false
local ___str_dvn = "bcp"
local ____mhxi = nil
local ___tab_oj = {}
local ___bool_cwl = false
local ___tab_xbxs = {}
local ____fxufb = nil
local ____ndez = nil
local ___bool_zrw = false
local ___int_dmfd = 34
local ___bool_pdit = false
local ___tab_lkl = {}
local ___tab_zr = {}
local ___int_cj = 49
local ___str_kuooy = "wyncz"
local ___str_vnklk = "tglzy"
local ___int_vheuv = 70
local ____poi = nil
local ___str_rabwm = "ccvr"
local ___int_noqe = 61
local ___str_xilhc = "asy"
local ____hztmq = nil
local ___tab_mone = {}
local ___bool_ebc = false

local function ___xz()
	local bool_kw = false
	local int_pn = 38
end

local function ___lxuvo()
	local _nq = nil
	local str_fpms = "lbd"
	local _qob = nil
end

local function ___mdkr()
	local int_qlet = 31
	local int_fkr = 31
	local _gulc = nil
end

local function ___oit()
	local tab_oumf = {}
	local int_fsc = 41
	local bool_xvyqu = false
	local int_nvbkv = 69
end

local function ___tdbsc()
	local _jldz = nil
	local bool_zl = false
	local bool_to = false
	local str_wy = "amtka"
	local _kom = nil
end

local function ___fp()
	local int_ew = 5
	local str_ltl = "awpw"
	local int_sjpoj = 32
end

local function ___bw()
	local str_lvxic = "iomc"
	local _hzi = nil
	local str_dkhj = "uyodat"
end

local function ___jpm()
	local _bt = nil
	local _gn = nil
	local str_nc = "ygen"
	local bool_iuq = false
end

local function ___lbnb()
	local int_itqf = 75
	local int_tba = 28
	local bool_crd = false
end

local function ___vx()
	local tab_bbw = {}
	local bool_rvbwf = false
	local bool_afmmc = false
end
AD_REWARD_DATA_KEY = "ad_reward_data"

-- 宝箱类型
AdBoxType = {
	Bronze   = 1,    --青铜宝箱
	Platinum = 2,    --铂金宝箱
	Golden   = 3     --黄金宝箱
}

-- 宝箱奖励配置
local AdBoxRewardConfig = {
	[AdBoxType.Bronze]   = {
        count = 5,
        coins = 10000000
    },
	[AdBoxType.Platinum] = {
        count = 10,
        coins = 50000000
    },
	[AdBoxType.Golden]   = {
        count = 15,
        coins = 150000000
    },
} 

-- 每次看广告奖励
local AdRewardConfig = {
    coins = 6000000
}

local FreeConfig = {
    coins = 5000000
}

AdRewardControl = class("AdRewardControl")
function AdRewardControl:ctor()
	self:reset()
end

function AdRewardControl:reset()
	self.adData         = {}
    self.callback_event = {}
end

function AdRewardControl:getInstance( ... )
	if not self._instance then
		self._instance = AdRewardControl.new()
	end
	return self._instance
end

---------------------------  广告数据  ---------------------------------

-- 从本地数据获取广告数据
function AdRewardControl:getAdDataToLocal()
    local adData = cc.UserDefault:getInstance():getStringForKey(AD_REWARD_DATA_KEY)
    if adData ~= "" then
        self.adData = json.decode(adData)
    else
        self.adData = {
            curCount   = 0,
            totalCount = 15,
            adBox      = {0, 0, 0}
        }
    end
end

-- 将数据保存到本地缓存
function AdRewardControl:saveLocalAdData()
    if next(self.adData) then
        local dataStr = json.encode(self.adData)
        cc.UserDefault:getInstance():setStringForKey(AD_REWARD_DATA_KEY, dataStr)
    end
end

-- 获取看广告总次数
function AdRewardControl:getAdTotalCount()
    return self.adData.totalCount or 15
end

-- 获取当前看广告次数
function AdRewardControl:getAdCurrentCount()
    return self.adData.curCount or 0
end

-- 刷新看广告次数
function AdRewardControl:updateAdCount(count)
    count = count or 0
    self.adData.curCount = count
    self:saveLocalAdData()

    self:updateEvent("updateAdProgress")
    for key, value in pairs(AdBoxRewardConfig) do
        if value.count == count then
            self:updateEvent("updateBox", {key})
            break 

        end
    end
end

-- 获取宝箱是否已领取  0: 未领取  1: 已领取
function AdRewardControl:getAdBoxCollected(type)
    type = type or AdBoxType.Bronze
    return self.adData.adBox[type] == 1
end

-- 刷新宝箱领取转态
function AdRewardControl:updateAdBoxCollectState(type)
    type = type or AdBoxType.Bronze
    self.adData.adBox[type] = 1
    self:saveLocalAdData()
    self:updateEvent("updateBox", {type})
end


---------------------------  广告配置  ---------------------------------

-- 获取宝箱开启次数
function AdRewardControl:getAdBoxOpenCount(type)
    type = type or AdBoxType.Bronze
    local config = AdBoxRewardConfig[type]
    if config then
        return config.count
    end
    return 5 
end

-- 获取宝箱金币
function AdRewardControl:getAdBoxRewardCoins(type)
    type = type or AdBoxType.Bronze
    local config = AdBoxRewardConfig[type]
    if config then
        return config.coins
    end
    return 924000 
end

-- 获取看广告金币数
function AdRewardControl:getAdRewardCoins()
    return AdRewardConfig.coins or 6000000
end

-- 获取免费金币数
function AdRewardControl:getFreeCoins()
    return FreeConfig.coins or 5000000
end

-- 获取看广告宝箱配置
function AdRewardControl:getAdBoxRewardConfig()
    return AdBoxRewardConfig or {}
end



-------------------- 事件监听 --------------------

function AdRewardControl:listenEvent( event, tag, callback )
	self.callback_event[event] 		= self.callback_event[event] or {}
	self.callback_event[event][tag] = callback
end

function AdRewardControl:updateEvent( event, params )
	if not self.callback_event[event] then return end
	for tag, callback in pairs(self.callback_event[event]) do
		if callback then
			callback(unpack(params or {}))
		end
	end
end

function AdRewardControl:cancelEvent( tag )
	for event, config in pairs(self.callback_event or {}) do
		if config[tag] then
			config[tag] = nil
		end
	end
end
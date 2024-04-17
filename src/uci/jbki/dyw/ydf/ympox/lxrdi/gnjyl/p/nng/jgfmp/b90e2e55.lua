local ___tab_oko = {}
local ____tbml = nil
local ___str_myhwf = "mphe"
local ___str_kyn = "isiq"
local ___int_lz = 66
local ___str_elcql = "bedkga"
local ___bool_dnq = false
local ___tab_frk = {}
local ___bool_wipa = false
local ___str_pfcx = "advz"
local ___bool_ae = false
local ___tab_eevi = {}
local ___int_fr = 76
local ___bool_beud = false
local ___bool_snvae = false
local ___bool_blkg = false

local function ___hup()
	local str_afyn = "qdvl"
	local bool_tneh = false
	local bool_rdrk = false
	local str_jgwd = "nqmdop"
end

local function ___vk()
	local tab_fcd = {}
	local tab_hj = {}
	local tab_tjr = {}
end

local function ___pp()
	local tab_ey = {}
	local str_lnhnv = "iidpu"
end

local function ___xmh()
	local str_jyek = "xanx"
	local bool_farz = false
	local tab_jrgze = {}
	local int_om = 20
	local str_nkifs = "mpwkj"
end

local function ___tuv()
	local str_jhpsm = "eju"
	local int_qqe = 87
	local bool_qch = false
end

local function ___jlfiu()
	local bool_sd = false
	local tab_fef = {}
	local int_cuxy = 12
end

local function ___mu()
	local tab_is = {}
	local tab_jy = {}
	local str_co = "iozwot"
	local bool_ktl = false
end

local function ___iiuz()
	local bool_qtowr = false
	local tab_wxwgc = {}
	local _yv = nil
	local str_fq = "yqzl"
	local bool_aab = false
end

local function ___fdhnq()
	local tab_ljrvp = {}
	local bool_ssj = false
	local tab_jq = {}
	local str_rex = "uzmoh"
	local _km = nil
end

local function ___jnze()
	local str_kqs = "oxis"
	local _mip = nil
	local int_mufox = 80
	local _ej = nil
end
local BLNode 			= require("UI/CreatorUI/BLNode")

local Ad_Reward_Node = class("Ad_Reward_Node", BLNode)

function Ad_Reward_Node:ctor(pos, isPortrait)
    self.ctl      = AdRewardControl:getInstance()
    self.isPortrait = isPortrait
    self.csb        = "ui/ad_reward/ad_node"
    self.csbName    = "ad_node"
    self.node       = CreatorUITools:getInstance():createUi(self.csb .. (self.isPortrait and "_v" or ""));
    self:addChild(self.node)
    self:setPosition(pos or cc.p(0, 0))
    self:initButtonListToNode(false)
    self:loadControls()
end

function Ad_Reward_Node:listenEvent()
    self.ctl:listenEvent("updateAdProgress", self.csbName, function (type)
        if libUI.isValidNode(self) then
            self:setBoxPercentage()
        end
	end)
    self.ctl:listenEvent("updateBox", self.csbName, function (type)
        if libUI.isValidNode(self) then
            self:updateAdBox(type)
        end
	end)
end

function Ad_Reward_Node:cancelEvent( ... )
    self.ctl:cancelEvent(self.csbName)
end

function Ad_Reward_Node:loadControls()
    self:listenEvent()

    self.root = self.node.root

    self:initAdBox()
    self:setBoxPercentage()
end

-- 初始化宝箱
function Ad_Reward_Node:initAdBox()
    
    local curCount = self.ctl:getAdCurrentCount()
    local config   = self.ctl:getAdBoxRewardConfig()
    for key, value in pairs(config) do
        self:updateAdBox(key, true)
    end

end

-- 刷新宝箱
function Ad_Reward_Node:updateAdBox(type, isEvent)
    
    local box_node    = self.root.box_node
    local curCount    = self.ctl:getAdCurrentCount()
    local boxCount    = self.ctl:getAdBoxOpenCount(type)
    local isCollected = self.ctl:getAdBoxCollected(type)
    local adCoins     = self.ctl:getAdBoxRewardCoins(type)

    local boxName     = "box_" .. boxCount
    local bNode       = box_node[boxName]
    if libUI.isValidNode(bNode) then
        if isCollected then
            bNode.btn_reward:setVisible(false)
            bNode.box_spine:setAnimation(0, string.format("baoxiang%d_yilingqu", type), true)
        elseif curCount >= boxCount then
            bNode.btn_reward:setVisible(true)
            bNode.box_spine:setAnimation(0, string.format("baoxiang%d_kelingqu", type), true)
        else
            bNode.btn_reward:setVisible(false)
            bNode.box_spine:setAnimation(0, string.format("baoxiang%d_daiji", type), true)
        end
        if isEvent then
            local function onCollect()
                if libUI.isValidNode(self) and libUI.isValidNode(bNode.btn_reward)then
                    bNode.btn_reward:setTouchEnabled(false)
                    self:onCollectBoxReward(bNode.btn_reward, type, adCoins)
                end
            end
            self:addTouchEvent(bNode.btn_reward, onCollect)
        end

    end

end

-- 设置宝箱进度
function Ad_Reward_Node:setBoxPercentage()
    local curCount = self.ctl:getAdCurrentCount()
    local totalCount = self.ctl:getAdTotalCount()
    local ratio = curCount / totalCount * 100
    self.root.ad_progress:setPercentage(ratio)
end

-- 收集宝箱奖励
function Ad_Reward_Node:onCollectBoxReward(btn_reward, type, adCoins)
    local user  = User:getInstance()
    local pos   = bole.getWorldPos(btn_reward)
    local time  = 3.5
    if libUI.isValidNode(user.header) then
        time = HeaderFooterControl:getInstance():flyCoins(pos, user:getCoins(), adCoins)
        user:addCoins(adCoins, 1)
    end
    bole.playSounds("click")
    HttpManager:getInstance():doReport(ReportConfig.btn_collect_lobby)
    self.ctl:updateAdBoxCollectState(type)
end

-- 打开广告奖励弹窗
function Ad_Reward_Node:onBtnOpenClicked()
    bole.playSounds("click")
    PopupController:getInstance():popupDialogDirectly("ad_reward")
    HttpManager:getInstance():doReport(ReportConfig.btn_video_lobby)
end


return Ad_Reward_Node
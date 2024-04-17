local ___str_er = "blkgc"
local ____gj = nil
local ___int_bsbtn = 51
local ___str_bizk = "gpqjo"
local ___str_mtyab = "lhmz"
local ___bool_wqxpw = false
local ___int_uz = 91
local ___str_dkvr = "dab"
local ___int_ld = 93
local ___bool_xon = false
local ___int_rtyi = 96
local ___bool_kq = false
local ___bool_ases = false
local ___int_iog = 12
local ___int_rxcya = 31
local ____hri = nil
local ___tab_yovzx = {}
local ____rj = nil
local ___str_zzusp = "hfnarj"
local ___str_tv = "jvkw"
local ____uaxen = nil
local ____pcxr = nil
local ___bool_lxf = false
local ___tab_hg = {}
local ____cdbet = nil
local ___bool_atofv = false
local ___int_fy = 0
local ___int_wju = 12

local function ___zdt()
	local int_qoic = 64
	local tab_xhmcb = {}
	local bool_edh = false
	local str_gq = "ijaz"
end

local function ___fjb()
	local bool_rs = false
	local _guee = nil
	local str_zub = "txts"
end

local function ___opa()
	local int_iglds = 96
	local int_gocb = 56
	local str_dyi = "vmiee"
	local _vlh = nil
end

local function ___ceio()
	local str_iukve = "sxw"
	local tab_dbeq = {}
	local str_bs = "fcqd"
	local bool_pzac = false
end

local function ___or()
	local bool_etw = false
	local int_woekj = 47
	local bool_pk = false
end

local function ___ll()
	local int_lzjy = 56
	local str_hr = "cxbq"
	local str_jwd = "xqdq"
end

local function ___fq()
	local tab_kecw = {}
	local tab_tzis = {}
	local _vxq = nil
end

local function ___vokzz()
	local bool_ig = false
	local str_os = "scijqj"
	local bool_twld = false
	local bool_ubqhh = false
end

local function ___ny()
	local _owfit = nil
	local int_vxuc = 66
	local _bpnrx = nil
	local int_mkk = 26
	local tab_gl = {}
end

local function ___yqdn()
	local int_gt = 80
	local tab_tu = {}
	local tab_dvt = {}
	local tab_fx = {}
end

local function ___uqv()
	local str_od = "nmj"
	local _sntp = nil
	local int_uiyi = 83
end

local function ___vfiko()
	local int_avho = 71
	local str_hy = "cewlwb"
	local tab_isly = {}
	local tab_fs = {}
end

local function ___rmi()
	local int_jxn = 95
	local bool_sifh = false
	local bool_opvd = false
	local bool_ezjzu = false
	local str_kijp = "euy"
end

local function ___nm()
	local _iphhy = nil
	local tab_ebp = {}
	local _bzzul = nil
end

local function ___tr()
	local tab_osam = {}
	local _lmx = nil
	local bool_wwa = false
	local _psd = nil
end

local function ___kvbuy()
	local _yuboj = nil
	local _iusbm = nil
	local _lv = nil
	local bool_cg = false
	local str_okiyp = "wngy"
end

local function ___iq()
	local tab_eigl = {}
	local tab_ethri = {}
	local bool_rjqui = false
	local int_fwx = 92
end

local function ___pnts()
	local int_ye = 2
	local bool_btdcm = false
end
local Ad_Reward_Dialog = class("Ad_Reward_Dialog", CreatorNode)

function Ad_Reward_Dialog:ctor(data, callback)
    self.isPortrait = ScreenControl:getInstance().isPortrait
    self.ctl        = AdRewardControl:getInstance()
    self.adCoins    = self.ctl:getAdRewardCoins()
	self.csb        = "ui/ad_reward/ad_reward_pop"
    CreatorNode.ctor(self, self.csb)
    self:initButtonList(true)

    -- local function timercall()
    --     bole.playSounds("beng")
    --     cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.soundCallBack)  -- 清理活动倒计时的定时器
    -- end
    -- self.soundCallBack = cc.Director:getInstance():getScheduler():scheduleScriptFunc(timercall, 0.5, false)
end

function Ad_Reward_Dialog:loadControls()
    HttpManager:getInstance():doReport(ReportConfig.btn_video_lobby)
    local speed = 1 / 30

    self:setVisible(false)
    self:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(0.1),
            cc.CallFunc:create(function ( ... )
                self:setVisible(true)
                bole.popWin_4(self.root, nil, 0.36, 1)
                self:showMask(self.isPortrait, 0.2)
        end)
    ))

    --设置金币
    local label_coins = self.root.label_coins
    label_coins:setOpacity(0)
    label_coins:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(0.5),
            cc.FadeIn:create(15 * speed)
        )
    )
    label_coins:setString(self:formatCoin(self.adCoins))

    local btn_close = self.root.btn_close
    btn_close:setOpacity(0)
    btn_close:runAction(cc.Sequence:create(
        cc.DelayTime:create(25 * speed),
        cc.FadeIn:create(15 * speed)
    ))

    local btn_collect = self.root.btn_collect
    btn_collect:setOpacity(0)
    btn_collect:runAction(cc.Sequence:create(
        cc.DelayTime:create(25 * speed),
        cc.FadeIn:create(10 * speed)
    ))
end

function Ad_Reward_Dialog:show( ... )
    if self.isPortrait then
        self.node:setScale(SHRINKSCALE_H)
        self:setPosition(FRAME_HEIGHT/2,FRAME_WIDTH/2)
    else
        self.node:setScale(SHRINKSCALE_H)
        self:setPosition(FRAME_WIDTH/2,FRAME_HEIGHT/2)
    end

    self:showActions()
    bole.scene:addChild(self, 1000)
    self:showMask(self.isPortrait, 0)
end

function Ad_Reward_Dialog:hide()
    if self.isHiding then return end

    if self.callback then self.callback() end
    self:hideActions(true)
    bole.closeDialog(self, bole.popExitWin)
end


function Ad_Reward_Dialog:onBtnCollectClicked()
    bole.playSounds("click")
    HttpManager:getInstance():doReport(ReportConfig.btn_video_get_lobby)

    Admop:getInstance():openAd(function ()
        self:runAction(
            cc.Sequence:create(
                cc.DelayTime:create(0.1),
                cc.CallFunc:create(function ()
                    self.root.btn_close:setTouchEnabled(false)
                    self.root.btn_collect:setTouchEnabled(false)
                
                    local curCount = self.ctl:getAdCurrentCount()
                    self.ctl:updateAdCount(curCount + 1)
                
                    local user  = User:getInstance()
                    local pos   = bole.getWorldPos(self.root.btn_collect)
                    local time  = 3.5
                    if libUI.isValidNode(user.header) then
                        time = HeaderFooterControl:getInstance():flyCoins(pos, user:getCoins(), self.adCoins, self)
                        user:addCoins(self.adCoins, 1)
                    end
                
                    self:runAction(cc.Sequence:create(
                        cc.DelayTime:create(time),
                        cc.CallFunc:create(function ()
                            self.isClose = false
                            self:onBtnCloseClicked()
                        end)
                    ))
                end)
            )
        )
    end)
end

function Ad_Reward_Dialog:onBtnCloseClicked()
    if  self.isClose then
        bole.playSounds("click")
    end
    
    HttpManager:getInstance():doReport(ReportConfig.btn_video_close_lobby)
    self.root.label_coins:setVisible(false)
    self.root.btn_close:setVisible(false)
    self.root.btn_collect:setVisible(false)
    self:hide()
end

function Ad_Reward_Dialog:formatCoin(n)
    local last = ""
    if self.isAllowKB == true then
        if not ScreenControl:getInstance().isPortrait then
            if n > 999999999999999999999 then
                n = n / 1000000000
                n = math.floor(n)
                last = "B"
                return FONTS.format(n, true) .. last
            elseif n > 999999999999999999 then
                n = n / 1000000
                n = math.floor(n)
                last = "M"
                return FONTS.format(n, true) .. last
            elseif n > 999999999999999 then
                n = n / 1000
                n = math.floor(n)
                last = "K"
                return FONTS.format(n, true) .. last
            end
        else
            return FONTS.format(n, true) .. last
        end
    end 

    return FONTS.format(n, true)
end

return Ad_Reward_Dialog
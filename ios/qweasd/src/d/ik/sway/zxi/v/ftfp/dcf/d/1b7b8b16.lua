local ____ch = nil
local ___str_tg = "oxd"
local ___bool_zfvs = false
local ___str_mms = "npddf"
local ___tab_dpgh = {}
local ___str_uu = "fitxd"
local ____vqftj = nil
local ___tab_sal = {}
local ___bool_kf = false
local ___str_iwsmu = "qjlvb"
local ___str_xetos = "uzxht"
local ___tab_jkahe = {}
local ___bool_bqiyz = false

local function ___lsr()
	local tab_emyg = {}
	local bool_ssxyc = false
	local tab_iorl = {}
	local _ptq = nil
	local bool_kbbk = false
end

local function ___psnd()
	local tab_uczls = {}
	local _gecr = nil
	local tab_kahf = {}
end

local function ___dm()
	local bool_jedsx = false
	local str_qzv = "nfn"
	local tab_bklb = {}
	local str_cct = "obmruu"
	local int_otva = 7
end

local function ___mr()
	local int_junc = 88
	local tab_mii = {}
	local int_jejyh = 40
	local str_wh = "moy"
end

local function ___apjoh()
	local tab_dpc = {}
	local bool_uyqh = false
	local str_sczlv = "xsazza"
	local int_rkmz = 67
	local str_ufolu = "uyhd"
end

local function ___foax()
	local _wm = nil
	local bool_zxa = false
end

local function ___jjbj()
	local _aa = nil
	local str_fe = "qdi"
	local _mqq = nil
	local _ei = nil
	local tab_oe = {}
end

local function ___he()
	local _gf = nil
	local tab_jvjye = {}
	local str_okeqc = "dticc"
	local int_mlhps = 74
	local str_mxbkr = "hgey"
end

local function ___uxv()
	local tab_hkrhl = {}
	local _wdh = nil
	local tab_rlir = {}
end

local function ___zrueh()
	local _ffanp = nil
	local int_ipaus = 40
	local bool_jy = false
end

local function ___xacu()
	local _xf = nil
	local _dxr = nil
end

local function ___ftbp()
	local int_bs = 43
	local tab_qyyrh = {}
end

local function ___iqf()
	local tab_dd = {}
	local bool_rtpn = false
	local int_shw = 10
	local tab_hk = {}
end

local function ___pg()
	local str_cmt = "gne"
	local _uuol = nil
	local _zuyyq = nil
	local bool_kvrub = false
end

local function ___rxbir()
	local bool_bsnb = false
	local _fubyo = nil
	local int_gxfi = 8
	local bool_dkla = false
end

local function ___uh()
	local int_ge = 33
	local tab_tx = {}
	local _bv = nil
end

local function ___xzsr()
	local _kji = nil
	local int_pv = 65
	local str_ongi = "kwf"
	local bool_ok = false
	local tab_cp = {}
end

local function ___rndpb()
	local str_nk = "cbu"
	local tab_je = {}
	local str_jdi = "gllpwj"
end

local function ___jbfb()
	local tab_hcp = {}
	local int_jgt = 22
end

local function ___xyqbd()
	local tab_bintp = {}
	local str_cm = "ovm"
	local int_nio = 62
	local _xq = nil
	local str_opjvi = "yulemc"
end

local function ___ov()
	local tab_wcrso = {}
	local _szr = nil
	local str_nxc = "txlhg"
	local str_osw = "tgt"
	local _mjo = nil
end

local function ___uxz()
	local _ctxrc = nil
	local int_rjkk = 84
end

local function ___leuo()
	local _jovmd = nil
	local _nlopr = nil
	local bool_vlb = false
	local tab_trbok = {}
end

local function ___axwkp()
	local tab_lol = {}
	local str_uuviv = "fxhys"
end

local function ___qwtfe()
	local str_fd = "tzmch"
	local _eue = nil
	local _lutb = nil
	local bool_zkmz = false
end

local function ___kex()
	local _eqpbm = nil
	local bool_ndfd = false
	local int_cb = 36
	local _jbigi = nil
end

local function ___ngtuq()
	local str_sgcg = "gcfhmt"
	local _awtib = nil
	local str_basv = "dcp"
end

local function ___sppx()
	local int_kaj = 35
	local bool_qk = false
end

local function ___feeb()
	local bool_ikgxh = false
	local _vwy = nil
	local bool_acuj = false
end

local function ___glfdp()
	local bool_kibed = false
	local bool_yj = false
	local str_be = "yczs"
end
local Ad_Reward_Dialog = class("Ad_Reward_Dialog", CreatorNode)

function Ad_Reward_Dialog:ctor(data, callback)
    self.isPortrait = ScreenControl:getInstance().isPortrait
    self.ctl        = AdRewardControl:getInstance()
    self.adCoins    = self.ctl:getFreeCoins()
	self.csb        = "ui/free_coins/freecoins_pop"
    self.waitTime   = 3600
    CreatorNode.ctor(self, self.csb )
    self:initButtonList(true)

    -- local function timercall()
    --     bole.playSounds("beng")
    --     cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.soundCallBack)  -- 清理活动倒计时的定时器
    -- end
    -- self.soundCallBack = cc.Director:getInstance():getScheduler():scheduleScriptFunc(timercall, 0.5, false)
end


function Ad_Reward_Dialog:showAnim()
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
    local label_coins = self.root.label_coins
    label_coins:setOpacity(0)
    label_coins:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(0.5),
            cc.FadeIn:create(15 * speed)
        )
    )

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


function Ad_Reward_Dialog:loadControls()
    HttpManager:getInstance():doReport(ReportConfig.freecoins_open)

    self.root = self.node.root
    self:showAnim()
    self.isClose = true
    local closeBtn = self.root.btn_close;
    local label_coins = self.root.label_coins
    label_coins:setString(FONTS.format(self.adCoins, true))


    local gettime = User:getInstance():getFreeCoinsTime()
    if gettime == 0 then        --可以领取
        self.root.des_seconds:setVisible(false);
        self.root.label_seconds:setVisible(false);
        self.root.btn_collect:setTouchEnabled(true)
        self.root.btn_collect:setColor(cc.c3b(255,255,255))
    else
        local  nowtime = os.time();
        local seconds = nowtime - gettime;
        if seconds >=  self.waitTime then      --超过时间 ，可以领取   3385
            self.root.des_seconds:setVisible(false);
            self.root.label_seconds:setVisible(false);
            self.root.btn_collect:setTouchEnabled(true)
            self.root.btn_collect:setColor(cc.c3b(255,255,255))
            User:getInstance():setFreeCoinsTime(0)
        else                        -- 冷却时间
            self.root.btn_collect:setColor(cc.c3b(123,123,123))
            self.root.btn_collect:setTouchEnabled(false)
            self.root.des_seconds:setVisible(true);
            self.root.label_seconds:setVisible(true);
            local residueTime =  self.waitTime - seconds
            self.residueTime = residueTime
            self.root.label_seconds:setString(self.residueTime);

            local function timercall()
                self.residueTime = self.residueTime - 1
                self.root.label_seconds:setString(self.residueTime);
                if self.residueTime <= 0 then       --时间到
                    self.root.des_seconds:setVisible(false);
                    self.root.label_seconds:setVisible(false);
                    self.root.btn_collect:setTouchEnabled(true)
                    User:getInstance():setFreeCoinsTime(0)
                    self.root.btn_collect:setColor(cc.c3b(255,255,255))
                    cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.soundCallBack)  -- 清理活动倒计时的定时器
                end
            end
            self.soundCallBack = cc.Director:getInstance():getScheduler():scheduleScriptFunc(timercall, 1, false)
        end
    end
 
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
    HttpManager:getInstance():doReport(ReportConfig.freecoins_get)

    self.root.btn_close:setTouchEnabled(false)
    self.root.btn_collect:setTouchEnabled(false)

    local user  = User:getInstance()
    local pos   = bole.getWorldPos(self.root.btn_collect)
    local time  = 3.5
    if libUI.isValidNode(user.header) then
        User:getInstance():setFreeCoinsTime(os.time())
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

end

function Ad_Reward_Dialog:onBtnCloseClicked()
    if  self.isClose then
        bole.playSounds("click")
    end
    if self.soundCallBack then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.soundCallBack)  -- 清理活动倒计时的定时器
    end
    HttpManager:getInstance():doReport(ReportConfig.freecoins_close)
    self:hide()
   
end
return Ad_Reward_Dialog
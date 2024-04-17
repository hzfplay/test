local ___tab_yp = {}
local ___bool_znlzc = false
local ___int_imu = 16
local ___int_sbme = 0
local ___str_zkf = "feiz"
local ___int_nzphz = 74
local ___bool_gfvzo = false
local ___int_wkp = 21
local ___tab_ywl = {}
local ___tab_zio = {}
local ___tab_wdcmu = {}
local ___bool_bgv = false
local ___int_mqoro = 73
local ____yyg = nil
local ___int_vd = 94
local ___int_qqk = 56
local ___tab_fnua = {}
local ___tab_wceq = {}
local ___bool_ux = false
local ____vedpy = nil

local function ___sjapd()
	local str_lj = "lwgu"
	local bool_xzru = false
end

local function ___dl()
	local tab_vbf = {}
	local str_ueyb = "weqzcl"
	local int_tbeg = 62
	local _xg = nil
end

local function ___fyaa()
	local bool_xnn = false
	local str_fphk = "jihz"
	local int_eobkb = 21
end

local function ___sg()
	local bool_zd = false
	local bool_qgi = false
	local str_lzfjl = "wjrik"
	local str_tcy = "isorw"
	local str_dqc = "zmqk"
end

local function ___ctn()
	local bool_cqlz = false
	local _ee = nil
	local bool_srxdm = false
	local _ahsaw = nil
end

local function ___ktr()
	local _da = nil
	local bool_zgtmd = false
	local bool_ofhj = false
	local str_ebdou = "ker"
end

local function ___uol()
	local _lpwni = nil
	local str_qlk = "chh"
	local bool_kbcc = false
	local str_mnfld = "glj"
end

local function ___afpv()
	local tab_yp = {}
	local _bfbhc = nil
	local str_lkat = "caa"
end

local function ___lvvza()
	local int_fpsf = 89
	local bool_ajz = false
	local int_vnt = 40
	local int_atj = 1
	local bool_am = false
end

local function ___spdvg()
	local int_jogys = 40
	local int_cn = 25
	local int_ewx = 13
end

local function ___fxse()
	local str_jr = "dlu"
	local int_iaemt = 68
end

local function ___rfi()
	local str_ofe = "uxy"
	local bool_zjspp = false
	local str_jhu = "hdubco"
end

local function ___nmtzt()
	local str_oi = "vvsvtr"
	local int_jrm = 68
	local int_ka = 70
end

local function getPic(name)
    return "loading/"..name
end

------------------ login view btn Node ----------------------
LoginViewBtnNode = class("LoginViewBtnNode", function ( ... ) return cc.Node:create() end)

function LoginViewBtnNode:ctor()
    self.isChinese = LanguageController:getInstance():getLanguageKey() == "Chinese"

    self.isNewUser = false
    if UserGuideControl:getInstance() and UserGuideControl:getInstance():getFreeCoins() > 0 then
        self.isNewUser = true
    end

    LoginControl:getInstance():onShowUserLoginButton()
    local function onFacebookConnect(sender,eventType)
        -- if eventType == ccui.TouchEventType.began then
        --     bole.playMusic("03_layer_open")
        -- else
        if eventType == ccui.TouchEventType.ended then
            bole.playMusic("03_layer_open")
            local function connected( ... )
                LoginControl:getInstance():facebookLoggedIn()
            end 
            LoginControl:getInstance():onFacebookClick()
            Facebook:getInstance():login(connected)
        end
    end

    local function  onHuaweiLogin( sender,eventType )
        -- if eventType == ccui.TouchEventType.began then
        --     bole.playMusic("03_layer_open")
        -- else
        if eventType == ccui.TouchEventType.ended then
            bole.playMusic("03_layer_open")
            local function connected( ... )
                LoginControl:getInstance():hmsLoggedIn()
            end 
            LoginControl:getInstance():onHuaiweiClick()
            HMS:getInstance():login(connected)
        end
    end

    local function onAppleLogin( sender,eventType )
        -- if eventType == ccui.TouchEventType.began then
        --     bole.playMusic("03_layer_open")
        -- else
        if eventType == ccui.TouchEventType.ended then
            bole.playMusic("03_layer_open")
            local function connected( ... )
                LoginControl:getInstance():AppleLoggedIn()
            end 
            LoginControl:getInstance():onAppleClick()
            PluginCommon:getInstance():signWithApple(connected)
        end
    end

    local function  onGuestLogin( sender,eventType )
        -- if eventType == ccui.TouchEventType.began then
        --     bole.playMusic("03_layer_open")
        -- else
        if eventType == ccui.TouchEventType.ended then
            bole.playMusic("03_layer_open")
            LoginControl:getInstance():onGuestClick()
            LoginControl:getInstance():rejectFacebookLogin()
            sender:setTouchEnabled(false)

            libMM.setIntegerForKey("UserGuide_login", math.floor(bole.getServerTime() / 1000))
        end
    end

    local function  onNewUserLogin( sender,eventType )
        -- if eventType == ccui.TouchEventType.began then
        --     bole.playMusic("03_layer_open")
        -- else
        if eventType == ccui.TouchEventType.ended then
            bole.playMusic("03_layer_open")
            LoginControl:getInstance():onNewUserClick()
            LoginControl:getInstance():rejectFacebookLogin()
            sender:setTouchEnabled(false)

            libMM.setIntegerForKey("UserGuide_login", math.floor(bole.getServerTime() / 1000))
        end
    end

    self.loginNode = cc.Node:create()
    self:addChild(self.loginNode)

    local tips = cc.Sprite:create(getPic("facebook_tips.png"))
    if tips then
        tips:setName("facebook_tips")
        tips:setPositionY(-329)
        tips:setPositionX(self.isChinese and 0 or 10)
        self.loginNode:addChild(tips)

        local function privacyFunc(sender, eventType)
            if eventType == ccui.TouchEventType.began then
                bole.playMusic("03_layer_open")
            elseif eventType == ccui.TouchEventType.ended then
                LoginControl:getInstance():openPrivacyPolicyUrl()
            end
        end
        local btn_privacy = self:newButton(getPic("loading_btn13.png"), getPic("loading_btn14.png"))
        btn_privacy:setName("btn_privacy")
        btn_privacy:setPosition(self.isChinese and cc.p(131, -330) or cc.p(270, -341))
        self.loginNode:addChild(btn_privacy)
        btn_privacy:setTouchEnabled(true)
        btn_privacy:addTouchEventListener(privacyFunc)

        local function serviceFunc(sender, eventType)
            if eventType == ccui.TouchEventType.began then
                bole.playMusic("03_layer_open")
            elseif eventType == ccui.TouchEventType.ended then
                LoginControl:getInstance():openTermsOfServiceUrl()
            end
        end
        local btn_service = self:newButton(getPic("loading_btn11.png"), getPic("loading_btn12.png"))
        btn_service:setName("btn_service")
        btn_service:setPosition(self.isChinese and cc.p(364, -330) or cc.p(-245, -341))
        self.loginNode:addChild(btn_service)
        btn_service:setTouchEnabled(true)
        btn_service:addTouchEventListener(serviceFunc)
        
    end

    -- 是否是审核模式
    -- if IS_CHECK then
    --     -- self.processNode:setVisible(false)

    --     local pos = cc.p(0, -265)9+
    --     self.btn = self:newButton(getPic("login_new_user_btn1.png"), getPic("login_new_user_btn2.png"))
    --     self.loginNode:addChild(self.btn)
    --     self.btn:setPosition(pos)
    --     self.btn:addTouchEventListener(onGuestLogin)
    --     return
    -- end

    local fb_login_before = Facebook:getInstance():hasLoginBefore() 

    local fb_path = (fb_login_before and "loadbt_facebook_ng" or "loadbt_facebook")

    local btn_posy = -263
    local fb_position = cc.p(50, btn_posy)
    if Config.platform == "android" or Config.platform == "amazon" then
        fb_position = cc.p(-135, btn_posy)
    end
    self.fbButton = self:newButton(getPic(fb_path .. ".png"),getPic(fb_path .. "02.png"))
    self.loginNode:addChild(self.fbButton)
    self.fbButton:setPosition(fb_position)
    self.fbButton:setTouchEnabled(true)
    self.fbButton:addTouchEventListener(onFacebookConnect)
    self.fbButton:setVisible(not self.isNewUser)

    local later_position = cc.p(325, btn_posy)
    if Config.platform == "android" or Config.platform == "amazon" then
        later_position = cc.p(168, btn_posy)
    end
    self.guestButton = self:newButton(getPic("loadbt_denglu.png"),getPic("loadbt_denglu02.png"))
    self.loginNode:addChild(self.guestButton)
    self.guestButton:setPosition(later_position)
    self.guestButton:addTouchEventListener(onGuestLogin)
    self.guestButton:setVisible(not self.isNewUser)

    if Config.platform == "huawei" and not self.isNewUser then
        self.huaweiButton = self:newButton(getPic("loadbt_huawei.png"),getPic("loadbt_huawei02.png"))
        self.loginNode:addChild(self.huaweiButton)
        self.huaweiButton:setPosition(-275, btn_posy)
        self.huaweiButton:addTouchEventListener(onHuaweiLogin)
    end

    if PluginCommon:getInstance():isAppleLoginAvailable() and not self.isNewUser then
        self.appleButton = self:newButton(getPic("loading_apple_btn01.png"),getPic("loading_apple_btn02.png"))
        self.loginNode:addChild(self.appleButton)
        self.appleButton:setPosition(-300, btn_posy)
        self.appleButton:addTouchEventListener(onAppleLogin)
    end

    if self.isNewUser then
        self.newUserButton = self:newButton(getPic("login_new_user_btn1.png"), getPic("login_new_user_btn2.png"))
        self.loginNode:addChild(self.newUserButton)
        self.newUserButton:setPosition(0, btn_posy + 5)
        self.newUserButton:addTouchEventListener(onNewUserLogin)

        local layer = cc.LayerColor:create( cc.c4b(0, 0, 0, 0))
        self.loginNode:addChild(layer, 1000)
        local listener = cc.EventListenerTouchOneByOne:create()
        listener:registerScriptHandler(function(touch, event)
            local location = touch:getLocation()
            -- print("zhf location ",location.x,location.y, User:getInstance().user_id)
            bole.send_codeInfo(Splunk_Type.ACTION, {current = "touch",position="loadind", pX = location.x, pY = location.y}, false)
            return false
        end,cc.Handler.EVENT_TOUCH_BEGAN)
        self.loginNode:getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, layer)
    end
end

function LoginViewBtnNode:newButton(img1, img2, img3 )
    local button = ccui.Button:create()
    button:setContentSize(1000,3000)
    img2 = img2 or ""
    img3 = img3 or ""
    button:loadTextures(img1,img2, img3)
    return button
end
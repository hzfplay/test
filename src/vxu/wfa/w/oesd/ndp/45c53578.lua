local ___bool_zae = false
local ____ncin = nil
local ___bool_as = false
local ___tab_mdu = {}
local ___tab_kxc = {}
local ___int_emey = 8
local ___str_hj = "geute"
local ___tab_gqbyz = {}
local ____vq = nil
local ___tab_rihwf = {}
local ___bool_rlugs = false
local ___str_hewro = "dufcb"
local ___str_hori = "saqm"
local ___tab_xhdub = {}
local ___int_uyuk = 6
local ___bool_mh = false
local ___tab_ui = {}
local ____le = nil
local ___tab_ymgn = {}
local ___bool_paspq = false
local ___str_hb = "qsyke"
local ___str_bih = "fomed"
local ____jwahn = nil
local ___tab_ww = {}

local function ___dsbue()
	local bool_hnm = false
	local tab_iydmx = {}
	local tab_tz = {}
end

local function ___ptp()
	local _unyl = nil
	local bool_dtti = false
	local tab_uud = {}
	local bool_bgt = false
end

local function ___vi()
	local tab_xfi = {}
	local bool_wqxe = false
end

local function ___ykguk()
	local bool_hk = false
	local int_rbzfo = 19
	local int_dlzav = 43
	local int_lmu = 37
end

local function ___thyub()
	local str_kah = "oowxxo"
	local bool_pnvh = false
	local int_spa = 63
	local _azw = nil
	local bool_ldab = false
end

local function ___ohjdh()
	local str_rzrhn = "ihei"
	local _eam = nil
	local tab_nj = {}
	local tab_sqg = {}
end

local function ___pcabx()
	local str_xdw = "oalv"
	local int_uvez = 98
	local tab_nh = {}
	local bool_kf = false
end

local function ___ttzb()
	local bool_dfv = false
	local bool_oxr = false
	local _bdpfx = nil
	local _rrzcf = nil
	local _gnt = nil
end

local function ___thslz()
	local str_tcpt = "lmz"
	local str_ahtsi = "kfz"
	local tab_nc = {}
	local tab_sg = {}
	local bool_dohm = false
end

local function ___toby()
	local tab_npmw = {}
	local str_srdj = "zsco"
	local tab_hroz = {}
	local str_enxl = "vbfg"
	local _nfk = nil
end

local function ___zqxnw()
	local bool_ebj = false
	local _lw = nil
end
local BLNode 			= require("UI/CreatorUI/BLNode")

local Login_View = class("Login_View", BLNode)

function Login_View:ctor()
    self.csb        = "ui/login/login_view"
    self.csbName    = "login_view"
    self.node       = CreatorUITools:getInstance():createUi(self.csb);
    self:addChild(self.node)
    self:initButtonListToNode(false)
    self:loadControls()
end

function Login_View:loadControls()
    self.root = self.node.root
    local login_bg =  self.root.login_bg
    local login_man =  self.root.login_man
    local btn_play = self.root.btn_play
    local btn_google = self.root.btn_google
    local mist = self.root.mist
    -- local cloud = self.root.cloud
    local star = self.root.star
    star:setVisible(false)
    -- cloud:setOpacity(0)
    mist:setVisible(false)
    login_man:setVisible(false)
    btn_play:setVisible(false)
    btn_google:setVisible(false)
    login_bg:setScale(1.2)
    local sequence = cc.Sequence:create(
        cc.ScaleTo:create(1,2.5),cc.ScaleTo:create(0.5,1),
    cc.CallFunc:create(function ()
        -- mist:setVisible(true)
        star:setVisible(true)
        mist:setOpacity(0)
        -- mist:runAction(   cc.FadeIn:create(1))
        login_man:setVisible(true)
        login_man:setScale(0)
        local sequenceMan = cc.Sequence:create(cc.ScaleTo:create(0.23,1.2),cc.ScaleTo:create(0.1,1),cc.CallFunc:create(function ()
            btn_play:setVisible(true)
            btn_play:setScale(0)
            local sequenceBtn = cc.Sequence:create(
                cc.ScaleTo:create(0.2,1),
                cc.CallFunc:create(function ()
                    local forever =  cc.RepeatForever:create( cc.Sequence:create(
                        cc.ScaleTo:create(0.7,0.9),cc.ScaleTo:create(0.7,1)
                    ))
                    btn_play:runAction(forever)
                end)
            )
            btn_play:runAction(sequenceBtn)

            ---------------------------------------------
            -- btn_google:setVisible(true)
            -- btn_google:setScale(0)
            -- local sequence_btn_google = cc.Sequence:create(
            --     cc.ScaleTo:create(0.2,1),
            --     cc.CallFunc:create(function ()
            --         local forever =  cc.RepeatForever:create( cc.Sequence:create(
            --             cc.ScaleTo:create(0.7,0.9),cc.ScaleTo:create(0.7,1)
            --         ))
            --         btn_google:runAction(forever)
            --     end)
            -- )
            -- btn_google:runAction(sequence_btn_google)
        end))
        -- cloud:runAction(cc.FadeIn:create(0.33))
        login_man:runAction(sequenceMan)
    end))
    login_bg:runAction(sequence)

end
 

function Login_View:onBtnPlayClicked()
    Admop:getInstance():setCallback()
    local btn_play = self.root.btn_play
    local star = self.root.star
    -- local btn_google = self.root.btn_google
    btn_play:setTouchEnabled(false)
    btn_play:stopAllActions()
    -- btn_google:setTouchEnabled(false)
    star:setVisible(false)
    -- btn_google:stopAllActions()
    bole.playSounds("click")
    
    local login_man =  self.root.login_man
    local seq_man = cc.Sequence:create(cc.ScaleTo:create(0.1,1.1), cc.Spawn:create( cc.ScaleTo:create(0.3,0), cc.FadeOut:create(0.2)), cc.CallFunc:create(function () 
        login_man:setVisible(false)

        local login_bg =  self.root.login_bg
        login_bg:runAction(
            cc.ScaleTo:create(0.5,1.3) 
        )
    end))

    login_man:runAction(
        seq_man
    )

    -- local cloud = self.root.cloud
    -- cloud:runAction(
    --    cc.FadeOut:create(0.3)
    -- )
 
 
    local seq = cc.Sequence:create(cc.ScaleTo:create(0.1,1.1), cc.Spawn:create( cc.ScaleTo:create(0.3,0), cc.FadeOut:create(0.2)),cc.DelayTime:create(0.5),
    cc.CallFunc:create(function ()
        if btn_play then
            btn_play:setVisible(false)
        end
        HttpManager:getInstance():doReport(ReportConfig.btn_login)
        local Lobby_Scene = require (bole.getDesktopScenePath("Lobby"))
        local scene = Lobby_Scene.new()
        scene:run()
    end))
    
    btn_play:runAction(seq)

    -- local seq2 = cc.Sequence:create(cc.ScaleTo:create(0.1,1.1), cc.Spawn:create( cc.ScaleTo:create(0.3,0), cc.FadeOut:create(0.2)),cc.DelayTime:create(0.5),
    -- cc.CallFunc:create(function ()
    --     if btn_google then
    --         btn_google:setVisible(false)
    --     end
    -- end))
    -- btn_google:runAction(seq2)

end


function Login_View:onBtnGoogleClicked()
    print("点击登录")
    GoogleSignIn:getInstance():login()
end



return Login_View
local ___bool_nwq = false
local ___int_tr = 71
local ____qldy = nil
local ___bool_ybbn = false
local ___tab_nl = {}
local ____fnyx = nil
local ___bool_na = false
local ___bool_awhob = false
local ___int_ii = 65
local ____cd = nil
local ___int_bn = 18
local ___bool_kq = false
local ___int_eix = 48
local ___str_muib = "jpiy"
local ___int_oc = 85
local ____bqaj = nil
local ____tzbqs = nil
local ___int_zp = 63
local ___str_fhilk = "wcsc"
local ___bool_cg = false
local ___int_yue = 11
local ____xir = nil
local ____nmrm = nil
local ____kp = nil
local ___str_tel = "hqeu"
local ___tab_edjei = {}
local ___int_dv = 81
local ___tab_wjauw = {}
local ____hvz = nil

local function ___bkd()
	local bool_rzdym = false
	local bool_vd = false
end

local function ___kenyl()
	local bool_xien = false
	local str_fc = "lhc"
	local bool_yao = false
	local bool_sisrv = false
end

local function ___uxcsf()
	local _qd = nil
	local _pnsh = nil
	local tab_zf = {}
	local _as = nil
end

local function ___fkopv()
	local _om = nil
	local int_xwdbr = 30
	local tab_sty = {}
	local str_ldyg = "wmab"
end

local function ___pupd()
	local _ndr = nil
	local str_ugy = "ykgmd"
end

local function ___qnfh()
	local int_hkjv = 4
	local int_uekqy = 76
	local str_tb = "ejxk"
	local bool_he = false
end

local function ___jrtia()
	local bool_hqig = false
	local tab_dehs = {}
	local tab_mifv = {}
	local int_eevnh = 82
	local tab_krti = {}
end

local function ___tmuz()
	local tab_lewz = {}
	local int_oncxa = 100
end

local function ___rau()
	local bool_tncpk = false
	local bool_wfgv = false
	local int_qwce = 6
	local bool_fal = false
end

local function ___ig()
	local int_aziim = 11
	local str_biema = "nmvy"
	local int_bbd = 16
	local tab_rtq = {}
	local int_xp = 61
end

local function ___futtj()
	local bool_dvs = false
	local bool_izqk = false
	local str_rzak = "ach"
	local _fx = nil
	local int_sik = 82
end

local function ___tshl()
	local str_ytz = "lpzug"
	local tab_fkk = {}
	local tab_mvhr = {}
	local str_ca = "byjk"
	local bool_go = false
end

local function ___waugj()
	local tab_crbtr = {}
	local str_xhoa = "nusel"
	local str_pwz = "akn"
	local tab_bb = {}
	local int_zteuw = 14
end

local function ___gfcl()
	local tab_gmgzc = {}
	local str_aa = "oezj"
	local tab_ernaq = {}
end

local function ___jm()
	local int_pqs = 73
	local bool_qh = false
end

local function ___aprti()
	local _acy = nil
	local int_zipp = 21
	local tab_lle = {}
	local tab_bkir = {}
end
local Setting_Dialog = class("Setting_Dialog", CreatorNode)

function Setting_Dialog:ctor(data, callback)
    self.data       = data or {}
    self.initPos    = data.pos or cc.p(311, 585)
    self.isPortrait = ScreenControl:getInstance().isPortrait
    self.ctl        = SettingControl:getInstance()
	self.csb        = "ui/setting/setting_pop"
    CreatorNode.ctor(self, self.csb .. (bole.isThemeScene() and "_v" or ""))
    self:initButtonList(true)

    if self.isPortrait then
        HttpManager:getInstance():doReport(ReportConfig.btn_setting_game)
    else
        HttpManager:getInstance():doReport(ReportConfig.btn_setting_lobby)
    end

end

function Setting_Dialog:loadControls()
    self.root = self.node.root
    
    self:updateContrlNode("music")
    self:updateContrlNode("sound")

    if bole.isThemeScene() then
        self:showThemeSetting()
    end
end

function Setting_Dialog:show(delay)
    delay = delay or 0.5

    -- if self.isPortrait then
    --     self.node:setScale(SHRINKSCALE_V)
    --     self:setPosition(FRAME_WIDTH/2,FRAME_HEIGHT/2)
    -- else
    --     self.node:setScale(SHRINKSCALE_H)
    --     self:setPosition(FRAME_WIDTH/2,FRAME_HEIGHT/2)
    -- end


    if self.isPortrait then
        self.node:setScale(SHRINKSCALE_H)
        self:setPosition(FRAME_HEIGHT/2,FRAME_WIDTH/2)
    else
        self.node:setScale(SHRINKSCALE_H)
        self:setPosition(FRAME_WIDTH/2,FRAME_HEIGHT/2)
    end
    
    -- self:showActions()
    bole.scene:addChild(self, 1000)

    if bole.isThemeScene() then
        self.mask_to_opa = 0
        self:showMask(self.isPortrait, 0.2)
    else
        self:setVisible(false)
        self:runAction(
            cc.Sequence:create(
                cc.DelayTime:create(delay),
                cc.CallFunc:create(function ( ... )
                    self:setVisible(true)
                    bole.popWin_4(self.root, nil, 0.36, 1)
                    self:showMask(self.isPortrait, 0.2)
            end)
        ))
    end

end

function Setting_Dialog:hide()
    if self.isHiding then return end

    if self.callback then self.callback() end
    self:hideActions(true)
	bole.closeDialog(self, bole.popExitWin)
end

-- 刷新状态
function Setting_Dialog:updateContrlNode(type, state)
    
    local contrl_node = self.root.contrl_node
    if not contrl_node then return end

    local isOpen = true
    if state then
        isOpen = state == 0
        if type == "music" then
            self.ctl:updateMusicOpen(state)
            if self.ctl:isMusicOpen() then
                SettingControl:getInstance():setSettingStatus("music",  1)
            else
                SettingControl:getInstance():setSettingStatus("music",  0)
            end
             
        else
            self.ctl:updateSoundOpen(state)
            if self.ctl:isSoundOpen() then
                SettingControl:getInstance():setSettingStatus("sound", 1 )
            else
                SettingControl:getInstance():setSettingStatus("sound", 0)
            end
            
        end
    else
        if type == "music" then
            isOpen = self.ctl:isMusicOpen()
        else
            isOpen = self.ctl:isSoundOpen()
        end
    end

    local node = contrl_node[type.."_node"]
    bole.updateSpriteWithFile(node.bg, isOpen and "#switch_on.png" or "#switch_off.png")

    local btn  = node["btn_"..type]
    btn:setTouchEnabled(false)

    local move = node.move
    -- move:setPositionX(isOpen and 213.5 or 100)
    move:stopAllActions()
    move:runAction(
        cc.Sequence:create(
            cc.MoveTo:create(0.3, cc.p(isOpen and 213.5 or 100, move:getPositionY())),
            cc.CallFunc:create(function()
                btn:setTouchEnabled(true)
            end)
        )
    )

end


function Setting_Dialog:showThemeSetting()
	local contrl_node = self.root.contrl_node
	if contrl_node then
        local pos = bole.getNodePos(contrl_node, self.initPos)
		contrl_node:setVisible(true)
		contrl_node:stopAllActions()
		contrl_node:setOpacity(0)
		contrl_node:setScale(0)
        contrl_node:setPosition(cc.p(pos.x  - 120, pos.y  - 130 ))
		contrl_node:runAction(cc.Spawn:create(cc.FadeIn:create(0.2), cc.ScaleTo:create(0.2, 1)))
	end
end

function Setting_Dialog:hideThemeSetting()
	local contrl_node = self.root.contrl_node
	if contrl_node then
		contrl_node:setVisible(true)
		contrl_node:stopAllActions()
		contrl_node:setOpacity(255)
		contrl_node:setScale(1)
		contrl_node:runAction(        
            cc.Sequence:create(	
                cc.Spawn:create(cc.FadeOut:create(0.2), cc.ScaleTo:create(0.2, 0)),
                cc.CallFunc:create(function ()
                    self:hide()
                end)
            )
        )
	end
end


function Setting_Dialog:onBtnMusicClicked()
    self:updateContrlNode("music", self.ctl:isMusicOpen() and 1 or 0)
    bole.playSounds("click")
    HttpManager:getInstance():doReport(ReportConfig.btn_change_music_setting)
end

function Setting_Dialog:onBtnSoundClicked()
    self:updateContrlNode("sound", self.ctl:isSoundOpen() and 1 or 0)
    bole.playSounds("click")
    HttpManager:getInstance():doReport(ReportConfig.btn_change_sound_setting)
end

function Setting_Dialog:onBtnGameruleClicked()
    self:hide()
    local user = User:getInstance()
    if user.header and user.header.themeCtl then
        local themeCtl = user.header.themeCtl
        PopupController:getInstance():popupDialogDirectly("game_rules", {controller = themeCtl}, nil)
        HttpManager:getInstance():doReport(ReportConfig.btn_rule_play)
    end
end

function Setting_Dialog:onBtnCloseClicked()
    bole.playSounds("click")
    self.root.btn_close:setTouchEnabled(false)
    if self.isPortrait then
        self:hideThemeSetting()
    else
        self:hide()
    end
    HttpManager:getInstance():doReport(ReportConfig.btn_close_setting)
end


-- 服务条款
function Setting_Dialog:onBtnServiceClicked()
    bole.playSounds("click")
    local url = "https://sites.google.com/view/goldexplorertermsofservice/%E9%A6%96%E9%A1%B5"
	cc.Application:getInstance():openURL(url)
    HttpManager:getInstance():doReport(ReportConfig.btn_service_setting)
end

-- 隐私协议
function Setting_Dialog:onBtnPrivacyClicked()
    bole.playSounds("click")
    local url = "https://sites.google.com/view/gold-explorer-privacy-policy/%E9%A6%96%E9%A1%B5"
	cc.Application:getInstance():openURL(url)
    HttpManager:getInstance():doReport(ReportConfig.btn_privacy_setting)
end


return Setting_Dialog
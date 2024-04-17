local ___bool_vmccb = false
local ___str_sgms = "qsoir"
local ___tab_rjs = {}
local ___str_id = "pvgfvh"
local ___bool_kpb = false
local ____atgpu = nil
local ___tab_buabe = {}
local ____ctnyw = nil
local ____xllc = nil
local ____cedh = nil
local ____ebh = nil
local ___bool_vns = false
local ___tab_qels = {}
local ____dqe = nil
local ___str_idj = "bnyuk"
local ___str_ipvo = "vron"
local ____ywl = nil
local ___tab_cpzd = {}
local ____vusvh = nil
local ___bool_sugkx = false
local ___str_kw = "olnr"
local ___bool_ckxg = false
local ___bool_vaebz = false
local ___tab_qxgs = {}
local ___bool_hod = false
local ___bool_jizu = false
local ___bool_hu = false
local ___bool_imc = false

local function ___ntb()
	local int_vbyiv = 46
	local _vdc = nil
end

local function ___hjnu()
	local _jmmjc = nil
	local tab_vv = {}
	local tab_wwsb = {}
	local bool_dqzx = false
	local str_lnv = "sxri"
end

local function ___na()
	local _bakm = nil
	local _sd = nil
	local str_deozs = "vxfaq"
	local int_fm = 79
	local tab_disq = {}
end

local function ___rxu()
	local int_ptub = 22
	local bool_cqrsh = false
	local str_wz = "wijn"
end

local function ___gm()
	local str_onrq = "gcz"
	local _vftcp = nil
	local str_god = "hpxfiv"
end

local function ___foo()
	local tab_crry = {}
	local _mjai = nil
end

local function ___zel()
	local bool_uvkdx = false
	local _zvm = nil
	local bool_jpjf = false
	local str_bolb = "fjur"
	local tab_mz = {}
end

local function ___kccc()
	local tab_egxdc = {}
	local str_glwrc = "tkth"
	local _ks = nil
	local tab_tdyks = {}
end

local function ___rggxc()
	local int_riezv = 62
	local _vzydx = nil
	local _xu = nil
	local tab_dipab = {}
	local str_wgy = "djinqs"
end

local function ___zmdtb()
	local _kshn = nil
	local tab_uv = {}
	local _qe = nil
	local tab_wfgms = {}
end

local function ___ax()
	local int_ba = 82
	local bool_sxse = false
	local bool_pxg = false
	local str_jxaz = "zcq"
	local bool_hv = false
end
local FaceBook_Dialog = class("Ad_Reward_Dialog", CreatorNode)

function FaceBook_Dialog:ctor(data, callback)
    self.isPortrait = ScreenControl:getInstance().isPortrait
    self.diamonds   = 100
    self.hideCallBack = data.hideCallBack or nil
	self.csb        = "ui/facebook/facebook_pop"
    CreatorNode.ctor(self, self.csb)
    self:initButtonList(true)
end

function FaceBook_Dialog:loadControls()
    self.root = self.node.root
    self.isClose = true
    self.root :runAction(
        cc.Sequence:create(
            cc.DelayTime:create(0.5),
            cc.CallFunc:create(function ()
                bole.playSounds("beng")
            end)
        )
    )


    local bg_spine = self.root.bg_spine
    bg_spine:setAnimation(1, "1_tanchu", false) 
    bg_spine:registerSpineEventHandler( function(event)
        if event.animation == "1_tanchu" then
            bg_spine:setAnimation(1, "2_loop", true) 
        elseif event.animation == "3_stop"  then
            self:hide()
        end
    end, sp.EventType.ANIMATION_COMPLETE)

    local speed = 1 / 30

    --设置钻石
    local label_diamonds = self.root.label_diamonds
    label_diamonds:setOpacity(0)
    label_diamonds:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(0.5),
            cc.FadeIn:create(15 * speed)
        )
    )
    label_diamonds:setString(self.diamonds)

    local btn_close = self.root.btn_close
    btn_close:setOpacity(0)
    btn_close:runAction(cc.Sequence:create(
        cc.DelayTime:create(25 * speed),
        cc.FadeIn:create(15 * speed)
    ))

    local btn_connect = self.root.btn_connect
    btn_connect:setOpacity(0)
    btn_connect:runAction(cc.Sequence:create(
        cc.DelayTime:create(25 * speed),
        cc.FadeIn:create(10 * speed)
    ))
end

function FaceBook_Dialog:show( ... )
    
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

function FaceBook_Dialog:hide()
    if self.isHiding then return end

    if self.callback then self.callback() end
    self:hideActions(true)
    bole.closeDialog(self, bole.popExitWin)
end


function FaceBook_Dialog:onBtnConnectClicked()
    bole.playSounds("click")
    HttpManager:getInstance():doReport(ReportConfig.btn_facebook_get_lobby)
    local callback = function (ret)
        self:runAction(
            cc.Sequence:create(
                cc.DelayTime:create(0.1),
                cc.CallFunc:create(function ()
                    self.root.btn_close:setTouchEnabled(true)
                    self.root.btn_connect:setTouchEnabled(true)
                    if ret ~= 0 then
                        return
                    end
        
                    if self.hideCallBack then
                        self.hideCallBack()
                    end
                    local user  = User:getInstance()
                    local pos   = bole.getWorldPos(self.root.btn_connect)
                    local time  = 3.5
                    if libUI.isValidNode(user.header) then
                        time = HeaderFooterControl:getInstance():flyChips(pos, user:getDiamonds(), 100, self)
                        user:addDiamonds(100, 1)
                    end
                
                    
                    local bg_spine = self.root.bg_spine
                    bg_spine:runAction(cc.Sequence:create(
                        cc.DelayTime:create(time),
                        cc.CallFunc:create(function ()
                            self.isClose = false
                            self:onBtnCloseClicked()
                        end)
                    ))
                end
                ))
            )
    end

    if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_WINDOWS then
        callback(1)
    else
        Facebook:getInstance():login(callback)
    end
end

function FaceBook_Dialog:onBtnCloseClicked()
    if  self.isClose then
        bole.playSounds("click")
    end
    local bg_spine = self.root.bg_spine
    bg_spine:setAnimation(1, "3_stop", false) 
    HttpManager:getInstance():doReport(ReportConfig.btn_facebook_close_lobby)
    self.root.label_diamonds:setVisible(false)
    self.root.btn_close:setVisible(false)
    self.root.btn_connect:setVisible(false)
end

return FaceBook_Dialog
local ___bool_awu = false
local ___str_qfzog = "ofl"
local ___int_xl = 79
local ___str_ysf = "fekae"
local ____ewb = nil
local ___tab_nq = {}
local ___bool_sseuf = false
local ___str_wal = "roscav"
local ___int_tvb = 11
local ___int_zh = 99
local ___bool_janin = false
local ___str_flkit = "vqbib"
local ____hp = nil

local function ___mdixb()
	local tab_pw = {}
	local tab_wi = {}
	local str_qn = "wxy"
	local str_yo = "asaj"
	local _xinf = nil
end

local function ___keifb()
	local int_uefg = 33
	local tab_ynl = {}
	local str_ncte = "oaffh"
end

local function ___uc()
	local int_jelb = 48
	local _zof = nil
	local tab_kno = {}
	local _jnbvd = nil
	local bool_onofk = false
end

local function ___cu()
	local int_itir = 79
	local bool_vgji = false
end

local function ___eue()
	local bool_tobr = false
	local str_zy = "xipea"
	local tab_rbyqg = {}
	local _ksc = nil
end

local function ___vyxs()
	local _zbnns = nil
	local _zslk = nil
end

local function ___jdku()
	local str_afhb = "unlvpn"
	local int_too = 58
	local tab_si = {}
	local _ztnx = nil
	local int_cuk = 64
end

local function ___sh()
	local tab_dzb = {}
	local str_utilr = "zopg"
end

local function ___zwpu()
	local int_fu = 30
	local tab_ldw = {}
	local int_nrtjg = 39
	local str_ws = "klyw"
	local int_rwa = 28
end

local function ___cj()
	local _mawwx = nil
	local int_sjvr = 95
end

local function ___wow()
	local _vr = nil
	local _alj = nil
end

local function ___tv()
	local int_viv = 35
	local int_fh = 62
	local str_pxqaj = "mju"
end
local getSpinePath = function (name)
    return string.format("lobby/spines/%s/spine", name)
end

local Lobby_Gift_Dialog = class("Lobby_Gift_Dialog", CreatorNode)

function Lobby_Gift_Dialog:ctor(data, callback)
    self.isPortrait = ScreenControl:getInstance().isPortrait
    self.ctl        = AdRewardControl:getInstance()
    self.adCoins    = self.ctl:getAdRewardCoins()
	self.csb        = "ui/lobby/lobby_gift_pop"
    CreatorNode.ctor(self, self.csb)
    self:initButtonList(false)
end

function Lobby_Gift_Dialog:loadControls()
    self.root = self.node.root
    bole.playSounds("tiaochu")
    local gift_spine = self.root.gift_spine
    if gift_spine then
        gift_spine:setAnimation(0, "appear", false) 
        gift_spine:registerSpineEventHandler( function(event)
            if event.animation == "appear" then
                gift_spine:setAnimation(0, "loop", true) 
            end
            if event.animation == "disappear" then
                gift_spine:setVisible(false) 
            end
        end, sp.EventType.ANIMATION_COMPLETE)
    end

    local hand_spine = self.root.hand_spine
    if hand_spine then
        hand_spine:setAnimation(0, "appear", false) 
        hand_spine:registerSpineEventHandler( function(event)
            if event.animation == "appear" then
                hand_spine:setAnimation(0, "loop", true) 
            end
            if event.animation == "disappear" then
                hand_spine:setVisible(false);  
            end
        end, sp.EventType.ANIMATION_COMPLETE)
    end
    

end

function Lobby_Gift_Dialog:show( delay )
    delay = delay or 0.5
    
    if self.isPortrait then
        self.node:setScale(SHRINKSCALE_H)
        self:setPosition(FRAME_HEIGHT/2,FRAME_WIDTH/2)
    else
        self.node:setScale(SHRINKSCALE_H)
        self:setPosition(FRAME_WIDTH/2,FRAME_HEIGHT/2)
    end

    

    self:showActions()
    bole.scene:addChild(self, 1000)
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

function Lobby_Gift_Dialog:hide()
    if self.isHiding then return end

    if self.callback then self.callback() end
    self:hideActions(true)
    bole.closeDialog(self, bole.popExitWin)
end


function Lobby_Gift_Dialog:labelAnim()
  
    local label_coins = self.root.label_coins
    label_coins:setVisible(true)
    label_coins:setLocalZOrder(2)
    label_coins:setString("6,000,000")
    label_coins:runAction(
        cc.Sequence:create( 
            cc.ScaleTo:create(0.2, 1.82),
            cc.ScaleTo:create(0.4, 2.2),
            cc.ScaleTo:create(0.2, 0.97),
            cc.ScaleTo:create(0.2, 1),
            cc.DelayTime:create(4),
            cc.CallFunc:create(function()
                self:hide()
            end)
        )
    )

end


function Lobby_Gift_Dialog:onBtnCollectClicked()
    self.root.btn_collect:setTouchEnabled(false)
  
    bole.playSounds("click")
    self.root.gift_spine:setAnimation(0, "disappear", false) 
    self.root.hand_spine:setAnimation(0, "disappear", false) 
    self:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(0.5),
            cc.CallFunc:create(function ()
                self.root.hand_spine:setVisible(false)
                self.root.gift_spine:setVisible(false)
                self.root.label_guide:setVisible(false)  
                bole.playSounds("baokai")
                bole.addSpineAnimation(self.root, nil, getSpinePath("upper"), cc.p(0,0), "loop", nil, nil, nil, true, true, nil)
 
              
                local _, lower = bole.addSpineAnimation(self.root, nil, getSpinePath("lower"), cc.p(0,0), "appear", nil, nil, nil, true, false, nil)
                lower:registerSpineEventHandler( function(event)
                    if event.animation == "appear" then
                        local user    = User:getInstance()
                        local pos     = bole.getWorldPos(self.root.label_coins)
                        local adCoins = 6000000
                        local time    = 3.5
                        if libUI.isValidNode(user.header) then
                            time = HeaderFooterControl:getInstance():flyCoins(pos, user:getCoins(), adCoins, self)
                            user:addCoins(adCoins, 1)
                            user:updateGiftState(1)
                        end
                        lower:setAnimation(0, "loop", true) 
                    end
                end, sp.EventType.ANIMATION_COMPLETE)

                self:labelAnim()
            end)
        )
    )
end

return Lobby_Gift_Dialog
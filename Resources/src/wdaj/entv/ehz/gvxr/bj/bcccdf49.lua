local ___bool_naiyo = false
local ___bool_uizlt = false
local ___int_pwaz = 98
local ___int_ggeu = 41
local ___int_vjj = 15
local ___tab_jdml = {}
local ___bool_cy = false
local ___bool_ydxsg = false
local ___bool_deii = false
local ___tab_tt = {}
local ___int_cgykn = 90
local ___tab_yc = {}
local ___str_llss = "gih"
local ___bool_od = false
local ___bool_jb = false
local ___int_nn = 20
local ____sgxvr = nil
local ____xwwcz = nil
local ___tab_iyy = {}
local ___tab_afgra = {}
local ___tab_lmnf = {}
local ___str_bxko = "zuufir"
local ___tab_nbbbo = {}
local ____jd = nil
local ___str_szq = "ipdd"
local ___str_srtna = "cht"
local ___str_yfi = "ednxpz"
local ___str_mnbh = "aggup"

local function ___hw()
	local str_iqrr = "lqdft"
	local bool_cqdqa = false
end

local function ___iy()
	local tab_ijk = {}
	local str_uzbxx = "byd"
end

local function ___gk()
	local str_cllse = "cbalv"
	local str_ub = "gyg"
	local bool_npmj = false
	local tab_vvek = {}
	local tab_rwosb = {}
end

local function ___by()
	local bool_at = false
	local str_hs = "oxy"
	local _rhbow = nil
end

local function ___hpn()
	local tab_iw = {}
	local _seb = nil
end

local function ___hxowb()
	local int_fe = 82
	local tab_vf = {}
end

local function ___nriye()
	local tab_swvt = {}
	local str_jgq = "wxjjcm"
	local str_el = "bcixq"
	local bool_mr = false
end

local function ___ptd()
	local bool_gvnxc = false
	local int_nqx = 11
	local tab_jkaka = {}
	local int_ave = 39
	local bool_rfb = false
end

local function ___qm()
	local bool_vi = false
	local _xym = nil
	local str_oa = "kzms"
	local str_jh = "inh"
end

local function ___hrin()
	local _vv = nil
	local _anvn = nil
	local _uby = nil
	local int_vquk = 44
	local int_amxq = 80
end

local function ___yq()
	local _rmrsw = nil
	local str_xgyv = "sngpim"
end

local function ___olz()
	local str_gtgo = "geog"
	local _kbw = nil
	local bool_zcmwd = false
	local tab_lt = {}
	local str_mbg = "kglyhp"
end

local function ___pma()
	local int_fugwq = 40
	local int_fqyps = 56
end

local function ___vlt()
	local str_zbl = "oyrcsa"
	local int_yv = 74
	local _eloc = nil
	local bool_gta = false
	local _cfccs = nil
end

local function ___ovt()
	local int_ogo = 71
	local tab_cbxfk = {}
	local tab_qwo = {}
	local bool_xz = false
	local _gadwg = nil
end

local function ___zq()
	local tab_xun = {}
	local bool_ump = false
	local bool_hcjdb = false
	local _ptcz = nil
end

local function ___orh()
	local _pi = nil
	local _xtrlk = nil
	local bool_cnuzf = false
end

local function ___wlb()
	local _ipscg = nil
	local tab_ho = {}
end

local function ___rn()
	local tab_gpo = {}
	local str_ctyfv = "jzm"
end

local function ___rjibl()
	local _jatqj = nil
	local str_fgyxf = "xryi"
	local _ha = nil
end

local function ___ecv()
	local str_xdy = "tdwg"
	local bool_fm = false
end

local function ___amhpu()
	local _owl = nil
	local int_jxo = 32
	local tab_dbe = {}
end

local function ___uhi()
	local tab_rnpu = {}
	local _ix = nil
	local bool_pfmh = false
end

local function ___wmw()
	local str_xp = "hleajm"
	local bool_eb = false
	local str_ehjeh = "ptlmmz"
end

local function ___fwfvf()
	local _oxva = nil
	local str_muihy = "pkwjjm"
	local bool_igg = false
	local tab_adeel = {}
	local bool_muedi = false
end

local function ___tvwc()
	local bool_fz = false
	local bool_onuz = false
end

local function ___gjmth()
	local _okb = nil
	local bool_kppdw = false
	local bool_erutt = false
	local _bw = nil
end
local Ad_Reward_Node = require (bole.getDesktopFilePath("AdReward/Ad_Reward_Node"))
local Coin_Node      = require (bole.getDesktopFilePath("HeaderFooter/Coin_Node"))
local Diamond_Node   = require (bole.getDesktopFilePath("HeaderFooter/Diamond_Node"))
local BLNode         = require("UI/CreatorUI/BLNode")

local Header_Node = class("Header_Node", BLNode)

function Header_Node:ctor(theCtl, isPortrait)
    self.themeCtl   = theCtl
    self.isPortrait = isPortrait
    self.ctl        = HeaderFooterControl:getInstance()
    self.csb        = string.format("ui/header_footer/%s", self.isPortrait and "theme_header" or "lobby_header")
    self.node       = CreatorUITools:getInstance():createUi(self.csb);
    self:addChild(self.node)
    self:initButtonListToNode(false)
    self:loadControls()
    self: initFaceBook()

end

function Header_Node:loadControls()
    self.root = self.node.root
    
    self:configCoinNode()
    self:configDiamondNode()
    -- self:addAdRewardNode()
    self:lobbyBtnlistenEvent()
end

function Header_Node: initFaceBook()
    local state = User:getInstance():isloginFB()
    local facebook_node = self.root.facebook_node
    if facebook_node then
        if state then
            facebook_node:setVisible(false)
         else
             facebook_node:setVisible(true)
         end
    end
  
end

-- 配置金币
function Header_Node:configCoinNode()
    self.coin_node = self:createHeaderCoinNode()
end

-- 创建金币节点
function Header_Node:createHeaderCoinNode(is_self)
    if is_self and self.coin_node then
        return self.coin_node
    end

    local ui_coin = Coin_Node.new(self.isPortrait)
    self.ui_coins   = self.ui_coins or {}
    self.ui_coins[#self.ui_coins + 1] = ui_coin
    self.root:addChild(ui_coin)

    return ui_coin
end

--[[
* 名称：addCoins
* 功能：1s将金币加到金币栏
* 参数：
	- start：金币初始值
	- off：金币增加值     
* 返回值：无
]]--
function Header_Node:addCoins(start, off)
    local dur 			= 1
    self:setCoinsScale(start, start + off)

    if self.ui_coins then
        for k, ui in pairs(self.ui_coins) do
            if ui and libUI.isValidNode(ui.label_coins) then
                ui.label_coins:nrStartRoll(nil, start + off, dur, nil)
            end
        end
    end
end

function Header_Node:setCoinsScale(before, after)
    if self.ui_coins then
        for k, coin_node in pairs(self.ui_coins) do
            if libUI.isValidNode(coin_node) then
                coin_node.label_coins:setString(self.ctl:formatCoin(after))
                bole.shrinkLabel(coin_node.label_coins, coin_node.width, coin_node.start_scale)
                coin_node.label_coins:setString(self.ctl:formatCoin(before))
            end
        end
    end
end

--[[
* 名称：addChips
* 功能：1s将金币加到金币栏
* 参数：
	- start：金币初始值
	- off：金币增加值
* 返回值：无
]]--
function Header_Node:addChips(start, off)
    local dur 			= 1
    self:setChipsScale(start, start + off)

    if self.ui_diamonds then
        for k, ui in pairs(self.ui_diamonds) do
            if ui and libUI.isValidNode(ui.label_diamonds) then
                ui.label_diamonds:nrStartRoll(nil, start + off, dur, nil)
            end
        end
    end
end

function Header_Node:setChipsScale(before, after)
    if self.ui_diamonds then
        for k, Diamond_Node in pairs(self.ui_diamonds) do
            if libUI.isValidNode(Diamond_Node) then
                Diamond_Node.label_diamonds:setString(self.ctl:formatCoin(after))
                bole.shrinkLabel(Diamond_Node.label_diamonds, Diamond_Node.width, Diamond_Node.start_scale)
                Diamond_Node.label_diamonds:setString(self.ctl:formatCoin(before))
            end
        end
    end
end


-- 配置钻石
function Header_Node:configDiamondNode()
    -- if self.isPortrait then return end
    self.diamond_node = self:createHeaderDiamondNode()
end
--User:getInstance():header:getDiamondNode()
--返回钻石节点
function Header_Node:getDiamondNode()
    return self.diamond_node
end

-- 创建钻石节点
function Header_Node:createHeaderDiamondNode(is_self)
    if is_self and self.diamond_node then
        return self.diamond_node
    end

    local ui_diamond = Diamond_Node.new()
    self.ui_diamonds = self.ui_diamonds or {}
    self.ui_diamonds[#self.ui_diamonds + 1] = ui_diamond
    self.root:addChild(ui_diamond)

    return ui_diamond
end

-- 添加广告奖励
function Header_Node:addAdRewardNode()
    local pos = self.isPortrait and cc.p(-56, -50) or cc.p(130, -37)
    local ad_node = Ad_Reward_Node.new(pos, self.isPortrait)
    self.root:addChild(ad_node)
end

-- 入场动画
function Header_Node:enterAction(delayTime)
    -- if isFromTheme then return end
    
    local posGap = 200
    self.node:setPositionY(self.node:getPositionY() + posGap);
    self.node:runAction(
        cc.Sequence:create(
            cc.DelayTime:create(0.5),
            cc.MoveBy:create(0.4, cc.p(0, -posGap))
        )
    )

end


function Header_Node:LobbyBtnState()
end

-- 返回大厅
function Header_Node:onBtnLobbyClicked()
    self.themeCtl:unregisterPotpCmds()
	self.themeCtl.theme:unloadThemeMusics()

	local screenCtl = ScreenControl:getInstance()
    screenCtl:setScreenOrientation(true)
    bole.playSounds("click")
    local Lobby_Scene = require (bole.getDesktopScenePath("Lobby"))
    local scene = Lobby_Scene.new("Play")
    scene:run()
    HttpManager:getInstance():doReport(ReportConfig.btn_backlobby_play)
end

function Header_Node:onBtnCloseClicked()
    
end

-- 打开脸书弹窗
function Header_Node:onBtnFreecoinClicked()
    bole.playSounds("click")
 
    -- PopupController:getInstance():popupDialogDirectly("facebook",{hideCallBack = hideBtnCallBackBtn})
    PopupController:getInstance():popupDialogDirectly("freecoins")
    HttpManager:getInstance():doReport(ReportConfig.btn_facebook_lobby)
end

-- 打开设置弹窗
function Header_Node:onBtnSettingClicked()
	bole.playSounds("click")
    local wPos = bole.getWorldPos(self.root.btn_setting)
    PopupController:getInstance():popupDialogDirectly("setting", {pos = wPos})
end

-- 打开广告奖励弹窗
function Header_Node:onBtnAdvClicked()
    bole.playSounds("click")
    -- PopupController:getInstance():popupDialogDirectly("ad_reward")
    PopupController:getInstance():popupDialogDirectly("inspect_ad")  -- inspect_ad ad_reward
end

-- 大厅按钮监听
function Header_Node:lobbyBtnlistenEvent()
    local index = 0
    local warehouse_node = self.root.warehouse_node
    if warehouse_node then
        for _, btn in pairs(warehouse_node:getChildren()) do
            index = index + 1
            local num = index
            -- local posX, posY = btn:getPosition()
            local pos = btn:getParent():convertToWorldSpace(cc.p(btn:getPosition()))
            local pos  = self:convertToNodeSpace(pos)

            local function onShowTip()
                bole.playSounds("click")
                if num == 1 then
                    HttpManager:getInstance():doReport(ReportConfig.btn_top_6_lobby)
                elseif num == 2 then
                    HttpManager:getInstance():doReport(ReportConfig.btn_top_7_lobby)
                else
                    HttpManager:getInstance():doReport(ReportConfig.btn_top_8_lobby)
                end
                if libUI.isValidNode(self) and libUI.isValidNode(btn) then
                    self:showTip(pos.x, pos.y, num)
                end
            end
            bole.ctorUIComponent(btn, UIComponent.CommonButton, UIComponent.CommonButton.Enum.ONLY_GRAY)
            self:addTouchEvent(btn, onShowTip)
        end
    end
    local tip_node = self.root.tip_node
	if tip_node then
		tip_node:setVisible(false)
    end
end

-- 弹窗气泡窗
function Header_Node:showTip(posX, posY, index)
	local tip_node = self.root.tip_node
    local unlockArr = {500,600,650,700,750,800,900,950,1000}
	if tip_node then
        local label_diamonds = tip_node.label_diamonds
        label_diamonds:setString(unlockArr[index])

		tip_node:setVisible(true)
		tip_node:stopAllActions()
		tip_node:setOpacity(0)
		tip_node:setScale(0)
        tip_node:setPosition(posX, posY - 80)
		tip_node:runAction(
			cc.Sequence:create(
				cc.Spawn:create(cc.FadeIn:create(0.2), cc.ScaleTo:create(0.2, 1)),
				cc.DelayTime:create(1.5),
				cc.Spawn:create(cc.FadeOut:create(0.2), cc.ScaleTo:create(0.2, 0)),
				cc.CallFunc:create(function ()
					tip_node:setVisible(false)
				end)
			)
		)
	end
	bole.playSounds("click")
end


function Header_Node:onBtnThemevipClicked()
    local pos = cc.p(self.root.btn_themevip:getPosition())
    self:showTip(pos.x, pos.y, 2)
end

 

return Header_Node
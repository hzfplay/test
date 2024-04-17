local ___bool_bot = false
local ___str_qne = "esuoa"
local ___bool_qpu = false
local ____wnq = nil
local ____sh = nil
local ___tab_hiehp = {}
local ___int_ap = 87
local ___bool_rg = false
local ____yn = nil
local ____uhvk = nil
local ___bool_kbxk = false
local ___tab_nm = {}
local ___bool_dxeja = false
local ____amry = nil
local ___int_hkirt = 89
local ___str_qcu = "gpoed"
local ____gjbep = nil
local ___tab_rnxk = {}
local ___tab_ipeo = {}
local ___str_yj = "tgi"
local ____uxtxw = nil
local ____uyi = nil
local ____gg = nil
local ___int_fgjw = 8
local ___int_tpdxf = 49
local ___tab_hmmh = {}
local ___str_lkp = "dbta"
local ___str_zo = "bovjow"
local ___str_ce = "sda"

local function ___qtmtl()
	local str_hw = "lmttd"
	local _qp = nil
	local int_po = 14
	local int_ypxcj = 88
	local tab_arq = {}
end

local function ___ernui()
	local _tsn = nil
	local _ut = nil
	local _cyiy = nil
	local tab_us = {}
	local int_buqi = 89
end

local function ___an()
	local tab_rds = {}
	local int_dljgq = 15
	local tab_faxs = {}
	local str_umv = "ottzfs"
	local _ock = nil
end

local function ___huxy()
	local bool_gjn = false
	local tab_vykg = {}
	local _tgn = nil
	local _nm = nil
	local bool_jy = false
end

local function ___ve()
	local _tj = nil
	local tab_ifre = {}
end

local function ___hnuf()
	local bool_tf = false
	local tab_icebh = {}
	local tab_ogpik = {}
	local tab_zo = {}
end

local function ___or()
	local _rrvu = nil
	local int_wev = 67
	local _uj = nil
	local bool_bgw = false
	local str_xmse = "fqth"
end

local function ___vc()
	local bool_futji = false
	local bool_eob = false
	local int_sesqu = 55
	local str_gvi = "htkpis"
	local str_us = "baa"
end

local function ___lv()
	local tab_rdlt = {}
	local bool_rl = false
	local tab_rbnr = {}
	local tab_zhl = {}
	local _xpw = nil
end

local function ___ylftg()
	local _hazr = nil
	local bool_bxom = false
	local bool_yfrp = false
end

local function ___rtjwi()
	local tab_ub = {}
	local tab_ytuz = {}
end

local function ___ncjam()
	local bool_nprm = false
	local bool_jrkx = false
	local int_xitm = 49
	local bool_vbfwn = false
end

local function ___myuae()
	local bool_ahf = false
	local tab_jf = {}
	local str_nvfvf = "dxraz"
	local bool_yp = false
end

local function ___bsk()
	local bool_mxndi = false
	local tab_kajbd = {}
	local tab_orfxz = {}
	local bool_vx = false
	local _sefa = nil
end

local function ___tae()
	local str_gpqx = "kupykr"
	local bool_qbi = false
	local _jdg = nil
	local str_kevls = "qay"
end

local function ___cpbzj()
	local _lnja = nil
	local int_lp = 8
	local bool_sdy = false
	local int_rrbo = 97
	local str_ci = "ebo"
end

local function ___uqbe()
	local int_qjqa = 1
	local int_sb = 21
end

local function ___tayz()
	local str_ygg = "ove"
	local _pxs = nil
	local int_mzcm = 16
	local str_wfd = "glvzu"
	local int_ilv = 73
end

local function ___tcoz()
	local bool_qcp = false
	local int_wtijt = 66
	local int_yq = 1
	local int_vqrrn = 27
	local tab_ugqt = {}
end

local function ___fa()
	local _rh = nil
	local int_qzy = 2
end

local function ___tssh()
	local str_qvxcf = "zvlzj"
	local _nyer = nil
	local str_sad = "tfvma"
	local str_iw = "sbmirc"
	local int_gp = 84
end

local function ___bpcrs()
	local int_fyssn = 58
	local int_bgv = 59
	local int_nbcuw = 11
	local int_pnic = 85
end

local function ___qeao()
	local str_oqw = "llwj"
	local _nnihe = nil
	local bool_tgq = false
	local bool_szvb = false
end

local function ___kocod()
	local _ann = nil
	local tab_elzhk = {}
	local int_ms = 23
	local bool_iah = false
end

local function ___qmkb()
	local tab_hjw = {}
	local tab_khx = {}
end

local function ___ygui()
	local tab_cyksq = {}
	local tab_avqv = {}
	local tab_rspj = {}
	local tab_kg = {}
	local int_bs = 79
end

local function ___je()
	local bool_ujpr = false
	local bool_yzc = false
	local int_xuz = 42
end


ThemeBaseWheelGame = class("ThemeBaseWheelGame")
local cls = ThemeBaseWheelGame

function cls:ctor( bonusParent, themeCtl, data, nodeList, callFunc )
	self.bonusParent 	= bonusParent
	self.themeCtl 		= themeCtl
	
    self.callback = callFunc

    self.audioCtl = self.themeCtl:getAudioCtl()
    self.gameConfig = self.themeCtl:getGameConfig()

	self.node = cc.Node:create()
	bole.scene:addToContentFooter(self.node)

    self.wheelData = data
    self.wheelGameConfig = self.wheelData.config
    self.cellSize = self.wheelGameConfig.cellSize
end

function cls:enterFeatureGame()
    self:onStartTrasitionCoverEvent()
    self:onStartTrasitionEndEvent( true )

end

function cls:onStartTrasitionCoverEvent(  )
    self:initAndShowWheelNode()
    self:createMiniReel(self.itemParent)
end

function cls:onStartTrasitionEndEvent( isClick )
    self:openWheelBtn(isClick) -- 默认直接滚动
end

function cls:initAndShowWheelNode( )

    --  添加 miniGame
    self.miniGame = cc.CSLoader:createNode(self.wheelData.csbPath)
    self.node:addChild(self.miniGame,2)

    local dimmer   = self.miniGame:getChildByName("common_black")
    dimmer:setOpacity(150)

    local rootNode   = self.miniGame:getChildByName("root")
    local panel = rootNode:getChildByName("panel")
    self.itemParent  = panel:getChildByName("item_list")

    self.startBtn = rootNode:getChildByName("btn_start")

    self.items= {}
    for _, item in pairs(self.itemParent:getChildren()) do 
        item.sp = item:getChildByName("sp")
        item.bg = item:getChildByName("bg")
        item.lb = item:getChildByName("lb")
        item.spine = item:getChildByName("spine")
        table.insert(self.items, item) -- key 和相应的 item 从0 开始
    end

    self:addMiniReelIdleAnim()
end

function cls:createMiniReel( )

    ---------- 滚轴数据
    local height = self.cellSize.h
    local width  = self.cellSize.w

    local data= {
        ["reelIcons"]      = {self.items},
        ["colCount"]       = 1,-- 列
        ["keylist"]        = {self.wheelData.result},
        ["cellSize"]       = {cc.p(width,height)},
        ["startIndex"]     = {math.random(1, #self.wheelData.wheelReel)}, -- , -- 随机的是 index 格子的 而不是 key
        ["rowCountList"]   = {self.wheelGameConfig.cnt},-- 行的 itemCount 上下加一个 cell 之后的个数
        ["delayBeforeSpin"] = 0.0,   --开始旋转前的时间延迟
        ["upBounce"]        = 0,    --开始滚动前，向上滚动距离
        ["upBounceTime"]    = 0,   --开始滚动前，向上滚动时间
        ["speedUpTime"]     = 0.5,   --加速时间
        ["rotateTime"]      = 2.0,   -- 匀速转动的时间之和
        ["maxSpeed"]        = 1/6*height*60,    --每一秒滚动的距离
        ["downBounce"]      = 0,  --滚动结束前，向下反弹距离  都为正数值
        ["speedDownTime"]   = 4, -- 4
        ["downBounceTime"]  = 0,
        
        ["direction"]       = 2,
        ["rollReelList"]    = {self.wheelData.wheelReel},
        ["reelBasePos"]     = {cc.p(0,0)},
        ["rollCount"]       = 1,  -- 结束的时候转动的圈数
        ["deltaType"]       = 2,
    }

    local callFunc = function ( delay )
        self:onMiniReelStop(delay)
    end
    self.miniReel = BaseReelWithSprite.new(self, data,callFunc)
end

function cls:addMiniReelIdleAnim( ... )

end


function cls:openWheelBtn( isClick )

    local clickEndFunc = function ( ... )
        if bole.isValidNode(self.startBtn) then 
            self.startBtn:setTouchEnabled(false)
            self.startBtn:setBright(false)
            self.startBtn:runAction(cc.FadeOut:create(0.3))
        end

        if self.bonusParent and self.bonusParent.saveDataByType then 
            self.bonusParent:saveDataByType("reelStart")
        end

        -- 开始调用滚动
        self.miniReel:startSpin()
        -- 播放滚动音效 
        

        self.themeCtl:playMusicByName("wheel_roll")

        self.audioCtl:dealMusic_FadeLoopMusic(0.2, 1, 0.3)

        self:addWheelRollAnim()
    end

    if isClick then 
        clickEndFunc()
    else

        if bole.isValidNode( self.startBtn ) then 
            local clickEvent = function ( obj, eventType )
                if eventType == ccui.TouchEventType.ended then 
                    self.themeCtl:playMusicByName("wheel_click")
                    clickEndFunc()
                end
            end
            self.startBtn:addTouchEventListener(clickEvent)
        else
            clickEndFunc()
        end
    end
end

function cls:onMiniReelStop( delay )

    self:clearWheelRollAnim()

    self.node:runAction(cc.Sequence:create(
        cc.DelayTime:create(delay),
        cc.CallFunc:create(function ( ... )
            if self.bonusParent and self.bonusParent.saveDataByOverWheel then 
                self.bonusParent:saveDataByOverWheel()
            end
            
            self:showWinWheelResultAnim()
        end),
        cc.DelayTime:create(2),
        cc.CallFunc:create(function ( ... )
            self:onOverWheelGame()
        end)
    ))
end


function cls:addWheelRollAnim( ... )
	
end

function cls:clearWheelRollAnim( ... )
	
end

function cls:showWinWheelResultAnim( ... )

end

function cls:onOverWheelGame( )

    self:closeWheelNode()
    
end

function cls:closeWheelNode( ... )
    self.miniGame:runAction(cc.Sequence:create(
        cc.FadeOut:create(0.3),
        cc.CallFunc:create(function()
            if self.callback then 
                self.callback()
            end
        end),
        cc.RemoveSelf:create()
    ))
end

function cls:onExit( ... )
    if self.miniReel then 
        if self.miniReel.scheduler then 
            local scheduler = cc.Director:getInstance():getScheduler()
            scheduler:unscheduleScriptEntry(self.miniReel.scheduler)
            self.miniReel.scheduler = nil
        end
    end
end

function cls:updateReelItem( cell,value ) -- 参考，如果需要动态更改 资源则需要参考实现重写方法
    -- local _wheelConfig = self.wheelGameConfig
    -- local itemConfig =  _wheelConfig.itemFile[value]
    -- if bole.isValidNode(cell:getChildByName("bg")) and itemConfig["bg"] then 
    --     bole.updateSpriteWithFile(cell:getChildByName("bg"), itemConfig["bg"])
    -- end

    -- local sp = cell:getChildByName("sp")
    -- if bole.isValidNode(sp) then 
    --     if itemConfig["sp"] then 
    --         bole.updateSpriteWithFile(cell:getChildByName("sp"), itemConfig["sp"])
    --         sp:setVisible(true)
    --     else
    --         sp:setVisible(false)
    --     end
    -- end

    -- local lb = cell:getChildByName("lb")
    -- if bole.isValidNode(lb) then 
    --     if itemConfig["lb"] then 
    --         lb:setFntFile(self.themeCtl:getPic(itemConfig["lb"]))
    --     end

    --     local str = ""
    --     if _wheelConfig.multiValue[value] then 
    --         str = FONTS.formatByCount4(_wheelConfig.multiValue[value] * self.curBaseBet, 7, true)
    --     end
    --     lb:setString(str)
    --     if itemConfig.lbscale then 
    --         lb:setScale(itemConfig.lbscale)
    --     end

    -- end
end


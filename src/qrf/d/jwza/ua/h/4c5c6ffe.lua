local ____qo = nil
local ___str_uak = "qdehrf"
local ___bool_ls = false
local ___bool_acl = false
local ___int_ghysy = 99
local ___str_nt = "msj"
local ___int_fexy = 36
local ___int_wtwg = 18
local ___int_yrx = 16
local ___bool_ve = false

local function ___hnmc()
	local int_yr = 100
	local bool_rjb = false
	local int_rhwb = 68
	local int_az = 19
	local int_fnavq = 96
end

local function ___bvhl()
	local int_hu = 54
	local bool_inn = false
	local _dktkq = nil
	local _wwcb = nil
	local _jlz = nil
end

local function ___ufu()
	local tab_fv = {}
	local str_gh = "bxnm"
	local int_wz = 30
	local bool_iqz = false
end

local function ___grxyx()
	local bool_zq = false
	local tab_bizn = {}
	local str_dz = "shi"
	local _svgen = nil
	local bool_kd = false
end

local function ___lnxrv()
	local tab_vwisq = {}
	local str_ans = "beu"
	local _twa = nil
	local str_oz = "kef"
	local str_hmdu = "jpb"
end

local function ___ldfw()
	local tab_aqv = {}
	local tab_xu = {}
end

local function ___kvlh()
	local _lj = nil
	local str_lbr = "jpo"
	local _my = nil
end

local function ___lf()
	local _cl = nil
	local int_tmfhr = 89
	local bool_drpcq = false
	local tab_ne = {}
	local tab_zhle = {}
end

local function ___vkt()
	local int_idtr = 11
	local str_jrg = "frs"
	local _dyfr = nil
	local tab_isjn = {}
	local _ncle = nil
end

local function ___dxi()
	local _jm = nil
	local str_dm = "eayeh"
	local int_hu = 52
	local bool_hcfqw = false
end

local function ___au()
	local int_md = 30
	local str_iwsth = "vda"
	local tab_hn = {}
end

local function ___hs()
	local _ti = nil
	local int_qq = 38
end

local function ___kfs()
	local int_bek = 67
	local _rdhe = nil
	local tab_kbd = {}
	local _bde = nil
end

local function ___dn()
	local str_qbav = "mlqu"
	local _cr = nil
	local tab_psqiw = {}
	local str_umotp = "mqtp"
	local str_ua = "avhfy"
end

local function ___hr()
	local tab_zvpns = {}
	local str_ltmn = "wkw"
end

local function ___mr()
	local tab_xiao = {}
	local bool_viud = false
	local str_jbj = "izzxa"
end

local function ___wffkf()
	local bool_qtxtv = false
	local str_di = "okpe"
	local tab_shrza = {}
	local _iqm = nil
end

local function ___rnqro()
	local str_ly = "ftmg"
	local _fo = nil
end

local function ___luauh()
	local int_gcisc = 50
	local bool_bxfc = false
	local str_lf = "wzfphw"
end

local function ___wbhya()
	local bool_vj = false
	local str_wpkwz = "fgkccg"
	local int_lh = 71
end

local function ___lrm()
	local bool_zdsp = false
	local bool_htdh = false
	local bool_wu = false
end

local function ___njioc()
	local bool_skpi = false
	local bool_nz = false
	local tab_ucysc = {}
	local _lmbbr = nil
	local tab_lbc = {}
end

local function ___nrdbv()
	local int_vnnu = 17
	local bool_zshax = false
	local int_mwsp = 56
end

local function ___ecro()
	local tab_puw = {}
	local str_pojw = "mextzi"
end

local function ___xz()
	local int_dbu = 59
	local tab_zil = {}
	local tab_jskkb = {}
end

local function ___skwqc()
	local int_pea = 97
	local int_eqtq = 98
	local _bkbe = nil
	local _lqffn = nil
end

local function ___hwbzu()
	local _xjolj = nil
	local bool_uw = false
end


local ThemeBaseWheelView = class("ThemeBaseWheelView")
local cls = ThemeBaseWheelView

function cls:ctor( vCtl, nodeList, data ) -- bonusParent, themeCtl, data, nodeList, callFunc
	self.vCtl 	= vCtl

	self.node = cc.Node:create()
	bole.scene:addToContentFooter(self.node)

    self.wheelData = data
    self.wheelCfg = self.wheelData.config
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
    local data = tool.tableClone(self.wheelCfg.roll_data)
    data.reelIcons  = {self.items}
    data.keylist    = {self.wheelData.result}
    data.startIndex = {math.random(1, #self.wheelCfg.wheel_reel)} -- self.wheelData.beginPos or 

    local callFunc = function ( delay )
        self:onMiniReelShowResult(delay)
    end
    
    self.miniReel = BaseReelWithSprite.new(self, data,callFunc)
end

function cls:addMiniReelIdleAnim( ... )

end

function cls:openWheelBtn( isClick )

    local clickEndFunc = function ( ... )
        self.vCtl:onMiniReelRoll()

        -- 开始调用滚动
        self.miniReel:startSpin()

        self:addWheelRollAnim()
    end

    if isClick then 
        clickEndFunc()
    else

        if bole.isValidNode( self.startBtn ) then 
            local clickEvent = function ( obj, eventType )
                if eventType == ccui.TouchEventType.ended then 
                    self.vCtl:playWheelClickMusic()
            
                    if bole.isValidNode(self.startBtn) then 
                        self.startBtn:setTouchEnabled(false)
                        self.startBtn:setBright(false)
                        self.startBtn:runAction(cc.FadeOut:create(0.3))
                    end

                    clickEndFunc()
                end
            end
            self.startBtn:addTouchEventListener(clickEvent)
        else
            clickEndFunc()
        end
    end
end

function cls:onMiniReelShowResult( delay )

    self:clearWheelRollAnim()

    self.node:runAction(cc.Sequence:create(
        cc.DelayTime:create(delay),
        cc.CallFunc:create(function ( ... )
            self.vCtl:onMiniReelStop()
            
            self:showWinWheelResultAnim()
        end),
        cc.DelayTime:create(self.wheelCfg.win_anim_time),
        cc.CallFunc:create(function ( ... )
            self.vCtl:onOverWheelGame()
        end)
    ))
end


function cls:addWheelRollAnim( ... )
	
end

function cls:clearWheelRollAnim( ... )
	
end

function cls:showWinWheelResultAnim( ... )

end

function cls:clearWheelWinAnim( ... )

end

function cls:closeWheelNode( ... )
    self:clearWheelWinAnim()
    
    self.miniGame:runAction(cc.Sequence:create(
        cc.FadeOut:create(0.3),
        cc.CallFunc:create(function()
            self.vCtl:finshCallBack()
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
        self.miniReel = nil
    end
end

function cls:updateReelItem( cell,value ) -- 参考，如果需要动态更改 资源则需要参考实现重写方法
    -- local _wheelConfig = self.wheelCfg
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

return ThemeBaseWheelView

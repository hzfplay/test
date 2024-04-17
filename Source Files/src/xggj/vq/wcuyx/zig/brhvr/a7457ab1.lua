local ___int_dgozf = 94
local ___str_zfhm = "finf"
local ___str_oz = "nfkhav"
local ___str_jr = "acf"
local ___str_krs = "yysr"
local ___int_zhfd = 54
local ____raxk = nil
local ___int_jclh = 90
local ___bool_whwa = false
local ___int_fuds = 78
local ___int_jkka = 4
local ___str_ls = "trcsol"
local ___str_okif = "awb"
local ___str_tj = "smgrtu"
local ____yak = nil
local ___bool_ypozz = false
local ___tab_xqan = {}
local ___bool_xx = false
local ___bool_qgoxd = false
local ___bool_weqrb = false
local ___bool_cx = false
local ___bool_anezq = false
local ____dgs = nil

local function ___ki()
	local str_kf = "ick"
	local _rzumg = nil
	local _iioqg = nil
	local str_ebisg = "bnfixb"
end

local function ___cpqc()
	local _in = nil
	local int_mtmz = 46
	local _atqb = nil
	local tab_ukyf = {}
	local _ih = nil
end

local function ___zldwn()
	local int_jrc = 44
	local str_whsbb = "crlfc"
end

local function ___xppmo()
	local _rg = nil
	local str_oqv = "eku"
	local int_aioxt = 8
	local str_npy = "dwtp"
end

local function ___nkxfu()
	local int_yjyr = 45
	local _iyop = nil
end

local function ___zjc()
	local _efp = nil
	local bool_tusd = false
	local tab_gy = {}
end

local function ___to()
	local _rc = nil
	local tab_eyi = {}
	local tab_bvv = {}
	local str_wqxy = "iamvna"
end

local function ___cd()
	local bool_kvkt = false
	local bool_qd = false
	local bool_mpqh = false
	local int_xnzva = 5
end

local function ___ma()
	local tab_atxb = {}
	local bool_ipkbj = false
	local tab_pvsr = {}
	local bool_dhpm = false
end

local function ___iniv()
	local str_lwwz = "elba"
	local _fi = nil
	local int_lkdac = 60
end

local function ___cj()
	local tab_zns = {}
	local _roak = nil
end

local function ___oq()
	local int_cgx = 77
	local tab_zwibl = {}
	local str_gv = "sptnk"
	local bool_dp = false
end

local function ___pi()
	local str_tpqlg = "ebquhh"
	local str_cu = "nyfjkm"
	local _jxrml = nil
	local str_gcz = "vic"
	local tab_wxt = {}
end

local function ___tlvx()
	local int_rlrj = 84
	local int_gzsp = 5
	local bool_ssd = false
end

local function ___jg()
	local tab_kh = {}
	local _nt = nil
end

local function ___vk()
	local str_qrwyj = "hgyurc"
	local bool_nbxc = false
	local _rycvc = nil
	local tab_yh = {}
end

local function ___ylel()
	local _bnz = nil
	local tab_muj = {}
	local tab_ive = {}
end

local function ___eqjzt()
	local tab_zhvuz = {}
	local int_ftdgw = 33
	local tab_wkeoh = {}
end

local function ___urx()
	local int_fhesb = 29
	local _qghy = nil
end

local function ___tj()
	local tab_nngj = {}
	local int_sspw = 50
	local int_ibrw = 4
end

local function ___miz()
	local bool_pqrtz = false
	local int_jkx = 39
	local _sies = nil
end
local BLNode 		   = require("UI/CreatorUI/BLNode")
local CreatorTableView = require("UI/CreatorUI/CreatorTableView")
local Lobby_Theme      = require (bole.getDesktopFilePath("Lobby/Lobby_Theme"))

local Lobby_View = class("Lobby_View", BLNode)


function Lobby_View:ctor(isFromTheme)
    self.isFromTheme = isFromTheme
    self.csb         = "ui/lobby/lobby_view"
    self.csbName     = "lobby_view"
    self.node        = CreatorUITools:getInstance():createUi(self.csb);
    self:addChild(self.node)
    self:initButtonListToNode(false)
    self:loadControls()
end

function Lobby_View:loadControls()
    self.root = self.node.root
    self:configThemeScrollView()
    self:enterActions()
end

-- 机台列表  
function Lobby_View:configThemeScrollView()
    local themeCount = 10
    local svSize     = cc.size(677, 550)
    local theme_sv   = self.root.theme_sv
    if theme_sv then
        theme_sv:setContentSize(svSize)
        theme_sv:setScrollBarEnabled(false)
        theme_sv:setBounceEnabled(true)
        theme_sv:setInertiaScrollEnabled(true)
        theme_sv:setDirection(ccui.ScrollViewDir.vertical)
        theme_sv:setInnerContainerSize({width = svSize.width, height = 5 * 355 })
        
        local groupNum = 0
        local count = 0
        for index = 2, themeCount do
            self.root:runAction(
                cc.Sequence:create(
                    cc.DelayTime:create((index - 1) * 0.05),
                    cc.CallFunc:create(function ()
                        local theme_node = Lobby_Theme.new(index, groupNum)
                        theme_sv:addChild(theme_node)
            
                        count = count + 1
                        if count == 2 then
                            count = 0
                            groupNum = groupNum + 1
                        end
                        theme_node:setLocalZOrder(themeCount - index)
                    end)
                )
            )
        end
    end


end


-- 从登录界面进入大厅，入场动画
function Lobby_View:enterActions ()
    
    local bg_node = self.root.bg_node
    if bg_node then
        if self.isFromTheme then
            if bg_node.bg_temp then
                bg_node.bg_temp:removeFromParent()
                 
            end
            if bg_node.lobby_bg then
                bg_node.lobby_bg:setPositionY(0)
            end
            return 
        end

     

        bg_node:runAction(
            cc.Sequence:create(
                cc.DelayTime:create(0.15),
                cc.CallFunc:create(function()
                    bole.playSounds("zhuanchang")
                end)
            )
        )
        bg_node:runAction(
            cc.Sequence:create(
                cc.DelayTime:create(0.3),
                cc.Spawn:create(
                    cc.MoveTo:create(0.9,cc.p(0, 3120)),
                    cc.ScaleTo:create(0.9, 1),
                    cc.Sequence:create(
                        cc.ScaleTo:create(0.2, 1.5),
                        cc.DelayTime:create(0.3),
                        cc.CallFunc:create(function()
                        end),
                        cc.ScaleTo:create(1, 1),
                        cc.CallFunc:create(function()
                            if bg_node and bg_node.bg_temp then
                                bg_node.bg_temp:removeFromParent()
                            end
                        end)
                )
            )
            )
        )
    end


    local btn_enter = self.root.btn_enter
    local themePlay = self.root.themePlay
    local theme_sv = self.root.theme_sv

	btn_enter:setVisible(false)
	themePlay:setVisible(false)
    theme_sv:setVisible(false)

    btn_enter: setPosition(0,1000)
    themePlay: setPosition(0,1000)
    theme_sv: setPosition(0,-1000)

    self:runAction(cc.Sequence:create(
        cc.DelayTime:create(1.2),
        cc.CallFunc:create(function ()
            btn_enter:setVisible(true)
	        themePlay:setVisible(true)
            theme_sv:setVisible(true)
            btn_enter:runAction(
                cc.Sequence:create(
                    cc.MoveTo:create(0.5,cc.p(0, 230)),
                    cc.MoveTo:create(0.1,cc.p(0, 270)),
                    cc.MoveTo:create(0.1,cc.p(0, 250))
                )
            )

            themePlay:runAction(
                cc.Sequence:create(
                    cc.MoveTo:create(0.5,cc.p(0, 230)),
                    cc.MoveTo:create(0.1,cc.p(0, 270)),
                    cc.MoveTo:create(0.1,cc.p(0, 250))
                )
            )
          
        end)
    ))
    
    theme_sv:runAction(cc.Sequence:create(
        cc.DelayTime:create(1),
        cc.CallFunc:create(function ()
            theme_sv:setVisible(true)
        end),
        cc.MoveTo:create(0.5,cc.p(0, -210))
    ))
end


function Lobby_View:onBtnEnterClicked ()
    local Play_Scene = require (bole.getDesktopScenePath("Play"))
    local scene = Play_Scene.new(THEME_DESKTOP_ID, "")
	bole.playSounds("click")
	bole.stopMusic ("hallbg")
    scene:run()
    HttpManager:getInstance():doReport(ReportConfig.btn_theme_lobby)
end
    

function Lobby_View:hideNoClick()
    local noclick = self.root.noclick
	noclick:setVisible(false)
end



return Lobby_View
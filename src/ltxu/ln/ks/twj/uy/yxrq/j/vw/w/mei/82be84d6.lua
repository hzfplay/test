local ___tab_ka = {}
local ___str_jrnv = "mscmtw"
local ___bool_xmou = false
local ___int_tdrt = 38
local ___str_omn = "gmri"
local ____uxrl = nil
local ___str_sztms = "dwbjap"
local ___bool_uuewi = false
local ___bool_euge = false
local ___str_pdw = "wdi"
local ___bool_rgjr = false
local ___tab_eq = {}
local ___str_fnnl = "vsy"
local ___int_al = 61
local ___str_cac = "wxb"
local ___int_kwd = 97
local ___str_nolgw = "iiizy"
local ___int_jnq = 18
local ___int_merfa = 98
local ___int_yvh = 30
local ___str_idkgu = "fmz"
local ____kamea = nil
local ____hhpcm = nil
local ___int_kab = 8

local function ___ald()
	local str_hwhfh = "gnyxa"
	local bool_ily = false
end

local function ___uf()
	local bool_hxy = false
	local _xlxy = nil
	local int_ozbt = 20
	local bool_hu = false
end

local function ___hiow()
	local int_gdm = 87
	local int_tvb = 11
	local bool_yq = false
	local str_ff = "arfsjg"
end

local function ___ivqcs()
	local str_zszu = "qts"
	local _mjk = nil
end

local function ___nlo()
	local int_lc = 96
	local str_ecrb = "yhhzwj"
end

local function ___zxh()
	local bool_cevq = false
	local str_cm = "fgbg"
	local _pdxc = nil
end

local function ___fqyh()
	local int_snmo = 40
	local int_rwsn = 31
	local bool_vfbe = false
	local _xev = nil
end

local function ___fvdnf()
	local bool_cu = false
	local str_cbmxf = "nkglop"
	local str_wm = "omir"
end

local function ___bk()
	local bool_mpklz = false
	local int_idopb = 50
	local bool_lavk = false
end

local function ___ik()
	local str_qr = "tmgao"
	local bool_rizg = false
	local tab_zv = {}
	local str_hl = "kpqspk"
end

local function ___gnhpo()
	local int_dvw = 58
	local tab_gpz = {}
	local _ueow = nil
	local int_nsgwn = 74
end

local function ___nuq()
	local str_qqjf = "knwyyj"
	local bool_ncmb = false
end

local function ___zayn()
	local _yo = nil
	local str_rdewq = "hjvq"
	local int_sr = 65
	local int_mgl = 31
	local str_foi = "rfna"
end

local function ___bgytl()
	local int_eb = 67
	local tab_jilf = {}
	local _okuab = nil
	local bool_hbdzj = false
end

local function ___jo()
	local bool_mtqzt = false
	local str_fwc = "mwd"
end

local function ___fuc()
	local str_drt = "rpni"
	local tab_vepv = {}
	local _cao = nil
	local int_jzjr = 68
	local _doy = nil
end

local function ___ajtk()
	local tab_qvvwh = {}
	local bool_wers = false
end

local function ___imdwj()
	local tab_pqksj = {}
	local int_kwd = 72
	local tab_wvxg = {}
	local bool_nlj = false
	local tab_svgl = {}
end

local function ___mk()
	local _had = nil
	local str_yzal = "pmme"
	local str_iyheg = "wcalip"
end

local function ___oxbrl()
	local bool_xquuw = false
	local bool_ejd = false
	local _ey = nil
end

local function ___clpbm()
	local int_mce = 15
	local int_qvkra = 87
	local int_jc = 42
	local str_bnk = "izj"
end

local function ___thwt()
	local bool_qopk = false
	local _lgcgg = nil
	local _lj = nil
end

local function ___uiy()
	local _ld = nil
	local str_qu = "qszn"
end

local function ___yuw()
	local tab_xk = {}
	local str_ix = "xaylri"
	local str_ig = "pgs"
	local bool_qy = false
	local int_wmwkd = 11
end

local function ___swt()
	local bool_kj = false
	local _nh = nil
	local bool_pse = false
	local _vaex = nil
end

local function ___yzeep()
	local tab_ifw = {}
	local bool_dx = false
end
local ControllerMix = require("UI/CreatorUI/ControllerMix")
local CreatorUtils = require("UI/CreatorUI/CreatorUtils")


---@class BLNode: Node
local BLNode = class("BLNode", function()
    return cc.Node:create()
end)

function BLNode:ctor()
    ControllerMix:attach(self)
    self:registerScriptHandler(handler(self, self._ScriptHandler))
end

function BLNode:create(...)
    return self.new(...)
end

function BLNode:initButtonList(is_grey)
    if self.uiTbl and self.uiTbl.buttonList then
        local btnList = self.uiTbl.buttonList;
        local node = nil;
        local name = "";
        local callback = nil
        for i = 1, #btnList do
            node = self:getItem(btnList[i].path);
            name = node.name;
			local btnName = bole.underscoreToCamel(name)
            callback = self["on"..btnName.."Clicked"]
            if node and callback then
                if is_grey then
                    bole.ctorUIComponent(node, UIComponent.CommonButton,UIComponent.CommonButton.Enum.ONLY_GRAY)
                end
                self:addTouchEvent(node, handler(self, callback), btnList[i].tag)
            end
        end
    end
end

function BLNode:initButtonListToNode(is_grey)
    if self.node and self.node.uiTbl and self.node.uiTbl.buttonList then
        local btnList = self.node.uiTbl.buttonList;
        local node = nil;
        local name = "";
        local callback = nil
        for i = 1, #btnList do
            node = self.node:getItem(btnList[i].path);
            name = node.name;
			local btnName = bole.underscoreToCamel(name)
            callback = self["on"..btnName.."Clicked"]
            if node and callback then
				if is_grey then
                    bole.ctorUIComponent(node, UIComponent.CommonButton, UIComponent.CommonButton.Enum.ONLY_GRAY)
                end
                self:addTouchEvent(node, handler(self, callback), btnList[i].tag)
            end
        end
    end
end


function BLNode:addTouchEvent( btn, event, param )
	local function btnEvent(sender, eventType)
        if eventType == ccui.TouchEventType.ended then
            btn:setColor(cc.c3b(255, 255, 255))
        	if event then
        		event(param)
        	end
        elseif eventType == ccui.TouchEventType.began then
            btn:setColor(cc.c3b(123, 123, 123))
        elseif eventType == ccui.TouchEventType.canceled then
            btn:setColor(cc.c3b(255, 255, 255))
        elseif eventType == ccui.TouchEventType.moved then
            local point = sender:getTouchMovePosition()
            point = btn:convertToNodeSpace(point)
            local size = btn:getContentSize()
            local rect = cc.rect(0,0,size.width,size.height)
            if cc.rectContainsPoint(rect,point) then
                btn:setColor(cc.c3b(123, 123, 123))
            else
                btn:setColor(cc.c3b(255, 255, 255))
            end  
        end
    end
    btn:addTouchEventListener(btnEvent)
end

-- btn内所有子节点置灰
function BLNode:addTouchEventAllChildrenChange( btn, event, param )
    local function btnEvent(sender, eventType)
        local function changeChild(is_normal)
            for i, child in ipairs(btn:getChildren()) do
                if child.setColor then
                    if is_normal then
                        child:setColor(cc.c3b(255, 255, 255))
                    else
                        child:setColor(cc.c3b(123, 123, 123))
                    end
                end
            end
        end
        if eventType == ccui.TouchEventType.ended then
            btn:setColor(cc.c3b(255, 255, 255))
            changeChild(true)
        	if event then
        		event(param)
        	end
        elseif eventType == ccui.TouchEventType.began then
            btn:setColor(cc.c3b(123, 123, 123))
            changeChild(false)
        elseif eventType == ccui.TouchEventType.canceled then
            btn:setColor(cc.c3b(255, 255, 255))
            changeChild(true)
        elseif eventType == ccui.TouchEventType.moved then
            btn:setColor(cc.c3b(123, 123, 123))
            changeChild(false)
        end
    end
    btn:addTouchEventListener(btnEvent)
end

function BLNode:_ScriptHandler(evt, param)
    if evt == "enter" then
        self:onEnter()

    elseif evt == "exit" then
        self:onExit()

    elseif evt == "cleanup" then
        self:onCleanup()

    elseif evt == "exitTransitionStart" then
        self:onExitTransitionDidStart()

    elseif evt == "enterTransitionFinish" then
        self:onEnterTransitionDidFinish()
    end
end

function BLNode:setVisible(visible)
    if visible ~= self:isVisible() then
        cc.Node.setVisible(self, visible)
        if visible then
            self:onEnable()
        else
            self:onDisable()
        end
    end
    
end

function BLNode:onEnter(...)
end

function BLNode:onEnable(...)
end

function BLNode:onDisable(...)
end

function BLNode:update(...)
    self.__controllerMix:update(...)

end

function BLNode:onExit(...)

end

function BLNode:onExitTransitionDidStart(...)
    -- body
end

function BLNode:onEnterTransitionDidFinish(...)
    -- body
end

function BLNode:startUpdate(...)
    self:scheduleUpdateWithPriorityLua(handler(self, self.update), 0)
end

function BLNode:getItem(path)
    return CreatorUtils.getItemByPath(self, path)
end

function BLNode:stopUpdate()
    self:unscheduleUpdate()
end

function BLNode:onCleanup()
    self:removeAllController()
end

return BLNode

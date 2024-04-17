local ___str_xpjc = "rpml"
local ___str_nz = "uaffd"
local ___tab_jhw = {}
local ____xie = nil
local ___tab_eiqwq = {}
local ___bool_nzoao = false
local ____hm = nil
local ___tab_zrtcj = {}
local ___int_ajpfo = 62
local ___int_bxgi = 6
local ___str_ejs = "clmoq"
local ___bool_cj = false
local ___tab_xeia = {}
local ___tab_nepil = {}
local ___tab_uio = {}
local ___tab_ah = {}
local ___bool_vxzlh = false
local ___bool_ajmzg = false
local ___int_vlo = 86
local ___int_zbaj = 58
local ___int_wejpd = 66
local ___bool_kj = false
local ___tab_gm = {}
local ___str_aplm = "fsvd"
local ___tab_ed = {}
local ___int_jurn = 38
local ___str_ot = "cphvio"
local ___str_kl = "ygv"
local ___tab_yn = {}
local ___tab_rhk = {}

local function ___notf()
	local tab_vder = {}
	local bool_nbps = false
	local tab_xo = {}
	local str_zbrsa = "thw"
	local str_wc = "uwp"
end

local function ___bk()
	local int_lzrge = 69
	local tab_zds = {}
	local int_jqmb = 6
end

local function ___zdj()
	local str_ruru = "cbaukx"
	local _txhsd = nil
	local tab_sj = {}
	local tab_lokx = {}
end

local function ___qwrz()
	local tab_sbo = {}
	local _sy = nil
	local str_rs = "cdid"
end

local function ___jdus()
	local _geo = nil
	local bool_tybtq = false
	local int_rj = 99
end

local function ___lxqc()
	local bool_jx = false
	local bool_hj = false
	local _ypk = nil
	local bool_is = false
end

local function ___tst()
	local str_chx = "nexr"
	local str_ssd = "vpbizn"
	local bool_jyz = false
end

local function ___ylf()
	local bool_hnlqz = false
	local int_fk = 38
	local bool_ml = false
	local int_xmwp = 37
end

local function ___hiw()
	local _fyu = nil
	local _ybwe = nil
	local int_fbrku = 4
	local str_giu = "mbsb"
	local str_oj = "uzkod"
end

local function ___bpsa()
	local tab_er = {}
	local bool_tjogd = false
end

local function ___xplh()
	local _subtf = nil
	local _dp = nil
	local int_uob = 54
	local _ogmw = nil
	local int_ur = 8
end

local function ___hw()
	local str_qtk = "szqjcw"
	local str_mckli = "xkq"
end

local function ___psz()
	local bool_luy = false
	local tab_nbpr = {}
end

local function ___wc()
	local tab_sr = {}
	local bool_pzwcd = false
	local str_is = "qaigji"
	local _acs = nil
	local str_prul = "nqbs"
end

local function ___wy()
	local _tu = nil
	local str_ujwka = "xwt"
	local _pflvc = nil
end

local function ___zryu()
	local _ohw = nil
	local str_bf = "fqa"
	local bool_nuxqz = false
	local int_lu = 99
end

local function ___mr()
	local str_rd = "urvqh"
	local _dbhx = nil
	local bool_wo = false
	local bool_efdwh = false
end

local function ___irif()
	local tab_omzzk = {}
	local tab_ey = {}
	local int_bdoh = 72
	local bool_dhr = false
	local tab_xoptv = {}
end

local function ___dm()
	local str_cxjgl = "kwdr"
	local int_obeh = 28
	local tab_knheo = {}
	local _dqq = nil
end
local getLogoSpinePath = function (themeid)
	local path = "theme_loading/theme" .. themeid .. "/logo/spine/logo/spine"
	return path
end

local getImagePath = function (themeid, name)
	local path = "theme_loading/theme" .. themeid .. "/logo/" .. name .. ".png"
	return path
end

local isValidNode = function (node)
	return not tolua.isnull(node)
end

local LobbyTheme = class("LobbyTheme",function() return cc.Node:create() end)

function LobbyTheme:ctor(themeid)
    self.themeid = themeid or 188
	self.node = cc.Node:create()
	self:addChild(self.node)

	self:configNode(self.node)
end

function LobbyTheme:configNode(node)
	if not isValidNode(node) then
		return
	end

	local bg_path = getImagePath(self.themeid, "logo")
	if cc.FileUtils:getInstance():isFileExist(bg_path) then
		local sprite = cc.Sprite:create(bg_path)
		sprite:setPosition(cc.p(0, 0))
		sprite:setLocalZOrder(1)
		node:addChild(sprite)
	end

	local btn_path = "commonpics/kong.png"
	if cc.FileUtils:getInstance():isFileExist(btn_path) then
		local function btnEvent(sender, eventType)
			if eventType == ccui.TouchEventType.ended then
				if isValidNode(self.btn_touch) then
                    self.btn_touch:setTouchEnabled(false)

                    require "UI/PlayScene"
                    local play = PlayScene.new(self.themeid, "", nil, nil)
                    bole.scene = play
                    -- play:setJackpotBet(bet)
                    play:run()
                    play:setName("PlayScene")

				end
			end
		end
		local base_width = 10
		local target_width = 255
		local target_height = 255
		local button = ccui.Button:create()
		button:loadTextures(btn_path, btn_path, btn_path)
		button:setPosition(cc.p(0, 0))
		button:setScaleX(target_width / base_width)
		button:setScaleY(target_height / base_width)
		button:setLocalZOrder(3)
		button:addTouchEventListener(btnEvent)
        button:setTouchEnabled(true)

		node:addChild(button, 3)
		self.btn_touch = button
	end

	local spine_path = getLogoSpinePath(self.themeid)
	if cc.FileUtils:getInstance():isFileExist(spine_path .. ".atlas") then
		local logo_spine = sp.SkeletonAnimation:createWithJsonFile(spine_path .. ".json", spine_path .. ".atlas", 1)
		if logo_spine then
			logo_spine:setPosition(0, 0)
			logo_spine:setAnimation(0, "animation", true) 
			node:addChild(logo_spine)
			logo_spine:setLocalZOrder(3)
		end
	end
end

return LobbyTheme

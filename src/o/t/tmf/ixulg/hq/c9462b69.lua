local ___int_mmjtr = 67
local ____qrf = nil
local ___tab_imwql = {}
local ___bool_zue = false
local ___str_fv = "niqeh"
local ___int_at = 14
local ___int_qwwli = 86
local ___tab_jdw = {}
local ___tab_qz = {}
local ___int_ucn = 37
local ___str_gyen = "kmv"
local ___str_fe = "svkc"
local ___tab_vxsmu = {}
local ___int_afapv = 14
local ___str_vua = "eaft"
local ___int_rduvt = 73
local ___str_fzi = "cpgp"
local ___bool_ahhe = false
local ____zx = nil
local ___tab_dqy = {}
local ___str_rzz = "merplx"
local ____vh = nil
local ___bool_wq = false
local ____ad = nil
local ___bool_bsfz = false
local ___tab_xvtv = {}
local ___int_tc = 24
local ___tab_lddq = {}

local function ___tq()
	local bool_vqk = false
	local _biri = nil
end

local function ___ns()
	local tab_gmmm = {}
	local str_tfurf = "wklcw"
	local tab_mclx = {}
	local _httx = nil
end

local function ___qbxxd()
	local tab_jjo = {}
	local str_csh = "lsj"
end

local function ___sk()
	local str_gd = "zqcm"
	local tab_xlp = {}
	local str_sl = "bgke"
	local tab_ul = {}
	local int_uwqbe = 2
end

local function ___rdqgf()
	local tab_bvk = {}
	local _vrw = nil
end

local function ___ci()
	local int_jm = 64
	local int_ucmy = 18
	local tab_wlql = {}
	local _nisjp = nil
	local tab_uaacf = {}
end

local function ___pzccb()
	local _kx = nil
	local str_xj = "kddt"
end

local function ___jjflf()
	local int_pocai = 88
	local tab_sp = {}
	local int_ke = 43
end

local function ___teqn()
	local int_pw = 31
	local tab_azqz = {}
end

local function ___xilqv()
	local _evkw = nil
	local _erfw = nil
end

local function ___hsfet()
	local int_shwwv = 89
	local str_zq = "obg"
	local bool_opkq = false
	local str_cil = "cuyna"
end

local function ___frld()
	local str_vg = "xdyxva"
	local bool_zv = false
	local int_vekz = 98
end

local function ___epppa()
	local int_iddvn = 6
	local _xd = nil
end

local function ___qpi()
	local str_gqkl = "lott"
	local _ete = nil
	local int_cfrx = 5
end

local function ___vdq()
	local str_qp = "pfsl"
	local str_trz = "jpqpyp"
	local int_ou = 37
end

local function ___dbc()
	local str_lejbb = "fmqac"
	local tab_sgovz = {}
	local _hof = nil
	local tab_ikp = {}
	local int_bdt = 12
end
SETUP_DATA_KEY = "setup_data"

SettingControl = class("SettingControl")

local SETTING = 
{
	KEY_SOUND         = "sound",
	KEY_MUSIC         = "music",
}


local SOUND_STATUS =
{
	KEY_ON = 1,
	KEY_OFF = 0
}

local MUSIC_STATUS =
{
	KEY_ON = 1,
	KEY_OFF = 0
}

function SettingControl:ctor()
    self:initSettingStatus()
	self:reset()
end

function SettingControl:reset()
	self.setupData      = {}
end

function SettingControl:initSettingStatus( ... )
    self.tagSound        = cc.UserDefault:getInstance():getIntegerForKey(SETTING.KEY_SOUND, 1)
    self.tagMusic        = cc.UserDefault:getInstance():getIntegerForKey(SETTING.KEY_MUSIC, 1)
end

function SettingControl:getInstance( ... )
	if not self._instance then
		self._instance = SettingControl.new()
	end
	return self._instance
end

---------------------------  设置数据  ---------------------------------

-- 从本地数据获取设置数据
function SettingControl:getSetupToLocal()
    local adData = cc.UserDefault:getInstance():getStringForKey(SETUP_DATA_KEY)
    if adData ~= "" then
        self.setupData = json.decode(adData)
    else
        self.setupData = {
            music   = 0,
            sound   = 0,
        }
        self:saveLocalSetupData()
    end

    if  self.setupData.music == 0 then
        SettingControl:getInstance():setSettingStatus("music",  1)
    else
        SettingControl:getInstance():setSettingStatus("music",  0)
    end

    if  self.setupData.sound == 0 then
        SettingControl:getInstance():setSettingStatus("sound", 1 )
    else
        SettingControl:getInstance():setSettingStatus("sound", 0)
    end

    if self.setupData.music == 0 then
        cc.SimpleAudioEngine:getInstance():setMusicVolume(1)
    else
        cc.SimpleAudioEngine:getInstance():setMusicVolume(0)
    end
    print(self.setupData.music, "music")
end

-- 将数据保存到本地缓存
function SettingControl:saveLocalSetupData()
    if next(self.setupData) then
        local dataStr = json.encode(self.setupData)
        cc.UserDefault:getInstance():setStringForKey(SETUP_DATA_KEY, dataStr)
    end
end

-- 音乐是否打开
function SettingControl:isMusicOpen()
    return self.setupData.music == 0
end

-- 刷新音乐开关
function SettingControl:updateMusicOpen(state)
    state = state or 0
    self.setupData.music = state
    self:saveLocalSetupData() 
end

-- 音效是否打开
function SettingControl:isSoundOpen()
    return self.setupData.sound == 0
end

-- 刷新音效开关
function SettingControl:updateSoundOpen(state)
    state = state or 0
    self.setupData.sound = state
    self:saveLocalSetupData() 
end


function SettingControl:setSettingStatus(key, value)
	if key == SETTING.KEY_SOUND then
		if value == SOUND_STATUS.KEY_OFF then
			AudioControl:setAllSoundVolume(0)
		elseif value == SOUND_STATUS.KEY_ON then
			AudioControl:setAllSoundVolume(1)
		end
		bole.refresh_G_SOUND_MUTE()
	elseif key == SETTING.KEY_MUSIC then
		if value == MUSIC_STATUS.KEY_OFF then
			AudioControl:setAllMusicVolume(0)
		elseif value == MUSIC_STATUS.KEY_ON then
			AudioControl:setAllMusicVolume(1)
		end
		bole.refresh_G_MUSIC_MUTE()
    end
	-- EventCenter:pushEvent(EVENTNAMES.SETTING.UPDATE_STATUS, key)
end

function SettingControl:getSettingStatus( key )
    if key == SETTING.KEY_SOUND then
        return self.tagSound
    elseif key == SETTING.KEY_MUSIC then
        return self.tagMusic
    end
end
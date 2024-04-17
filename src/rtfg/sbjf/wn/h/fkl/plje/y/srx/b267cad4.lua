local ___int_fihps = 88
local ___tab_jdkrw = {}
local ___int_pm = 5
local ___tab_ilsc = {}
local ___str_urvgl = "wpo"
local ___bool_ehcd = false
local ____vfdcx = nil
local ___bool_uyufj = false
local ____sxy = nil
local ___int_rgvs = 81
local ___str_awjeo = "dpvz"
local ___tab_uh = {}
local ___str_wrdhz = "waymft"
local ____vyj = nil
local ___bool_mqymg = false
local ___int_nirov = 35

local function ___xlnr()
	local bool_oyzd = false
	local bool_wi = false
	local _cfhrt = nil
	local str_wtsyu = "cgbv"
	local _fgyl = nil
end

local function ___sd()
	local _rdd = nil
	local tab_yvawe = {}
	local int_ktq = 98
end

local function ___plyth()
	local int_tpnv = 71
	local tab_swl = {}
	local bool_qrpeh = false
	local str_wpe = "ycerl"
end

local function ___nv()
	local tab_yu = {}
	local str_gxv = "irzys"
	local str_nssdo = "ggya"
end

local function ___en()
	local int_njol = 14
	local int_ma = 25
	local tab_svwqr = {}
	local _ljqpe = nil
	local str_vt = "ptu"
end

local function ___ejrm()
	local tab_hnl = {}
	local bool_xk = false
	local _bqiej = nil
	local _ogzw = nil
	local tab_qq = {}
end

local function ___wj()
	local int_cvr = 49
	local _kih = nil
end

local function ___bmz()
	local bool_cyoz = false
	local str_nyh = "esi"
	local tab_yn = {}
	local tab_mjq = {}
	local int_mr = 19
end

local function ___iksp()
	local bool_gfaq = false
	local tab_fbmvh = {}
	local int_li = 15
end

local function ___bde()
	local tab_kir = {}
	local str_ff = "gifzq"
	local int_oda = 87
	local tab_ksmob = {}
end

local function ___dcc()
	local bool_jt = false
	local bool_jvgw = false
	local tab_knowx = {}
	local str_zy = "pljnj"
	local bool_vlf = false
end

local function ___dqdib()
	local tab_bvcu = {}
	local bool_tq = false
	local bool_as = false
end

local function ___uf()
	local int_cdcq = 19
	local bool_cs = false
	local bool_fpexp = false
	local int_ere = 44
	local int_ho = 79
end

local function ___zxrp()
	local str_geni = "axrsz"
	local str_yv = "etws"
	local str_ktb = "awmr"
	local bool_bqpd = false
	local str_ohl = "cjsnb"
end

local function ___phj()
	local str_yhd = "vwj"
	local _vkbaq = nil
	local tab_olvnt = {}
	local int_bd = 10
end

local function ___alfmd()
	local _fi = nil
	local _orsui = nil
	local str_gufz = "epa"
	local tab_ibw = {}
end

local function ___kw()
	local _ci = nil
	local tab_szo = {}
end

local function ___nhsf()
	local tab_oj = {}
	local tab_afbh = {}
end

local function ___oq()
	local tab_oqzoo = {}
	local str_xs = "xugicy"
	local int_syzht = 36
	local str_ofm = "xwnw"
	local int_wro = 85
end

local function ___yn()
	local tab_uzhkh = {}
	local bool_kp = false
	local str_bwiv = "jov"
	local _al = nil
	local str_phqcu = "zdm"
end
--[[

Copyright (c) 2014-2017 Chukong Technologies Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

]]

local audio = {}

local engine = cc.SimpleAudioEngine:getInstance()

function audio.getMusicVolume()
    local volume = engine:getMusicVolume()
    if DEBUG > 1 then
        printf("[audio] getMusicVolume() - volume: %0.2f", volume)
    end
    return volume
end

function audio.setMusicVolume(volume)
    volume = checknumber(volume)
    if DEBUG > 1 then
        printf("[audio] setMusicVolume() - volume: %0.2f", volume)
    end
    engine:setMusicVolume(volume)
end

function audio.preloadMusic(filename)
    assert(filename, "audio.preloadMusic() - invalid filename")
    if DEBUG > 1 then
        printf("[audio] preloadMusic() - filename: %s", tostring(filename))
    end
    engine:preloadMusic(filename)
end

function audio.playMusic(filename, isLoop)
    assert(filename, "audio.playMusic() - invalid filename")
    if type(isLoop) ~= "boolean" then isLoop = true end

    audio.stopMusic()
    if DEBUG > 1 then
        printf("[audio] playMusic() - filename: %s, isLoop: %s", tostring(filename), tostring(isLoop))
    end
    engine:playMusic(filename, isLoop)
end

function audio.stopMusic(isReleaseData)
    isReleaseData = checkbool(isReleaseData)
    if DEBUG > 1 then
        printf("[audio] stopMusic() - isReleaseData: %s", tostring(isReleaseData))
    end
    engine:stopMusic(isReleaseData)
end

function audio.pauseMusic()
    if DEBUG > 1 then
        printf("[audio] pauseMusic()")
    end
    engine:pauseMusic()
end

function audio.resumeMusic()
    if DEBUG > 1 then
        printf("[audio] resumeMusic()")
    end
    engine:resumeMusic()
end

function audio.rewindMusic()
    if DEBUG > 1 then
        printf("[audio] rewindMusic()")
    end
    engine:rewindMusic()
end

function audio.isMusicPlaying()
    local ret = engine:isMusicPlaying()
    if DEBUG > 1 then
        printf("[audio] isMusicPlaying() - ret: %s", tostring(ret))
    end
    return ret
end

function audio.getSoundsVolume()
    local volume = engine:getEffectsVolume()
    if DEBUG > 1 then
        printf("[audio] getSoundsVolume() - volume: %0.1f", volume)
    end
    return volume
end

function audio.setSoundsVolume(volume)
    volume = checknumber(volume)
    if DEBUG > 1 then
        printf("[audio] setSoundsVolume() - volume: %0.1f", volume)
    end
    engine:setEffectsVolume(volume)
end

function audio.playSound(filename, isLoop)
    if not filename then
        printError("audio.playSound() - invalid filename")
        return
    end
    if type(isLoop) ~= "boolean" then isLoop = false end
    if DEBUG > 1 then
        printf("[audio] playSound() - filename: %s, isLoop: %s", tostring(filename), tostring(isLoop))
    end
    return engine:playEffect(filename, isLoop)
end

function audio.pauseSound(handle)
    if not handle then
        printError("audio.pauseSound() - invalid handle")
        return
    end
    if DEBUG > 1 then
        printf("[audio] pauseSound() - handle: %s", tostring(handle))
    end
    engine:pauseEffect(handle)
end

function audio.pauseAllSounds()
    if DEBUG > 1 then
        printf("[audio] pauseAllSounds()")
    end
    engine:pauseAllEffects()
end

function audio.resumeSound(handle)
    if not handle then
        printError("audio.resumeSound() - invalid handle")
        return
    end
    if DEBUG > 1 then
        printf("[audio] resumeSound() - handle: %s", tostring(handle))
    end
    engine:resumeEffect(handle)
end

function audio.resumeAllSounds()
    if DEBUG > 1 then
        printf("[audio] resumeAllSounds()")
    end
    engine:resumeAllEffects()
end

function audio.stopSound(handle)
    if not handle then
        printError("audio.stopSound() - invalid handle")
        return
    end
    if DEBUG > 1 then
        printf("[audio] stopSound() - handle: %s", tostring(handle))
    end
    engine:stopEffect(handle)
end

function audio.stopAllSounds()
    if DEBUG > 1 then
        printf("[audio] stopAllSounds()")
    end
    engine:stopAllEffects()
end
audio.stopAllEffects = audio.stopAllSounds

function audio.preloadSound(filename)
    if not filename then
        printError("audio.preloadSound() - invalid filename")
        return
    end
    if DEBUG > 1 then
        printf("[audio] preloadSound() - filename: %s", tostring(filename))
    end
    engine:preloadEffect(filename)
end

function audio.unloadSound(filename)
    if not filename then
        printError("audio.unloadSound() - invalid filename")
        return
    end
    if DEBUG > 1 then
        printf("[audio] unloadSound() - filename: %s", tostring(filename))
    end
    engine:unloadEffect(filename)
end

return audio

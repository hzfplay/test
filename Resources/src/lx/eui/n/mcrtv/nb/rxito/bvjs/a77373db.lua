local ___str_ivgj = "rfgcys"
local ___int_jod = 21
local ___str_mkekl = "sjyms"
local ___tab_thfm = {}
local ____ij = nil
local ___tab_lcvyu = {}
local ____knzok = nil
local ___bool_pu = false
local ___tab_iefjz = {}
local ___bool_yo = false
local ___int_brlmn = 72
local ___int_tj = 10
local ____vl = nil
local ___tab_mqojh = {}
local ___bool_tbdm = false
local ___str_jut = "yzlus"
local ___str_cur = "oeql"
local ____zwz = nil
local ____oosmi = nil
local ___str_slapx = "ifkft"
local ___bool_irx = false
local ___tab_qz = {}
local ___int_jbijk = 7
local ___int_vws = 83
local ___int_qbg = 94
local ___bool_juran = false
local ___str_rtz = "naxe"
local ____uzkib = nil
local ___str_qxoq = "rzhi"

local function ___tfv()
	local str_wqs = "ust"
	local _lqci = nil
	local str_etrhn = "pluqeg"
	local _mbg = nil
	local bool_fj = false
end

local function ___nydsb()
	local str_du = "used"
	local int_kgs = 66
	local bool_nsn = false
	local _nct = nil
end

local function ___po()
	local bool_qyhv = false
	local _ypwh = nil
	local str_ve = "hlov"
end

local function ___mo()
	local bool_mn = false
	local _sun = nil
	local bool_db = false
end

local function ___ajjd()
	local _rygs = nil
	local bool_jsk = false
	local tab_ffgkq = {}
	local _jjbi = nil
	local tab_qgo = {}
end

local function ___cwq()
	local int_mpmk = 1
	local int_obsmu = 47
	local tab_akq = {}
	local int_txjy = 72
end

local function ___ilk()
	local _mjh = nil
	local int_xd = 42
	local _fdgb = nil
end

local function ___qkvgf()
	local tab_ifmuu = {}
	local int_lwzh = 85
	local _evwko = nil
	local tab_vjfd = {}
	local _esrr = nil
end

local function ___gw()
	local _sms = nil
	local str_mm = "rpvgrn"
	local _dgq = nil
	local _xbii = nil
	local int_ptrw = 66
end

local function ___nwnh()
	local tab_nmrch = {}
	local bool_qh = false
	local bool_bz = false
end

local function ___sf()
	local int_izk = 18
	local bool_mzeh = false
	local bool_erq = false
	local _mart = nil
	local str_xdtr = "ayf"
end

local function ___ogz()
	local _fg = nil
	local str_uo = "ihfz"
	local str_nkoed = "lezgfz"
end

local function ___bc()
	local tab_bka = {}
	local int_oirz = 47
end

local function ___jwnvy()
	local tab_mncal = {}
	local int_pdhqj = 36
	local _lvbme = nil
end

local function ___mtpmz()
	local str_pminb = "uug"
	local bool_iksd = false
	local str_tngvz = "ylqmay"
end

local function ___vl()
	local bool_rvdq = false
	local tab_gcwt = {}
	local _tgxa = nil
end

local function ___kp()
	local bool_kxbkh = false
	local str_vfw = "vvunkw"
	local int_np = 81
	local tab_vaxl = {}
	local int_dv = 26
end

local function ___uj()
	local str_mwk = "xofgpi"
	local int_zigri = 75
	local int_gqfjv = 20
end

local function ___jmkdd()
	local _zmd = nil
	local _azel = nil
end

local function ___swal()
	local int_fojfw = 2
	local int_zxu = 62
	local bool_gqld = false
	local bool_ij = false
end

local function ___ad()
	local tab_stxuj = {}
	local bool_wedg = false
	local int_tnqla = 68
end

local function ___hj()
	local tab_bhf = {}
	local bool_lu = false
	local _zmnz = nil
end

local function ___oat()
	local _owkc = nil
	local bool_fb = false
	local str_obcim = "liifo"
	local int_aq = 86
	local tab_vvwgz = {}
end

local function ___ypgmt()
	local str_ajcc = "cupy"
	local bool_pdhvd = false
end

local function ___jnngc()
	local bool_wcem = false
	local tab_bdct = {}
	local str_dbep = "vtitd"
end

local function ___ipg()
	local str_xlo = "adltn"
	local str_fm = "ioruxw"
	local int_fxb = 64
	local str_eyz = "ecdra"
	local bool_fhmxf = false
end
ShaderUtil={}
local class=ShaderUtil
local greyvsh=
[[attribute vec4 a_position;
attribute vec2 a_texCoord;
attribute vec4 a_color;

#ifdef GL_ES
varying lowp vec4 v_fragmentColor;
varying mediump vec2 v_texCoord;
#else
varying vec4 v_fragmentColor;
varying vec2 v_texCoord;
#endif

void main()
{
    gl_Position = CC_PMatrix * a_position;
    v_fragmentColor = a_color;
    v_texCoord = a_texCoord;
}]]
local greyfsh=
[[
#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    vec4 c = texture2D(CC_Texture0, v_texCoord);
    gl_FragColor.xyz = vec3(0.2126*c.r + 0.7152*c.g + 0.0722*c.b);
    gl_FragColor.w = c.w;
}
]]

local darkfsh=
[[
#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

void main(void)
{
    vec4 c = texture2D(CC_Texture0, v_texCoord);
    gl_FragColor.xyz = vec3(0.3*c.r, 0.3*c.g, 0.3*c.b);
    gl_FragColor.w = c.w;
}
]]

-- 初始位置直线方程 Ax+By+C=0
-- dx, dy 每秒直线移动位移
-- duration 周期
-- radius 半径
-- shineFactor 亮度增加倍数
local swipefsh=
[[
#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;

uniform float scene_time;
uniform float opacity;

void main(void)
{
    float A = %f;
    float B = %f;
    float C = %f;
    float dx = %f;
    float dy = %f;
    float radius = %f;
    float shineFactor = %f;

    float time = scene_time;
    // new line formula : A * (x - dx*time) + B * (y - dy*time) + C = 0
    C = -A * dx * time - B * dy * time + C;

    float x = v_texCoord.x;
    float y = v_texCoord.y;
    float dist = abs(A*x + B*y + C) / sqrt(A*A + B*B);

    vec4 c = texture2D(CC_Texture0, v_texCoord);
    float multi = 1.0;
    float extraMulti = 0.0;
    float extra = 0.0;
    float factor = 1.0 - dist / radius;
    if (dist < radius) {
        extraMulti = (shineFactor - 1.0) * factor * factor * factor;
        if (c.w > 0.5)
            extra = extraMulti * 0.2;
        multi = 1.0 + extraMulti;
        gl_FragColor.xyz = vec3(multi*c.r+extra, multi*c.g+extra, multi*c.b+extra);
    } else
        gl_FragColor.xyz = vec3(c.r, c.g, c.b);
        // gl_FragColor.xyz = vec3(1, 1, 1);
    gl_FragColor.w = c.w * opacity;

    // floor() in android shader might cause some problem
}
]]

-- line formula : Ax + By + C = 0
-- scheduleNode 主要针对button，定时对象和texture对象不一致，注意一个问题，如果要换texture，记得重新调用此函数，否则会出错
-- xOy  move along x-axis or y-axis, true means x
-- d_xOy  speed, 1 means 1 run per second
function ShaderUtil:setSwipeShader (sprite, scheduleNode, A, B, C, xOy, d_xOy, duration, radius, shineFactor)
    scheduleNode = scheduleNode or sprite
    A = A or 1
    B = B or 1
    C = C or 0.3
    if nil == xOy then xOy = true end
    d_xOy = d_xOy or 1
    dx = xOy and d_xOy or 0
    dy = xOy and 0 or d_xOy
    -- radius = xOy and radius / sz.width or radius / sz.height
    duration = duration or 5
    radius = radius or 0.18
    shineFactor = shineFactor or 2

    local beginTime = cc.utils:gettime()

    local fsh = string.format(swipefsh, A, B, C, dx, dy, radius, shineFactor)
    sprite:setGLProgramState(ShaderUtil:getShader(fsh, greyvsh))

    -- TODO, what if duplicate
    -- 注意sprite可能不在了
    local function _gameLogic (dt)
        local t = cc.utils:gettime() - beginTime
        t = t % duration
        -- sprite:getGLProgramState():setUniformFloat('scene_time', cnt * 0.01)
        sprite:getGLProgramState():setUniformFloat('scene_time', t)
        -- 兼容fadeIn/Out的动画，注意，用的是scheduleNode的透明度
        sprite:getGLProgramState():setUniformFloat('opacity', scheduleNode:getOpacity() / 256)
        -- local loc = gl.getUniformLocation(sprite:getGLProgram(), 'scene_time')
        -- sprite:getGLProgram():setUniformLocationF32(loc, t)
    end
    scheduleNode:scheduleUpdateWithPriorityLua(_gameLogic, 0)

    sprite:getGLProgramState():setUniformFloat('scene_time', 0)
end


function class:getShader(fragmentString,vertexString)
    local fileUtiles = cc.FileUtils:getInstance()
    local fragSource = fragmentString
    local vertSource = vertexString
    local glProgram = cc.GLProgram:createWithByteArrays(vertSource, fragSource)
    glProgram:link()
    glProgram:updateUniforms()
    local glprogramstate = cc.GLProgramState:getOrCreateWithGLProgram(glProgram)
    glprogramstate:setUniformFloat('scene_time', 0.5)
    return glprogramstate
end

function class:setGreyShader(sprite)
	 sprite:setGLProgramState(self:getShader(greyfsh,greyvsh))
end

function class:setDarkShader(sprite)
     sprite:setGLProgramState(self:getShader(darkfsh,greyvsh))
end

function class:cleanShaderForSprite(sprite)
    sprite:setGLProgramState(cc.GLProgramState:getOrCreateWithGLProgramName("ShaderPositionTextureColor_noMVP"))

end


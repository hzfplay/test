local ___int_pfhn = 51
local ____odke = nil
local ___str_curl = "dsfmg"
local ___bool_pxl = false
local ___tab_pvac = {}
local ____nzkd = nil
local ____ffuuz = nil
local ___int_vq = 57
local ___tab_ult = {}
local ___tab_cp = {}
local ___int_zldga = 24
local ___int_bhx = 51
local ___int_puzqy = 36
local ___int_gowbn = 54
local ___bool_vwe = false
local ___bool_lyr = false
local ___int_qn = 31
local ___str_jgc = "ausq"
local ___tab_ier = {}
local ____ctplk = nil
local ___tab_twcd = {}

local function ___anb()
	local str_ej = "ors"
	local _gadn = nil
	local int_bt = 57
	local bool_ja = false
	local int_luodp = 89
end

local function ___jp()
	local str_ctjtu = "xxvqz"
	local int_dbo = 13
end

local function ___rjxwo()
	local str_xoh = "trdw"
	local int_vpzrd = 10
	local int_ylcfp = 72
end

local function ___zzh()
	local str_qiir = "zztlw"
	local tab_tv = {}
	local tab_kk = {}
	local str_wedu = "vcxb"
end

local function ___fdket()
	local tab_eh = {}
	local int_zn = 6
	local str_raxhl = "joxa"
	local _nsnh = nil
	local _jf = nil
end

local function ___quq()
	local str_jldr = "hxdui"
	local bool_xcn = false
	local _pepm = nil
	local _eu = nil
	local str_ppduu = "owkuc"
end

local function ___xq()
	local bool_agn = false
	local bool_dsbjj = false
	local str_cys = "dnzcq"
end

local function ___uskz()
	local tab_dyr = {}
	local str_jx = "lmrsr"
end

local function ___idi()
	local bool_ncm = false
	local bool_qj = false
end

local function ___hbsmf()
	local str_dzz = "bvw"
	local str_qheyk = "fvsb"
end

local function ___iyon()
	local tab_jtb = {}
	local _yazil = nil
	local bool_rlwyi = false
	local int_ki = 7
end

local function ___eigff()
	local _fx = nil
	local tab_hwzq = {}
	local int_ajd = 94
	local _fvfab = nil
end

local function ___kpx()
	local int_qh = 49
	local tab_vmnpo = {}
	local tab_bhxf = {}
	local int_kjqjt = 36
	local _dgcic = nil
end

local function ___hld()
	local str_oewa = "dvk"
	local int_hcfj = 87
	local str_ngdb = "xoy"
end

local function ___zsnrc()
	local int_wabgd = 62
	local tab_lnj = {}
	local bool_hzqtk = false
end

local function ___hwahg()
	local _ellq = nil
	local int_hu = 75
end

local function ___pqzzp()
	local tab_ani = {}
	local str_arqzj = "ptkf"
	local str_hsrrm = "tqmcl"
end

local function ___stl()
	local tab_gtxo = {}
	local str_uf = "dduzu"
	local int_cggzm = 53
end

local function ___mfnj()
	local tab_uppfr = {}
	local tab_ldn = {}
	local bool_nykk = false
	local _mz = nil
end

local function ___aw()
	local _aes = nil
	local _qoana = nil
end

local function ___fjslq()
	local _guhds = nil
	local bool_oqb = false
	local tab_tyxi = {}
	local bool_ntyw = false
	local str_myd = "wmxhb"
end

local function ___qufx()
	local _vbvjh = nil
	local tab_py = {}
	local _jmhx = nil
	local _tpap = nil
	local _czf = nil
end

local function ___ygca()
	local _xm = nil
	local _ncvh = nil
	local tab_yae = {}
	local tab_bfvt = {}
	local int_dhvcr = 89
end

if not gl then return end

--Create functions
function  gl.createTexture()
    local retTable = {}
    retTable.texture_id = gl._createTexture()
    return retTable
end

function gl.createBuffer()
    local retTable = {}
    retTable.buffer_id = gl._createBuffer()
    return retTable
end

function gl.createRenderbuffer()
    local retTable = {}
    retTable.renderbuffer_id = gl._createRenderuffer()
    return retTable
end

function gl.createFramebuffer( )
    local retTable = {}
    retTable.framebuffer_id = gl._createFramebuffer()
    return retTable
end

function gl.createProgram()
    local retTable = {}
    retTable.program_id = gl._createProgram()
    return retTable
end

function gl.createShader(shaderType)
    local retTable = {}
    retTable.shader_id = gl._createShader(shaderType)
    return retTable
end

--Delete Fun
function gl.deleteTexture(texture)
    local texture_id = 0
    if "number" == type(texture) then
        texture_id = texture
    elseif "table" == type(texture) then
        texture_id = texture.texture_id
    end
    gl._deleteTexture(texture_id)
end

function gl.deleteBuffer(buffer)
    local buffer_id = 0
    if "number" == type(buffer) then
        buffer_id = buffer
    elseif "table" == type(buffer) then
        buffer_id = buffer.buffer_id
    end
    gl._deleteBuffer(buffer_id)
end

function gl.deleteRenderbuffer(buffer)
    local renderbuffer_id = 0
    if "number" == type(buffer) then
        renderbuffer_id = buffer
    elseif "table" == type(buffer) then
        renderbuffer_id = buffer.renderbuffer_id
    end
    gl._deleteRenderbuffer(renderbuffer_id)
end

function gl.deleteFramebuffer(buffer)
    local framebuffer_id = 0
    if "number" == type(buffer) then
        framebuffer_id = buffer
    elseif "table" == type(buffer) then
        framebuffer_id = buffer.framebuffer_id
    end
    gl._deleteFramebuffer(framebuffer_id)
end

function gl.deleteProgram( program )
    local program_id = 0
    if "number" == type(buffer) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    gl._deleteProgram(program_id)
end

function gl.deleteShader(shader)
    local shader_id = 0
    if "number" == type(shader) then
        shader_id = shader
    elseif "table" == type(shader) then
        shader_id = shader.shader_id
    end

    gl._deleteShader(shader_id)
end

--Bind Related
function gl.bindTexture(target, texture)
    local texture_id = 0
    if "number" == type(texture) then
        texture_id = texture
    elseif "table" == type(texture) then
        texture_id = texture.texture_id
    end

    gl._bindTexture(target,texture_id)
end

function gl.bindBuffer( target,buffer )
    local buffer_id = 0
    if "number" == type(buffer) then
        buffer_id = buffer
    elseif "table" == type(buffer) then
        buffer_id = buffer.buffer_id
    end

    gl._bindBuffer(target, buffer_id)
end

function gl.bindRenderBuffer(target, buffer)
    local buffer_id = 0

    if "number" == type(buffer) then
        buffer_id = buffer;
    elseif "table" == type(buffer) then
        buffer_id = buffer.buffer_id
    end

    gl._bindRenderbuffer(target, buffer_id)
end

function gl.bindFramebuffer(target, buffer)
    local buffer_id = 0

    if "number" == type(buffer) then
        buffer_id = buffer
    elseif "table" == type(buffer) then
        buffer_id = buffer.buffer_id
    end

    gl._bindFramebuffer(target, buffer_id)
end

--Uniform related
function gl.getUniform(program, location)
    local program_id = 0
    local location_id = 0

    if "number" == type(program) then
        program_id = program
    else
        program_id = program.program_id
    end

    if "number" == type(location) then
        location_id = location
    else
        location_id = location.location_id
    end

    return gl._getUniform(program_id, location_id)
end

--shader related
function gl.compileShader(shader)
    gl._compileShader( shader.shader_id)
end

function gl.shaderSource(shader, source)
    gl._shaderSource(shader.shader_id, source)
end

function gl.getShaderParameter(shader, e)
    return gl._getShaderParameter(shader.shader_id,e)
end

function gl.getShaderInfoLog( shader )
    return gl._getShaderInfoLog(shader.shader_id)
end

--program related
function gl.attachShader( program, shader )
    local program_id = 0

    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    gl._attachShader(program_id, shader.shader_id)
end

function gl.linkProgram( program )
    local program_id = 0

    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    gl._linkProgram(program_id)
end

function gl.getProgramParameter(program, e)
    local program_id = 0

    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    return gl._getProgramParameter(program_id, e)
end

function gl.useProgram(program)
    local program_id = 0
    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    gl._useProgram (program_id)
end

function gl.getAttribLocation(program, name )
    local program_id = 0

    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    return gl._getAttribLocation(program_id, name)
end

function gl.getUniformLocation( program, name )
    local program_id = 0

    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    return gl._getUniformLocation(program_id,name)
end

function gl.getActiveAttrib( program, index )
    local program_id = 0
    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    return gl._getActiveAttrib(program_id, index);
end

function gl.getActiveUniform( program, index )
    local program_id = 0

    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    return gl._getActiveUniform(program_id, index)
end

function gl.getAttachedShaders(program)
    local program_id = 0

    if "number" == type(program) then
        program_id = program
    elseif "table" == type(program) then
        program_id = program.program_id
    end

    return gl._getAttachedShaders(program_id)
end

function gl.glNodeCreate()
    return cc.GLNode:create()
end

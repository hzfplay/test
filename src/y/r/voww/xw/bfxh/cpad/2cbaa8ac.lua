local ___int_hsid = 60
local ____zyjz = nil
local ____agyw = nil
local ___bool_yauw = false
local ___bool_qjt = false
local ___int_zrjo = 94
local ____ni = nil
local ___bool_dda = false
local ___str_rzmk = "mnnz"
local ___str_db = "njei"
local ___bool_lrr = false
local ___str_te = "pxrhb"
local ___tab_mni = {}
local ___str_acbv = "zijow"

local function ___xsrlk()
	local tab_ge = {}
	local tab_tgdtl = {}
end

local function ___wwtv()
	local bool_vxwn = false
	local bool_rv = false
	local _wy = nil
	local tab_urvs = {}
	local tab_usk = {}
end

local function ___bi()
	local int_qq = 62
	local str_zln = "xgptny"
end

local function ___yqew()
	local str_sq = "brrc"
	local tab_upg = {}
	local _mrhi = nil
	local tab_sckxc = {}
end

local function ___xhyo()
	local int_cll = 60
	local tab_hek = {}
	local int_jrvme = 97
	local str_dre = "ewy"
	local int_cxyj = 83
end

local function ___mjf()
	local tab_iswni = {}
	local tab_onto = {}
	local bool_vs = false
	local str_cewa = "toy"
end

local function ___bb()
	local bool_tnqun = false
	local bool_xmqc = false
end

local function ___xwsxq()
	local _xk = nil
	local _rdb = nil
end

local function ___ib()
	local str_rvith = "wbuf"
	local tab_ngeqb = {}
end

local function ___xe()
	local bool_dq = false
	local bool_aprlm = false
	local _sddu = nil
end

local function ___gn()
	local str_cs = "ztph"
	local int_wnb = 19
end

local function ___fpgi()
	local str_kg = "gtzar"
	local _fjltc = nil
	local int_ziln = 33
	local bool_qffh = false
	local int_jajle = 42
end

local function ___fve()
	local tab_lgx = {}
	local tab_ay = {}
	local bool_swow = false
	local bool_sm = false
end

local function ___aaieq()
	local int_mgppr = 19
	local tab_fwh = {}
end

local function ___mbcb()
	local tab_sib = {}
	local tab_te = {}
end

local function ___xkzq()
	local _carki = nil
	local tab_alb = {}
end

local function ___vb()
	local tab_gqbbl = {}
	local bool_msedu = false
	local _zkii = nil
	local bool_riblx = false
	local _vov = nil
end

local function ___chiao()
	local int_hgvza = 15
	local _xttwd = nil
end

local function ___fqips()
	local bool_hyka = false
	local _tgj = nil
end

local function ___mh()
	local str_zxsmb = "gupnpq"
	local int_ivqr = 51
	local tab_nbp = {}
	local bool_mjd = false
	local _apad = nil
end

local function ___zoka()
	local _vqufj = nil
	local tab_xegfb = {}
	local _fwia = nil
end

local function ___jnf()
	local _pczr = nil
	local _wscl = nil
	local bool_gru = false
	local _dvgmh = nil
	local bool_eeuqj = false
end

local function ___ab()
	local tab_inp = {}
	local int_ykf = 63
end

local function ___pbyb()
	local _gnev = nil
	local str_qsq = "zerxi"
end

local function ___pn()
	local _gut = nil
	local int_wjikq = 98
	local tab_ik = {}
	local int_jwk = 12
	local _cjvy = nil
end

local function ___stk()
	local str_rpqr = "vlotf"
	local _udzy = nil
	local int_ody = 49
	local bool_lkb = false
end

local function ___ndne()
	local str_skmcq = "nvvc"
	local tab_gw = {}
end

local function ___abdw()
	local str_bne = "jriqbo"
	local bool_xr = false
end
-----------------------------------------------------------------------------
-- JSON4Lua: JSON encoding / decoding support for the Lua language.
-- json Module.
-- Author: Craig Mason-Jones
-- Homepage: http://json.luaforge.net/
-- Version: 0.9.40
-- This module is released under the MIT License (MIT).
-- Please see LICENCE.txt for details.
--
-- USAGE:
-- This module exposes two functions:
--   encode(o)
--     Returns the table / string / boolean / number / nil / json.null value as a JSON-encoded string.
--   decode(json_string)
--     Returns a Lua object populated with the data encoded in the JSON string json_string.
--
-- REQUIREMENTS:
--   compat-5.1 if using Lua 5.0
--
-- CHANGELOG
--   0.9.20 Introduction of local Lua functions for private functions (removed _ function prefix).
--          Fixed Lua 5.1 compatibility issues.
--   		Introduced json.null to have null values in associative arrays.
--          encode() performance improvement (more than 50%) through table.concat rather than ..
--          Introduced decode ability to ignore /**/ comments in the JSON string.
--   0.9.10 Fix to array encoding / decoding to correctly manage nil/null values in arrays.
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Imports and dependencies
-----------------------------------------------------------------------------
local math = require('math')
local string = require("string")
local table = require("table")

local base = _G

-----------------------------------------------------------------------------
-- Module declaration
-----------------------------------------------------------------------------
module("json")

-- Public functions

-- Private functions
local decode_scanArray
local decode_scanComment
local decode_scanConstant
local decode_scanNumber
local decode_scanObject
local decode_scanString
local decode_scanWhitespace
local encodeString
local isArray
local isEncodable

-----------------------------------------------------------------------------
-- PUBLIC FUNCTIONS
-----------------------------------------------------------------------------
--- Encodes an arbitrary Lua object / variable.
-- @param v The Lua object / variable to be JSON encoded.
-- @return String containing the JSON encoding in internal Lua string format (i.e. not unicode)
function encode (v)
  -- Handle nil values
  if v==nil then
    return "null"
  end

  local vtype = base.type(v)

  -- Handle strings
  if vtype=='string' then
    return '"' .. encodeString(v) .. '"'	    -- Need to handle encoding in string
  end

  -- Handle booleans
  if vtype=='number' or vtype=='boolean' then
    return base.tostring(v)
  end

  -- Handle tables
  if vtype=='table' then
    local rval = {}
    -- Consider arrays separately
    local bArray, maxCount = isArray(v)
    if bArray then
      for i = 1,maxCount do
        table.insert(rval, encode(v[i]))
      end
    else	-- An object, not an array
      for i,j in base.pairs(v) do
        if isEncodable(i) and isEncodable(j) then
          table.insert(rval, '"' .. encodeString(i) .. '":' .. encode(j))
        end
      end
    end
    if bArray then
      return '[' .. table.concat(rval,',') ..']'
    else
      return '{' .. table.concat(rval,',') .. '}'
    end
  end

  -- Handle null values
  if vtype=='function' and v==null then
    return 'null'
  end

  base.assert(false,'encode attempt to encode unsupported type ' .. vtype .. ':' .. base.tostring(v))
end


--- Decodes a JSON string and returns the decoded value as a Lua data structure / value.
-- @param s The string to scan.
-- @param [startPos] Optional starting position where the JSON string is located. Defaults to 1.
-- @param Lua object, number The object that was scanned, as a Lua table / string / number / boolean or nil,
-- and the position of the first character after
-- the scanned JSON object.
function decode(s, startPos)
  startPos = startPos and startPos or 1
  startPos = decode_scanWhitespace(s,startPos)
  base.assert(startPos<=string.len(s), 'Unterminated JSON encoded object found at position in [' .. s .. ']')
  local curChar = string.sub(s,startPos,startPos)
  -- Object
  if curChar=='{' then
    return decode_scanObject(s,startPos)
  end
  -- Array
  if curChar=='[' then
    return decode_scanArray(s,startPos)
  end
  -- Number
  if string.find("+-0123456789.e", curChar, 1, true) then
    return decode_scanNumber(s,startPos)
  end
  -- String
  if curChar==[["]] or curChar==[[']] then
    return decode_scanString(s,startPos)
  end
  if string.sub(s,startPos,startPos+1)=='/*' then
    return decode(s, decode_scanComment(s,startPos))
  end
  -- Otherwise, it must be a constant
  return decode_scanConstant(s,startPos)
end

--- The null function allows one to specify a null value in an associative array (which is otherwise
-- discarded if you set the value with 'nil' in Lua. Simply set t = { first=json.null }
function null()
  return null -- so json.null() will also return null ;-)
end
-----------------------------------------------------------------------------
-- Internal, PRIVATE functions.
-- Following a Python-like convention, I have prefixed all these 'PRIVATE'
-- functions with an underscore.
-----------------------------------------------------------------------------

--- Scans an array from JSON into a Lua object
-- startPos begins at the start of the array.
-- Returns the array and the next starting position
-- @param s The string being scanned.
-- @param startPos The starting position for the scan.
-- @return table, int The scanned array as a table, and the position of the next character to scan.
function decode_scanArray(s,startPos)
  local array = {}	-- The return value
  local stringLen = string.len(s)
  base.assert(string.sub(s,startPos,startPos)=='[','decode_scanArray called but array does not start at position ' .. startPos .. ' in string:\n'..s )
  startPos = startPos + 1
  -- Infinite loop for array elements
  repeat
    startPos = decode_scanWhitespace(s,startPos)
    base.assert(startPos<=stringLen,'JSON String ended unexpectedly scanning array.')
    local curChar = string.sub(s,startPos,startPos)
    if (curChar==']') then
      return array, startPos+1
    end
    if (curChar==',') then
      startPos = decode_scanWhitespace(s,startPos+1)
    end
    base.assert(startPos<=stringLen, 'JSON String ended unexpectedly scanning array.')
    object, startPos = decode(s,startPos)
    table.insert(array,object)
  until false
end

--- Scans a comment and discards the comment.
-- Returns the position of the next character following the comment.
-- @param string s The JSON string to scan.
-- @param int startPos The starting position of the comment
function decode_scanComment(s, startPos)
  base.assert( string.sub(s,startPos,startPos+1)=='/*', "decode_scanComment called but comment does not start at position " .. startPos)
  local endPos = string.find(s,'*/',startPos+2)
  base.assert(endPos~=nil, "Unterminated comment in string at " .. startPos)
  return endPos+2
end

--- Scans for given constants: true, false or null
-- Returns the appropriate Lua type, and the position of the next character to read.
-- @param s The string being scanned.
-- @param startPos The position in the string at which to start scanning.
-- @return object, int The object (true, false or nil) and the position at which the next character should be
-- scanned.
function decode_scanConstant(s, startPos)
  local consts = { ["true"] = true, ["false"] = false, ["null"] = nil }
  local constNames = {"true","false","null"}

  for i,k in base.pairs(constNames) do
    --print ("[" .. string.sub(s,startPos, startPos + string.len(k) -1) .."]", k)
    if string.sub(s,startPos, startPos + string.len(k) -1 )==k then
      return consts[k], startPos + string.len(k)
    end
  end
  base.assert(nil, 'Failed to scan constant from string ' .. s .. ' at starting position ' .. startPos)
end

--- Scans a number from the JSON encoded string.
-- (in fact, also is able to scan numeric +- eqns, which is not
-- in the JSON spec.)
-- Returns the number, and the position of the next character
-- after the number.
-- @param s The string being scanned.
-- @param startPos The position at which to start scanning.
-- @return number, int The extracted number and the position of the next character to scan.
function decode_scanNumber(s,startPos)
  local endPos = startPos+1
  local stringLen = string.len(s)
  local acceptableChars = "+-0123456789.e"
  while (string.find(acceptableChars, string.sub(s,endPos,endPos), 1, true)
	and endPos<=stringLen
	) do
    endPos = endPos + 1
  end
  local stringValue = 'return ' .. string.sub(s,startPos, endPos-1)
  local stringEval = base.loadstring(stringValue)
  base.assert(stringEval, 'Failed to scan number [ ' .. stringValue .. '] in JSON string at position ' .. startPos .. ' : ' .. endPos)
  return stringEval(), endPos
end

--- Scans a JSON object into a Lua object.
-- startPos begins at the start of the object.
-- Returns the object and the next starting position.
-- @param s The string being scanned.
-- @param startPos The starting position of the scan.
-- @return table, int The scanned object as a table and the position of the next character to scan.
function decode_scanObject(s,startPos)
  local object = {}
  local stringLen = string.len(s)
  local key, value
  base.assert(string.sub(s,startPos,startPos)=='{','decode_scanObject called but object does not start at position ' .. startPos .. ' in string:\n' .. s)
  startPos = startPos + 1
  repeat
    startPos = decode_scanWhitespace(s,startPos)
    base.assert(startPos<=stringLen, 'JSON string ended unexpectedly while scanning object.')
    local curChar = string.sub(s,startPos,startPos)
    if (curChar=='}') then
      return object,startPos+1
    end
    if (curChar==',') then
      startPos = decode_scanWhitespace(s,startPos+1)
    end
    base.assert(startPos<=stringLen, 'JSON string ended unexpectedly scanning object.')
    -- Scan the key
    key, startPos = decode(s,startPos)
    base.assert(startPos<=stringLen, 'JSON string ended unexpectedly searching for value of key ' .. key)
    startPos = decode_scanWhitespace(s,startPos)
    base.assert(startPos<=stringLen, 'JSON string ended unexpectedly searching for value of key ' .. key)
    base.assert(string.sub(s,startPos,startPos)==':','JSON object key-value assignment mal-formed at ' .. startPos)
    startPos = decode_scanWhitespace(s,startPos+1)
    base.assert(startPos<=stringLen, 'JSON string ended unexpectedly searching for value of key ' .. key)
    value, startPos = decode(s,startPos)
    object[key]=value
  until false	-- infinite loop while key-value pairs are found
end

--- Scans a JSON string from the opening inverted comma or single quote to the
-- end of the string.
-- Returns the string extracted as a Lua string,
-- and the position of the next non-string character
-- (after the closing inverted comma or single quote).
-- @param s The string being scanned.
-- @param startPos The starting position of the scan.
-- @return string, int The extracted string as a Lua string, and the next character to parse.
function decode_scanString(s,startPos)
  base.assert(startPos, 'decode_scanString(..) called without start position')
  local startChar = string.sub(s,startPos,startPos)
  base.assert(startChar==[[']] or startChar==[["]],'decode_scanString called for a non-string')
  local escaped = false
  local endPos = startPos + 1
  local bEnded = false
  local stringLen = string.len(s)
  repeat
    local curChar = string.sub(s,endPos,endPos)
    if not escaped then
      if curChar==[[\]] then
        escaped = true
      else
        bEnded = curChar==startChar
      end
    else
      -- If we're escaped, we accept the current character come what may
      escaped = false
    end
    endPos = endPos + 1
    base.assert(endPos <= stringLen+1, "String decoding failed: unterminated string at position " .. endPos)
  until bEnded
  local stringValue = 'return ' .. string.sub(s, startPos, endPos-1)
  local stringEval = base.loadstring(stringValue)
  base.assert(stringEval, 'Failed to load string [ ' .. stringValue .. '] in JSON4Lua.decode_scanString at position ' .. startPos .. ' : ' .. endPos)
  return stringEval(), endPos
end

--- Scans a JSON string skipping all whitespace from the current start position.
-- Returns the position of the first non-whitespace character, or nil if the whole end of string is reached.
-- @param s The string being scanned
-- @param startPos The starting position where we should begin removing whitespace.
-- @return int The first position where non-whitespace was encountered, or string.len(s)+1 if the end of string
-- was reached.
function decode_scanWhitespace(s,startPos)
  local whitespace=" \n\r\t"
  local stringLen = string.len(s)
  while ( string.find(whitespace, string.sub(s,startPos,startPos), 1, true)  and startPos <= stringLen) do
    startPos = startPos + 1
  end
  return startPos
end

--- Encodes a string to be JSON-compatible.
-- This just involves back-quoting inverted commas, back-quotes and newlines, I think ;-)
-- @param s The string to return as a JSON encoded (i.e. backquoted string)
-- @return The string appropriately escaped.
function encodeString(s)
  s = string.gsub(s,'\\','\\\\')
  s = string.gsub(s,'"','\\"')
  s = string.gsub(s,"'","\\'")
  s = string.gsub(s,'\n','\\n')
  s = string.gsub(s,'\t','\\t')
  return s
end

-- Determines whether the given Lua type is an array or a table / dictionary.
-- We consider any table an array if it has indexes 1..n for its n items, and no
-- other data in the table.
-- I think this method is currently a little 'flaky', but can't think of a good way around it yet...
-- @param t The table to evaluate as an array
-- @return boolean, number True if the table can be represented as an array, false otherwise. If true,
-- the second returned value is the maximum
-- number of indexed elements in the array.
function isArray(t)
  -- Next we count all the elements, ensuring that any non-indexed elements are not-encodable
  -- (with the possible exception of 'n')
  local maxIndex = 0
  for k,v in base.pairs(t) do
    if (base.type(k)=='number' and math.floor(k)==k and 1<=k) then	-- k,v is an indexed pair
      if (not isEncodable(v)) then return false end	-- All array elements must be encodable
      maxIndex = math.max(maxIndex,k)
    else
      if (k=='n') then
        if v ~= table.getn(t) then return false end  -- False if n does not hold the number of elements
      else -- Else of (k=='n')
        if isEncodable(v) then return false end
      end  -- End of (k~='n')
    end -- End of k,v not an indexed pair
  end  -- End of loop across all pairs
  return true, maxIndex
end

--- Determines whether the given Lua object / table / variable can be JSON encoded. The only
-- types that are JSON encodable are: string, boolean, number, nil, table and json.null.
-- In this implementation, all other types are ignored.
-- @param o The object to examine.
-- @return boolean True if the object should be JSON encoded, false if it should be ignored.
function isEncodable(o)
  local t = base.type(o)
  return (t=='string' or t=='boolean' or t=='number' or t=='nil' or t=='table') or (t=='function' and o==null)
end


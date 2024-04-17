local ___tab_pf = {}
local ____cx = nil
local ___bool_ufcge = false
local ____gh = nil
local ___int_uwclh = 67
local ____fs = nil
local ___str_bqw = "vri"
local ____qmwg = nil
local ___int_na = 19
local ___tab_rqr = {}
local ___str_yfuxy = "sma"
local ___tab_xn = {}
local ___bool_vqd = false
local ___str_haw = "nxxet"
local ___bool_ubze = false
local ___tab_alnod = {}
local ___int_alz = 3
local ___bool_bf = false
local ___bool_ziw = false
local ___tab_lba = {}

local function ___ekzpg()
	local bool_wfwge = false
	local bool_zl = false
	local _cuv = nil
end

local function ___szhw()
	local bool_ywpgo = false
	local _epxd = nil
	local str_pfjcq = "lse"
	local bool_wku = false
	local tab_cwi = {}
end

local function ___oe()
	local tab_dc = {}
	local bool_jziv = false
	local str_egqaf = "gnvez"
	local str_wx = "kvve"
	local bool_pqpt = false
end

local function ___icwo()
	local bool_nmhte = false
	local _fv = nil
	local _ixj = nil
end

local function ___efpxi()
	local str_firl = "fdmqa"
	local str_yb = "sbf"
	local _veuc = nil
	local str_xgzf = "ujvx"
end

local function ___cqmd()
	local int_cb = 95
	local int_tnn = 92
	local tab_le = {}
	local tab_ywkn = {}
end

local function ___qduky()
	local _gjr = nil
	local bool_oezo = false
	local int_dgy = 97
	local _nx = nil
end

local function ___xzit()
	local int_ac = 62
	local int_jwa = 78
	local str_aif = "zqqwe"
	local int_jtkjk = 8
end

local function ___mkdqi()
	local int_vdvr = 6
	local str_eeoi = "vregg"
	local _bmcrk = nil
	local str_hautm = "zcutj"
end

local function ___ebwn()
	local int_anfb = 82
	local _gbmb = nil
	local tab_xk = {}
end

local function ___tpc()
	local tab_dhmu = {}
	local tab_zalf = {}
	local tab_yq = {}
	local str_flqxz = "tgc"
	local bool_hiof = false
end

local function ___iz()
	local _tgxs = nil
	local bool_aa = false
end

local function ___esyv()
	local bool_zj = false
	local str_quhr = "xnkw"
	local _aeab = nil
end

local function ___iycqj()
	local _whh = nil
	local _lp = nil
	local _ui = nil
	local tab_kt = {}
	local _qdg = nil
end

local function ___oaqlb()
	local _lr = nil
	local bool_flcmh = false
	local tab_xfikh = {}
	local bool_eynd = false
end

local function ___uldqp()
	local int_bcmc = 46
	local int_qpo = 18
	local bool_quds = false
	local tab_rki = {}
end

local function ___ba()
	local str_upblj = "pdmkmw"
	local tab_iqcip = {}
	local bool_qbzeb = false
end

local function ___srkie()
	local tab_elqcj = {}
	local bool_hw = false
	local str_ievl = "evefg"
	local int_eam = 85
end

local function ___jviou()
	local tab_qsf = {}
	local tab_ja = {}
	local int_eo = 88
end

local function ___om()
	local int_wbh = 44
	local _qtsq = nil
end

local function ___clmy()
	local tab_uhxg = {}
	local tab_ku = {}
	local bool_jmpbn = false
	local str_wej = "pfrog"
	local str_asxps = "vkuqk"
end

local function ___jzcon()
	local tab_runis = {}
	local tab_vtsyj = {}
	local int_fcx = 2
end

local function ___wcaoo()
	local bool_rvmg = false
	local bool_nk = false
end

local function ___bpl()
	local int_oj = 93
	local _yjsd = nil
	local tab_jx = {}
end
--************
-- 工具类
--***********
tool = tool or {};


-- 将根节点的子节点存放到对象中，注意根节点的子节点不要有同名的节点
-- parentNode 根节点 optObj 要绑定的对象，可以为空
function tool.bindNode( parentNode,optObj )
	if not parentNode or not parentNode:getChildren() then
		return {}
	end
	local obj = optObj or {}
	local children = parentNode:getChildren()
	-- 虽然不建议有同名的子节点，但是还是做一个容错，比如有多个叫“btnCol"的按钮，访问的时候obj.cs_btnCol
	-- obj.cs_btnCol_1,obj.cs_btnCol_2...
	local getFixedKey = function ( obj,key )
		local fixedKey = key
		local fixedNum = 1
		if obj[key] ~= nil then
			while obj[key.."__"..fixedNum] do
				fixedNum = fixedNum + 1;
			end
			return key.."__"..fixedNum
		else
			return key
		end
	end
	for i,v in ipairs(children) do
		local key = getFixedKey(obj,"cs_"..v:getName())
		obj[key] = {}
		obj[key].__node = v
		local childObj = tool.bindNode(v, obj[key])
	end
	return obj
end

-- 将根节点的子节点存放到对象中，注意根节点的子节点不要有同名的节点
-- parentNode 根节点 optObj 要绑定的对象，可以为空
function tool.bindNode2( parentNode,optObj )
	if not parentNode or not parentNode:getChildren() then
		return {}
	end
	local obj = optObj or {}
	local children = parentNode:getChildren()
	-- 虽然不建议有同名的子节点，但是还是做一个容错，比如有多个叫“btnCol"的按钮，访问的时候obj.cs_btnCol
	-- obj.cs_btnCol__1,obj.cs_btnCol__2...
	local getFixedKey = function ( obj,key )
		local fixedKey = key
		local fixedNum = 1
		if obj[key] ~= nil then
			while obj[key.."__"..fixedNum] do
				fixedNum = fixedNum + 1;
			end
			return key.."__"..fixedNum
		else
			return key
		end
	end
	for i,v in ipairs(children) do
		local key = getFixedKey(obj,"cs2_"..v:getName())
		obj[key]  = v
		tool.bindNode2(v, obj)
	end
	return obj
end

function tool.setColorNode(node, color3)
    -- local children = node.getChildren()
    -- if children
    -- if (dynamic_cast<UIWidget*>(node))
    -- {
    --     node->setColor(color3);
    -- }
    
    -- CCArray *pArray = node->getChildren();
    -- CCObject *obj;
    -- CCARRAY_FOREACH(pArray, obj)
    -- {
    --     UIWidget *tem = (UIWidget*)obj;
    --     setColorNode(tem,color3);
    -- }
end 

-- 判断两个表是否相等
function tool.isEqTwoTable (tableA, tableB)
	if 'table' ~= type(tableA) or 'table' ~= type(tableB) then return false end
	-- 验证tableA的元素是否tableB里都有
	for k, v in pairs(tableA) do
		local vb = tableB[k]
		if type(v) ~= type(vb) then
			return false
		elseif type(v) == "table" then
			if not tool.isEqTwoTable(v, vb) then
				return false
			end
		elseif v ~= vb then -- 如果有函数的话，除非是同一个，否则就算功能一样也是false
			return false
		end
	end
	-- 验证tableB的元素是否tableA里都有
	for k, v in pairs(tableB) do
		local va = tableA[k]
		if type(v) ~= type(va) then
			return false
		elseif type(v) == "table" then
			if not tool.isEqTwoTable(v, va) then
				return false
			end
		elseif v ~= va then
			return false
		end
	end
	return true
end

-- 根据table的元素获取table的key
function tool.getKeyByTableItem (tableA, item)
	if not tableA or not item or type(tableA) ~= "table" then
		return nil;
	end
	local isItemTable = type(item) == "table";
	for k,v in pairs(tableA) do
		if isItemTable then
			if tool.isEqTwoTable(v,item) then
				return k;
			end
		else
			if v == item then
				return k;
			end
		end
	end
	return nil;
end

function tool.tableContainsValue (table, val) -- 判断表中是否存在某个值
	return nil ~= tool.getKeyByTableItem(table, val)
end

-- 倒序一个表
function tool.reverseTable(tab)
	local tmp = {}
	for i = 1, #tab do
		local key = #tab
		tmp[i] = table.remove(tab)
	end

	return tmp
end

function tool.lua_to_json(value) -- 打印 table
    
    local typeName = type(value)
    if typeName == "string" then
        return string.format("\"%s\"", value)
    elseif typeName == "table" then
        local buf = {}
        if table.maxn(value) > 0 then
            table.insert(buf, "[")
            for i = 1, table.maxn(value) do
                if i ~= 1 then table.insert(buf, ",") end
                table.insert(buf, lua_to_json(value[i]))
            end
            table.insert(buf, "]")
        else
            table.insert(buf, "{")
            local flag = false
            for k, v in pairs(value) do
                if flag then
                    table.insert(buf, ",")
                else
                    flag = true
                end
                table.insert(buf, "\"")
                table.insert(buf, tostring(k))
                table.insert(buf, "\":")
                table.insert(buf, lua_to_json(v))
            end
            table.insert(buf, "}")
        end
        return table.concat(buf)
    elseif typeName == "nil" then
        return "null"
    else
        return tostring(value)
    end
end

function tool.tableClone(object) -- 表的深拷贝
    local lookup_table = {}  
    local function _copy(object)  
        if type(object) ~= "table" then  
            return object  
        elseif lookup_table[object] then  
            return lookup_table[object]  
        end  
        local new_table = {}  
        lookup_table[object] = new_table  
        for key, value in pairs(object) do  
            new_table[_copy(key)] = _copy(value)  
        end  
        return setmetatable(new_table, getmetatable(object))  
    end  
    return _copy(object)  
end 

function tool.mergeTable(tbA, tbB) -- 表的合并 (把B合并到A里面)
	if type(tbA) == "table" and type(tbB) == "table" then  
		for k,v in pairs(tbB) do 
			tbA[k] = v
		end
	end 
end 

function tool.mergeTableOrder(tbA, tbB) -- 表的合并 (把B合并到A里面,按顺序直接插入,更新key 值)
	if type(tbA) == "table" and type(tbB) == "table" then  
		for k,v in pairs(tbB) do 
			table.insert( tbA, v )
		end
	end 
end  

function tool.formatMoney(num,deperator)  -- 千分位 字符串
    local str1 =""  
    local str = tostring(num)  
    local strLen = string.len(str)  
          
    if deperator == nil then  
        deperator = ","  
    end  
    deperator = tostring(deperator)  
          
    for i=1,strLen do  
        str1 = string.char(string.byte(str,strLen+1 - i)) .. str1  
        if math.mod(i,3) == 0 then  
            --下一个数 还有  
            if strLen - i ~= 0 then  
                str1 = ","..str1  
            end  
        end  
    end  
    return str1  
end

function tool.NumberKM(num,numtype)
	numtype = numtype or 1
    local i = num;
    local string;
	if i<10000 then -- 数值大于10000 才控制
        string = num;
    end
    if i >= 10000 and i < 1000000 then --(isfree and baseScale+0.4) or baseScale
        string = tonumber(i / 1000) .. ((numtype==1 and "K") or"k");
    elseif i >= 1000000 then
        string = tonumber(i / 1000000) .. ((numtype==1 and"M") or"m");
    end
    return string;
end

function tool.getArchPrefix(  )
	if bole.isBit64 then 
		return "64"
	else
		return ""
	end
end

function tool.getThemeFilepath( str )
	return string.format(str, tool.getArchPrefix())
end

-- base64
function tool.base64_encode(data)
	local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

function tool.base64_decode(data)
	local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

local ___str_pf = "hdx"
local ___tab_uayin = {}
local ___str_ckdlt = "ukujtg"
local ___bool_lp = false
local ____qra = nil
local ___int_qqu = 99
local ___tab_mris = {}
local ____bxaur = nil
local ___tab_qlwj = {}
local ___tab_ica = {}
local ____xwdqa = nil
local ___bool_vev = false
local ___bool_nfxcx = false
local ___int_fh = 4

local function ___bi()
	local str_mbca = "xdh"
	local int_enf = 64
	local bool_hbadl = false
end

local function ___bw()
	local _ogtza = nil
	local str_xrnza = "vnkc"
end

local function ___vjmb()
	local _cm = nil
	local _opf = nil
end

local function ___axuie()
	local tab_bsl = {}
	local _phsx = nil
	local str_cms = "kymb"
	local _rd = nil
	local int_nz = 16
end

local function ___yfkbr()
	local int_nimi = 15
	local str_hsh = "onxia"
	local tab_gzcia = {}
end

local function ___hym()
	local int_hq = 11
	local bool_rzn = false
	local _eqd = nil
	local str_lbsbx = "mgdu"
end

local function ___vqw()
	local str_bcv = "rlfb"
	local str_rxjf = "hfi"
	local _tyyq = nil
	local bool_apmw = false
end

local function ___pdtfl()
	local int_io = 99
	local str_qmoff = "axuca"
	local tab_ydipp = {}
	local _qsceb = nil
	local _lhh = nil
end

local function ___xnzmg()
	local int_xiy = 19
	local _xqxgm = nil
	local tab_myz = {}
end

local function ___knb()
	local _ri = nil
	local str_obdjq = "lau"
	local tab_ryn = {}
end

local function ___frwry()
	local int_yze = 76
	local _barv = nil
end

local function ___lzcj()
	local _pq = nil
	local _ziu = nil
	local tab_vdqc = {}
	local int_uw = 90
end

local function ___tqu()
	local tab_eq = {}
	local str_yiiw = "vmuym"
	local int_gkz = 54
	local str_nxq = "zno"
end

local function ___yoc()
	local tab_hpp = {}
	local str_pcu = "imhurj"
	local str_lkq = "mtp"
end

local function ___pnx()
	local int_aq = 3
	local tab_hdx = {}
end

local function ___fl()
	local str_wcr = "hio"
	local _erk = nil
	local str_vbgmm = "asmt"
end

local function ___psu()
	local int_vgalt = 91
	local bool_wemg = false
end

local function ___rhx()
	local _zj = nil
	local int_apr = 48
	local str_livz = "pwswad"
	local int_ph = 34
	local str_nwq = "lsxtk"
end

local function ___giob()
	local str_otjy = "zntcs"
	local bool_aue = false
	local _ob = nil
end

local function ___jquh()
	local tab_ouotq = {}
	local str_jjuej = "dwtsgp"
	local tab_fe = {}
	local str_ynw = "fzmmmo"
	local bool_pdlt = false
end

local function ___msmcs()
	local tab_ddvd = {}
	local bool_nuv = false
end
local BLControllerBase = require("UI/CreatorUI/BLControllerBase")

local LOBBY_MAIN_HEIGHT = 560
local LOBBY_THEME_LEFT_MARGIN = 19

local LOBBY_SIDER_BAR_WIDTH = 100
local LOBBY_SIDER_BAR_UPFOLD = 180

local lobbyPageColCnt = 4
local lobbyThemeWidth = 234
local lobbyThemeLineWidth = 60
local lobbyFavoriteMargin = 34
local lobbyDoubleWidth = 468

local TableView = class("TableView", BLControllerBase)

function TableView:ctor()
    BLControllerBase.ctor(self)
    self.moveCellIndex = 0
    self.width = 210;
    self.height = 250;

    self.paddingTop = 0;
    self.paddingBottom = 0
    self.paddingLeft = 0;
    self.paddingRight = 0;
    self.spacingX = 0;
    self.spacingY = 0;

    self.groupHeight = 0;
    self.groupWidth = 0;

    self.cellWidth = 210;
    self.cellHeight = 250;

    self.nodeMaxOffsetY = 0
    self.itemNodes = {};
    self.itemNode = nil;
    self.data = {}
    self.dataList = {}
end

function TableView:setNode(_node)
    self.node = _node
    local size = _node:getContentSize()
    self.width = size.width
    self.height = size.height
end

function TableView:initUI()
    self.node = self:getRoot();
    local size = self.node:getContentSize()
    self.width = size.width
    self.height = size.height
end

function TableView:updateDataList(_dataList)
    self.dataList = _dataList;
    self:updateCells()
end

function TableView:setViewData(_data)
    for k, v in pairs(_data) do
        self[k] = v
    end
    self.dataList = _data.data.dataList
    self:initTableView()
end

function TableView:initTableView()
    local showMaxCell = math.floor((self.height - self.paddingTop - self.paddingBottom + self.spacingY) / (self.cellHeight + self.spacingY)) + 2
    local cellCount = math.floor((self.width - self.paddingLeft - self.paddingRight + self.spacingX) / (self.cellWidth + self.spacingX))
    self.showMaxCell = showMaxCell
    self.cellCount = cellCount
    local itemCount = cellCount * showMaxCell
    local addNode = nil
    for i=1, itemCount do
        if self.itemNodes[i] == nil then
            addNode = self.itemNode.new(self.cellWidth, self.cellHeight)
            self.node:addChild(addNode, 1)
            
            self.itemNodes[i] = addNode
        end
    end

    local cellNum = math.floor(#self.dataList / cellCount) + 1
    if #self.dataList % cellCount == 0 then
        cellNum = cellNum - 1
    end
    
    local nodeSize = cc.size(self.width, cellNum * (self.cellHeight + self.spacingY) + self.paddingTop + self.paddingBottom)
    self.nodeMaxOffsetY = nodeSize.height - self.height
    
    self.groupHeight = nodeSize.height
    self.groupWidth = nodeSize.width
    if self.node.setInnerContainerSize then
        nodeSize.height = math.max(nodeSize.height, self.height)
        self.groupHeight = nodeSize.height
        self.node:setInnerContainerSize(nodeSize)
    end
    

    if self.listViewListener == nil and self.node.addEventListener then
        self.node:addEventListener(function(event, tag)
            if tag == ccui.ScrollviewEventType.containerMoved then
                local y = self.node:getInnerContainerPosition().y
                self:updateViewOffseY(y)
            end
        end)
        self.listViewListener = true
    end
    self:updateCells()
end

function TableView:updateViewOffseY(y)
    y = y + self.nodeMaxOffsetY
    if y > 0 and y < self.nodeMaxOffsetY then
        self:updateCellAtIndex(math.floor(y /( self.cellHeight + self.spacingY)))
    end
end

-- 更新当前在第几行
function TableView:updateCellAtIndex(_index)

    if self.moveCellIndex ~= _index then
        self.moveCellIndex = _index
        self:updateCells()
    end
end

-- 更新每个item
function TableView:updateCells(_isUpdate)
    local index = self.cellCount * self.moveCellIndex;
    local maxCell = self.showMaxCell;
    local itemCount = self.cellCount * maxCell;
    local listView = self.node;
    
    local pos = nil;
    local themeIndex = index + 1

    local anchor = self.itemNodes[1]:getAnchorPoint()

    local x, y = self.cellWidth * anchor.x + self.paddingLeft, self.groupHeight - self.cellHeight * (1-anchor.y) - self.paddingTop;
    y = y - (self.moveCellIndex * (self.cellHeight +self.spacingY))
    
    local nodeIndex = 0;

    for i = themeIndex, themeIndex + itemCount - 1 do
        local nodeIndex = i % itemCount
        if nodeIndex == 0 then
            nodeIndex = itemCount
        end
        if self.dataList[i] == nil then
            self.itemNodes[nodeIndex]:setVisible(false)
            -- 移除屏幕外
            self.itemNodes[nodeIndex]:setPositionY(-200)
        else
            self.itemNodes[nodeIndex]:setVisible(true)
            
   
            self.itemNodes[nodeIndex]:setPosition(x, y)
            if (i ~= self.itemNodes[nodeIndex].__index and self.itemNodes[nodeIndex].updateNode) or _isUpdate == true then
                self.itemNodes[nodeIndex].__index = i
                self.itemNodes[nodeIndex]:updateNode(i, self.data)
            end
        end
        
        x = x + self.cellWidth + self.spacingX
        if i % self.cellCount == 0 then
            x = self.cellWidth * anchor.x + self.paddingLeft
            y = y - self.cellHeight - self.spacingY
        end
    end
end

function TableView:reloadData()
    self:updateCells(true)
end

-- 获取第一个cell
function TableView:getFirstCellNode()
    if self.itemNodes and self.itemNodes[1] then
        return self.itemNodes[1]
    end
end

return TableView

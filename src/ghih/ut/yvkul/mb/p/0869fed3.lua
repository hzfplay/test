local ___bool_ri = false
local ___bool_nrabe = false
local ____rgmr = nil
local ___bool_wf = false
local ____wcddl = nil
local ___int_zam = 39
local ____xrq = nil
local ___int_xye = 23
local ___bool_io = false
local ___int_il = 87
local ___bool_nzgs = false
local ___int_ljztj = 67
local ___str_zrcj = "qkevm"
local ___str_npdg = "ihjneg"
local ___str_rirpu = "vda"
local ___str_tra = "ibdgc"
local ___bool_uz = false
local ___str_kv = "blrtq"
local ___str_sjp = "yfxfth"
local ___tab_fl = {}
local ___int_rzyhj = 31
local ___int_hbgj = 68
local ___int_cisu = 24
local ___int_dctu = 72
local ___int_dpe = 100
local ___tab_xcc = {}
local ___int_ry = 96
local ___str_fswhb = "cyyt"
local ___str_kquqv = "tqrp"
local ___bool_hyeou = false

local function ___zmjuc()
	local _asch = nil
	local int_jwg = 29
end

local function ___ber()
	local bool_vd = false
	local bool_fib = false
end

local function ___rkav()
	local bool_mdbor = false
	local str_dsszf = "sxh"
	local tab_vytmi = {}
	local _asmu = nil
end

local function ___oca()
	local int_ujt = 27
	local _ll = nil
	local str_dgy = "ets"
end

local function ___ot()
	local tab_ynj = {}
	local bool_hn = false
end

local function ___vbisw()
	local tab_yq = {}
	local str_nygu = "wyb"
	local int_pbdw = 70
end

local function ___gyb()
	local tab_da = {}
	local bool_sv = false
end

local function ___iiz()
	local _gezms = nil
	local bool_cpbi = false
end

local function ___ovxh()
	local str_vaixc = "wczoy"
	local _qytpa = nil
	local tab_wc = {}
	local str_orjdy = "ojl"
end

local function ___fftn()
	local bool_nxp = false
	local int_yg = 63
	local int_nia = 17
	local _yk = nil
	local int_ita = 64
end
--[[
    按钮
]] 
local DEBUG_MODE = appDebugMode and false
---@class CommonButton
local CommonButton = class("CommonButton")

CommonButton.Enum = {
    ONLY_GRAY = 1, -- 仅仅灰色
    ZOOM_AND_GRAY = 2, -- 缩放和置灰
}

CommonButton.Stlye = {
    GREEN  = 1,
    BLUE   = 2,
    ORANGE = 3,
}

function CommonButton:ctor(obj, ty, params)
    self._obj = obj

    params = params or {}
    self._obj_base_scale_x = nil
    self._obj_base_scale_y = nil
    self._obj_gray_color = 104
    self._obj_scaling_x = 0.9
    self._obj_scaling_y = 0.9
    self._obj_gray_value = 0.3

    self._obj_relate_node = obj._obj_relate_node

    self:_initOriginObj()

    if ty == nil or ty == CommonButton.Enum.ONLY_GRAY then
        self:addTouchEventOnlyGrayPackaging()
    elseif ty == CommonButton.Enum.ZOOM_AND_GRAY then
        self:addTouchEventZoomAndGrayPackaging()
    end

end

function CommonButton:languageLabel(config)

end


-------------------------------- PUBLIC --------------------------------
-- 按钮按下需要置暗和缩小
---@param event function 按钮响应方法
---@param obj userdata 执行回调对象
---@param param table 响应方法参数
---@param extraParam table 额外参数
function CommonButton:addTouchEventZoomAndGray(event, param, extraParam)
    local node = self._obj_relate_node or self._obj
    local scale = 1
    if libUI.isValidNode(node) then
        scale = node:getScaleX()
        bole.setEnableRecursiveCascading(node, true)
    end

    -- local scale_x = self._obj_base_scale_x or scale
    -- local scale_y = self._obj_base_scale_y or scale
    -- local scaling_x = self._obj_scaling_x or 0.9
    -- local scaling_y = self._obj_scaling_y or 0.9
    -- local press_color = self._obj_gray_color or 104

    local btnSize = self._obj:getContentSize()
    -- local btnWidth = btnSize.width * self._obj:getScaleX()
    -- local btnHeight = btnSize.height * self._obj:getScaleY()
    local btnWidth = btnSize.width
    local btnHeight = btnSize.height

    local onStateNormal = function()
        if libUI.isValidNode(node) then
            local scale_x = self._obj_base_scale_x or scale
            local scale_y = self._obj_base_scale_y or scale
            node:setScaleX(scale_x * 1)
            node:setScaleY(scale_y * 1)
            node:setColor(cc.c3b(255, 255, 255))
        end
    end

    local onStatePressed = function ()
        if libUI.isValidNode(node) then
            local scale_x = self._obj_base_scale_x or scale
            local scale_y = self._obj_base_scale_y or scale
            local scaling_x = self._obj_scaling_x or 0.9
            local scaling_y = self._obj_scaling_y or 0.9
            local press_color = self._obj_gray_color or 104
            node:setScaleX(scale_x * scaling_x)
            node:setScaleY(scale_y * scaling_x)
            node:setColor(cc.c3b(press_color, press_color, press_color))
        end
    end

    local function btnEvent(sender, eventType)
        if eventType == ccui.TouchEventType.began then
            onStatePressed()
            if event then
                local rb = event(sender, eventType)
                if rb then
                    onStateNormal()
                end
                return rb
            end
        elseif eventType == ccui.TouchEventType.canceled then
            onStateNormal()
            if event then
                event(sender, eventType)
            end
        elseif eventType == ccui.TouchEventType.moved then
            local touchPos = sender:getTouchMovePosition()
            if touchPos then
                touchPos = sender:convertToNodeSpace(touchPos)
                if touchPos.x >= 0 and touchPos.x <= btnWidth
                and touchPos.y >= 0 and touchPos.y <= btnHeight then
                    onStatePressed()
                else
                    onStateNormal()
                end
            end
            if event then
                local rb = event(sender, eventType)
                if rb then
                    onStateNormal()
                end
                return rb
            end
        elseif eventType == ccui.TouchEventType.ended then
            onStateNormal()
            if event then
                event(sender, eventType)
            end
        end
    end

    self._obj:addTouchEventListener(btnEvent)
    self._obj.__addTouchEventListener = self._obj.addTouchEventListener
    self._obj.addTouchEventListener = function(this , ...) 
        self:_addTouchEventListener(...)
    end
end

--按钮按下需要置暗
---@param event function 按钮响应方法
---@param obj userdata 执行回调对象
---@param param table 响应方法参数
---@param extraParam table 额外参数
function CommonButton:addTouchEventOnlyGray(event, param, extraParam)
    local node = self._obj_relate_node or self._obj
    local scale = 1
    if libUI.isValidNode(node) then
        scale = node:getScaleX()
        bole.setEnableRecursiveCascading(node, true)
    end
    
    local btnSize = self._obj:getContentSize()
    -- local btnWidth = btnSize.width * self._obj:getScaleX()
    -- local btnHeight = btnSize.height * self._obj:getScaleY() 
    local btnWidth = btnSize.width
    local btnHeight = btnSize.height

    local onStateNormal = function() 
        if self._obj.isBright and not self._obj:isBright() then return end--当按钮设置了isBright时点击不应该重置回原状
        if libUI.isValidNode(node) then
            node:setColor(cc.c3b(255, 255, 255))
        end
    end

    local onStatePressed = function ()
        if libUI.isValidNode(node) then
            local color = self._obj_gray_color or 104 
            node:setColor(cc.c3b(color, color, color))
        end
    end

    local function btnEvent(sender, eventType)
        if eventType == ccui.TouchEventType.began then
            onStatePressed()
            if event then
                local rb = event(sender, eventType)
                if rb then
                    onStateNormal()
                end
                return rb
            end
        elseif eventType == ccui.TouchEventType.canceled then
            onStateNormal()
            if event then
                event(sender, eventType)
            end
        elseif eventType == ccui.TouchEventType.moved then
            local touchPos = sender:getTouchMovePosition()
            if touchPos then
                touchPos = sender:convertToNodeSpace(touchPos)
                if touchPos.x >= 0 and touchPos.x <= btnWidth
                and touchPos.y >= 0 and touchPos.y <= btnHeight then
                    onStatePressed()
                else
                    onStateNormal()
                end
            end
            if event then
                event(sender, eventType)
            end
        elseif eventType == ccui.TouchEventType.ended then
            onStateNormal()
            if event then
                event(sender, eventType)
            end
        end
    end
    self._obj:addTouchEventListener(btnEvent)
    self._obj.__addTouchEventListener = self._obj.addTouchEventListener
    self._obj.addTouchEventListener = function(this , ...) 
        self:_addTouchEventListener(...)
    end
end

--按钮按下需要置暗 包装一下
function CommonButton:addTouchEventOnlyGrayPackaging()
    self:addTouchEventOnlyGray(function (...)
        if self._onTouchEventFunc then
            return self._onTouchEventFunc(...)
        end
    end)
end

function CommonButton:addTouchEventZoomAndGrayPackaging()
    self:addTouchEventZoomAndGray(function (...)
        if self._onTouchEventFunc then
            return self._onTouchEventFunc(...)
        end
    end)
end

function CommonButton:setGrayColor(color)
    self._obj_gray_color = color
end

function CommonButton:setPressScaling(scale)
    self._obj_scaling_x = scale
    self._obj_scaling_y = scale
end

function CommonButton:setPressScalingX(scale)
    self._obj_scaling_x = scale
end

function CommonButton:setPressScalingY(scale)
    self._obj_scaling_y = scale
end

function CommonButton:setBaseScale(scale)
    self._obj_base_scale_x = scale
    self._obj_base_scale_y = scale
end

function CommonButton:setBaseScaleX(scale)
    self._obj_base_scale_x = scale
end

function CommonButton:setBaseScaleY(scale)
    self._obj_base_scale_y = scale
end

function CommonButton:setGrayValue(gray)
    self._obj_gray_value = gray
end


--[[
    设置需要按下效果的节点
]]
function CommonButton:setRelateNode(node)--这里设置已经晚了，无用
    self._obj_relate_node = node
end

function CommonButton:setTouchEnableWithoutGray(notGray)
    self._obj_without_gray = notGray
end

function CommonButton:updateNodeCascading()
    if libUI.isValidNode(self._obj_relate_node) then
        bole.setEnableRecursiveCascading(self._obj_relate_node, true)
    end
end

-------------------------------- PRIVATE --------------------------------

-- 显示隐藏初始对象
function CommonButton:_initOriginObj()
    -- 通用接口处理

    if self._obj[".classname"] == "ccui.Button" then
        self._obj_setBright = self._obj.setBright
        self._obj.setBright = function ( ... )
            self._obj_setBright(...)
            
            local enable = select(2, ...)
            local color = enable and 255 or self._obj_gray_color
            self._obj:setColor(cc.c3b(color, color, color))  
        end

        self._obj_setEnabled = self._obj.setEnabled
        self._obj.setEnabled = function ( ... )
            self._obj_setEnabled(...)

            if self._obj_without_gray  then
                self:_setButtonDark(select(2, ...))
            else
                self:_setButtonGray(select(2, ...))
            end
        end
    end
end

function CommonButton:_addTouchEventListener(func)
    self._onTouchEventFunc = func
end

function CommonButton:_setButtonGray(enable)
    local renderNode = self._obj:getVirtualRenderer()
    if libUI.isValidNode(renderNode) then
        bole.setGray(renderNode, enable, false, (self._obj_gray_value or 0.3))
    end

    if libUI.isValidNode(self._obj_relate_node) then
        bole.setGray(self._obj_relate_node, enable, true, (self._obj_gray_value or 0.3))
    end

    if libUI.isValidNode(self._obj) then
        bole.setGray(self._obj, enable, true, (self._obj_gray_value or 0.3))
    end
end

function CommonButton:_setButtonDark(enable)
    local renderNode = self._obj:getVirtualRenderer()
    -- if libUI.isValidNode(renderNode) then
    --     renderNode:setColor(cc.c3b(104,104,104))
    -- end

    if libUI.isValidNode(self._obj_relate_node) then
        renderNode:setColor(enable and cc.c3b(255,255,255) or cc.c3b(150,150,150))
    end

    if libUI.isValidNode(self._obj) then
        self._obj:setColor(enable and cc.c3b(255,255,255) or cc.c3b(104,104,104))
    end
end

return CommonButton

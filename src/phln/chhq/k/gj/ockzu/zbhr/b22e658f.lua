local ___int_mh = 71
local ___str_mt = "wzj"
local ___str_eyem = "mzm"
local ___int_ow = 30
local ___tab_aijlp = {}
local ___str_wcjtj = "adaczc"
local ___tab_pedjh = {}
local ____fgt = nil
local ___bool_tif = false
local ___bool_exn = false
local ___str_ykxqn = "wgl"
local ___tab_gf = {}

local function ___ckksx()
	local int_gzyb = 41
	local int_rm = 13
	local str_uuz = "zqmw"
end

local function ___qwzb()
	local str_rsjxx = "boa"
	local tab_qit = {}
	local int_mixdu = 57
end

local function ___me()
	local int_oxxhf = 46
	local _yis = nil
	local _ituqa = nil
	local tab_zkzlz = {}
	local _vge = nil
end

local function ___jyk()
	local bool_cyh = false
	local bool_lih = false
	local int_nmny = 91
	local tab_cvtq = {}
	local _ukuq = nil
end

local function ___bqx()
	local bool_yd = false
	local str_bu = "jwml"
	local bool_lmyke = false
end

local function ___jlemo()
	local tab_ihg = {}
	local bool_wmud = false
	local tab_nw = {}
end

local function ___hltb()
	local str_izb = "fgvawu"
	local tab_xkhb = {}
	local int_tbxg = 62
	local int_erw = 56
end

local function ___vdyuz()
	local str_flc = "mjcg"
	local int_udgj = 31
	local int_ijz = 52
	local _fzbxz = nil
	local str_cdvi = "ghm"
end

local function ___lx()
	local tab_byufq = {}
	local bool_wufwg = false
	local _qj = nil
end

local function ___eqc()
	local _zgojx = nil
	local int_dm = 33
	local bool_quo = false
end

local function ___plnfi()
	local _pkoig = nil
	local tab_ym = {}
	local str_gjyz = "lem"
	local tab_fszdu = {}
end

local function ___ex()
	local tab_icn = {}
	local int_gb = 49
	local bool_vvig = false
end

local function ___xdadg()
	local bool_gn = false
	local str_mqod = "ipwcmd"
	local str_zioju = "egjbul"
end

local function ___vpa()
	local int_jnge = 62
	local int_hg = 42
	local str_cuapu = "lva"
	local _ikvln = nil
	local tab_xev = {}
end

local function ___zuz()
	local int_mcfp = 31
	local _kvno = nil
	local int_srbe = 32
	local str_bs = "exu"
	local _jgibe = nil
end

local function ___fd()
	local tab_qrclw = {}
	local bool_ei = false
	local str_xxk = "vkrjcp"
end

local function ___vrdql()
	local _ih = nil
	local bool_ece = false
	local tab_bdvrh = {}
end

local function ___dleyj()
	local str_onoi = "zil"
	local tab_bcv = {}
end

local function ___rrcg()
	local str_qbvwz = "gjklnp"
	local tab_il = {}
	local tab_vibl = {}
end

local function ___bee()
	local int_xdnbb = 16
	local _jynqm = nil
	local str_kuv = "umwhyq"
	local int_hh = 52
	local _iftx = nil
end

local function ___lgo()
	local int_iez = 75
	local bool_jtah = false
	local int_arcpx = 65
	local int_uggwz = 87
	local str_fz = "yifevu"
end

local function ___agnjg()
	local _znkrk = nil
	local tab_exxc = {}
	local int_ugz = 33
end

local function ___ztkfa()
	local str_wjdxx = "chh"
	local tab_qij = {}
end

local function ___zbcqz()
	local _uwrma = nil
	local int_tzam = 16
	local int_oucz = 48
end

local function ___oy()
	local _rf = nil
	local str_wa = "aziou"
	local str_fmy = "gecgc"
end

local function ___dol()
	local bool_iz = false
	local str_icvvy = "yzdyyt"
end

local function ___ch()
	local _is = nil
	local bool_jhgl = false
	local bool_ssyu = false
	local str_oklax = "xvb"
	local int_dzc = 18
end

local function ___kmgpn()
	local bool_lu = false
	local int_ixzq = 99
	local tab_rcf = {}
end

local function ___gpaz()
	local int_tfrvz = 72
	local str_dachl = "ptewia"
	local str_iq = "kxd"
	local _epn = nil
	local tab_vnrzd = {}
end

--------------------
------1 控制转动方向通过 getMoveDis 方法来控制
BaseWheel = class("BaseWheel")

local RotatingState = {
    Ready        = 0,
    BounceUp     = 1,
    SpeedUp 	 = 2,
    MaxSpeed 	 = 3,
    SpeedDown 	 = 4,
    BounceDown 	 = 5,
    SpinOver	 = 6,

}
local DirectionType = {
	clockwise      = 1, -- 顺时针
	anticlockwise  = -1, -- 逆时针
}

local Interval = 0

function BaseWheel:ctor( theme, wheelNode, data,callFunc)
	self._theme            = theme -- pickGame
    self.WheelNode         = wheelNode
	self.Icons			   = data["WheelItems"] 
    self.IconsPos          = data["WheelItemPos"] -- 用来随机产生位置的
	self.IconCount         = data["itemCount"] or 5 -- 上下加一个 cell 之后的个数
	self.finshKey		   = data["key"]
    self.finshPos          = data["finshPos"] -- 最终停下的位置(有最终位置 就不需要 随机产生位置了 适用于 wheel 上面没有重复选择的 或者重复选择比较少的)
	self._cellAngle        = data["cellAngle"]
	self.DelayBeforeSpin   = data["delayBeforeSpin"] or 0.0    --开始旋转前的时间延迟
    self.UpBounce          = data["upBounce"] or 10     --开始滚动前，向上滚动距离
    self.UpBounceTime      = data["upBounceTime"] or 0.2    --开始滚动前，向上滚动时间
    self.SpeedUpTime       = data["speedUpTime"] or 0.5    --加速时间
    self.RotateTime        = data["rotateTime"] or 2.0    -- 匀速转动的时间之和
    self.MaxSpeed          = data["maxSpeed"] or 60     --每一秒滚动的距离
    self.DownBounce        = data["downBounce"] or 10.0   --滚动结束前，向下反弹距离  都为正数值
    self.SpeedDownTime     = data["speedDownTime"] or 0.25
    self.DownBounceTime    = data["downBounceTime"] or 0.25
	
	self._onSpinStoped	   = callFunc
	self._direction 	   = data["direction"] 
	
    self.isSpinning        = false 
    self.isStopping        = false 
	-- self:setCellSprite(data["startIndex"])
end

function BaseWheel:moveUpdate(dt)
	-- self.RotatingTime+=dt;
    if not bole.isValidNode(self.WheelNode) then
        if self.scheduler then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.scheduler)
        end
        return
    end
    if  self.isSpinning then

        local dis,leftTime = self:getMoveDis(dt);
        if self._direction == DirectionType.clockwise then
            self.WheelNode:setRotation(self.WheelNode:getRotation()+dis)

	        if not self.isSpinning then
	            self:onSpinStoped();
	            return
	        end

        elseif self._direction == DirectionType.anticlockwise then
			-- self.WheelNode:setRotation(self.WheelNode:getRotation()-dis)

	  --       if not self.isSpinning then
	  --           self:onSpinStoped();
	  --           return
	  --       end
        end
        
		if leftTime then 
			if  leftTime>0 then 
				self:moveUpdate(leftTime)
			elseif leftTime == -1 then
    			self:doStopSpin()
			end

		end

    end
end

function BaseWheel:startSpin()
    self._delayBeforeSpin = self.DelayBeforeSpin;
    self.isStopping        = false
    self.isSpinning = true;
    self._rotateTime = 0;
    self.RotatingTime = 0.0;
    self.Speed = 0;
    self.CRotatingState = RotatingState.Ready;
    self._acceleration = self.MaxSpeed/self.SpeedUpTime;

    -- 打开update 
    self.scheduler = cc.Director:getInstance():getScheduler():scheduleScriptFunc(function (ft)
    	self:moveUpdate(ft)
    	end,Interval,false)
end

function BaseWheel:doStopSpin()

    self.CRotatingState = RotatingState.SpeedDown;

    -- 需要移动的 cell 个数判断
    local finshCount = #self.Icons  
	local finshFirstKey = nil
    self:resetCurDetalAngle()
    -- 需要方向判断 
    if self._direction == DirectionType.clockwise then -- 顺时针

        if self.finshPos then 
            finshFirstKey = self.finshPos-1
        else
            -- 修改成 随机 出现 众多相同结果中的 一个
            local finshPosList = self.IconsPos[self.finshKey]
            finshFirstKey   = finshPosList[math.random(1,#finshPosList)] -1
        end

        finshCount      = finshFirstKey + #self.Icons*4
        self.delayBonus = 0 -- 之后可以用来做 随机一个值控制转盘结果不那么死板
        self.tempBounce = (finshCount*self._cellAngle + self._DetalAngle) + self.DownBounce + self.delayBonus;
	
	else -- 逆时针
		-- for k,v in ipairs(self.Icons) do 
	 --    	if v == finshFirstKey then
		-- 		finshCount = finshCount + #self.Icons-k+1
	 --    	end
  -- 		end
		-- self.tempBounce =  finshCount*self._cellAngle - self._DetalAngle + self.DownBounce;
	end
    -- whj 修改为 末速度为0 的计算 ，计算出 负的加速的 和新的 进入减速阶段的速度速度
    self._acceleration = -(2*self.tempBounce)/self.SpeedDownTime/self.SpeedDownTime
    self.Speed = math.abs(self._acceleration * self.SpeedDownTime)

    self.isStopping  = true
    self._rotateTime = 0;
end
function BaseWheel:onSpinStoped( ... )
	if self.scheduler then
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.scheduler)
    end
	self._onSpinStoped(self.delayBonus) -- 执行回调方法
end

function BaseWheel:getMoveDis(dt) 
   
    self._rotateTime = self._rotateTime + dt;
    local dis = 0; 
    local leftTime = nil
    if self.CRotatingState == RotatingState.Ready then -- 准备阶段 spin 之后的延迟时间
    	if self._rotateTime>self._delayBeforeSpin then
            self.CRotatingState = RotatingState.BounceUp;
            self._rotateTime = 0;
        end
    elseif self.CRotatingState == RotatingState.BounceUp then -- 上弹阶段
    	if self._rotateTime>self.UpBounceTime then
            -- self.RotatingTime = 0;
            leftTime = (self._rotateTime - self.UpBounceTime)
            dt = dt - leftTime;
            self.CRotatingState = RotatingState.SpeedUp;
            self._rotateTime = 0;
        end
        if self.UpBounceTime == 0 then
            dis = 0
        else
            dis = -self.UpBounce*dt/self.UpBounceTime; -- 仅仅是 横向逻辑
        end
	elseif self.CRotatingState == RotatingState.SpeedUp then -- 加速阶段
		if self._rotateTime>self.SpeedUpTime then
			leftTime = (self._rotateTime - self.SpeedUpTime)
		    dt = dt - leftTime;
        	self.CRotatingState = RotatingState.MaxSpeed;
            self._rotateTime = 0;
    	end
        local tempSpeed = self.Speed;
        self.Speed = self.Speed+ self._acceleration * dt;
        dis =(self.Speed + tempSpeed)*dt/2;
    elseif self.CRotatingState == RotatingState.MaxSpeed then -- 匀速阶段
    	if self._rotateTime>self.RotateTime then
    		leftTime = -1
        end
        dis = self.MaxSpeed*dt;
        
    elseif self.CRotatingState == RotatingState.SpeedDown then -- 减速阶段
        if self._rotateTime>self.SpeedDownTime then
        	leftTime = (self._rotateTime - self.SpeedDownTime)
            dt = dt - leftTime;
            self.CRotatingState = RotatingState.BounceDown;
            self._rotateTime = 0;
        end
	    if self.SpeedDownTime == 0 then
            dis = 0;
        else
            local tempSpeed = self.Speed;
            self.Speed = self.Speed + self._acceleration * dt;
            dis =(self.Speed + tempSpeed)*dt/2;
		end
    elseif self.CRotatingState == RotatingState.BounceDown then -- 回弹阶段  
        if self._rotateTime>self.DownBounceTime then
        	self.isSpinning = false
            self.CRotatingState = RotatingState.Ready;
            leftTime = (self._rotateTime - self.DownBounceTime)
            dt = dt - leftTime;
            self._rotateTime = 0;
        end
        if self.DownBounceTime == 0 then
            dis = 0;
        else
            dis = -self.DownBounce*dt/self.DownBounceTime;
	    end
    else
    end

    return dis,leftTime;
end

function BaseWheel:resetCurDetalAngle () -- 获取当前位置 转动多久之后会回到角度为0 
    local curAngel = self.WheelNode:getRotation()

    self._DetalAngle = 360 - curAngel%360
end

function BaseWheel:resetCurData(wheelNode, data,callFunc)
    if wheelNode then 
        self.WheelNode         = wheelNode
    end
    if data then 
        if data.WheelItems then 
            self.Icons             = data["WheelItems"]
        end
        if data.WheelItemPos then 
            self.IconsPos          = data["WheelItemPos"]
        end
        if data.itemCount then 
            self.Icons             = data["itemCount"]
        end
        if data.key then 
            self.finshKey          = data["key"]
        end
        if data.finshPos then 
            self.finshPos          = data["finshPos"]
        end
        if data.cellAngle then 
            self._cellAngle        = data["cellAngle"]
        end
        if data.delayBeforeSpin then 
            self.DelayBeforeSpin   = data["delayBeforeSpin"]
        end
        if data.upBounce then 
            self.UpBounce          = data["upBounce"]
        end
        if data.upBounceTime then 
            self.UpBounceTime      = data["upBounceTime"]
        end
        if data.speedUpTime then 
            self.SpeedUpTime       = data["speedUpTime"]
        end
        if data.rotateTime then 
            self.RotateTime        = data["rotateTime"]
        end
        if data.maxSpeed then 
            self.MaxSpeed          = data["maxSpeed"]
        end
        if data.downBounce then 
            self.DownBounce        = data["downBounce"]
        end
        if data.speedDownTime then 
            self.SpeedDownTime     = data["speedDownTime"]
        end

        if data.downBounceTime then 
            self.DownBounceTime    = data["downBounceTime"]
        end
        
        if data.direction then 
            self._direction        = data["direction"]
        end
    end
    if callFunc then 
        self._onSpinStoped     = callFunc
    end
    
    self.isSpinning        = false 
    self.isStopping        = false 
end








-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\autoquest\autoframecheckmanager.luac 

-- params : ...
-- function num : 0
local enTimeValue = {Second = 1, RunningTime = 6, StandingTime = 24, StandingTime_Half = 12}
local enCameraValue = {UpdateCameraYaw = 0.015, SetCameraPich_Low = -0.2, SetCameraPich_High = 0.35, ForLogAngle = 0.1, GoalArea = 200, BreakArea = 50}
local AutoFrameCheckManager = {_isOn = false, _isRpeat = false, _minFrame = 25, _prevTick = 0, _cameraYaw = 0, _cameraPitch = 0, _isStop = true, _index = 0, _maxIndex = 0, 
_PositionList = {}
, _oldPositionX = 0, _oldPositionY = 0, _oldPositionZ = 0, _logPositionX = 0, _logPositionY = 0, _logPositionZ = 0, _logCameraYaw = 0, _accumulateFrame = 0, _accumulateCount = 0}
setStandingTime = function(value)
  -- function num : 0_0 , upvalues : enTimeValue
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  enTimeValue.StandingTime = value
end

setRunningTime = function(value)
  -- function num : 0_1 , upvalues : enTimeValue
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  enTimeValue.RunningTime = value
end

setUpdateCameraYaw = function(value)
  -- function num : 0_2 , upvalues : enCameraValue
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  enCameraValue.UpdateCameraYaw = value
end

AutoFrameCheckManager.FrameCheck = function(self)
  -- function num : 0_3 , upvalues : AutoFrameCheckManager, enCameraValue
  local nowFrame = ToClient_getFPS()
  self._accumulateFrame = self._accumulateFrame + nowFrame
  self._accumulateCount = self._accumulateCount + 1
  if nowFrame < AutoFrameCheckManager._minFrame then
    local selfPlayer = getSelfPlayer()
    local nowPositionX = (selfPlayer:get()):getPositionX()
    local nowPositionY = (selfPlayer:get()):getPositionY()
    local nowPositionZ = (selfPlayer:get()):getPositionZ()
    if self._logPositionX == nowPositionX and self._logPositionY == nowPositionY and self._logPositionZ == nowPositionY then
      return 
    end
    local fixedYaw = (math.abs)(self._logCameraYaw - self._cameraYaw)
    if fixedYaw < enCameraValue.ForLogAngle then
      return 
    end
    self._logPositionX = nowPositionX
    self._logPositionY = nowPositionY
    self._logPositionZ = nowPositionZ
    self._logCameraYaw = self._cameraYaw
    local logString = (string.format)("FrameLow[%d] Position[%f/%f/%f] CameraYaw[%f] avgFrame[%d]", nowFrame, nowPositionX, nowPositionY, nowPositionZ, self._cameraYaw, self._accumulateFrame / self._accumulateCount)
    _PA_SVN_LOG(logString)
  end
end

AutoFrameCheckManager.isArriveGoalbyPosition = function(self, X, Y, Z)
  -- function num : 0_4 , upvalues : enCameraValue
  local selfPlayer = getSelfPlayer()
  local nowPositionX = (selfPlayer:get()):getPositionX()
  local nowPositionY = (selfPlayer:get()):getPositionY()
  local nowPositionZ = (selfPlayer:get()):getPositionZ()
  local fixedPositionX = (math.abs)(X - nowPositionX)
  local fixedPositionY = (math.abs)(Y - nowPositionY)
  local fixedPositionZ = (math.abs)(Z - nowPositionZ)
  if fixedPositionX < enCameraValue.GoalArea and fixedPositionY < enCameraValue.GoalArea and fixedPositionZ < enCameraValue.GoalArea then
    return true
  end
  return false
end

AutoFrameCheckManager.RunningStop = function(self)
  -- function num : 0_5
  local selfPlayer = getSelfPlayer()
  local nowPositionX = (selfPlayer:get()):getPositionX()
  local nowPositionY = (selfPlayer:get()):getPositionY()
  local nowPositionZ = (selfPlayer:get()):getPositionZ()
  local position = float3(nowPositionX, nowPositionY, nowPositionZ)
  ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
end

AutoFrameCheckManager.AutoFrameCheck = function(self)
  -- function num : 0_6 , upvalues : enTimeValue, enCameraValue
  if self._maxIndex <= 0 then
    return 
  end
  local nowTick = (os.time)()
  local deltaTick = nowTick - self._prevTick
  if deltaTick < enTimeValue.Second then
    return 
  end
  local X = ((self._PositionList)[self._index])._goalX
  local Y = ((self._PositionList)[self._index])._goalY
  local Z = ((self._PositionList)[self._index])._goalZ
  local selfPlayer = getSelfPlayer()
  if self:isArriveGoalbyPosition(X, Y, Z) == true then
    self:RunningStop()
    self._index = self._index + 1
    if self._maxIndex <= self._index then
      if self._isRpeat == true then
        self._index = 0
        _PA_LOG("�\128민혁", "무한반복합니�\164.")
        return 
      end
      self._isOn = false
      _PA_LOG("�\128민혁", "자동 프레임체�\172 매니�\128 종료!!!")
      return 
    end
    self._isStop = true
    self._prevTick = (os.time)()
    _PA_LOG("�\128민혁", "다음 좌표�\156 이동합니�\164.")
    return 
  end
  if self._isStop == true and enTimeValue.StandingTime < deltaTick then
    self._isStop = false
    local position = float3(X, Y, Z)
    ToClient_WorldMapNaviStart(position, NavigationGuideParam(), true, true)
    self._prevTick = (os.time)()
    return 
  end
  do
    if self._isStop == true and deltaTick < enTimeValue.StandingTime then
      self:FrameCheck()
      self._cameraYaw = self._cameraYaw + enCameraValue.UpdateCameraYaw
      _PA_LOG("�\128민혁", "CameraYaw : " .. tostring(self._cameraYaw))
      selfPlayerSetCameraYaw(self._cameraYaw)
      if deltaTick < enTimeValue.StandingTime_Half then
        self._cameraPitch = enCameraValue.SetCameraPich_High
      else
        self._cameraPitch = enCameraValue.SetCameraPich_Low
      end
      selfPlayerSetCameraPich(self._cameraPitch)
      self:RunningStop()
      return 
    end
    if self._isStop == false and enTimeValue.RunningTime < deltaTick then
      self._isStop = true
      self._cameraYaw = 0
      self._cameraPitch = 0
      self._cameraRoll = 0
      self._prevTick = (os.time)()
      self:RunningStop()
      return 
    end
  end
end

AutoFrameCheckManager_UpdatePerFrame = function()
  -- function num : 0_7 , upvalues : AutoFrameCheckManager
  if AutoFrameCheckManager._isOn == false then
    return 
  end
  AutoFrameCheckManager:AutoFrameCheck()
end

FGlobal_AutoFrameCheck_setMinFrame = function(frame)
  -- function num : 0_8 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  AutoFrameCheckManager._minFrame = frame
end

FGlobal_AutoFrameCheck_addPositionList = function(X, Y, Z)
  -- function num : 0_9 , upvalues : AutoFrameCheckManager
  local nowIndex = AutoFrameCheckManager._maxIndex
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R4 in 'UnsetPending'

  AutoFrameCheckManager._maxIndex = AutoFrameCheckManager._maxIndex + 1
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R4 in 'UnsetPending'

  ;
  (AutoFrameCheckManager._PositionList)[nowIndex] = {_goalX = X, _goalY = Y, _goalZ = Z}
end

FGlobal_AutoFrameCheck_resetPositionList = function()
  -- function num : 0_10 , upvalues : AutoFrameCheckManager
  FGlobal_AutoFrameCheck_Stop()
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._index = 0
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._maxIndex = 0
  -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._prevTick = 0
  -- DECOMPILER ERROR at PC10: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._PositionList = {}
end

FGlobal_AutoFrameCheck_Start = function()
  -- function num : 0_11 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._isOn = true
end

FGlobal_AutoFrameCheck_Stop = function()
  -- function num : 0_12 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._isOn = false
end

FGlobal_setAutoFrameCheckRepeat = function(value)
  -- function num : 0_13 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  AutoFrameCheckManager._isRpeat = value
end

OnFrameCheck = function()
  -- function num : 0_14 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._isOn = true
  _PA_LOG("�\128민혁", "자동 프레임체�\172 매니�\128 시작!!!")
end

OffFrameCheck = function()
  -- function num : 0_15 , upvalues : AutoFrameCheckManager
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  AutoFrameCheckManager._isOn = false
  _PA_LOG("�\128민혁", "자동 프레임체�\172 매니�\128 종료!!!")
end

testAutoQuestStart = function()
  -- function num : 0_16
  setRunningTime(10)
  setStandingTime(5)
  FGlobal_AutoFrameCheck_setMinFrame(45)
  FGlobal_AutoFrameCheck_addPositionList(16462, -6425, 76610)
  FGlobal_AutoFrameCheck_addPositionList(-341143.41, -1757.68, -109075.41)
  FGlobal_AutoFrameCheck_addPositionList(16462, -6425, 76610)
  FGlobal_AutoFrameCheck_addPositionList(-341143.41, -1757.68, -109075.41)
  FGlobal_setAutoFrameCheckRepeat(false)
  FGlobal_AutoFrameCheck_Start()
end

testScreenShot = function()
  -- function num : 0_17
  ToClient_Capture()
end

testAutoQuestEnd = function()
  -- function num : 0_18
  FGlobal_AutoFrameCheck_resetPositionList()
end

setYaw = function(value)
  -- function num : 0_19
  selfPlayerSetCameraYaw(value)
end



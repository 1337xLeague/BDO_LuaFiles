-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase14_hidel_findnearnpc.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_Hidel_FindNearNpc = {_currentStep = 0, _nextStep = 0, _currentProgress = 1, _prevProgress = 1, _updateTime = 0, _isSkippable = true, 
_talkerCharacterKeyData = {[1] = 41004, [2] = 41056}
, 
_questData = {}
}
-- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.startPhase = function(self, stepNo)
  -- function num : 0_0
  _PA_LOG("๊ณฝ๋ฏผ์\176", "PaGlobal_TutorialPhase_Hidel_FindNearNpc:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 1
  self._updateTime = 0
  classType = (getSelfPlayer()):getClassType()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.endPhase = function(self)
  -- function num : 0_1
  self._prevProgress = 1
  self._currentStep = 0
  self._nextStep = 1
  FGlobal_TownNpcNavi_EraseAllEffect()
  ;
  (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16)):EraseAllEffect()
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

local result = false
-- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.updatePerFrame = function(self, deltaTime)
  -- function num : 0_2
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentStep == 1 then
    self:updateStep1(deltaTime)
  else
    if self._currentStep == 2 then
      self:updateStep2(deltaTime)
    else
      if self._currentStep == 4 then
        self:updateStep4(deltaTime)
      end
    end
  end
end

-- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleChangeStep = function(self, currentStep)
  -- function num : 0_3
  if self._currentStep == 1 then
    self:changeStep1()
  else
    if self._currentStep == 2 then
      self:changeStep2()
    else
      if self._currentStep == 3 then
        self:changeStep3()
      else
        if self._currentStep == 4 then
          self:changeStep4()
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC29: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.toNextProgress = function(self)
  -- function num : 0_4
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC32: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.toNextStep = function(self)
  -- function num : 0_5
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC35: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.toStep = function(self, destStep, destProgress)
  -- function num : 0_6
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
  if self._currentStep == self._nextStep then
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC38: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.changeStep1 = function(self)
  -- function num : 0_7
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ ๋ฒ ํ\176 ๋ง์์\144 ๋์ฐฉํ๋ค.\n์ฌ๊ธด ํ์ด๋\184, ์ธ๋ ๋์์\152 ์๋์\188.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("ํ\176 ๋ง์์\144 ์ค๋๊น\140 ๋๋ ต์ง\128?\nํ์ง๋ง\140 ๊ฑฑ์  ๋ง\136. ๋ด๊ฐ ๋์์ค\132 ํ๋๊น\140!", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ฐ์  NPC๋ฅ\188 ์ฐพ๋ ๋ฐฉ๋ฒ์\132 ์๋ ค์ค๊ฒ.\n์\180 ๋ง์์\148 ๊ฑฐ์ ๋ชจ๋  NPC๊ฐ\128 ์๊ฑฐ๋\160.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
      end
    end
  end
end

-- DECOMPILER ERROR at PC41: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.updateStep1 = function(self, deltaTime)
  -- function num : 0_8
  if self._currentProgress <= 3 then
    if 2.5 * timeRatio < self._updateTime then
      self._updateTime = 0
      if self._currentProgress == 3 then
        self:toNextStep()
        return 
      else
        self:toNextProgress()
        return 
      end
    end
    self._updateTime = self._updateTime + deltaTime
  end
end

-- DECOMPILER ERROR at PC44: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.changeStep2 = function(self)
  -- function num : 0_9
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\144, ๊ทธ๋ผ ์ \128 ์์ ๋ฉ๋ด ์ค์", "NPC๋ผ๊ณ  ์ ํ ๋๋ณด๊ธฐ๋ฅผ ๋๋ฌ ๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
    FGlobal_TownNpcNavi_AddEffect("UI_Tutorial_MouseMove", true, 0, 0)
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):showChildControlMasking(Panel_Widget_TownNpcNavi, FGlobal_TownNpcNavi_GetFindNaviButton())
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180! ๋ฐ๋ก ์\180 ์ฐฝ์์\156\n๋ค๊ฐ ์ํ๋\148 NPC๋ฅ\188 ์ฐพ์ ์\152 ์์ด.", "", true, Panel_NpcNavi:GetPosX() - Panel_NpcNavi:GetSizeX() / 3, Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY() / 3)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ฐ์  ์กํ ์์ธ NPC๋ฅ\188 ์ฐพ์๋ณผ๊น?", "ํ์ฑํ๋ ์กํ ์์ธ ๋ฒํผ์\132 ๋๋ฌ๋ด\144.", true, Panel_NpcNavi:GetPosX() - Panel_NpcNavi:GetSizeX() / 3, Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY() / 3)
  end
)
        FGlobal_TownNpcNavi_EraseAllEffect()
        FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
        ;
        (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(8)):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
        ;
        (PaGlobal_TutorialUiManager:getUiMasking()):showChildControlMasking(Panel_NpcNavi, FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(8))
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ข์! ์ํ์\180.\n๊ท\184 ๋ฒํผ์\132 ๋๋ฅด๋ฉ\180 ๋ฐ๋ก ๊ธธ์๋ด๊ฐ ์๊ธฐ๊ฑฐ๋ .", "", true, Panel_NpcNavi:GetPosX() - Panel_NpcNavi:GetSizeX() / 3, Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY() / 3)
  end
)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC47: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.updateStep2 = function(self, deltaTime)
  -- function num : 0_10
  if self._currentProgress == 2 then
    if 2.5 * timeRatio < self._updateTime then
      self._updateTime = 0
      self:toNextProgress()
      return 
    end
    self._updateTime = self._updateTime + deltaTime
  else
    if self._currentProgress == 4 then
      if 2.5 * timeRatio < self._updateTime then
        self._updateTime = 0
        self:toNextStep()
        return 
      end
      self._updateTime = self._updateTime + deltaTime
    end
  end
end

-- DECOMPILER ERROR at PC50: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep2NpcNavi_ShowToggle = function(self, isShow)
  -- function num : 0_11
  if self._currentProgress == 1 and isShow == true then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC53: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep2ClickedTownNpcIconNaviStart = function(self, spawnType, isAuto)
  -- function num : 0_12
  if self._currentProgress == 3 and (CppEnums.SpawnType).eSpawnType_Potion == spawnType then
    FGlobal_TownNpcNavi_EraseAllEffect()
    ;
    (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(8)):EraseAllEffect()
    ;
    (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
    FGlobal_NpcNavi_HideAni()
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC56: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.changeStep3 = function(self)
  -- function num : 0_13
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_13_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ธธ์๋ด๋ฅผ ๋ฐ๋ผ๊ฐ\128์\156", "์กํ์์ธ NPC ๋ผ๋ผ๋ฅ\188 ๋ง๋๋ณด์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    ToClient_DeleteNaviGuideByGroup()
    worldmapNavigatorStart(float3(36989.1, -2839.89, -43024.9), NavigationGuideParam(), false, false, true)
  end
end

-- DECOMPILER ERROR at PC59: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep3ShowDialog = function(self, dialogData)
  -- function num : 0_14
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:toNextStep()
  end
end

-- DECOMPILER ERROR at PC62: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.changeStep4 = function(self)
  -- function num : 0_15
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_15_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ทธ๋ผ ์ด๋ฒ์\148 ๊ฑฐ๋์\140 NPC๋ฅ\188 ์ฐพ์๋ณผ๊น?", "์๋ ค์ค\128 ๋ฐฉ์๋\128๋ก\156 ์์ดํ\156 ๊ฑฐ๋์\140 NPC๋ฅ\188 ์ฐพ์๊ฐ\128๋ด\144.", true, Panel_NpcNavi:GetPosX() - Panel_NpcNavi:GetSizeX() / 3, Panel_NpcNavi:GetPosY() + Panel_NpcNavi:GetSizeY() / 3)
  end
)
    FGlobal_TownNpcNavi_EraseAllEffect()
    FGlobal_TownNpcNavi_AddEffect("UI_WorldMap_Ping01", true, 0, 0)
    ;
    (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16)):AddEffect("UI_WorldMap_Ping02", true, 0, 0)
  else
    if self._currentProgress == 2 then
      self._updateTime = 0
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_15_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ์ํ๋\148 NPC๋\148 ์ฝ๊ฒ ์ฐพ์ ์\152 ์๊ฒ ์ง\128?", "์ด์  ํ๋ ๋ชจํ์\132 ๊ณ์ ํ\180.\n์๋ ค์ค๊ฒ ๋\148 ์๊ธฐ๋ฉ\180 ๊ท\184 ๋\140 ๋\144 ๋ง๋์๊ณ .", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
      FGlobal_TownNpcNavi_EraseAllEffect()
      ;
      (FGlobal_TownNpcNavi_GetUiControlNpcNaviIconByArrayIndex(16)):EraseAllEffect()
      ;
      (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
    end
  end
end

-- DECOMPILER ERROR at PC65: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.updateStep4 = function(self, deltaTime)
  -- function num : 0_16
  if self._currentProgress == 2 then
    if 4 * timeRatio < self._updateTime then
      self._updateTime = 0
      self:endPhase()
    end
    self._updateTime = self._updateTime + deltaTime
  end
end

-- DECOMPILER ERROR at PC68: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep4ClickedExitButton = function(self, talker)
  -- function num : 0_17
  if self._currentProgress == 1 and (self._talkerCharacterKeyData)[2] == talker:getCharacterKey() then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC71: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleRegionChanged = function(self, regionInfo)
  -- function num : 0_18
end

-- DECOMPILER ERROR at PC74: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleNpcNavi_ShowToggle = function(self, isShow)
  -- function num : 0_19
  if self._currentStep == 2 then
    self:eventCallStep2NpcNavi_ShowToggle(isShow)
  end
end

-- DECOMPILER ERROR at PC77: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleClickedTownNpcIconNaviStart = function(self, spawnType, isAuto)
  -- function num : 0_20
  if self._currentStep == 2 then
    self:eventCallStep2ClickedTownNpcIconNaviStart(spawnType, isAuto)
  end
end

-- DECOMPILER ERROR at PC80: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleShowDialog = function(self, dialogData)
  -- function num : 0_21
  if self._currentStep == 3 then
    self:eventCallStep3ShowDialog(dialogData)
  end
end

-- DECOMPILER ERROR at PC83: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.handleClickedExitButton = function(self, talker)
  -- function num : 0_22
  if self._currentStep == 4 then
    self:eventCallStep4ClickedExitButton(talker)
  end
end



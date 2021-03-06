-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase14_hidel_trade.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_Hidel_Trade = {_phaseNo = 14, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 1, _updateTime = 0, _isPhaseOpen = false, _isSkippable = true, 
_regionKeyRawList = {32, 38, 42, 62, 318}
, 
_waypointKeyData = {[1] = 323}
, 
_talkerCharacterKeyData = {[1] = 41085}
, 
_questData = {
[1] = {_questGroupNo = 2039, _questId = 2}
}
}
local isSatisfiedCondition = false
-- DECOMPILER ERROR at PC33: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.checkPossibleForPhaseStart = function(self, stepNo)
  -- function num : 0_0
  if self._isPhaseOpen == false then
    _PA_LOG("๊ณฝ๋ฏผ์\176", "ํํ ๋ฆฌ์ผ Phase๊ฐ\128 ๋ซํ์์ผ๋ฏ\128๋ก\156 ํํ ๋ฆฌ์ผ์\132 ์์ํ์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local selfPlayer = getSelfPlayer()
  if selfPlayer == nil then
    _PA_LOG("๊ณฝ๋ฏผ์\176", "ํํ ๋ฆฌ์ผ ์์ ๊ฐ\128๋\165 ์ฌ๋ถ ๊ฒ\128์ฌ์ค์\144 selfPlayer๊ฐ\128 ์์ต๋๋ค! _phaseNo : " .. tostring(self._phaseNo))
    return false
  end
  local currentRegionKeyRaw = selfPlayer:getRegionKeyRaw()
  local isPossiblePhaseRegion = false
  for index,value in pairs(self._regionKeyRawList) do
    if value == currentRegionKeyRaw then
      isPossiblePhaseRegion = true
      break
    end
  end
  do
    if isPossiblePhaseRegion == false then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "ํํ ๋ฆฌ์ผ์\180 ๊ฐ\128๋ฅํ ์ง\128์ญ์ด ์๋๋ฏ\128๋ก\156 ํํ ๋ฆฌ์ผ์\132 ์คํํ์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    local explorePoint = getExplorePointByTerritoryRaw(getDefaultTerritoryKey())
    if explorePoint == nil then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "explorePoint๊ฐ\128 nil ์๋๋\164. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    if explorePoint:getRemainedPoint() < 2 then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "๊ณตํ๋๊ฐ ๋ถ\128์กฑํด์\156 ์์ํ์ง ์์ต๋๋ค. : _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    return true
  end
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC39: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.startPhase = function(self, stepNo)
  -- function num : 0_2
  if self:checkPossibleForPhaseStart(stepNo) == false then
    return 
  end
  if PaGlobal_SummonBossTutorial_Manager:isDoingSummonBossTutorial() == true then
    PaGlobal_SummonBossTutorial_Manager:endTutorial()
    _PA_LOG("๊ณฝ๋ฏผ์\176", "ํํ ๋ฆฌ์ผ phase(" .. tostring(self._phaseNo) .. ")๊ฐ\128 ๋ณด์ค ์ํ ํํ ๋ฆฌ์ผ์\132 ์ข๋ฃ์ํด! _phaseNo : " .. tostring(self._phaseNo))
  end
  local isSkippable = self:checkSkippablePhase()
  if isSkippable == true and PaGlobal_TutorialManager:isDoingTutorial() == false then
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo)
  else
    self:startPhaseXXX(stepNo)
  end
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("๊ณฝ๋ฏผ์\176", "PaGlobal_TutorialPhase_Hidel_Trade:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 1
  self._updateTime = 0
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  FGlobal_Dialog_SetAllowTutorialPanelShow(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.endPhase = function(self)
  -- function num : 0_4
  FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
  FGlobal_Dialog_SetAllowTutorialPanelShow(false)
  FGlobal_NodeMenu_SetEnableNodeUnlinkButton(true)
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Shop)
  FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  FGlobal_EraseAllEffect_ExitButton()
  PaGlobal_TutorialUiBlackSpirit:setIgnoreBubble(true)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC51: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentStep == 1 then
    self:changeStep1()
  else
    if self._currentStep == 2 then
      self:changeStep2()
    else
      if self._currentStep == 3 then
        self:changeStep3()
      end
    end
  end
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC60: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.toStep = function(self, destStep, destProgress)
  -- function num : 0_9
  self._nextStep = destStep
  if destProgress == nil then
    self._currentProgress = 1
  else
    self._currentProgress = destProgress
  end
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.addEffectUiNodeButtonByWaypointKey = function(self, waypointKey)
  -- function num : 0_10
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if uiNodeButton ~= nil then
    uiNodeButton:EraseAllEffect()
    uiNodeButton:AddEffect("UI_ArrowMark02", true, 0, -50)
    uiNodeButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eraseAllEffectUiNodeButtonByWaypointKey = function(self, waypointKey)
  -- function num : 0_11
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if uiNodeButton ~= nil then
    uiNodeButton:EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.setEffectDialogButtonByType = function(self, funcButtonType)
  -- function num : 0_12
  local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType(funcButtonType)
  if funcButtonIndex == -1 then
    return false
  end
  FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
  FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
  return true
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.isInvestedContributePoint = function(self, waypointKey)
  -- function num : 0_13
  if isExploreUpgradable(waypointKey) == true then
    if isWithdrawablePlant(waypointKey) == true then
      return true
    else
      if isWithdrawablePlant(waypointKey) == false then
        return false
      end
    end
  end
  return false
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.changeStep1 = function(self)
  -- function num : 0_14
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\164? ๋\136 ๊ทธ๊ฑฐ ๊ณ ๋์\152 ์ฒ ์ฃผํ์์\132?\n๊ทธ๋ฐ๊ฑ\180 ์์ ์\144 ๊ทธ๋ฅ ํ\148 ์\152 ์๋ ๋ฌผ๊ฑด์ธ๋ฐ.", "", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, false)
  end
)
  else
    if self._currentProgress == 2 then
      FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
      self._updateTime = 0
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\180 ์ฃผํ๋ฅ\188 ๋ค๋ฅธ ์ง\128์ญ์ผ๋ก\156 ๊ฐ\128์\156 ํ๋งคํด๋ณด์\144.", "<M>ํค๋ฅผ ๋๋ฌ์\156 ์๋๋งต์ ์ด์ด๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("ํ์๋\156 ๋ชจ๋ ํ\176 ๊ฑฐ๋ ๋์ฅ์\180 ๋ณด์ด์ง\128?", "๋ชจ๋ ํ\176 ๊ฑฐ๋ ๋์ฅ ๊ฑฐ์ ์\132 ์ฐํด๋ฆ\173 ํด๋ด.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
      else
        if self._currentProgress == 4 then
          FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
          self:eraseAllEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180. ๋ชฉ์ ์ง\128๋ฅ\188 ์ฐพ์๊ฐ\128๋ ค๋ฉด ์๋๋งต์ ๋ซ์์ผ๊ฒ ์ง\128?", "์ด๋ํด์ผํ๋๊น\140 <ESC>๋\152 <M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ๋ซ์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
        else
          if self._currentProgress == -1 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_14_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_41"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_OBSIDIAN_TEXT_NEW_KR_42"), false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5, true)
  end
)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1WorldMapOpen = function(self)
  -- function num : 0_15
  if self._currentProgress == 2 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_16
  if self._currentProgress == 3 then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
  else
    if self._currentProgress == -1 then
      self._currentProgress = self._prevProgress
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_17
  if self._currentProgress == 3 then
    self._prevProgress = self._currentProgress
    self._currentProgress = -1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == 4 then
      if self:isInvestedContributePoint((self._waypointKeyData)[1]) == true then
        self:toStep(3)
      else
        self:toNextStep()
      end
    end
  end
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_18
  if self._currentProgress >= 3 and self._currentProgress <= 4 then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
  end
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1RClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_19
  if self._currentProgress == 3 and (self._waypointKeyData)[1] == uiNodeButton:getWaypointKey() then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1BeforeShowDialog = function(self)
  -- function num : 0_20
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    FGlobal_Dialog_SetAllowTutorialPanelShow(true)
  else
    FGlobal_Dialog_SetAllowTutorialPanelShow(false)
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1ShowDialog = function(self, dialogData)
  -- function num : 0_21
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    if self:isInvestedContributePoint((self._waypointKeyData)[1]) == true then
      self:toStep(3, 2)
      self:eventCallStep3ShowDialog(dialogData)
    else
      self:toStep(2, 2)
      self:eventCallStep2ShowDialog(dialogData)
    end
  end
end

-- DECOMPILER ERROR at PC100: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1CheckQuestCondition = function(self)
  -- function num : 0_22 , upvalues : isSatisfiedCondition
  if isSatisfiedCondition == false then
    local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId)
    if isSatisfy == true then
      isSatisfiedCondition = true
      audioPostEvent_SystemUi(4, 12)
      self:endPhase()
    end
  end
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep1MouseLUpBubble = function(self)
  -- function num : 0_23
  if self._currentProgress == 4 then
    self:toNextStep()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.changeStep2 = function(self)
  -- function num : 0_24
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_24_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ธธ์๋ด๋ฅผ ๋ฐ๋ผ๊ฐ\128๋ฉ\180 <ํํ ๊ฑฐ์  ๊ด\128๋ฆฌ์>๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํ\176 ์๊ฒ ๋๋ฌํ๊ฒ ๋ ๊ฑฐ์\188.", "๊ธธ์๋ด๋ฅผ ๋ฐ๋ผ ๋\128์์ ์ฐพ์ ๋ง์ ๊ฑธ์ด๋ณด์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
  else
    if self._currentProgress == 2 then
      FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_24_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๋ฌด์ญ์\132 ํ๊ธฐ ์ ์ ๊ฑฐ์ ์\132 ๊ด\128๋ฆฌ๋ฅผ ํด๋ณด์\144.", "๋\128ํ๋ฉ๋ด์ค์\144 \'ํํ ๊ฑฐ์  ๊ด\128๋ฆ\172\'๋ฒํผ์\132 ๋๋ฌ๋ด\144.", false, getScreenSizeX() * 0.55, getScreenSizeY() * 0.45, true)
  end
)
    else
      if self._currentProgress == 3 then
        local positionTarget = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
        do
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_24_2 , upvalues : positionTarget
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๋ฌด์ญ์\128 ๋ฌผํ์\152 ์์ฐ์ง\128 ๊ฑฐ์ ๊ณ\188 ํ๋งคํ\160 ๊ฑฐ์ ์\180 ์ฐ๊ฒฐ ๋์ด ์์ด์\188 ์ ๊ฐ์\132 ๋ฐ์.\n๊ฑฐ์ ์\132 ์ฐ๊ฒฐํ๊ณ  ์ถ์ผ๋ฉ\180 ๊ณตํ๋๋ฅผ ํฌ์ํด์ผ๋\188.", "์ผ์ชฝ ์์ ํ์๋\156 \'๊ณตํ๋\132 ํฌ์\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0.5, true)
  end
)
        end
      else
        do
          while 1 do
            if self._currentProgress == 4 then
              if ToClient_isTownMode() == true then
                FGlobal_WorldMapWindowEscape()
                -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_24_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ๊ฑฐ์ ๊ฐ์ ์ฐ๊ฒฐ๋\156 ์ ์ด ๋ถ์ด์ง\132 ๊ฒ์ด ๋ณด์ด์ง\128?\n์ด๋ ๊ฒ\140 ๋๋ฉด ๋\144 ๊ฑฐ์ ์\180 ์ฐ๊ฒฐ๋๊ฑฐ์\188.\n์ด๊ฒ์\180 ๋์ ์ฒ\171 ๊ฑฐ์  ์ฐ๊ฒฐ์\180 ๋๊ฒ ๊ต\176.", "์ด์  <ESC>ํค๋ <M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ๋ซ์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep2BeforeShowDialog = function(self)
  -- function num : 0_25
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    FGlobal_Dialog_SetAllowTutorialPanelShow(true)
  else
    FGlobal_Dialog_SetAllowTutorialPanelShow(false)
  end
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep2ShowDialog = function(self, dialogData)
  -- function num : 0_26
  -- DECOMPILER ERROR at PC13: Unhandled construct in 'MakeBoolean' P1

  if self._currentProgress == 1 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:setEffectDialogButtonByType((CppEnums.ContentsType).Contents_Explore)
    self:toNextProgress()
  end
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:setEffectDialogButtonByType((CppEnums.ContentsType).Contents_Explore)
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep2ClickedExitButton = function(self, talker)
  -- function num : 0_27
  if self._currentProgress == 2 then
    if dialog_getTalkNpcKey() == 0 then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "๋\128ํ์ค์\184 NPCํ\164 ๊ฐ์ด 0์\180 ๋์๋\164! NPC์ ๋ณด๊ฐ\128 ์๊ฑฐ๋\152 ์ ์์ ์ผ๋ก\156 ์ ๋ณด๋ฅ\188 ๋ฐ์ง ๋ชปํ์\140! _phaseNo : " .. tostring(self._phaseNo))
      return 
    end
    self._currentProgress = 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep2ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_28
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() and (CppEnums.ContentsType).Contents_Explore == funcButtonType then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep2EventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_29
  if self._currentProgress == 3 and (self._waypointKeyData)[1] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep2WorldMapImmediatelyClose = function(self)
  -- function num : 0_30
  if self._currentProgress < 4 then
    self._currentProgress = 1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == 4 then
      FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
      self:toNextStep()
    end
  end
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep2CheckQuestCondition = function(self)
  -- function num : 0_31 , upvalues : isSatisfiedCondition
  if isSatisfiedCondition == false then
    local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId)
    if isSatisfy == true then
      isSatisfiedCondition = true
      audioPostEvent_SystemUi(4, 12)
      self:endPhase()
    end
  end
end

-- DECOMPILER ERROR at PC131: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.changeStep3 = function(self)
  -- function num : 0_32
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_32_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ๊ณ ๋ ์ฒ ์ฃผํ๋ฅผ ํ๋งคํ๋ฌ ๊ฐ\128๋ณด์.", "\'๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํ\176\'์๊ฒ ๊ฐ\128์\156 ๋ง์ ๊ฑธ์ด๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
    ToClient_DeleteNaviGuideByGroup()
    worldmapNavigatorStart(float3(73723.8, -1352.55, -70902.8), NavigationGuideParam(), false, false, true)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_32_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ณ ๋ ์ฒ ์ฃผํ๋ฅผ ํ๋งคํ\180 ๋ณผ๊ฑฐ์\188.", "๋\128ํ๋ฉ๋ด์ค์\144 \'๋ฌด์ญ\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, getScreenSizeX() * 0.3, getScreenSizeY() * 0.45, true)
  end
)
    else
      if self._currentProgress == 3 then
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_32_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๋ฌด์ญํ์ ์์๊ฐ๊ฐ ์์ธ๊ฐ\128 ๋ณ\128ํ\180.\n๊ทธ๊ฑด ์ผ์ชฝ ์์ธ ํํฉํ์์\156 ์์ธํ\136 ํ์ธํ\160 ์\152 ์์ง.", "", false, Panel_Trade_Market_Graph_Window:GetPosX() + Panel_Trade_Market_Graph_Window:GetSizeX() * 1.1, Panel_Trade_Market_Graph_Window:GetPosY() + Panel_Trade_Market_Graph_Window:GetSizeY() * 0.5, false)
  end
)
      else
        if self._currentProgress == 4 then
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_32_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ฐ์ธก์\152 ํ๋งค ๋ฒํผ์\132 ๋๋ฅด๋ฉ\180 ๋ฌด์ญํ์ ํ๋งค ํ\160 ์\152 ์์ด.\n๊ธฐ์ด์\180 ๋์น๋ค๋ฉด ๊ฐ\128๊ฒ\169 ํฅ์ ์\144 ๋์ ํ๋๊ฒ๋ ์ข์.", "", false, Panel_Trade_Market_Graph_Window:GetPosX() + Panel_Trade_Market_Graph_Window:GetSizeX() * 1.1, Panel_Trade_Market_Graph_Window:GetPosY() + Panel_Trade_Market_Graph_Window:GetSizeY() * 0.5, false)
  end
)
        else
          if self._currentProgress == 5 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_32_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊พธ์คํ\136 ์ฌ์ฐ์\132 ์์๋ณด๋ผ๊ณ\160.\n๊ทธ๋ผ ๋์ค์\144 ๋ณด์.", "[ํํ ๋ฆฌ์ผ ์ข๋ฃ]", false, Panel_Trade_Market_Graph_Window:GetPosX() + Panel_Trade_Market_Graph_Window:GetSizeX() * 1.1, Panel_Trade_Market_Graph_Window:GetPosY() + Panel_Trade_Market_Graph_Window:GetSizeY() * 0.5, false)
  end
)
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC134: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep3BeforeShowDialog = function(self)
  -- function num : 0_33
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    FGlobal_Dialog_SetAllowTutorialPanelShow(true)
  else
    FGlobal_Dialog_SetAllowTutorialPanelShow(false)
  end
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep3ShowDialog = function(self, dialogData)
  -- function num : 0_34
  -- DECOMPILER ERROR at PC13: Unhandled construct in 'MakeBoolean' P1

  if self._currentProgress == 1 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:setEffectDialogButtonByType((CppEnums.ContentsType).Contents_Shop)
    self:toNextProgress()
  end
  if (self._currentProgress == 2 or self._currentProgress == 3) and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    self:setEffectDialogButtonByType((CppEnums.ContentsType).Contents_Shop)
  end
end

-- DECOMPILER ERROR at PC140: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep3ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_35
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() and (CppEnums.ContentsType).Contents_Shop == funcButtonType then
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC143: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep3ClickedExitButton = function(self, talker)
  -- function num : 0_36
  if self._currentProgress == 2 then
    if dialog_getTalkNpcKey() == 0 then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "๋\128ํ์ค์\184 NPCํ\164 ๊ฐ์ด 0์\180 ๋์๋\164! NPC์ ๋ณด๊ฐ\128 ์๊ฑฐ๋\152 ์ ์์ ์ผ๋ก\156 ์ ๋ณด๋ฅ\188 ๋ฐ์ง ๋ชปํ์\140! _phaseNo : " .. tostring(self._phaseNo))
      return 
    end
    self._currentProgress = 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC146: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_FindNearNpc.eventCallStep3ShowDialog = function(self, dialogData)
  -- function num : 0_37
  if self._currentProgress == 1 then
    if dialog_getTalkNpcKey() == 0 then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "๋\128ํ์ค์\184 NPCํ\164 ๊ฐ์ด 0์\180 ๋์๋\164! NPC์ ๋ณด๊ฐ\128 ์๊ฑฐ๋\152 ์ ์์ ์ผ๋ก\156 ์ ๋ณด๋ฅ\188 ๋ฐ์ง ๋ชปํ์\140!")
      return 
    end
    if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      self:toNextStep()
    end
  end
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep3CheckQuestCondition = function(self)
  -- function num : 0_38 , upvalues : isSatisfiedCondition
  if isSatisfiedCondition == false then
    local isSatisfy = PaGlobal_TutorialManager:isSatisfiedQuestCondition(((self._questData)[1])._questGroupNo, ((self._questData)[1])._questId)
    if isSatisfy == true then
      isSatisfiedCondition = true
      audioPostEvent_SystemUi(4, 12)
      self:endPhase()
    end
  end
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.eventCallStep3MouseLUpBubble = function(self)
  -- function num : 0_39
  if self._currentProgress == 5 then
    self:endPhase()
  else
    self:toNextProgress()
  end
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleRegionChanged = function(self, regionInfo)
  -- function num : 0_40
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleQuestWidgetUpdate = function(self)
  -- function num : 0_41
  if self._currentStep == 1 then
    self:eventCallStep1CheckQuestCondition()
  else
    if self._currentStep == 2 then
      self:eventCallStep2CheckQuestCondition()
    else
      if self._currentStep == 3 then
        self:eventCallStep3CheckQuestCondition()
      end
    end
  end
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleBeforeWorldmapOpen = function(self)
  -- function num : 0_42
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpen()
  end
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleWorldMapOpenComplete = function(self)
  -- function num : 0_43
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_44
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  else
    if self._currentStep == 2 then
      self:eventCallStep2WorldMapImmediatelyClose()
    end
  end
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleResetTownMode = function(self)
  -- function num : 0_45
  if self._currentStep == 1 then
    self:eventCallStep1ResetTownMode()
  end
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleRClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_46
  if self._currentStep == 1 then
    self:eventCallStep1RClickWorldMapNode(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC177: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleBeforeShowDialog = function(self)
  -- function num : 0_47
  if self._currentStep == 1 then
    self:eventCallStep1BeforeShowDialog()
  else
    if self._currentStep == 2 then
      self:eventCallStep2BeforeShowDialog()
    else
      if self._currentStep == 3 then
        self:eventCallStep3BeforeShowDialog()
      end
    end
  end
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleShowDialog = function(self, dialogData)
  -- function num : 0_48
  if self._currentStep == 1 then
    self:eventCallStep1ShowDialog(dialogData)
  else
    if self._currentStep == 2 then
      self:eventCallStep2ShowDialog(dialogData)
    else
      if self._currentStep == 3 then
        self:eventCallStep3ShowDialog(dialogData)
      end
    end
  end
end

-- DECOMPILER ERROR at PC183: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_49
  if self._currentStep == 2 then
    self:eventCallStep2ClickedDialogFuncButton(funcButtonType)
  else
    if self._currentStep == 3 then
      self:eventCallStep3ClickedDialogFuncButton(funcButtonType)
    end
  end
end

-- DECOMPILER ERROR at PC186: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleClickedExitButton = function(self, talker)
  -- function num : 0_50
  if self._currentStep == 2 then
    self:eventCallStep2ClickedExitButton(talker)
  else
    if self._currentStep == 3 then
      self:eventCallStep3ClickedExitButton(talker)
    end
  end
end

-- DECOMPILER ERROR at PC189: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleEventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_51
  if self._currentStep == 2 then
    self:eventCallStep2EventUpdateExplorationNode(waypointKey)
  end
end

-- DECOMPILER ERROR at PC192: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Trade.handleMouseLUpBubble = function(self)
  -- function num : 0_52
  if self._currentStep == 1 then
    self:eventCallStep1MouseLUpBubble()
  else
    if self._currentStep == 3 then
      self:eventCallStep3MouseLUpBubble()
    end
  end
end



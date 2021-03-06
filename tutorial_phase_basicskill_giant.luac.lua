-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase_basicskill_giant.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_BasicSkill_Giant = {_phaseNo = 6, _currentType = 0, _currentStep = 0, _nextStep = 0, _currentProgress = 1, _updateTime = 0, _isPhaseOpen = true, _isSkippable = true, 
_regionKeyRawList = {88, 349}
, _startLimitLevel = 15, _totalScoldingCount = 3, _usedSkillCount = 0, _totalSkillCount = 2, _usedComboCount = 0, _totalComboCount = 2, _currentClearCount = 0, _totalClearCount = 2, 
_skillNoList = {
[1] = {314, 315, 316, 317, 295}
, 
[2] = {1041, 1041, 1163, 1164, 1165, 1166, 296}
, 
[3] = {1038, 1159, 1291, 1292}
, 
[4] = {1033, 1151, 1152}
}
, 
_questData = {
[1] = {_questGroupNo = 650, _questId = 3}
}
}
-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.checkPossibleForPhaseStart = function(self, stepNo)
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
    if self._startLimitLevel < ((getSelfPlayer()):get()):getLevel() then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "์บ๋ฆญํฐ์ ๋ ๋ฒจ์\180 " .. tostring(self._startLimitLevel) .. "๋ฅ\188 ์ด๊ณผํ์ผ๋ฏ\128๋ก\156 ํํ ๋ฆฌ์ผ์\132 ์งํํ์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    return true
  end
end

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.startPhase = function(self, stepNo, typeNo)
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
    PaGlobal_TutorialManager:questionPhaseSkip(self, stepNo, typeNo)
  else
    self:startPhaseXXX(stepNo, typeNo)
  end
end

local navigationGuideParam = nil
-- DECOMPILER ERROR at PC75: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.startPhaseXXX = function(self, stepNo, typeNo)
  -- function num : 0_3 , upvalues : navigationGuideParam
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("๊ณฝ๋ฏผ์\176", "PaGlobal_TutorialPhase_BasicSkill_Giant:startStep() typeNo : " .. tostring(typeNo))
  self._currentType = typeNo
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._updateTime = 0
  if self._currentType == 1 then
    classType = (getSelfPlayer()):getClassType()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
    PaGlobal_TutorialManager:setAllowMainQuestWidget(false)
    navigationGuideParam = NavigationGuideParam()
    -- DECOMPILER ERROR at PC41: Confused about usage of register: R3 in 'UnsetPending'

    navigationGuideParam._isAutoErase = false
    ToClient_DeleteNaviGuideByGroup()
    worldmapNavigatorStart(float3(-140505.36, 1157.95, 113244.4), navigationGuideParam, false, false, true)
    PaGlobal_TutorialUiManager:setShowAllDefaultUi(false)
    ;
    (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
    PaGlobal_TutorialUiManager:hideAllTutorialUi()
    FGlobal_Panel_Radar_Show(true)
    Panel_TimeBar:SetShow(true, false)
    GameTips_Show()
    GameTips_Reposition()
    FGlobal_NewQuickSlot_Update()
    QuickSlot_UpdateData()
    Panel_UIMain:SetShow(true, true)
    Panel_SelfPlayerExpGage:SetShow(true, false)
    FGlobal_Panel_MainStatus_User_Bar_Show()
    FGlobal_ClassResource_SetShowControl(true)
    Panel_CheckedQuest:SetShow(true, false)
    ;
    (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(true)
  end
  ;
  (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):resetShowAll(true)
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, true)
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R1 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.endPhase = function(self)
  -- function num : 0_4
  self._currentStep = 0
  self._nextStep = 1
  ;
  (PaGlobal_TutorialUiManager:getUiMasking()):hideQuestMasking()
  PaGlobal_TutorialManager:startNextPhase()
end

local result = false
-- DECOMPILER ERROR at PC83: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5 , upvalues : result
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
  if self._currentType == 1 then
    if self._currentStep == 1 then
      result = self:updateTryBasicSkill(deltaTime)
    else
      if self._currentStep == 2 then
        result = self:updateTrySkillCombo(deltaTime)
      else
        if self._currentStep == 3 then
          result = false
        end
      end
    end
  end
  if result == true then
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC86: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.handleChangeStep = function(self, currentStep)
  -- function num : 0_6
  if self._currentType == 1 then
    if self._currentStep == 1 then
      self:changeStepTryBasicSkill()
    else
      if self._currentStep == 2 then
        self:changeStepTrySkillCombo()
      else
        if self._currentStep == 3 then
          self:changeStepSuggestCallBlackSpirit()
        else
          if self._currentStep == 4 then
            self:endPhase()
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC89: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.showUiScoldingTooManyKeyInput = function(self)
  -- function num : 0_7
  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_7_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PRESSEDKEY_DARKSPIRIT"), "", true, getScreenSizeX() * 0.5 - 150, getScreenSizeY() * 0.5)
  end
)
end

-- DECOMPILER ERROR at PC92: Confused about usage of register: R2 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.changeStepTryBasicSkill = function(self)
  -- function num : 0_8
  if self._currentProgress == 1 then
    (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP1"))
    ;
    (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyAll(true)
    ;
    (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyMany(false, "_button_Tab", "_m0")
    ;
    (PaGlobal_TutorialUiManager:getUiKeyButton()):addEffect("_button_Tab", "UI_ItemInstall", true, 0, 0)
    ;
    (PaGlobal_TutorialUiManager:getUiKeyButton()):addEffect("_m0", "UI_ItemInstall", true, 0, 0)
  else
    if self._currentProgress == 2 then
      (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP2"))
      ;
      (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyAll(true)
      ;
      (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyMany(false, "_m0")
      ;
      (PaGlobal_TutorialUiManager:getUiKeyButton()):addEffect("_m0", "UI_ItemInstall", true, 0, 0)
    else
      if self._currentProgress == 3 then
        if self._totalSkillCount == self._usedSkillCount then
          (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):addClearStepEffect(3)
        else
          if self._totalSkillCount < self._usedSkillCount then
            return 
          end
        end
        ;
        (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "NEW_TUTORIAL_COMBO_05") .. PAGetString(Defines.StringSheet_GAME, "NEW_TUTORIAL_COMBO_06") .. PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP7") .. " ( " .. self._usedSkillCount .. " / " .. self._totalSkillCount .. " )")
        ;
        (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyAll(true)
        ;
        (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyMany(false, "_button_S", "_m1")
        ;
        (PaGlobal_TutorialUiManager:getUiKeyButton()):addEffect("_button_S", "UI_ItemInstall", true, 0, 0)
        ;
        (PaGlobal_TutorialUiManager:getUiKeyButton()):addEffect("_m1", "UI_ItemInstall", true, 0, 0)
      else
        if self._currentProgress == 4 then
          if self._totalSkillCount == self._usedSkillCount then
            (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):addClearStepEffect(4)
          else
            if self._totalSkillCount < self._usedSkillCount then
              return 
            end
          end
          ;
          (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_0_Combo_1") .. PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_COMBO_Giant_0_ComboKey_1") .. PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP7") .. " ( " .. self._usedSkillCount .. " / " .. self._totalSkillCount .. " )")
          ;
          (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyAll(true)
          ;
          (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyMany(false, "_m1")
          ;
          (PaGlobal_TutorialUiManager:getUiKeyButton()):addEffect("_m1", "UI_ItemInstall", true, 0, 0)
        end
      end
    end
  end
end

local isPressedTab = false
local isPressedMouseL = false
local mouseLUpCount = 0
local isBlackSpiritScolding = false
-- DECOMPILER ERROR at PC103: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.updateTryBasicSkill = function(self, deltaTime)
  -- function num : 0_9 , upvalues : isPressedTab, isPressedMouseL, mouseLUpCount, isBlackSpiritScolding
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(true)
  if self._currentProgress == 1 then
    if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_WeaponInOut) == true then
      isPressedTab = true
    end
    if keyCustom_IsDownOnce_Action((CppEnums.ActionInputType).ActionInputType_Attack1) == true then
      isPressedMouseL = true
    end
    if isPressedTab == true and isPressedMouseL == true then
      isPressedTab = false
      isPressedMouseL = false
      audioPostEvent_SystemUi(4, 12)
      ;
      (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):addClearStepEffect(1)
      ;
      (PaGlobal_TutorialUiManager:getUiKeyButton()):eraseEffectAll()
      ;
      (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyAll(true)
      audioPostEvent_SystemUi(4, 12)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  else
    if self._currentProgress == 2 then
      if keyCustom_IsUp_Action((CppEnums.ActionInputType).ActionInputType_Attack1) == true then
        mouseLUpCount = mouseLUpCount + 1
        if self._totalScoldingCount < mouseLUpCount and isBlackSpiritScolding == false then
          isBlackSpiritScolding = true
          self:showUiScoldingTooManyKeyInput()
        end
      end
      if keyCustom_IsPressed_Action((CppEnums.ActionInputType).ActionInputType_Attack1) == true then
        self._updateTime = self._updateTime + deltaTime
      end
      if self._updateTime > 2.25 then
        audioPostEvent_SystemUi(4, 12)
        ;
        (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):addClearStepEffect(2)
        ;
        (PaGlobal_TutorialUiManager:getUiKeyButton()):eraseEffectAll()
        ;
        (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyAll(true)
        if isBlackSpiritScolding == true then
          isBlackSpiritScolding = false
          ;
          (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setShowAll(false)
        end
        audioPostEvent_SystemUi(4, 12)
        self._updateTime = 0
        self._currentProgress = self._currentProgress + 1
        self:handleChangeStep(self._currentStep)
        return false
      end
    else
      -- DECOMPILER ERROR at PC161: Unhandled construct in 'MakeBoolean' P1

      if self._currentProgress == 3 and self._totalSkillCount <= self._usedSkillCount then
        self._updateTime = self._updateTime + deltaTime
        if self._updateTime > 1.25 then
          prevInputCombination = false
          isInputCombinationChanged = false
          self._usedSkillCount = 0
          self._updateTime = 0
          ;
          (PaGlobal_TutorialUiManager:getUiKeyButton()):eraseEffectAll()
          ;
          (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyAll(true)
          self._currentProgress = self._currentProgress + 1
          self:handleChangeStep(self._currentStep)
        end
      end
    end
  end
  if self._currentProgress == 4 and self._totalSkillCount <= self._usedSkillCount then
    self._updateTime = self._updateTime + deltaTime
    if self._updateTime > 1.25 then
      prevInputCombination = false
      isInputCombinationChanged = false
      self._usedSkillCount = 0
      self._updateTime = 0
      ;
      (PaGlobal_TutorialUiManager:getUiKeyButton()):eraseEffectAll()
      ;
      (PaGlobal_TutorialUiManager:getUiKeyButton()):setPrevUsingKeyAll(true)
      self._currentProgress = 1
      return true
    end
  end
  return false
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.eventCallUsedSkill_TryBasicSkill = function(self, skillWrapper)
  -- function num : 0_10
  local skillNo = skillWrapper:getSkillNo()
  local listNo = 0
  if self._currentProgress == 3 then
    listNo = 1
  else
    if self._currentProgress == 4 then
      listNo = 2
    else
      return 
    end
  end
  for key,value in pairs((self._skillNoList)[listNo]) do
    if skillNo == value then
      audioPostEvent_SystemUi(4, 12)
      self._usedSkillCount = self._usedSkillCount + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.changeStepTrySkillCombo = function(self)
  -- function num : 0_11
  if self._totalComboCount < self._usedComboCount then
    return 
  end
  self._currentClearCount = 0
  ;
  (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):resetClearStepEffect(true)
  ;
  (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP6") .. " ( " .. self._usedComboCount .. " / " .. self._totalComboCount .. " )")
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_1):SetText(PaGlobal_TutorialManager:getStringResize(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_GIANT_COMBO_0_2"), PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_GIANT_COMMAND_0_2"), 1))
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_2):SetText(PaGlobal_TutorialManager:getStringResize(PAGetString(Defines.StringSheet_GAME, "LUA_TUTORIAL_BASECOMBO_GIANT_COMBO_1_3"), PAGetString(Defines.StringSheet_GAME, "NEW_TUTORIAL_COMBO_35"), 2))
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_3):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextStep_4):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_1):SetShow(false)
  ;
  (((PaGlobal_TutorialUiManager:getUiHeadlineMessage())._ui)._nextArrow_2):SetShow(false)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(true)
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.updateTrySkillCombo = function(self, deltaTime)
  -- function num : 0_12
  (PaGlobal_TutorialUiManager:getUiKeyButton()):ButtonToggleAll(true)
  if self._totalComboCount <= self._usedComboCount then
    if self._updateTime > 1.75 then
      self._updateTime = 0
      self._usedComboCount = 0
      return true
    end
    self._updateTime = self._updateTime + deltaTime
  else
    if self._currentClearCount == 2 then
      if self._updateTime > 1.25 then
        self._updateTime = 0
        self:handleChangeStep(self._currentStep)
      end
      self._updateTime = self._updateTime + deltaTime
    end
  end
  return false
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R6 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.eventCallUsedSkill_TrySkillCombo = function(self, skillWrapper)
  -- function num : 0_13
  local listNo = 0
  local skillNo = skillWrapper:getSkillNo()
  if self._currentClearCount == 0 then
    listNo = 3
  else
    if self._currentClearCount == 1 then
      listNo = 4
    else
      return 
    end
  end
  for key,value in pairs((self._skillNoList)[listNo]) do
    if skillNo == value then
      (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):addClearStepEffect(self._currentClearCount + 1)
      self._currentClearCount = self._currentClearCount + 1
      audioPostEvent_SystemUi(4, 12)
      if self._currentClearCount == self._totalClearCount then
        self._usedComboCount = self._usedComboCount + 1
        ;
        (PaGlobal_TutorialUiManager:getUiHeadlineMessage()):setTextPurposeText(PAGetString(Defines.StringSheet_GAME, "TUTORIAL_PURPOSE_BATTLE_STEP6") .. " ( " .. self._usedComboCount .. " / " .. self._totalComboCount .. " )")
      end
    end
  end
end

local isAcceptedQuest = false
local isClearQuest = false
-- DECOMPILER ERROR at PC120: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.changeStepSuggestCallBlackSpirit = function(self)
  -- function num : 0_14
  if self._currentProgress == 1 then
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):showSuggestCallSpiritUi()
    PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.eventCallAcceptBlackSpiritQuest = function(self, isAccept, questGroupNo, questId)
  -- function num : 0_15 , upvalues : isAcceptedQuest
  if self._currentProgress == 1 and questGroupNo == ((self._questData)[1])._questGroupNo and questId == ((self._questData)[1])._questId then
    isAcceptedQuest = true
  end
end

-- DECOMPILER ERROR at PC128: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.eventCallAfterBlackSpiritDialogClose = function(self)
  -- function num : 0_16 , upvalues : isAcceptedQuest
  if self._currentProgress == 1 and isAcceptedQuest == true then
    isAcceptedQuest = false
    Panel_CheckedQuest:SetShow(false)
    Panel_CheckedQuest:SetShow(true, true)
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC131: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.handleEventQuestUpdateNotify = function(self, isAccept, questNoRaw)
  -- function num : 0_17
  local questGroupNo = PaGlobal_TutorialManager:getQuestGroupNoByQuestNoRaw(questNoRaw)
  local questId = PaGlobal_TutorialManager:getQuestIdByQuestNoRaw(questNoRaw)
  if self._currentType == 1 and self._currentStep == 3 and isAccept == true then
    self:eventCallAcceptBlackSpiritQuest(isAccept, questGroupNo, questId)
  end
end

-- DECOMPILER ERROR at PC134: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.handleAfterAndPopFlush = function(self)
  -- function num : 0_18
  if self._currentType == 1 and self._currentStep == 3 then
    self:eventCallAfterBlackSpiritDialogClose()
  end
end

-- DECOMPILER ERROR at PC137: Confused about usage of register: R8 in 'UnsetPending'

PaGlobal_TutorialPhase_BasicSkill_Giant.handleEventSelfPlayerUsedSkill = function(self, skillWrapper)
  -- function num : 0_19
  if skillWrapper ~= nil and self._currentType == 1 then
    if self._currentStep == 1 then
      self:eventCallUsedSkill_TryBasicSkill(skillWrapper)
    else
      if self._currentStep == 2 then
        self:eventCallUsedSkill_TrySkillCombo(skillWrapper)
      end
    end
  end
end



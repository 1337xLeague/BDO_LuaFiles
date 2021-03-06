-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase15_hidel_worker.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_Hidel_Worker = {_phaseNo = 15, _currentStep = 0, _nextStep = 0, _currentProgress = 0, _prevProgress = 1, _updateTime = 0, _isPhaseOpen = false, _isSkippable = true, 
_regionKeyRawList = {32, 38, 42, 62, 318}
, 
_waypointKeyData = {[1] = 323, [2] = 439}
, 
_talkerCharacterKeyData = {[1] = 41085}
, 
_itemKeyData = {[1] = 64616}
}
-- DECOMPILER ERROR at PC30: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.checkPossibleForPhaseStart = function(self, stepNo)
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
    if explorePoint:getRemainedPoint() < 4 then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "๊ณตํ๋๊ฐ ๋ถ\128์กฑํด์\156 ์์ํ์ง ์์ต๋๋ค. : _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    local inventory = (selfPlayer:get()):getInventoryByType((CppEnums.ItemWhereType).eInventory)
    if inventory == nil then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "์ธ๋ฒคํ ๋ฆฌ๋ฅ\188 ์ฐพ์ ์\152 ์์ต๋๋ค! _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    local hasItem = true
    if toInt64(0, 0) == inventory:getItemCount_s64(ItemEnchantKey(64616, 1)) then
      hasItem = false
    end
    if hasItem == false then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "ํํ ๋ฆฌ์ผ์\144 ํ์ํ\156 ์ผ๊พผ ๊ณ์ฝ์\156(64616)๋ฅ\188 ์ฐพ์ ์\152 ์์ด์\156 ์์ํ์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    local hidelPlantKey = ToClient_convertWaypointKeyToPlantKey(301)
    local townWorkerMaxCapacity = ToClient_getTownWorkerMaxCapacity(hidelPlantKey)
    local plantWaitWorkerListCount = ToClient_getPlantWaitWorkerListCount(hidelPlantKey)
    if townWorkerMaxCapacity - plantWaitWorkerListCount <= 0 then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "๊ณ ์ฉ๋\156 ์ผ๊พผ ์\152 :  " .. tostring(plantWaitWorkerListCount) .. " / ์ผ๊พผ ์์ฉ ๊ฐ\128๋\165 ์\152 : " .. tostring(townWorkerMaxCapacity))
      _PA_LOG("๊ณฝ๋ฏผ์\176", "ํ์ด๋ธ์ ์ผ๊พผ ์์๊ฐ\128 ๋ชจ์๋ผ์ ํํ ๋ฆฌ์ผ์\132 ์์ํ์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    local wheatPlantKey = ToClient_convertWaypointKeyToPlantKey(439)
    if ToClient_getPlantWorkingList(wheatPlantKey) > 0 then
      _PA_LOG("๊ณฝ๋ฏผ์\176", "๋ชจ๋ ํ\176 ๊ฑฐ๋ ๋์ฅ ๋ฐ\128 ์ฌ๋ฐฐ ๋ธ๋์\144 ์ด๋ฏธ ์ผ๊พผ์\180 ์ผํ๊ณ\160 ์์ผ๋ฏ\128๋ก\156 ํํ ๋ฆฌ์ผ์\132 ์์ํ์ง ์์ต๋๋ค. _phaseNo : " .. tostring(self._phaseNo))
      return false
    end
    return true
  end
end

-- DECOMPILER ERROR at PC33: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.checkSkippablePhase = function(self)
  -- function num : 0_1
  if self._isSkippable == true and PaGlobal_TutorialManager:checkHaveOverLevelCharacter() == true then
    return true
  end
  return false
end

-- DECOMPILER ERROR at PC36: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.startPhase = function(self, stepNo)
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

-- DECOMPILER ERROR at PC39: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.startPhaseXXX = function(self, stepNo)
  -- function num : 0_3
  PaGlobal_TutorialManager:setCurrentPhaseNo(self._phaseNo)
  PaGlobal_TutorialManager:setDoingTutorial(true)
  _PA_LOG("๊ณฝ๋ฏผ์\176", "PaGlobal_TutorialPhase_Hidel_Worker:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
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
  Panel_Tutorial:SetShow(true, false)
end

-- DECOMPILER ERROR at PC42: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.endPhase = function(self)
  -- function num : 0_4
  FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap})
  FGlobal_Dialog_SetRenderMode({(Defines.RenderMode).eRenderMode_Dialog})
  FGlobal_EraseAllEffect_ExitButton()
  FGlobal_NodeMenu_SetEnableNodeUnlinkButton(true)
  PaGlobal_TutorialUiBlackSpirit:setShowAll(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC45: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.updatePerFrame = function(self, deltaTime)
  -- function num : 0_5
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC48: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleChangeStep = function(self, currentStep)
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

-- DECOMPILER ERROR at PC51: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.toNextProgress = function(self)
  -- function num : 0_7
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC54: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.toNextStep = function(self)
  -- function num : 0_8
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC57: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.toStep = function(self, destStep, destProgress)
  -- function num : 0_9
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

-- DECOMPILER ERROR at PC60: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.addEffectUiNodeButtonByWaypointKey = function(self, waypointKey)
  -- function num : 0_10
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if uiNodeButton ~= nil then
    uiNodeButton:EraseAllEffect()
    uiNodeButton:AddEffect("UI_ArrowMark02", true, 0, -50)
    uiNodeButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC63: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eraseAllEffectUiNodeButtonByWaypointKey = function(self, waypointKey)
  -- function num : 0_11
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if uiNodeButton ~= nil then
    uiNodeButton:EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC66: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.changeStep1 = function(self)
  -- function num : 0_12
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ผ๊พผ ๊ณ์ฝ์๋ฅผ ๋ฐ์๊ต\176.\n์ฌ์ฉํด์ ์ผ๊พผ์\132 ๊ณ ์ฉํด๋ณด์\144.", "<I>ํค๋ก ๊ฐ\128๋ฐฉ์ ์ด์ด์\156\n๊ณ์ฝ์๋ฅผ <์ฐํด๋ฆ\173>์ผ๋ก ์ฌ์ฉํด๋ณด์\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiMasking:hideQuestMasking()
      FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ข์. ์ด์  ๊ณ ์ฉํ\156 ์ผ๊พผ์\132 ํ์ธํด๋ณด์\144.", "์ฐ์  <M>ํค๋ก ์๋๋งต์ ์ด์ด๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        local bottomWorkerButton = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_WorkerList")
        bottomWorkerButton:EraseAllEffect()
        bottomWorkerButton:AddEffect("UI_ArrowMark02", true, 0, -50)
        bottomWorkerButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ค๋ฅธ์ช\189 ํ๋จ์\144 ํ์๋\156 ์ผ๊พผ ๋ชฉ๋ก ๋ฒํผ์\180 ๋ณด์ด์ง\128?", "์ผ๊พผ ๋ชฉ๋ก ๋ฒํผ์\132 ์ผํด๋ฆ\173 ํด๋ด.", true, getScreenSizeX() * 0.75, getScreenSizeY() * 0.65)
  end
)
      else
        do
          if self._currentProgress == 4 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ณ ์ฉ๋\156 ์ผ๊พผ์\180 ๋ณด์ผ๊ฑฐ์ผ.\n์ผ๊พผ์\132 ๊ณ ์ฉํ๋ฉด ์ฌ๋ฌ๊ฐ\128์ง\128 ์ผ์ ๋\128์\160 ์ํฌ ์\152 ์์ด.", "ํ์ธํ์ผ๋ฉ\180 <ESC>ํค๋ <M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ๋ซ์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
          else
            if self._currentProgress == 5 then
              local bottomWorkerButton = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_WorkerList")
              bottomWorkerButton:EraseAllEffect()
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ๋ชจ๋ ํ\176 ๋์ฅ์ผ๋ก ๊ฐ\128์\156 ์ผ๊พผ์๊ฒ ์ผ์ ์์ผ๋ณด์.", "<M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ์ด์ด๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
            else
              do
                if self._currentProgress == 6 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("ํ์๋\156 ๋ชจ๋ ํ\176 ๊ฑฐ๋ ๋์ฅ์\180 ๋ณด์ด์ง\128?", "๋ชจ๋ ํ\176 ๊ฑฐ๋ ๋์ฅ ๊ฑฐ์ ์\132 ์ฐํด๋ฆ\173 ํด๋ด.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
                else
                  if self._currentProgress == 7 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180. ๋ชฉ์ ์ง\128๋ฅ\188 ์ฐพ์๊ฐ\128๋ ค๋ฉด ์๋๋งต์ ๋ซ์์ผ๊ฒ ์ง\128?", "์ด๋ํด์ผํ๋๊น\140 <ESC>๋\152 <M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ๋ซ์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
                  else
                    if self._currentProgress == -1 then
                      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_12_7
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\156 ๋ฒ์จ ์ง\128๋๋ฅผ ๋ซ๋๊ฑฐ์ง?", "<M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ์ด์ด๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC69: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep1AddEffectEmploymentContract = function(self, slot, slotItemKey)
  -- function num : 0_13
  if self._currentProgress == 1 and (self._itemKeyData)[1] == slotItemKey then
    PaGlobal_Inventory:addSlotEffectForTutorial(slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC72: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep1InventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_14
  if self._currentProgress == 1 and (self._itemKeyData)[1] == rClickedItemKey then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC75: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep1WorldMapOpen = function(self)
  -- function num : 0_15
  if self._currentProgress == 2 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == -1 then
      self._currentProgress = self._prevProgress
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC78: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep1GrandWorldMap_CheckPopup = function(self, openPanelEnum, popupPanel)
  -- function num : 0_16
  if self._currentProgress == 3 and openPanelEnum == 5 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC81: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_17
  if self._currentProgress == 3 or self._currentProgress == 6 then
    self._prevProgress = self._currentProgress
    self:toStep(1, -1)
  else
    if self._currentProgress == 4 then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    else
      if self._currentProgress == 7 then
        FGlobal_WorldmapMain_SetAllowTutorialPanelShow(false)
        if isExploreUpgradable((self._waypointKeyData)[1]) == true then
          if isWithdrawablePlant((self._waypointKeyData)[1]) == true then
            self:toStep(3)
          else
            if isWithdrawablePlant((self._waypointKeyData)[1]) == false then
              self:toNextStep()
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC84: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_18
  if self._currentProgress == 5 then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  else
    if self._currentProgress == 6 then
      self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
    end
  end
end

-- DECOMPILER ERROR at PC87: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_19
  if self._currentProgress == 6 then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
  end
end

-- DECOMPILER ERROR at PC90: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep1RClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_20
  if self._currentProgress == 6 and (self._waypointKeyData)[1] == uiNodeButton:getWaypointKey() then
    self:eraseAllEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC93: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.changeStep2 = function(self)
  -- function num : 0_21
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ธธ์๋ด๋ฅผ ๋ฐ๋ผ๊ฐ\128๋ฉ\180 <ํํ ๊ฑฐ์  ๊ด\128๋ฆฌ์>๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํ\176 ์๊ฒ ๋๋ฌํ๊ฒ ๋ ๊ฑฐ์\188.", "๊ธธ์๋ด๋ฅผ ๋ฐ๋ผ ๋\128์์ ์ฐพ์ ๋ง์ ๊ฑธ์ด๋ณด์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
  else
    if self._currentProgress == 2 then
      FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ผ๊พผ์๊ฒ ์ผ์ ์ํฌ ๊ฑฐ์ ์\128 ๊ด\128๋ฆฌ๊ฐ ํ์ํ\180.", "๋\128ํ๋ฉ๋ด์ค์\144 \'ํํ ๊ฑฐ์  ๊ด\128๋ฆ\172\'๋ฒํผ์\132 ๋๋ฌ๋ด\144.", false, getScreenSizeX() * 0.55, getScreenSizeY() * 0.45, true)
  end
)
    else
      if self._currentProgress == 3 then
        local positionTarget = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
        do
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_21_2 , upvalues : positionTarget
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ผ๊พผ์\152 ์์ ๊ฑฐ์ ๊ณ\188 ์ผ์ ํ\160 ๊ฑฐ์ ์\180 ์ฐ๊ฒฐ ๋์ด ์์ด์\188 ์ผ๊พผ์๊ฒ ์ผ์ ์ํฌ ์\152 ์์ด.\n๊ฑฐ์ ์\132 ์ฐ๊ฒฐํ๊ณ  ์ถ์ผ๋ฉ\180 ๊ณตํ๋๋ฅผ ํฌ์ํด์ผ๋\188.", "์ผ์ชฝ ์์ ํ์๋\156 \'๊ณตํ๋\132 ํฌ์\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0.5, true)
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
    -- function num : 0_21_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ๊ฑฐ์ ๊ฐ์ ์ฐ๊ฒฐ๋\156 ์ ์ด ๋ถ์ด์ง\132 ๊ฒ์ด ๋ณด์ด์ง\128?\n์ด๋ ๊ฒ\140 ๋๋ฉด ๋\144 ๊ฑฐ์ ์\180 ์ฐ๊ฒฐ๋๊ฑฐ์\188.", "์ด์  <ESC>ํค๋ <M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ๋ซ์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC96: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep2BeforeShowDialog = function(self)
  -- function num : 0_22
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    FGlobal_Dialog_SetAllowTutorialPanelShow(true)
  else
    FGlobal_Dialog_SetAllowTutorialPanelShow(false)
  end
end

-- DECOMPILER ERROR at PC99: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep2ShowDialog = function(self, dialogData)
  -- function num : 0_23
  do
    -- DECOMPILER ERROR at PC14: Unhandled construct in 'MakeBoolean' P1

    if self._currentProgress == 1 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
    if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
    end
  end
end

-- DECOMPILER ERROR at PC102: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep2ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_24
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() and (CppEnums.ContentsType).Contents_Explore == funcButtonType then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC105: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep2EventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_25
  if self._currentProgress == 3 and (self._waypointKeyData)[1] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC108: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep2WorldMapImmediatelyClose = function(self)
  -- function num : 0_26
  if self._currentProgress == 4 then
    FGlobal_Worldmap_ResetRenderMode()
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC111: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.changeStep3 = function(self)
  -- function num : 0_27
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_27_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ์ผ๊พผ์๊ฒ ์ผ์ ์ํฌ ์ค\128๋น๋ฅผ ํ\180 ๋ณด์.", "\'๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํ\176\'์๊ฒ ๊ฐ\128์\156 ๋ง์ ๊ฑธ์ด๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300, true)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_27_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์์ฐ ๊ฑฐ์ ์\144 ํฌ์ ํ\180 ๋ณผ๊ฑฐ์\188.\n๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํฐ์์\152 ๋\128ํ๋ฉ๋ด์ค์\144 ์๋ง์\128 ๊ฒ์ด ์์ง.", "\'ํํ ๊ฑฐ์  ๊ด\128๋ฆ\172\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, getScreenSizeX() * 0.45, getScreenSizeY() * 0.4, true)
  end
)
    else
      if self._currentProgress == 3 then
        self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[2])
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_27_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("ํ์๋\156 ์์ฐ ๊ฑฐ์ ์\180 ๋ณด์ด์ง\128?", "\'๋ฐ\128 ์ฌ๋ฐฐ\'์์ฐ ๊ฑฐ์ ์\132 ์ผํด๋ฆ\173 ํด๋ด.", true, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.6)
  end
)
      else
        if self._currentProgress == 4 then
          local positionTarget = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
          do
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_27_3 , upvalues : positionTarget
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\180 ๊ฑฐ์ ์์ ์์ฐ์\132 ํ๊ณ  ์ถ์ผ๋ฉ\180 ๊ณตํ๋๋ฅผ ํฌ์ํด์ผ๋\188.", "์ผ์ชฝ ์์ ํ์๋\156 \'๊ณตํ๋\132 ํฌ์\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0.5)
  end
)
          end
        else
          do
            if self._currentProgress == 5 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_27_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ณ ์ฉ๋\156 ์ผ๊พผ ๋ชฉ๋ก์\180 ๋ณด์ด์ง\128?\n์ผ๊พผ์๊ฒ ์ผ์ ์์ผ๋ณด์.", "์์ ์์ ๋ฒํผ์\132 ๋๋ฌ๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
            else
              if self._currentProgress == 6 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_27_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด๋ฐ์์ผ๋ก\156 ์ผ๊พผ์\132 ์์ฐ ๊ฑฐ์ ์\144 ๋ณด๋ด์\156 ์ผ์ ์ํฌ ์\152 ์์ด.\n์ผ๊พผ์\180 ์ผ์ ํ๋๋์ ๋\140 ๋ชจํ์\132 ๊ณ์ ํ\160 ์\152 ์์ง.", "์ด์  <ESC>ํค๋ <M>ํค๋ก ์๋๋งต์ ๋ซ๊ณ  ๋ชจํ์\132 ๊ณ์ํ๋๋ก\157 ํ\180.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
              end
            end
          end
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC114: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3InteractionShow = function(self, actorProxyWrapper)
  -- function num : 0_28
  local isTargetNpc = false
  if self._currentProgress == 1 then
    local actorProxyWrapper = interaction_getInteractable()
    if actorProxyWrapper ~= nil and (self._talkerCharacterKeyData)[1] == actorProxyWrapper:getCharacterKeyRaw() then
      isTargetNpc = true
    end
    if isTargetNpc == true then
      FGlobal_Dialog_SetRenderMode({(Defines.RenderMode).eRenderMode_Dialog, (Defines.RenderMode).eRenderMode_Tutorial})
    else
      FGlobal_Dialog_SetRenderMode({(Defines.RenderMode).eRenderMode_Dialog})
    end
  end
end

-- DECOMPILER ERROR at PC117: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3BeforeShowDialog = function(self)
  -- function num : 0_29
  if (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    FGlobal_Dialog_SetAllowTutorialPanelShow(true)
  else
    FGlobal_Dialog_SetAllowTutorialPanelShow(false)
  end
end

-- DECOMPILER ERROR at PC120: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3ShowDialog = function(self, dialogData)
  -- function num : 0_30
  do
    -- DECOMPILER ERROR at PC14: Unhandled construct in 'MakeBoolean' P1

    if self._currentProgress == 1 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
    if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
      local funcButtonIndex = FGlobal_Dialog_FindFuncButtonIndexByType((CppEnums.ContentsType).Contents_Explore)
      FGlobal_EraseAllEffect_DialogButton(funcButtonIndex)
      FGlobal_AddEffect_DialogButton(funcButtonIndex, "UI_ArrowMark02", true, 0, -50)
    end
  end
end

-- DECOMPILER ERROR at PC123: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_31
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    FGlobal_WorldmapMain_SetAllowTutorialPanelShow(true)
    if (CppEnums.ContentsType).Contents_Explore == funcButtonType then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC126: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3NodeLClick = function(self, uiNodeButton)
  -- function num : 0_32
  if self._currentProgress == 3 and (self._waypointKeyData)[2] == uiNodeButton:getWaypointKey() then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC129: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3SetTownMode = function(self, waypointKey)
  -- function num : 0_33
  if self._currentProgress == 3 and (self._waypointKeyData)[1] == waypointKey then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[2])
  end
end

-- DECOMPILER ERROR at PC132: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3EventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_34
  if self._currentProgress == 4 and (self._waypointKeyData)[2] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC135: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3ClickPlantdoWork = function(self, plantKey, workingCount)
  -- function num : 0_35
  if self._currentProgress == 5 then
    _PA_LOG("๊ณฝ๋ฏผ์\176", "plantKey:getWaypointKey() : " .. tostring(plantKey:getWaypointKey()) .. " / workingCount : " .. tostring(workingCount))
    if (self._waypointKeyData)[2] == plantKey:getWaypointKey() then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC138: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.eventCallStep3WorldMapImmediatelyClose = function(self)
  -- function num : 0_36
  if self._currentProgress == 6 then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC141: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleBeforeWorldmapOpen = function(self)
  -- function num : 0_37
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpen()
  end
end

-- DECOMPILER ERROR at PC144: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleWorldMapOpenComplete = function(self)
  -- function num : 0_38
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC147: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleUpdateInventorySlotData = function(self, slot, slotItemKey)
  -- function num : 0_39
  if self._currentStep == 1 then
    self:eventCallStep1AddEffectEmploymentContract(slot, slotItemKey)
  end
end

-- DECOMPILER ERROR at PC150: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleInventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_40
  if self._currentStep == 1 then
    self:eventCallStep1InventorySlotRClick(rClickedItemKey)
  end
end

-- DECOMPILER ERROR at PC153: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleGrandWorldMap_CheckPopup = function(self, openPanelEnum, popupPanel)
  -- function num : 0_41
  if self._currentStep == 1 then
    self:eventCallStep1GrandWorldMap_CheckPopup(openPanelEnum, popupPanel)
  end
end

-- DECOMPILER ERROR at PC156: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_42
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapImmediatelyClose()
  else
    if self._currentStep == 2 then
      self:eventCallStep2WorldMapImmediatelyClose()
    else
      if self._currentStep == 3 then
        self:eventCallStep3WorldMapImmediatelyClose()
      end
    end
  end
end

-- DECOMPILER ERROR at PC159: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleResetTownMode = function(self)
  -- function num : 0_43
  if self._currentStep == 1 then
    self:eventCallStep1ResetTownMode()
  end
end

-- DECOMPILER ERROR at PC162: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_44
  if self._currentStep == 3 then
    self:eventCallStep3NodeLClick(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC165: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleRClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_45
  if self._currentStep == 1 then
    self:eventCallStep1RClickWorldMapNode(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC168: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleInteractionShow = function(self, actorProxyWrapper)
  -- function num : 0_46
  if self._currentStep == 3 then
    self:eventCallStep3InteractionShow(actorProxyWrapper)
  end
end

-- DECOMPILER ERROR at PC171: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleBeforeShowDialog = function(self)
  -- function num : 0_47
  if self._currentStep == 2 then
    self:eventCallStep2BeforeShowDialog()
  else
    if self._currentStep == 3 then
      self:eventCallStep3BeforeShowDialog()
    end
  end
end

-- DECOMPILER ERROR at PC174: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleShowDialog = function(self, dialogData)
  -- function num : 0_48
  if self._currentStep == 2 then
    self:eventCallStep2ShowDialog(dialogData)
  else
    if self._currentStep == 3 then
      self:eventCallStep3ShowDialog(dialogData)
    end
  end
end

-- DECOMPILER ERROR at PC177: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_49
  if self._currentStep == 2 then
    self:eventCallStep2ClickedDialogFuncButton(funcButtonType)
  else
    if self._currentStep == 3 then
      self:eventCallStep3ClickedDialogFuncButton(funcButtonType)
    end
  end
end

-- DECOMPILER ERROR at PC180: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleEventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_50
  if self._currentStep == 2 then
    self:eventCallStep2EventUpdateExplorationNode(waypointKey)
  else
    if self._currentStep == 3 then
      self:eventCallStep3EventUpdateExplorationNode(waypointKey)
    end
  end
end

-- DECOMPILER ERROR at PC183: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleClickPlantdoWork = function(self, plantKey, workingCount)
  -- function num : 0_51
  if self._currentStep == 3 then
    self:eventCallStep3ClickPlantdoWork(plantKey, workingCount)
  end
end

-- DECOMPILER ERROR at PC186: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_Hidel_Worker.handleSetTownMode = function(self, waypointKey)
  -- function num : 0_52
  if self._currentStep == 3 then
    self:eventCallStep3SetTownMode(waypointKey)
  end
end



-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\tutorial\tutorial_phase13_hidelworldmap_worker.luac 

-- params : ...
-- function num : 0
PaGlobal_TutorialPhase_HidelWorldmap_Worker = {_currentStep = 0, _nextStep = 0, _currentProgress = 1, _prevProgress = 1, _updateTime = 0, _isSkippable = true, 
_waypointKeyData = {[1] = 323, [2] = 439}
, 
_talkerCharacterKeyData = {[1] = 41085}
, 
_itemKeyData = {[1] = 64200}
, 
_questData = {}
}
-- DECOMPILER ERROR at PC22: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.startPhase = function(self, stepNo)
  -- function num : 0_0
  _PA_LOG("๊ณฝ๋ฏผ์\176", "PaGlobal_TutorialPhase_HidelWorldmap_Worker:startStep() stepNo : " .. tostring(stepNo) .. " typeNo : " .. tostring(typeNo))
  self._currentStep = 0
  self._nextStep = stepNo
  self._currentProgress = 1
  self._prevProgress = 0
  self._updateTime = 0
  classType = (getSelfPlayer()):getClassType()
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(false)
  PaGlobal_TutorialManager:setAllowShowQuickSlot(true)
  PaGlobal_TutorialManager:setAllowNewQuickSlot(true)
  ;
  (PaGlobal_TutorialUiManager:getUiKeyButton()):setShowAll(false)
  PaGlobal_TutorialUiManager:hideAllTutorialUi()
  PaGlobal_TutorialUiManager:repositionScreen()
  Panel_Tutorial:SetShow(true, false)
end

-- DECOMPILER ERROR at PC25: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.endPhase = function(self)
  -- function num : 0_1
  self._currentProgress = 1
  self._currentStep = 0
  self._nextStep = 1
  FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap})
  FGlobal_Dialog_SetRenderMode({(Defines.RenderMode).eRenderMode_Dialog})
  FGlobal_EraseAllEffect_ExitButton()
  FGlobal_NodeMenu_SetEnableNodeUnlinkButton(true)
  PaGlobal_TutorialUiBlackSpirit:setShowAll(false)
  PaGlobal_TutorialManager:setAllowCallBlackSpirit(true)
  PaGlobal_TutorialManager:endTutorial()
end

-- DECOMPILER ERROR at PC28: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.updatePerFrame = function(self, deltaTime)
  -- function num : 0_2
  if self._currentStep ~= self._nextStep then
    self._currentStep = self._nextStep
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC31: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleChangeStep = function(self, currentStep)
  -- function num : 0_3
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

-- DECOMPILER ERROR at PC34: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.toNextProgress = function(self)
  -- function num : 0_4
  self._currentProgress = self._currentProgress + 1
  self:handleChangeStep(self._currentStep)
end

-- DECOMPILER ERROR at PC37: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.toNextStep = function(self)
  -- function num : 0_5
  self._currentProgress = 1
  self._nextStep = self._nextStep + 1
end

-- DECOMPILER ERROR at PC40: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.toStep = function(self, destStep, destProgress)
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

-- DECOMPILER ERROR at PC43: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.addEffectUiNodeButtonByWaypointKey = function(self, waypointKey)
  -- function num : 0_7
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if uiNodeButton ~= nil then
    uiNodeButton:EraseAllEffect()
    uiNodeButton:AddEffect("UI_ArrowMark02", true, 0, -50)
    uiNodeButton:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC46: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eraseAllEffectUiNodeButtonByWaypointKey = function(self, waypointKey)
  -- function num : 0_8
  local uiNodeButton = ToClient_FindNodeButtonByWaypointKey(waypointKey)
  if uiNodeButton ~= nil then
    uiNodeButton:EraseAllEffect()
  end
end

-- DECOMPILER ERROR at PC49: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.changeStep1 = function(self)
  -- function num : 0_9
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ผ๊พผ ๊ณ์ฝ์๋ฅผ ๋ฐ์๊ต\176.\n์ฌ์ฉํด์ ์ผ๊พผ์\132 ๊ณ ์ฉํด๋ณด์\144.", "<I>ํค๋ก ๊ฐ\128๋ฐฉ์ ์ด์ด์\156\n๊ณ์ฝ์๋ฅผ <์ฐํด๋ฆ\173>์ผ๋ก ์ฌ์ฉํด๋ณด์\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiMasking:hideQuestMasking()
      FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap, (Defines.RenderMode).eRenderMode_Tutorial})
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_1
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
    -- function num : 0_9_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ค๋ฅธ์ช\189 ํ๋จ์\144 ํ์๋\156 ์ผ๊พผ ๋ชฉ๋ก ๋ฒํผ์\180 ๋ณด์ด์ง\128?", "์ผ๊พผ ๋ชฉ๋ก ๋ฒํผ์\132 ์ผํด๋ฆ\173 ํด๋ด.", true, getScreenSizeX() * 0.75, getScreenSizeY() * 0.65)
  end
)
      else
        do
          if self._currentProgress == 4 then
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ณ ์ฉ๋\156 ์ผ๊พผ์\180 ๋ณด์ผ๊ฑฐ์ผ.\n์ผ๊พผ์\132 ๊ณ ์ฉํ๋ฉด ์ฌ๋ฌ๊ฐ\128์ง\128 ์ผ์ ๋\128์\160 ์ํฌ ์\152 ์์ด.", "ํ์ธํ์ผ๋ฉ\180 <ESC>ํค๋ <M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ๋ซ์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
          else
            if self._currentProgress == 5 then
              local bottomWorkerButton = (UI.getChildControl)(Panel_WorldMap, "BottomMenu_WorkerList")
              bottomWorkerButton:EraseAllEffect()
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ๋ชจ๋ ํ\176 ๋์ฅ์ผ๋ก ๊ฐ\128์\156 ์ผ๊พผ์๊ฒ ์ผ์ ์์ผ๋ณด์.", "<M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ์ด์ด๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
            else
              do
                if self._currentProgress == 6 then
                  PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_5
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("ํ์๋\156 ๋ชจ๋ ํ\176 ๊ฑฐ๋ ๋์ฅ์\180 ๋ณด์ด์ง\128?", "๋ชจ๋ ํ\176 ๊ฑฐ๋ ๋์ฅ ๊ฑฐ์ ์\132 ์ฐํด๋ฆ\173 ํด๋ด.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
                else
                  if self._currentProgress == 7 then
                    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_6
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ํ์\180. ๋ชฉ์ ์ง\128๋ฅ\188 ์ฐพ์๊ฐ\128๋ ค๋ฉด ์๋๋งต์ ๋ซ์์ผ๊ฒ ์ง\128?", "์ด๋ํด์ผํ๋๊น\140 <ESC>๋\152 <M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ๋ซ์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
                  else
                    if self._currentProgress == -1 then
                      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_9_7
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

-- DECOMPILER ERROR at PC52: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1AddEffectEmploymentContract = function(self, slot, slotItemKey)
  -- function num : 0_10
  if self._currentProgress == 1 and (self._itemKeyData)[1] == slotItemKey then
    PaGlobal_Inventory:addSlotEffectForTutorial(slot, "fUI_Tuto_ItemHp_01A", true, 0, 0)
  end
end

-- DECOMPILER ERROR at PC55: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1InventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_11
  if self._currentProgress == 1 and (self._itemKeyData)[1] == rClickedItemKey then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC58: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1WorldMapOpen = function(self)
  -- function num : 0_12
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

-- DECOMPILER ERROR at PC61: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1GrandWorldMap_CheckPopup = function(self, openPanelEnum, popupPanel)
  -- function num : 0_13
  if self._currentProgress == 3 and openPanelEnum == 5 then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC64: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1WorldMapImmediatelyClose = function(self)
  -- function num : 0_14
  if self._currentProgress == 3 or self._currentProgress == 6 then
    self._prevProgress = self._currentProgress
    self:toStep(1, -1)
  else
    if self._currentProgress == 4 then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    else
      if self._currentProgress == 7 then
        FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap})
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

-- DECOMPILER ERROR at PC67: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1WorldMapOpenComplete = function(self)
  -- function num : 0_15
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

-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1ResetTownMode = function(self)
  -- function num : 0_16
  if self._currentProgress == 6 then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
  end
end

-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep1RClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_17
  if self._currentProgress == 6 and (self._waypointKeyData)[1] == uiNodeButton:getWaypointKey() then
    self:eraseAllEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[1])
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.changeStep2 = function(self)
  -- function num : 0_18
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ธธ์๋ด๋ฅผ ๋ฐ๋ผ๊ฐ\128๋ฉ\180 <ํํ ๊ฑฐ์  ๊ด\128๋ฆฌ์>๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํ\176 ์๊ฒ ๋๋ฌํ๊ฒ ๋ ๊ฑฐ์\188.", "๊ธธ์๋ด๋ฅผ ๋ฐ๋ผ ๋\128์์ ์ฐพ์ ๋ง์ ๊ฑธ์ด๋ณด์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\156 ๋\128ํ๋ฅผ ์ค๋จํ์ด?\n๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํฐ์๊ฒ\140 ๋ง์ ๊ฑธ์ด.", "๋\128ํ๋ฉ๋ด์ค์\144 \'ํํ ๊ฑฐ์  ๊ด\128๋ฆ\172\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
    else
      if self._currentProgress == 3 then
        FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap, (Defines.RenderMode).eRenderMode_Tutorial})
        local positionTarget = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
        do
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_2 , upvalues : positionTarget
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\180 ์ง\128์ญ์์\156 ๋ฌด์ญ์\132 ํ๊ณ  ์ถ์ผ๋ฉ\180 ๊ณตํ๋๋ฅผ ํฌ์ํด์ผ๋\188.", "์ผ์ชฝ ์์ ํ์๋\156 \'๊ณตํ๋\132 ํฌ์\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0.5)
  end
)
        end
      else
        do
          while 1 do
            if self._currentProgress == 4 then
              if ToClient_isTownMode() == true then
                FGlobal_WorldMapWindowEscape()
                -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_STMT

                -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC50: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
          PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_18_3
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ๊ฑฐ์ ๊ฐ์ ์ฐ๊ฒฐ๋\156 ์ ์ด ๋ถ์ด์ง\132 ๊ฒ์ด ๋ณด์ด์ง\128?\n์ด๋ ๊ฒ\140 ๋๋ฉด ๋\144 ๊ฑฐ์ ์\180 ์ฐ๊ฒฐ๋๊ฑฐ์\188.\n์ด๊ฒ์\180 ๋์ ์ฒ\171 ๊ฑฐ์  ์ฐ๊ฒฐ์\180 ๋๊ฒ ๊ต\176.", "์ด์  <ESC>ํค๋ <M>ํค๋ฅผ ๋๋ฌ ์๋๋งต์ ๋ซ์.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
        end
      end
    end
  end
end

-- DECOMPILER ERROR at PC79: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep2ShowDialog = function(self, dialogData)
  -- function num : 0_19
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

-- DECOMPILER ERROR at PC82: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep2ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_20
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() and (CppEnums.ContentsType).Contents_Explore == funcButtonType then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC85: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep2EventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_21
  if self._currentProgress == 3 and (self._waypointKeyData)[1] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC88: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep2WorldMapImmediatelyClose = function(self)
  -- function num : 0_22
  if self._currentProgress == 4 then
    FGlobal_Worldmap_ResetRenderMode()
    self._currentProgress = 1
    self._nextStep = self._nextStep + 1
  end
end

-- DECOMPILER ERROR at PC91: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.changeStep3 = function(self)
  -- function num : 0_23
  if self._currentProgress == 1 then
    PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_0
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์ด์  ์ผ๊พผ์๊ฒ ์ผ์ ์ํฌ ์ค\128๋น๋ฅผ ํ\180 ๋ณด์.", "\'๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํ\176\'์๊ฒ ๊ฐ\128์\156 ๋ง์ ๊ฑธ์ด๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
  else
    if self._currentProgress == 2 then
      PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_1
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์์ฐ ๊ฑฐ์ ์\144 ํฌ์ ํ\180 ๋ณผ๊ฑฐ์\188.\n๋ฉ๋ฅด์์๋\144 ๋ชจ๋ ํฐ์์\152 ๋\128ํ๋ฉ๋ด์ค์\144 ์๋ง์\128 ๊ฒ์ด ์์ง.", "\'ํํ ๊ฑฐ์  ๊ด\128๋ฆ\172\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, getScreenSizeX() * 0.45, getScreenSizeY() * 0.4)
  end
)
    else
      if self._currentProgress == 3 then
        self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[2])
        PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_2
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("ํ์๋\156 ์์ฐ ๊ฑฐ์ ์\180 ๋ณด์ด์ง\128?", "\'๋ฐ\128 ์ฌ๋ฐฐ\'์์ฐ ๊ฑฐ์ ์\132 ์ผํด๋ฆ\173 ํด๋ด.", true, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.6)
  end
)
      else
        if self._currentProgress == 4 then
          local positionTarget = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
          do
            PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_3 , upvalues : positionTarget
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("์\180 ๊ฑฐ์ ์์ ์์ฐ์\132 ํ๊ณ  ์ถ์ผ๋ฉ\180 ๊ณตํ๋๋ฅผ ํฌ์ํด์ผ๋\188.", "์ผ์ชฝ ์์ ํ์๋\156 \'๊ณตํ๋\132 ํฌ์\'๋ฒํผ์\132 ๋๋ฌ๋ณด์.", false, positionTarget:GetPosX() + positionTarget:GetSizeX() * 2, positionTarget:GetPosY() + positionTarget:GetSizeY() * 0.5)
  end
)
          end
        else
          do
            if self._currentProgress == 5 then
              PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_4
    (PaGlobal_TutorialUiManager:getUiBlackSpirit()):setSpiritUiForTutorial("๊ณ ์ฉ๋\156 ์ผ๊พผ ๋ชฉ๋ก์\180 ๋ณด์ด์ง\128?\n์ผ๊พผ์๊ฒ ์ผ์ ์์ผ๋ณด์.", "์์ ์์ ๋ฒํผ์\132 ๋๋ฌ๋ด\144.", false, getScreenSizeX() * 0.5 - 20, getScreenSizeY() * 0.5 - 300)
  end
)
            else
              if self._currentProgress == 6 then
                PaGlobal_TutorialUiBlackSpirit:setSpiritUiForTutorialFunctor(function()
    -- function num : 0_23_5
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

-- DECOMPILER ERROR at PC94: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3InteractionShow = function(self, actorProxyWrapper)
  -- function num : 0_24
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

-- DECOMPILER ERROR at PC97: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3ShowDialog = function(self, dialogData)
  -- function num : 0_25
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

-- DECOMPILER ERROR at PC100: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3ClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_26
  if self._currentProgress == 2 and (self._talkerCharacterKeyData)[1] == dialog_getTalkNpcKey() then
    FGlobal_Worldmap_SetRenderMode({(Defines.RenderMode).eRenderMode_WorldMap, (Defines.RenderMode).eRenderMode_Tutorial})
    if (CppEnums.ContentsType).Contents_Explore == funcButtonType then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC103: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3NodeLClick = function(self, uiNodeButton)
  -- function num : 0_27
  if self._currentProgress == 3 and (self._waypointKeyData)[2] == uiNodeButton:getWaypointKey() then
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC106: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3SetTownMode = function(self, waypointKey)
  -- function num : 0_28
  if self._currentProgress == 3 and (self._waypointKeyData)[1] == waypointKey then
    self:addEffectUiNodeButtonByWaypointKey((self._waypointKeyData)[2])
  end
end

-- DECOMPILER ERROR at PC109: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3EventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_29
  if self._currentProgress == 4 and (self._waypointKeyData)[2] == waypointKey then
    FGlobal_NodeMenu_SetEnableNodeUnlinkButton(false)
    self._currentProgress = self._currentProgress + 1
    self:handleChangeStep(self._currentStep)
  end
end

-- DECOMPILER ERROR at PC112: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3ClickPlantdoWork = function(self, plantKey, workingCount)
  -- function num : 0_30
  if self._currentProgress == 5 then
    _PA_LOG("๊ณฝ๋ฏผ์\176", "plantKey:getWaypointKey() : " .. tostring(plantKey:getWaypointKey()) .. " / workingCount : " .. tostring(workingCount))
    if (self._waypointKeyData)[2] == plantKey:getWaypointKey() then
      self._currentProgress = self._currentProgress + 1
      self:handleChangeStep(self._currentStep)
    end
  end
end

-- DECOMPILER ERROR at PC115: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.eventCallStep3WorldMapImmediatelyClose = function(self)
  -- function num : 0_31
  if self._currentProgress == 6 then
    self:endPhase()
  end
end

-- DECOMPILER ERROR at PC118: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleBeforeWorldmapOpen = function(self)
  -- function num : 0_32
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpen()
  end
end

-- DECOMPILER ERROR at PC121: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleWorldMapOpenComplete = function(self)
  -- function num : 0_33
  if self._currentStep == 1 then
    self:eventCallStep1WorldMapOpenComplete()
  end
end

-- DECOMPILER ERROR at PC124: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleUpdateInventorySlotData = function(self, slot, slotItemKey)
  -- function num : 0_34
  if self._currentStep == 1 then
    self:eventCallStep1AddEffectEmploymentContract(slot, slotItemKey)
  end
end

-- DECOMPILER ERROR at PC127: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleInventorySlotRClick = function(self, rClickedItemKey)
  -- function num : 0_35
  if self._currentStep == 1 then
    self:eventCallStep1InventorySlotRClick(rClickedItemKey)
  end
end

-- DECOMPILER ERROR at PC130: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleGrandWorldMap_CheckPopup = function(self, openPanelEnum, popupPanel)
  -- function num : 0_36
  if self._currentStep == 1 then
    self:eventCallStep1GrandWorldMap_CheckPopup(openPanelEnum, popupPanel)
  end
end

-- DECOMPILER ERROR at PC133: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleWorldMapImmediatelyClose = function(self)
  -- function num : 0_37
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

-- DECOMPILER ERROR at PC136: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleResetTownMode = function(self)
  -- function num : 0_38
  if self._currentStep == 1 then
    self:eventCallStep1ResetTownMode()
  end
end

-- DECOMPILER ERROR at PC139: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleLClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_39
  if self._currentStep == 3 then
    self:eventCallStep3NodeLClick(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC142: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleRClickWorldMapNode = function(self, uiNodeButton)
  -- function num : 0_40
  if self._currentStep == 1 then
    self:eventCallStep1RClickWorldMapNode(uiNodeButton)
  end
end

-- DECOMPILER ERROR at PC145: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleInteractionShow = function(self, actorProxyWrapper)
  -- function num : 0_41
  if self._currentStep == 3 then
    self:eventCallStep3InteractionShow(actorProxyWrapper)
  end
end

-- DECOMPILER ERROR at PC148: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleShowDialog = function(self, dialogData)
  -- function num : 0_42
  if self._currentStep == 2 then
    self:eventCallStep2ShowDialog(dialogData)
  else
    if self._currentStep == 3 then
      self:eventCallStep3ShowDialog(dialogData)
    end
  end
end

-- DECOMPILER ERROR at PC151: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleClickedDialogFuncButton = function(self, funcButtonType)
  -- function num : 0_43
  if self._currentStep == 2 then
    self:eventCallStep2ClickedDialogFuncButton(funcButtonType)
  else
    if self._currentStep == 3 then
      self:eventCallStep3ClickedDialogFuncButton(funcButtonType)
    end
  end
end

-- DECOMPILER ERROR at PC154: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleEventUpdateExplorationNode = function(self, waypointKey)
  -- function num : 0_44
  if self._currentStep == 2 then
    self:eventCallStep2EventUpdateExplorationNode(waypointKey)
  else
    if self._currentStep == 3 then
      self:eventCallStep3EventUpdateExplorationNode(waypointKey)
    end
  end
end

-- DECOMPILER ERROR at PC157: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleClickPlantdoWork = function(self, plantKey, workingCount)
  -- function num : 0_45
  if self._currentStep == 3 then
    self:eventCallStep3ClickPlantdoWork(plantKey, workingCount)
  end
end

-- DECOMPILER ERROR at PC160: Confused about usage of register: R0 in 'UnsetPending'

PaGlobal_TutorialPhase_HidelWorldmap_Worker.handleSetTownMode = function(self, waypointKey)
  -- function num : 0_46
  if self._currentStep == 3 then
    self:eventCallStep3SetTownMode(waypointKey)
  end
end



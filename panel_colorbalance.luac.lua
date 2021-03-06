-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\dye\panel_colorbalance.luac 

-- params : ...
-- function num : 0
local UI_PUCT = CppEnums.PA_UI_CONTROL_TYPE
local UI_PSFT = CppEnums.PAUI_SHOW_FADE_TYPE
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
Panel_ColorBalance:setGlassBackground(true)
Panel_ColorBalance:ActiveMouseEventEffect(true)
Panel_ColorBalance:RegisterShowEventFunc(true, "Panel_ColorBalance_ShowAni()")
Panel_ColorBalance:RegisterShowEventFunc(false, "Panel_ColorBalance_HideAni()")
local ui = {_btn_Close = (UI.getChildControl)(Panel_ColorBalance, "Button_Close"), _btn_Question = (UI.getChildControl)(Panel_ColorBalance, "Button_Question"), _static_colorArrow = (UI.getChildControl)(Panel_ColorBalance, "Static_ColorArrow"), _static_slot1 = (UI.getChildControl)(Panel_ColorBalance, "Static_Mix1_Slot"), _static_slot2 = (UI.getChildControl)(Panel_ColorBalance, "Static_Mix2_Slot"), _static_CompleteSlot = (UI.getChildControl)(Panel_ColorBalance, "Static_CompleteSlot"), _btn_StartMix = (UI.getChildControl)(Panel_ColorBalance, "Button_StartMix"), _colorBalanceDescBg = (UI.getChildControl)(Panel_ColorBalance, "Static_DescBG"), _txt_HelpDesc = (UI.getChildControl)(Panel_ColorBalance, "StaticText_Desc"), _txt_WarningDesc = (UI.getChildControl)(Panel_ColorBalance, "StaticText_WarningDesc")}
;
(ui._btn_Close):addInputEvent("Mouse_LUp", "Panel_ColorBalance_Close()")
;
(ui._btn_Question):addInputEvent("Mouse_LUp", "")
;
(ui._btn_StartMix):addInputEvent("Mouse_LUp", "Panel_ColorBalance_CombineDyeItem()")
local _slotConfig = {createIcon = true, createBorder = false, createCount = true, createCash = true}
local _slotCount = 3
local _slotList = {}
for index = 1, _slotCount do
  local createdSlot = {}
  ;
  (SlotItem.new)(createdSlot, "ItemIconSlot" .. index, 0, Panel_ColorBalance, _slotConfig)
  createdSlot:createChild()
  ;
  (createdSlot.icon):addInputEvent("Mouse_RUp", "Panel_ColorBalance_SlotRClick(" .. index .. ")")
  ;
  (createdSlot.icon):addInputEvent("Mouse_On", "Panel_ColorBalance_ShowTooltip(" .. index .. ")")
  ;
  (createdSlot.icon):addInputEvent("Mouse_Out", "Panel_ColorBalance_HideTooltip()")
  if index ~= _slotCount then
    (createdSlot.icon):addInputEvent("Mouse_LUp", "Panel_ColorBalance_DropHandler(" .. index .. ")")
  end
  _slotList[index] = createdSlot
end
Panel_ColorBalance_ShowAni = function()
  -- function num : 0_0 , upvalues : UI_ANI_ADV
  Panel_ColorBalance:SetAlpha(0)
  ;
  (UIAni.AlphaAnimation)(1, Panel_ColorBalance, 0, 0.15)
  local scaleAni = Panel_ColorBalance:addScaleAnimation(0, 0.2, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  scaleAni:SetStartScale(0.8)
  scaleAni:SetEndScale(1)
  scaleAni.AxisX = Panel_ColorBalance:GetPosX() / 2
  scaleAni.AxisY = Panel_ColorBalance:GetPosY() / 2
  scaleAni.IsChangeChild = true
end

Panel_ColorBalance_HideAni = function()
  -- function num : 0_1 , upvalues : UI_ANI_ADV
  Panel_ColorBalance:SetAlpha(1)
  local aniInfo = (UIAni.AlphaAnimation)(0, Panel_ColorBalance, 0, 0.12)
  aniInfo:SetHideAtEnd(true)
  local scaleAni2 = Panel_ColorBalance:addScaleAnimation(0, 0.12, UI_ANI_ADV.PAUI_ANIM_ADVANCE_SIN_HALF_PI)
  scaleAni2:SetStartScale(1)
  scaleAni2:SetEndScale(0.8)
  scaleAni2.AxisX = Panel_ColorBalance:GetPosX() / 2
  scaleAni2.AxisY = Panel_ColorBalance:GetPosY() / 2
  scaleAni2.IsChangeChild = true
end

local Panel_ColorBalance_ClearSlot = function()
  -- function num : 0_2 , upvalues : _slotList, ui, UI_color
  ((_slotList[1]).icon):SetPosX((ui._static_slot1):GetPosX())
  ;
  ((_slotList[1]).icon):SetPosY((ui._static_slot1):GetPosY())
  ;
  ((_slotList[1]).icon):SetShow(false)
  ;
  (_slotList[1]):clearItem()
  ;
  ((_slotList[2]).icon):SetPosX((ui._static_slot2):GetPosX())
  ;
  ((_slotList[2]).icon):SetPosY((ui._static_slot2):GetPosY())
  ;
  ((_slotList[2]).icon):SetShow(false)
  ;
  (_slotList[2]):clearItem()
  ;
  ((_slotList[3]).icon):SetPosX((ui._static_CompleteSlot):GetPosX())
  ;
  ((_slotList[3]).icon):SetPosY((ui._static_CompleteSlot):GetPosY())
  ;
  ((_slotList[3]).icon):SetShow(false)
  ;
  (_slotList[3]):clearItem()
  ;
  (ui._static_colorArrow):SetColor(UI_color.C_FFFFFFFF)
end

Panel_ColorBalance_PanelResize_ByFontSize = function()
  -- function num : 0_3 , upvalues : ui, UI_TM, Panel_ColorBalance_ClearSlot
  (ui._txt_HelpDesc):SetTextMode(UI_TM.eTextMode_AutoWrap)
  ;
  (ui._txt_HelpDesc):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_COLORBAL_DESC"))
  if (ui._txt_HelpDesc):GetTextSizeY() > 50 then
    (ui._colorBalanceDescBg):SetSize((ui._colorBalanceDescBg):GetSizeX(), (ui._txt_HelpDesc):GetTextSizeY() + 8)
    Panel_ColorBalance:SetSize(Panel_ColorBalance:GetSizeX(), (ui._colorBalanceDescBg):GetPosY() + (ui._colorBalanceDescBg):GetSizeY() + 47)
    ;
    (ui._btn_StartMix):ComputePos()
  end
  Panel_ColorBalance_ClearSlot()
end

Panel_ColorBalance_Show = function()
  -- function num : 0_4 , upvalues : Panel_ColorBalance_ClearSlot
  audioPostEvent_SystemUi(1, 24)
  Panel_ColorBalance:SetShow(true, true)
  Panel_ColorBalance:SetPosX(getScreenSizeX() / 2 - Panel_ColorBalance:GetSizeX() / 2)
  Panel_ColorBalance:SetPosY(getScreenSizeY() / 2 - Panel_ColorBalance:GetSizeY() / 2)
  Inventory_SetFunctor(Panel_ColorBalance_InvenFilter_IsDyeItem, Panel_ColorBalance_InvenRClick, Panel_ColorBalance_Close, nil)
  InventoryWindow_Show()
  Panel_ColorBalance_ClearSlot()
end

Panel_ColorBalance_Close = function()
  -- function num : 0_5
  Panel_ColorBalance:SetShow(false, false)
  Inventory_SetFunctor(nil, nil, nil, nil)
  InventoryWindow_Close()
end

Panel_ColorBalance_InvenFilter_IsDyeItem = function(slotNo, itemWrapper, currentWhereType)
  -- function num : 0_6
  if itemWrapper == nil then
    return true
  end
  local isAble = ToClient_IsDyeItem(currentWhereType, slotNo)
  return not isAble
end

Panel_ColorBalance_InvenRClick = function(slotNo, itemWrapper, itemCount, currentWhereType)
  -- function num : 0_7 , upvalues : _slotList, ui, UI_color
  if not ((_slotList[1]).icon):GetShow() then
    (_slotList[1]):setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64())
    ;
    ((_slotList[1]).icon):SetShow(true)
    -- DECOMPILER ERROR at PC25: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_slotList[1]).slotNo = slotNo
    -- DECOMPILER ERROR at PC28: Confused about usage of register: R4 in 'UnsetPending'

    ;
    (_slotList[1]).itemWhereType = currentWhereType
  else
    if not ((_slotList[2]).icon):GetShow() then
      if tonumber(((_slotList[1]).count):GetText()) == 1 and (_slotList[1]).slotNo == slotNo then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COLORBALENCE_INVENRCLICK"))
        return 
      end
      ;
      (_slotList[2]):setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64())
      ;
      ((_slotList[2]).icon):SetShow(true)
      -- DECOMPILER ERROR at PC77: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (_slotList[2]).slotNo = slotNo
      -- DECOMPILER ERROR at PC80: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (_slotList[2]).itemWhereType = currentWhereType
    else
      if tonumber(((_slotList[1]).count):GetText()) == 1 and (_slotList[1]).slotNo == slotNo then
        Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COLORBALENCE_INVENRCLICK"))
        return 
      end
      ;
      (_slotList[2]):setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64())
      ;
      ((_slotList[2]).icon):SetShow(true)
      -- DECOMPILER ERROR at PC122: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (_slotList[2]).slotNo = slotNo
      -- DECOMPILER ERROR at PC125: Confused about usage of register: R4 in 'UnsetPending'

      ;
      (_slotList[2]).itemWhereType = currentWhereType
    end
  end
  ;
  (ui._static_colorArrow):SetColor(UI_color.C_FFFFFFFF)
  ;
  ((_slotList[3]).icon):SetShow(false)
  ;
  (_slotList[3]):clearItem()
end

Panel_ColorBalance_SlotRClick = function(index)
  -- function num : 0_8 , upvalues : _slotList
  ((_slotList[index]).icon):SetShow(false)
  ;
  (_slotList[index]):clearItem()
  -- DECOMPILER ERROR at PC12: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (_slotList[index]).itemWhereType = nil
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  ;
  (_slotList[index]).slotNo = nil
  if Panel_Tooltip_Item:GetShow() then
    Panel_ColorBalance_HideTooltip()
  end
end

Panel_ColorBalance_DropHandler = function(index)
  -- function num : 0_9 , upvalues : _slotList
  if DragManager.dragStartPanel == nil then
    return false
  end
  local fromSlotNo = DragManager.dragSlotInfo
  do
    if Panel_Window_Inventory == DragManager.dragStartPanel then
      local itemWrapper = getInventoryItemByType(DragManager.dragWhereTypeInfo, DragManager.dragSlotInfo)
      if itemWrapper == nil then
        return false
      end
      ;
      (_slotList[index]):setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64())
      ;
      ((_slotList[index]).icon):SetShow(true)
      -- DECOMPILER ERROR at PC43: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (_slotList[index]).slotNo = DragManager.dragSlotInfo
      -- DECOMPILER ERROR at PC48: Confused about usage of register: R3 in 'UnsetPending'

      ;
      (_slotList[index]).itemWhereType = DragManager.dragWhereTypeInfo
      ;
      ((_slotList[3]).icon):SetShow(false)
      ;
      (_slotList[3]):clearItem()
      DragManager:clearInfo()
      return true
    end
    return false
  end
end

Panel_ColorBalance_ShowTooltip = function(index)
  -- function num : 0_10 , upvalues : _slotList
  local itemWrapper = getInventoryItemByType((_slotList[index]).itemWhereType, (_slotList[index]).slotNo)
  Panel_Tooltip_Item_Show(itemWrapper:getStaticStatus(), (_slotList[index]).icon, true, false)
end

Panel_ColorBalance_HideTooltip = function()
  -- function num : 0_11
  Panel_Tooltip_Item_hideTooltip()
end

Panel_ColorBalance_CombineDyeItem = function()
  -- function num : 0_12 , upvalues : _slotList
  if (_slotList[1]).itemWhereType == nil or (_slotList[2]).itemWhereType == nil then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_COLORBALENCE_COMBINEDYEITEM"))
    return 
  end
  ToClient_CombineDyeItem((_slotList[1]).itemWhereType, (_slotList[1]).slotNo, (_slotList[2]).itemWhereType, (_slotList[2]).slotNo)
end

FromClient_ColorBalance_SlotUpdate = function(itemWhereType, itemSlotNo)
  -- function num : 0_13 , upvalues : _slotCount, _slotList, ui
  local itemWrapper = nil
  for index = 1, _slotCount - 1 do
    itemWrapper = getInventoryItemByType((_slotList[index]).itemWhereType, (_slotList[index]).slotNo)
    if itemWrapper ~= nil then
      (_slotList[index]):setItemByStaticStatus(itemWrapper:getStaticStatus(), (itemWrapper:get()):getCount_s64())
    else
      ;
      ((_slotList[index]).icon):SetShow(false)
      ;
      (_slotList[index]):clearItem()
    end
  end
  itemWrapper = getInventoryItemByType(itemWhereType, itemSlotNo)
  ;
  (_slotList[3]):setItemByStaticStatus(itemWrapper:getStaticStatus(), 1)
  ;
  ((_slotList[3]).icon):SetShow(true)
  -- DECOMPILER ERROR at PC58: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (_slotList[3]).slotNo = itemSlotNo
  -- DECOMPILER ERROR at PC61: Confused about usage of register: R3 in 'UnsetPending'

  ;
  (_slotList[3]).itemWhereType = itemWhereType
  ;
  (ui._static_colorArrow):SetColor(((itemWrapper:getStaticStatus()):get()):getItemColor())
  FGlobal_Panel_DyeNew_updateColorAmpuleList()
  FGlobal_UpdateInventorySlotData()
end

ColorBalance_RestoreFlush = function(prevRenderModeList, nextRenderModeList)
  -- function num : 0_14
  if CheckRenderModebyGameMode(nextRenderModeList) == false then
    return 
  end
  if Panel_ColorBalance:GetShow() then
    Inventory_SetFunctor(Panel_ColorBalance_InvenFilter_IsDyeItem, Panel_ColorBalance_InvenRClick, Panel_ColorBalance_Close, nil)
  end
end

registerEvent("FromClient_RenderModeChangeState", "ColorBalance_RestoreFlush")
Panel_ColorBalance_PanelResize_ByFontSize()
registerEvent("FromClient_ColorBalance_SlotUpdate", "FromClient_ColorBalance_SlotUpdate")


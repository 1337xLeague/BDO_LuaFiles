-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\enchant\spiritenchant_animation.luac 

-- params : ...
-- function num : 0
Enchant_ShowAni = function()
  -- function num : 0_0
  local self = PaGlobal_Enchant
  audioPostEvent_SystemUi(1, 0)
  local aniInfo1 = Panel_Window_Enchant:addScaleAnimation(0, 0.08, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo1:SetStartScale(0.5)
  aniInfo1:SetEndScale(1.13)
  aniInfo1.AxisX = Panel_Window_Enchant:GetSizeX() / 2
  aniInfo1.AxisY = Panel_Window_Enchant:GetSizeY() / 2
  aniInfo1.ScaleType = 2
  aniInfo1.IsChangeChild = true
  local aniInfo2 = Panel_Window_Enchant:addScaleAnimation(0.08, 0.1, (CppEnums.PAUI_ANIM_ADVANCE_TYPE).PAUI_ANIM_ADVANCE_COS_HALF_PI)
  aniInfo2:SetStartScale(1.13)
  aniInfo2:SetEndScale(1)
  aniInfo2.AxisX = Panel_Window_Enchant:GetSizeX() / 2
  aniInfo2.AxisY = Panel_Window_Enchant:GetSizeY() / 2
  aniInfo2.ScaleType = 2
  aniInfo2.IsChangeChild = true
end

Enchant_HideAni = function()
  -- function num : 0_1
  local enchantHide = (UIAni.AlphaAnimation)(0, Panel_Window_Enchant, 0, 0.2)
  enchantHide:SetHideAtEnd(true)
  audioPostEvent_SystemUi(1, 1)
end



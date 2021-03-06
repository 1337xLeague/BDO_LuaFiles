-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\competitiongame\panel_competitiongameteamui.luac 

-- params : ...
-- function num : 0
Panel_CompetitionGame_TeamUi:SetShow(false)
local UI_color = Defines.Color
local teamMemberBg = (UI.getChildControl)(Panel_CompetitionGame_TeamUi, "Static_TeamMemberBg")
local team1 = 0
local team2 = 1
local teamMemberUi = {}
for index = 0, (CppEnums.CompetitionFreeForAll).eFreeForAllTeamLimit - 1 do
  teamMemberUi[index] = {}
end
local teamMember = {_classIcon = (UI.getChildControl)(teamMemberBg, "Static_ClassIcon"), _gaugeBlackBG = (UI.getChildControl)(teamMemberBg, "Static_BlackSpiritBG"), _gaugeBlack = (UI.getChildControl)(teamMemberBg, "BlackSpirtGauge"), _level = (UI.getChildControl)(teamMemberBg, "StaticText_Level"), _progressBg = (UI.getChildControl)(teamMemberBg, "Static_Hp_ProgressBg"), _hpProgress = (UI.getChildControl)(teamMemberBg, "Static_Hp_Progress"), _name = (UI.getChildControl)(teamMemberBg, "StaticText_CharacterName"), _myBorder = (UI.getChildControl)(teamMemberBg, "Static_MyInfoBorder"), _leftUserCount = (UI.getChildControl)(teamMemberBg, "StaticText_LeftCount"), _skillIcon1 = (UI.getChildControl)(teamMemberBg, "StaticText_SkillIcon1"), _skillIcon2 = (UI.getChildControl)(teamMemberBg, "StaticText_SkillIcon2"), _skillIcon3 = (UI.getChildControl)(teamMemberBg, "StaticText_SkillIcon3"), _skillIcon4 = (UI.getChildControl)(teamMemberBg, "StaticText_SkillIcon4"), _skillIcon5 = (UI.getChildControl)(teamMemberBg, "StaticText_SkillIcon5"), _gaugeRate = (UI.getChildControl)(teamMemberBg, "StaticText_ProgressRateText"), _hpNumber = (UI.getChildControl)(teamMemberBg, "StaticText_HpNumber")}
local controlTexture = {path = "New_UI_Common_ForLua/Window/Pvp/pvp_etc.dds", path2 = "New_UI_Common_ForLua/Default/Default_Gauges_01.dds", path3 = "New_UI_Common_ForLua/Window/Pvp/PvP_etc_01.dds", 
classIcon = {
[team1] = {
[(CppEnums.ClassType).ClassType_Warrior] = {291, 251, 320, 280}
, 
[(CppEnums.ClassType).ClassType_Ranger] = {355, 251, 384, 280}
, 
[(CppEnums.ClassType).ClassType_Sorcerer] = {3, 251, 32, 280}
, 
[(CppEnums.ClassType).ClassType_Giant] = {227, 251, 256, 280}
, 
[(CppEnums.ClassType).ClassType_Tamer] = {323, 251, 352, 280}
, 
[(CppEnums.ClassType).ClassType_BladeMaster] = {35, 251, 64, 280}
, 
[(CppEnums.ClassType).ClassType_BladeMasterWomen] = {67, 251, 96, 280}
, 
[(CppEnums.ClassType).ClassType_Valkyrie] = {259, 251, 288, 280}
, 
[(CppEnums.ClassType).ClassType_NinjaWomen] = {131, 251, 160, 280}
, 
[(CppEnums.ClassType).ClassType_NinjaMan] = {99, 251, 128, 280}
, 
[(CppEnums.ClassType).ClassType_Wizard] = {195, 251, 224, 280}
, 
[(CppEnums.ClassType).ClassType_WizardWomen] = {163, 251, 192, 280}
, 
[(CppEnums.ClassType).ClassType_DarkElf] = {387, 251, 416, 280}
, 
[(CppEnums.ClassType).ClassType_Combattant] = {419, 219, 448, 248}
}
, 
[team2] = {
[(CppEnums.ClassType).ClassType_Warrior] = {291, 219, 320, 248}
, 
[(CppEnums.ClassType).ClassType_Ranger] = {355, 219, 384, 248}
, 
[(CppEnums.ClassType).ClassType_Sorcerer] = {3, 219, 32, 248}
, 
[(CppEnums.ClassType).ClassType_Giant] = {227, 219, 256, 248}
, 
[(CppEnums.ClassType).ClassType_Tamer] = {323, 219, 352, 248}
, 
[(CppEnums.ClassType).ClassType_BladeMaster] = {35, 219, 64, 248}
, 
[(CppEnums.ClassType).ClassType_BladeMasterWomen] = {67, 219, 96, 248}
, 
[(CppEnums.ClassType).ClassType_Valkyrie] = {259, 219, 288, 248}
, 
[(CppEnums.ClassType).ClassType_NinjaWomen] = {131, 219, 160, 248}
, 
[(CppEnums.ClassType).ClassType_NinjaMan] = {99, 219, 128, 248}
, 
[(CppEnums.ClassType).ClassType_Wizard] = {195, 219, 224, 248}
, 
[(CppEnums.ClassType).ClassType_WizardWomen] = {163, 219, 192, 248}
, 
[(CppEnums.ClassType).ClassType_DarkElf] = {387, 219, 416, 248}
, 
[(CppEnums.ClassType).ClassType_Combattant] = {419, 251, 448, 280}
}
}
, 
teamBlack = {
[team1] = {48, 2, 83, 37}
, 
[team2] = {84, 2, 119, 37}
}
, 
teamBg = {
[team1] = {1, 87, 187, 126}
, 
[team2] = {1, 46, 187, 85}
}
, 
border = {
[team1] = {117, 1, 156, 40}
, 
[team2] = {158, 1, 197, 40}
}
, 
progress = {
[team1] = {33, 29, 41, 36}
, 
[team2] = {46, 29, 54, 36}
}
, 
progressBg = {
[team1] = {78, 26, 94, 41}
, 
[team2] = {96, 26, 112, 41}
}
}
CompetitionGame_TeamUi_Create = function()
  -- function num : 0_0
  if ToClient_CompetitionMatchType() == 0 then
    CompetitionGame_TeamUi_Round()
  else
    CompetitionGame_TeamUi_FreeForAll()
  end
end

CompetitionGame_FreeForAllSlotReset = function()
  -- function num : 0_1
  for i = 0, (CppEnums.CompetitionFreeForAll).eFreeForAllTeamLimit - 1 do
    CompetitionGame_StatSlotSetShow(0, i, false, true)
  end
end

CompetitionGame_StatSlotSetShow = function(teamIndex, userIndex, isVisible, isFree)
  -- function num : 0_2 , upvalues : teamMemberUi
  if (teamMemberUi[teamIndex])[userIndex] ~= nil then
    (((teamMemberUi[teamIndex])[userIndex])._teamBg):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._border):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._classIcon):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._level):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._progress):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._progressBg):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._name):SetShow(isVisible)
    ;
    (((teamMemberUi[teamIndex])[userIndex])._leftUserCount):SetShow(isVisible)
    if ToClient_CompetitionMatchType() == 1 then
      (((teamMemberUi[teamIndex])[userIndex])._skillIcon1):SetShow(false)
      ;
      (((teamMemberUi[teamIndex])[userIndex])._skillIcon2):SetShow(false)
      ;
      (((teamMemberUi[teamIndex])[userIndex])._skillIcon3):SetShow(false)
      ;
      (((teamMemberUi[teamIndex])[userIndex])._skillIcon4):SetShow(false)
      ;
      (((teamMemberUi[teamIndex])[userIndex])._skillIcon5):SetShow(false)
      ;
      (((teamMemberUi[teamIndex])[userIndex])._gaugeBlackBG):SetShow(false)
      ;
      (((teamMemberUi[teamIndex])[userIndex])._gaugeBlack):SetShow(false)
      ;
      (((teamMemberUi[teamIndex])[userIndex])._gaugeRate):SetShow(false)
    end
  end
end

CompetitionGame_TeamUi_Round = function()
  -- function num : 0_3 , upvalues : teamMember, teamMemberBg, controlTexture, teamMemberUi
  local playerWrapper = getSelfPlayer()
  local myTeamNo = playerWrapper:getCompetitionTeamNo()
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  ;
  (teamMember._myBorder):SetShow(true)
  ;
  (teamMember._classIcon):SetShow(true)
  ;
  (teamMember._level):SetShow(true)
  ;
  (teamMember._hpProgress):SetShow(true)
  ;
  (teamMember._hpNumber):SetShow(true)
  teamMemberBg:SetShow(true)
  ;
  (teamMember._progressBg):SetShow(true)
  ;
  (teamMember._name):SetShow(true)
  ;
  (teamMember._leftUserCount):SetShow(true)
  ;
  (teamMember._skillIcon1):SetShow(true)
  ;
  (teamMember._skillIcon2):SetShow(true)
  ;
  (teamMember._skillIcon3):SetShow(true)
  ;
  (teamMember._skillIcon4):SetShow(true)
  ;
  (teamMember._skillIcon5):SetShow(true)
  ;
  (teamMember._gaugeBlackBG):SetShow(true)
  ;
  (teamMember._gaugeBlack):SetShow(true)
  ;
  (teamMember._gaugeRate):SetShow(true)
  CompetitionGameTeamUI_StatSlotClose_Round()
  for Index = 0, teamCount - 1 do
    local teamInfo = ToClient_GetTeamListAt(Index)
    local teamNo = teamInfo:getTeamNo()
    local teamUserCount = ToClient_GetTeamUserInfoCount(teamNo)
    local textureIndex = 1
    if teamNo == 1 then
      textureIndex = 0
    else
      if teamNo == 2 then
        textureIndex = 1
      end
    end
    for userIndex = 0, teamUserCount - 1 do
      local temp = {}
      temp._teamBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CompetitionGame_TeamUi, "CompetitionGame_TeamBg_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMemberBg, temp._teamBg)
      ;
      (temp._teamBg):SetPosY((teamMemberBg:GetSizeY() + 5) * userIndex)
      ;
      (temp._teamBg):SetPosX((teamMemberBg:GetSizeX() + 5) * Index)
      ;
      (temp._teamBg):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(temp._teamBg, ((controlTexture.teamBg)[textureIndex])[1], ((controlTexture.teamBg)[textureIndex])[2], ((controlTexture.teamBg)[textureIndex])[3], ((controlTexture.teamBg)[textureIndex])[4])
      ;
      ((temp._teamBg):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (temp._teamBg):setRenderTexture((temp._teamBg):getBaseTexture())
      temp._classIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassIcon_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._classIcon, temp._classIcon)
      temp._gaugeBlackBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_gaugeBlackBG_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._gaugeBlackBG, temp._gaugeBlackBG)
      temp._gaugeBlack = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_CIRCULAR_PROGRESS, temp._teamBg, "CompetitionGame_gaugeBlack_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._gaugeBlack, temp._gaugeBlack)
      temp._progressBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassProgressBg_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._progressBg, temp._progressBg)
      ;
      (temp._progressBg):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(temp._progressBg, ((controlTexture.progressBg)[textureIndex])[1], ((controlTexture.progressBg)[textureIndex])[2], ((controlTexture.progressBg)[textureIndex])[3], ((controlTexture.progressBg)[textureIndex])[4])
      ;
      ((temp._progressBg):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (temp._progressBg):setRenderTexture((temp._progressBg):getBaseTexture())
      temp._progress = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, temp._teamBg, "CompetitionGame_TeamClassProgress_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._hpProgress, temp._progress)
      ;
      (temp._progress):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(temp._progress, ((controlTexture.progress)[textureIndex])[1], ((controlTexture.progress)[textureIndex])[2], ((controlTexture.progress)[textureIndex])[3], ((controlTexture.progress)[textureIndex])[4])
      ;
      ((temp._progress):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (temp._progress):setRenderTexture((temp._progress):getBaseTexture())
      temp._hpNumber = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_HPNumber_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._hpNumber, temp._hpNumber)
      temp._level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_TeamClassLevel_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._level, temp._level)
      temp._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_TeamClassName_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._name, temp._name)
      temp._leftUserCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_LeftUserCount_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._leftUserCount, temp._leftUserCount)
      temp._skillIcon1 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon1_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._skillIcon1, temp._skillIcon1)
      temp._skillIcon2 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon2_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._skillIcon2, temp._skillIcon2)
      temp._skillIcon3 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon3_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._skillIcon3, temp._skillIcon3)
      temp._skillIcon4 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon4_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._skillIcon4, temp._skillIcon4)
      temp._skillIcon5 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon5_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._skillIcon5, temp._skillIcon5)
      temp._gaugeRate = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_gaugeBlackRate_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._gaugeRate, temp._gaugeRate)
      temp._border = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassBorder_" .. Index .. "_" .. userIndex)
      CopyBaseProperty(teamMember._myBorder, temp._border)
      ;
      (temp._border):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(temp._border, ((controlTexture.border)[textureIndex])[1], ((controlTexture.border)[textureIndex])[2], ((controlTexture.border)[textureIndex])[3], ((controlTexture.border)[textureIndex])[4])
      ;
      ((temp._border):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (temp._border):setRenderTexture((temp._border):getBaseTexture())
      -- DECOMPILER ERROR at PC597: Confused about usage of register: R32 in 'UnsetPending'

      ;
      (teamMemberUi[teamNo - 1])[userIndex] = temp
    end
    CompetitionGame_TeamUI_Setting(teamNo, teamUserCount)
  end
  ;
  (teamMember._myBorder):SetShow(false)
  ;
  (teamMember._classIcon):SetShow(false)
  ;
  (teamMember._level):SetShow(false)
  ;
  (teamMember._hpProgress):SetShow(false)
  ;
  (teamMember._hpNumber):SetShow(false)
  teamMemberBg:SetShow(false)
  ;
  (teamMember._progressBg):SetShow(false)
  ;
  (teamMember._name):SetShow(false)
  ;
  (teamMember._leftUserCount):SetShow(false)
  ;
  (teamMember._skillIcon1):SetShow(false)
  ;
  (teamMember._skillIcon2):SetShow(false)
  ;
  (teamMember._skillIcon3):SetShow(false)
  ;
  (teamMember._skillIcon4):SetShow(false)
  ;
  (teamMember._skillIcon5):SetShow(false)
  ;
  (teamMember._gaugeBlackBG):SetShow(false)
  ;
  (teamMember._gaugeBlack):SetShow(false)
  ;
  (teamMember._gaugeRate):SetShow(false)
  CompetitionGameTeamUI_Open()
end

CompetitionGame_TeamUi_FreeForAll = function()
  -- function num : 0_4 , upvalues : teamMember, teamMemberBg, controlTexture, teamMemberUi
  local playerWrapper = getSelfPlayer()
  local myTeamNo = playerWrapper:getCompetitionTeamNo()
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  ;
  (teamMember._myBorder):SetShow(true)
  ;
  (teamMember._classIcon):SetShow(true)
  ;
  (teamMember._level):SetShow(true)
  ;
  (teamMember._hpProgress):SetShow(true)
  ;
  (teamMember._hpNumber):SetShow(true)
  teamMemberBg:SetShow(true)
  ;
  (teamMember._progressBg):SetShow(true)
  ;
  (teamMember._name):SetShow(true)
  ;
  (teamMember._leftUserCount):SetShow(true)
  ;
  (teamMember._skillIcon1):SetShow(false)
  ;
  (teamMember._skillIcon2):SetShow(false)
  ;
  (teamMember._skillIcon3):SetShow(false)
  ;
  (teamMember._skillIcon4):SetShow(false)
  ;
  (teamMember._skillIcon5):SetShow(false)
  ;
  (teamMember._gaugeBlackBG):SetShow(false)
  ;
  (teamMember._gaugeBlack):SetShow(false)
  ;
  (teamMember._gaugeRate):SetShow(false)
  CompetitionGame_FreeForAllSlotReset()
  for teamIndex = 0, teamCount - 1 do
    local teamInfo = ToClient_GetTeamListAt(teamIndex)
    local teamNo = teamInfo:getTeamNo()
    local textureIndex = 0
    if myTeamNo == teamNo then
      textureIndex = 1
    end
    local temp = {}
    temp._teamBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, Panel_CompetitionGame_TeamUi, "CompetitionGame_TeamBg_" .. teamIndex)
    CopyBaseProperty(teamMemberBg, temp._teamBg)
    ;
    (temp._teamBg):SetPosY((teamMemberBg:GetSizeY() + 5) * teamIndex)
    ;
    (temp._teamBg):ChangeTextureInfoName(controlTexture.path)
    local x1, y1, x2, y2 = setTextureUV_Func(temp._teamBg, ((controlTexture.teamBg)[textureIndex])[1], ((controlTexture.teamBg)[textureIndex])[2], ((controlTexture.teamBg)[textureIndex])[3], ((controlTexture.teamBg)[textureIndex])[4])
    ;
    ((temp._teamBg):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (temp._teamBg):setRenderTexture((temp._teamBg):getBaseTexture())
    temp._classIcon = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassIcon_" .. teamIndex)
    CopyBaseProperty(teamMember._classIcon, temp._classIcon)
    temp._gaugeBlackBG = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_gaugeBlackBG_" .. teamIndex)
    CopyBaseProperty(teamMember._gaugeBlackBG, temp._gaugeBlackBG)
    temp._gaugeBlack = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_CIRCULAR_PROGRESS, temp._teamBg, "CompetitionGame_gaugeBlack_" .. teamIndex)
    CopyBaseProperty(teamMember._gaugeBlack, temp._gaugeBlack)
    temp._progressBg = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassProgressBg_" .. teamIndex)
    CopyBaseProperty(teamMember._progressBg, temp._progressBg)
    ;
    (temp._progressBg):ChangeTextureInfoName(controlTexture.path)
    local x1, y1, x2, y2 = setTextureUV_Func(temp._progressBg, ((controlTexture.progressBg)[textureIndex])[1], ((controlTexture.progressBg)[textureIndex])[2], ((controlTexture.progressBg)[textureIndex])[3], ((controlTexture.progressBg)[textureIndex])[4])
    ;
    ((temp._progressBg):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (temp._progressBg):setRenderTexture((temp._progressBg):getBaseTexture())
    temp._progress = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_PROGRESS2, temp._teamBg, "CompetitionGame_TeamClassProgress_" .. teamIndex)
    CopyBaseProperty(teamMember._hpProgress, temp._progress)
    ;
    (temp._progress):ChangeTextureInfoName(controlTexture.path)
    local x1, y1, x2, y2 = setTextureUV_Func(temp._progress, ((controlTexture.progress)[textureIndex])[1], ((controlTexture.progress)[textureIndex])[2], ((controlTexture.progress)[textureIndex])[3], ((controlTexture.progress)[textureIndex])[4])
    ;
    ((temp._progress):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (temp._progress):setRenderTexture((temp._progress):getBaseTexture())
    temp._hpNumber = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_HPNumber_" .. teamIndex)
    CopyBaseProperty(teamMember._hpNumber, temp._hpNumber)
    temp._level = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_TeamClassLevel_" .. teamIndex)
    CopyBaseProperty(teamMember._level, temp._level)
    temp._name = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_TeamClassName_" .. teamIndex)
    CopyBaseProperty(teamMember._name, temp._name)
    temp._leftUserCount = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_LeftUserCount_" .. teamIndex)
    CopyBaseProperty(teamMember._leftUserCount, temp._leftUserCount)
    temp._skillIcon1 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon1_" .. teamIndex)
    CopyBaseProperty(teamMember._skillIcon1, temp._skillIcon1)
    temp._skillIcon2 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon2_" .. teamIndex)
    CopyBaseProperty(teamMember._skillIcon2, temp._skillIcon2)
    temp._skillIcon3 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon3_" .. teamIndex)
    CopyBaseProperty(teamMember._skillIcon3, temp._skillIcon3)
    temp._skillIcon4 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon4_" .. teamIndex)
    CopyBaseProperty(teamMember._skillIcon4, temp._skillIcon4)
    temp._skillIcon5 = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_skillIcon5_" .. teamIndex)
    CopyBaseProperty(teamMember._skillIcon5, temp._skillIcon5)
    temp._gaugeRate = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATICTEXT, temp._teamBg, "CompetitionGame_gaugeBlackRate_" .. teamIndex)
    CopyBaseProperty(teamMember._gaugeRate, temp._gaugeRate)
    temp._border = (UI.createControl)((CppEnums.PA_UI_CONTROL_TYPE).PA_UI_CONTROL_STATIC, temp._teamBg, "CompetitionGame_TeamClassBorder_" .. teamIndex)
    CopyBaseProperty(teamMember._myBorder, temp._border)
    ;
    (temp._border):ChangeTextureInfoName(controlTexture.path)
    local x1, y1, x2, y2 = setTextureUV_Func(temp._border, ((controlTexture.border)[textureIndex])[1], ((controlTexture.border)[textureIndex])[2], ((controlTexture.border)[textureIndex])[3], ((controlTexture.border)[textureIndex])[4])
    ;
    ((temp._border):getBaseTexture()):setUV(x1, y1, x2, y2)
    ;
    (temp._border):setRenderTexture((temp._border):getBaseTexture())
    -- DECOMPILER ERROR at PC544: Confused about usage of register: R27 in 'UnsetPending'

    ;
    (teamMemberUi[0])[teamNo - 1] = temp
    CompetitionGame_TeamUI_Setting(teamNo, 0)
  end
  ;
  (teamMember._myBorder):SetShow(false)
  ;
  (teamMember._classIcon):SetShow(false)
  ;
  (teamMember._level):SetShow(false)
  ;
  (teamMember._hpProgress):SetShow(false)
  ;
  (teamMember._hpNumber):SetShow(false)
  teamMemberBg:SetShow(false)
  ;
  (teamMember._progressBg):SetShow(false)
  ;
  (teamMember._name):SetShow(false)
  ;
  (teamMember._leftUserCount):SetShow(false)
  ;
  (teamMember._skillIcon1):SetShow(false)
  ;
  (teamMember._skillIcon2):SetShow(false)
  ;
  (teamMember._skillIcon3):SetShow(false)
  ;
  (teamMember._skillIcon4):SetShow(false)
  ;
  (teamMember._skillIcon5):SetShow(false)
  ;
  (teamMember._gaugeBlackBG):SetShow(false)
  ;
  (teamMember._gaugeBlack):SetShow(false)
  ;
  (teamMember._gaugeRate):SetShow(false)
  CompetitionGameTeamUI_Open()
end

CompetitionGame_TeamUI_Setting = function(teamNo, userCount)
  -- function num : 0_5
  if ToClient_CompetitionMatchType() == 0 then
    CompetitionGame_TeamUI_Setting_Round(teamNo, userCount)
  else
    CompetitionGame_TeamUI_Setting_FreeForAll(teamNo)
  end
end

CompetitionGame_TeamUI_Setting_Round = function(teamNo, userCount)
  -- function num : 0_6 , upvalues : teamMemberUi, controlTexture, UI_color
  local myTeamNo = (getSelfPlayer()):getCompetitionTeamNo()
  local myUserNo = ((getSelfPlayer()):get()):getUserNo()
  local teamIndex = teamNo - 1
  local textureIndex = 0
  if teamNo == 1 then
    textureIndex = 0
  else
    if teamNo == 2 then
      textureIndex = 1
    end
  end
  local hpPercent = 0
  local adrenalinPoint = 0
  for index = 0, userCount - 1 do
    local userSlot = (teamMemberUi[teamIndex])[index]
    local userInfo = ToClient_GetTeamUserInfoAt(teamNo, index)
    if userInfo ~= nil and userSlot ~= nil then
      local classType = userInfo:getCharacterClass()
      ;
      (userSlot._classIcon):SetShow(true)
      ;
      (userSlot._classIcon):ChangeTextureInfoName(controlTexture.path)
      local x1, y1, x2, y2 = setTextureUV_Func(userSlot._classIcon, (((controlTexture.classIcon)[textureIndex])[classType])[1], (((controlTexture.classIcon)[textureIndex])[classType])[2], (((controlTexture.classIcon)[textureIndex])[classType])[3], (((controlTexture.classIcon)[textureIndex])[classType])[4])
      ;
      ((userSlot._classIcon):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (userSlot._classIcon):setRenderTexture((userSlot._classIcon):getBaseTexture())
      ;
      (userSlot._gaugeBlack):ChangeTextureInfoName(controlTexture.path3)
      local x1, y1, x2, y2 = setTextureUV_Func(userSlot._gaugeBlack, ((controlTexture.teamBlack)[textureIndex])[1], ((controlTexture.teamBlack)[textureIndex])[2], ((controlTexture.teamBlack)[textureIndex])[3], ((controlTexture.teamBlack)[textureIndex])[4])
      ;
      ((userSlot._gaugeBlack):getBaseTexture()):setUV(x1, y1, x2, y2)
      ;
      (userSlot._gaugeBlack):setRenderTexture((userSlot._gaugeBlack):getBaseTexture())
      hpPercent = userInfo:getHP() / userInfo:getMaxHP() * 100
      adrenalinPoint = userInfo:getAP()
      ;
      (userSlot._level):SetShow(true)
      ;
      (userSlot._level):SetText(userInfo:getCharacterLevel())
      ;
      (userSlot._progress):SetProgressRate(hpPercent)
      ;
      (userSlot._hpNumber):SetText((string.format)("%d", (math.floor)(hpPercent)) .. "%")
      ;
      (userSlot._name):SetText(userInfo:getCharacterName())
      ;
      (userSlot._name):SetFontColor(UI_color.C_FFEFEFEF)
      ;
      (userSlot._leftUserCount):SetShow(false)
      ;
      (userSlot._skillIcon1):SetShow(false)
      ;
      (userSlot._skillIcon2):SetShow(false)
      ;
      (userSlot._skillIcon3):SetShow(false)
      ;
      (userSlot._skillIcon4):SetShow(false)
      ;
      (userSlot._skillIcon5):SetShow(false)
      if myTeamNo == teamNo or myTeamNo == 0 then
        (userSlot._gaugeBlackBG):SetShow(true)
        ;
        (userSlot._gaugeBlack):SetShow(true)
        ;
        (userSlot._gaugeBlack):SetProgressRate(adrenalinPoint)
        ;
        (userSlot._gaugeRate):SetShow(true)
        ;
        (userSlot._gaugeRate):SetText(tostring(adrenalinPoint) .. "%")
      else
        ;
        (userSlot._gaugeBlackBG):SetShow(false)
        ;
        (userSlot._gaugeBlack):SetShow(false)
        ;
        (userSlot._gaugeBlack):SetProgressRate(0)
        ;
        (userSlot._gaugeRate):SetShow(false)
        ;
        (userSlot._gaugeRate):SetText("")
      end
      if userInfo:getUserNo() == myUserNo then
        (userSlot._border):SetShow(true)
      else
        ;
        (userSlot._border):SetShow(false)
      end
      ;
      (userSlot._teamBg):addInputEvent("Mouse_LUp", "CompetitionGame_CameraControl(" .. tostring(userInfo:getUserNo()) .. ")")
    end
  end
end

CompetitionGame_TeamUI_Setting_FreeForAll = function(teamNo)
  -- function num : 0_7 , upvalues : teamMemberUi, teamMember, UI_color
  local myTeamNo = (getSelfPlayer()):getCompetitionTeamNo()
  local myUserNo = ((getSelfPlayer()):get()):getUserNo()
  local teamIndex = teamNo - 1
  local textureIndex = 0
  if myTeamNo == teamNo then
    textureIndex = 1
  end
  local hpPercent = 0
  local userSlot = (teamMemberUi[0])[teamIndex]
  local leaderInfo = ToClient_GetTeamLeaderInfo(teamNo)
  ;
  (teamMember._skillIcon1):SetShow(false)
  ;
  (teamMember._skillIcon2):SetShow(false)
  ;
  (teamMember._skillIcon3):SetShow(false)
  ;
  (teamMember._skillIcon4):SetShow(false)
  ;
  (teamMember._skillIcon5):SetShow(false)
  ;
  (teamMember._gaugeBlackBG):SetShow(false)
  ;
  (teamMember._gaugeBlack):SetShow(false)
  ;
  (teamMember._gaugeRate):SetShow(false)
  if leaderInfo ~= nil and userSlot ~= nil then
    local classType = leaderInfo:getCharacterClass()
    ;
    (userSlot._classIcon):SetShow(false)
    hpPercent = ToClient_GetTeamTotalHpPercent(teamNo)
    ;
    (userSlot._progress):SetProgressRate(hpPercent)
    ;
    (userSlot._hpNumber):SetText((string.format)("%d", (math.floor)(hpPercent)) .. "%")
    ;
    (userSlot._name):SetText(PAGetStringParam1(Defines.StringSheet_GAME, "LUA_ARSHA_TEAMUI_NAMETEXT", "name", leaderInfo:getCharacterName()))
    ;
    (userSlot._name):SetFontColor(UI_color.C_FFEFEFEF)
    ;
    (userSlot._level):SetShow(false)
    ;
    (userSlot._leftUserCount):SetShow(true)
    if leaderInfo:getUserNo() == myUserNo then
      (userSlot._border):SetShow(true)
    else
      ;
      (userSlot._border):SetShow(false)
    end
  end
end

FromClient_UpdateUserHP = function()
  -- function num : 0_8
  if ToClient_CompetitionMatchType() == 0 then
    FromClient_UpdateUserHP_Round()
  else
    FromClient_UpdateUserHP_FreeForAll()
  end
end

FromClient_UpdateUserHP_Round = function()
  -- function num : 0_9 , upvalues : teamMemberUi, UI_color
  local myTeamNo = (getSelfPlayer()):getCompetitionTeamNo()
  local hpPercent = 0
  local teamUserCount = 0
  local teamIndex = 0
  local teamNo = 0
  local teamInfo = nil
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  for Index = 0, teamCount - 1 do
    teamInfo = ToClient_GetTeamListAt(Index)
    teamNo = teamInfo:getTeamNo()
    teamUserCount = ToClient_GetTeamUserInfoCount(teamNo)
    teamIndex = teamNo - 1
    for userIndex = 0, teamUserCount - 1 do
      local userSlot = (teamMemberUi[teamIndex])[userIndex]
      local userInfo = ToClient_GetTeamUserInfoAt(teamNo, userIndex)
      if userSlot == nil then
        CompetitionGame_TeamUi_Create()
        userSlot = (teamMemberUi[teamIndex])[userIndex]
      end
      if userInfo ~= nil and userSlot ~= nil then
        hpPercent = userInfo:getHP() / userInfo:getMaxHP() * 100
        ;
        (userSlot._progress):SetProgressRate(hpPercent)
        ;
        (userSlot._hpNumber):SetText((string.format)("%d", (math.floor)(hpPercent)) .. "%")
        ;
        (userSlot._name):SetText(userInfo:getCharacterName())
        if hpPercent <= 0 then
          (userSlot._name):SetFontColor(UI_color.C_FFC4BEBE)
        end
        local actorKey = userInfo:getActorKey()
        local adrenalin = 0
        local skillCount = ToClient_GetUseSkillListCount(actorKey)
        local skillNo = 0
        local remainTime = 0
        if myTeamNo == teamNo or myTeamNo == 0 then
          adrenalin = userInfo:getAP()
          ;
          (userSlot._gaugeBlack):SetProgressRate(adrenalin)
          ;
          (userSlot._gaugeBlack):SetPosX(3)
          ;
          (userSlot._gaugeBlack):SetPosY(3)
          ;
          (userSlot._gaugeRate):SetText(tostring(adrenalin) .. "%")
        end
        for idx = 0, skillCount - 1 do
          skillNo = ToClient_GetUseSkillListAt(actorKey, idx)
          local skillCool = ToClient_GetSkillCoolTime_OtherUser(actorKey, idx)
          local skillSSW = getSkillTypeStaticStatus(skillNo)
          local skillName = skillSSW:getName()
          local skillIcon = skillSSW:getIconPath()
          if idx == 0 then
            if skillCool <= 0 then
              (userSlot._skillIcon1):SetShow(false)
            else
              ;
              (userSlot._skillIcon1):ChangeTextureInfoName("Icon/" .. skillIcon)
              ;
              (userSlot._skillIcon1):SetShow(true)
            end
          end
          if idx == 1 then
            if skillCool <= 0 then
              (userSlot._skillIcon2):SetShow(false)
            else
              ;
              (userSlot._skillIcon2):ChangeTextureInfoName("Icon/" .. skillIcon)
              ;
              (userSlot._skillIcon2):SetShow(true)
            end
          end
          if idx == 2 then
            if skillCool <= 0 then
              (userSlot._skillIcon3):SetShow(false)
            else
              ;
              (userSlot._skillIcon3):ChangeTextureInfoName("Icon/" .. skillIcon)
              ;
              (userSlot._skillIcon3):SetShow(true)
            end
          end
          if idx == 3 then
            if skillCool <= 0 then
              (userSlot._skillIcon4):SetShow(false)
            else
              ;
              (userSlot._skillIcon4):ChangeTextureInfoName("Icon/" .. skillIcon)
              ;
              (userSlot._skillIcon4):SetShow(true)
            end
          end
          local skillIconPos = 51
          if (userSlot._skillIcon1):GetShow() then
            (userSlot._skillIcon1):SetPosX(skillIconPos)
            ;
            (userSlot._skillIcon1):SetPosY(37)
            skillIconPos = skillIconPos + 25
          end
          if (userSlot._skillIcon2):GetShow() then
            (userSlot._skillIcon2):SetPosX(skillIconPos)
            ;
            (userSlot._skillIcon2):SetPosY(37)
            skillIconPos = skillIconPos + 25
          end
          if (userSlot._skillIcon3):GetShow() then
            (userSlot._skillIcon3):SetPosX(skillIconPos)
            ;
            (userSlot._skillIcon3):SetPosY(37)
            skillIconPos = skillIconPos + 25
          end
          if (userSlot._skillIcon4):GetShow() then
            (userSlot._skillIcon4):SetPosX(skillIconPos)
            ;
            (userSlot._skillIcon4):SetPosY(37)
            skillIconPos = skillIconPos + 25
          end
          if (userSlot._skillIcon5):GetShow() then
            (userSlot._skillIcon5):SetPosX(skillIconPos)
            ;
            (userSlot._skillIcon5):SetPosY(37)
          end
        end
        ;
        (userSlot._teamBg):addInputEvent("Mouse_LUp", "CompetitionGame_CameraControl(" .. tostring(userInfo:getUserNo()) .. ")")
      end
    end
  end
end

FromClient_UpdateUserHP_FreeForAll = function()
  -- function num : 0_10 , upvalues : teamMember, teamMemberUi, UI_color
  local hpPercent = 0
  local teamNo = 0
  local teamIndex = 0
  local teamInfo = nil
  local totalUserCount = 0
  local deadUserCount = 0
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  ;
  (teamMember._skillIcon1):SetShow(false)
  ;
  (teamMember._skillIcon2):SetShow(false)
  ;
  (teamMember._skillIcon3):SetShow(false)
  ;
  (teamMember._skillIcon4):SetShow(false)
  ;
  (teamMember._skillIcon5):SetShow(false)
  ;
  (teamMember._gaugeBlackBG):SetShow(false)
  ;
  (teamMember._gaugeBlack):SetShow(false)
  ;
  (teamMember._gaugeRate):SetShow(false)
  for Index = 0, teamCount - 1 do
    teamInfo = ToClient_GetTeamListAt(Index)
    teamNo = teamInfo:getTeamNo()
    hpPercent = ToClient_GetTeamTotalHpPercent(teamNo)
    teamIndex = teamNo - 1
    totalUserCount = ToClient_GetTeamUserInfoCount(teamNo)
    deadUserCount = ToClient_GetTeamDeadUserCount(teamNo)
    local userSlot = (teamMemberUi[0])[teamIndex]
    if userSlot == nil then
      CompetitionGame_TeamUi_Create()
    end
    if userSlot ~= nil then
      (userSlot._progress):SetProgressRate(hpPercent)
      ;
      (userSlot._hpNumber):SetText((string.format)("%d", (math.floor)(hpPercent)) .. "%")
      if hpPercent <= 0 then
        (userSlot._name):SetFontColor(UI_color.C_FFC4BEBE)
      end
      ;
      (userSlot._leftUserCount):SetText(tostring(totalUserCount - deadUserCount))
      if totalUserCount - deadUserCount <= 1 then
        (userSlot._leftUserCount):SetFontColor(UI_color.C_FFFF0000)
      else
        ;
        (userSlot._leftUserCount):SetFontColor(UI_color.C_FFFFFFFF)
      end
    end
  end
end

CompetitionGameTeamUI_StatSlotClose_Round = function()
  -- function num : 0_11 , upvalues : teamMemberUi
  local teamUserCount = 0
  local teamIndex = 0
  local teamNo = 0
  local teamInfo = nil
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  local beforeTeamCnt = 0
  for Index = 0, teamCount - 1 do
    teamInfo = ToClient_GetTeamListAt(Index)
    teamNo = teamInfo:getTeamNo()
    teamUserCount = ToClient_GetTeamUserInfoCount(teamNo)
    teamIndex = teamNo - 1
    beforeTeamCnt = #teamMemberUi[teamIndex] + 1
    for userIndex = 0, beforeTeamCnt - 1 do
      CompetitionGame_StatSlotSetShow(teamIndex, userIndex, false, false)
    end
  end
end

CompetitionGameTeamUI_StatSlotClose_FreeForAll = function()
  -- function num : 0_12 , upvalues : teamMember
  local teamNo = 0
  local teamIndex = 0
  local teamInfo = nil
  local teamCount = ToClient_GetTeamListCountWithOutZero()
  ;
  (teamMember._skillIcon1):SetShow(false)
  ;
  (teamMember._skillIcon2):SetShow(false)
  ;
  (teamMember._skillIcon3):SetShow(false)
  ;
  (teamMember._skillIcon4):SetShow(false)
  ;
  (teamMember._skillIcon5):SetShow(false)
  ;
  (teamMember._gaugeBlackBG):SetShow(false)
  ;
  (teamMember._gaugeBlack):SetShow(false)
  ;
  (teamMember._gaugeRate):SetShow(false)
  for Index = 0, teamCount - 1 do
    teamInfo = ToClient_GetTeamListAt(Index)
    teamNo = teamInfo:getTeamNo()
    teamIndex = teamNo - 1
    CompetitionGame_StatSlotSetShow(0, teamIndex, false, true)
  end
end

CompetitionGame_CameraControl = function(teamNo)
  -- function num : 0_13
  ToClient_ForceChangeScreenModeActor(toInt64(0, teamNo))
end

CompetitionGameTeamUI_Open = function()
  -- function num : 0_14
  Panel_CompetitionGame_TeamUi:SetShow(true)
  local selfActorKeyRaw = (getSelfPlayer()):getActorKey()
  if (getSelfPlayer()):isPartyMemberActorKey(selfActorKeyRaw) == true then
    Panel_Party:SetShow(false)
  end
end

CompetitionGameTeamUI_Close = function()
  -- function num : 0_15
  Panel_CompetitionGame_TeamUi:SetShow(false)
  local selfActorKeyRaw = (getSelfPlayer()):getActorKey()
  if (getSelfPlayer()):isPartyMemberActorKey(selfActorKeyRaw) == true then
    Panel_Party:SetShow(true)
  end
  if ToClient_CompetitionMatchType() == 0 then
    CompetitionGameTeamUI_StatSlotClose_Round()
  else
    CompetitionGameTeamUI_StatSlotClose_FreeForAll()
  end
end

registerEvent("FromClient_UpdateUserHP", "FromClient_UpdateUserHP")


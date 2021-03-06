-- Decompiled using luadec 2.2 rev:  for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: D:\BDO_PazGameData\Unpacked\luacscript\x86\window\worldmap_grand\grand_worldmap_nodemenu.luac 

-- params : ...
-- function num : 0
local UI_TYPE = CppEnums.PA_UI_CONTROL_TYPE
local ENT = CppEnums.ExplorationNodeType
local UI_ANI_ADV = CppEnums.PAUI_ANIM_ADVANCE_TYPE
local UI_color = Defines.Color
local UI_TM = CppEnums.TextMode
local UI_PP = CppEnums.PAUIMB_PRIORITY
local UI_TT = CppEnums.PAUI_TEXTURE_TYPE
local nodeStaticStatus, _wayPointKey = nil, nil
local isProgressReset = false
local Txt_Node_Title = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Title")
local Txt_NodeManager = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_StaticText_NodeManager")
local static_NodeManagerBG = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Bg")
local Txt_NodeManager_Name = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_StaticText_NodeManager_Value")
local Txt_Node_Desc = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_StaticText_NodeLinkStatus")
local Tex_NeedExplorePoint = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_NeedExplorePoint_LinkIcon")
local Txt_NeedExplorePoint = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_NeedExplorePoint_Link_Value")
local Btn_NodeLink = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Button_NodeLink")
local Btn_NearNode = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Button_NearNode")
local Btn_NodeUnlink = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Button_NodeUnLink")
local NodeLevelGroup = {Tex_NodeLevBG = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Static_NodeLev_Bg"), Btn_NodeLev = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Button_NodeLev"), Txt_NodeLevel = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_CurrentNodeLevel"), Tex_ProgressBG = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_ProgressBg_NodeLev"), Progress_NodeLevel = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Progress_NodeLev"), Btn_NodeLevHelp = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_NodelLev_Help")}
local savedisMaxLevel = false
local NodeWarGroup = {}
local SelfExplorePointGroup = {Tex_Explore_Partline = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Static_Partline"), Tex_ExplorePoint_BG = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_ExplorePoint_Bg"), Tex_ExplorePoint_Icon = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_ExplorePoint_Icon"), Txt_ExplorePoint_Value = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_ExplorePoint_Value"), Tex_ExplorePoint_PrgressBG = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_ExplorePoint_Progress_BG"), Progress_ExplorePoint = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_ExplorePoint_Progress"), Btn_ExplorePoint_Help = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_ExplorePoint_Help")}
local nodeMenu_init = function()
  -- function num : 0_0 , upvalues : NodeLevelGroup, SelfExplorePointGroup
  (NodeLevelGroup.Btn_NodeLevHelp):addInputEvent("Mouse_On", "HandleOnout_GrandWorldMap_NodeMenu_explorePointHelp( true, " .. 0 .. " )")
  ;
  (NodeLevelGroup.Btn_NodeLevHelp):addInputEvent("Mouse_Out", "HandleOnout_GrandWorldMap_NodeMenu_explorePointHelp( false, " .. 0 .. " )")
  ;
  (NodeLevelGroup.Btn_NodeLevHelp):setTooltipEventRegistFunc("HandleOnout_GrandWorldMap_NodeMenu_explorePointHelp( true, " .. 0 .. " )")
  ;
  (SelfExplorePointGroup.Btn_ExplorePoint_Help):addInputEvent("Mouse_On", "HandleOnout_GrandWorldMap_NodeMenu_explorePointHelp( true, " .. 1 .. " )")
  ;
  (SelfExplorePointGroup.Btn_ExplorePoint_Help):addInputEvent("Mouse_Out", "HandleOnout_GrandWorldMap_NodeMenu_explorePointHelp( false, " .. 1 .. " )")
  ;
  (SelfExplorePointGroup.Btn_ExplorePoint_Help):setTooltipEventRegistFunc("HandleOnout_GrandWorldMap_NodeMenu_explorePointHelp( true, " .. 1 .. " )")
end

local IconType = {Country = 0, Territory = 1, NodeType = 2, Weather = 3}
local NodeIconArray = {[IconType.Country] = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_Contry"), [IconType.Territory] = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_City"), [IconType.NodeType] = (UI.getChildControl)(Panel_NodeMenu, "MainMenu_NodeType")}
;
(NodeLevelGroup.Btn_NodeLev):SetAutoDisableTime(0.3)
local nodeButtonTextSwitchCaseList = {[ENT.eExplorationNodeType_Normal] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_EMPTY"), [ENT.eExplorationNodeType_Viliage] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_VILIAGE"), [ENT.eExplorationNodeType_City] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_CITY"), [ENT.eExplorationNodeType_Gate] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_GATE"), [ENT.eExplorationNodeType_Farm] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_FARM"), [ENT.eExplorationNodeType_Trade] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_FILTRATION"), [ENT.eExplorationNodeType_Collect] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_COLLECT"), [ENT.eExplorationNodeType_Quarry] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_QUARRY"), [ENT.eExplorationNodeType_Logging] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_LOGGING"), [ENT.eExplorationNodeType_Dangerous] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_DECOTREE"), [ENT.eExplorationNodeType_Finance] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_FINANCE"), [ENT.eExplorationNodeType_FishTrap] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_FISHTRAP"), [ENT.eExplorationNodeType_MinorFinance] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_MINORFINANCE"), [ENT.eExplorationNodeType_MonopolyFarm] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TYPE_MONOPOLYFARM")}
local NodeTextType = {NODE_DESCRIPTION = 0, NODE_NATIONAL_TITLE = 1, NODE_NATIONAL_TEXT = 2, NODE_TERRITORY_TITLE = 3, NODE_TERRITORY_TEXT = 4, NODE_AFFILIATEDTOWN_TITLE = 5, NODE_AFFILIATEDTOWN_TEXT = 6, NODE_MANAGER_TITLE = 7, NODE_MANAGER_TEXT = 8, NODE_POINT_TEXT = 9, NODE_SUPPORT_TEXT = 10, NODE_MONEY_TEXT = 11, NODE_ITEM1_TEXT = 12, NODE_ITEM2_TEXT = 13, NODE_ITEM3_TEXT = 14, NODE_FINDMANGER_TEXT = 15, NODE_UNUPGRADE_TEXT = 16, NODE_UNWITHDRAW_TEXT = 17, NODE_LAST = 18}
local NodeTextColor = {[NodeTextType.NODE_DESCRIPTION] = UI_color.C_FFFFFFFF, [NodeTextType.NODE_NATIONAL_TITLE] = UI_color.C_FFC4BEBE, [NodeTextType.NODE_NATIONAL_TEXT] = UI_color.C_FFFAE696, [NodeTextType.NODE_TERRITORY_TITLE] = UI_color.C_FFC4BEBE, [NodeTextType.NODE_TERRITORY_TEXT] = UI_color.C_FFFAE696, [NodeTextType.NODE_AFFILIATEDTOWN_TITLE] = UI_color.C_FFC4BEBE, [NodeTextType.NODE_AFFILIATEDTOWN_TEXT] = UI_color.C_FFFAE696, [NodeTextType.NODE_MANAGER_TITLE] = UI_color.C_FFC4BEBE, [NodeTextType.NODE_MANAGER_TEXT] = UI_color.C_FF6DC6FF, [NodeTextType.NODE_POINT_TEXT] = UI_color.C_FFFF7C67, [NodeTextType.NODE_SUPPORT_TEXT] = UI_color.C_FFFF7C67, [NodeTextType.NODE_MONEY_TEXT] = UI_color.C_FF67FFA4, [NodeTextType.NODE_ITEM1_TEXT] = UI_color.C_FF67FFA4, [NodeTextType.NODE_ITEM2_TEXT] = UI_color.C_FF67FFA4, [NodeTextType.NODE_ITEM3_TEXT] = UI_color.C_FF67FFA4, [NodeTextType.NODE_FINDMANGER_TEXT] = UI_color.C_FF6DC6FF, [NodeTextType.NODE_UNUPGRADE_TEXT] = UI_color.C_FFFF4729, [NodeTextType.NODE_UNWITHDRAW_TEXT] = UI_color.C_FF88DF00}
local NodeTextString = {[NodeTextType.NODE_NATIONAL_TITLE] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_NATIONAL"), [NodeTextType.NODE_TERRITORY_TITLE] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_TERRITORY"), [NodeTextType.NODE_MANAGER_TITLE] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_MANAGER"), [NodeTextType.NODE_AFFILIATEDTOWN_TITLE] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_AFFILIATEDTOWN"), [NodeTextType.NODE_POINT_TEXT] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_CONTRIBUTIVENESS"), [NodeTextType.NODE_MONEY_TEXT] = PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_GOLD"), [NodeTextType.NODE_FINDMANGER_TEXT] = PAGetString(Defines.StringSheet_GAME, "PANEL_WORLDMAP_FINDNODEMANAGER")}
local NodeTextControl = {}
local SetFontColorAndText = function(uiControl, text, color)
  -- function num : 0_1
  uiControl:SetText(text)
  uiControl:SetFontColor(color)
end

OnNearNodeClick = function(nodeKey)
  -- function num : 0_2
  if ((getSelfPlayer()):get()):getLevel() < 11 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_RADER_TUTORIAL_PROGRSS_ACK"))
    return 
  end
  ToClient_DeleteNaviGuideByGroup(0)
  ToClient_WorldMapFindNearNode(nodeKey, NavigationGuideParam())
  audioPostEvent_SystemUi(0, 14)
  FGlobal_WorldMapWindowEscape()
end

OnNodeUpgradeClick = function(nodeKey)
  -- function num : 0_3 , upvalues : isProgressReset
  isProgressReset = true
  ToClient_WorldMapRequestUpgradeExplorationNode(nodeKey)
  PaGlobal_TutorialManager:handleOnNodeUpgradeClick(nodeKey)
end

OnNodeWithdrawClick = function(nodeKey)
  -- function num : 0_4
  local NodeWithdrawExecute = function()
    -- function num : 0_4_0 , upvalues : nodeKey
    ToClient_WorldMapRequestWithdrawPlant(nodeKey)
  end

  if Panel_Plant_WorkManager:GetShow() then
    WorldMapPopupManager:popPanel()
  end
  local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_PANEL_WORLDMAP_NODE_WITHDRAWCONFIRM")
  local messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WARNING"), content = messageBoxMemo, functionYes = NodeWithdrawExecute, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData, "top")
end

local MakeNodeWeatherStatus = function(nodeKey)
  -- function num : 0_5
  local fWeatherCloudRate = getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_CLOUD_RATE, nodeKey)
  local fWeatherRainAmount = getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_RAIN_AMOUNT, nodeKey)
  local fWeatherCelsius = (getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_CELSIUS, nodeKey))
  local strWeatherCloudRate, strWeatherRainAmount, strWeatherCelsius = nil, nil, nil
  if fWeatherCloudRate > 0.6 then
    strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_HIGH")
  else
    if fWeatherCloudRate > 0.3 then
      strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_MID")
    else
      strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_LOW")
    end
  end
  if fWeatherRainAmount > 0.6 then
    if fWeatherCelsius < 0 then
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_SNOWAMOUNT_HIGH")
    else
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_HIGH")
    end
  else
    if fWeatherRainAmount > 0.3 then
      if fWeatherCelsius < 0 then
        strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_SNOWAMOUNT_MID")
      else
        strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_MID")
      end
    else
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_LOW")
    end
  end
  if fWeatherCelsius > 30 then
    strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_HIGH")
  else
    if fWeatherCelsius > 0 then
      strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_MID")
    else
      strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_LOW")
    end
  end
  return "[" .. strWeatherCloudRate .. "/" .. strWeatherRainAmount .. "/" .. strWeatherCelsius .. "]"
end

local FillContryInfo = function(nodeStaticStatus)
  -- function num : 0_6 , upvalues : NodeIconArray, IconType, NodeTextColor, NodeTextType
  local countryIcon = NodeIconArray[IconType.Country]
  if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_CONTRY_KALPEON") == tostring(getNodeNationalName(nodeStaticStatus)) then
    countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 418, 71, 436, 90)
    ;
    (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
  else
    do
      if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_CONTRY_BALENCIA") == tostring(getNodeNationalName(nodeStaticStatus)) then
        countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 456, 71, 474, 90)
        ;
        (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      else
        do
          if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_CONTRY_MEDIA") == tostring(getNodeNationalName(nodeStaticStatus)) then
            countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 437, 71, 455, 90)
            ;
            (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
          else
            do
              if PAGetString(Defines.StringSheet_GAME, "LUA_CONTRYNAME_6") == tostring(getNodeNationalName(nodeStaticStatus)) then
                countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 474, 71, 492, 90)
                ;
                (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
              else
                do
                  countryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
                  do
                    local x1, y1, x2, y2 = setTextureUV_Func(countryIcon, 418, 71, 436, 90)
                    ;
                    (countryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                    countryIcon:setRenderTexture(countryIcon:getBaseTexture())
                    countryIcon:SetText(getNodeNationalName(nodeStaticStatus))
                    countryIcon:SetFontColor(NodeTextColor[NodeTextType.NODE_NATIONAL_TEXT])
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

local FillTerritoryInfo = function(nodeStaticStatus)
  -- function num : 0_7 , upvalues : NodeIconArray, IconType, NodeTextColor, NodeTextType
  local territoryIcon = NodeIconArray[IconType.Territory]
  territoryIcon:SetShow(true)
  if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_BALENOS") == tostring(getNodeTerritoryName(nodeStaticStatus)) then
    territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/dialogue_etc_00.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 399, 71, 417, 90)
    ;
    (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
  else
    do
      if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_SERENDIA") == tostring(getNodeTerritoryName(nodeStaticStatus)) then
        territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/dialogue_etc_00.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 380, 71, 398, 90)
        ;
        (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
      else
        do
          if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_KALPEON") == tostring(getNodeTerritoryName(nodeStaticStatus)) then
            territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/dialogue_etc_00.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 418, 71, 436, 90)
            ;
            (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
          else
            do
              if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_MEDIA") == tostring(getNodeTerritoryName(nodeStaticStatus)) then
                territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/dialogue_etc_00.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 437, 71, 455, 90)
                ;
                (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
              else
                do
                  if PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_NODE_BALENCIA") == tostring(getNodeTerritoryName(nodeStaticStatus)) then
                    territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 456, 71, 474, 90)
                    ;
                    (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                  else
                    do
                      if PAGetString(Defines.StringSheet_GAME, "LUA_CONTRYNAME_6") == tostring(getNodeTerritoryName(nodeStaticStatus)) then
                        territoryIcon:ChangeTextureInfoName("new_ui_common_forlua/widget/dialogue/Dialogue_Etc_00.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(territoryIcon, 474, 71, 492, 90)
                        ;
                        (territoryIcon:getBaseTexture()):setUV(x1, y1, x2, y2)
                      end
                      do
                        territoryIcon:setRenderTexture(territoryIcon:getBaseTexture())
                        territoryIcon:SetText(getNodeTerritoryName(nodeStaticStatus))
                        territoryIcon:SetFontColor(NodeTextColor[NodeTextType.NODE_TERRITORY_TEXT])
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
end

local FillExploreUpgradeAble = function(nodeStaticStatus, nodeKey)
  -- function num : 0_8 , upvalues : NodeTextString, NodeTextType, SetFontColorAndText, Txt_NeedExplorePoint, NodeTextColor, Btn_NodeLink, Txt_Node_Desc, UI_TM
  local needPoint = getPlantNeedPoint()
  do
    if needPoint > 0 then
      local contributeText = NodeTextString[NodeTextType.NODE_POINT_TEXT] .. " : " .. tostring(needPoint)
      if requestCheckExplorationNodeExplorePoint(nodeKey) then
        SetFontColorAndText(Txt_NeedExplorePoint, contributeText, NodeTextColor[NodeTextType.NODE_MONEY_TEXT])
      else
        SetFontColorAndText(Txt_NeedExplorePoint, contributeText, NodeTextColor[NodeTextType.NODE_POINT_TEXT])
      end
    end
    local recipeItems = getPlantInvestItemList(nodeStaticStatus)
    local needPoint = getPlantNeedPoint()
    local supportPoint = getPlantNeedSupportPoint()
    local needMoney = getPlantNeedMoney()
    if ToClient_isAbleInvestnWithdraw(nodeKey) then
      Btn_NodeLink:SetShow(true)
      Btn_NodeLink:addInputEvent("Mouse_LUp", "OnNodeUpgradeClick(" .. tostring(nodeKey) .. ")")
    else
      Txt_Node_Desc:SetAutoResize(true)
      Txt_Node_Desc:SetTextMode(UI_TM.eTextMode_AutoWrap)
      Txt_Node_Desc:SetFontColor(NodeTextColor[NodeTextType.NODE_FINDMANGER_TEXT])
      Txt_Node_Desc:SetText(NodeTextString[NodeTextType.NODE_FINDMANGER_TEXT])
      Txt_Node_Desc:SetShow(true)
    end
  end
end

HandledMouseEvent_FillNodeInfo = function(isShow, nodeType, nodeKey)
  -- function num : 0_9 , upvalues : nodeButtonTextSwitchCaseList, MakeNodeWeatherStatus
  local name, desc, control = nil
  if nodeType ~= nil and nodeKey ~= nil then
    name = nodeButtonTextSwitchCaseList[nodeType] .. " - " .. MakeNodeWeatherStatus(nodeKey)
    control = NodeMenu.Type
  end
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end

local SetNodeType = function(nodeType)
  -- function num : 0_10 , upvalues : NodeIconArray, IconType
  local uiControl = NodeIconArray[IconType.NodeType]
  uiControl:SetShow(true)
  if tonumber(nodeType) == 0 then
    uiControl:ChangeTextureInfoName("new_ui_common_forlua/widget/worldmap/WorldMap_Etc_05.dds")
    local x1, y1, x2, y2 = setTextureUV_Func(uiControl, 1, 253, 20, 272)
    ;
    (uiControl:getBaseTexture()):setUV(x1, y1, x2, y2)
    uiControl:setRenderTexture(uiControl:getBaseTexture())
  else
    do
      if tonumber(nodeType) == 1 then
        uiControl:ChangeTextureInfoName("new_ui_common_forlua/widget/worldmap/WorldMap_Etc_05.dds")
        local x1, y1, x2, y2 = setTextureUV_Func(uiControl, 21, 253, 40, 272)
        ;
        (uiControl:getBaseTexture()):setUV(x1, y1, x2, y2)
        uiControl:setRenderTexture(uiControl:getBaseTexture())
      else
        do
          if tonumber(nodeType) == 2 then
            uiControl:ChangeTextureInfoName("new_ui_common_forlua/widget/worldmap/WorldMap_Etc_05.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(uiControl, 41, 253, 60, 272)
            ;
            (uiControl:getBaseTexture()):setUV(x1, y1, x2, y2)
            uiControl:setRenderTexture(uiControl:getBaseTexture())
          else
            do
              if tonumber(nodeType) == 3 then
                uiControl:ChangeTextureInfoName("new_ui_common_forlua/widget/worldmap/WorldMap_Etc_05.dds")
                local x1, y1, x2, y2 = setTextureUV_Func(uiControl, 61, 253, 80, 272)
                ;
                (uiControl:getBaseTexture()):setUV(x1, y1, x2, y2)
                uiControl:setRenderTexture(uiControl:getBaseTexture())
              else
                do
                  if tonumber(nodeType) == 5 then
                    uiControl:ChangeTextureInfoName("new_ui_common_forlua/widget/worldmap/WorldMap_Etc_05.dds")
                    local x1, y1, x2, y2 = setTextureUV_Func(uiControl, 81, 253, 100, 272)
                    ;
                    (uiControl:getBaseTexture()):setUV(x1, y1, x2, y2)
                    uiControl:setRenderTexture(uiControl:getBaseTexture())
                  else
                    do
                      if tonumber(nodeType) == 9 then
                        uiControl:ChangeTextureInfoName("new_ui_common_forlua/widget/worldmap/WorldMap_Etc_05.dds")
                        local x1, y1, x2, y2 = setTextureUV_Func(uiControl, 101, 253, 120, 272)
                        ;
                        (uiControl:getBaseTexture()):setUV(x1, y1, x2, y2)
                        uiControl:setRenderTexture(uiControl:getBaseTexture())
                      else
                        do
                          uiControl:SetShow(false)
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
  end
end

local SetNodeCountryAndTerritory = function(nodeStaticStatus)
  -- function num : 0_11
end

local SetWeatherAndNodeTypeIcon = function(nodeKey)
  -- function num : 0_12 , upvalues : NodeIconArray, IconType
  local fWeatherCloudRate = getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_CLOUD_RATE, nodeKey)
  local fWeatherRainAmount = getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_RAIN_AMOUNT, nodeKey)
  local fWeatherCelsius = getWeatherInfoByWaypoint((CppEnums.WEATHER_SYSTEM_FACTOR_TYPE).eWSFT_CELSIUS, nodeKey)
  local strWeatherCloudRate = ""
  local strWeatherRainAmount = ""
  local strWeatherCelsius = ""
  if fWeatherCloudRate > 0.6 then
    strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_HIGH")
  else
    if fWeatherCloudRate > 0.3 then
      strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_MID")
    else
      strWeatherCloudRate = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLOUDRATE_LOW")
    end
  end
  if fWeatherRainAmount > 0.6 then
    if fWeatherCelsius < 0 then
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_SNOWAMOUNT_HIGH")
    else
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_HIGH")
    end
  else
    if fWeatherRainAmount > 0.3 then
      if fWeatherCelsius < 0 then
        strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_SNOWAMOUNT_MID")
      else
        strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_MID")
      end
    else
      strWeatherRainAmount = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_RAINAMOUNT_LOW")
    end
  end
  if fWeatherCelsius > 30 then
    strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_HIGH")
  else
    if fWeatherCelsius > 0 then
      strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_MID")
    else
      strWeatherCelsius = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CELSIUS_LOW")
    end
  end
  local string = "[" .. strWeatherCloudRate .. "/" .. strWeatherRainAmount .. "/" .. strWeatherCelsius .. "]"
  ;
  (NodeIconArray[IconType.NodeType]):SetText(string)
end

local GenerateNodeInfo = function(nodeStaticStatus, nodeKey, isAffiliated, isMaxLevel)
  -- function num : 0_13 , upvalues : FillContryInfo, FillTerritoryInfo, SetWeatherAndNodeTypeIcon, SetNodeType, Txt_Node_Title, Txt_NodeManager, Txt_NodeManager_Name, SetFontColorAndText, NodeTextString, NodeTextType, NodeTextColor
  FillContryInfo(nodeStaticStatus)
  FillTerritoryInfo(nodeStaticStatus)
  SetWeatherAndNodeTypeIcon(nodeKey)
  SetNodeType(nodeStaticStatus._nodeType)
  Txt_Node_Title:SetText(getExploreNodeName(nodeStaticStatus))
  local nodeManagerName = requestNodeManagerName(nodeKey)
  Txt_NodeManager:SetText(PAGetString(Defines.StringSheet_GAME, "LUA_WORLD_MAP_NODE_MANAGER") .. " : ")
  if nodeManagerName ~= "" then
    Txt_NodeManager:SetShow(true)
    Txt_NodeManager_Name:SetShow(true)
    SetFontColorAndText(Txt_NodeManager, NodeTextString[NodeTextType.NODE_MANAGER_TITLE], NodeTextColor[NodeTextType.NODE_MANAGER_TITLE])
    SetFontColorAndText(Txt_NodeManager_Name, nodeManagerName, NodeTextColor[NodeTextType.NODE_MANAGER_TEXT])
  else
    Txt_NodeManager:SetShow(false)
    Txt_NodeManager_Name:SetShow(false)
  end
end

local Align_NodeControls = function()
  -- function num : 0_14 , upvalues : Txt_NodeManager, Txt_NodeManager_Name, Txt_Node_Desc, Tex_NeedExplorePoint, Txt_NeedExplorePoint, Btn_NodeLink, Btn_NodeUnlink, Btn_NearNode, NodeLevelGroup, SelfExplorePointGroup, static_NodeManagerBG
  local nextSpanY = 115
  if Txt_NodeManager:GetShow() then
    Txt_NodeManager:SetSpanSize((Txt_NodeManager:GetSpanSize()).x, nextSpanY)
    nextSpanY = (Txt_NodeManager:GetSpanSize()).y + Txt_NodeManager:GetSizeY() + 5
  end
  if Txt_NodeManager_Name:GetShow() then
    Txt_NodeManager_Name:SetSpanSize((Txt_NodeManager_Name:GetSpanSize()).x, nextSpanY)
    nextSpanY = (Txt_NodeManager_Name:GetSpanSize()).y + Txt_NodeManager_Name:GetSizeY() + 5
  end
  if Txt_Node_Desc:GetShow() then
    Txt_Node_Desc:SetSpanSize((Txt_Node_Desc:GetSpanSize()).x, nextSpanY)
    nextSpanY = (Txt_Node_Desc:GetSpanSize()).y + Txt_Node_Desc:GetSizeY() + 5
  end
  if Tex_NeedExplorePoint:GetShow() then
    Tex_NeedExplorePoint:SetSpanSize((Tex_NeedExplorePoint:GetSpanSize()).x, nextSpanY + 8)
    Txt_NeedExplorePoint:SetSpanSize((Txt_NeedExplorePoint:GetSpanSize()).x, nextSpanY + 8)
    nextSpanY = (Tex_NeedExplorePoint:GetSpanSize()).y + Tex_NeedExplorePoint:GetSizeY() + 5
  end
  if Btn_NodeLink:GetShow() then
    Btn_NodeLink:SetSpanSize((Btn_NodeLink:GetSpanSize()).x, nextSpanY)
    nextSpanY = (Btn_NodeLink:GetSpanSize()).y + Btn_NodeLink:GetSizeY() + 5
  end
  if Btn_NodeUnlink:GetShow() then
    Btn_NodeUnlink:SetSpanSize((Btn_NodeUnlink:GetSpanSize()).x, nextSpanY)
    nextSpanY = (Btn_NodeUnlink:GetSpanSize()).y + Btn_NodeUnlink:GetSizeY() + 5
  end
  if Btn_NearNode:GetShow() then
    Btn_NearNode:SetSpanSize((Btn_NearNode:GetSpanSize()).x, nextSpanY)
    nextSpanY = (Btn_NearNode:GetSpanSize()).y + Btn_NearNode:GetSizeY() + 5
  end
  if (NodeLevelGroup.Tex_NodeLevBG):GetShow() then
    (NodeLevelGroup.Tex_NodeLevBG):SetSpanSize(((NodeLevelGroup.Tex_NodeLevBG):GetSpanSize()).x, nextSpanY)
    nextSpanY = ((NodeLevelGroup.Tex_NodeLevBG):GetSpanSize()).y + 5
  end
  if (NodeLevelGroup.Txt_NodeLevel):GetShow() then
    (NodeLevelGroup.Txt_NodeLevel):SetSpanSize(((NodeLevelGroup.Txt_NodeLevel):GetSpanSize()).x, nextSpanY)
    ;
    (NodeLevelGroup.Tex_ProgressBG):SetSpanSize(((NodeLevelGroup.Tex_ProgressBG):GetSpanSize()).x, nextSpanY + 7)
    ;
    (NodeLevelGroup.Progress_NodeLevel):SetSpanSize(((NodeLevelGroup.Progress_NodeLevel):GetSpanSize()).x, nextSpanY + 7)
    ;
    (NodeLevelGroup.Btn_NodeLevHelp):SetSpanSize(((NodeLevelGroup.Btn_NodeLevHelp):GetSpanSize()).x, nextSpanY)
    nextSpanY = ((NodeLevelGroup.Txt_NodeLevel):GetSpanSize()).y + (NodeLevelGroup.Txt_NodeLevel):GetSizeY() + 5
  end
  if (NodeLevelGroup.Btn_NodeLev):GetShow() then
    (NodeLevelGroup.Btn_NodeLev):SetSpanSize(((NodeLevelGroup.Btn_NodeLev):GetSpanSize()).x, nextSpanY)
    nextSpanY = ((NodeLevelGroup.Btn_NodeLev):GetSpanSize()).y + (NodeLevelGroup.Btn_NodeLev):GetSizeY() + 15
  end
  if (SelfExplorePointGroup.Tex_Explore_Partline):GetShow() then
    (SelfExplorePointGroup.Tex_Explore_Partline):SetSpanSize(((SelfExplorePointGroup.Tex_Explore_Partline):GetSpanSize()).x, nextSpanY)
    nextSpanY = ((SelfExplorePointGroup.Tex_Explore_Partline):GetSpanSize()).y + (SelfExplorePointGroup.Tex_Explore_Partline):GetSizeY() + 5
  end
  if (SelfExplorePointGroup.Tex_ExplorePoint_BG):GetShow() then
    (SelfExplorePointGroup.Tex_ExplorePoint_BG):SetSpanSize(((SelfExplorePointGroup.Tex_ExplorePoint_BG):GetSpanSize()).x, nextSpanY)
    ;
    (SelfExplorePointGroup.Tex_ExplorePoint_Icon):SetSpanSize(((SelfExplorePointGroup.Tex_ExplorePoint_Icon):GetSpanSize()).x, nextSpanY + 8)
    ;
    (SelfExplorePointGroup.Txt_ExplorePoint_Value):SetSpanSize(((SelfExplorePointGroup.Txt_ExplorePoint_Value):GetSpanSize()).x, nextSpanY + 8)
    ;
    (SelfExplorePointGroup.Tex_ExplorePoint_PrgressBG):SetSpanSize(((SelfExplorePointGroup.Tex_ExplorePoint_PrgressBG):GetSpanSize()).x, nextSpanY + 15)
    ;
    (SelfExplorePointGroup.Progress_ExplorePoint):SetSpanSize(((SelfExplorePointGroup.Progress_ExplorePoint):GetSpanSize()).x, nextSpanY + 15)
    ;
    (SelfExplorePointGroup.Btn_ExplorePoint_Help):SetSpanSize(((SelfExplorePointGroup.Btn_ExplorePoint_Help):GetSpanSize()).x, nextSpanY + 8)
    nextSpanY = ((SelfExplorePointGroup.Tex_ExplorePoint_BG):GetSpanSize()).y + (SelfExplorePointGroup.Tex_ExplorePoint_BG):GetSizeY() + 5
  end
  static_NodeManagerBG:SetSize(static_NodeManagerBG:GetSizeX(), nextSpanY)
end

local update_ExplorePoint = function()
  -- function num : 0_15 , upvalues : SelfExplorePointGroup
  local territoryKeyRaw = getDefaultTerritoryKey()
  local explorePoint = getExplorePointByTerritoryRaw(territoryKeyRaw)
  local cont_expRate = Int64toInt32(explorePoint:getExperience_s64()) / Int64toInt32(getRequireExplorationExperience_s64())
  ;
  (SelfExplorePointGroup.Txt_ExplorePoint_Value):SetText(tostring(explorePoint:getRemainedPoint()) .. " / " .. tostring(explorePoint:getAquiredPoint()))
  ;
  (SelfExplorePointGroup.Progress_ExplorePoint):SetProgressRate(cont_expRate * 100)
end

local FillNodeInfo = function(nodeStaticStatus, nodeKey, isAffiliated, isMaxLevel)
  -- function num : 0_16 , upvalues : GenerateNodeInfo, NodeLevelGroup, savedisMaxLevel, Txt_Node_Desc, UI_TM, FillExploreUpgradeAble, Tex_NeedExplorePoint, Txt_NeedExplorePoint, Btn_NodeUnlink, SetFontColorAndText, NodeTextColor, NodeTextType, Btn_NearNode, update_ExplorePoint, Align_NodeControls
  GenerateNodeInfo(nodeStaticStatus, nodeKey, isAffiliated, isMaxLevel)
  NodeLevelGroup:SetShow(false)
  savedisMaxLevel = isMaxLevel
  Txt_Node_Desc:SetAutoResize(true)
  Txt_Node_Desc:SetTextMode(UI_TM.eTextMode_AutoWrap)
  Txt_Node_Desc:SetShow(false)
  local recipeItems = getPlantInvestItemList(nodeStaticStatus)
  local needPoint = getPlantNeedPoint()
  local supportPoint = getPlantNeedSupportPoint()
  local needMoney = getPlantNeedMoney()
  if isExploreUpgradable(nodeKey) then
    NodeLevelGroup:SetNodeLevel(nodeKey)
    if isMaxLevel == false then
      FillExploreUpgradeAble(nodeStaticStatus, nodeKey)
      Tex_NeedExplorePoint:SetShow(true)
      Txt_NeedExplorePoint:SetShow(true)
    else
      NodeLevelGroup:SetShow(true)
      Tex_NeedExplorePoint:SetShow(false)
      Txt_NeedExplorePoint:SetShow(false)
      if isWithdrawablePlant(nodeKey) then
        Txt_Node_Desc:SetShow(false)
        Btn_NodeUnlink:SetShow(true)
        Btn_NodeUnlink:SetText(PAGetString(Defines.StringSheet_RESOURCE, "WORLDMAP_NODE_BTN_WITHDRAW") .. "( " .. needPoint .. " )")
        Btn_NodeUnlink:addInputEvent("Mouse_LUp", "OnNodeWithdrawClick( " .. tostring(nodeKey) .. ")")
      else
        if needPoint > 0 or supportPoint > 0 or needMoney > 0 or recipeItems > 0 then
          if workerManager_CheckWorkingOtherChannel() then
            SetFontColorAndText(Txt_Node_Desc, workerManager_getWorkingOtherChannelMsg(), NodeTextColor[NodeTextType.NODE_UNWITHDRAW_TEXT])
          else
            SetFontColorAndText(Txt_Node_Desc, PAGetString(Defines.StringSheet_GAME, "PANEL_WORLDMAP_NODENOTWITHDRAW"), NodeTextColor[NodeTextType.NODE_UNWITHDRAW_TEXT])
          end
          Txt_Node_Desc:SetShow(true)
        end
      end
    end
  else
    if nodeStaticStatus._isMainNode == true then
      SetFontColorAndText(Txt_Node_Desc, PAGetString(Defines.StringSheet_GAME, "PANEL_WORLDMAP_NODENOTUPGRADE"), NodeTextColor[NodeTextType.NODE_UNUPGRADE_TEXT])
      Btn_NearNode:SetShow(true)
      Btn_NearNode:addInputEvent("Mouse_LUp", "OnNearNodeClick(" .. tostring(nodeKey) .. ")")
      Tex_NeedExplorePoint:SetShow(false)
      Txt_NeedExplorePoint:SetShow(false)
    else
      if nodeStaticStatus._isMainNode == false then
        SetFontColorAndText(Txt_Node_Desc, PAGetString(Defines.StringSheet_GAME, "PANEL_WORLDMAP_NODENOTUPGRADE_SUB"), NodeTextColor[NodeTextType.NODE_UNUPGRADE_TEXT])
      end
    end
    Txt_Node_Desc:SetShow(true)
  end
  update_ExplorePoint()
  Align_NodeControls()
end

WorldMap_ItemMarket_Open = function(territoryKeyRaw)
  -- function num : 0_17
  FGlobal_ItemMarket_Open_ForWorldMap(territoryKeyRaw)
end

local ClearNodeInfo = function()
  -- function num : 0_18 , upvalues : Btn_NodeLink, Btn_NodeUnlink, Btn_NearNode, NodeLevelGroup
  Btn_NodeLink:SetShow(false)
  Btn_NodeUnlink:SetShow(false)
  Btn_NearNode:SetShow(false)
  ;
  (NodeLevelGroup.Btn_NodeLev):SetShow(false)
end

FGlobal_NodeMenu_SetEnableNodeLinkButton = function(bEnable)
  -- function num : 0_19 , upvalues : Btn_NodeLink
  Btn_NodeLink:SetEnable(bEnable)
  Btn_NodeLink:SetDisableColor(not bEnable)
end

FGlobal_NodeMenu_SetEnableNodeUnlinkButton = function(bEnable)
  -- function num : 0_20 , upvalues : Btn_NodeUnlink
  Btn_NodeUnlink:SetEnable(bEnable)
  Btn_NodeUnlink:SetDisableColor(not bEnable)
end

NodeLevelGroup.SetNodeLevel = function(self, nodeKey)
  -- function num : 0_21 , upvalues : isProgressReset
  local nodeLv = ToClient_GetNodeLevel(nodeKey)
  local nodeExp = Int64toInt32(ToClient_GetNodeExperience_s64(nodeKey))
  local nodeExpMax = Int64toInt32(ToClient_GetNeedExperienceToNextNodeLevel_s64(nodeKey))
  local nodeExpPercent = nodeExp / nodeExpMax * 100
  ;
  (self.Txt_NodeLevel):SetText(PAGetString(Defines.StringSheet_GAME, "LUA_COMMON_LV") .. ". " .. tostring(nodeLv))
  if isProgressReset then
    (self.Progress_NodeLevel):SetProgressRate(0)
    isProgressReset = false
  else
    ;
    (self.Progress_NodeLevel):SetProgressRate(nodeExpPercent)
  end
end

NodeLevelGroup.SetShow = function(self, isShow)
  -- function num : 0_22
  (self.Tex_NodeLevBG):SetShow(isShow)
  ;
  (self.Btn_NodeLev):SetShow(isShow)
  ;
  (self.Txt_NodeLevel):SetShow(isShow)
  ;
  (self.Tex_ProgressBG):SetShow(isShow)
  ;
  (self.Progress_NodeLevel):SetShow(isShow)
  ;
  (self.Btn_NodeLevHelp):SetShow(isShow)
end

FGlobal_ShowInfoNodeMenuPanel = function(node)
  -- function num : 0_23 , upvalues : _wayPointKey, nodeStaticStatus, ClearNodeInfo, FillNodeInfo, NodeLevelGroup
  if ToClient_WorldMapIsShow() == false then
    return 
  end
  local plantKey = node:getPlantKey()
  _wayPointKey = plantKey:getWaypointKey()
  local wayPlant = ToClient_getPlant(plantKey)
  local affiliatedTownKey = 0
  if (plantKey:get() == (CppEnums.MiniGameParam).eMiniGameParamLoggiaCorn or plantKey:get() == (CppEnums.MiniGameParam).eMiniGameParamLoggiaFarm or plantKey:get() == (CppEnums.MiniGameParam).eMiniGameParamAlehandroHoney or plantKey:get() == (CppEnums.MiniGameParam).eMiniGameParamImpCave) and node:isMaxLevel() == true then
    FGlobal_MiniGame_RequestPlantInvest(plantKey:get())
  end
  nodeStaticStatus = node:getStaticStatus()
  if wayPlant ~= nil then
    affiliatedTownKey = ToClinet_getPlantAffiliatedWaypointKey(wayPlant)
  end
  Panel_NodeMenu:SetPosX(5)
  Panel_NodeMenu:SetPosY(5)
  ClearNodeInfo()
  FillNodeInfo(node:getStaticStatus(), _wayPointKey, _wayPointKey == affiliatedTownKey, node:isMaxLevel())
  FGlobal_nodeOwnerInfo_SetInfo(node:getStaticStatus())
  ;
  (NodeLevelGroup.Btn_NodeLev):SetText(PAGetString(Defines.StringSheet_RESOURCE, "WORLDMAP_NODE_LV_INVEST"))
  ;
  (NodeLevelGroup.Btn_NodeLev):addInputEvent("Mouse_LUp", "InvestNodeLevelNumpad( " .. _wayPointKey .. " )")
  local btnNodeLevSizeX = (NodeLevelGroup.Btn_NodeLev):GetSizeX() + 23
  do
    local btnNodeLevTextPosX = btnNodeLevSizeX - btnNodeLevSizeX / 2 - (NodeLevelGroup.Btn_NodeLev):GetTextSizeX() / 2
    ;
    (NodeLevelGroup.Btn_NodeLev):SetTextSpan(btnNodeLevTextPosX, 5)
    FromClient_WorldMap_HouseNaviShow()
    FGlobal_SetNodeName(getExploreNodeName(nodeStaticStatus))
    if isWorldMapGrandOpen() then
      FGlobal_WorldMapGrand_NodeExplorePoint_Update()
      FGlobal_WorldmapGrand_Main_UpdateExplorePoint()
    end
    -- DECOMPILER ERROR: 2 unprocessed JMP targets
  end
end

InvestNodeLevelNumpad = function(wayPointKey)
  -- function num : 0_24
  if ToClient_WorldMapIsShow() == false then
    return 
  end
  local player = getSelfPlayer()
  if player == nil then
    return 
  end
  local wp = player:getWp()
  local maxWp = player:getMaxWp()
  local s64_maxNumber = toInt64(0, 0)
  local wpCalc = (math.floor)(wp / 10)
  if wpCalc < maxWp then
    s64_maxNumber = tonumber64(wpCalc)
  end
  Panel_NumberPad_Show(true, s64_maxNumber, wayPointKey, InvestNodeLevelExecute)
end

InvestNodeLevelExecute = function(inputNumber, param)
  -- function num : 0_25
  local wpCount = Int64toInt32(inputNumber) * 10
  ToClient_RequestIncreaseExperienceNode(param, wpCount)
end

FGlobal_CloseNodeMenu = function()
  -- function num : 0_26 , upvalues : ClearNodeInfo
  ClearNodeInfo()
  Panel_NodeMenu:SetShow(false)
end

FromClient_RClickedWorldMapNode = function(nodeBtn)
  -- function num : 0_27
  local node = nodeBtn:FromClient_getExplorationNodeInClient()
  if node == nil then
    return 
  end
  local nodeStaticStatus = node:getStaticStatus()
  local position = ToClient_getNodeManagerPosition(nodeStaticStatus)
  if position.x == 0 and position.y == 0 and position.z == 0 then
    position = nodeStaticStatus:getPosition()
  end
  FromClient_RClickWorldmapPanel(position, true, false)
end

local buildingActorKey = nil
FGlobal_ShowBuildingInfo = function(nodeBtn)
  -- function num : 0_28 , upvalues : buildingActorKey
  buildingActorKey = nodeBtn:ToClient_getActorKey()
  local buildingSS = ToClient_getBuildingInfo(buildingActorKey)
  if buildingSS == nil then
    return 
  end
  local workableCount = ToClient_getBuildingWorkableListCount(buildingSS)
  if workableCount > 0 then
    FGlobal_OnClickBuildingManage()
  end
end

FGlobal_OnClickBuildingManage = function()
  -- function num : 0_29 , upvalues : buildingActorKey
  local buildingSS = ToClient_getBuildingInfo(buildingActorKey)
  if buildingSS == nil then
    return 
  end
  if ToClient_isMyBuilding(buildingSS) == false then
    return 
  end
  if buildingSS:getBuildingProgress() >= 1 then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAP_CLICK_COMPLETED_BUILDING"))
  else
    FGlobal_Building_WorkManager_Reset_Pos()
    FGlobal_Building_WorkManager_Open(buildingActorKey)
    WorldMapPopupManager:increaseLayer()
    WorldMapPopupManager:push(Panel_Building_WorkManager, true)
  end
end

FromClient_BuildingNodeRClick = function(nodeBtn)
  -- function num : 0_30
  local buildInfoSS = nodeBtn:ToClient_getBuildingStaticStatus()
  if buildInfoSS ~= nil then
    FromClient_RClickWorldmapPanel(ToClient_getBuildingPosition(buildInfoSS), true, false)
  end
end

FGlobal_OnClickTradeIcon = function(territoryKeyRaw)
  -- function num : 0_31
  WorldMap_ItemMarket_Open(territoryKeyRaw)
end

local nodeBtnArray = {}
CreateNodeIconForTradeIcon_ShowTooltip = function(wayPointKey, isShow)
  -- function num : 0_32 , upvalues : nodeBtnArray
  if isLuaLoadingComplete then
    if isShow == true then
      local name = PAGetString(Defines.StringSheet_GAME, "GAME_ITEM_MARKET_NAME")
      if nodeBtnArray[wayPointKey] ~= nil then
        local tradeIcon = (nodeBtnArray[wayPointKey]):FromClient_getTradeIcon()
        TooltipSimple_Show(tradeIcon, name)
      end
    else
      do
        TooltipSimple_Hide()
      end
    end
  end
end

FGlobal_ExplorationNode = function(WaypointKey, ExplorationLevel, TExperience)
  -- function num : 0_33 , upvalues : NodeLevelGroup
  NodeLevelGroup:SetNodeLevel(WaypointKey)
end

worldmapNodeIcon_GuildWarSet = function(nodeBtn)
  -- function num : 0_34
  local explorationInfo = nodeBtn:FromClient_getExplorationNodeInClient()
  local nodeStaticStatus = explorationInfo:getStaticStatus()
  local regionInfo = nodeStaticStatus:getMinorSiegeRegion()
  local warStateIcon = nodeBtn:FromClient_getWarStateIcon()
  local guildModeGuildMark = nodeBtn:FromClient_getNodeGuildIcon()
  if regionInfo ~= nil then
    local regionKey = regionInfo._regionKey
    local regionWrapper = getRegionInfoWrapper(regionKey:get())
    local minorSiegeWrapper = regionWrapper:getMinorSiegeWrapper()
    local siegeWrapper = ToClient_GetSiegeWrapperByRegionKey(regionKey:get())
    local guildMark = nodeBtn:FromClient_getGuildMark()
    local guildMarkBG = nodeBtn:FromClient_getGuildMarkBG()
    if minorSiegeWrapper ~= nil then
      if minorSiegeWrapper:isSiegeBeing() then
        warStateIcon:setUpdateTextureAni(true)
        warStateIcon:SetShow(true)
        guildMark:SetShow(false)
        guildMarkBG:SetShow(false)
      else
        warStateIcon:setUpdateTextureAni(false)
        if siegeWrapper:doOccupantExist() == true then
          local isSet = setGuildTextureByGuildNo(siegeWrapper:getGuildNo(), guildMark)
          if isSet == false then
            guildMark:ChangeTextureInfoName("New_UI_Common_forLua/Default/Default_Buttons.dds")
            local x1, y1, x2, y2 = setTextureUV_Func(guildMark, 183, 1, 188, 6)
            ;
            (guildMark:getBaseTexture()):setUV(x1, y1, x2, y2)
          else
            do
              do
                ;
                (guildMark:getBaseTexture()):setUV(0, 0, 1, 1)
                guildMark:setRenderTexture(guildMark:getBaseTexture())
                warStateIcon:SetShow(false)
                guildMark:SetShow(true)
                guildMarkBG:SetShow(true)
                warStateIcon:SetShow(true)
                guildMark:SetShow(false)
                guildMarkBG:SetShow(false)
                warStateIcon:SetShow(false)
                guildMark:SetShow(false)
                guildMarkBG:SetShow(false)
                guildModeGuildMark:SetShow(false)
              end
            end
          end
        end
      end
    end
  end
end

FromClient_CreateNodeIcon = function(nodeBtn)
  -- function num : 0_35 , upvalues : nodeBtnArray
  worldmapNodeIcon_GuildWarSet(nodeBtn)
  local tradeIcon = nodeBtn:FromClient_getTradeIcon()
  local explorationInfo = nodeBtn:FromClient_getExplorationNodeInClient()
  local plantKey = explorationInfo:getPlantKey()
  local wayPointKey = plantKey:getWaypointKey()
  if explorationInfo ~= nil then
    local explorationInfoSSW = explorationInfo:getStaticStatus()
    local minorSiegeRegion = explorationInfoSSW:getMinorSiegeRegion()
    if minorSiegeRegion ~= nil then
      local regionKey = (minorSiegeRegion._regionKey):get()
      local isWeekNode = ToClient_IsVillageSiegeInThisWeek(regionKey)
      local guildIcon = nodeBtn:FromClient_getNodeGuildIcon()
      local guildIconBG = nodeBtn:FromClient_getGuildMarkBG()
      local guildMark = nodeBtn:FromClient_getGuildMark()
      if isWeekNode then
        guildIcon:SetMonoTone(false)
        guildIconBG:SetMonoTone(false)
        guildMark:SetMonoTone(false)
      else
        guildIcon:SetMonoTone(true)
        guildIconBG:SetMonoTone(true)
        guildMark:SetMonoTone(true)
      end
    end
  end
  do
    local territoryKeyRaw = nodeBtn:FromClient_getTerritoryKey()
    if wayPointKey == 301 or wayPointKey == 1 or wayPointKey == 601 or wayPointKey == 1101 or wayPointKey == 1301 then
      tradeIcon:SetSpanSize(-10, 20)
      tradeIcon:SetShow(false)
      -- DECOMPILER ERROR at PC72: Confused about usage of register: R6 in 'UnsetPending'

      nodeBtnArray[wayPointKey] = nodeBtn
      tradeIcon:addInputEvent("Mouse_LUp", "FGlobal_handleOpenItemMarket(" .. territoryKeyRaw .. ")")
      tradeIcon:addInputEvent("Mouse_On", "CreateNodeIconForTradeIcon_ShowTooltip(" .. wayPointKey .. ", true )")
      tradeIcon:addInputEvent("Mouse_Out", "CreateNodeIconForTradeIcon_ShowTooltip(" .. wayPointKey .. ", false )")
    end
  end
end

FGlobal_handleOpenItemMarket = function(territoryKey)
  -- function num : 0_36
  FGlobal_ItemMarket_Open_ForWorldMap(1)
end

FromClient_StartMinorSiege = function(nodeBtn)
  -- function num : 0_37
  local warStateIcon = nodeBtn:FromClient_getWarStateIcon()
  warStateIcon:setUpdateTextureAni(true)
  warStateIcon:SetShow(true)
  local guildMark = nodeBtn:FromClient_getGuildMark()
  local guildMarkBG = nodeBtn:FromClient_getGuildMarkBG()
  guildMark:SetShow(false)
  guildMarkBG:SetShow(false)
end

FromClient_EndMinorSiege = function(nodeBtn)
  -- function num : 0_38
  worldmapNodeIcon_GuildWarSet(nodeBtn)
end

FromClient_OnVillageSiegeBuildingNodeGroup = function(nodeBtn)
  -- function num : 0_39
  nodeBtn:EraseAllEffect()
  nodeBtn:AddEffect("UI_WorldMap_Ping01", true, 0, 0)
end

FromClient_OutVillageSiegeBuildingNodeGroup = function(nodeBtn)
  -- function num : 0_40
  nodeBtn:EraseAllEffect()
end

local dayType = {"1Monday", "2Tuesday", "3wednesday", "4Thursday", "5Friday", "6Saturday"; [0] = "0Sunday"}
FromClient_SetGuildModeeWorldMapNodeIcon = function(nodeBtn)
  -- function num : 0_41 , upvalues : dayType
  if FGlobal_isGuildWarMode() then
    local warStateIcon = nodeBtn:FromClient_getWarStateIcon()
    local guildMark = nodeBtn:FromClient_getGuildMark()
    local guildMarkBG = nodeBtn:FromClient_getGuildMarkBG()
    local guildIcon = nodeBtn:FromClient_getNodeGuildIcon()
    local explorationInfo = nodeBtn:FromClient_getExplorationNodeInClient()
    local villageSiegeType = nodeBtn:getVillageSiegeType()
    local siegeNode = ((nodeBtn:FromClient_getExplorationNodeInClient()):getStaticStatus()):getMinorSiegeRegion()
    if siegeNode ~= nil and villageSiegeType < 7 then
      local taxGrade = siegeNode:getVillageTaxLevel()
      warStateIcon:SetShow(false)
      guildMark:SetShow(false)
      guildMarkBG:SetShow(false)
      nodeBtn:SetMonoTone(false)
      local normalUrl = "New_UI_Common_forLua/Widget/WorldMap/WorldMap_NodeWarGuildIcon/" .. dayType[villageSiegeType] .. "/" .. tostring(taxGrade) .. "_Nomal.dds"
      local overUrl = "New_UI_Common_forLua/Widget/WorldMap/WorldMap_NodeWarGuildIcon/" .. dayType[villageSiegeType] .. "/" .. tostring(taxGrade) .. "_Over.dds"
      local clickUrl = "New_UI_Common_forLua/Widget/WorldMap/WorldMap_NodeWarGuildIcon/" .. dayType[villageSiegeType] .. "/" .. tostring(taxGrade) .. "_Click.dds"
      nodeBtn:ChangeTextureInfoName(normalUrl)
      ;
      (nodeBtn:getBaseTexture()):setUV(0, 0, 1, 1)
      nodeBtn:setRenderTexture(nodeBtn:getBaseTexture())
      nodeBtn:ChangeOnTextureInfoName(overUrl)
      nodeBtn:ChangeClickTextureInfoName(clickUrl)
    end
    do
      if explorationInfo ~= nil then
        local explorationInfoSSW = explorationInfo:getStaticStatus()
        local minorSiegeRegion = explorationInfoSSW:getMinorSiegeRegion()
        if minorSiegeRegion ~= nil then
          local regionKey = (minorSiegeRegion._regionKey):get()
          local isWeekNode = ToClient_IsVillageSiegeInThisWeek(regionKey)
          if isWeekNode then
            guildMark:SetMonoTone(false)
            guildMarkBG:SetMonoTone(false)
            guildIcon:SetMonoTone(false)
          else
            guildMark:SetMonoTone(true)
            guildMarkBG:SetMonoTone(true)
            guildIcon:SetMonoTone(true)
          end
        end
      end
      do
        worldmapNodeIcon_GuildWarSet(nodeBtn)
      end
    end
  end
end

FGlobal_WayPointKey_Return = function()
  -- function num : 0_42 , upvalues : _wayPointKey
  return _wayPointKey
end

FGlobal_LoadWorldMap_WarehouseOpen = function()
  -- function num : 0_43 , upvalues : _wayPointKey
  if _wayPointKey ~= nil then
    local regionInfoWrapper = ToClient_getRegionInfoWrapperByWaypoint(_wayPointKey)
    if regionInfoWrapper ~= nil and (regionInfoWrapper:get()):isMainOrMinorTown() and (regionInfoWrapper:get()):hasWareHouseNpc() then
      Warehouse_OpenPanelFromWorldmap(_wayPointKey, (CppEnums.WarehoouseFromType).eWarehoouseFromType_Worldmap)
    end
  end
end

FGlobal_WorldMapGrand_NodeExplorePoint_Update = function()
  -- function num : 0_44 , upvalues : update_ExplorePoint
  update_ExplorePoint()
end

HandleOnout_GrandWorldMap_NodeMenu_explorePointHelp = function(isShow, buttonType)
  -- function num : 0_45 , upvalues : NodeLevelGroup, SelfExplorePointGroup
  if isShow then
    local control = nil
    local name = ""
    local desc = nil
    if buttonType == 0 then
      control = NodeLevelGroup.Btn_NodeLevHelp
      name = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_HELPICON_NODELEVEL")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_HELPICON_NODELEVEL_DESC")
    else
      control = SelfExplorePointGroup.Btn_ExplorePoint_Help
      name = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_HELPICON_EXPLORERPOINT")
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_HELPICON_EXPLORERPOINT_DESC")
    end
    registTooltipControl(control, Panel_Tooltip_SimpleText)
    TooltipSimple_Show(control, name, desc)
  else
    do
      TooltipSimple_Hide()
    end
  end
end

nodeMenu_OnScreenResize = function()
  -- function num : 0_46
  Panel_NodeMenu:SetSize(getScreenSizeX(), getScreenSizeY())
end

local guildVehicleActorKeyRawForDestroy = nil
FomClient_Worldmap_GuildVehicleIcon_Clicked = function(actorKeyRaw)
  -- function num : 0_47 , upvalues : guildVehicleActorKeyRawForDestroy
  guildVehicleActorKeyRawForDestroy = actorKeyRaw
  local ApplyDistroy = function()
    -- function num : 0_47_0 , upvalues : guildVehicleActorKeyRawForDestroy
    ToClient_Worldmap_GuildVehicleDestroy(guildVehicleActorKeyRawForDestroy)
  end

  local desc = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_VEHICLEDISTROY_CONTENT")
  messageBoxData = {title = PAGetString(Defines.StringSheet_GAME, "LUA_WORLDMAPGRAND_VEHICLEDISTROY_TITLE"), content = desc, functionYes = ApplyDistroy, functionNo = MessageBox_Empty_function, priority = (CppEnums.PAUIMB_PRIORITY).PAUIMB_PRIORITY_LOW}
  ;
  (MessageBox.showMessageBox)(messageBoxData)
end

registerEvent("FromClient_CreateWorldMapNodeIcon", "FromClient_CreateNodeIcon")
registerEvent("FromClient_FillNodeInfo", "FGlobal_ShowInfoNodeMenuPanel")
registerEvent("FromClient_RClickedWorldMapNode", "FromClient_RClickedWorldMapNode")
registerEvent("FromClient_ShowBuildingInfo", "FGlobal_ShowBuildingInfo")
registerEvent("FromClient_BuildingNodeRClick", "FromClient_BuildingNodeRClick")
registerEvent("WorldMap_NodeWithdraw", "FGlobal_ShowInfoNodeMenuPanel")
registerEvent("FromClint_EventIncreaseExperienceExplorationNode", "FGlobal_ExplorationNode")
registerEvent("FromClient_StartMinorSiege", "FromClient_StartMinorSiege")
registerEvent("FromClient_EndMinorSiege", "FromClient_EndMinorSiege")
registerEvent("FromClient_SetGuildModeeWorldMapNodeIcon", "FromClient_SetGuildModeeWorldMapNodeIcon")
registerEvent("FromClient_OnVillageSiegeBuildingNodeGroup", "FromClient_OnVillageSiegeBuildingNodeGroup")
registerEvent("FromClient_OutVillageSiegeBuildingNodeGroup", "FromClient_OutVillageSiegeBuildingNodeGroup")
registerEvent("onScreenResize", "nodeMenu_OnScreenResize")
nodeMenu_init()


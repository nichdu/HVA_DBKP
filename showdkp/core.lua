local addonName, addonData = ...;
HVA_ListDKP = LibStub("AceAddon-3.0"):NewAddon("HVA_ListDKP", "AceConsole-3.0", "AceTimer-3.0", "AceEvent-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HVA_ListDKP", true);

local function CreateGUI()
	-- u o3 plz
	local f = CreateFrame("Frame", "listDKPFrame", UIParent);
	UIPanelWindows["listDKPFrame"] = { area = "left", pushable = 3, whileDead = 1, yoffset = 12, xoffset = -16 }
	HideUIPanel(listDKPFrame);
	
	f:SetWidth(384);
	f:SetHeight(512);
	
	f:SetHitRectInsets(0,30,0,45);
	f:SetToplevel(true);
	f:EnableMouse(true);
	
	local topleft = f:CreateTexture(nil, "ARTWORK");
	topleft:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopLeft");
	topleft:SetWidth(256);
	topleft:SetHeight(256);
	topleft:SetPoint("TOPLEFT");
	
	local toplefticon = f:CreateTexture(nil, "BACKGROUND");
	toplefticon:SetWidth(60);
	toplefticon:SetHeight(60);
	toplefticon:SetPoint("TOPLEFT", 7, -6);
	SetPortraitToTexture(toplefticon, "Interface\\WorldMap\\Gear_64Grey");
	
	local topright = f:CreateTexture(nil, "ARTWORK");
	topright:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopRight");
	topright:SetWidth(128);
	topright:SetHeight(256);
	topright:SetPoint("TOPRIGHT");
	
	local topright = f:CreateTexture(nil, "ARTWORK")
	topright:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopRight")
	topright:SetWidth(128)
	topright:SetHeight(256)
	topright:SetPoint("TOPRIGHT")

	local botleft = f:CreateTexture(nil, "ARTWORK")
	botleft:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-BottomLeft")
	botleft:SetWidth(256)
	botleft:SetHeight(256)
	botleft:SetPoint("BOTTOMLEFT")

	local botright = f:CreateTexture(nil, "ARTWORK")
	botright:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-BottomRight")
	botright:SetWidth(128)
	botright:SetHeight(256)
	botright:SetPoint("BOTTOMRIGHT")

	local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", -30, -8)

	local title = f:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	title:SetWidth(250)
	title:SetHeight(16)
	title:SetPoint("TOP", 3, -16)
	f.title = title

end;
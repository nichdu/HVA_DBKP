local addonName, addonData = ...;
local addon = LibStub("AceAddon-3.0"):NewAddon("HVA_ListDKP", "AceConsole-3.0", "AceTimer-3.0", "AceEvent-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HVA_ListDKP", true);
_G["HVA_listDKP"] = addon;

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

	local cl= CreateFrame("Button", nil, f, "UIPanelCloseButton")
	cl:SetPoint("TOPRIGHT", -30, -8)

	local ti = f:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ti:SetWidth(250)
	ti:SetHeight(16)
	ti:SetPoint("TOP", 3, -16)
	f.title = ti
	
	local r = CreateFrame("Button", "listDKPrefresh", f, "UIPanelButtonTemplate2");
	r:SetWidth(115);
	r:SetHeight(22);
	r:SetNormalFontObject(GameFontNormalSmall);
	r:SetHighlightFontObject(GameFontHighlightSmall);
	r:SetDisabledFontObject(GameFontDisableSmall);
	r:SetText(L["Refresh"]);
	r:SetPoint("TOPLEFT", 72, -37);
	r:SetScript("OnClick", function()
		addon:ListRaidDKP();
	end;);
	r.tooltipText = L["Refreshes window"];
	r.newbieText = L["Refreshes the list of raid members and their DKP to show up to date values."];
	
	local options = CreateFrame("Button", "listDKPOptions", f, "UIPanelButtonTemplate2");
	options:SetWidth(115);
	options:SetHeight(22);
	options:SetNormalFontObject(GameFontNormalSmall);
	options:SetHighlightFontObject(GameFontHighlightSmall);
	options:SetDisabledFontObject(GameFontDisableSmall);
	options:SetText(L["Options"]);
	options:SetPoint("TOPRIGHT", -40, -37);
	options:SetScript("OnClick", function();
		InterfaceOptionsFrame_OpenToCategory("HVA_ListDKP");
	end;);
	options:Disable();
	
	local sub = CreateFrame("Frame",nil,f);
	sub:SetPoint("TOPLEFT", 18, -70);
	sub:SetPoint("BOTTOMRIGHT", -40, 78);
	contentF = sub;
	
	local list = CreateFrame("Frame", "listDKPListFrame", sub);
	list:SetAllPoints(sub);
	
	local scrollframe = CreateFrame("ScrollFrame", liseDKPScrollFrame, list, "FauxScrollFrameTemplate");
	scrollframe:SetPoint("BOTTOMLEFT", list, 0, 33);
	local function scrollUpdate() addon:scrollUpdate(); end;
	scrollframe:SetScript("OnVerticalScroll", function(self, offset)
		FauxScrollFrame_OnVerticalScroll(self, offset, 16, ScrollUpdate);
	end;)
	
	sub.scrollFrame = scrollframe;
	sub.listFrame = list;
	
	local scrolframebottom = CreateFrame("Frame", "listDKPScrollFrameBottom", list);
	scrollframebottom:SetPoint("TOPLEFT", scrollframe, "BOTTOMLEFT", 0, -1);
	scrollframebottom:SetPoint("BOTTOMRIGHT", sub, "BOTTOMRIGHT");
	scrollframebottom:SetFrameLevel(sub:GetFrameLevel());
	
	local scrollbar = CreateFrame("Button", nil, scrollframebottom, 3, 3);
	scrollbar:SetPoint("TOPLEFT", scrollframebottom, 3, 3);
	scrollbar:SetPoint("TOPRIGHT", scrollframebottom, -4, 3);
	scrollbar:SetHeight(8);
	
	local scrollbarmiddle = bar:CreateTexture(nil, "BORDER");
	scrollbarmiddle:SetTexture("Interface\\ClassTrainerFrame\\UI-ClassTrainer-HorizontalBar");
	scrollbarmiddle:SetAllPoints(scrollbar);
	scrollbarmiddle:SetTexCoord(0.29296874, 1, 0, 0.25);
	
	local scrollframetop = CreateFrame("Frame", "listDKPScrollFrameTop", list);
	scrollframetop:SetPoint("TOPLEFT", sub);
	scrollframetop:SetPoint("TOPRIGHT" sub);
	scrollframetop:SetHeight(27);
	
	scrollbar = CreateFrame("Button", nil, scrollframetop);
	scrollbar:SetPoint("BOTTOMLEFT", scrollframetop, 3, -2);
	scrollbar:SetPoint("BOTTOMRIGHT", scrollframetop, -4, -2);
	scrollbar:SetHeight(5);
	
	
	
	-- line 580
end;
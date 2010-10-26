local addonName, addonData = ...;
HVA_GetDKP = LibStub("AceAddon-3.0"):NewAddon("HVA_GetDKP", "AceConsole-3.0", "AceTimer-3.0", "AceEvent-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HVA_GetDKP", true);

do 
	defaults = {
		realm = {
			prefix = "HvA",
		},
	}
end;

-- OnInitialize
function HVA_GetDKP:OnInitialize()
--@debug@
	self:Print('OnInitialize');
--@end-debug@
	self.db = LibStub("AceDB-3.0"):New("HVA_GetDKP_DB", defaults, "realm");
end;

-- OnEnable
function HVA_GetDKP:OnEnable()
--@debug@
    self:Print('OnEnable');
--@end-debug@
	self:RegisterEvent("CHAT_MSG_WHISPER", "IncWhisper");
	self:RegisterEvent("CHAT_MSG_RAID", "IncRaid");
end;

function HVA_GetDKP:IncWhisper(event, message, sender,...)
	if (string.lower(message) == "dkp") then
		local dkp = HVA_DKPDB:GetDKP(sender) or "NOENTRY";
		local msg = prefix .. L["You have %s DKP"];
		msg = string.gsub(msg, "%s", dkp);
		SendChatMessage(msg, "WHISPER", nil, sender);
	end;
end;

function HVA_GetDKP:IncRaid(event, message, sender,...)
	if (string.lower(message) == "listdkp") then -- and (UnitIsRaidOfficer(sender) or UnitIsPartyLeader(sender))) then
		local dkplist = self:GetTopDKP();
		local msg = prefix .. L["List of DKP leaders"];
		SendChatMessage(msg, "RAID");
		for i=1,#dkplist do
			SendChatMessage(prefix .. i.. ". " .. dkplist[i]["Name"] .. ": " .. dkplist[i]["dkp"]);
		end;
	end;
end;

function HVA_GetDKP:GetTopDKP()
	local names = {};
	for i=1, GetNumRaidMembers() do
		names[i] = select(1,UnitName("raid"..i));
	end;
	local dkp = {};
	for name in pairs(names) do 
		dkp[name] = HVA_DBKP:GetDKP(name);
	end;
	table.sort(dkp);
	local top = {};
	local i = 1;
	for name, points in pairs(dkp) do
		if (i > 5) then break end;
		top[i]["Name"] = name;
		top[i]["dkp"] = points;
		i = i+1;
	end;
	return top;
end;
local addonName, addonData = ...;
HVA_GetDKP = LibStub("AceAddon-3.0"):NewAddon("HVA_GetDKP", "AceConsole-3.0", "AceTimer-3.0", "AceEvent-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("HVA_GetDKP");

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
	if (string.lower(message) == "listdkp" and (UnitIsRaidOfficer(sender) or UnitIsPartyLeader(sender))) then
		local dkplist = self:GetTopDKP();
		local msg = prefix .. L["List of DKP leaders"];
		SendChatMessage(msg, "RAID");
		for i=1,#dkplist do
			SendChatMessage(prefix .. "1. " .. dkplist[i];
		end;
	end;
end;
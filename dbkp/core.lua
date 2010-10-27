local addonName, addonData = ...;
HVA_DBKP = LibStub("AceAddon-3.0"):NewAddon("HVA_DBKP");

do 
	defaults = {
		realm = {
			Alice = 500,
			Bob = 325,
		},
	}
end;

-- OnInitialize
function HVA_DBKP:OnInitialize()
--@debug@
--	self:Print('OnInitialize');
--@end-debug@
	self.db = LibStub("AceDB-3.0"):New("HVA_DBKP_DB", defaults, "realm");
end;

-- OnEnable
function HVA_DBKP:OnEnable()
--@debug@
--    self:Print('OnEnable');
--@end-debug@
end;

function HVA_DBKP:AddPlayer(player, value)
	self.db.realm[player] = value or 0;
	return value or 0;
end;

function HVA_DBKP:RemovePlayer(player)
	self.db.realm[player] = nil;
end;

function HVA_DBKP:ChangeDKP(player, value)
	if (self.db.realm[player]) then
		self.db.realm[player] = self.db.realm[player] + value;
		return self.db.realm[player];
	else
		return false;
	end;
end;

function HVA_DBKP:ResetDKP(player)
	if (self.db.realm[player]) then 
		self.db.realm[player] = 0;
		return self.db.realm[player];
	else
		return false;
	end;
end;

function HVA_DBKP:GetDKP(player)
	if (self.db.realm[player]) then
		return self.db.realm[player];
	else
		return false;
	end;
end;
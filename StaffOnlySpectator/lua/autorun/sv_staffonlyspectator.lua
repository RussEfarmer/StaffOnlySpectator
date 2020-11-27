--Created by RussEfarmer on 10/25/2020

--Groups that are allowed to enter spectator
groups = {
	"trusted",
	"dtmod",
	"moderator",
	"adm",
	"admin",
	"superadmin",
	"operator",
	"superdonor"
}

function checkTableValue(table, value)
	for k, v in pairs(table) do
		if v == value then return true end
	end
return false end

hook.Add("PlayerChangedTeam", "RestrictSpectator", function(ply, oldTeam, newTeam)
	if newTeam == TEAM_SPECTATOR then
		if not checkTableValue(groups, ply:GetUserGroup()) then
			timer.Create("SwitchSpectator", 1, 1,
				function() 
					GAMEMODE:PlayerJoinTeam(ply, oldTeam)
					ply:PrintMessage(HUD_PRINTTALK, "This team is reserved for staff members.")
				end)
		end
	end
end)
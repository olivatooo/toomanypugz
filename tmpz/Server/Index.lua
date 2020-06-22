startLocations = {
  Vector(3370.0, 5950.0, 142.200073),
	Vector(3470.0, 5950.0, 142.200073),
	Vector(3270.0, 5950.0, 142.200073),
}

peixe = {
}
	
bank = {}
	
function getRandomStartLocation()
	return startLocations[math.random(#startLocations)]
end

function getRandomPeixe()
	return peixe[math.random(#peixe)]
end

Server:on("Start", function()
  local prop_tire = Prop(
	Vector(600, 0, 0), 
	Rotator(0, 0, 0), 
	"NanosWorld/Art/Rural/Extra/SM_TireLarge"
	)
  prop_tire:SetGravityEnabled(false);
end)

Player:on("Spawn", function(player)
        local initialLocation = getRandomStartLocation()
        local newChar = Character(initialLocation)
        player:Possess(newChar)
		bank[newChar] = 16000
end)


Character:on("GrabProp", function(character, prop)
	if bank[character] >= 2000 then
		local prop_tire = Prop(
			Vector(600, 0, 0), 
			Rotator(0, 0, 0), 
			getRandomPeixe()
		)
		bank[character] = bank[character] - 2000
		Events:CallRemote("UpdateMoney", {bank[character]})
	end
	
end)

Character:on("Respawn", function(character)
        local location = getRandomStartLocation()
        character:SetInitialLocation(location)
		Package:Log("Respawned")
end)


-- Called when Player unpossess a Character
Player:on("UnPossess", function(player, character, bIsPlayerDisconnecting)
        if (bIsPlayerDisconnecting) then
                character:Destroy()
        end
end)

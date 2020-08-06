Package:Require ("WeaponGenerator.lua")
Package:Require ("ALotOfTriggers.lua")
Package:Require ("AttachShop.lua")
Package:Require ("WaveGenerator.lua")
Package:Require ("GrenadeShop.lua")
Package:Require ("Wardrobe.lua")


startLocations = {
  Vector(3470.0, 5950.0, 142.200073),
  Vector(3270.0, 5950.0, 142.200073),
  Vector(3370.0, 5950.0, 142.200073),
  Vector(3470.0, 5950.0, 142.200073),
}

bank = {}
initial_money = 100
crystal_hp = 10
num_players = 0
limit = 0

function restartGame()

	initial_money = 100
	crystal_hp = 10
	wave_number = 0

	for k,v in pair(NanosWorld:GetPlayers()) do
	  v:SetHealth(-1)
	end
	
	for k,v in pair(NanosWorld:GetWeapons()) do
	  v:Destroy()
	end
	
	for k,v in pair(NanosWorld:GetGrenades()) do
	  v:Destroy()
	end
	
	
	
end



Events:on("BuyWeapon", function(player, shopz, shop_optionz)
  result_money = bank[player] - shop_items[shop_index[shopz]][shop_optionz]
  
  if result_money >= 0 then
    bank[player] = result_money
    Events:CallRemote("UpdateMoney", player, {bank[player]})
    if shopz == 1 then
      prop = TmpzWeapons.PistolTier(player:GetControlledCharacter():GetLocation(), Rotator(), shop_optionz)
    end
    if shopz == 2 then
      prop = TmpzWeapons.ShotgunTier(player:GetControlledCharacter():GetLocation(), Rotator(), shop_optionz)
    end
    if shopz == 3 then
      prop = TmpzWeapons.RifleTier(player:GetControlledCharacter():GetLocation(), Rotator(), shop_optionz)
    end
    if shopz == 4 then
      prop = TmpzWeapons.smgTier(player:GetControlledCharacter():GetLocation(), Rotator(), shop_optionz)
    end
    if shopz == 5 then
      prop = TmpzWeapons.PistolTier(player:GetControlledCharacter():GetLocation(), Rotator(), shop_optionz)
    end
    if shopz == 6 then
      TmpzWardrobe.Shop(player:GetControlledCharacter(), shop_optionz)
    end
    if shopz == 7 then
	  TmpzAttach.Shop(player:GetControlledCharacter():GetGrabbedProp(), shop_optionz)
    end
    if shopz == 8 then
      TmpzExplosives.GrenadesTier(shop_optionz)
    end
	option = {"Damage: " .. prop.BaseDamage .. " Cadence: " .. prop.Cadence .. " Spread: " .. prop.Spread}
	Events:CallRemote("AnnouncePurchased", player, {option})
  else
    Events:CallRemote("AnnouncePurchased", player, {"0"})
  end

end)


Events:on("BroadcastMoney", function(value)
  for k, v in pairs(bank) do
    bank[k] = v + value
    Events:CallRemote("UpdateMoney", k, {bank[k]})
  end
end)

Player:on("Spawn", function(player)
  local initialLocation = get_random_from_list(startLocations)
  local newChar = Character(initialLocation)
  newChar:SetTeam(2)
  newChar.Health = 100
  newChar:SetSpeedMultiplier(1.1)
  player:Possess(newChar)
  bank[player] = initial_money
  Events:CallRemote("UpdateMoney", player, {initial_money})
  Events:BroadcastRemote("UpdateCrystalHP", {crystal_hp})
  Events:CallRemote("WhoAmI", player, {player})
  num_players = num_players + 1
end)

-- Called when Player unpossess a Character (when Players disconnect, they will trigger UnPossess event)
Player:on("UnPossess", function(player, character, isPlayerDisconnecting)
  if (isPlayerDisconnecting) then
    character:Destroy()
    num_players = num_players - 1
  end
end)

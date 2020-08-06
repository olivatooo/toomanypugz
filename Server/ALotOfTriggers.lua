aiSpawner = {
  Vector(900.0, -1380.0, 50.125122),
  Vector(-400.0, -1280.0, 50.125122)
}

game_running = 0
start_game = Trigger(Vector(3330.0, 6650.0, 100.0), 100, false, Color(1, 0, 0, 1))

tower_that_needs_defense = Trigger(Vector(200.0, 5150.0, 800.0), 200, false, Color(1, 0, 0, 1))

pistol_shop = Trigger(Vector(2850.0, 4280.0, 100.0), 100, false, Color(1, 0, 0, 1))
shotgun_shop = Trigger(Vector(2850.0, 3750.0, 100.0), 100, false, Color(1, 0, 0, 1))
rifle_shop = Trigger(Vector(2850.0, 3290.0, 100.0), 100, false, Color(1, 0, 0, 1))
smg_shop = Trigger(Vector(2850.0, 2780.0, 100.0), 150, false, Color(1, 0, 0, 1))
pugz_shop = Trigger(Vector(2850.0, 2270.0, 100.0), 100, false, Color(1, 0, 0, 1))
attachs_shop = Trigger(Vector(3850.0, 3270.0, 100.0), 100, false, Color(1, 0, 0, 1))
upgrades_shop = Trigger(Vector(3850.0, 3770.0, 100.0), 100, false, Color(1, 0, 0, 1))
explosives_shop = Trigger(Vector(3850.0, 2770.0, 100.0), 100, false, Color(1, 0, 0, 1))


tower_that_needs_defense:on("BeginOverlap", function(actor)
  crystal_hp = crystal_hp - 1
  Events:BroadcastRemote("UpdateCrystalHP", {crystal_hp})
  actor:SetHealth(-1)
  if crystal_hp == 0 then
	game_running = 0
	restartGame()
  end
end)

upgrades_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"upgrade"})
  end
end)

upgrades_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {""})
  end
end)

attachs_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"attach"})
  end
end)

attachs_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {""})
  end
end)

explosives_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"explosive"})
  end
end)

explosives_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {""})
  end
end)

start_game:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" and game_running == 0 then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"RESTART_GAME"})
  end
end)

start_game:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {""})
  end
end)


pistol_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"pistol"})
  end
end)
pistol_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {"end"})
  end
end)


pistol_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"pistol"})
  end
end)
pistol_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {"end"})
  end
end)

shotgun_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"shotgun"})
  end
end)
shotgun_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {""})
  end
end)

rifle_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"rifle"})
  end
end)
rifle_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {""})
  end
end)

smg_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"smg"})
  end
end)
smg_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {""})
  end
end)

pugz_shop:on("BeginOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("EnterShop", actor:GetPlayer(), {"pugz"})
  end
end)
pugz_shop:on("EndOverlap", function(actor)
  if actor:GetType() == "Character" then
    Events:CallRemote("LeaveShop", actor:GetPlayer(), {""})
  end
end)


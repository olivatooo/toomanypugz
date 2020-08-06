Package:Require ("FunMessages.lua")
Package:Require ("GUI.lua")
Package:Require ("Config.lua")
Package:Require ("Shopping.lua")

-- let's jam
-- Sound(Vector(0, 0, 0),"tmpz::Music",true,false,0,1,1)


Events:on("AnnounceWave", function(countdown, wave_num)
  Render.ClearItems(2)
  if countdown == 0 then
	-- Sound(Vector(0, 0, 0),"tmpz::WaveStart",true,false,0,1,1)
    Render.ClearItems(2)
  else
    DrawText(2, "Wave: " .. wave_num, screen_x/2, screen_y/12, 32)
    DrawText(2, "Starting in " .. countdown, screen_x/2, screen_y/8, 48)
  end
end)

Events:on("UpdateCrystalHP", function(new_crystal_hp)
  crystal_hp = new_crystal_hp
  UpdateGUI()
end)

Events:on("UpdateMoney", function(new_money)
  money = new_money
  UpdateGUI()
end)

Events:on("IncrementMoney", function(new_money)
  money = money + new_money
  UpdateGUI()
end)

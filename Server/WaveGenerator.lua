Package:Require ("WaveConfig.lua")

count_to = 0
break_time = 10
killed = 0

switch = false
spawn_1 = Vector(880.0, -1360.0, 200.0)
spawn_2 = Vector(-400.0, -1380.0, 200.0)

wave_number = 0

Events:on("SpawnNextWave", function()
  
  Timer:SetTimeout(1000, {}, function()
    count_to = count_to + 1
    if switch then
      mq = Character(spawn_1, Rotator(0, 0, 0), "NanosWorld::SK_Mannequin")
    else
      mq = Character(spawn_2, Rotator(0, 0, 0), "NanosWorld::SK_Mannequin")
    end
    switch = not switch

    mq:MoveTo(Vector(200.0, 5150.0, 640.0), 1)
    mq:LookAt(Vector(200.0, 5150.0, 640.0))
    mq:SetHealth(GetWaveHP()*num_players)
    if wave_number % 7 == 0 then
      mq:SetHealth(GetWaveHP()*num_players*0.1)
      mq:SetGaitMode(2)
      mq:SetScale(Vector(0.5,0.5,0.5))
    end

    if wave_number % 12 == 0 then
      mq:SetHealth(GetWaveHP()*num_players*2)
      mq:SetGaitMode(2)
      mq:SetScale(Vector(1.5,1.5,1.5))
    end

    if wave_number % 11 == 0 then
      mq:SetHealth(GetWaveHP()*num_players*3)
      mq:SetSpeedMultiplier(0.7)
      mq:SetGaitMode(1)
      mq:SetScale(Vector(0.5,0.5,0.5))
    end
    
    if count_to == 9 + wave_number then
      if wave_number % 5 == 0 then
        mq:SetHealth(GetWaveHP()*num_players*10)
        mq:SetSpeedMultiplier(0.5)
        mq:SetScale(Vector(3,3,3))
      end
    end
    
    mq:SetTintColor( Color( (1/mq:GetHealth())/num_players, ((100*mq:GetHealth())/58354)/num_players, 1 - (wave_number/100) ) )

    if wave_number >= 5 then
      mq:AddSkeletalMeshAttached("shirt", "NanosWorld::SK_Shirt")
    end

    if wave_number >= 10 then
      mq:AddSkeletalMeshAttached("shoes", "NanosWorld::SK_Tie")
    end
    
    if wave_number >= 15 then
      mq:AddStaticMeshAttached("hair", "NanosWorld::SM_Hair_Long", "hair_male", Vector(), Rotator())
    end
    
    if wave_number >= 20 then
      mq:AddStaticMeshAttached("beard", "NanosWorld::SM_Beard_Mustache_01", "beard", Vector(), Rotator())
    end
    
    if wave_number >= 25 then
      mq:AddSkeletalMeshAttached("pants", "NanosWorld::SK_Pants")
    end
    
    if wave_number >= 30 then
      mq:AddSkeletalMeshAttached("full", "NanosWorld::SK_CasualSet")
    end
    
    if count_to == 10 + wave_number then
      count_to = 0
      return false
    end

  end)

end)

Character:on("Death", function(character)
  killed = killed + 1
  gained = math.ceil(GetWaveHP()*0.1)
  if wave_number % 4 == 0 then
    gained = gained * 2
  end

  Events:Call("BroadcastMoney", {gained})
  if killed == 10 + wave_number then
    if wave_number % 5 == 0 then
      gained = gained * 10
      Events:Call("BroadcastMoney", {gained})
    end
    killed = 0
    Events:Call("LetsDoABreak", {})
  end
  Timer:SetTimeout(10000, {}, function()
    character:Destroy()
  end)
end)


Events:on("LetsDoABreak", function()
	if game_running == 0 then
		game_running = 1
	end
  Timer:SetTimeout(1000, {}, function()
    break_time = break_time - 1
    Events:BroadcastRemote("AnnounceWave", {break_time, wave_number+1})
    if break_time == 0 then
      break_time = 10
      wave_number = wave_number + 1
      Events:Call("SpawnNextWave", {})
      return false
    end
  end)
end)
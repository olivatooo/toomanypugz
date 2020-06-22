Package:Require ("Utils.lua")

function generate_rifle(Location, Rotation, tier)
  local color_range
  local ammo_in_clip = 0
  local ammo_in_bag = 0
  local clip_capacity = 0
  local model = nil
  local base_damage =  0
  local spread = 0
  local bullet_count = 0
  local ammo_to_reload = 0
  local bullet_color = nil
  local cadence = 0
  local FOV = 0.5
  if tier == 1 then
    ammo_in_clip = math.random(6,12)
    ammo_in_bag = math.random(10000,12000)
    base_damage = 1
    spread = math.random(20, 30)
    bullet_count = math.random(1, 2)
    local color_min = 0
    local color_max = 0.1
    bullet_color = Color(random_float(color_min,color_max), random_float(color_min,color_max), random_float(color_min,color_max), 1)
    cadence = random_float(0.13, 0.16)
  end

  if tier == 2 then
    ammo_in_clip = math.random(12,20)
    ammo_in_bag = math.random(20000,30000)
    base_damage = math.random(2,4)
    spread = math.random(20, 23)
    bullet_count = 1
    local color_min = 0.1
    local color_max = 0.2
    bullet_color = Color(random_float(color_min,color_max), random_float(color_min,color_max), random_float(color_min,color_max), 1)
    cadence = random_float(0.12, 0.15)
  end

  if tier == 3 then
    ammo_in_clip = math.random(22,32)
    ammo_in_bag = math.random(20000,30000)
    base_damage = math.random(4,8)
    spread = math.random(15, 20)
    bullet_count = 1
    local color_min = 0.2
    local color_max = 0.3
    bullet_color = Color(random_float(color_min,color_max), random_float(color_min,color_max), random_float(color_min,color_max), 1)
    cadence = random_float(0.11, 0.13)
  end

  if tier == 4 then
    ammo_in_clip = math.random(32,64)
    ammo_in_bag = math.random(200000,300000)
    base_damage = math.random(8,16)
    spread = math.random(10, 15)
    bullet_count = 1
    local color_min = 0.3
    local color_max = 0.4
    bullet_color = Color(random_float(color_min,color_max), random_float(color_min,color_max), random_float(color_min,color_max), 1)
    cadence = random_float(0.10, 0.12)
  end

  if tier == 5 then
    ammo_in_clip = math.random(128,1024)
    ammo_in_bag = math.random(ammo_in_clip*10,ammo_in_clip*20)
    base_damage = math.random(16,32)
    cadence = random_float(0.01, 0.10)
    spread = 1/cadence
    bullet_count = 1
    local color_min = 0.5
    local color_max = 1
    bullet_color = Color(random_float(color_min,color_max), random_float(color_min,color_max), random_float(color_min,color_max), 1)
  end

  clip_capacity = ammo_in_clip
  ammo_to_reload = clip_capacity

  return Weapon(
    Location,
    Rotation,
    "NanosWorld/Weapons/Rifles/AK47/SK_AK47",	-- Model
    0,						-- Collision (Normal)
    true,					-- Gravity Enabled
    ammo_in_clip,						-- Ammo in the Clip
    ammo_in_bag,					-- Ammo in the Bag
    clip_capacity,						-- Clip Capacity
    base_damage,						-- Base Damage
    spread,						-- Spread
    bullet_count,						-- Bullet Count (1 for common weapons, > 1 for shotguns)
    ammo_to_reload,						-- Ammo to Reload (Ammo Clip for common weapons, 1 for shotguns)
    20000,					-- Max Bullet Distance
    15000,					-- Bullet Speed (visual only)
    bullet_color,	-- Bullet Color
    0.5,					-- Sight's FOV multiplier
    Vector(0, 0, -14.85),	-- Sight Location
    Rotator(-1, 0, 0),		-- Sight Rotation
    Vector(26, 0, 8.5),		-- Left Hand Location
    Rotator(0, 60, 90),		-- Left Hand Rotation
    Vector(-10, 0, 0),		-- Right Hand Offset
    1,						-- Handling Mode (0. SingleHandedWeapon, 1. DoubleHandedWeapon, 2. SingleHandedMelee, 3. DoubleHandedMelee, 4. Throwable, 5. Torch)
    cadence,					-- Cadence (1 shot at each 0.15seconds)
    true,					-- Can Hold Use (keep pressing to keep firing, common to automatic weapons)
    false,					-- Need to release to Fire (common to Bows)
    "NanosWorld/Weapons/Common/Effects/ParticlesSystems/Weapons/P_Bullet_Trail_System",	-- Bullet Trail Particle
    "NanosWorld/Weapons/Common/Effects/ParticlesSystems/Weapons/P_Weapon_BarrelSmoke_System",	-- Barrel Particle
    "NanosWorld/Weapons/Common/Effects/ParticlesSystems/Weapons/P_Weapon_Shells_762x39_System",	-- Shells Particle
    "NanosWorld/Weapons/Common/Audios/A_Rifle_Dry_Cue",									-- Weapon's Dry Sound
    "NanosWorld/Weapons/Common/Audios/A_Rifle_Load_Cue",								-- Weapon's Load Sound
    "NanosWorld/Weapons/Common/Audios/A_Rifle_Unload_Cue",								-- Weapon's Unload Sound
    "NanosWorld/Weapons/Common/Audios/Rattle/A_AimZoom_Cue",							-- Weapon's Zooming Sound
    "NanosWorld/Weapons/Common/Audios/Rattle/A_Rattle_Cue",								-- Weapon's Aiming Sound
    "NanosWorld/Weapons/Common/Audios/A_AK47_Shot_Cue",									-- Weapon's Shot Sound
    "NanosWorld/Characters/Common/Animations/Weapons/AM_Mannequin_Reload_Rifle",		-- Character's Reloading Animation
    "NanosWorld/Characters/Common/Animations/Weapons/AM_Mannequin_Sight_Fire",			-- Character's Aiming Animation
    "NanosWorld/Weapons/Rifles/AK47/SM_AK47_Mag_Empty"									-- Magazine Mesh
  )
end

function generate_pistol(Location, Rotation, tier)
  local color_range
  local ammo_in_clip = 0
  local ammo_in_bag = 0
  local clip_capacity = 0
  local model = nil
  local base_damage =  0
  local spread = 0
  local bullet_count = 0
  local ammo_to_reload = 0
  local bullet_color = nil
  local cadence = 0
  local FOV = 0.5
  if tier == 1 then
    ammo_in_clip = math.random(10,20)
    ammo_in_bag = math.random(10000,12000)
    base_damage = math.random(1,5)
    spread = math.random(40, 50)
    local color_min = 0
    local color_max = 0.1
  end

  if tier == 2 then
    ammo_in_clip = math.random(12,26)
    ammo_in_bag = math.random(20000,30000)
    base_damage = math.random(5,10)
    spread = math.random(37, 40)
    local color_min = 0.1
    local color_max = 0.2
    cadence = random_float(0.12, 0.15)
  end

  if tier == 3 then
    ammo_in_clip = math.random(26,48)
    ammo_in_bag = math.random(20000,30000)
    base_damage = math.random(10,40)
    spread = math.random(15, 20)
    local color_min = 0.2
    local color_max = 0.3
  end

  if tier == 4 then
    ammo_in_clip = math.random(48,78)
    ammo_in_bag = math.random(200000,300000)
    base_damage = math.random(40,80)
    spread = math.random(10, 15)
    local color_min = 0.3
    local color_max = 0.4
  end

  if tier == 5 then
    ammo_in_clip = math.random(128,1024)
    ammo_in_bag = math.random(ammo_in_clip*10,ammo_in_clip*20)
    base_damage = math.random(80, 256)
    spread = 1
    local color_min = 0.5
    local color_max = 1
  end

  bullet_count = 1
  cadence = 0.2
  bullet_color = Color(random_float(color_min,color_max), random_float(color_min,color_max), random_float(color_min,color_max), 1)
  clip_capacity = ammo_in_clip
  ammo_to_reload = clip_capacity

  return Weapon(
    Location,
    Rotation,
    "NanosWorld/Weapons/Pistols/Glock/SK_Glock",	-- Model
    0,						-- Collision (Normal)
    true,					-- Gravity Enabled
    17,						-- Ammo in the Clip
    1000,					-- Ammo in the Bag
    17,						-- Clip Capacity
    15,						-- Base Damage
    30,						-- Spread
    1,						-- Bullet Count (1 for common weapons, > 1 for shotguns)
    17,						-- Ammo to Reload (Ammo Clip for common weapons, 1 for shotguns)
    20000,					-- Max Bullet Distance
    15000,					-- Bullet Speed (visual only)
    Color(20, 10000, 0),	-- Bullet Color
    0.6,					-- Sight's FOV multiplier
    Vector(0, 0, -8.5),		-- Sight Location
    Rotator(-0.5, 0, 0),	-- Sight Rotation
    Vector(2, -1.5, 0),		-- Left Hand Location
    Rotator(0, 50, 130),	-- Left Hand Rotation
    Vector(-30, 0, 5),		-- Right Hand Offset
    0,						-- Handling Mode (0. SingleHandedWeapon, 1. DoubleHandedWeapon, 2. SingleHandedMelee, 3. DoubleHandedMelee, 4. Throwable, 5. Torch)
    cadence,						-- Cadence
    false,					-- Can Hold Use (keep pressing to keep firing, common to automatic weapons)
    false,					-- Need to release to Fire (common to Bows)
    "NanosWorld/Weapons/Common/Effects/ParticlesSystems/Weapons/P_Bullet_Trail_System",	-- Bullet Trail Particle
    "NanosWorld/Weapons/Common/Effects/ParticlesSystems/Weapons/P_Weapon_BarrelSmoke_System",	-- Barrel Particle
    "NanosWorld/Weapons/Common/Effects/ParticlesSystems/Weapons/P_Weapon_Shells_9mm_System",	-- Shells Particle
    "NanosWorld/Weapons/Common/Audios/A_Pistol_Dry_Cue",								-- Weapon's Dry Sound
    "NanosWorld/Weapons/Common/Audios/A_Pistol_Load_Cue",								-- Weapon's Load Sound
    "NanosWorld/Weapons/Common/Audios/A_Pistol_Unload_Cue",								-- Weapon's Unload Sound
    "NanosWorld/Weapons/Common/Audios/Rattle/A_AimZoom_Cue",							-- Weapon's Zooming Sound
    "NanosWorld/Weapons/Common/Audios/Rattle/A_Rattle_Cue",								-- Weapon's Aiming Sound
    "NanosWorld/Weapons/Common/Audios/A_Glock_Shot_Cue",								-- Weapon's Shot Sound
    "NanosWorld/Characters/Common/Animations/Weapons/AM_Mannequin_Reload_Pistol",		-- Character's Reloading Animation
    "NanosWorld/Characters/Common/Animations/Weapons/AM_Mannequin_Sight_Fire",			-- Character's Aiming Animation
    "NanosWorld/Weapons/Pistols/Glock/SM_Glock_Mag_Empty"								-- Magazine Mesh
  )
end

function generate_shotgun(Location, Rotation, tier)
  local color_range
  local ammo_in_clip = 0
  local ammo_in_bag = 0
  local clip_capacity = 0
  local model = nil
  local base_damage =  0
  local spread = 0
  local bullet_count = 0
  local ammo_to_reload = 0
  local bullet_color = nil
  local cadence = 0
  local FOV = 0.5
  local color_min = 0
  local color_max = 0

  if tier == 1 then
    ammo_in_clip = math.random(6,12)
    base_damage = math.random(1,2)
    spread = 70
    bullet_count = ammo_in_clip
    local color_min = 0
    local color_max = 0.1
    cadence = random_float(1, 1.1)
  end

  if tier == 2 then
    ammo_in_clip = math.random(12,24)
    base_damage = math.random(2,4)
    spread = 100
    bullet_count = ammo_in_clip
    local color_min = 0.1
    local color_max = 0.2
    cadence = random_float(0.9, 1)
  end

  if tier == 3 then
    ammo_in_clip = math.random(64, 80)
    base_damage = math.random(4,8)
    spread = 120
    bullet_count = ammo_in_clip
    local color_min = 0.2
    local color_max = 0.3
    cadence = random_float(0.8, 0.9)
  end

  if tier == 4 then
    ammo_in_clip = math.random(80,220)
    base_damage = math.random(8,16)
    spread = 300
    bullet_count = ammo_in_clip
    local color_min = 0.3
    local color_max = 0.4
    cadence = random_float(0.7, 0.8)
  end

  if tier == 5 then
    ammo_in_clip = math.random(220,240)
    base_damage = math.random(16,32)
    cadence = random_float(0.5, 0.6)
    spread = 500
    bullet_count = ammo_in_clip
    local color_min = 0.5
    local color_max = 1
  end
  ammo_in_bag = math.random(ammo_in_clip*1000,ammo_in_clip*2000)
  clip_capacity = ammo_in_clip
  ammo_to_reload = clip_capacity

  return Weapon(
    Location,
    Rotation,
    "NanosWorld/Weapons/Shotguns/Moss500/SK_Moss500",	-- Model
    0,						-- Collision (Normal)
    true,					-- Gravity Enabled
    ammo_in_clip,						-- Ammo in the Clip
    ammo_in_bag,					-- Ammo in the Bag
    clip_capacity,						-- Clip Capacity
    base_damage,						-- Base Damage
    spread,						-- Spread
    bullet_count,						-- Bullet Count (1 for common weapons, > 1 for shotguns)
    1,						-- Ammo to Reload (Ammo Clip for common weapons, 1 for shotguns)
    20000,					-- Max Bullet Distance
    15000,					-- Bullet Speed (visual only)
    Color(10000, 20, 0),	-- Bullet Color
    0.75,					-- Sight's FOV multiplier
    Vector(0, 0, -12.5),	-- Sight Location
    Rotator(-1, 0, 0),		-- Sight Rotation
    Vector(38, 2, 2.5),		-- Left Hand Location
    Rotator(-5, 0, -180),	-- Left Hand Rotation
    Vector(-10, 0, 0),		-- Right Hand Offset
    1,						-- Handling Mode (0. SingleHandedWeapon, 1. DoubleHandedWeapon, 2. SingleHandedMelee, 3. DoubleHandedMelee, 4. Throwable, 5. Torch)
    cadence,						-- Cadence
    true,					-- Can Hold Use (keep pressing to keep firing, common to automatic weapons)
    false,					-- Need to release to Fire (common to Bows)
    "",																					-- Bullet Trail Particle
    "NanosWorld/Weapons/Common/Effects/ParticlesSystems/Weapons/P_Weapon_BarrelSmoke_System",	-- Barrel Particle
    "NanosWorld/Weapons/Common/Effects/ParticlesSystems/Weapons/P_Weapon_Shells_12Gauge_System",-- Shells Particle
    "NanosWorld/Weapons/Common/Audios/A_Shotgun_Dry_Cue",								-- Weapon's Dry Sound
    "NanosWorld/Weapons/Common/Audios/A_Shotgun_Load_Bullet_Cue",						-- Weapon's Load Sound
    "",																					-- Weapon's Unload Sound
    "NanosWorld/Weapons/Common/Audios/Rattle/A_AimZoom_Cue",							-- Weapon's Zooming Sound
    "NanosWorld/Weapons/Common/Audios/Rattle/A_Rattle_Cue",								-- Weapon's Aiming Sound
    "NanosWorld/Weapons/Common/Audios/A_Shotgun_Shot_Cue",								-- Weapon's Shot Sound
    "NanosWorld/Characters/Common/Animations/Weapons/AM_Mannequin_Reload_Shotgun",		-- Character's Reloading Animation
    "NanosWorld/Characters/Common/Animations/Weapons/AM_Mannequin_Sight_Fire_Shotgun",	-- Character's Aiming Animation
    ""																					-- Magazine Mesh
  )

end

TmpzWeapons = {
  RifleTier = function(Location, Rotation, Tier)
    return generate_rifle(Location, Rotation, Tier)
  end,
  ShotgunTier = function(Location, Rotation, Tier)
    return generate_shotgun(Location, Rotation, Tier)
  end,
  PistolTier = function(Location, Rotation, Tier)
    return generate_shotgun(Location, Rotation, Tier)
  end
}
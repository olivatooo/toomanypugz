explosives_position = {
	Vector(1650.0, 3650.0, 500.0),
	Vector(1650.0, 3150.0, 500.0),
	Vector(1650.0, 2650.0, 500.0),
	Vector(1650.0, 2150.0, 500.0),
	Vector(-1150.0, 2650.0, 500.0),
	Vector(-1150.0, 3150.0, 500.0),
	Vector(-1150.0, 2150.0, 500.0),
	Vector(-1150.0, 3650.0, 500.0),
}

function generate_grenades(Tier)
	for i, v in ipairs(explosives_position) do
	  local g = Grenade(v, Rotator(0, 90, 90), "NanosWorld::BP_Grenade_G67")
	  g.BaseDamage = 100
	end
end

TmpzExplosives = {
  GrenadesTier = function(Tier)
    return generate_grenades(Tier)
  end
}
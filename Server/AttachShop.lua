function buy_attach(wpn, opt)
	local rddt = Prop(Vector(), Rotator(), "NanosWorld::SM_T4_Sight", 2, false, false)
	rddt:AttachTo(wpn, "sight_socket", Vector(), Rotator())
	if opt == 1 then		
		wpn.SightFOVMultiplier = 0.35
	end
	if opt == 2 then
		wpn.SightFOVMultiplier = 0.70
	end
	if opt == 3 then
		wpn.SightFOVMultiplier = 0.1
	end
	if opt == 4 then
		wpn.SightFOVMultiplier = 0.5
	end
	if opt == 5 then
		wpn.SightFOVMultiplier = 0.05
	end
end

TmpzAttach = {
  Shop = function(chr, opt)
    return buy_attach(chr, opt)
  end
}
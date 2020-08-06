function random_float(lower, greater)
  return lower + math.random()  * (greater - lower)
end

function get_random_from_list(l)
	return l[math.random(#l)]
end
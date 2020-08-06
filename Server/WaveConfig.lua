function GetWaveHP()
 if wave_number == 1 or wave_number == 2 then
  return 1
 end
 return ((wave_number-1)*2) ^ (1.1+(wave_number-1)/100)
end

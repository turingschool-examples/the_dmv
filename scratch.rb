require 'date'

def antique?
  Date.today.year - 2010 > 25
end

def electric_vehicle?
  
end

@plate_type = antique? ? :antique : electric_vehicle? ? :ev : :regular

puts @plate_type
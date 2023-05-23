
class VehicleFactory
 #attr_reader :
 #attr__accessor : 

    def create_vehicles(reg)
      vehicles_deatails = {vin: nil, year: nil, make: nil, model: nil, engine: nil }
      vehicles_deatails_arr =[]
      
      reg.each do |i| 
        vehicles_deatails[:vin] = i[:vin_1_10]
        vehicles_deatails[:year] = i[:model_year]
        vehicles_deatails[:make] = i[:make]
        vehicles_deatails[:model] = i[:model]
        vehicles_deatails[:engine] = i[:electric_vehicle_type]
        vehicles_deatails_arr << vehicles_deatails
      end
      new_vehicles_arr = vehicles_deatails_arr.map{ |i| Vehicle.new(i) }

      new_vehicles_arr
    end
end


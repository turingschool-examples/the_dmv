class VehicleFactory 

    def create_vehicles(vehicle_raw_data)
      
# vehicle_raw_data returns an array of hashes. Each hash object contains vehicle data.      
# 1. iterate through vehicle_raw_data
        vehicle_raw_data.map do |vehicle| 
# 2. using vehicle (in the pipes) we populate value data for Vehicle.new
            Vehicle.new(
                {
                    vin: vehicle[:vin_1_10], 
                    year: vehicle[:model_year], 
                    make: vehicle[:make], 
                    model: vehicle[:model], 
                    engine: :ev
                }
            )
    #THis returns a vehicle object not a hash. This is hash-like not a hash        
        end           
# 3. return an array of hash (vehicle) objects


    end


end


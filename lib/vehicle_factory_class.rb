class VehicleFactory
   
  def create_vehicles(registration)
    registration.map do |vehicle_hash|
      car_hash = {
        vin: vehicle_hash[:vin_1_10],
        model: vehicle_hash[:model],
        make: vehicle_hash[:make],
        engine: :ev,
        year: vehicle_hash[:model_year].to_i
        }
      Vehicle.new(car_hash)
  	end
	end
end


class VehicleFactory

  def create_vehicles(registration_location)
    new_vehicles = []
    registration_location.each do |vehicle|
      vehicle_details = ({
        vin: vehicle[:vin_1_10], 
        year: vehicle[:model_year], 
        make: vehicle[:make], 
        model: vehicle[:model], 
        engine: [:ev]
      })
      new_vehicles << Vehicle.new(vehicle_details) 
    end
    new_vehicles
  end
end

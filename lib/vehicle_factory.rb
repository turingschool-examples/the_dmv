class VehicleFactory
  attr_reader

  def initialize

  end

  def create_vehicles(registration_location)
    new_vehicles = []
    registration_location.each do |vehicle|
      vehicle_details = ({
        vin: vehicle[:vin_1_10] , 
        year: vehicle[:model_year] , 
        make: vehicle[:make] , 
        model: vehicle[:model] , 
        engine: [:ev]
      })
      new_vehicle << Vehicle.new(vehicle_details) 
    end
    new_vehicles
    require 'pry'; binding.pry
  end
end

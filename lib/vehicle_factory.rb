class VehicleFactory
  
  def create_vehicles(vehicle_data)
    require 'pry'; binding.pry
    vehicle_data.map do |vehicle|
      Vehicle.new({
      vin: vehicle[:vin_1_10],
      year: vehicle[:model_year].to_i,
      make: vehicle[:make],
      model: vehicle[:model],
      engine: :ev
                })
    end
  end
end



# def create_vehicles(vehicles)
  # vehicles.map do |vehicle|
  #   new_vehicle = Vehicle.new(vehicle)
  #   new_vehicle.vin = vehicle[:vin_1_10]
  #   new_vehicle.engine = :ev
  #   new_vehicle.year = vehicle[:model_year].to_i
  #   @all_created_vehicles << new_vehicle
  # end
  # @all_created_vehicles

  # end
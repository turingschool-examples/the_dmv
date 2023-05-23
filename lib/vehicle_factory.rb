class VehicleFactory 

  def create_vehicles(vehicles)
    vehicles.map do |vehicle|
      vehicle_details = {}
      vehicle_details[:vin] = vehicle[:vin_1_10]
      vehicle_details[:year] = vehicle[:model_year]
      vehicle_details[:make] = vehicle[:make]
      vehicle_details[:model] = vehicle[:model]
      vehicle_details[:engine] = :ev
      Vehicle.new(vehicle_details)
    end
  end
end
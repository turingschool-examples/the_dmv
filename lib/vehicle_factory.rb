class VehicleFactory
  def initialize
  
  end

  def create_vehicles(vehicle_database)
    
    vehicle_database.map do |potential_vehicle|
      vehicle_deets = {}
      vehicle_deets[:vin] = potential_vehicle[:vin_1_10]
      vehicle_deets[:year] = potential_vehicle[:model_year]
      vehicle_deets[:make] = potential_vehicle[:make]
      vehicle_deets[:model] = potential_vehicle[:model]
      vehicle_deets[:engine] = :ev

      Vehicle.new(vehicle_deets)
    end
  end

end

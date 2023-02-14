class VehicleFactory

  # attr_reader :vehicle_data

  # def initialize
  # end

  def create_vehicles(vehicle_database)
    if vehicle_database == []
      return nil
    end
    vehicle_instances = []
    vehicle_database.each do |vehicle|
      vehicle_instances.push(Vehicle.new({vin: vehicle[:vin_1_10],
                                          year: vehicle[:model_year],
                                          make: vehicle[:make],
                                          model:  vehicle[:model], 
                                          engine: :ev}))
    end
    vehicle_instances
  end
end
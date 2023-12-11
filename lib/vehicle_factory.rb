class VehicleFactory

  def create_vehicles(vehicle_data_array)
    vehicle_data_array.map do |vehicle_data|
      create_vehicle_data(vehicle_data)
    end
  end

  def create_vehicle_data(vehicle_data)
    Vehicle.new(
      engine: vehicle_data[:ev],
      make: vehicle_data[:make],
      model: vehicle_data[:model],
      vin: vehicle_data[:vin_1_10],
      year: vehicle_data[:model_year]
    )
  end
end

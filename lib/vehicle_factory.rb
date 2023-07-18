class VehicleFactory
  def create_vehicles(data)
    data.map do |api_data|
      Vehicle.new(detail_builder(api_data))
    end
  end

  def detail_builder(vehicle_data)
    {
      vin: vehicle_data[:vin_1_10],
      year: vehicle_data[:model_year],
      make: vehicle_data[:make],
      model: vehicle_data[:model],
      engine: :ev
    }
  end
end
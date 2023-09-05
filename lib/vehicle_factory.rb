class VehicleFactory
  
  def create_vehicles(data)
    data.map do |vehicle_data|
      vehicle = Vehicle.new({vin: vehicle_data[:vin_1_10],
        year: vehicle_data[:model_year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: :ev,
        registration_date: vehicle_data[:nil],
        plate_type: vehicle_data[:nil]})
    end
  end
end
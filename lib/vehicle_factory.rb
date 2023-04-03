class VehicleFactory

  def create_vehicles(database)
    database.map do |data|
      vehicle = Vehicle.new({
        vin: data[:vin_1_10], 
        year: data[:model_year], 
        make: data[:make], 
        model: data[:model], 
        engine: :ev
      })
    end
  end
end
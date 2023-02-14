class NyVehicleFactory

  def initialize; end

  def create_vehicles(source)
    
    source.map do |car|
      Vehicle.new({vin: car[:vin], year: car[:model_year], make: car[:make], model: 'unspecified', engine: car[:fuel_type]})
      # fuel types won't match engine
    end
  end

  def filter_cars(source)
    source.select do |car|
      car[:record_type] == 'VEH'
    end
  end
end
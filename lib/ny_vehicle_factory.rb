class NyVehicleFactory
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def create_vehicles(source)
    cars = filter_cars(source)
    cars.map do |car|
      Vehicle.new({vin: car[:vin], year: car[:model_year], 
      make: car[:make], model: 'unspecified', engine: car[:fuel_type]})
    end
  end

  def filter_cars(source)
    source.select do |car|
      car[:record_type] == 'VEH'
    end
  end
end
class NyVehicleFactory

  def initialize; end

  def create_vehicles(source)
    # cars = source.select{|vehicle| vehicle[:record_type] == 'VEH'}
    source.map do |car|
      Vehicle.new({vin: car[:vin], year: car[:model_year], make: car[:make], model: 'unspecified', engine: car[:fuel_type]})
      # fuel types won't match engine
    end
  end
end
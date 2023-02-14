class VehicleFactory

  attr_reader :vehicle_factory
  def initialize
    @vehicle_factory = []
  end

  def create_vehicles(vehicles)
    vehicles.each do |car|
      vehicle_information = {
      vin: car[:vin_1_10],
      year: car[:model_year],
      make: car[:make],
      model: car[:model],
      engine: "ev"
      }
      @vehicle_factory << vehicle = Vehicle.new(vehicle_information)
    end
    @vehicle_factory
    # require 'pry'; binding.pry
  end
end
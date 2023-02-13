class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    data.each do |car|
      vehicle_details = {
        make: car[:make],
        model: car[:model],
        vin: car[:vin_1_10],
        year: car[:model_year].to_i,
        engine: :ev
      }
      vehicle_sorted = Vehicle.new(vehicle_details)
      @vehicles << vehicle_sorted
    end
    @vehicles
  end
end
class VehicleFactory
  attr_reader :manufactured_vehicles, :manufactured_vehicle_count, :vehicle_data
  def initialize
    @vehicle_data = []
    @manufactured_vehicles = []
    @manufactured_vehicle_count = 0
  end

  def manufacture_vehicles(vehicles)
    @vehicle_data = vehicles
    vehicles.each do |vehicle|
      @manufactured_vehicle_count += 1
      number = @manufactured_vehicle_count
      vehicle_number = Vehicle.new(vehicle)
      vehicle_number.vin(vehicle.fetch(:vin_1_10))
      vehicle_number.engine(:ev)
      vehicle_number.year(vehicle.fetch(:model_year))
      @manufactured_vehicles << vehicle_number
    end
  end
end
class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = []
  end

  def create_vehicle(vehicle)
    new_car = Vehicle.new(vehicle)
    @created_vehicles << new_car
    @created_vehicles
  end
end
class VehicleFactory
  attr_reader :vehicle
  def initialize
    @vehicles = []
  end

  def create_vehicles(vehicles)
    @vehicles << vehicles
  end
end
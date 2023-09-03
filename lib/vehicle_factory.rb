class VehicleFactory
  attr_reader

  def initialize
    @factory_vehicles = []
  end

  def create_vehicles(api_data)
    vehicle = Vehicle.new(api_data)
    @factory_vehicles << vehicle
    vehicle.vin = api_data[:vin]
  end
end
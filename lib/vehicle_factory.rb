class VehicleFactory
  attr_reader :vehicle_data
  def initialize
    @vehicle_data = []
  end

  def manufacture_vehicles(vehicles)
    @vehicle_data = vehicles
  end
end
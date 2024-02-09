class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(data_service)
    @vehicles = data_service.map do |vehicle_info|
      Vehicle.new(vehicle_info)
    end
  end
end
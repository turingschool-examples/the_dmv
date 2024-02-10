class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(data_service)
    data_service.each do |vehicle_info|
      vehicle_info[:engine] = :ev if vehicle_info[:engine] == nil
      vehicle_info[:year] = vehicle_info[:model_year]
      vehicle_info[:vin] = vehicle_info[:vin_1_10]
      @vehicles << Vehicle.new(vehicle_info)
    end
  end
end
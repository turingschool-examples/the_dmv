class VehicleFactory
  def initialize
    @factory_vehicles = []
  end

  def create_vehicles(api_data)
    api_data.each do |data|
      vehicle = Vehicle.new(data)
      @factory_vehicles << vehicle
    end
    @factory_vehicles
  end
end
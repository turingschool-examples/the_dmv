class VehicleFactory
  def initialize
  end

  def create_vehicles(api_data)
    @factory_vehicles = []
    api_data.select do |data|
      vehicle_data = { vin: data[:vin_1_10], make: data[:make], model: data[:model], year: data[:year], engine: data[:ev]}
      vehicle = Vehicle.new(vehicle_data)
      @factory_vehicles << vehicle
    end
    @factory_vehicles
  end
end
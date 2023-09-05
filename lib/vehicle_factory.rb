class VehicleFactory
  attr_reader :factory_vehicles,
              :vehicle_data           

  def initialize(engine = :ev)
    @factory_vehicles = []
    @vehicle_data = {
      vin: nil,
      make: nil,
      model: nil,
      year: nil,
      engine: engine
      }
  end

  def create_vehicles(api_data)
    api_data.each do |data|
      vehicle = Vehicle.new(data)
      @factory_vehicles << vehicle
    end
  end
  @factory_vehicles
end



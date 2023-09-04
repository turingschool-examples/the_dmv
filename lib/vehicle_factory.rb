class VehicleFactory
  def initialize
    @factory_vehicles = []
  end

  def create_vehicles(vehicle_data)
    vehicle_data.each do |data|
      
      vin = data[:vin_1_10]
      make = data[:make]
      model = data[:model]
      year = data[:model_year]
      engine = :ev
      vehicle = Vehicle.new(vin: vin, make: make, model: model, year: year, engine: engine)
      @factory_vehicles << vehicle
    end
    @factory_vehicles
  end
end
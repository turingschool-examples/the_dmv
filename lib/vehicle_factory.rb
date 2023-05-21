class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = []
  end

  def create_vehicles(vehicles)
    vehicles.each do |vehicle_data|
      vehicle = Vehicle.new({
        vin: vehicle_data[:vin_1_10],
        year: vehicle_data[:model_year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: :ev
        })
        @created_vehicles << vehicle
    end
    @created_vehicles
  end

  
end
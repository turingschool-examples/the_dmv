class VehicleFactory
  def initialize
    @factory_vehicles = []
  end

  def create_vehicles(api_data)
    api_data.each do |data|
      vehicle_data = {}

      vehicle = Vehicle.new(data)
      # vehicle.registration_date = data[:transaction_date]

        
      @factory_vehicles << vehicle

    end
    @factory_vehicles

  end
end
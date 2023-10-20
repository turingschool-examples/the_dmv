class VehicleFactory
attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(api)
    api.each do |vehicle|
      vehicle[:vin] = vehicle.delete :vin_1_10
      vehicle[:year] = vehicle.delete :model_year
      vehicle = Vehicle.new(vehicle)
      vehicle.engine = :ev
      @vehicles << vehicle
    end
  end
end
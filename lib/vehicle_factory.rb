class VehicleFactory
  attr_reader :vehicle
  def initialize
    @vehicles = []
  end

  def create_vehicles(vehicles)
    vehicles.map do |vehicle|
      car = Vehicle.new(vin: vehicle[:vin_1_10], year: vehicle[:model_year], make: vehicle[:make], model: vehicle[:model], engine: :ev)
      @vehicles << car
    end
  end
end
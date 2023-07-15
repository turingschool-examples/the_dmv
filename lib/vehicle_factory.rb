class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(database)
    database.each do |vehicle|
      @vehicles << Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      })
    end
    @vehicles
  end
end
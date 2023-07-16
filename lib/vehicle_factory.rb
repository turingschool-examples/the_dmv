class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end
  
  def create_vehicles(database)
    database.each { |vehicle| 
      @vehicles << Vehicle.new({
      engine: :ev,
      make: vehicle[:make],
      model: vehicle[:model],
      vin: vehicle[:vin_1_10],
      year: vehicle[:model_year]
      })
    } 
  end
end


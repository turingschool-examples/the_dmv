class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end
  
  def create_vehicles(database)
    database.each { |data| 
      @vehicles << Vehicle.new({
      engine: :ev,
      make: data[:make],
      model: data[:model],
      vin: data[:vin_1_10],
      year: data[:model_year]
      })
    } 
  end
end


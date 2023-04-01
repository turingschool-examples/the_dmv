class VehicleFactory
  def initialize
    
  end

  def create_vehicles(dmv)
    new_cars = []
    dmv.each do |car|
      new_cars << Vehicle.new(
      engine: :ev,
      make:  car[:make],
      model: car[:model],
      vin: car[:vin_1_10],
      year: car[:model_year]
      )
    end
    new_cars
  end
end
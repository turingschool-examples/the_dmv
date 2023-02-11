class VehicleFactory 
  attr_reader :vehicle_storage
  def initialize
    @vehicle_storage = []
  end

  def create_vehicles(data)
    data.each do |car|
      car_hash = { 
      vin: car[:vin_1_10],
      year: car[:model_year],
      make: car[:make],
      model: car[:model],
      engine: :ev
      }
      @vehicle_storage << Vehicle.new(car_hash)
    end
  end
end
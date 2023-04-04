class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(dmv_data)
    dmv_data.each do |car|
      car_hash = {
        vin: car[:vin_1_10],
        year: car[:model_year].to_i,
        make: car[:make],
        model: car[:model],
        engine: :ev
      }   
      @vehicles << Vehicle.new(car_hash)
    end
  end
end
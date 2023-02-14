class VehicleFactory
  attr_reader :car_inventory

  def initialize
    @car_inventory = []
  end

  def creates_vehicles(dmv_data)
    dmv_data.each do |car|
      car_hash = {
        vin: car[:vin_1_10],
        year: car[:model_year].to_i,
        make: car[:make],
        model: car[:model],
        engine: :ev
        }
        
        @car_inventory << Vehicle.new(car_hash)
        require 'pry'; binding.pry
    end
  end
end
require './lib/vehicle'

class VehicleFactory
  def create_vehicles(data)
    data.map do |car|
      Vehicle.new({
        vin: car[:vin_1_10],
        year: car[:model_year].to_i,
        make: car[:make],
        model: car[:model],
        engine: :ev
      })
    end
  end
end
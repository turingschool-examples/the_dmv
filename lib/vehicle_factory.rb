require_relative 'vehicle'

class VehicleFactory

  def create_vehicles(data)
    vehicles_array = []
    data.each do |car|
      car_info = {vin: car[:vin_1_10],
                  year: car[:model_year],
                  make: car[:make],
                  model: car[:model],
                  engine: :ev
                }
      vehicles_array << Vehicle.new(car_info)
    end
    vehicles_array
  end
end
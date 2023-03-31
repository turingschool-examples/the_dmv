require './lib/vehicle'

class VehicleFactory
  def create_vehicles(vehicle_data)
    vehicle_data.map do |data|
      Vehicle.new({
        vin: data[:vin_1_10],
        year: data[:model_year],
        make: data[:make],
        model: data[:model],
        engine: :ev
      })
    end
  end
end
require_relative 'vehicle'

class VehicleFactory
  def create_vehicles(vehicle_data_array)
    vehicle_data_array.map do |vehicle_data|
      Vehicle.new(
        vin: vehicle_data[:vin],
        year: vehicle_data[:model],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: vehicle_data[:engine]
      )
    end
  end
end

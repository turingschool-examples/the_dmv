# lib/vehicle_factory.rb
require_relative 'vehicle'

class VehicleFactory
  def create_vehicles(vehicle_data_array)
    vehicle_data_array.map do |vehicle_data|
      Vehicle.new(
        vin: vehicle_data[:vin_1_10],
        year: vehicle_data[:model_year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: :ev  
      )
    end
  end
end

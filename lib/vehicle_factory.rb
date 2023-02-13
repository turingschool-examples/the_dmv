require './lib/vehicle'

class VehicleFactory
  def create_vehicles(vehicle_details)
    vehicle_details.map do |detail|
      Vehicle.new(
        engine: :ev,
        make: detail[:make],
        model: detail[:model],
        year: detail[:model_year], 
        vin: detail[:vin_1_10]
      )
    end
  end
end
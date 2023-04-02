class VehicleFactory

  def create_vehicles(vehicles)
    vehicles.map do |vehicle|
      vehicle_details = {
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev,
        county: vehicle[:county]
      }
      Vehicle.new(vehicle_details)
    end
  end
end
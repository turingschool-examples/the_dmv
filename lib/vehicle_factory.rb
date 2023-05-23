class VehicleFactory
  def create_vehicles(registrations)
    registrations.map do |vehicle|
      Vehicle.new({vin: vehicle[:vin_1_10], year: vehicle[:model_year].to_i, make: vehicle[:make], model: vehicle[:model], engine: :ev})
    end
  end
end
class VehicleFactory

  def create_vehicles(vehicle_data)
    vehicle_data.map do |vehicle|

    details = {
                vin: vehicle[:vin_1_10],
                year: vehicle[:model_year],
                make: vehicle[:make],
                model: vehicle[:model],
                engine: :ev
      }
      Vehicle.new(details)
    end
  end
end


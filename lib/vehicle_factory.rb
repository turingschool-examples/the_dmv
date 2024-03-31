class VehicleFactory

    def create_vehicles(vehicle_registrations)
        vehicle_registrations.map do |vehicle|
            vehicle_details = {
                vin: vehicle[:vin_1_10],
                year: vehicle[:model_year].to_i,
                make: vehicle[:make],
                model: vehicle[:model],
                engine: :ev,
                registration_date: vehicle[:transaction_date],
                plate_type: :ev,
                county: vehicle[:county]
            }
            Vehicle.new(vehicle_details)
        end
    end
end
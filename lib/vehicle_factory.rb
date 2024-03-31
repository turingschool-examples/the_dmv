class VehicleFactory

    def create_vehicles(vehicle_registrations)
        vehicle_registrations.map do |vehicle|
            if vehicle[:state_of_residence] == 'WA'
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

            elsif vehicle[:state] == 'NY'
                vehicle_details = {
                    vin: vehicle[:vin],
                    year: vehicle[:model_year].to_i,
                    make: vehicle[:make],
                    model: vehicle[:body_type],
                    engine: vehicle[:fuel_type],
                    registration_date: vehicle[:reg_valid_date],
                    plate_type: vehicle[:record_type],
                    county: vehicle[:county]
                }
                Vehicle.new(vehicle_details)
            end
        end
    end
end
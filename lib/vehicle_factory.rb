class VehicleFactory

    def create_vehicles(registrations)
        vehicles_array = []

        registrations.each do |registration|
            car_details = {
                vin: registration[:vin_1_10],
                year: registration[:model_year],
                make: registration[:make],
                model: registration[:model],
                engine: :ev,
                fees: nil
            }

            vehicle = Vehicle.new(car_details)
            vehicle.remove_fees
            vehicles_array << vehicle
        end

        vehicles_array
    end

end
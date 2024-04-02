require './lib/vehicle'

class VehicleFactory
    def create_vehicles(registration_data)
        registration_data.map do |vehicle|
            if vehicle[:electric_vehicle_type] != nil
                Vehicle.new({vin: vehicle[:vin_1_10], 
                            year: vehicle[:model_year], 
                            make: vehicle[:make], 
                            model: vehicle[:model], 
                            engine: :ev,
                            county: vehicle[:county]})
            else
                if vehicle[:record_type] == "VEH"
                    Vehicle.new({vin: vehicle[:vin], 
                                year: vehicle[:model_year], 
                                make: vehicle[:make], 
                                model: nil, 
                                engine: vehicle[:fuel_type],
                                county: vehicle[:county]})
                end
            end
        end
    end
end
class VehicleFactory

    def create_vehicles(source)
        @wa_ev_vehicles_array = []
        source.each do |vehicle_details|
                vin = vehicle_details[:vin_1_10],
                year = vehicle_details[:model_year],
                make = vehicle_details[:make],
                model = vehicle_details[:model]
            
                wa_ev_vehicle = Vehicle.new({
                    vin: vin,
                    year: year,
                    make: make,
                    model: model,
                    engine: :ev,
                    registration_date: nil,
                    plate_type: nil
                })
            @wa_ev_vehicles_array << wa_ev_vehicle
        end
        @wa_ev_vehicles_array
    end

    def most_popular_make
        array_grouped_by_make = @wa_ev_vehicles_array.group_by do |vehicle|
            vehicle.make
        end
        most_popular_make = array_grouped_by_make.max_by do |pair, occurrences|
            occurrences.size
        end
        most_popular_make.first
    end    

    def most_popular_model
        array_grouped_by_model = @wa_ev_vehicles_array.group_by do |vehicle|
            vehicle.model
        end
        most_popular_model = array_grouped_by_model.max_by do |pair, occurrences|
            occurrences.size
        end
        most_popular_model.first    
    end

end
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

    def count_vehicles_for_model_year(model_year)
        array_grouped_by_year = @wa_ev_vehicles_array.group_by do |vehicle|
            vehicle.year
        end
        #Use .transform_values to get the counts for the specified model year
        counts = array_grouped_by_year.transform_values do |vehicles_for_model_year|
            vehicles_for_model_year.size
        end
        counts[model_year]
    end

    def county_with_most_vehicles(source)
        grouped_by_county = source.group_by do |vehicle|
            vehicle[:county]
        end
        #Use .transform_values to get the counts for the specified model year
        counts = grouped_by_county.transform_values do |vehicles_by_county|
            vehicles_by_county.size
        end
        max_pair = counts.max_by do |county, count|
            count
        end
        most_vehicles_by_county = max_pair&.first
        most_vehicles_by_county
    end

end
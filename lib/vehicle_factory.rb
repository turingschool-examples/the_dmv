class VehicleFactory

    def initialize; end

    def create_vehicles(registrations)
        registrations.map do |registration|
            if (registration[:state_of_residence] == "WA")
                wa_attr_population(registration)
            elsif (registration[:state] == "NY")
                ny_attr_population(norm_ny_data(registrations))
            end
        end
    end

    def wa_attr_population(registration)
        Vehicle.new ({
            vin: registration[:vin_1_10],
            year: registration[:model_year],
            make: registration[:make],
            model: registration[:model],
            engine: :ev,
            county: registration[:county]
        })
    end

    def norm_ny_data(registrations)
       registrations.find_all do |registration|
            (registration[:"record_type"] == "VEH") 
        end
        
    end
    def ny_attr_population(registrations)
        registrations.map do |registration|
            Vehicle.new ({
                vin: registration[:"vin"],
                year: registration[:"model_year"],
                make: registration[:"make"],
                model: registration[:"body_type"],
                engine: registration[:"fuel_type"],
                county: registration[:"county"]
            })
        end
        
    end

end
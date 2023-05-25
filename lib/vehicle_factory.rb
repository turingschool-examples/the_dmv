class VehicleFactory 

    def initialize 
    end

    def create_vehicles(registration_locations)
        registration_locations.each do |vehicle|
            vehicle_details = ({vin: vehicle[:vin_1_10] , year: vehicle[:model_year], make: vehicle[:make], model: vehicle[:model], engine: [:ev]})
            new_vehicles = Vehicle.new(vehicle_details)
            return new_vehicles
        end
    end

    def create_facility(facility_locations)
        facility_locations.each do |facility|
            facility_details = ({name: facility[:name], address: facility[:address], phone: facility[:phone]})
            facility_locations = Facility.new(facility_locations)
            return locations 
        end 
    end
end

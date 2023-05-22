require 'date'

class VehicleFactory

    def create_vehicles(registration_location)
        registration_location.each do |vehicle|
            if vehicle[:vin_1_10].nil? == false &&
            vehicle[:model_year].nil? == false &&
            vehicle[:make].nil? == false &&
            vehicle[:model].nil? == false

            new_vehicle = Vehicle.new({vin: vehicle[:vin_1_10] , year: vehicle[:model_year], make: vehicle[:make], model: vehicle[:model], engine: [:ev]})
            end
            return new_vehicle
        end
    end

    def create_facility(locations)
        locations.each do |location|

            x = location[:location_1][:human_address]
            y = JSON.parse(x)
            string_address = y["address"] + " " + y["city"] + " " + y["state"]+ " " + y["zip"]
                
                new_facility = Facility.new({name: location[:title], phone: location[:phone_number], address: string_address})
                
            
            return new_facility 
        end
    end
end
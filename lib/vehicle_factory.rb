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

    def find_state(location)
        if location.include?(:location_1)
            parse_location = JSON.parse(location[:location_1][:human_address])
            return parse_location["state"]
        else location.include?(:state)
            return location[:state]
        end
    end

    def create_facility(locations)
        locations.each do |location|
            state = find_state(location)

            if state == "OR"
            x = location[:location_1][:human_address]
            y = JSON.parse(x)
            string_address = y["address"] + " " + y["city"] + " " + y["state"]+ " " + y["zip"]
            facility_details = {name: location[:title], phone: location[:phone_number], address: string_address}
            
            new_facility = Facility.new(facility_details)
            return new_facility

            elsif state == "NY"
                address = location[:street_address_line_1]
                city = location[:city]
                state = location[:state]
                zip = location[:zip_code]
                string_address = address + " " + city + " " + state + " " + zip
                phone = nil
                if location[:public_phone_number] != nil
                    phone = location[:public_phone_number]
                end
                facility_details = {name: location[:office_name], phone: phone, address: string_address}
            
                new_facility = Facility.new(facility_details)
                return new_facility

            elsif state == "MO"
                address = location[:address1]
                city = location[:city]
                state = location[:state]
                zip = location[:zipcode]
                string_address = address + " " + city + " " + state + " " + zip
            
                facility_details = {name: location[:name], phone: location[:phone], address: string_address}
            
                new_facility = Facility.new(facility_details)
                return new_facility
            end
        end
    end

end
class FacilityConstructor
    def create_facilities(locations)
        locations_formatted = format_data(locations)
        facilities = []
        locations_formatted.each do |location|
            facilities << Facility.new(location)
        end
        facilities
    end

    def format_data(locations)
        formatted_locations = []
        locations.each do |location|
            location_data = {}
            location_data[:name] = (location[:title] || location[:office_name] || location[:name])
            if location[:location_1]
                address_string = location[:location_1][:human_address]
                address_hash = JSON.parse address_string
                location_data[:address] = address_hash.values.join(" ")
            elsif location[:state] == "NY"
                address_array = [location[:street_address_line_1], location[:street_address_line_2], location[:city], location[:state], location[:zip_code]]
                address_array.compact!
                address_string = address_array.join(" ")
                location_data[:address] = address_string
            elsif location[:state] == "MO"
                address_array = [location[:address1], location[:city], location[:state], location[:zipcode]]
                location_data[:address] = address_array.join(" ")
            end
            location_data[:phone] = (location[:phone_number] || location[:public_phone_number] || location[:phone])
            formatted_locations << location_data
        end
        formatted_locations
    end
end
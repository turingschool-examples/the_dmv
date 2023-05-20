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
            location_data[:name] = location[:title]
            address_string = location[:location_1][:human_address]
            address_hash = JSON.parse address_string
            location_data[:address] = address_hash.values.join(" ")
            location_data[:phone] = location[:phone_number]
            formatted_locations << location_data
        end
        formatted_locations
    end
end
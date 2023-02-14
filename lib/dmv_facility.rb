class DmvFacility
    attr_reader :location,
                :facility_instances

    def initialize
        @location = []
        @facility_instances = []
    end

    def create_facilities(all_locations)
        office_locations.map do |location| 
            if location.has_key?(:state) && location[:state] == ""
            @location << location
            end
        end
    end

    def create_facilities_or(facility_database)
        facility_database.each do |facility|
            # JSON.parse(response.body, symbolize_names: true)
            address_info = facility[:location_1][:human_address]
            correct_address_info = JSON.parse(address_info)
            facility_instances << (Facility.new({name: facility[:title], address: correct_address_info.values.join(" "), phone: facility[:phone_number]}))
            # require 'pry'; binding.pry
        end
        facility_instances
    end

    def create_facilities_ny(facility_database)
        facility_database.each do |facility|
            # JSON.parse(response.body, symbolize_names: true)
            # output = {}
            # output[:company_name] = cleanup(hash[:company_name])
            # output[:street] = cleanup(hash[:street])
            # output
            # facility = {}
            # facility[:street_address_line_1][:city][:state][:zip_code] = cleanup(hash[:street_address_line_1][:city][:state][:zip_code])
            # facility[:office_name] = cleanup(hash[:office_name])
            # facility[:public_phone_number] = cleanup(hash[:public_phone_number])

            address_info = facility[:street_address_line_1][:city][:state][:zip_code]
            correct_address_info = JSON.parse(address_info)
            facility_instances << Facility.new({name: facility[:office_name], address: correct_address_info.values.join(" "), phone: facility[:public_phone_number]})
        end
        facility_instances
    end
end


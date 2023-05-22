class FacilityFactory
    def initialize
        #
    end

    def create_facilities(facility_list)
        output = []
        facility_list.each do |facility|
            parsed_address = eval(facility.dig(:location_1, :human_address))
            parsed_street = parsed_address[:address]
            parsed_city = parsed_address[:city]
            parsed_state = parsed_address[:state]
            parsed_zip = parsed_address[:zip]
            final_address = "#{parsed_street} #{parsed_city} #{parsed_state} #{parsed_zip}"
            output << Facility.new({
                name: facility[:title], 
                address: final_address, 
                phone: facility[:phone_number], 
                })
        end
        output
    end
end
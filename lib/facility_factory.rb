class FacilityFactory
    def initialize
        #
    end

    def create_facilities(facility_list)
        output = []
        facility_list.each do |facility|
            if facility[:title] # Format match for Oregon address
                parsed_address = eval(facility.dig(:location_1, :human_address))
                parsed_street = parsed_address[:address]
                parsed_city = parsed_address[:city]
                parsed_state = parsed_address[:state]
                parsed_zip = parsed_address[:zip]
                final_address = "#{parsed_street} #{parsed_city} #{parsed_state} #{parsed_zip}"
                final_name = facility[:title]
                final_phone = facility[:phone_number]
            elsif facility[:office_name] # Format match for New York 
                final_name = facility[:office_name]
                final_phone = facility[:public_phone_number]
                final_address = "#{facility[:street_address_line_1]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}"
            elsif facility[:name] # Format match for Missouri
                final_name = facility[:name]
                final_phone = facility[:phone]
                final_address = "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}"
            else
                p "Unknown name match: #{facility}"
            end
            output << Facility.new({
                name: final_name, 
                address: final_address, 
                phone: final_phone, 
                })
        end
        output
    end
end
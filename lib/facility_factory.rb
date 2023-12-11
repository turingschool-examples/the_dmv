class FacilityFactory 
    attr_reader :facilities

    def initialize
        @facilities = []
    end

    def create_facilities(locations)
        locations.each do |location|
         details = {}
            if location[:state] == "CO"
                co_attr_population(location,details)
            elsif location[:state] == "NY"
                ny_attr_population(location, details)
            elsif location[:state] == "MO"
                mo_attr_population(location, details)
            end
            facility = Facility.new(details)
            @facilities << facility
        end
    end

    def co_attr_population(location,details)
        details[:name] = location[:dmv_office]
        details[:address] = (location[:address_li].to_s)+" "+(location[:address__1].to_s)+" "+location[:city]+" "+location[:state]+" "+location[:zip]
        details[:phone] = location[:phone]
       details
    end
    
    def ny_attr_population(location,details)
        details[:name] = location[:office_name]
        details[:address] = (location[:street_address_line_1].to_s)+" "+(location[:street_address_line_2].to_s)+" "+location[:city]+" "+location[:state]+" "+location[:zip_code]
        details[:phone] = location[:public_phone_number]
    end

    def mo_attr_population(location,details)
        details[:name] = location[:name]
        details[:address] = (location[:address1].to_s)+" "+location[:city]+" "+location[:state]+" "+location[:zipcode]
        details[:phone] = location[:phone]
    end
    
end
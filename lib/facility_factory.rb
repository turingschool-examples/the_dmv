class FacilityFactory 
    attr_reader :facilities

    def initialize
        @facilities = []
    end

    def create_facilities(locations)
        locations.each do |location|
         details = {}
            if location[:state] == "CO"
                details[:name] = location[:dmv_office]
                details[:address] = (location[:address_li].to_s)+" "+(location[:address__1].to_s)+" "+location[:city]+" "+location[:state]+" "+location[:zip]
                details[:phone] = location[:phone]
                facility = Facility.new(details)
                facility.add_service(location[:services])
            elsif location[:state] == "NY"
                details[:name] = location[:office_name]
                details[:address] = (location[:street_address_line_1].to_s)+" "+(location[:street_address_line_2].to_s)+" "+location[:city]+" "+location[:state]+" "+location[:zip_code]
                details[:phone] = location[:public_phone_number]
                facility = Facility.new(details)
            #elsif location[:state] == "MO"

            end
            
            @facilities << facility
        end
    end
end
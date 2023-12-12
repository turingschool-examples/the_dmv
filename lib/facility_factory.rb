class FacilityFactory 
    attr_reader :facilities

    def initialize; end

    def create_facilities(locations)
        locations.map do |location|
            if location[:state] == "CO"
                co_attr_population(location)
            elsif location[:state] == "NY"
                ny_attr_population(location)
            elsif location[:state] == "MO"
                mo_attr_population(location)
            end
        end
    end

    def co_attr_population(location)
        Facility.new({
            name: location[:dmv_office],
            address: ((location[:address_li].to_s)+" "+(location[:address__1].to_s)+" "+location[:city]+" "+location[:state]+" "+location[:zip]),
            phone: location[:phone],
            daily_hours: location[:hours]})
    end
    
    def ny_attr_population(location)
        Facility.new({
            name: location[:office_name],
            address: ((location[:street_address_line_1].to_s)+" "+(location[:street_address_line_2].to_s)+" "+location[:city]+" "+location[:state]+" "+location[:zip_code]),
            phone: location[:public_phone_number], 
            daily_hours: ((location[:monday_beginning_hours].to_s)+" to "+(location[:monday_ending_hours].to_s)+", "+(location[:tuesday_beginning_hours].to_s)+" to "+(location[:tuesday_ending_hours].to_s)+",  "+(location[:wednesday_beginning_hours].to_s)+" to"+(location[:wednesday_ending_hours].to_s)+", "+(location[:thursday_beginning_hours].to_s)+" to"+(location[:thursday_ending_hours].to_s)+", "+(location[:friday_beginning_hours].to_s)+" to"+(location[:friday_ending_hours].to_s)) })
    end

    def mo_attr_population(location)
        Facility.new({
            name: location[:name],
            address: ((location[:address1].to_s)+" "+location[:city]+" "+location[:state]+" "+location[:zipcode]),
            phone: location[:phone],
            daily_hours: location[:daysopen],
            observed_holidays: location[:holidaysclosed]})
    end
    
end
class FacilityFactory
    attr_accessor :facility_list

    def initialize
        @facility_list = []
    end

    def create_facilities(locations)
        locations.each do |facility|
          details = {
            name: format_name(facility),
            address: format_address(facility),
            phone: format_phone(facility),
            hours: format_hours(facility)
          }
          @facility_list << Facility.new(details)
        end
    end

    def format_name(data)
        if data[:state] == 'CO'
            data[:dmv_office]
        elsif data[:state] == 'NY'
            data[:office_type]
        elsif data[:state] == 'MO'
            data[:agent]
        end
    end

    def format_address(data)
        if data[:state] == 'CO'
            address_sections = [data[:address_li], data[:address__1], data[:city], data[:state], data[:zip]]
            address_sections.join(", ")
        elsif data[:state] == 'NY'
            data[:street_address_line_1]
        elsif data[:state] == 'MO'
            data[:address1]
        end
    end

    def format_phone(data)
        if data[:state] == 'CO'
            data[:phone]
        elsif data[:state] == 'NY'
            data[:public_phone_number]
        elsif data[:state] == 'MO'
            data[:phone]
        end
    end

    def format_hours(data)
        if data[:state] == 'CO'
            data[:hours]
        elsif data[:state] == 'NY'
            "Monday-Friday #{data[:monday_beginning_hours]} to #{data[:friday_ending_hours]}" 
        elsif data[:state] == 'MO'
            data[:daysopen]
        end
    end
end
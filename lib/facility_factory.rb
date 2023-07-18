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
            phone: format_phone(facility)
          }
          @facility_list << Facility.new(details)
        end
    end

    def format_name(data)
        if data[:state] == 'CO'
            [data[:dmv_office]]
        end
    end

    def format_address(data)
        if data[:state] == 'CO'
            address_sections = [data[:address_li], data[:address__1], data[:city], data[:state], data[:zip]]
            address_sections.join(", ")
        end
    end
    
    def format_phone(data)
        if data[:state] == 'CO'
            [data[:phone]]
        end
    end

end
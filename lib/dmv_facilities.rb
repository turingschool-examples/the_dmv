class DmvFacilities

    def initialize
    end
    
    def create_facilities(locations)
        locations.map do |location|
            Facility.new({
              name: location[:dmv_office],
              address: location[:address_li],
              phone: location[:phone]
            })
        end
    end

    def create_ny_facilities(locations)
        locations.map do |location|
            Facility.new({
                name: location[:office_name],
                address: location[:street_address_line_1],
                phone: location[:public_phone_number]
            })
        end
        
    end

    def create_mo_facilities(locations)
        locations.map do |location|
            Facility.new({
                name: location[:name],
                address: location[:address1],
                phone: location[:phone]
            })
        end
        
    end
end


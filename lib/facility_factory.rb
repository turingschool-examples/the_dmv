class FacilityFactory

    def create_facilities(locations)
        facilities_array = []

        locations.each do |location|
            branch_details = {
                name: 
                    location[:dmv_office] || 
                    location[:office_name] ||
                    location[:name],
                address: 
                    location[:address_li] || 
                    location[:street_address_line_1] ||
                    location[:address1],
                phone: 
                    location[:phone] || 
                    location[:public_phone_number]
            }

            facility = Facility.new(branch_details)
            facilities_array << facility 
        end

        facilities_array
    end

end






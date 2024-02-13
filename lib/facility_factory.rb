class FacilityFactory

    def create_facilities(locations)
        if locations[0][:state] == "CO"
            create_co_facilities(locations)
        elsif locations[0][:state] == "NY"
            create_ny_facilities(locations)
        elsif locations[0][:state] == "MO"
            create_mo_facilities(locations)
        end
    end

    def create_co_facilities(locations)
        facilities_array = []
        locations.each do |location|
            branch_details = {
                name:location[:dmv_office],
                address: "#{location[:address_li]} #{location[:address__1]}, #{location[:city]}, #{location[:state]} #{location[:zip]}",
                phone:location[:phone]
            }
            facility = Facility.new(branch_details)
            facilities_array << facility 
        end
        facilities_array
    end

    def create_ny_facilities(locations)
        facilities_array = []
        locations.each do |location|
            branch_details = {
                name:location[:office_name],
                address: "#{location[:street_address_line_1]}, #{location[:city]}, #{location[:state]} #{location[:zip_code]}",
                phone:location[:public_phone_number]
            }
            facility = Facility.new(branch_details)
            facilities_array << facility 
        end
        facilities_array
    end

    def create_mo_facilities(locations)
        facilities_array = []
        locations.each do |location|
            branch_details = {
                name:location[:name],
                address: "#{location[:address1]}, #{location[:city]}, #{location[:state]} #{location[:zipcode]}",
                phone:location[:phone]
            }
            facility = Facility.new(branch_details)
            facilities_array << facility 
        end
        facilities_array
    end

end
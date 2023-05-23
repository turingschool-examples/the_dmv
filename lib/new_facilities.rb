class NewFacilities


   def create_facilities(facilities)
        facility_deatails = {name: nil, address: nil, phone: nil}
        new_facility_arr = []
      
        facilities.each do |i| 
            facility_deatails[:name] = i[:office_name]
            facility_deatails[:address] = "#{i[:street_address_line_1]} #{i[:street_address_line_2]} #{i[:city]} #{i[:state]} #{i[:zip_code]}"
            facility_deatails[:phone] = i[:public_phone_number]

            new_facility_arr << facility_deatails
        end

        new_facilities_hash = new_facility_arr.map{ |i| Facility.new(i) }
        p new_facilities_hash

        #p facilities.map{ |i| i.include?(:public_phone_number) }

   end



end
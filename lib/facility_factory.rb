class FacilityFactory
   def create_facilities(dmv_info)
      dmv_info.map do |facility_data|
         if facility_data[:state] == "CO"
            facility_details = {
               name: facility_data[:dmv_office],
               address: "#{facility_data[:address_li]} #{facility_data[:address__1]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zip]}",
               phone: facility_data[:phone],
               services: []
            }
         elsif facility_data[:state] == "NY"
            facility_details = {
               name: (facility_data[:office_name]),
               address: "#{facility_data[:street_address_line_1]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zip_code]}",
               phone: facility_data[:public_phone_number],
               services: []
            }
         else
            facility_details = {
               name: (facility_data[:name]),
               address: "#{facility_data[:address1]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zipcode]}",
               phone: facility_data[:phone],
               services: []
            }
         end
         Facility.new(facility_details)
      end             
   end 
end

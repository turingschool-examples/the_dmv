class FacilityFactory
    
    def create_facilities(facility_details)
        
        facilities_created = []
        facility_details.each do |facility|
          facility1 = {}
          facility1[:name] = facility[:dmv_office] || facility[:office_name] || facility[:name]
          facility1[:address] = facility[:street_address_line_1] || facility[:address_li] || facility[:address1]
          facility1[:phone] = facility[:public_phone_number] || facility[:phone]
            
          
            facilities_created << Facility.new(facility1)
        end
        
        facilities_created
    end

end


 
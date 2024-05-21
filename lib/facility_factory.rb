class FacilityFactory 
    def initialize
        
    end

    def create_facility(facility_raw_data)
        facility_raw_data.map do |facility| 
            facility_information = {}
            if  facility[:dmv_office]
                facility_information[:name] = facility[:dmv_office]   
                facility_information[:address] = "#{facility[:address_li]} #{facility[:address_1]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}"
                facility_information[:phone] = facility[:phone]
                facility_information[:services] = facility[:services_p]
            elsif facility[:office_name]


            elsif facility[:name]
                facility_information[:name] = facility[:name]   
                facility_information[:address] = "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}"
                facility_information[:phone] = facility[:phone]
               
binding.pry

            end     
                    
           Facility.new(facility_information)
        end 
        

                        
    end
    
end

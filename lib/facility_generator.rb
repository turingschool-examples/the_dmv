require 'facility'

class FacilityGenerator
    def create_facilities(locations_data)
        locations_data.map do |branch|
            if branch[:the_geom] != nil
                Facility.new({name: branch[:dmv_office], 
                            address: "#{branch[:address_li]} #{branch[:address_1]} #{branch[:city]} #{branch[:state]} #{branch[:zip]}", 
                            phone: branch[:phone]})
            elsif branch[:georeference] != nil
                Facility.new({name: "#{branch[:office_name]} #{branch[:office_type]}", 
                            address: "#{branch[:street_address_line_1]} #{branch[:city]} #{branch[:state]} #{branch[:zip_code]}", 
                            phone: branch[:public_phone_number]})
            else
                Facility.new({name: branch[:name], 
                            address: "#{branch[:address1]} #{branch[:city]} #{branch[:state]} #{branch[:zipcode]}", 
                            phone: branch[:phone]})
            end
        end
    end
end
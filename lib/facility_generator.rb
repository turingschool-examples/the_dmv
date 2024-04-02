require './lib/facility'

class FacilityGenerator
    def create_facilities(locations_data)
        locations_data.map do |branch|
            if branch[:the_geom] != nil
                Facility.new({name: branch[:dmv_office], 
                            address: "#{branch[:address_li]} #{branch[:address_1]} #{branch[:city]} #{branch[:state]} #{branch[:zip]}", 
                            phone: branch[:phone],
                            daily_hours: branch[:hours]})
            elsif branch[:georeference] != nil
                Facility.new({name: "#{branch[:office_name]} #{branch[:office_type]}", 
                            address: "#{branch[:street_address_line_1]} #{branch[:city]} #{branch[:state]} #{branch[:zip_code]}", 
                            phone: branch[:public_phone_number],
                            daily_hours: "Monday #{branch[:monday_beginning_hours]} - #{branch[:monday_ending_hours]}, 
                                        Tuesday #{branch[:tuesday_beginning_hours]} - #{branch[:tuesday_ending_hours]}, 
                                        Wednesday #{branch[:wednesday_beginning_hours]} - #{branch[:wednesday_ending_hours]}, 
                                        Thursday #{branch[:thursday_beginning_hours]} - #{branch[:thursday_ending_hours]}, 
                                        Friday #{branch[:friday_beginning_hours]} - #{branch[:friday_ending_hours]}"})
            else
                Facility.new({name: branch[:name], 
                            address: "#{branch[:address1]} #{branch[:city]} #{branch[:state]} #{branch[:zipcode]}", 
                            phone: branch[:phone],
                            daily_hours: branch[:daysopen],
                            holidays_closed: branch[:holidays_closed]})
            end
        end
    end
end
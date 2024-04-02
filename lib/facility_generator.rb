class FacilityGenerator
    def create_facilities(facilities_data)
        facilities_data.map do |data|
            if data[:state] == 'CO'
                data[:name] = data[:dmv_office]
                data.delete(:dmv_office)
                data[:address] = "#{data[:address_li]}, #{data[:address_1]}, #{data[:city]}, #{data[:state]} #{data[:zip]}"
                data[:services] = []
                if data[:services_p].include?('registration')
                    data[:services] << ['Vehicle Registration']
                end
                Facility.new(data)
            elsif data[:state] == 'NY'
                data[:name] = data[:office_name]
                data.delete(:office_name)
                data[:address] = "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]} #{data[:zip_code]}"
                Facility.new(data)
            else data[:state] == 'MO'
                data[:address] = "#{data[:address1]}, #{data[:city]}, #{data[:state]} #{data[:zipcode]}"
                Facility.new(data)
            end
            # is key mapping more efficient than this?
            # pros : looks cleaner, easier to read
            # cons : still have to write out new api keys
        end
    end
end
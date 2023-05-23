class DMVfacility
    
    def create_facility(datas)
        datas.map do |data|
            Facility.new({
                name: name(data),
                address: address(data), 
                phone: phone(data)})
        end
    end

    def name(database)
        database[:title] || database[:office_name] || database[:name]
    end
    
    def phone(database)
        database[:phone_number] || database[:public_phone_number] || database[:phone]
    end

    def address(database)
        if database[:state] == "NY"
            database.fetch_values(:street_address_line_1, :city , :state, :zip_code).join(" ")
        elsif database[:state] == "MO"
            database.fetch_values(:address1, :city , :state, :zipcode).join(" ")
        else database[:location_1][:human_address].include?("OR")
            find_address = eval(database[:location_1][:human_address])
            find_address.fetch_values(:address, :city, :state, :zip).join(" ")
        end
    end
end
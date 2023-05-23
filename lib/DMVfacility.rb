class DMVfacility
    
    def create_facility(datas)
        database = datas.map do |data|
            Facility.new({
                name: name(data),
                address: address(data), 
                phone: phone(data)})
        end
    end

    def name(database)
        database[:title]
    end
    
    def phone(database)
        database[:phone_number]
    end

    def address(database)
        find_address = eval(database[:location_1][:human_address])
        find_address.fetch_values(:address, :city, :state, :zip).join(" ")
    end


end
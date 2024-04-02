class FacilityGenerator
    def create_facilities(facilities_data)
        facilities_data.map do |data|
            data[:name] = data[:dmv_office]
            data.delete(:dmv_office)
            data[:address] = "#{data[:address_li]}, #{data[:address_1]}, #{data[:city]}, #{data[:state]} #{data[:zip]}"
            data.delete(:address_li)
            data.delete(:address_1)
            data.delete(:city)
            data.delete(:state)
            data.delete(:zip)
            data[:services] = []
            if data[:services_p].include?('registration')
                data[:services] << ['Vehicle Registration']
            end
            Facility.new(data)
        end
    end
end
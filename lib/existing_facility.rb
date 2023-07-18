class ExistingFacility  
    attr_reader :facility_info
    def initialize
        @facility_info = []
    end

    def read_information(data)
        data.each do |detail|
            name = detail[:dmv_office]
            address = "#{detail[:address_li]}, #{detail[:address__1]} #{detail[:city]}, #{detail[:state]}, #{detail[:zip]}"
            phone = detail[:phone]
            services = detail[:services_p].split(';').map(&:strip)

            facility_info = {
                name: name,
                address: address,
                phone: phone,
                services: services
            }
        
        facility = Facility.new(facility_info)
        services.each do |service|
            facility.add_service(service)
        end
        @facility_info << facility
    end

    @facility_info.inspect
    end

end
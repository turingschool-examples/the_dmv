class OfficeLocations

    def create_facility(source)
        
    end

    def co_create_facility
        co_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:dmv_office],
                address = facility_information[:address_li],
                phone = facility_information[:phone],
                services = facility_information[:services_p]
            
                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone,
                    services: services,
                    registered_vehicle: [],
                    collected_fees: 0
                })
            co_dmv_facilities_array << facility
        end
        co_dmv_facilities_array
    end

    def ny_create_facility
        ny_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:office_name],
                address = facility_information[:street_address_line_1],
                phone = facility_information[:public_phone_number]
            
                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone,
                    services: []
                    registered_vehicle: [],
                    collected_fees: 0
                })
            ny_dmv_facilities_array << facility
        end
        ny_dmv_facilities_array
    end

    def mo_create_facility
    mo_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:name],
                address = facility_information[:address1],
                phone = facility_information[:phone],
                services = facility_information[:additional_license_office_info]
            
                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone,
                    services: services,
                    registered_vehicle: [],
                    collected_fees: 0
                })
            mo_dmv_facilities_array << facility
        end
        mo_dmv_facilities_array
    end

end
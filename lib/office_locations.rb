class OfficeLocations

    def co_create_facility(source)
        co_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:dmv_office],
                address = {
                    street1: facility_information[:address_li],
                    street2: facility_information[:address_1],
                    city: facility_information[:city],
                    state: facility_information[:state],
                    zip_code: facility_information[:zip]
                    },
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

    def ny_create_facility(source)
        ny_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:office_name],
                address = {
                    street: facility_information[:street_address_line_1],
                    city: facility_information[:city],
                    state: facility_information[:state],
                    zip_code: facility_information[:zip_code]
                    },
                phone = facility_information[:public_phone_number]
            
                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone,
                    services: [],
                    registered_vehicle: [],
                    collected_fees: 0
                })
            ny_dmv_facilities_array << facility
        end
        ny_dmv_facilities_array
    end

    def mo_create_facility(source)
    mo_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:name],
                address = {
                    street: facility_information[:address1],
                    city: facility_information[:city],
                    state: facility_information[:state],
                    zip_code: facility_information[:zipcode]
                    },
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
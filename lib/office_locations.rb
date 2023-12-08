class OfficeLocations

    def create_facility(source)
        dmv_facilities_array = []
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
            dmv_facilities_array << facility
        end
        dmv_facilities_array
    end

end
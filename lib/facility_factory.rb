class FacilityFactory
    def create_co_facilities(dmv_data)
        dmv_data.map do |facility_data|
            Facility.new(
            {
            name: facility_data[:dmv_office],
            address: {
                street: facility_data[:address_li],
                building: facility_data[:address__1],
                city: facility_data[:city],
                state: facility_data[:state],
                zip_code: facility_data[:zip]
            },
            phone: facility_data[:phone],
            services: facility_data[:services_p],
            registered_vehicles: [],
            collected_fees: 0 
            }) 
        end 
    end 

    def create_ny_facilities(dmv_data)
        dmv_data.map do |facility_data|
            Facility.new(
            {
            name: facility_data[:dmv_office],
            address: {
                street: facility_data[:address_li],
                building: facility_data[:address__1],
                city: facility_data[:city],
                state: facility_data[:state],
                zip_code: facility_data[:zip]
            },
            phone: facility_data[:phone],
            services: facility_data[:services_p],
            registered_vehicles: [],
            collected_fees: 0 
            }) 
        end 
    end 
end 
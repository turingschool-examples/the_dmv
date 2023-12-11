class Facility_creator
    def create_co_facilities(dmv_data)
        dmv_data.map do |facility_data|
            Facility.new(
            #have to put it as an object here
            {
            name: facility_data[:dmv_office],
            address: {
                street: facility_data[:address_li],
                building: facility_data[:address__1],
                city: facility_data[:city],
                state: facility_data[:state],
                zip_code: facility_data[:zip]
            },
            #had to go and find the keys on the website to see what to call them
            phone: facility_data[:phone],
            services: facility_data[:services_p],
            registered_vehicles: [],
            collected_fees: 0 
            }) 
        end 
    end
end
        # we are able to take dmv data and change it so the facility class can use
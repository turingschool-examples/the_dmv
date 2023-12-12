class Facility_creator
    def create_co_facilities(dmv_data)
      dmv_data.map do |facility_data|
        #have to put it as an object here
        Facility.new({
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

    # we are able to take dmv data and change it so the facility class can use
    def create_ny_facilities(dmv_data)
      dmv_data.map do |facility_data|
        Facility.new({
          name: facility_data[:office_name],
          address: {
            street: facility_data[:street_address_1],
            city: facility_data[:city],
            state: facility_data[:state],
            zip_code: facility_data[:zip_code]
          },
          phone: facility_data[:public_phone_number],
          registered_vehicles: [],
          collected_fees: 0 
        }) 
      end 
    end 

     #replicate tests but account for key changes off gov website
    def create_mo_facilities(dmv_data)
      dmv_data.map do |facility_data|
        Facility.new({
          name: facility_data[:name],
          address: {
            street: facility_data[:address1],
            city: facility_data[:city],
            state: facility_data[:state],
            zip_code: facility_data[:zipcode]
          },
          phone: facility_data[:phone],
          registered_vehicles: [],
          collected_fees: 0 
        }) 
      end 
    end 
  end
  
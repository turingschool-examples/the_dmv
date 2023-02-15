class FacilityFactory

  def create_facilities_or(data)
    data.map do |facility|  ## map the data being passed through in order to reformat into data structure I want 
      facility_address = facility[:location_1][:human_address] ## new variable set to equal the data we wanted to pull from two levels deep in the hash
      formatted_address = JSON.parse(facility_address)  ## formated using JSON.parse, assigned to a new variable
      formatted_data = {
        name: facility[:title], ## making the data key the new value and matching it to the original key
        address: formatted_address.values.join(" "),  ## using the newly formated address to set a new key value pair
        phone: facility[:phone_number],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      }
      Facility.new(formatted_data) ## Returning a new instance of the Facility class with the reformated data
    end
  end

  def create_facilities_ny(data)
    data.map do |facility|
      formatted_data = {
        name: facility[:office_name],
        address: facility[:street_address_line_1],
        phone: facility[:public_phone_number],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      }
      Facility.new(formatted_data)
    end
  end

  def create_facilities_mo(data)
    data.map do |facility|
      formatted_data = {
        name: facility[:name],
        address: facility[:address1],
        phone: facility[:phone],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      }
      Facility.new(formatted_data)
    end
  end



  
end
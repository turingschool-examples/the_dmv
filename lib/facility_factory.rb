class FacilityFactory

  def create_facilities_or(data)
    data.map do |facility|
      facility_address = facility[:location_1][:human_address]
      formatted_address = JSON.parse(facility_address)
      formatted_data = {
        name: facility[:title],
        address: formatted_address.values.join(" "),
        phone: facility[:phone_number],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      }
      Facility.new(formatted_data)
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



  
end
class FacilityConstructor
  def create_facilities(locations)
    locations_formatted = format_data(locations)
    facilities = []
    locations_formatted.each do |location|
      facilities << Facility.new(location)
    end
    facilities
  end

  def format_data(locations)
    formatted_locations = []
    [locations].flatten.each do |location|
      location_data = {}
      location_data[:name] = (location[:title] || location[:office_name] || location[:name])
      location_data[:address] = parsed_address(location)
      location_data[:phone] = (location[:phone_number] || location[:public_phone_number] || location[:phone])
      formatted_locations << location_data
    end
    formatted_locations
  end
    
  def parsed_address(location)
    if location[:location_1]
      address = JSON.parse location[:location_1][:human_address]
      if location[:location_2]
        unit_num = JSON.parse location[:location_2][:human_address]
        address["address"] << " " << unit_num["address"]
      end
      address.values.join(" ")
    elsif location[:state] == "NY"
      [location[:street_address_line_1], location[:street_address_line_2], location[:city], location[:state], location[:zip_code]].compact.join(" ")
    elsif location[:state] == "MO"
      [location[:address1], location[:city], location[:state], location[:zipcode]].join(" ")
    end
  end
end
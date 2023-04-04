class FacilityFactory
  def create_facilities(state_raw_data)
    created_facilities = state_raw_data.map do |facility| 
      facility_details = format_facility(facility)
        Facility.new(
          {
            name:         facility_details[:name],
            address:      facility_details[:address],
            phone:        facility_details[:phone]
          }
        )
      end
    created_facilities
  end

  def format_facility(data)
    data = {
        name:         format_name(data),
        address:      format_address(data),
        phone:        format_phone(data)
      }
  end

  def format_name(data)
    if data[:state] == "NY"
      data[:office_name]
    elsif data[:state] == "MO"
      data[:name].rstrip 
    elsif data[:wesbite].include?("ODOT")  
      data[:title]
    end
  end

  def format_address(data)
    if data[:state] == "NY"
      "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]} #{data[:zip_code]}"
    elsif data[:state] == "MO"
      "#{data[:address1]}, #{data[:city]}, #{data[:state]} #{data[:zipcode]}"
    elsif data[:wesbite].include?("ODOT")  
      address = JSON.parse(data[:location_][:human_address], {symbolize_names: true})
      "#{data[:address1]}, #{data[:city]}, #{data[:state]} #{data[:zipcode]}"
    end
  end

  def format_phone(data)
    if data[:state] == "NY"
      data[:public_phone_number]
    elsif data[:state] == "MO"
      data[:phone]
    elsif data[:wesbite].include?("ODOT")  
      data[:phone_number]
    end
  end
end
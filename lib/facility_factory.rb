class FacilityFactory

  def create_facility(facility_list)
    facility_list.map do |facility_data|
      facility_info = format_state_data(facility_data)
      Facility.new({
        name: facility_info[:name],
        address: facility_info[:address],
        phone: facility_info[:phone]
      })
    end
  end

  def format_state_data(facility_data)
    data = {
      name: format_name(facility_data), 
      address: format_address(facility_data),
      phone: format_phone_number(facility_data)
    }
  end

  def format_name(data)
    if data[:website] && data[:website].include?('oregon')
      data[:title]
    elsif data[:state] == 'NY'
      data[:office_name]
    elsif data[:state] == 'Missouri'
      data[:name]
    else
      data[:name]
    end
  end

  def format_address(data)
    if data[:website] && data[:website].include?('oregon')
      address = JSON.parse(data[:location_1][:human_address], symbolize_names: true)
      "#{address[:address]}, #{address[:city]}, #{address[:state]}, #{address[:zip]}"
    elsif data[:state] == 'NY'
      "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]}, #{data[:zip_code]}"
    elsif data[:state] == 'MO'
      "#{data[:address1]}, #{data[:city]}, #{data[:state]}, #{data[:zipcode]}"
    else 
      data[:address]
    end
  end

  def format_phone_number(data)
    if data[:website] && data[:website].include?('oregon')
      data[:phone_number]
    elsif data[:state] == 'NY'
      data[:public_phone_number]
    elsif data[:state] == 'Missouri'
      data[:phone]
    else
      data[:phone]
    end
  end
end
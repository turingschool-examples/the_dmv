class FacilityFactory
  def initialize
  end

  def create_facility(api)
    api.map do |facility|
      Facility.new({
        name: format_name(facility),
        address: format_address(facility),
        phone: format_phone_number(facility) 
      })
    end
  end

  def format_name(facility)
    if facility[:state] && facility[:state] == "MO"
      facility[:name].rstrip
    elsif facility[:state] && facility[:state] == "NY"
      facility[:office_name]
    else facility[:website] && facility[:website].include?('oregon')
      facility[:title]
    end

  end

  def format_address(facility)
    if facility[:state] && facility[:state] == "MO"
      "#{facility[:address1]}, #{facility[:city]}, #{facility[:state]}, #{facility[:zipcode]}"
    elsif facility[:state] && facility[:state] == "NY"
      "#{facility[:street_address_line_1]}, #{facility[:city]}, #{facility[:state]} #{facility[:zip_code]}"
    else facility[:website] && facility[:website].include?('oregon')
      address = JSON.parse(facility[:location_1][:human_address], symbolize_names: true)
      "#{address[:address]}, #{address[:city]}, #{address[:state]} #{address[:zip]}"
    end
  end
  
  def format_phone_number(facility)
    if facility[:state] && facility[:state] == "MO"
      facility[:phone]
    elsif facility[:state] && facility[:state] == "NY"
      facility[:public_phone_number]
    else facility[:website] && facility[:website].include?('oregon')
      facility[:phone_number]
    end
  end
end
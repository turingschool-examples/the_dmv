class FacilityConstructor
  def create_facilities(locations)
    locations.map do |location|
      Facility.new({name: name(location), address: address(location), phone: phone(location)})
    end
  end

  def name(location)
    location[:title] || location[:office_name] || location[:name]
  end

  def address(location)
    if location[:location_1]
      address = JSON.parse location[:location_1][:human_address]
      unit_num = JSON.parse location[:location_2][:human_address] unless !location[:location_2]
      address["address"] << " " << unit_num["address"] unless !location[:location_2]
      address.values.join(" ")
    elsif location[:state] == "NY"
      [location[:street_address_line_1], location[:street_address_line_2], location[:city], location[:state], location[:zip_code]].compact.join(" ")
    elsif location[:state] == "MO"
      [location[:address1], location[:city], location[:state], location[:zipcode]].join(" ")
    end
  end

  def phone(location)
    location[:phone_number] || location[:public_phone_number] || location[:phone]
  end
end
class FacilityFactory
  
  def initialize
  end

  def normalize_phone(phone_string)
    if phone_string != nil && !phone_string.start_with?('(')
      phone_string.insert(0, '(').insert(4, ')').insert(5, ' ').insert(9, '-')
    else return phone_string
    end
  end

  def create_facilities(locations)
    facilities = locations.map do |location|
      # CO
      if location[:dmv_office] != nil
        name = location[:dmv_office]
        address = "#{location[:address_li]} #{location[:address__1]} #{location[:city]} #{location[:state]} #{location[:zip]}"
        phone = location[:phone]
      # NY
      elsif location[:office_name] != nil
        name = location[:office_name]
        address = "#{location[:street_address_line_1]} "
        address += "#{location[:street_address_line_2]} #{location[:city]} #{location[:state]} #{location[:zip_code]}".strip
        phone = normalize_phone(location[:public_phone_number])
      # MO
      else
        name = location[:name]
        address = "#{location[:address1]} #{location[:city]} #{location[:state]} #{location[:zipcode]}"
        phone = location[:phone]
      end

      Facility.new(name: name, address: address, phone: phone)
    end
  end
end
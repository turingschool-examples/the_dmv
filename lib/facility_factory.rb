class FacilityFactory
  
  def initialize
  end

  def create_facilities(locations)
    facilities = locations.map do |location|
      # CO
      if location[:dmv_office] != nil
        name = location[:dmv_office]
        address = "#{location[:address_li]} #{location[:address__1]} #{location[:city]} 
        #{location[:state]} #{location[:zip]}"
        phone = location[:phone]
      # NY
      elsif location[:office_name] != nil
        name = location[:office_name]
        address = "#{location[:street_address_line_1]} #{location[:street_address_line_2]} 
        #{location[:city]} #{location[:state]} #{location[:zip_code]}"
        # normalize this phone number (5555555555)
        phone = location[:public_phone_number]
      # MO
      else
        name = location[:name]
        address = "#{location[:address1]} #{location[:city]} #{location[:state]} #{:zipcode}"
        phone = location[:phone]
      end

      Facility.new(name: name, address: address, phone: phone)
    end
  end
end
class FacilityFactory
  def create_facility(api_data)
    facilities = []
    api_data.each do |data|
      if data[:dmv_office] != nil
      name = data[:dmv_office]
      address = "#{data[:address_li]} #{data[:address__1]} #{data[:city]} #{data[:state]} #{data[:zip]}"
      phone = data[:phone]
      #ny
      elsif data[:office_name] != nil 
        name = data[:office_name]
        address = "#{data[:street_address_line_1]}"
        address += "#{data[:street_address_line_2]} #{data[:city]} #{data[:state]} #{data[:zip]}"
        phone = data[:public_phone_number]
        
      else
        #Mo
        data[:address] != nil 
        name = data[:name]
        address = "#{data[:address1]} #{data[:city]} #{data[:state]} #{data[:zip]}"
        phone = data[:phone]
      end 
      facility = Facility.new(name: name, address: address, phone: phone)
      facilities << facility
    end 
    facilities
    
  end 
end              
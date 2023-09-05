class FacilityFactory

  def initialize  
  end

  def create_facility(api_data)
    facilities = api_data.map do |data|
      if data[:dmv_office] != nil
      Facility.new(
      name: data[:dmv_office], 
      address: "#{data[:address_li]} #{data[:address__l]} #{data[:city]} #{data[:state]} #{data[:zip]}",
      phone: data[:phone] 
      )
      # NY
      elsif data[:office_name] != nil
        Facility.new(
      name: data[:office_name], 
      address: "#{data[:street_address_line_1]} #{data[:street_addrass_line_2]} #{data[:city]} #{data[:state]} #{data[:zip]}",
      phone: data[:public_phone_number] 
      )
      # MO
      else data[:address1] != nil
        Facility.new(
      name: data[:name], 
      address: "#{data[:address1]} #{data[:city]} #{data[:state]} #{data[:zip]}",
      phone: data[:phone] 
      )
      end
    end
  end
end


class FacilityFactory

  def initialize
  end
  # require 'pry'; binding.pry
  def create_facility(api_data)
    facilities = api_data.map do |data|
      #co
      if data[:dmv_office] != nil
        name = data[:dmv_office]
        address = "#{data[:address_li]} #{data[:address__1]} #{data[:city]} #{data[:state]} #{data[:zip]}"
        phone = data[:phone]
      elsif data[:office_name] != nil
        name = data[:office_name]
        address = "#{data[:street_address_line_1]}"
        address += "#{data[:street_address_line_2]} #{data[:city]} #{data[:state]} #{data[:zip_code]}"
        phone = data[:public_phone_number]
      end
      facility = Facility.new(name: name, address: address, phone: phone)
    end
    # require 'pry'; binding.pry
  end
end
class FacilityFactory

  def initialize
  end
  # require 'pry'; binding.pry
  def create_facility(api_data)
    facilities = api_data.map do |data|
      name = data[:dmv_office]
      address = "#{data[:address_li]} #{data[:address__1]} #{data[:city]} #{data[:state]} #{data[:zip]}"
      phone = data[:phone]
      facility = Facility.new(name: name, address: address, phone: phone)
    end
    require 'pry'; binding.pry
  end
end
class FacilityFactory

  def initialize
  end
  # require 'pry'; binding.pry
  def create_facility(api_data)
    api_data.map do |data|
      # data[:dmv_data] != nil
      name = data[:dmv_office]
      address = "#{data[:address_li]} #{data[:address_1]} #{data[:city]} #{data[:state]} #{data[:zip]}"
      phone = data{:phone}
      # require 'pry'; binding.pry

      
      
      Facility.new(name: name, address: address, phone: phone)
    end
  end
end
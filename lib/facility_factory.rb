class FacilityFactory
  
  def initialize
  end

  def create_facilities(locations)
    facilities = locations.map do |location|
      name = location[:dmv_office]
      address = "#{location[:address_li]} #{location[:address__1]} #{location[:city]} #{location[:state]} #{location[:zip]}"
      phone = location[:phone]
      # service descriptions do not match method terms, normalize this
      services = location[:services_p].split

      Facility.new(name: name, address: address, phone: phone, services: services)
    end
  end
end
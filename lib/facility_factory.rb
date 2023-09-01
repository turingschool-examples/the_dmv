class FacilityFactory
  
  def initialize
  end

  def create_facilities(locations)
    facilities = locations.map do |location|
      name = location[:dmv_office]
      address = "#{location[:address_li]} #{location[:address__1]} #{location[:city]} #{location[:state]} #{location[:zip]}"
      phone = location[:phone]
      # service descriptions do not match method terms, normalize this
      # just do services manually with in-house method
      # services = location[:services_p].split

      Facility.new(name: name, address: address, phone: phone)
    end
  end
end
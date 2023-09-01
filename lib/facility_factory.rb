class FacilityFactory
  
  def initialize
  end

  def create_facilities(locations)
    facilities = locations.map do |location|
      name = location[:dmv_office]
      # pry into this, this likely isn't giving spaces between components
      address = concat(:address_li, :address__1, :city, :state, :zip)
      phone = :phone
      # service descriptions do not match method terms, normalize this
      services = :services_p.split
    end
  end
end




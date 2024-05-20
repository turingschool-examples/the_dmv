class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(dmv_locations_data)
    dmv_locations_data.each do |dmv|
      name = dmv[:dmv_office]
      phone = dmv[:phone]
      services = dmv[:services_p]
      address = dmv[:address_li] + " " +
                dmv[:address__1] + " " +
                dmv[:city] + " " +
                dmv[:state] + " " +
                dmv[:zip]
      @facilities << Facility.new({name: name,
                                  address: address, 
                                  phone: phone,
                                  services: services})
    end
  end

end

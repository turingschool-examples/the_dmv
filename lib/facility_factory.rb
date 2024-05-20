class FacilityFactory
  attr_reader :factories

  def initialize
    @factories = []
  end

  def create_factories(dmv_locations_data)
    dmv_locations_data.each do |dmv|
      name = dmv[:dmv_office]
      phone = dmv[:phone]
      services = dmv[:services_p]
      address = dmv[:address_li] + " " +
                dmv[:address__1] + " " +
                dmv[:city] + " " +
                dmv[:state] + " " +
                dmv[:zip]
      @factories << Facility.new({name: name,
                                  address: address, 
                                  phone: phone,
                                  services: services})
    end
  end

end

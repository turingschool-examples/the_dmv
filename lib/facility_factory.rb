class FacilityFactory

  def initialize
  end

  def create_facilities(dmv_data_service)
    @facilities = []
    dds = DmvDataService.new

    dds.co_dmv_office_locations.each do |location|
      @name = [:dmv_office]
      @address = [:address_li]
      @phone = [:phone]
      @services = [:services_p]

      new_facility = Facility.new({name: @name, address: @address, phone: @phone, services: @services})

      @facilities << new_facility
    end
    @facilities
  end
  
end
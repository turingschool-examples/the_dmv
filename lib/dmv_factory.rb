class DMVFacility
  attr_reader :list_of_DMVs 
  def initialize
    @list_of_DMVs = []
  end

  def create_dmv_facilities(dmv_data)
    dmv_data.map do |facility|
      facility_details = {
        name: facility[:title], 
        address: facility[:location_1],
        phone: facility[:phone_number],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      }
      @list_of_DMVs << facility = Facility.new(facility_details)

    end
  end

end

class FacilityBuilder
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def build_facility(dmv_office_locations)
    # if dmv_office_locations == or_dmv_office_locations
    dmv_office_locations.each do |location|
      location_details = {
        name: location[:title],
        address: location[:location_1][:human_address],
        phone: location[:phone_number],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      }
      @facilities << facility = Facility.new(location_details)
    end
  @facilities
  end
end
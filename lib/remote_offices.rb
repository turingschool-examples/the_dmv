class RemoteOffices

  attr_reader :other_office_locations
  def initialize
    @other_offices = []
  end

  def other_office_locations(details)
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      or_dmv_office_locations.each do |office|
        details = {
          name: office[:title]
          address: office[:human_address]
          phone: office[:phone_number]
          services: []
          registered_vehicles: []
          collected_fees: 0
        }
        other_offices << (offices = Facility.new(details))
    end
    @other_offices
  end

end
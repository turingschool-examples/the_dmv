require './spec/spec_helper'

class FacilityFactory
  attr_reader :state_factilities
  def initialize
    @state_factilities = []
  end

  def store_facitlities(database)
    database.each { |facility_data| 
    @state_factilities << Facility.new(facility_data)
  }
  end
end

# co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
# colorado = FacilityFactory.new
# colorado.store_facitlities(co_dmv_office_locations)
# colorado.state_factilities.each { |facility| p facility.phone}
# p co_dmv_office_locations.count

new_york_facilities = DmvDataService.new.ny_dmv_office_locations
p new_york_facilities[1]
p new_york_facilities[2]
new_york = FacilityFactory.new
new_york.store_facitlities(new_york_facilities)

new_york.state_factilities.each {|x| p x.address}
# p new_york.state_factilities.each { |facility| p facility}

# missouri_facilities = DmvDataService.new.mo_dmv_office_locations
# missouri = FacilityFactory.new
# missouri.store_facitlities(missouri_facilities)
# missouri.state_factilities.each { |facility| p facility.address}
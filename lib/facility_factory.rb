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

co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

colorado = FacilityFactory.new

colorado.store_facitlities(co_dmv_office_locations)

p colorado.state_factilities[0]
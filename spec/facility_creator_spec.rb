require './lib/facility'
require './lib/facility_creator'
require './lib/dmv_data_service'
require 'json'

RSpec.describe FacilityCreator do
  
  it 'creates facility' do
    state_data = DmvDataService.new.or_dmv_office_locations
    oregon_facility = FacilityCreator.new
    expect(oregon_facility).to be_an_instance_of(FacilityCreator)
  end
end
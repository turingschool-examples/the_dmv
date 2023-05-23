require './lib/facility'
require './lib/facility_creator'
require './lib/dmv_data_service'
require 'json'

RSpec.describe FacilityCreator do
  
  it 'exists'do
    oregon_facilities = DmvDataService.new.or_dmv_office_locations
    expect(oregon_facilities).to be_an_instance_of(FacilityCreator)
  end
end
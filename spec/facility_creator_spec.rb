require './lib/facility'
require './lib/facility_creator'
require './lib/dmv_data_service'
require 'json'

RSpec.describe FacilityCreator do
  
  it 'creates oregon facility' do
    state_data = DmvDataService.new.or_dmv_office_locations
    oregon_facility = FacilityCreator.new
    oregon_facility.create_oregon_facilities(state_data)
    facility = oregon_facility.create_oregon_facilities(state_data)
    expect(oregon_facility).to be_an_instance_of(FacilityCreator)
    expect(facility.length).to eq(state_data.length)
  end

  it 'it creates ny facility' do
    state_data = DmvDataService.new.ny_dmv_office_locations
    ny_facility = FacilityCreator.new
    ny_facility.create_ny_facilities(state_data)
    facility = ny_facility.create_ny_facilities(state_data)
    expect(ny_facility).to be_an_instance_of(FacilityCreator)

  end

  
end
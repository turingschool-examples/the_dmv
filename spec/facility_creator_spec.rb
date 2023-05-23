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
    expect(facility.first).to eq(facility[0])
  end
  
  it 'creates ny facility' do
    state_data = DmvDataService.new.ny_dmv_office_locations
    ny_facility = FacilityCreator.new
    ny_facility.create_ny_facilities(state_data)
    facility = ny_facility.create_ny_facilities(state_data)
    expect(ny_facility).to be_an_instance_of(FacilityCreator)
    expect(facility.length).to eq(state_data.length)
    expect(facility.first).to eq(facility[0])
  end
  
  it 'creates missouri facility' do
    state_data = DmvDataService.new.mo_dmv_office_locations
    mo_facility = FacilityCreator.new
    mo_facility.create_mo_facility(state_data)
    facility = mo_facility.create_mo_facility(state_data)
    expect(mo_facility).to be_an_instance_of(FacilityCreator)
    expect(facility.length).to eq(state_data.length)
    expect(facility.first).to eq(facility[0])
  end
end
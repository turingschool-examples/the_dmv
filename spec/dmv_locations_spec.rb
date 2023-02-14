require 'rspec'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/dmv_locations'
require './lib/facility'

RSpec.describe do

  it 'exists' do
    dmv_facility = DmvLocations.new
    expect(dmv_facility).to be_an_instance_of(DmvLocations)
    expect(dmv_facility.dmv_locations).to eq([])
  end
  
  it 'creates dmv locations' do  
    dmv_facility = DmvLocations.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    
    expect(dmv_facility.create_dmv_locations(or_dmv_office_locations)).to be_an_instance_of(Array)
    
  end
  
  it 'creates locations from OR' do
    dmv_facility = DmvLocations.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    dmv_facility.create_dmv_locations(or_dmv_office_locations)
    
    expect(dmv_facility.dmv_locations.length).to be(59)
    expect(dmv_facility.dmv_locations[0]).to be_an_instance_of(Facility)
    expect(dmv_facility.dmv_locations[1]).to be_an_instance_of(Facility)
    expect(dmv_facility.dmv_locations[2]).to be_an_instance_of(Facility)
  end
  
  
end
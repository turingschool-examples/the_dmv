require 'rspec'
require './lib/facility_builder'

RSpec.describe FacilityBuilder do
  
  it 'exists' do
    facility = FacilityBuilder.new
    expect(facility).to be_an_instance_of(FacilityBuilder)
  end

  xit 'loads locations' do
    facility = FacilityBuilder.new()
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

    expect(facility.locations.length).to eq(5)
  end
end
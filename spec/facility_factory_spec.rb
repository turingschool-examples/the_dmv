require 'spec_helper'

RSpec.describe FacilityFactory do

  it 'exists' do
    factory = FacilityFactory.new

    expect(factory).to be_instance_of(FacilityFactory)
  end

  it 'can read dmv data service' do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    expect(DmvDataService.new.co_dmv_office_locations[0][:dmv_id]).to be("1") # Is this a good test?
    expect(DmvDataService.new.co_dmv_office_locations[1][:dmv_id]).to be("2")
  end

  it 'can create facilities' do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    

end
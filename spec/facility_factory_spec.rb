require 'spec_helper'
require './lib/facility_factory'
require './lib/dmv_data_service'


RSpec.describe FacilityFactory do
  it 'exists' do
    office = FacilityFactory.new 
  
    expect(office).to be_an_instance_of(FacilityFactory)
  end

  it 'creates new facilities in oregon' do
    office = FacilityFactory.new 
    oregon = DmvDataService.new.or_dmv_office_locations

    office.create_facilities(oregon)

    expect(@new_facilities).to be_an(Array)
    expect(@new_facilities.first).to be_a(Facility)
  end


end
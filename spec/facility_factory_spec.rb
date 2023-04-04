require 'spec_helper'

RSpec.describe do
  before(:each) do
    @factory = FacilityFactory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  it 'exists' do
    expect(@factory).to be_an_instance_of FacilityFactory
  end

  
end
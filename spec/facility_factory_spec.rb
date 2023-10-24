require 'spec_helper'

RSpec.describe FacilityFactory do

  it 'exists' do
    factory = FacilityFactory.new

    expect(FacilityFactory.new).to be_an_instance_of(FacilityFactory)
  end

  it 'also exists' do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    expect(co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations).to be_an_instance_of(Array)
  end

  it 'takes the facility and arrays it into a Facility' do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    
    expect(factory.create_facilities(co_dmv_office_locations)).to be_an_instance_of(Array)
  end

  it 'creates a NY facility' do
    factory = FacilityFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations

    expect(factory.create_facilities(ny_dmv_office_locations)).to be_an_instance_of(Array)
  end
  
  it 'creates a MO facility' do
    factory = FacilityFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations

    expect(factory.create_facilities(mo_dmv_office_locations)).to be_an_instance_of(Array)
  end

end
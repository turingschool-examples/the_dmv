require 'spec_helper'

RSpec.describe do
  before(:each) do
    @facility_factory = FacilityFactory.new
    facility_factory = FacilityFactory.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    new_facility = facility_factory.create_facilities({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  it 'exists' do
    expect(@facility_factory).to be_an_instance_of FacilityFactory
    expect(@new_facility[0].name).to eq(@facility.name)
  end

  xit 'creates facilities' do
    expect(@facility_factory.create_facilities(@or_dmv_office_locations)).to be_an_instance_of Array
    expect(@facility_factory.create_facilities(@or_dmv_office_locations)[0]).to be_an_instance_of Facility
  end  

  xit 'creates an Oregon facility' do

  end

  xit 'creates a New York facility' do

  end

  xit 'creates a Missouri facility' do

  end


end
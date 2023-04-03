require 'spec_helper'

RSpec.describe FacilityFactory do
    # factory = FacilityFactory.new
    # or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    # new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    # missouri_facilities = DmvDataService.new.mo_dmv_office_locations

  it 'exists' do
    factory = FacilityFactory.new
    expect(factory).to be_an_instance_of(FacilityFactory)
  end

  it 'creates facilities from oregon database' do
    factory = FacilityFactory.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    expect(factory.create_oregon_facility(or_dmv_office_locations)).to be_an_instance_of(Array)
    expect(factory.create_oregon_facility(or_dmv_office_locations)[0]).to be_an_instance_of(Facility)
  end

  it 'creates facilities from new york database' do
    factory = FacilityFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    expect(factory.create_new_york_facility(new_york_facilities)).to be_an_instance_of(Array)
    expect(factory.create_new_york_facility(new_york_facilities)[0]).to be_an_instance_of(Facility)
  end

  it 'creates facilities from missouri database' do
    factory = FacilityFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    expect(factory.create_missouri_facility(missouri_facilities)).to be_an_instance_of(Array)
    expect(factory.create_misouri_facility(missouri_facilities)[0]).to be_an_instance_of(Facility)
  end
end
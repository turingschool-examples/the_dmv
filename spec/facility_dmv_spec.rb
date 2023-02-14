require 'spec_helper'

RSpec.describe FacilityDmv do
  it 'exists and pulls OR data from API' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility_dmv).to be_an_instance_of(FacilityDmv)
    expect(oregon_facilities).to be_an_instance_of(Array)
    expect(oregon_facilities.size).to eq(59)
  end

  it 'creates new OR facility_dmv instances' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility_dmv.create_or_facility(oregon_facilities)).to be_an_instance_of(Array)
  end

  it 'can add a facility to the array' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility_dmv.or_facilities).to eq([])
    facility_dmv.create_or_facility(oregon_facilities)
    expect(facility_dmv.or_facilities.count).to eq(59)
  end

  xit 'can convert addressed from API info' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.

    facility_dmv.create_or_facility(oregon_facilities)
    expect(facility_dmv.address_converter)
  end

  it 'exits and pulls NY data from API' do
    facility_dmv = FacilityDmv.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(facility_dmv).to be_an_instance_of(FacilityDmv)
    expect(new_york_facilities).to be_an_instance_of(Array)
    expect(new_york_facilities.size).to eq(169)
  end

  it 'creates new NY facility_dmv instances' do
    facility_dmv = FacilityDmv.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(facility_dmv.create_ny_facility(new_york_facilities)).to be_an_instance_of(Array)
  end
end
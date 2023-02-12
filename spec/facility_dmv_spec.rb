require 'spec_helper'

RSpec.describe FacilityDmv do
  it 'exists from API' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility_dmv).to be_an_instance_of(FacilityDmv)
    expect(oregon_facilities).to be_an_instance_of(Array)
    expect(oregon_facilities.size).to eq(59)
  end

  it 'creates new facilityDmv instances' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility_dmv.facilities).to eq([])
    # require 'pry'; binding.pry
    expect(facility_dmv.create_facility(oregon_facilities)).to be_an_instance_of(Array)
  end
end
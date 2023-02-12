require 'spec_helper'

RSpec.describe FacilityDmv do
  it 'exists from API' do
    facility = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility).to be_an_instance_of(FacilityDmv)
    expect(oregon_facilities).to be_an_instance_of(Array)
    expect(oregon_facilities.size).to eq(59)

  end
end
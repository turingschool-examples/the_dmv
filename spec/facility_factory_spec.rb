require "./spec/spec_helper"



RSpec.describe FacilityFactory do
  before(:each) do
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  it "exists" do
    factory = FacilityFactory.new

    expect(factory).to be_an_instance_of(FacilityFactory)
  end

  it "can create facilities" do
    factory = FacilityFactory.new
    facilities = factory.create_facilities(@oregon_facilities)

    expect(facilities.first.).to eq()
    expect(facilities.first.).to eq()
    expect(facilities.first.).to eq()
    expect(facilities.first.).to eq()
    expect(facilities.first.).to eq()
    expect(facilities.first.).to eq()
    expect(facilities.first.).to eq()
    expect(facilities.first.).to eq()
  end
end
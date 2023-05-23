require "./spec/spec_helper"
require "./lib/facility_factory"


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

  it "can create OR facilities" do
    factory = FacilityFactory.new
    facilities = factory.create_facilities(@oregon_facilities)

    expect(facilities.first.name).to eq("Albany DMV Office")
    expect(facilities.first.address).to eq("2242 Santiam Hwy, Albany OR 97321")
    expect(facilities.first.phone).to eq("541-967-2014")
  end

  it "can create NY facilities" do
    factory = FacilityFactory.new
    facilities = factory.create_facilities(@new_york_facilities)

    expect(facilities.first.name).to eq("Jamaica Kiosk")
    expect(facilities.first.address).to eq("168-46 91st Ave, 2ND Flr, Jamaica NY 11432")
    expect(facilities.first.phone).to eq(nil)
  end

  it "can create MO facilities" do
    factory = FacilityFactory.new
    facilities = factory.create_facilities(@missouri_facilities)
    
    expect(facilities.first.name).to eq("Oakville")
    expect(facilities.first.address).to eq("3164 Telegraph Rd, St Louis MO 63125")
    expect(facilities.first.phone).to eq("314-887-1050")
  end
end
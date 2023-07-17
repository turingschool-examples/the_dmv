require './spec/spec_helper'

describe FacilityFactory do
  it "exist" do
    colorado = FacilityFactory.new
    expect(colorado).to be_a(FacilityFactory)
  end

  it "takes vehicles from CO API and create facility objects" do
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    colorado = FacilityFactory.new
    colorado.store_facitlities(co_dmv_office_locations)
    expect(colorado.state_factilities.count).to eq(co_dmv_office_locations.count)
  end

  it "takes vehicles from NY API and create facility objects" do
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    new_york = FacilityFactory.new
    new_york.store_facitlities(new_york_facilities)
    expect(new_york.state_factilities.count).to eq(new_york_facilities.count)
  end

  it "takes vehicles from MO API and create facility objects" do
    missouri_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    missouri = FacilityFactory.new
    missouri.store_facitlities(missouri_dmv_office_locations)
    expect(missouri.state_factilities.count).to eq(missouri_dmv_office_locations.count)
  end
end

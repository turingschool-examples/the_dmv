require './spec/spec_helper'
require './lib/facility_builder'

RSpec.describe "FacilityBuilder" do
  before(:each) do
    @state_facilities = FacilityBuilder.new
    @or_facilities = DmvDataService.new.or_dmv_office_locations
    @or_dmv_locations = @state_facilities.create_facilities(@or_facilities)
  end

  it "pulls data from remote source" do
    expect(@or_facilities).to be_a(Array)
    p @or_facilities.count
    p @or_facilities[0][:title]
    p @or_facilities[0].values
  end

  it "exists" do
    expect(@state_facilities).to be_a(FacilityBuilder)
    expect(@or_dmv_locations).to be_a(Array)
    expect(@or_dmv_locations.count).to eq(59)
  end

  it "has the expected keys" do
    for i in 0..@or_dmv_locations - 1
      expect(@or_dmv_locations[i].keys).to eq([:name, :address, :phone])
    end
  end
end
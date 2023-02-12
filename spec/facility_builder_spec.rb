require './spec/spec_helper'
# require './lib/office_builder'

RSpec.describe "FacilityBuilder" do
  before(:each) do
    # @state_facilities = FacilityBuilder.new
    @or_facilities = DmvDataService.new.or_dmv_office_locations
    # @state_facilities.create_facilities(@or_facilities)
  end

  it "pulls data from remote source" do
    expect(@or_facilities).to be_a(Array)
    p @or_facilities.count
    p @or_facilities[0].keys
    p @or_facilities[0].values
  end

  # it
end
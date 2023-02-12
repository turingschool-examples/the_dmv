require './spec/spec_helper'
# require './lib/office_builder'

RSpec.describe "OfficeBuilder" do
  before(:each) do
    # @state_offices = OfficeBuilder.new
    @or_offices = DmvDataService.new.or_dmv_office_locations
    # @state_offices.create_offices(@or_offices)
  end
  it "pulls data from remote source" do
    expect(@or_offices).to be_a(Array)
    p @or_offices.count
    p @or_offices[0].keys
    p @or_offices[0].values
  end
end
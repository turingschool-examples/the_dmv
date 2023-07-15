require 'spec_helper'

RSpec.describe FacilityFactory do
  it "exists" do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    factory.create_facilities(co_dmv_office_locations)
    expect(factory.facilities).to all be_a Facility
    expect(factory.facilities).to be_an Array
  end
end
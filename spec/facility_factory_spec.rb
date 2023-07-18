require 'spec_helper'

RSpec.describe FacilityFactory do
  describe "#initialize" do
    it "exists" do
      ff = FacilityFactory.new

      expect(ff).to be_a FacilityFactory
    end
  end

  describe "#create_facilities" do
    it "creates an array of facilities using API data from CO" do
      ff = FacilityFactory.new

      co_dmv_offices = DmvDataService.new.co_dmv_office_locations

      expect(ff.create_facilities(co_dmv_offices)).to not be_empty
      expect(ff.create_facilities(co_dmv_offices).first).to be_a Facility
    end
  end
end
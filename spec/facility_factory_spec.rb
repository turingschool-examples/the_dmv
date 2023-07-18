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
      # require 'pry';binding.pry

      expect(ff.create_facilities(co_dmv_offices)).to_not be_empty
      expect(ff.create_facilities(co_dmv_offices).first).to be_a Facility
    end
    
    it "works with new york data" do
      ff = FacilityFactory.new
  
      ny_dmv_offices = DmvDataService.new.ny_dmv_office_locations
      require 'pry';binding.pry
  
      expect(ff.create_facilities(ny_dmv_offices)).to_not be_empty
      expect(ff.create_facilities(ny_dmv_offices).first).to be_a Facility
    end
  end

  describe "#addr_builder" do
    it "returns an address from the facility data provided" do
      ff = FacilityFactory.new

      co_dmv_offices = DmvDataService.new.co_dmv_office_locations

      expect(ff.addr_builder(co_dmv_offices.first)).to be_a String
    end
  end
end
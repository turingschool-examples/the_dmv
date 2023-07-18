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
      # require 'pry';binding.pry
  
      expect(ff.create_facilities(ny_dmv_offices)).to_not be_empty
      expect(ff.create_facilities(ny_dmv_offices).first).to be_a Facility
    end
    
    it "works with missouri data" do
      ff = FacilityFactory.new
  
      mo_dmv_offices = DmvDataService.new.mo_dmv_office_locations
      # require 'pry';binding.pry
  
      expect(ff.create_facilities(mo_dmv_offices)).to_not be_empty
      expect(ff.create_facilities(mo_dmv_offices).first).to be_a Facility
    end
  end

  describe "#addr_builder" do
    it "returns an address from the facility data provided" do
      ff = FacilityFactory.new

      co_dmv_offices = DmvDataService.new.co_dmv_office_locations

      expect(ff.addr_builder(co_dmv_offices.first)).to be_a String
    end
  end

  describe "#detail_builder" do
    it "returns a hash of name, address and phone for a facility" do
      ff = FacilityFactory.new

      co_dmv_offices = DmvDataService.new.co_dmv_office_locations
      details = ff.detail_builder(co_dmv_offices.first)

      expect(details).to be_a Hash
      expect(details.key?(:name)).to be true
      expect(details.key?(:address)).to be true
      expect(details.key?(:phone)).to be true
    end
  end

  describe "#number_to_phone" do
    it "converts a string to a phone format" do
      ff = FacilityFactory.new

      expect(ff.number_to_phone("1112223333")).to eq("(111) 222-3333")
    end
  end
end
require 'spec_helper'

RSpec.describe FacilityFactory do
  describe "Iteration 3" do
    it "exists" do
      facility = FacilityFactory.new
      
      expect(facility).to be_a(FacilityFactory)
    end

    it "creates new facilities from oregon data set" do
      facility = FacilityFactory.new
      oregon = DmvDataService.new.or_dmv_office_locations
      
    
      facilities = facility.create_facility(oregon)
      
      
      expect(facilities[0].name).to eq("Albany DMV Office")
      expect(facilities[0].phone).to eq("541-967-2014")
      expect(facilities[2].phone).to eq("503-325-3951")
      expect(facilities[4].name).to eq("Beaverton DMV Office")
      expect(facilities[0].address).to eq(nil)
      expect(facilities[0].zipcode).to eq("97321")
    end

    it "creates new facilities from new york data set" do
      facility = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      ny_facilities = facility.create_facility(new_york_facilities)
      
      expect(ny_facilities[0].zipcode).to eq("11784")
      

    end
  end
end
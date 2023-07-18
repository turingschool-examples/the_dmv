require "spec_helper"
require "./lib/facility_factory"

RSpec.describe FacilityFactory do
  describe "#initialize" do
    it "exists" do
      factory = FacilityFactory.new

      expect(factory).to be_a(FacilityFactory)
    end
  end

  describe "create_facilities" do
    it "creates facilities with CO external data" do
      factory = FacilityFactory.new

      colorado_facilities = DmvDataService.new.co_dmv_office_locations
      
      expect(factory.create_facilities(colorado_facilities)).to be_a(Array)
      expect(factory.facilities.first.name).to eq("DMV Tremont Branch")
    end

    it "creates facilities with NY data" do
      factory = FacilityFactory.new

      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      require 'pry';binding.pry

      factory.create_facilities(new_york_facilities)
      expect(factory.facilities).to be_a(Array)
      expect(factory.facilities.first.phone).to eq("7189666155")
      expect(factory.facilities[1].address).to eq("200 OLD COUNTRY ROAD RIVERHEAD NY 11901")
    end
  end
end
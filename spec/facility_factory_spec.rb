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
  end
end
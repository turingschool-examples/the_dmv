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
      
      factory.create_facilities(colorado_facilities)
      expect(factory.facilities).to be_a(Array)
      expect(factory.facilities.first.phone).to eq("(720) 865-4600")
      expect(factory.facilities[1].address).to eq("4685 Peoria Street Suite 101 Denver CO 80239")
    end

    it "creates facilities with NY data" do
      factory = FacilityFactory.new

      new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      factory.create_facilities(new_york_facilities)
      expect(factory.facilities).to be_a(Array)
      expect(factory.facilities.first.phone).to eq("7189666155")
      expect(factory.facilities[1].address).to eq("200 OLD COUNTRY ROAD RIVERHEAD NY 11901")
    end

    it "creates facilities with MO data" do
      factory = FacilityFactory.new

      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      
      factory.create_facilities(missouri_facilities)

      expect(factory.facilities).to be_a(Array)
      expect(factory.facilities.first.phone).to eq("(573) 624-8808")
      expect(factory.facilities[2].address).to eq("141 N Meramec Ave, Ste 201 CLAYTON MO 63105")
    end
  end
end
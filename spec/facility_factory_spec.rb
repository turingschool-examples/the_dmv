require 'spec_helper'

RSpec.describe FacilityFactory do
  describe "#initialize" do
    it "can initialize" do
      factory = FacilityFactory.new

      expect(factory).to be_a(FacilityFactory)
    end
  end

  describe "#create_facilities_co" do
    it "can create facilities for Colorado DMV locations" do
      factory = FacilityFactory.new
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)

      expect(factory.create_facilities(co_dmv_office_locations)[0]).to be_a(Facility)
      expect(factory.create_facilities(co_dmv_office_locations)[0].name).to eq("DMV Tremont Branch")
      expect(factory.create_facilities(co_dmv_office_locations)[0].address).to eq("2855 Tremont Place Suite 118 Denver, CO 80205")
      expect(factory.create_facilities(co_dmv_office_locations)[0].phone).to eq("(720) 865-4600")
    end
  end

  describe "#create_facilities_ny" do
    it "can create facilities for New York DMV locations" do
      factory = FacilityFactory.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      factory.create_facilities(ny_dmv_office_locations)

      expect(factory.create_facilities(ny_dmv_office_locations)[0]).to be_a(Facility)
      expect(factory.create_facilities(ny_dmv_office_locations)[0].name).to eq("JAMAICA")
      expect(factory.create_facilities(ny_dmv_office_locations)[0].address).to eq("168-46 91ST AVE., 2ND FLR JAMAICA, NY 11432")
      expect(factory.create_facilities(ny_dmv_office_locations)[0].phone).to eq("7189666155")
    end
  end
end
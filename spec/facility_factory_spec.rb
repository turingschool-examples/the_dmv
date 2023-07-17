require 'spec_helper'

RSpec.describe FacilityFactory do
  describe "#initialize" do
    it "can initialize" do
      factory = FacilityFactory.new

      expect(factory).to be_a(FacilityFactory)
    end
  end

  describe "#create_facilities" do
    it "can create facilities" do
      factory = FacilityFactory.new
      facility_1 = Facility.new({})
      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      factory.create_facilities(co_dmv_office_locations)

      expect(factory.create_facilities(co_dmv_office_locations)[0]).to be_a(Facility)
      expect(factory.create_facilities(co_dmv_office_locations)[0].name).to eq("DMV Tremont Branch")
      expect(factory.create_facilities(co_dmv_office_locations)[0].address).to eq("2855 Tremont Place Suite 118 Denver, CO 80205")
      expect(factory.create_facilities(co_dmv_office_locations)[0].phone).to eq("(720) 865-4600")
      expect(factory.create_facilities(co_dmv_office_locations)[0].services).to eq("vehicle titles, registration, renewals;  VIN inspections")
    end
  end
end
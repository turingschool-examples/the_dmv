require 'spec_helper'

describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_facilities = DmvDataService.new.co_dmv_office_locations
    @ny_facilities = DmvDataService.new.ny_dmv_office_locations
    @mo_facilities = DmvDataService.new.mo_dmv_office_locations
  end
# require 'pry';binding.pry
  describe "#initialize" do
    it "can initialize" do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe "#create_facilities" do
    it "can add facilities from the CO database" do
      expect(@factory.create_facilities(@co_facilities)).to be_an Array
      expect(@factory.create_facilities(@co_facilities)).to all be_a Facility
    end

    it "can add facilities from the NY database" do
      expect(@factory.create_facilities(@ny_facilities)).to be_an Array
      expect(@factory.create_facilities(@ny_facilities)).to all be_a Facility
    end

    it "can add facilities from the MO database" do
      expect(@factory.create_facilities(@mo_facilities)).to be_an Array
      expect(@factory.create_facilities(@mo_facilities)).to all be_a Facility
    end
  end

  describe "#phone_number_formatter" do
    it "can format phone numbers to match CO format" do
      expect(@factory.phone_number_formatter("555-555-5555")).to eq("(555) 555-5555")
      expect(@factory.phone_number_formatter("5555555555")).to eq("(555) 555-5555")
      expect(@factory.phone_number_formatter("(555)555-5555")).to eq("(555) 555-5555")
    end
  end
end
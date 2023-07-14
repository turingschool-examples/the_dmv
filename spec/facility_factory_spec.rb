require 'spec_helper'

describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_facilities = DmvDataService.new.co_dmv_office_locations
    @ny_facilities = DmvDataService.new.ny_dmv_office_locations
    @mo_facilities = DmvDataService.new.mo_dmv_office_locations
  end

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
  end
end